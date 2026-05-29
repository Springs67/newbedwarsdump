local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.RANKED = "ranked"
v1.ranked = "RANKED"
v2.ALL_RANDOM_KIT = "all_random_kit"
v1.all_random_kit = "ALL_RANDOM_KIT"
local u3 = {
    [v2.RANKED] = {
        ["badBehaviorRangeSec"] = 86400,
        ["queueRestrictionDurations"] = {
            0,
            120,
            600,
            1800,
            21600,
            43200
        }
    },
    [v2.ALL_RANDOM_KIT] = {
        ["badBehaviorRangeSec"] = 86400,
        ["queueRestrictionDurations"] = {
            0,
            0,
            120,
            300,
            600,
            1800
        }
    }
}
return {
    ["QueueDodgePenaltyType"] = v2,
    ["QueueDodgeConfigs"] = u3,
    ["getQueueDodgeConfig"] = function(p4) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3[p4]
    end
}