return {
    ["ForkTridentBalance"] = {
        ["MIN_CHARGE_TIME"] = 0.7,
        ["MAX_CHARGE_TIME"] = 0.7,
        ["CHARGED_ATTACK_COOLDOWN"] = 0.5,
        ["ATTACK_RANGE"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE * 3,
        ["CHARGING_WALK_SPEED_MULTIPLIER"] = 0.7,
        ["KNOCKBACK_HORIZONTAL_MULTIPLIER"] = 1.1,
        ["BASE_ATTACK_DAMAGE"] = 30,
        ["DEVOUR_STACKS_APPLY_NUM"] = 3,
        ["BLOCK_DESTROY_RADII"] = Vector3.new(1.1, 1.1, 1.1),
        ["MAX_BLOCK_DESTROY_HEALTH"] = 30,
        ["HEALTH_PER_BLOCK_DESTROYED"] = 5
    }
}