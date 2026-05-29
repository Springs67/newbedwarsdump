local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-missions").CLAN_WAR_MISSIONS
local v2 = {}
local u3 = nil
function v2.toNewMissionDto(p4, p5) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return {
        ["progressValue"] = 0,
        ["metricType"] = p4.metricType,
        ["clanMembersRequired"] = p4.clanMembersRequired,
        ["completionValue"] = p4.completionValue,
        ["completionScoreWorth"] = u3(p4),
        ["clanWarId"] = p5
    }
end
function v2.fromMissionDto(p6) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v7 = nil
    for v8, v9 in u1 do
        local _ = v8 - 1
        local v10
        if v9.metricType == p6.metricType and v9.clanMembersRequired == p6.clanMembersRequired then
            v10 = v9.completionValue == p6.completionValue
        else
            v10 = false
        end
        if v10 == true then
            return v9
        end
    end
    return v7
end
u3 = function(p11) --[[ Name: getCompletionScoreWorth, Line 52 ]]
    return p11.clanMembersRequired <= 2 and 5 or 10
end
return {
    ["ClanWarMissionDefinitionConverter"] = v2
}