local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.UserInputService
local u8 = v5.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "player-control-module")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-util").AbilityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v16 = {}
local u17 = setmetatable({}, {
    ["__index"] = v16
})
u17.ALL = 0
v16[0] = "ALL"
u17.TEAM = 1
v16[1] = "TEAM"
u17.PLAYER = 2
v16[2] = "PLAYER"
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "SpectateController"
    end,
    ["__index"] = u9
})
u18.__index = u18
function u18.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u17
    --]]
    u9.constructor(p21)
    p21.Name = "SpectateController"
    p21.spectatingPlayerMaid = u4.new()
    p21.spectating = false
    p21.mode = u17.TEAM
    p21.lockedTeamId = nil
    p21.lockedPlayerId = nil
end
function u18.KnitStart(u22) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u12
        [4] = u11
        [5] = u13
        [6] = u6
        [7] = u3
        [8] = u8
    --]]
    u15.Client:WaitFor("SpectatePlayer"):andThen(function(p23) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u10
            [3] = u12
            [4] = u11
            [5] = u13
        --]]
        p23:Connect(function(p24) --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u10
                [3] = u12
                [4] = u11
                [5] = u13
            --]]
            u22.lockedTeamId = p24.lockToTeamId
            u10:Disable()
            u12.disableAllAbilities()
            if p24.target then
                u11:dispatch({
                    ["type"] = "GameSetSpectator",
                    ["spectating"] = true,
                    ["spectatingPlayer"] = u13.getOfflinePlayer(p24.target)
                })
            else
                u22:switchSpectateTargets("next")
            end
        end)
    end)
    u15.Client:WaitFor("StopSpectating"):andThen(function(p25) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        p25:Connect(function(_) --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22:stopSpectatingPlayer()
        end)
    end)
    u6.LocalPlayer:GetAttributeChangedSignal("Spectator"):Connect(function() --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u22
        --]]
        if u6.LocalPlayer:GetAttribute("Spectator") ~= true then
            u22:stopSpectatingPlayer()
        end
    end)
    u11.changed:connect(function(p26, p27) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u22
        --]]
        if p26.Game.spectatingPlayer ~= p27.Game.spectatingPlayer then
            if p26.Game.spectatingPlayer then
                local v28 = u13.getPlayer(p26.Game.spectatingPlayer)
                if v28 then
                    u22:hookSpectatedPlayer(v28)
                end
            else
                u22:stopSpectatingPlayer()
            end
        end
        if p26.Game.spectating ~= p27.Game.spectating and not p26.Game.spectating then
            u22:stopSpectatingPlayer()
        end
    end)
    u15.Client:OnEvent("EntityDeathEvent", function(p29) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u6
            [3] = u13
            [4] = u3
            [5] = u22
        --]]
        local v30 = u11:getState()
        if v30.Game.spectating and (v30.Game.spectatingPlayer and v30.Game.spectatingPlayer.userId ~= u6.LocalPlayer.UserId) then
            local v31 = u13.getPlayer(v30.Game.spectatingPlayer)
            local v32
            if v31 == nil then
                v32 = v31
            else
                v32 = v31.Character
            end
            if v32 == p29.entityInstance then
                local v33 = u3.Controllers.BedwarsController
                local v34 = v31.Team
                if v34 ~= nil then
                    v34 = v34.Name
                end
                if not v33:getTeamBed(v34 == nil and "" or v34) then
                    u22:switchSpectateTargets("next")
                end
            end
        end
    end)
    u6.LocalPlayer.CharacterAdded:Connect(function(p35) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u8
        --]]
        if not u22:isSpectating() then
            u8.CurrentCamera.CameraSubject = p35:WaitForChild("Humanoid")
        end
    end)
end
function u18.isSpectating(p36) --[[ Line: 136 ]]
    return p36.spectating
end
function u18.setSpectateMode(p37, p38) --[[ Line: 139 ]]
    p37.mode = p38
end
function u18.isObserver(_, p39) --[[ Line: 142 ]]
    return p39:GetAttribute("IsObserver") == true
end
function u18.getSpectateTargets(u40) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
        [3] = u17
        [4] = u2
        [5] = u11
    --]]
    local v41 = 0
    local v42 = {}
    for v43, v44 in u6:GetPlayers() do
        local _ = v43 - 1
        if v44 ~= u6.LocalPlayer == true then
            v41 = v41 + 1
            v42[v41] = v44
        end
    end
    local v45 = 0
    local v46 = {}
    for v47, v48 in v42 do
        local _ = v47 - 1
        if u14.getGamePlayer(v48):isInGame() == true then
            v45 = v45 + 1
            v46[v45] = v48
        end
    end
    local function v51(p49, p50) --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        if p49.Team ~= p50.Team then
            if p49.Team == u6.LocalPlayer.Team then
                return true
            end
            if p50.Team == u6.LocalPlayer.Team then
                return false
            end
        end
        return p49.DisplayName < p50.DisplayName
    end
    table.sort(v46, v51)
    local v52
    if u40.mode == u17.TEAM then
        local v53 = u2.resolveDependency("client/controllers/global/report/report-controller@ReportController"):getCurrentTicket()
        local v54 = v53 and u6:GetPlayerByUserId(v53.reported)
        if v54 then
            u40.lockedTeamId = u14.getGamePlayer(v54):getTeamId()
        end
        local function v59(p55) --[[ Line: 196 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u40
                [3] = u14
            --]]
            local v56 = p55.Team
            if v56 ~= nil then
                v56 = v56.Name
            end
            local v57 = u11:getState().Game.myTeam
            if v57 ~= nil then
                v57 = v57.name
            end
            local v58 = v56 == v57
            if not v58 then
                if u40.lockedTeamId == nil then
                    v58 = false
                else
                    v58 = u14.getGamePlayer(p55):getTeamId() == u40.lockedTeamId
                end
            end
            return v58
        end
        v52 = v46
        local v60 = 0
        local v61 = {}
        for v62, v63 in v46 do
            if v59(v63, v62 - 1, v46) == true then
                v60 = v60 + 1
                v61[v60] = v63
            end
        end
        if #v61 ~= 0 then
            return v61
        end
    elseif u40.mode == u17.PLAYER then
        local v64 = 0
        v52 = {}
        for v65, v66 in v46 do
            local _ = v65 - 1
            local v67 = v66.UserId
            local v68 = u11:getState().Game.spectatingPlayer
            if v68 ~= nil then
                v68 = v68.userId
            end
            if (v67 == v68 or v66.UserId == u40.lockedPlayerId) == true then
                v64 = v64 + 1
                v52[v64] = v66
            end
        end
    else
        v52 = v46
    end
    return v52
end
function u18.switchSpectateTargets(p69, p70) --[[ Line: 253 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
    --]]
    local v71 = p69:getSpectateTargets()
    local v72 = u11:getState().Game.spectatingPlayer
    local v73
    if v72 then
        v73 = u13.getPlayer(v72)
    else
        v73 = nil
    end
    local v74 = 0
    if v73 then
        local v75 = (table.find(v71, v73) or 0) - 1
        if v75 > -1 then
            if p70 == "next" then
                v74 = v75 + 1
            else
                v74 = v75 - 1
            end
        end
    end
    local v76
    if v74 < 0 then
        v76 = #v71 - 1
    else
        v76 = #v71 <= v74 and 0 or v74
    end
    if v71 ~= nil then
        v71 = v71[v76 + 1]
    end
    local v77
    if v71 then
        v77 = u13.getOfflinePlayer(v71)
    else
        v77 = nil
    end
    u11:dispatch({
        ["type"] = "GameSetSpectator",
        ["spectating"] = true,
        ["spectatingPlayer"] = v77
    })
end
function u18.hookSpectatedPlayer(u78, u79) --[[ Line: 285 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u11
        [4] = u8
        [5] = u7
    --]]
    u78.spectatingPlayerMaid:DoCleaning()
    u78.spectating = true
    u78.spectatingPlayerMaid:GiveTask(function() --[[ Line: 288 ]]
        --[[
        Upvalues:
            [1] = u78
        --]]
        u78.spectating = false
    end)
    u78.spectatingPlayerMaid:GiveTask(u6.PlayerRemoving:Connect(function(p80) --[[ Line: 291 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u78
            [3] = u13
            [4] = u11
        --]]
        if u79 == p80 then
            u78.spectatingPlayerMaid:DoCleaning()
            local v81 = u78:getSpectateTargets()
            if v81 ~= nil then
                v81 = v81[1]
            end
            local v82
            if v81 then
                v82 = u13.getOfflinePlayer(v81)
            else
                v82 = nil
            end
            u11:dispatch({
                ["type"] = "GameSetSpectator",
                ["spectating"] = true,
                ["spectatingPlayer"] = v82
            })
        end
    end))
    task.spawn(function() --[[ Line: 307 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u8
        --]]
        if u79.Character then
            u8.CurrentCamera.CameraType = Enum.CameraType.Custom
            local v83 = u79.Character
            if v83 ~= nil then
                v83 = v83:WaitForChild("Humanoid", 5)
            end
            u8.CurrentCamera.CameraSubject = v83
        end
    end)
    u78.spectatingPlayerMaid:GiveTask(u79.CharacterAdded:Connect(function(p84) --[[ Line: 317 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.CurrentCamera.CameraType = Enum.CameraType.Custom
        u8.CurrentCamera.CameraSubject = p84:WaitForChild("Humanoid")
    end))
    u78.spectatingPlayerMaid:GiveTask(u7.InputBegan:Connect(function(p85, p86) --[[ Line: 321 ]]
        --[[
        Upvalues:
            [1] = u78
        --]]
        if p86 then
            return nil
        end
        if p85.UserInputState == Enum.UserInputState.Begin then
            if p85.UserInputType == Enum.UserInputType.MouseButton1 or p85.KeyCode == Enum.KeyCode.ButtonR2 then
                u78:switchSpectateTargets("next")
                return
            end
            if p85.KeyCode == Enum.KeyCode.ButtonL2 then
                u78:switchSpectateTargets("prev")
            end
        end
    end))
    for v87, v88 in u8:GetDescendants() do
        local _ = v87 - 1
        if v88:IsA("ProximityPrompt") and v88.Enabled then
            v88.Enabled = false
        end
    end
    u78.spectatingPlayerMaid:GiveTask(function() --[[ Line: 342 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        for v89, v90 in u8:GetDescendants() do
            local _ = v89 - 1
            if v90:IsA("ProximityPrompt") and not v90.Enabled then
                v90.Enabled = true
            end
        end
    end)
end
function u18.stopSpectatingPlayer(p91) --[[ Line: 354 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u6
        [4] = u8
    --]]
    u10:Enable()
    p91.spectatingPlayerMaid:DoCleaning()
    u11:dispatch({
        ["type"] = "GameSetSpectator",
        ["spectating"] = false,
        ["spectatingPlayer"] = nil
    })
    local v92 = u6.LocalPlayer.Character
    if v92 ~= nil then
        v92 = v92:FindFirstChild("Humanoid")
    end
    if v92 then
        u8.CurrentCamera.CameraSubject = v92
    end
end
return {
    ["SpectateMode"] = u17,
    ["SpectateController"] = u3.CreateController(u18.new())
}