local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "seahorse", "seahorse-level").SeahorseLevel
local v2 = {
    [v1.LEVEL_0] = {},
    [v1.LEVEL_1] = {
        ["basicShot"] = {
            ["projectileCount"] = 1,
            ["cooldownSec"] = 1.2,
            ["effectivenessMultiplier"] = 0.7
        }
    },
    [v1.LEVEL_2] = {
        ["basicShot"] = {
            ["projectileCount"] = 2,
            ["cooldownSec"] = 1.2
        },
        ["basicShotPowerup"] = {
            ["shotsToPowerUp"] = 8
        }
    },
    [v1.LEVEL_3] = {
        ["basicShot"] = {
            ["projectileCount"] = 3,
            ["cooldownSec"] = 1.2
        },
        ["basicShotPowerup"] = {
            ["shotsToPowerUp"] = 8
        },
        ["beam"] = {
            ["cooldownSec"] = 8
        }
    }
}
return {
    ["SeahorseMeta"] = v2
}