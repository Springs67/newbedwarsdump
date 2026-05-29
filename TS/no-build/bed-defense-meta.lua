local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {}
local v3 = {
    ["layers"] = { v1.WOOL_WHITE },
    ["cost"] = {
        ["amount"] = 0,
        ["itemType"] = v1.IRON
    }
}
local v4 = {
    ["layers"] = { v1.WOOD_PLANK_OAK },
    ["cost"] = {
        ["amount"] = 16,
        ["itemType"] = v1.IRON
    }
}
local v5 = {
    ["layers"] = { v1.WOOD_PLANK_OAK, v1.WOOL_WHITE },
    ["cost"] = {
        ["amount"] = 20,
        ["itemType"] = v1.IRON
    }
}
local v6 = {
    ["layers"] = { v1.WOOD_PLANK_OAK, v1.STONE_BRICK },
    ["cost"] = {
        ["amount"] = 40,
        ["itemType"] = v1.IRON
    }
}
local v7 = {
    ["layers"] = { v1.WOOD_PLANK_OAK, v1.STONE_BRICK, v1.BLASTPROOF_CERAMIC },
    ["cost"] = {
        ["amount"] = 80,
        ["itemType"] = v1.IRON
    }
}
__set_list(v2, 1, {v3, v4, v5, v6, v7})
return {
    ["BedDefenseMeta"] = v2
}