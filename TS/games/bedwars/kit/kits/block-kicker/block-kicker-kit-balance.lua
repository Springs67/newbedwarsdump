return {
    ["BlockKickerKitBalance"] = {
        ["STOMP_COOLDOWN"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService:IsStudio() and 3 or 30,
        ["STOMP_COOLDOWN_REDUCTION_PER_HIT"] = 4,
        ["STOMP_RADIUS"] = 20,
        ["STOMP_DAMAGE"] = 10,
        ["STOMP_HORIZONTAL_KNOCKBACK"] = 0,
        ["STOMP_VERTICAL_KNOCKBACK"] = 2,
        ["MAX_BLOCKS"] = 5,
        ["KICK_BLOCK_VELOCITY"] = 100,
        ["KICK_BLOCK_IMPACT_AOE_RADIUS"] = 12,
        ["KICK_BLOCK_DIRECT_HIT_STARTING_DAMAGE"] = 24,
        ["KICK_BLOCK_ARMOR_PENETRATION"] = 0.5,
        ["KICK_BLOCK_AOE_FALLOFF_START_DISTANCE_PERCENTAGE"] = 0.5,
        ["KICK_BLOCK_AOE_MIN_DAMAGE"] = 10,
        ["KICK_BLOCK_AOE_MAX_DAMAGE"] = 16,
        ["KICK_BLOCK_NORMAL_KNOCKBACK"] = 0.5,
        ["KICK_BLOCK_MAX_KNOCKBACK"] = 1.25,
        ["KICK_BLOCK_COOLDOWN"] = 0.5,
        ["KICK_BLOCK_GRAVITATIONAL_ACCELERATION"] = 20,
        ["KICK_BLOCK_AOE_CAN_HIT_THROUGH_WALLS"] = true,
        ["KICK_BLOCK_CHARGE_TIME"] = 3,
        ["DAMAGE_REDUCTION_MAX_STACKS"] = 20,
        ["DAMAGE_REDUCTION_PERCENT_BASE"] = 0.15,
        ["DAMAGE_REDUCTION_PER_STACK"] = 0.01,
        ["DAMAGE_REDUCTION_FLAT_THRESHOLD"] = 3,
        ["DAMAGE_REDUCTION_KNOCKBACK_REDUCTION"] = 0.5
    }
}