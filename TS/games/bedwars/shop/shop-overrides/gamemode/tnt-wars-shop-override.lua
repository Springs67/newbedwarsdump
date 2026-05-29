local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "TNTWarsShopOverride"
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
function u8.shouldApply(_, _) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v12 = u2:GetAttribute("GameType")
    if v12 then
        v12 = v12 == u3.TNT_WARS
    end
    return v12
end
function u8.getOverride(_) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u7
    --]]
    return {
        {
            ["price"] = 5,
            ["itemType"] = u5.WOOL_WHITE
        },
        {
            ["price"] = 5,
            ["itemType"] = u5.TNT
        },
        {
            ["price"] = 2,
            ["itemType"] = u5.WOOD_BOW,
            ["currency"] = u5.EMERALD
        },
        {
            ["price"] = 20,
            ["itemType"] = u5.ARROW,
            ["currency"] = u5.IRON
        },
        {
            ["price"] = 1,
            ["itemType"] = u5.FIREBALL,
            ["currency"] = u5.EMERALD
        },
        {
            ["amount"] = 1,
            ["price"] = 40,
            ["itemType"] = u5.MANUAL_CANNON,
            ["currency"] = u5.IRON,
            ["enabledOnlyInQueue"] = { u4.TNT_WARS },
            ["category"] = u7.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 1,
            ["itemType"] = u5.AUTO_CANNON,
            ["currency"] = u5.EMERALD,
            ["enabledOnlyInQueue"] = { u4.TNT_WARS },
            ["category"] = u7.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 5,
            ["itemType"] = u5.SPREAD_CANNON,
            ["currency"] = u5.EMERALD,
            ["enabledOnlyInQueue"] = { u4.TNT_WARS },
            ["category"] = u7.Combat
        },
        {
            ["amount"] = 1,
            ["price"] = 36,
            ["itemType"] = u5.WOOL_BUILDER,
            ["currency"] = u5.IRON,
            ["enabledOnlyInQueue"] = { u4.TNT_WARS },
            ["category"] = u7.Blocks
        },
        {
            ["amount"] = 1,
            ["price"] = 120,
            ["itemType"] = u5.STONE_BRICK_BUILDER,
            ["currency"] = u5.IRON,
            ["enabledOnlyInQueue"] = { u4.TNT_WARS },
            ["category"] = u7.Blocks
        },
        {
            ["amount"] = 1,
            ["price"] = 100,
            ["itemType"] = u5.WOOD_PLANK_OAK_BUILDER,
            ["currency"] = u5.IRON,
            ["enabledOnlyInQueue"] = { u4.TNT_WARS },
            ["category"] = u7.Blocks
        }
    }
end
return {
    ["default"] = u8.new()
}