local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-mission-metrics").DESCRIPTIONS_BY_METRIC
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "ClanWarMission"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(p5, p6) --[[ Line: 16 ]]
    p5.definition = p6
end
function u2.isValidForQueue(p7, p8) --[[ Line: 19 ]]
    if p7.definition.allowOnlyInQueues then
        local v9 = p7.definition.allowOnlyInQueues
        return table.find(v9, p8) ~= nil
    end
    local v10 = p7.definition.disallowInQueues
    if v10 ~= nil then
        v10 = table.find(v10, p8) ~= nil
    end
    return not v10
end
function u2.getDescription(p11) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v12 = p11.definition.overrideDescription
    if v12 == nil then
        v12 = u1[p11.definition.metricType](p11.definition.completionValue)
    end
    return v12
end
return {
    ["ClanWarMission"] = u2
}