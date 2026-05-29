local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-event-meta").GlobalTeamEvents
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "GlobalTeamsController"
    end,
    ["__index"] = u3
})
u7.__index = u7
function u7.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p10)
    p10.Name = "GlobalTeamsController"
    p10.localEventDataMap = {}
    p10.collectedPointsDuringMatch = 0
    p10.timedGoalPointsCollectedDuringMatch = {}
end
function u7.KnitStart(u11) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u4
    --]]
    u3.KnitStart(u11)
    u6.Client:Get("GlobalTeamScoresUpdatedServerToClient"):Connect(function(p12) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
        --]]
        u11.localEventDataMap[p12.globalTeamEventKey] = p12.globalTeamEventData
        u4:dispatch({
            ["type"] = "SetEventGlobalTeamDataSingle",
            ["key"] = p12.globalTeamEventKey,
            ["data"] = p12.globalTeamEventData
        })
    end)
    u6.Client:Get("GlobalTeamAddPointsToPlayerProfile"):Connect(function(u13) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        task.delay(1.2, function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u13
            --]]
            local v14 = u11
            v14.collectedPointsDuringMatch = v14.collectedPointsDuringMatch + u13.points
        end)
    end)
    u6.Client:Get("GlobalTeamAddTimedGoalPointsToPlayerProfile"):Connect(function(u15) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        task.delay(1.2, function() --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u15
            --]]
            u11.timedGoalPointsCollectedDuringMatch[u15.timedGoalKey] = u15.newPoints
        end)
    end)
    u6.Client:Get("SendGlobalTeamKey"):Connect(function(p16) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        u4:dispatch({
            ["type"] = "SetEventGlobalTeamKeySingle",
            ["key"] = p16.globalTeamEventKey,
            ["data"] = p16.globalTeamKey
        })
    end)
end
function u7.getLocalGlobalEventData(p17, p18) --[[ Line: 67 ]]
    return p17.localEventDataMap[p18]
end
function u7.getLocalGlobalTeamScore(p19, p20, p21) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v22 = u5[p20]
    if not v22 then
        return nil
    end
    local v23 = p19:getLocalGlobalEventData(p20)
    if not v23 then
        return nil
    end
    if not v22.useCombinedTeamScoresForRewards then
        local v24 = v23.globalTeams[p21]
        if v24 ~= nil then
            v24 = v24.score
        end
        return v24
    end
    local v25 = 0
    local v26 = v25
    for _, v27 in v23.globalTeams do
        v25 = v26 + v27.score
        v26 = v25
    end
    return v26
end
function u7.getLocalGlobalTeamTimedGoalScore(p28, p29, p30, p31) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if u5[p29] then
        local v32 = p28:getLocalGlobalEventData(p29)
        if v32 then
            local v33 = v32.globalTeams[p30]
            if v33 and v33.timedGoalsData then
                return v33.timedGoalsData[p31]
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u7.getCollectedPointsDuringMatch(p34) --[[ Line: 120 ]]
    return p34.collectedPointsDuringMatch
end
v2.CreateController(u7.new())
return nil