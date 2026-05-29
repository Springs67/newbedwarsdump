local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["InfernalShieldfUtil"] = {
        ["SHIELD_ITEMS"] = { v1.INFERNAL_SHIELD, v1.GLITCH_INFERNAL_SHIELD },
        ["COOLDOWN_SEC"] = 11,
        ["DURATION_SEC"] = 9
    }
}