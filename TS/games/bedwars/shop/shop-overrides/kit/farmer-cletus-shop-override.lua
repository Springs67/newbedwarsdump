local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "farmer-cletus", "farmer-cletus-util").FarmerCletusUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "FarmerCletusShopOverride"
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
        ["kit"] = u2.FARMER_CLETUS
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
function u8.getOverride(_, p16) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u7
        [4] = u3
    --]]
    return {
        {
            ["amount"] = 1,
            ["price"] = 60,
            ["itemType"] = u4.CARROT_SEEDS,
            ["currency"] = u4.IRON,
            ["requiresKit"] = { u2.FARMER_CLETUS },
            ["category"] = u7.Combat
        },
        {
            ["amount"] = 1,
            ["itemType"] = u4.MELON_SEEDS,
            ["price"] = u3:getMelonSeedPrice(p16),
            ["currency"] = u4.EMERALD,
            ["requiresKit"] = { u2.FARMER_CLETUS },
            ["category"] = u7.Combat
        },
        {
            ["customDisplayName"] = "Pumpkin Seeds",
            ["amount"] = 1,
            ["price"] = 60,
            ["itemType"] = u4.PUMPKIN_SEEDS,
            ["currency"] = u4.IRON,
            ["requiresKit"] = { u2.FARMER_CLETUS },
            ["category"] = u7.Combat
        }
    }
end
return {
    ["default"] = u8.new()
}