local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-items").CrateItemType
return {
    ["LUCKY_CRATE_ITEMS"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v5.YUZI_BRB,
            ["rarity"] = v4.ONE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.HATS_OFF,
            ["rarity"] = v4.ONE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.HMM_OK,
            ["rarity"] = v4.ONE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.BEEKEEPER_GIFT,
            ["rarity"] = v4.ONE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.KALIYAH_PUMPED,
            ["rarity"] = v4.ONE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.ALCHEMIST_EVIL,
            ["rarity"] = v4.TWO_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.CONQUEROR_FIREBALL,
            ["rarity"] = v4.TWO_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.ALL_GOOD,
            ["rarity"] = v4.TWO_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.BOMB_EMOJI,
            ["rarity"] = v4.TWO_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.DESTROYER,
            ["rarity"] = v4.TWO_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.LEGEND,
            ["rarity"] = v4.FIVE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.FLYING_BACKPACK,
            ["rarity"] = v4.THREE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.MYTHIC_GAUNTLETS,
            ["rarity"] = v4.FOUR_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.DINO_MOUNT,
            ["rarity"] = v4.FIVE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.BED_COIN_100,
            ["rarity"] = v4.ONE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.BED_COIN_200,
            ["rarity"] = v4.TWO_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.BED_COIN_350,
            ["rarity"] = v4.THREE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.BED_COIN_600,
            ["rarity"] = v4.FOUR_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.KIT_RENTAL_BATTLEPASS_7,
            ["rarity"] = v2(v3.KIT_RENTAL_BATTLEPASS_7).rarity
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.KIT_RENTAL_ALL_7,
            ["rarity"] = v2(v3.KIT_RENTAL_ALL_7).rarity
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.ARMOR_TRIM_1_5X,
            ["rarity"] = v2(v3.ARMOR_TRIM_1_5X).rarity
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.ARMOR_TRIM_2X,
            ["rarity"] = v2(v3.ARMOR_TRIM_2X).rarity
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.ARMOR_TRIM_3X,
            ["rarity"] = v2(v3.ARMOR_TRIM_3X).rarity
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.RANDOM_KIT,
            ["rarity"] = v4.SIX_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.FIRE_BLACK,
            ["rarity"] = v4.FIVE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.FIRE_PURPLE,
            ["rarity"] = v4.FIVE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.FIRE_RED,
            ["rarity"] = v4.FIVE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v5.ANNIVERSARY,
            ["rarity"] = v4.FIVE_STAR
        }
    }
}