local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "WarriorShopOverride"
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
        ["kit"] = u5.WARRIOR
    })
end
function u8.shouldApply(p12, p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v14 = u3(p13, p12.config.kit)
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
        [1] = u2
        [2] = u4
        [3] = u7
    --]]
    return {
        {
            ["itemType"] = u2.IRON_CHESTPLATE,
            ["nextTier"] = u2.WARRIOR_CHESTPLATE
        },
        {
            ["customDisplayName"] = "Warrior Armor",
            ["amount"] = 1,
            ["price"] = 8,
            ["tiered"] = true,
            ["itemType"] = u2.WARRIOR_CHESTPLATE,
            ["currency"] = u2.EMERALD,
            ["spawnWithItems"] = u4.WARRIOR,
            ["category"] = u7.Combat,
            ["nextTier"] = u2.EMERALD_CHESTPLATE
        }
    }
end
return {
    ["default"] = u8.new()
}