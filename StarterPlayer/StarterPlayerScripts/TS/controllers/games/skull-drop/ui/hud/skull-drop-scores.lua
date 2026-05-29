local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u13 = v1.import(script, script.Parent, "skull-drop-score-card").SkullDropScoreCard
local v67 = v7.new(u6)(function(u14, p15) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u11
        [4] = u9
        [5] = u12
        [6] = u13
        [7] = u4
        [8] = u3
        [9] = u5
    --]]
    local _ = p15.useState
    local v16 = p15.useEffect
    local v17 = nil
    for v18, v19 in u14.teamScores do
        local _ = v18 - 1
        local v20 = v19.teamId
        local v21 = u14.localTeam
        if v21 ~= nil then
            v21 = v21.id
        end
        if v20 == v21 == true then
            v17 = v19
            break
        end
    end
    if v17 ~= nil then
        v17 = v17.score
    end
    local v22 = -1
    for v23, v24 in u14.teamScores do
        local _ = v23 - 1
        local v25 = v24.teamId
        local v26 = u14.localTeam
        if v26 ~= nil then
            v26 = v26.id
        end
        if v25 == v26 == true then
            v22 = v23 - 1
            break
        end
    end
    local v27 = v22 + 1
    local u28 = u6.createRef()
    v16(function() --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u28
        --]]
        u10.MatchStateChange:connect(function(p29) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u28
            --]]
            if p29.matchState ~= u11.POST then
                return nil
            end
            local v30 = u28:getValue()
            if v30 then
                v30.Position = UDim2.fromScale(0.5, 0.05)
            end
        end)
    end, {})
    local v31 = u14.teamScores
    local function v51(p32, p33) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u9
            [3] = u12
            [4] = u6
            [5] = u13
        --]]
        local v34 = p32.teamId
        local v35 = p32.score
        if p33 + 1 > 3 then
            return nil
        end
        local v36 = nil
        for v37, v38 in u14.teams do
            local _ = v37 - 1
            if v38.id == tostring(v34) == true then
                v36 = v38
                break
            end
        end
        if not v36 then
            return nil
        end
        local v39 = u14.localTeam
        if v39 ~= nil then
            v39 = v39.id
        end
        local v40 = v39 == tostring(v34)
        local v41 = v36.name
        local v42 = 0
        local v43 = nil
        for _ in v36.members do
            v42 = v42 + 1
        end
        if v42 == 1 then
            local v44 = {}
            local v45 = #v44
            for v46, v47 in v36.members do
                v45 = v45 + 1
                v44[v45] = { v46, v47 }
            end
            local v48 = v44[1]
            local v49 = v48[1]
            local v50 = v48[2]
            v43 = u9:GetPlayerByUserId(v49)
            if v43 then
                v41 = u12.getGamePlayer(v43):getDisplayName()
            else
                v41 = v50.displayName
            end
        end
        return u6.createElement(u13, {
            ["Name"] = v41,
            ["TeamColor"] = v36.color,
            ["Score"] = v35,
            ["Placement"] = p33 + 1,
            ["MainPlayer"] = v43,
            ["IsLocalTeam"] = v40
        })
    end
    local v52 = 0
    local v53 = {}
    for v54, v55 in v31 do
        local v56 = v51(v55, v54 - 1, v31)
        if v56 ~= nil then
            v52 = v52 + 1
            v53[v52] = v56
        end
    end
    local v57 = {
        ["Size"] = u14.Size or UDim2.fromScale(1, 0.79),
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 1,
        [u6.Ref] = u28
    }
    local v58 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 10)
        }) }
    local v59 = #v58
    for v60, v61 in v53 do
        v58[v59 + v60] = v61
    end
    local v62 = #v58
    local v63 = v27 > 3
    if v63 then
        local v64 = {
            ["Name"] = u4.isHoarceKat() and "Me" or u12.getGamePlayer(u9.LocalPlayer):getDisplayName()
        }
        local v65 = u14.localTeam
        if v65 ~= nil then
            v65 = v65.color
        end
        if v65 == nil then
            v65 = u3.WHITE
        end
        v64.TeamColor = v65
        v64.Score = v17 == nil and 0 or v17
        v64.Placement = v27
        local v66
        if u4.isHoarceKat() then
            v66 = nil
        else
            v66 = u9.LocalPlayer
        end
        v64.MainPlayer = v66
        v64.IsLocalTeam = true
        v63 = u6.createElement(u13, v64)
    end
    if v63 then
        v58[v62 + 1] = v63
    end
    return u6.createFragment({
        ["SkullDropScores"] = u6.createElement(u5, v57, v58)
    })
end)
return {
    ["SkullDropScores"] = v8.connect(function(p68, p69) --[[ Line: 197 ]]
        local v70 = {}
        for v71, v72 in p69 do
            v70[v71] = v72
        end
        local v73 = p68.Game.teamScores
        table.sort(v73, function(p74, p75) --[[ Line: 204 ]]
            return p74.teamId < p75.teamId
        end)
        table.sort(v73, function(p76, p77) --[[ Line: 208 ]]
            if not p76 then
                return false
            end
            if not p77 then
                return true
            end
            local v78 = p76.score
            local v79 = v78 == nil and 0 or v78
            local v80 = p77.score
            return (v80 == nil and 0 or v80) < v79
        end)
        v70.teamScores = v73
        v70.teams = p68.Game.teams
        v70.localTeam = p68.Game.myTeam
        return v70
    end)(v67)
}