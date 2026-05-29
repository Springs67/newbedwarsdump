return {
    ["ScissorSwordBalance"] = {
        ["ATTACK_DAMAGE"] = 25,
        ["COMBO_ATTACK_DAMAGE"] = 5,
        ["COMBO_TIME_WINDOW_SEC"] = 5,
        ["MIN_ATTACK_SPEED"] = 0.15,
        ["BASE_ATTACK_SPEED_SEC"] = 0.698,
        ["DECAY_STATUS_DURATION"] = 20,
        ["SHARPENED_ARMOR_PENETRATION_PERCENT_PER_STACK"] = 0.02,
        ["SHARPENED_STATUS_DURATION"] = 10,
        ["SHARPENED_ARMOR_PENETRATION_UPPER_BOUND"] = 0.5,
        ["NEGATE_PROJECTILE_WINDOW_SEC"] = 0.3,
        ["COMBO_STRIKE_CHARGE_TIME"] = 1.5,
        ["COMBO_STRIKE_COOLDOWN_SEC"] = 12,
        ["COMBO_STRIKE_WALKSPEED_MULTIPLIER"] = 1.1,
        ["getAttackSpeed"] = function(p1) --[[ Name: getAttackSpeed, Line 36 ]]
            local v2 = (p1 - 5) / -4
            local v3 = math.exp(v2) / 5
            return math.max(0.15, v3) / 2
        end
    }
}