local u8 = {
    ["MAX_MOMENTUM"] = 100,
    ["BASE_SPEED"] = 18,
    ["MAX_SPEED"] = 27,
    ["MOMENTUM_TICK_RATE_SECONDS"] = 0.1,
    ["MEDIUM_SKATE_THRESHOLD"] = 25,
    ["FAST_SKATE_THRESHOLD"] = 65,
    ["INITIAL_MOMENTUM_DROP"] = -1,
    ["MOMENTUM_DROP_MULTIPLIER_ON_TICK"] = 1.05,
    ["ON_ICE_MOMENTUM_MULTIPLIER"] = 2.5,
    ["JUMPING_MOMENTUM_COST"] = 5,
    ["MAX_DAMAGE_MOMENTUM_COST"] = 18,
    ["PROJECTILE_DAMAGE_MOMENTUM_MULTIPLIER"] = 2,
    ["DAMAGE_SCALING_FACTOR"] = 0.4,
    ["MOVEMENT_SPEED_MIN"] = 10,
    ["HIGH_SPEED_THRESHOLD"] = 95,
    ["DODGE_THRESHOLD"] = 70,
    ["DODGE_BUFFER_TIME"] = 0.5,
    ["DODGE_COOLDOWN_SECONDS"] = 7,
    ["FROZEN_BLOCK_DURATION_SECONDS"] = 5,
    ["FREEZE_COOLDOWN_SECONDS"] = 12,
    ["FROZEN_BLOCK_INTERVAL_SECONDS"] = 6,
    ["MOMENTUM_REPORT_DELTA"] = 10,
    ["getFovMultiplier"] = function(p1) --[[ Name: getFovMultiplier, Line 64 ]]
        return p1 < 25 and 1 or (p1 < 65 and 1.05 or 1.1)
    end,
    ["getMomentumDeltaForElapsedTime"] = function(p2) --[[ Name: getMomentumDeltaForElapsedTime, Line 77 ]]
        if p2 >= 10 then
            return 6
        end
        local v3 = -(13 * p2 / 10 - 3)
        local v4 = math.exp(v3)
        local v5 = v4 + 1
        local v6 = v4 + 2
        return 12 / v5 * (1 - 1 / v6)
    end,
    ["getMomentumSpeed"] = function(p7) --[[ Name: getMomentumSpeed, Line 95 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        return 18 * (1 + p7 / u8.MAX_MOMENTUM * 0.5)
    end
}
return {
    ["GlacialSkaterBalance"] = u8
}