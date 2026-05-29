local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-class").PvPArenaAugmentClass
local u4 = {
    [v3.STAT] = {
        ["image"] = v2.PVP_ARENA_STAT_AUGMENT_ICON
    },
    [v3.ABILITY] = {
        ["image"] = v2.PVP_ARENA_ABILITY_AUGMENT_ICON
    },
    [v3.ENCHANT] = {
        ["image"] = v2.PVP_ARENA_ENCHANT_AUGMENT_ICON
    },
    [v3.ITEM] = {
        ["image"] = v2.PVP_ARENA_ITEM_AUGMENT_ICON
    },
    [v3.PASSIVE] = {
        ["image"] = v2.PVP_ARENA_PASSIVE_AUGMENT_ICON
    }
}
return {
    ["getPvpArenaAugmentClassMeta"] = function(p5) --[[ Name: getPvpArenaAugmentClassMeta, Line 22 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p5]
    end
}