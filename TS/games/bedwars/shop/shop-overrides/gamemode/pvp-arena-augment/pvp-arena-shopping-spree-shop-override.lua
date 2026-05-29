local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-meta").getPvPArenaAugmentMeta
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type")
local u6 = v5.PVP_ARENA_SHOP_DISCOUNT_STACKS_ATTRIBUTE
local u7 = v5.PvPArenaAugmentType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "PvPArenaShoppingSpreeShopOverride"
    end,
    ["__index"] = u8
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
        [1] = u8
    --]]
    u8.constructor(p12, ...)
end
function u9.shouldApply(_, p13) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u7
    --]]
    if u2:GetAttribute("GameType") == u3.PVP_ARENA then
        return p13:GetAttribute(u7.SHOPPING_SPREE) == true
    else
        return false
    end
end
function u9.getOverride(_, p14, p15) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u7
    --]]
    local v16 = p14:GetAttribute(u6)
    local v17 = v16 == nil and 1 or v16
    local v18 = u4(u7.SHOPPING_SPREE).config()
    local v19 = v18.shopDiscountPercentPerStack / 100
    local v20 = v18.minimumPriceMultiplier
    local v21 = 1 - v17 * v19
    local v22 = math.max(v20, v21)
    local v23 = {}
    for _, v24 in p15 do
        if v24.price > 0 then
            local v25 = {
                ["itemType"] = v24.itemType,
                ["priceMultiplier"] = v22
            }
            table.insert(v23, v25)
        end
    end
    return v23
end
return {
    ["default"] = u9.new()
}