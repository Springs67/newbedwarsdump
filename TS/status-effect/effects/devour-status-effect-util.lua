local v5 = {
    ["CONFIG"] = {
        ["devour"] = {
            ["duration"] = 1,
            ["maxSpeedMultiplier"] = 1.5,
            ["tickRate"] = 0.5,
            ["animationDuration"] = 0.8
        },
        ["tasty"] = {
            ["tickRate"] = 1
        }
    },
    ["STACK_PER_STACKS"] = 2,
    ["MAX_STACKS"] = 4,
    ["DEVOUR_STATUS_STACKS_SCALING_FUNCTION"] = function(p1) --[[ Line: 21 ]]
        local v2 = p1 / 2
        local v3 = math.min(v2, 4)
        return math.round(v3)
    end,
    ["SHOULD_DEVOUR"] = function(p4) --[[ Line: 25 ]]
        return p4 >= 8
    end
}
return {
    ["DevourStatusEffectUtil"] = v5
}