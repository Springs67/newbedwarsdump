local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "studded-map-block-types").StuddedMapBlockTypes
local v4 = {
    [v2.GRASS] = {
        ["color"] = Color3.fromRGB(23, 140, 20),
        ["surfaces"] = v3.LEAVES
    },
    [v2.STONE] = {
        ["color"] = Color3.fromRGB(107, 107, 107)
    },
    [v2.SAND] = {
        ["color"] = Color3.fromRGB(217, 194, 163)
    },
    [v2.CLAY_LIGHT_BROWN] = {
        ["color"] = Color3.fromRGB(158, 110, 64)
    },
    [v2.WOOL_WHITE] = {
        ["color"] = Color3.fromRGB(255, 255, 255)
    },
    [v2.WOOL_RED] = {
        ["color"] = Color3.fromRGB(255, 69, 69),
        ["surfaces"] = v3.WOOL
    },
    [v2.SANDSTONE] = {
        ["color"] = Color3.fromRGB(209, 163, 64)
    },
    [v2.SNOW] = {
        ["color"] = Color3.fromRGB(199, 237, 250)
    },
    [v2.WOOD_PLANK_SPRUCE] = {
        ["color"] = Color3.fromRGB(112, 87, 36),
        ["surfaces"] = v3.WOOD
    },
    [v2.COBBLESTONE] = {
        ["color"] = Color3.fromRGB(168, 168, 168)
    },
    [v2.CLAY_DARK_GREEN] = {
        ["color"] = Color3.fromRGB(101, 140, 101),
        ["surfaces"] = v3.LEAVES
    },
    [v2.SPRUCE_LOG] = {
        ["color"] = Color3.fromRGB(69, 56, 20),
        ["surfaces"] = v3.WOOD
    },
    [v2.CLAY_GREEN] = {
        ["color"] = Color3.fromRGB(101, 140, 101),
        ["surfaces"] = v3.LEAVES
    },
    [v2.ICE] = {
        ["color"] = Color3.fromRGB(130, 222, 255)
    },
    [v2.WOOL_BLUE] = {
        ["color"] = Color3.fromRGB(48, 54, 237),
        ["surfaces"] = v3.WOOL
    },
    [v2.WOOL_YELLOW] = {
        ["color"] = Color3.fromRGB(250, 217, 43),
        ["surfaces"] = v3.WOOL
    },
    [v2.WOOL_GREEN] = {
        ["color"] = Color3.fromRGB(48, 237, 69),
        ["surfaces"] = v3.WOOL
    }
}
return {
    ["PVETropicaMapBlocks"] = v4
}