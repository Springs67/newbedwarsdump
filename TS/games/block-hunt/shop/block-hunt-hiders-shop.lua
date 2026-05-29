local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-config").BlockHuntConfig
return {
    ["BlockHuntHidersShop"] = {
        {
            ["amount"] = 1,
            ["price"] = 100,
            ["limitPerGame"] = 1,
            ["itemType"] = v3.BAGUETTE,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 100,
            ["limitPerGame"] = 2,
            ["itemType"] = v3.SPEED_POTION,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 100,
            ["limitPerGame"] = 1,
            ["itemType"] = v3.WOOD_BOW,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        },
        {
            ["amount"] = 8,
            ["price"] = 20,
            ["limitPerGame"] = 1,
            ["itemType"] = v3.ARROW,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 80,
            ["limitPerGame"] = 1,
            ["itemType"] = v3.STONE_SWORD,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        }
    }
}