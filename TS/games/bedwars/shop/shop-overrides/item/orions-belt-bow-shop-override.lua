local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "OrionsBeltBowShopOverride"
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
function u8.constructor(p11, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11, ...)
end
function u8.shouldApply(_, p12) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    return u4.hasEnough(p12, u5.ORIONS_BELT_BOW, 1)
end
function u8.getOverride(_) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u5
        [4] = u7
    --]]
    local v13 = u2:GetAttribute("GameType")
    return v13 and v13 == u3.SURVIVAL and {
        {
            ["amount"] = 24,
            ["price"] = 2,
            ["itemType"] = u5.STAR,
            ["currency"] = u5.EMERALD,
            ["category"] = u7.Combat
        }
    } or {
        {
            ["amount"] = 6,
            ["price"] = 18,
            ["itemType"] = u5.STAR,
            ["currency"] = u5.IRON,
            ["category"] = u7.Combat
        }
    }
end
return {
    ["default"] = u8.new()
}