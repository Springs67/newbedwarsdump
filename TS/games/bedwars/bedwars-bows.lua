local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["BedwarsBows"] = {
        v1.WOOD_BOW,
        v1.FALCONER_BOW,
        v1.FEATHER_BOW,
        v1.GOLDEN_BOW,
        v1.WOOD_CROSSBOW,
        v1.OG_WOOD_CROSSBOW,
        v1.FLOWER_CROSSBOW,
        v1.FALCONER_CROSSBOW,
        v1.TACTICAL_CROSSBOW,
        v1.HEADHUNTER,
        v1.FLOWER_HEADHUNTER,
        v1.TACTICAL_HEADHUNTER,
        v1.FALCONER_HEADHUNTER
    }
}