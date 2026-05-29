local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-colors").ArmorTrimColor
local v2 = {
    [v1.RED] = {
        ["color"] = Color3.fromRGB(255, 99, 99)
    },
    [v1.ORANGE] = {
        ["color"] = Color3.fromRGB(255, 181, 107)
    },
    [v1.YELLOW] = {
        ["color"] = Color3.fromRGB(255, 255, 94)
    },
    [v1.GREEN] = {
        ["color"] = Color3.fromRGB(128, 255, 128)
    },
    [v1.BLUE] = {
        ["color"] = Color3.fromRGB(74, 74, 255)
    },
    [v1.INDIGO] = {
        ["color"] = Color3.fromRGB(171, 166, 255)
    },
    [v1.PURPLE] = {
        ["color"] = Color3.fromRGB(176, 84, 255)
    },
    [v1.WHITE] = {
        ["color"] = Color3.fromRGB(255, 255, 255)
    },
    [v1.BLACK] = {
        ["color"] = Color3.fromRGB(0, 0, 0)
    },
    [v1.BROWN] = {
        ["color"] = Color3.fromRGB(148, 97, 46)
    },
    [v1.PINK] = {
        ["color"] = Color3.fromRGB(255, 156, 255)
    }
}
return {
    ["ArmorTrimColorMeta"] = v2
}