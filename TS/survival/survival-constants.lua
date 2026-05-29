local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "studded-map-block-types").StuddedMapBlockTypes
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "studded-map-blocks", "pve-iceberg-map-blocks").PVEIcebergMapBlocks
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "studded-map-blocks", "pve-tropical-map-blocks").PVETropicaMapBlocks
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "SurvivalConstants"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 20 ]] end
u7.COMBO_BOOST_AMOUNT = 5
u7.COMBO_COOLDOWN = 10
u7.COMBO_ATTACK_MULTIPLIER = 1.3
u7.INTERMISSION_TIME = v2:IsStudio() and 20 or 40
u7.WAVE_TIME = 45
function u7.PENGUIN_HEALTH_SCALE(p10) --[[ Line: 27 ]]
    return 1 + (p10 - 1) / 10 * 2
end
function u7.PENGUIN_DAMAGE_SCALE(p11) --[[ Line: 30 ]]
    return 1 + (p11 - 1) / 10 * 1.75
end
function u7.PENGUIN_WALK_SPEED_SCALE(p12) --[[ Line: 33 ]]
    return 1 + (p12 - 1) / 10 / 2
end
function u7.PLAYERS_ALIVE_SCALE_RATIO(p13) --[[ Line: 36 ]]
    return math.max(p13, 2) / 5
end
function u7.CRATES_PER_WAVE(p14) --[[ Line: 39 ]]
    return 12 + (p14 - 1)
end
function u7.IRON_PER_WAVE(p15) --[[ Line: 42 ]]
    return 1 + (p15 - 1) * 10
end
u7.DECAY_DEBRIS_PERCENT = 0.25
u7.BLOCKS_TO_DESTROY_PER_TICK = 40
u7.DESTROY_BLOCKS_PER_TICK_SECONDS = 0.25
u7.BASE_BED_HEALTH = 300
u7.BED_HEALTH_UPGRADE_I = 100
u7.BED_HEALTH_UPGRADE_II = 100
u7.BED_HEALTH_UPGRADE_III = 100
u7.MAX_ALIVE_PENGUINS = 35
u7.PENGUIN_LIFE_TIME = 150
u7.STUDDED_MAP_BLOCKS = {
    ["pve_Tropica"] = v6,
    ["pve_Iceberg"] = v5
}
u7.STUDDED_SHOP_BLOCKS = {
    [v3.WOOL_BLUE] = {
        ["color"] = Color3.fromRGB(77, 77, 255),
        ["surfaces"] = v4.WOOL
    },
    [v3.STONE_BRICK] = {
        ["color"] = Color3.fromRGB(120, 120, 120)
    },
    [v3.OBSIDIAN] = {
        ["color"] = Color3.fromRGB(38, 18, 54)
    },
    [v3.WOOD_PLANK_OAK] = {
        ["color"] = Color3.fromRGB(222, 163, 110),
        ["surfaces"] = v4.WOOD
    },
    [v3.BLASTPROOF_CERAMIC] = {
        ["color"] = Color3.fromRGB(194, 94, 51)
    }
}
return {
    ["SurvivalConstants"] = u7
}