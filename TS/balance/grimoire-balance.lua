local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["GrimoireBalance"] = {
        ["SHIELD_SIZE"] = 100,
        ["GROUNDED_STATUS_EFFECT_DURATION"] = 10,
        ["MINIMUM_HEALTH_FOR_POWER_CAST"] = 75,
        ["UNDEAD_ARMY_SIZE"] = 3,
        ["UNDEAD_ARMY_DEFAULT_HELMET"] = v1.IRON_HELMET,
        ["UNDEAD_ARMY_DEFAULT_SWORD"] = v1.IRON_SWORD,
        ["FEEBLE_STATUS_EFFECT_DURATION"] = 30
    }
}