local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "PvPArenaFlowerBowShopOverride"
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
        [1] = u2
        [2] = u3
        [3] = u4
    --]]
    if u2:GetAttribute("GameType") ~= u3.PVP_ARENA then
        return false
    end
    local v13 = p12:GetAttribute(u4.FLOWER_BOW)
    return v13 ~= 0 and (v13 == v13 and (v13 ~= "" and v13)) and true or false
end
function u8.getOverride(_, _, _) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
    --]]
    return {
        {
            ["amount"] = 1,
            ["price"] = 5000,
            ["itemType"] = u5.FLOWER_CROSSBOW,
            ["currency"] = u5.GOLD,
            ["category"] = u7.Combat,
            ["nextTier"] = u5.FLOWER_HEADHUNTER,
            ["replaceItem"] = u5.WOOD_CROSSBOW
        },
        {
            ["amount"] = 1,
            ["price"] = 5000,
            ["tiered"] = true,
            ["itemType"] = u5.FLOWER_HEADHUNTER,
            ["currency"] = u5.GOLD,
            ["category"] = u7.Combat,
            ["prevTier"] = u5.FLOWER_CROSSBOW,
            ["replaceItem"] = u5.HEADHUNTER
        }
    }
end
return {
    ["default"] = u8.new()
}