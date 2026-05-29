local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {
    [v1.WOOD_SWORD] = { v1.STONE_SWORD },
    [v1.STONE_SWORD] = { v1.IRON_SWORD },
    [v1.IRON_SWORD] = { v1.DIAMOND_SWORD },
    [v1.DIAMOND_SWORD] = { v1.EMERALD_SWORD }
}
local v3 = {
    [v1.WOOD_SCYTHE] = { v1.STONE_SCYTHE },
    [v1.STONE_SCYTHE] = { v1.IRON_SCYTHE },
    [v1.IRON_SCYTHE] = { v1.DIAMOND_SCYTHE },
    [v1.DIAMOND_SCYTHE] = { v1.MYTHIC_SCYTHE }
}
local v4 = {
    [v1.WOOD_DAGGER] = { v1.STONE_DAGGER },
    [v1.STONE_DAGGER] = { v1.IRON_DAGGER },
    [v1.IRON_DAGGER] = { v1.DIAMOND_DAGGER },
    [v1.DIAMOND_DAGGER] = { v1.MYTHIC_DAGGER }
}
local v5 = {
    [v1.WOOD_GREAT_HAMMER] = { v1.STONE_GREAT_HAMMER },
    [v1.STONE_GREAT_HAMMER] = { v1.IRON_GREAT_HAMMER },
    [v1.IRON_GREAT_HAMMER] = { v1.DIAMOND_GREAT_HAMMER },
    [v1.DIAMOND_GREAT_HAMMER] = { v1.MYTHIC_GREAT_HAMMER }
}
local v6 = {
    [v1.WOOD_GAUNTLETS] = { v1.STONE_GAUNTLETS },
    [v1.STONE_GAUNTLETS] = { v1.IRON_GAUNTLETS },
    [v1.IRON_GAUNTLETS] = { v1.DIAMOND_GAUNTLETS },
    [v1.DIAMOND_GAUNTLETS] = { v1.MYTHIC_GAUNTLETS }
}
local v7 = {
    [v1.WOOD_DAO] = { v1.STONE_DAO },
    [v1.STONE_DAO] = { v1.IRON_DAO },
    [v1.IRON_DAO] = { v1.DIAMOND_DAO },
    [v1.DIAMOND_DAO] = { v1.EMERALD_DAO }
}
local v8 = {
    [v1.WOOD_GUN_BLADE] = { v1.STONE_GUN_BLADE },
    [v1.STONE_GUN_BLADE] = { v1.IRON_GUN_BLADE },
    [v1.IRON_GUN_BLADE] = { v1.DIAMOND_GUN_BLADE },
    [v1.DIAMOND_GUN_BLADE] = { v1.EMERALD_GUN_BLADE }
}
return {
    ["ItemUpgradeMeta"] = {
        v2,
        {
            [v1.WOOD_BOW] = { v1.WOOD_CROSSBOW }
        },
        {
            [v1.BASEBALL_BAT] = { v1.FRYING_PAN }
        },
        {
            [v1.LEATHER_HELMET] = { v1.IRON_HELMET },
            [v1.IRON_HELMET] = { v1.DIAMOND_HELMET },
            [v1.DIAMOND_HELMET] = { v1.EMERALD_HELMET }
        },
        {
            [v1.LEATHER_CHESTPLATE] = { v1.IRON_CHESTPLATE },
            [v1.IRON_CHESTPLATE] = { v1.DIAMOND_CHESTPLATE },
            [v1.DIAMOND_CHESTPLATE] = { v1.EMERALD_CHESTPLATE }
        },
        {
            [v1.LEATHER_BOOTS] = { v1.IRON_BOOTS },
            [v1.IRON_BOOTS] = { v1.DIAMOND_BOOTS },
            [v1.DIAMOND_BOOTS] = { v1.EMERALD_BOOTS }
        },
        v3,
        v4,
        v5,
        v6,
        v7,
        v8
    }
}