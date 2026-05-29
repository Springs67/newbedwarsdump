local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["MimicBalance"] = {
        ["MIMIC_REGEN_RATE"] = 3,
        ["MIMIC_MOVEMENT_DECAY_RATE"] = 4.5,
        ["MIMIC_BUFFS_APPLY_DELAY"] = 4.25,
        ["MIMIC_BUFFS_DURATION"] = 3,
        ["MIMIC_BUFFS_SPEED_MULTIPLIER"] = 1.25,
        ["MIMIC_BUFFS_SHIELD_AMOUNT"] = 25,
        ["MIMIC_PICKPOCKET_RADIUS"] = 25,
        ["MIMIC_PICKPOCKET_RESOURCES"] = {
            v1.IRON,
            v1.DIAMOND,
            v1.EMERALD,
            v1.VOID_CRYSTAL,
            v1.TNT,
            v1.TELEPEARL,
            v1.OBSIDIAN,
            v1.FIREBALL,
            v1.DUCK_SPAWN_EGG,
            v1.TESLA_TRAP
        },
        ["MIMIC_PICKPOCKET_VALUABLE_RESOURCES"] = { v1.DIAMOND, v1.EMERALD, v1.VOID_CRYSTAL },
        ["MIMIC_PICKPOCKET_RESOURCE_PERCENTAGE_RANGE"] = NumberRange.new(0.15, 0.25)
    }
}