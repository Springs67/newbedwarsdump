local u1 = nil
local v7 = {
    ["ATTACK_DAMAGE"] = 25,
    ["ATTACK_SPEED"] = 1,
    ["ATTACK_RANGE"] = 17.3,
    ["HORIZONTAL_KNOCKBACK"] = 0.3,
    ["VERTICAL_KNOCKBACK"] = 0,
    ["MAX_CHARGE_TIME"] = 1.5,
    ["MIN_CHARGE_TIME"] = 0.3,
    ["CHARGED_ATTACK_COOLDOWN"] = 0.7,
    ["CHARGED_WALK_SPEED_MULTIPLIER"] = 0.7,
    ["DAMAGE_AT_MAX_CHARGE"] = 100,
    ["MIN_DAMAGE"] = 25,
    ["MIN_DEVOUR_APPLIED"] = 1,
    ["BONUS_HORIZAONTAL_KNOCKBACK_AT_MAX_CHARGE"] = 1.2,
    ["BONUS_VERTICAL_KNOCKBACK_AT_MAX_CHARGE"] = 0.3,
    ["DAMAGE_SCALING_FUNCTION"] = function(p2, _) --[[ Line: 35 ]]
        local v3 = p2 * 100
        return math.max(v3, 25)
    end,
    ["KNOCKBACK_SCALING_FUNCTION"] = function(p4) --[[ Line: 39 ]]
        return {
            ["horizontal"] = 1.2 * p4,
            ["vertical"] = 0.3 * p4
        }
    end,
    ["DEVOUR_STATUS_STACKS_SCALING_FUNCTION"] = function(p5, p6) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1(5 * p5, p6, 1)
    end
}
u1 = function(p8, p9, p10) --[[ Name: splitByTargetCount, Line 51 ]]
    local v11 = p8 / math.max(p9, 1)
    local v12 = math.round(v11)
    return math.max(v12, p10)
end
return {
    ["HotdogBatBalance"] = v7
}