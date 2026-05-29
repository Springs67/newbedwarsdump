local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "studded-map-block-types").StuddedMapBlockTypes
local v4 = {
    [v2.ICE] = {
        ["color"] = Color3.fromRGB(130, 222, 255)
    },
    [v2.SNOW] = {
        ["color"] = Color3.fromRGB(204, 227, 232)
    },
    [v2.ANDESITE] = {
        ["color"] = Color3.fromRGB(79, 82, 87)
    },
    [v2.CLAY] = {
        ["color"] = Color3.fromRGB(153, 135, 181)
    },
    [v2.WOOD_PLANK_SPRUCE] = {
        ["color"] = Color3.fromRGB(112, 69, 43),
        ["surfaces"] = v3.WOOD
    },
    [v2.BARREL] = {
        ["color"] = Color3.fromRGB(143, 92, 61),
        ["surfaces"] = v3.WOOD
    },
    [v2.COPPER_BLOCK] = {
        ["color"] = Color3.fromRGB(184, 115, 51)
    },
    [v2.OAK_LOG] = {
        ["color"] = Color3.fromRGB(97, 66, 43),
        ["surfaces"] = v3.WOOD
    },
    [v2.COBBLESTONE] = {
        ["color"] = Color3.fromRGB(168, 168, 168)
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
    ["PVEIcebergMapBlocks"] = v4
}