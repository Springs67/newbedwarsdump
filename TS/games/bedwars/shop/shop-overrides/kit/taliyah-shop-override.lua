local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "taliyah", "taliyah-util").TaliyahUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "TaliyahShopOverride"
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
        [2] = u2
    --]]
    u6.constructor(p11, {
        ["kit"] = u2.TALIYAH
    })
end
function u8.shouldApply(p12, p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v14 = u5(p13, p12.config.kit)
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
        [1] = u4
        [2] = u7
        [3] = u3
        [4] = u2
    --]]
    local v16 = {}
    local v17 = {
        ["customDisplayName"] = "Egg",
        ["amount"] = 1,
        ["itemType"] = u4.CHICKEN_EGG,
        ["category"] = u7.Combat,
        ["currency"] = u3:getPrice().currency,
        ["price"] = u3:getPrice().price,
        ["requiresKit"] = { u2.TALIYAH }
    }
    local v18 = {
        ["amount"] = 1,
        ["price"] = 1,
        ["sell"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u4.CHICKEN_SHOP_ITEM
    }
    local v19 = u3:getPrice().price
    v18.customDisplayName = "Sell chicken for " .. tostring(v19) .. " " .. u3:getPrice().currency
    v18.category = u7.Combat
    v18.currency = u4.CHICKEN_DEPLOY
    v18.requiresKit = { u2.TALIYAH }
    __set_list(v16, 1, {v17, v18, {
    ["customDisplayName"] = "Iron Nest",
    ["amount"] = 1,
    ["price"] = 60,
    ["dontGiveItem"] = true,
    ["lockAfterPurchase"] = true,
    ["itemType"] = u4.IRON_CHICKEN_NEST,
    ["category"] = u7.Combat,
    ["currency"] = u4.IRON,
    ["nextTier"] = u4.DIAMOND_CHICKEN_NEST,
    ["requiresKit"] = { u2.TALIYAH }
}, {
    ["customDisplayName"] = "Diamond Nest",
    ["amount"] = 1,
    ["price"] = 2,
    ["dontGiveItem"] = true,
    ["lockAfterPurchase"] = true,
    ["tiered"] = true,
    ["itemType"] = u4.DIAMOND_CHICKEN_NEST,
    ["category"] = u7.Combat,
    ["currency"] = u4.EMERALD,
    ["prevTier"] = u4.IRON_CHICKEN_NEST,
    ["nextTier"] = u4.EMERALD_CHICKEN_NEST,
    ["requiresKit"] = { u2.TALIYAH }
}, {
    ["customDisplayName"] = "Emerald Nest",
    ["amount"] = 1,
    ["price"] = 4,
    ["dontGiveItem"] = true,
    ["lockAfterPurchase"] = true,
    ["tiered"] = true,
    ["itemType"] = u4.EMERALD_CHICKEN_NEST,
    ["category"] = u7.Combat,
    ["currency"] = u4.EMERALD,
    ["prevTier"] = u4.DIAMOND_CHICKEN_NEST,
    ["nextTier"] = u4.VOID_CHICKEN_INCUBATOR,
    ["requiresKit"] = { u2.TALIYAH }
}, {
    ["customDisplayName"] = "Void Incubator",
    ["amount"] = 1,
    ["price"] = 6,
    ["dontGiveItem"] = true,
    ["lockAfterPurchase"] = true,
    ["tiered"] = true,
    ["itemType"] = u4.VOID_CHICKEN_INCUBATOR,
    ["category"] = u7.Combat,
    ["currency"] = u4.EMERALD,
    ["prevTier"] = u4.EMERALD_CHICKEN_NEST,
    ["requiresKit"] = { u2.TALIYAH }
}})
    return v16
end
return {
    ["default"] = u8.new()
}