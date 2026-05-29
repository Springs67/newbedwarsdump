local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-config").BlockHuntConfig
return {
    ["BlockHuntHuntersShop"] = {
        {
            ["amount"] = 1,
            ["price"] = 300,
            ["limitPerGame"] = 1,
            ["itemType"] = v3.BLOCK_RADAR,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 100,
            ["limitPerGame"] = 1,
            ["itemType"] = v3.DIAMOND_SWORD,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 200,
            ["limitPerGame"] = 1,
            ["itemType"] = v3.LASSO,
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
            ["itemType"] = v3.ARROW,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 100,
            ["limitPerGame"] = 2,
            ["itemType"] = v3.TNT,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Blocks
        },
        {
            ["amount"] = 1,
            ["price"] = 150,
            ["limitPerGame"] = 2,
            ["itemType"] = v3.FIREBALL,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 500,
            ["limitPerGame"] = 1,
            ["itemType"] = v3.HUNTERS_ECHO,
            ["currency"] = v4.BH_ITEM_CURRENCY,
            ["category"] = v2.Combat
        }
    }
}