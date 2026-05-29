return {
    ["VoidHunterKitBalance"] = {
        ["MARK_COOLDOWN"] = 20,
        ["MARK_PROJECTILE_SPEED"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE * 13,
        ["MARK_PROJECTILE_DURATION"] = 3,
        ["MARK_PROJECTILE_ANGLE_LIMIT_DEGREES_PER_SECOND"] = 100,
        ["MARK_PROJECTILE_VISUAL_SPIN_DEGREES_PER_SECOND"] = 200,
        ["MARK_PROJECTILE_MISS_COOLDOWN_REFUND_SECONDS"] = 10,
        ["MARK_PROJECTILE_HIT_RANGE"] = 5,
        ["MARK_PROJECTILE_AUTO_AIM_ON_LAUNCH"] = false,
        ["MARK_DURATION"] = 20,
        ["MARK_GIVES_DAMAGE_INCREASE"] = true,
        ["MARK_DAMAGE_MULTIPLIER"] = 1.18,
        ["SPEED_BOOST_MULTIPLIER"] = 1.45,
        ["FOLLOW_DISTANCE_CHECK_POLL_RATE"] = 0.25,
        ["PATH_UPDATE_POLL_RATE"] = 0.25,
        ["MAX_DISTANCE_FROM_FOLLOW_PATH"] = 12,
        ["DETONATE_COOLDOWN"] = 1,
        ["DETONATE_DAMAGE"] = 20,
        ["DETONATE_ARMOR_PENETRATION"] = 0.5
    }
}