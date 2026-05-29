local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "SurvivalShopOverride"
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
    return v12 and v12 == u3.SURVIVAL and true or false
end
function u8.getOverride(_) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u4
    --]]
    return {
        {
            ["price"] = 3,
            ["itemType"] = u5.WOOL_WHITE
        },
        {
            ["price"] = 15,
            ["itemType"] = u5.STONE_BRICK
        },
        {
            ["price"] = 10,
            ["itemType"] = u5.WOOD_PLANK_OAK
        },
        {
            ["amount"] = 1,
            ["price"] = 20,
            ["itemType"] = u5.TEAM_DOOR,
            ["currency"] = u5.IRON,
            ["category"] = u7.Blocks,
            ["enabledOnlyInQueue"] = { u4.SURVIVAL }
        },
        {
            ["amount"] = 8,
            ["price"] = 40,
            ["itemType"] = u5.SPIKE_TRAP,
            ["currency"] = u5.IRON,
            ["category"] = u7.Blocks,
            ["enabledOnlyInQueue"] = { u4.SURVIVAL, u4.INFECTED }
        },
        {
            ["amount"] = 1,
            ["price"] = 2,
            ["itemType"] = u5.AUTO_TURRET,
            ["currency"] = u5.EMERALD,
            ["category"] = u7.Blocks,
            ["enabledOnlyInQueue"] = { u4.SURVIVAL }
        },
        {
            ["amount"] = 1,
            ["price"] = 2,
            ["itemType"] = u5.SHOCK_WAVE_TURRET,
            ["currency"] = u5.EMERALD,
            ["category"] = u7.Blocks,
            ["enabledOnlyInQueue"] = { u4.SURVIVAL }
        },
        {
            ["amount"] = 1,
            ["price"] = 2,
            ["itemType"] = u5.HEALING_TURRET,
            ["currency"] = u5.EMERALD,
            ["category"] = u7.Blocks,
            ["enabledOnlyInQueue"] = { u4.SURVIVAL }
        },
        {
            ["amount"] = 1,
            ["price"] = 90,
            ["itemType"] = u5.FIREBALL,
            ["currency"] = u5.IRON,
            ["category"] = u7.Combat,
            ["enabledOnlyInQueue"] = { u4.SURVIVAL }
        }
    }
end
return {
    ["default"] = u8.new()
}