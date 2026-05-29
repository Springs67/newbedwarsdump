local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.NORMAL = "normal"
v2.normal = "NORMAL"
v3.PURPLE = "purple"
v2.purple = "PURPLE"
v3.HUGE = "huge"
v2.huge = "HUGE"
v3.RAINBOW = "rainbow"
v2.rainbow = "RAINBOW"
v3.COSMIC = "cosmic"
v2.cosmic = "COSMIC"
v3.FLYING = "flying"
v2.flying = "FLYING"
v3.FOOD = "food"
v2.food = "FOOD"
v3.HALLOWEEN = "halloween"
v2.halloween = "HALLOWEEN"
v3.FORGE = "forge"
v2.forge = "FORGE"
v3.MAGICAL_HERO_VILLAIN = "magical_hero_villain"
v2.magical_hero_villain = "MAGICAL_HERO_VILLAIN"
v3.GLITCHED = "glitched"
v2.glitched = "GLITCHED"
v3.NEW_YEARS = "new_years"
v2.new_years = "NEW_YEARS"
return {
    ["LuckyBlockTheme"] = v3,
    ["LuckyBlockThemeToBlock"] = {
        [v3.NORMAL] = v1.LUCKY_BLOCK,
        [v3.PURPLE] = v1.PURPLE_LUCKY_BLOCK,
        [v3.HUGE] = v1.HUGE_LUCKY_BLOCK,
        [v3.RAINBOW] = v1.RAINBOW_LUCKY_BLOCK,
        [v3.COSMIC] = v1.COSMIC_LUCKY_BLOCK,
        [v3.FLYING] = v1.FLYING_LUCKY_BLOCK,
        [v3.FOOD] = v1.FOOD_LUCKY_BLOCK,
        [v3.HALLOWEEN] = v1.HALLOWEEN_LUCKY_BLOCK,
        [v3.FORGE] = v1.FORGE_LUCKY_BLOCK,
        [v3.MAGICAL_HERO_VILLAIN] = v1.MAGICAL_HERO_LUCKY_BLOCK,
        [v3.GLITCHED] = v1.GLITCHED_LUCKY_BLOCK
    }
}