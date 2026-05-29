local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.OfflinePlayerUtil
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "TeamController"
    end,
    ["__index"] = u9
})
u15.__index = u15
function u15.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p18)
    p18.Name = "TeamController"
    p18.teamNames = {}
    p18.teamDropdown = {
        ["map"] = {}
    }
end
function u15.KnitStart(u19) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u5
        [3] = u13
        [4] = u7
        [5] = u10
        [6] = u6
        [7] = u1
    --]]
    if u14.isLobbyServer() then
        return nil
    end
    u5.Controllers.ConnectController:waitForConnected()
    u13.Client:Get("TeamsUpdateEvent"):Connect(function(p20) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u6
        --]]
        u7.Info("Teams update event")
        u10:dispatch({
            ["type"] = "GameSetTeams",
            ["teams"] = u6.values(p20.teams)
        })
    end)
    u13.Client:Get("TeamAddMemberEvent"):Connect(function(p21, p22) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10:dispatch({
            ["type"] = "GameAddTeamMember",
            ["teamId"] = p21,
            ["player"] = p22
        })
    end)
    u13.Client:Get("TeamRemoveMemberEvent"):Connect(function(p23, p24) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10:dispatch({
            ["type"] = "GameRemoveTeamMember",
            ["teamId"] = p23,
            ["player"] = p24
        })
    end)
    u1.Promise.all({ u5.Controllers.TablistController.waitForScoreboardSnapshot(), u5.Controllers.MatchController:getQueueTypeAsync() }):andThen(function(p25) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        local v26 = p25[1]
        u19:setupTeamsData(p25[2], v26)
    end)
end
function u15.getTeams(_) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return u10:getState().Game.teams
end
function u15.getTeam(_, p27) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v28 = nil
    for v29, v30 in u10:getState().Game.teams do
        local _ = v29 - 1
        if v30.id == p27 == true then
            return v30
        end
    end
    return v28
end
function u15.getPlayerTeam(p31, p32) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v33 = u12.getGamePlayer(p32):getTeamId()
    if v33 ~= "" and v33 then
        return p31:getTeam(v33)
    end
end
function u15.getTeamById(_, p34) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v35 = nil
    for v36, v37 in u10:getState().Game.teams do
        local _ = v36 - 1
        if v37.id == p34 == true then
            return v37
        end
    end
    return v35
end
function u15.getTeamNames(p38, p39) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if #p38.teamNames ~= 0 then
        return p38.teamNames
    end
    local v40 = u10:getState().Game.teams
    local v41 = table.create(#v40)
    for v42, v43 in v40 do
        local _ = v42 - 1
        v41[v42] = v43.name
    end
    table.sort(v41)
    p38.teamNames = v41
    if p39 then
        local v44 = p38.teamNames
        table.insert(v44, 1, "Spectator")
    end
    return p38.teamNames
end
function u15.getTeamDropdown(p45, p46) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u6
    --]]
    if p45.teamDropdown.dropDownItems then
        return p45.teamDropdown
    end
    local v47 = u10:getState().Game.teams
    local v48 = {}
    for v49 = 1, #v47 do
        local v50 = v47[v49]
        local _ = v49 - 1
        v48[v50.name] = {
            ["text"] = "<font color=\"" .. (u3.richTextColor(v50.color) .. "\">") .. v50.name .. "</font>",
            ["value"] = v50.id
        }
    end
    p45.teamDropdown.map = v48
    local v51 = u6
    local v52 = {}
    local v53 = #v52
    for v54, v55 in p45.teamDropdown.map do
        v53 = v53 + 1
        v52[v53] = { v54, v55 }
    end
    local v56 = v51.values(v52)
    local v57 = table.create(#v56)
    for v58, v59 in v56 do
        local _ = v58 - 1
        v57[v58] = v59[2]
    end
    table.sort(v57, function(p60, p61) --[[ Line: 178 ]]
        return p60.value < p61.value
    end)
    p45.teamDropdown.dropDownItems = v57
    if p46 then
        p45.teamDropdown.map.Spectator = {
            ["text"] = "Spectator",
            ["value"] = "Spectator"
        }
        local v62 = p45.teamDropdown.dropDownItems
        table.insert(v62, 1, {
            ["text"] = "Spectator",
            ["value"] = "Spectator"
        })
    end
    return p45.teamDropdown
end
function u15.setupTeamsData(_, p63, p64) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u3
        [4] = u8
        [5] = u12
        [6] = u4
        [7] = u6
    --]]
    if #u10:getState().Game.teams ~= 0 then
        return nil
    end
    local v65 = u11(p63)
    if not v65 then
        return nil
    end
    local u66 = {}
    local v67 = v65.teams
    local function v70(p68) --[[ Line: 208 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u66
        --]]
        local v69 = {
            ["id"] = p68.id,
            ["name"] = p68.displayName,
            ["members"] = {},
            ["color"] = u3.hexColor(p68.colorHex)
        }
        u66[p68.id] = v69
    end
    for v71, v72 in v67 do
        v70(v72, v71 - 1, v67)
    end
    local v73 = u8:GetPlayers()
    local function v79(p74) --[[ Line: 223 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u66
            [3] = u4
        --]]
        local v75 = u12.getGamePlayer(p74)
        local v76 = v75:getTeamId()
        local v77
        if v76 == "" or not v76 then
            v77 = v76
        else
            v77 = v75:isInGame()
        end
        if v77 ~= "" and v77 then
            local v78 = u66[v76]
            if v78 ~= nil then
                v78.members[p74.UserId] = u4.getOfflinePlayer(p74)
            end
        end
    end
    for v80, v81 in v73 do
        v79(v81, v80 - 1, v73)
    end
    local v82 = u6.entries(p64.players)
    local function v91(p83) --[[ Line: 246 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u66
        --]]
        local v84 = p83[1]
        local v85 = p83[2]
        local v86 = v85.teamId
        if v86 ~= "" and v86 then
            local v87 = u8:GetPlayerByUserId(v84)
            local v88 = v85.offlinePlayerDisplay
            if v88 then
                v87 = v88
            elseif v87 then
                v87 = u4.getOfflinePlayer(v87)
            end
            if not v87 then
                return nil
            end
            local v89 = u66[v85.teamId]
            local v90
            if v89 == nil then
                v90 = v89
            else
                v90 = v89.members[v84]
            end
            if not v90 and v89 ~= nil then
                v89.members[v84] = v87
            end
        end
    end
    for v92, v93 in v82 do
        v91(v93, v92 - 1, v82)
    end
    u10:dispatch({
        ["type"] = "GameSetTeams",
        ["teams"] = u6.values(u66)
    })
end
return {
    ["TeamController"] = u5.CreateController(u15.new())
}