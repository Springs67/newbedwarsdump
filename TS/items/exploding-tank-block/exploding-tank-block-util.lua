return {
    ["ExplodingTankBlockUtil"] = {
        ["RADIUS"] = 3.5 * require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE,
        ["DAMAGE"] = 20
    }
}