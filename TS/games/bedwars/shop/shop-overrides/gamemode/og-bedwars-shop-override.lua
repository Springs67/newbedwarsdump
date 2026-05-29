local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").customMeleeKits
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "OgBedwarsShopOverride"
    end,
    ["__index"] = u7
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, ...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p12, ...)
end
function u9.shouldApply(_, _) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v13 = u2:GetAttribute("QueueType")
    if v13 then
        v13 = v13 == u3.BEDWARS_OG_TO4
    end
    return v13
end
function u9.getOverride(_, _, _) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u8
        [4] = u3
        [5] = u4
    --]]
    return {
        {
            ["amount"] = 1,
            ["price"] = 20,
            ["lockAfterPurchase"] = false,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.STONE_SWORD,
            ["currency"] = u5.IRON,
            ["ignoredByKit"] = u6,
            ["category"] = u8.Combat,
            ["superiorItems"] = { u5.IRON_SWORD },
            ["spawnWithItems"] = { u5.WOOD_SWORD }
        },
        {
            ["amount"] = 1,
            ["price"] = 70,
            ["lockAfterPurchase"] = false,
            ["fullObjectOverride"] = true,
            ["itemType"] = u5.IRON_SWORD,
            ["currency"] = u5.IRON,
            ["ignoredByKit"] = u6,
            ["category"] = u8.Combat,
            ["disabledInQueue"] = { u3.TNT_WARS },
            ["superiorItems"] = {
                u5.OG_DIAMOND_SWORD,
                u5.HEAVENLY_SWORD,
                u5.INFERNAL_SABER,
                u5.ICE_SWORD
            },
            ["spawnWithItems"] = { u5.WOOD_SWORD }
        },
        {
            ["amount"] = 1,
            ["price"] = 4,
            ["lockAfterPurchase"] = false,
            ["nextTier"] = nil,
            ["requireInInventoryToTierUp"] = false,
            ["itemType"] = u5.OG_DIAMOND_SWORD,
            ["currency"] = u5.EMERALD,
            ["ignoredByKit"] = u6,
            ["category"] = u8.Combat,
            ["superiorItems"] = { u5.OG_EMERALD_SWORD, u5.VOID_SWORD },
            ["spawnWithItems"] = { u5.WOOD_SWORD }
        },
        {
            ["amount"] = 1,
            ["price"] = 20,
            ["lockAfterPurchase"] = false,
            ["nextTier"] = nil,
            ["requireInInventoryToTierUp"] = false,
            ["itemType"] = u5.OG_EMERALD_SWORD,
            ["currency"] = u5.EMERALD,
            ["ignoredByKit"] = u6,
            ["category"] = u8.Combat,
            ["spawnWithItems"] = { u5.WOOD_SWORD }
        },
        {
            ["amount"] = 1,
            ["price"] = 7,
            ["lockAfterPurchase"] = true,
            ["itemType"] = u5.OG_WOOD_CROSSBOW,
            ["currency"] = u5.EMERALD,
            ["spawnWithItems"] = { u5.OG_WOOD_CROSSBOW },
            ["category"] = u8.Combat,
            ["ignoredByKit"] = { u4.ARCHER, u4.LYLA }
        }
    }
end
return {
    ["default"] = u9.new()
}