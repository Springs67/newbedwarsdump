local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop")
local u7 = v6.customArmorKits
local u8 = v6.customDiamondEmeraldMelee
local u9 = v6.customMeleeKits
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "MinewarsShopOverride"
    end,
    ["__index"] = u10
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, ...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p15, ...)
end
function u12.shouldApply(_, _) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v16 = u2:GetAttribute("QueueType")
    if v16 then
        v16 = v16 == u3.MINE_WARS
    end
    return v16
end
function u12.getOverride(_) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u9
        [4] = u8
        [5] = u4
        [6] = u7
    --]]
    return {
        {
            ["amount"] = 1,
            ["price"] = 80,
            ["lockAfterPurchase"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.IRON_PICKAXE,
            ["currency"] = u5.IRON,
            ["prevTier"] = u5.STONE_PICKAXE,
            ["nextTier"] = u5.DIAMOND_PICKAXE,
            ["spawnWithItems"] = { u5.IRON_PICKAXE },
            ["category"] = u11.Tools
        },
        {
            ["amount"] = 1,
            ["price"] = 7,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.DIAMOND_PICKAXE,
            ["currency"] = u5.EMERALD,
            ["prevTier"] = u5.IRON_PICKAXE,
            ["nextTier"] = u5.LASER_PICKAXE,
            ["spawnWithItems"] = { u5.DIAMOND_PICKAXE },
            ["category"] = u11.Tools
        },
        {
            ["amount"] = 1,
            ["price"] = 16,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.LASER_PICKAXE,
            ["currency"] = u5.EMERALD,
            ["prevTier"] = u5.DIAMOND_PICKAXE,
            ["spawnWithItems"] = { u5.LASER_PICKAXE },
            ["category"] = u11.Tools
        },
        {
            ["amount"] = 1,
            ["price"] = 50,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.TNT,
            ["currency"] = u5.IRON,
            ["category"] = u11.Blocks
        },
        {
            ["amount"] = 5,
            ["price"] = 10,
            ["itemType"] = u5.IRON,
            ["currency"] = u5.STONE,
            ["category"] = u11.Resources
        },
        {
            ["amount"] = 1,
            ["price"] = 5,
            ["itemType"] = u5.DIAMOND,
            ["currency"] = u5.BLASTPROOF_CERAMIC,
            ["category"] = u11.Resources
        },
        {
            ["amount"] = 1,
            ["price"] = 4,
            ["itemType"] = u5.EMERALD,
            ["currency"] = u5.OBSIDIAN,
            ["category"] = u11.Resources
        },
        {
            ["amount"] = 1,
            ["price"] = 1,
            ["itemType"] = u5.WORMHOLE,
            ["currency"] = u5.EMERALD,
            ["category"] = u11.Tools
        },
        {
            ["amount"] = 1,
            ["price"] = 50,
            ["lockAfterPurchase"] = true,
            ["requireInInventoryToTierUp"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.STONE_SWORD,
            ["currency"] = u5.IRON,
            ["ignoredByKit"] = u9,
            ["category"] = u11.Combat,
            ["nextTier"] = u5.IRON_SWORD,
            ["superiorItems"] = { u5.IRON_SWORD },
            ["spawnWithItems"] = { u5.STONE_SWORD }
        },
        {
            ["amount"] = 1,
            ["price"] = 100,
            ["lockAfterPurchase"] = true,
            ["requireInInventoryToTierUp"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.IRON_SWORD,
            ["currency"] = u5.IRON,
            ["ignoredByKit"] = u9,
            ["category"] = u11.Combat,
            ["superiorItems"] = {
                u5.DIAMOND_SWORD,
                u5.HEAVENLY_SWORD,
                u5.INFERNAL_SABER,
                u5.ICE_SWORD
            },
            ["nextTier"] = u5.DIAMOND_SWORD,
            ["spawnWithItems"] = { u5.IRON_SWORD }
        },
        {
            ["amount"] = 1,
            ["price"] = 10,
            ["lockAfterPurchase"] = true,
            ["requireInInventoryToTierUp"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.DIAMOND_SWORD,
            ["currency"] = u5.EMERALD,
            ["ignoredByKit"] = u8,
            ["category"] = u11.Combat,
            ["superiorItems"] = { u5.EMERALD_SWORD },
            ["nextTier"] = u5.EMERALD_SWORD,
            ["spawnWithItems"] = { u5.IRON_SWORD }
        },
        {
            ["amount"] = 1,
            ["price"] = 30,
            ["lockAfterPurchase"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.EMERALD_SWORD,
            ["currency"] = u5.EMERALD,
            ["ignoredByKit"] = u8,
            ["category"] = u11.Combat,
            ["spawnWithItems"] = { u5.DIAMOND_SWORD }
        },
        {
            ["customDisplayName"] = "Leather Armor",
            ["amount"] = 1,
            ["price"] = 70,
            ["lockAfterPurchase"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.LEATHER_CHESTPLATE,
            ["currency"] = u5.IRON,
            ["spawnWithItems"] = u4.LEATHER,
            ["nextTier"] = u5.IRON_CHESTPLATE,
            ["ignoredByKit"] = u7,
            ["category"] = u11.Combat,
            ["superiorItems"] = { u5.IRON_CHESTPLATE }
        },
        {
            ["customDisplayName"] = "Iron Armor",
            ["amount"] = 1,
            ["price"] = 150,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.IRON_CHESTPLATE,
            ["currency"] = u5.IRON,
            ["spawnWithItems"] = u4.IRON,
            ["category"] = u11.Combat,
            ["prevTier"] = u5.LEATHER_CHESTPLATE,
            ["nextTier"] = u5.DIAMOND_CHESTPLATE,
            ["ignoredByKit"] = u7
        },
        {
            ["customDisplayName"] = "Diamond Armor",
            ["amount"] = 1,
            ["price"] = 15,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.DIAMOND_CHESTPLATE,
            ["currency"] = u5.EMERALD,
            ["spawnWithItems"] = u4.DIAMOND,
            ["category"] = u11.Combat,
            ["prevTier"] = u5.IRON_CHESTPLATE,
            ["nextTier"] = u5.EMERALD_CHESTPLATE,
            ["ignoredByKit"] = u7
        },
        {
            ["customDisplayName"] = "Emerald Armor",
            ["amount"] = 1,
            ["price"] = 30,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.EMERALD_CHESTPLATE,
            ["currency"] = u5.EMERALD,
            ["spawnWithItems"] = u4.EMERALD,
            ["prevTier"] = u5.DIAMOND_CHESTPLATE,
            ["ignoredByKit"] = u7,
            ["category"] = u11.Combat
        }
    }
end
return {
    ["default"] = u12.new()
}