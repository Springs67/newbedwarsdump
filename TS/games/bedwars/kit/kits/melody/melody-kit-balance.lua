return {
    ["MelodyKitBalance"] = {
        ["HEAL_COOLDOWN"] = 1,
        ["VISUAL_PLAYING_ADDED_TIME"] = 1,
        ["MAX_HEAL"] = 13,
        ["SELF_HEAL_MULTIPLIER"] = 0.9,
        ["HEAL_TARGET_RANGE"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE * 17
    }
}