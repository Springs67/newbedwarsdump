local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.DARK = 0
v2[0] = "DARK"
v3.LIGHT = 1
v2[1] = "LIGHT"
v3.CYAN = 2
v2[2] = "CYAN"
local v4 = {
    [v3.DARK] = {
        ["neonColor"] = Color3.fromRGB(117, 47, 74),
        ["wingsDecalColor"] = Color3.fromRGB(80, 39, 126),
        ["EffectModel"] = v1.Assets.Effects.DarkAngelWingsEffect,
        ["ExplosionEffect"] = v1.Assets.Effects.AngelVoidExplosion
    },
    [v3.LIGHT] = {
        ["neonColor"] = Color3.fromRGB(177, 157, 117),
        ["wingsDecalColor"] = Color3.fromRGB(255, 59, 41),
        ["EffectModel"] = v1.Assets.Effects.LightAngelWingsEffect,
        ["ExplosionEffect"] = v1.Assets.Effects.AngelLightExplosion
    },
    [v3.CYAN] = {
        ["neonColor"] = Color3.fromRGB(30, 215, 232),
        ["wingsDecalColor"] = Color3.fromRGB(8, 40, 43),
        ["EffectModel"] = v1.Assets.Effects.CyanAngelWingsEffect,
        ["ExplosionEffect"] = v1.Assets.Effects.AngelLightExplosion
    }
}
return {
    ["AngelWingsTypes"] = v3,
    ["AngelWingsColors"] = v4
}