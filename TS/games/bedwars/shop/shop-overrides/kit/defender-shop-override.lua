local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "defender", "defender-kit-balance").DefenderKitBalance
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "DefenderShopOverride"
    end,
    ["__index"] = u7
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
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
    --]]
    u7.constructor(p12, {
        ["kit"] = u3.DEFENDER
    })
end
function u9.shouldApply(p13, p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v15 = u6(p14, p13.config.kit)
    if v15 then
        local v16 = p13.config
        if v16 ~= nil then
            v16 = v16.enabled
        end
        v15 = v16 == nil and true or v16
    end
    return v15
end
function u9.getPrice(_, p17) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v18 = p17 * (1 - u4.DefenseBlockDiscount)
    return math.ceil(v18)
end
function u9.getOverride(p19) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u2
    --]]
    return {
        {
            ["amount"] = 16,
            ["itemType"] = u5.WOOL_WHITE,
            ["price"] = p19:getPrice(8),
            ["currency"] = u5.IRON,
            ["category"] = u8.Blocks
        },
        {
            ["amount"] = 16,
            ["itemType"] = u5.STONE_BRICK,
            ["price"] = p19:getPrice(40),
            ["currency"] = u5.IRON,
            ["category"] = u8.Blocks
        },
        {
            ["amount"] = 8,
            ["itemType"] = u5.WOOD_PLANK_OAK,
            ["price"] = p19:getPrice(14),
            ["currency"] = u5.IRON,
            ["category"] = u8.Blocks
        },
        {
            ["amount"] = 4,
            ["itemType"] = u5.BLASTPROOF_CERAMIC,
            ["price"] = p19:getPrice(16),
            ["currency"] = u5.IRON,
            ["category"] = u8.Blocks,
            ["disabledInQueue"] = { u2.TNT_WARS }
        },
        {
            ["amount"] = 4,
            ["itemType"] = u5.OBSIDIAN,
            ["price"] = p19:getPrice(1),
            ["currency"] = u5.EMERALD,
            ["category"] = u8.Blocks,
            ["disabledInQueue"] = { u2.TNT_WARS }
        },
        {
            ["amount"] = 1,
            ["price"] = 50,
            ["itemType"] = u5.TESLA_TRAP,
            ["currency"] = u5.IRON,
            ["category"] = u8.Blocks,
            ["disabledInQueue"] = { u2.SURVIVAL, u2.TNT_WARS, u2.BEDWARS_OG_TO4 }
        }
    }
end
return {
    ["default"] = u9.new()
}