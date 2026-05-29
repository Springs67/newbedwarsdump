local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-items").CrateItemType
return {
    ["AFK_CRATE_ITEMS"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v3.FLAT_BP_XP_1,
            ["rarity"] = v2.ONE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v3.FLAT_BP_XP_2,
            ["rarity"] = v2.TWO_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v3.FLAT_BP_XP_3,
            ["rarity"] = v2.THREE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v3.BATTLE_PASS_2X,
            ["rarity"] = v2.FOUR_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v3.LEVEL_UP_CRATE,
            ["rarity"] = v2.FOUR_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v3.DIAMOND_LUCKY_CRATE,
            ["rarity"] = v2.FIVE_STAR
        },
        {
            ["amount"] = 1,
            ["itemType"] = v3.RANDOM_KIT,
            ["rarity"] = v2.SIX_STAR
        }
    }
}