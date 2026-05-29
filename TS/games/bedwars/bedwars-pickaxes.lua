local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["BedwarsPickaxes"] = {
        v1.WOOD_PICKAXE,
        v1.STONE_PICKAXE,
        v1.IRON_PICKAXE,
        v1.DIAMOND_PICKAXE,
        v1.LASER_PICKAXE
    }
}