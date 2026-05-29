local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-mission-metrics").DESCRIPTIONS_BY_METRIC
return {
    ["getClanWarMissionDescription"] = function(p2) --[[ Name: getClanWarMissionDescription, Line 14 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v3 = p2.overrideDescription
        if v3 == nil then
            v3 = u1[p2.metricType](p2.completionValue)
        end
        return v3
    end
}