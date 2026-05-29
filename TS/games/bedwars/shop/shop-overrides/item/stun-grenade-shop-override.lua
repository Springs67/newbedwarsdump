local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "StunGrenadeShopOverride"
    end,
    ["__index"] = u4
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, ...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p9, ...)
end
function u6.shouldApply(_, p10) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    return u2.hasEnough(p10, u3.GRENADE_LAUNCHER, 1)
end
function u6.getOverride(_) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    return {
        {
            ["customDisplayName"] = "Stun Grenade",
            ["amount"] = 4,
            ["price"] = 35,
            ["itemType"] = u3.STUN_GRENADE,
            ["currency"] = u3.IRON,
            ["category"] = u5.Combat
        }
    }
end
return {
    ["default"] = u6.new()
}