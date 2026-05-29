return {
    ["VulcanUtil"] = {
        ["TURRET_REMOTE_CONTROL_BULLET_DAMAGE"] = 18,
        ["NEARBY_TURRET_RANGE"] = 70,
        ["MAX_TURRETS_PER_MARK"] = 3,
        ["SHOTS_PER_TURRET"] = 5,
        ["TURRET_ARTILLERY_BULLET_DAMAGE"] = 8,
        ["TURRET_SHOT_INTERVAL_SEC"] = 0.5,
        ["TURRET_AUTO_FIRE_START_STAGGER_SEC"] = 0.25,
        ["TURRET_ARTILLERY_AIM_LERP_SEC"] = 0.12,
        ["TURRET_BULLET_SPEED"] = 320,
        ["TURRET_BULLET_ARMOR_MULTIPLIER"] = 0.6,
        ["ARTILLERY_MARK_COOLDOWN"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService:IsStudio() and 1 or 16
    }
}