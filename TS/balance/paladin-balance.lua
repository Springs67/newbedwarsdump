return {
    ["PaladinBalance"] = {
        ["DEFENSE_AURA_RADIUS"] = 15 * require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE,
        ["AURA_DURATION"] = 8,
        ["HEAL_PERCENT_PER_SECOND"] = 0.08,
        ["MULTIPLE_USER_HEAL_REDUCTION"] = 0.5,
        ["HEAL_REDUCTION_DURATION"] = 60
    }
}