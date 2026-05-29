return {
    ["DEFAULT_BREAK_COOLDOWN"] = 0.3,
    ["DEFAULT_BREAK_RANGE"] = 6 * require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
}