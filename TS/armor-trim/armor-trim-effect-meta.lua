local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType
return {
    ["ArmorTrimEffectMeta"] = {
        [v1.DEFAULT] = {
            ["name"] = "Default"
        },
        [v1.FIRE_WARM] = {
            ["name"] = "Fire"
        },
        [v1.FIRE_COOL] = {
            ["name"] = "Ice Flame"
        },
        [v1.FIRE_BLACK] = {
            ["name"] = "Black Flame",
            ["unlockable"] = true,
            ["image"] = "rbxassetid://137506418940904"
        },
        [v1.FIRE_PURPLE] = {
            ["name"] = "Void Flame",
            ["unlockable"] = true,
            ["image"] = "rbxassetid://96306729075443"
        },
        [v1.FIRE_RED] = {
            ["name"] = "Hellfire Flame",
            ["unlockable"] = true,
            ["image"] = "rbxassetid://106748733079400"
        },
        [v1.FROSTY] = {
            ["name"] = "Frosty"
        },
        [v1.VOID] = {
            ["name"] = "Void"
        },
        [v1.SPIRIT] = {
            ["name"] = "Spirit"
        },
        [v1.BAT] = {
            ["name"] = "Bat"
        },
        [v1.PHOENIX] = {
            ["name"] = "Phoenix"
        },
        [v1.ANNIVERSARY] = {
            ["name"] = "Anniversary",
            ["unlockable"] = true,
            ["image"] = "rbxassetid://132923703950518"
        }
    }
}