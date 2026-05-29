local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local v6 = {
    {
        ["amount"] = 16,
        ["price"] = 300,
        ["itemType"] = v4.WOOL_WHITE,
        ["currency"] = v4.GOLD,
        ["category"] = v2.Blocks
    },
    {
        ["amount"] = 1,
        ["price"] = 0,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = false,
        ["itemType"] = v4.WOOD_SWORD,
        ["currency"] = v4.GOLD,
        ["category"] = v2.Combat,
        ["nextTier"] = v4.STONE_SWORD,
        ["superiorItems"] = { v4.STONE_SWORD },
        ["ignoreByPlayerAugment"] = { v5.BARBARIAN }
    },
    {
        ["amount"] = 1,
        ["price"] = 800,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = false,
        ["itemType"] = v4.STONE_SWORD,
        ["currency"] = v4.GOLD,
        ["prevTier"] = v4.WOOD_SWORD,
        ["nextTier"] = v4.IRON_SWORD,
        ["category"] = v2.Combat,
        ["superiorItems"] = { v4.STONE_SWORD },
        ["ignoreByPlayerAugment"] = { v5.BARBARIAN }
    },
    {
        ["amount"] = 1,
        ["price"] = 2200,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = false,
        ["itemType"] = v4.IRON_SWORD,
        ["currency"] = v4.GOLD,
        ["prevTier"] = v4.STONE_SWORD,
        ["nextTier"] = v4.DIAMOND_SWORD,
        ["category"] = v2.Combat,
        ["superiorItems"] = { v4.DIAMOND_SWORD },
        ["ignoreByPlayerAugment"] = { v5.BARBARIAN }
    },
    {
        ["amount"] = 1,
        ["price"] = 3000,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = false,
        ["itemType"] = v4.DIAMOND_SWORD,
        ["currency"] = v4.GOLD,
        ["prevTier"] = v4.IRON_SWORD,
        ["nextTier"] = v4.EMERALD_SWORD,
        ["category"] = v2.Combat,
        ["superiorItems"] = { v4.EMERALD_SWORD },
        ["ignoreByPlayerAugment"] = { v5.BARBARIAN }
    },
    {
        ["amount"] = 1,
        ["price"] = 4500,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = false,
        ["itemType"] = v4.EMERALD_SWORD,
        ["currency"] = v4.GOLD,
        ["prevTier"] = v4.DIAMOND_SWORD,
        ["category"] = v2.Combat,
        ["ignoreByPlayerAugment"] = { v5.BARBARIAN }
    },
    {
        ["customDisplayName"] = "Leather Armor",
        ["amount"] = 1,
        ["price"] = 2000,
        ["lockAfterPurchase"] = true,
        ["itemType"] = v4.LEATHER_CHESTPLATE,
        ["currency"] = v4.GOLD,
        ["nextTier"] = v4.IRON_CHESTPLATE,
        ["category"] = v2.Combat,
        ["superiorItems"] = { v4.IRON_CHESTPLATE }
    },
    {
        ["customDisplayName"] = "Iron Armor",
        ["amount"] = 1,
        ["price"] = 4000,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = v4.IRON_CHESTPLATE,
        ["currency"] = v4.GOLD,
        ["category"] = v2.Combat,
        ["prevTier"] = v4.LEATHER_CHESTPLATE,
        ["nextTier"] = v4.DIAMOND_CHESTPLATE
    },
    {
        ["customDisplayName"] = "Diamond Armor",
        ["amount"] = 1,
        ["price"] = 6000,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = v4.DIAMOND_CHESTPLATE,
        ["currency"] = v4.GOLD,
        ["category"] = v2.Combat,
        ["prevTier"] = v4.IRON_CHESTPLATE,
        ["nextTier"] = v4.EMERALD_CHESTPLATE
    },
    {
        ["customDisplayName"] = "Emerald Armor",
        ["amount"] = 1,
        ["price"] = 8000,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = v4.EMERALD_CHESTPLATE,
        ["currency"] = v4.GOLD,
        ["prevTier"] = v4.DIAMOND_CHESTPLATE,
        ["category"] = v2.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 5000,
        ["lockAfterPurchase"] = true,
        ["itemType"] = v4.WOOD_CROSSBOW,
        ["currency"] = v4.GOLD,
        ["category"] = v2.Combat,
        ["prevTier"] = v4.WOOD_BOW,
        ["nextTier"] = v4.HEADHUNTER
    },
    {
        ["amount"] = 1,
        ["price"] = 8000,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = v4.HEADHUNTER,
        ["currency"] = v4.GOLD,
        ["category"] = v2.Combat,
        ["prevTier"] = v4.WOOD_CROSSBOW
    },
    {
        ["amount"] = 8,
        ["price"] = 250,
        ["itemType"] = v4.ARROW,
        ["currency"] = v4.GOLD,
        ["category"] = v2.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 500,
        ["itemType"] = v4.FIREBALL,
        ["currency"] = v4.GOLD,
        ["category"] = v2.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 500,
        ["itemType"] = v4.GLUE_PROJECTILE,
        ["currency"] = v4.GOLD,
        ["category"] = v2.Combat
    }
}
local v7 = 0
local v8 = {}
for v9, v10 in v6 do
    local _ = v9 - 1
    if v3(v10.itemType).sword ~= nil == true then
        v7 = v7 + 1
        v8[v7] = v10
    end
end
local v11
if v8 == nil then
    v11 = v8
else
    v11 = table.create(#v8)
    for v12, v13 in v8 do
        local _ = v12 - 1
        v11[v12] = v13.itemType
    end
end
return {
    ["PvPArenaShopItems"] = v6,
    ["PvPArenaSwords"] = v11 == nil and {} or v11
}