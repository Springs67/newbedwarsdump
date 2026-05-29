local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
return {
    ["OreTheme"] = {
        ["iron"] = v1.WHITE,
        ["diamond"] = v1.hexColor(5636095),
        ["emerald"] = v1.hexColor(5635925)
    }
}