return {
    ["laserColorSelect"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WeightedSelect.new({
        {
            ["weight"] = 40,
            ["color"] = "Blue",
            ["inner"] = Color3.fromRGB(46, 118, 235),
            ["outer"] = Color3.fromRGB(9, 137, 207),
            ["trail"] = ColorSequence.new(Color3.fromRGB(20, 183, 238))
        },
        {
            ["weight"] = 30,
            ["color"] = "Green",
            ["inner"] = Color3.fromRGB(79, 143, 0),
            ["outer"] = Color3.fromRGB(95, 186, 74),
            ["trail"] = ColorSequence.new(Color3.fromRGB(0, 249, 0))
        },
        {
            ["weight"] = 15,
            ["color"] = "Red",
            ["inner"] = Color3.fromRGB(240, 63, 67),
            ["outer"] = Color3.fromRGB(225, 73, 79),
            ["trail"] = ColorSequence.new(Color3.fromRGB(236, 27, 15))
        },
        {
            ["weight"] = 2,
            ["color"] = "Purple",
            ["inner"] = Color3.fromRGB(207, 79, 252),
            ["outer"] = Color3.fromRGB(224, 92, 227),
            ["trail"] = ColorSequence.new(Color3.fromRGB(223, 88, 215))
        }
    })
}