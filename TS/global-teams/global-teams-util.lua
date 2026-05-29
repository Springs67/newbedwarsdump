local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-event-meta").GlobalTeamEvents
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types").GlobalTeamEventKey
local v22 = {
    ["getGlobalTeamMissionsForTeam"] = function(p8, p9) --[[ Name: getGlobalTeamMissionsForTeam, Line 12 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        local v10 = u6[p8]
        local v11 = v10.sharedTeamRewards or {}
        local v12 = nil
        for v13, v14 in v10.globalTeams do
            local _ = v13 - 1
            if v14.key == p9 == true then
                v12 = v14
                break
            end
        end
        if v12 ~= nil then
            v12 = v12.rewards
        end
        local v15 = v12 == nil and {} or v12
        local v16 = {}
        local v17 = #v16
        local v18 = #v11
        table.move(v11, 1, v18, v17 + 1, v16)
        local v19 = v17 + v18
        table.move(v15, 1, #v15, v19 + 1, v16)
        table.sort(v16, function(p20, p21) --[[ Line: 48 ]]
            return p20.globalTeamScoreRequired < p21.globalTeamScoreRequired
        end)
        return v16
    end
}
local function u27(p23) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u6
    --]]
    local v24 = nil
    for v25, v26 in u2.values(u7) do
        local _ = v25 - 1
        if u6[v26].bedwarsEventType == p23 == true then
            v24 = v26
            break
        end
    end
    return v24 or nil
end
v22.getGlobalTeamEventKeyFromEventType = u27
function v22.getGlobalTeamEventMetaFromEventType(p28) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u6
    --]]
    local v29 = u27(p28)
    if v29 then
        return u6[v29]
    else
        return nil
    end
end
function v22.getGlobalTeamEventMeta(p30) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6[p30]
end
local function u36() --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u27
    --]]
    local v31 = 0
    local v32 = {}
    for v33, v34 in u4.getActiveEvents() do
        local _ = v33 - 1
        local v35
        if u27(v34) then
            v35 = u4.isEventRunning(v34) ~= false
        else
            v35 = false
        end
        if v35 == true then
            v31 = v31 + 1
            v32[v31] = v34
        end
    end
    return v32
end
v22.getActiveEventsWithGlobalTeamEvent = u36
local function u45() --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u27
        [3] = u6
    --]]
    local v37 = 0
    local v38 = {}
    for v39, v40 in u36() do
        local _ = v39 - 1
        local v41 = u27(v40)
        local v42
        if v41 then
            v42 = u6[v41]
        else
            v42 = nil
        end
        local v43
        if v42 and v42.timedGoals ~= nil then
            local v44 = 0
            for _ in v42.timedGoals do
                v44 = v44 + 1
            end
            if v44 < 1 then
                v43 = false
            else
                v43 = true
            end
        else
            v43 = false
        end
        if v43 == true then
            v37 = v37 + 1
            v38[v37] = v40
        end
    end
    return v38
end
v22.getActiveEventsWithAnyTimedGoals = u45
local u46 = nil
function v22.getActiveEventsWithActiveTimedGoals() --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u45
        [2] = u27
        [3] = u6
        [4] = u2
        [5] = u46
    --]]
    local v47 = u45()
    local function v54(p48) --[[ Line: 151 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u6
            [3] = u2
            [4] = u46
        --]]
        local v49 = u27(p48)
        local v50
        if v49 then
            v50 = u6[v49]
        else
            v50 = nil
        end
        if not v50 then
            return false
        end
        if not v50.timedGoals then
            return false
        end
        local v51 = 0
        for _ in v50.timedGoals do
            v51 = v51 + 1
        end
        if v51 < 1 then
            return false
        end
        for _, v52 in u2.values(v50.timedGoals) do
            for _, v53 in v52 do
                if u46(v53) then
                    return true
                end
            end
        end
        return false
    end
    local v55 = 0
    local v56 = {}
    for v57, v58 in v47 do
        if v54(v58, v57 - 1, v47) == true then
            v55 = v55 + 1
            v56[v55] = v58
        end
    end
    return v56
end
u46 = function(p59) --[[ Name: isTimedGoalActive, Line 192 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    if u5.isStaging() or u3:IsStudio() then
        return true
    end
    local v60
    if os.time() >= p59.startTime then
        v60 = os.time() <= p59.endTime
    else
        v60 = false
    end
    return v60
end
v22.isTimedGoalActive = u46
function v22.getTimedGoalsForTeam(p61, p62) --[[ Line: 199 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u6
    --]]
    local v63 = u27(p61)
    local v64
    if v63 then
        v64 = u6[v63]
    else
        v64 = nil
    end
    if not v64 then
        return nil
    end
    local v65 = v64.timedGoals
    if v65 ~= nil then
        v65 = v65[p62]
    end
    return v65 or nil
end
return {
    ["GlobalTeamsUtil"] = v22
}