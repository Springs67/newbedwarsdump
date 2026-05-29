local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "condiment-gun", "condiment-gun-modes").CondimentGunModes
local v2 = {
    ["tickRate"] = 0.2,
    ["coneDistance"] = 38,
    ["ammo"] = {
        ["depleteAmount"] = 5,
        ["fillAmount"] = 2.5,
        ["max"] = 100
    }
}
local v3 = {}
local v4 = v1.KETCHUP
local v5 = {
    ["damage"] = {
        ["amount"] = 8,
        ["knockback"] = {
            ["disabled"] = true
        }
    },
    ["color"] = {
        ["light"] = Color3.fromRGB(255, 100, 100),
        ["dark"] = Color3.fromRGB(200, 0, 0)
    }
}
v3[v4] = v5
local v6 = v1.MUSTARD
local v7 = {
    ["damage"] = {
        ["amount"] = 0,
        ["knockback"] = {
            ["horizontal"] = 1,
            ["vertical"] = 0.3
        }
    },
    ["color"] = {
        ["light"] = Color3.fromRGB(255, 255, 100),
        ["dark"] = Color3.fromRGB(200, 200, 0)
    }
}
v3[v6] = v7
v2.condiments = v3
return {
    ["CondimentGunConfigs"] = v2
}