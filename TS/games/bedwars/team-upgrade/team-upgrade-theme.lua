local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["TeamUpgradeTheme"] = {
        ["disabled"] = Color3.fromRGB(77, 77, 77),
        ["error"] = Color3.fromRGB(224, 102, 102),
        ["success"] = v1.backgroundSuccess
    }
}