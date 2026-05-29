local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "maps", "pirate", "pirate-map").PirateMap
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "SkullIslandItemsShopOverride"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, ...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p10, ...)
end
function u7.shouldApply(_, _) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v11 = u2:GetAttribute("MapName")
    if v11 == nil then
        return false
    else
        return u3.isValidMap(v11)
    end
end
function u7.getOverride(_) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    return {
        {
            ["amount"] = 1,
            ["price"] = 1,
            ["itemType"] = u4.ORANGE,
            ["currency"] = u4.GOLD,
            ["category"] = u6.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 2,
            ["itemType"] = u4.PIRATE_GUNPOWDER_BARREL,
            ["currency"] = u4.GOLD,
            ["category"] = u6.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 5,
            ["itemType"] = u4.TREASURE_CHEST,
            ["currency"] = u4.GOLD,
            ["category"] = u6.Combat
        }
    }
end
return {
    ["default"] = u7.new()
}