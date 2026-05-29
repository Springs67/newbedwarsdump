local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "BerserkerShopOverride"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    u6.constructor(p11, {
        ["kit"] = u5.BERSERKER
    })
end
function u8.shouldApply(p12, p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v14 = u4(p13, p12.config.kit)
    if v14 then
        local v15 = p12.config
        if v15 ~= nil then
            v15 = v15.enabled
        end
        v14 = v15 == nil and true or v15
    end
    return v14
end
function u8.getOverride(_) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u5
        [4] = u2
    --]]
    return {
        {
            ["amount"] = 1,
            ["price"] = 15,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["itemType"] = u3.STONE_AXE,
            ["currency"] = u3.IRON,
            ["prevTier"] = u3.WOOD_AXE,
            ["nextTier"] = u3.IRON_AXE,
            ["spawnWithItems"] = { u3.STONE_AXE },
            ["category"] = u7.Tools,
            ["ignoredByKit"] = { u5.MINER },
            ["disabledInQueue"] = { u2.TNT_WARS }
        },
        {
            ["amount"] = 1,
            ["price"] = 20,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["itemType"] = u3.IRON_AXE,
            ["currency"] = u3.IRON,
            ["prevTier"] = u3.STONE_AXE,
            ["nextTier"] = u3.DIAMOND_AXE,
            ["spawnWithItems"] = { u3.IRON_AXE },
            ["category"] = u7.Tools,
            ["ignoredByKit"] = { u5.MINER },
            ["disabledInQueue"] = { u2.TNT_WARS }
        },
        {
            ["amount"] = 1,
            ["price"] = 45,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["itemType"] = u3.DIAMOND_AXE,
            ["currency"] = u3.IRON,
            ["prevTier"] = u3.IRON_AXE,
            ["spawnWithItems"] = { u3.DIAMOND_AXE },
            ["category"] = u7.Tools,
            ["ignoredByKit"] = { u5.MINER },
            ["disabledInQueue"] = { u2.TNT_WARS }
        },
        {
            ["amount"] = 1,
            ["price"] = 15,
            ["lockAfterPurchase"] = true,
            ["itemType"] = u3.STONE_PICKAXE,
            ["currency"] = u3.IRON,
            ["prevTier"] = u3.WOOD_PICKAXE,
            ["nextTier"] = u3.IRON_PICKAXE,
            ["spawnWithItems"] = { u3.STONE_PICKAXE },
            ["category"] = u7.Tools
        },
        {
            ["amount"] = 1,
            ["price"] = 20,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["itemType"] = u3.IRON_PICKAXE,
            ["currency"] = u3.IRON,
            ["prevTier"] = u3.STONE_PICKAXE,
            ["nextTier"] = u3.DIAMOND_PICKAXE,
            ["spawnWithItems"] = { u3.IRON_PICKAXE },
            ["category"] = u7.Tools
        },
        {
            ["amount"] = 1,
            ["price"] = 45,
            ["lockAfterPurchase"] = true,
            ["tiered"] = true,
            ["itemType"] = u3.DIAMOND_PICKAXE,
            ["currency"] = u3.IRON,
            ["prevTier"] = u3.IRON_PICKAXE,
            ["spawnWithItems"] = { u3.DIAMOND_PICKAXE },
            ["category"] = u7.Tools
        }
    }
end
return {
    ["default"] = u8.new()
}