local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {
    ["POISON_SWORD_CHANCE"] = 25,
    ["SHOP_REBATE_PERCENTAGE"] = 0.15,
    ["RECYCLE_CHANCE"] = {
        [v1.TELEPEARL] = 20,
        [v1.GLUE_PROJECTILE] = 20,
        [v1.FIREBALL] = 10
    },
    ["DEFAULT_RECYCLE_CHANCE"] = 25,
    ["SNAKE_AGILITY_SPEED_MULTIPLIER"] = 1.5
}
return {
    ["TeamBuffBalance"] = v2
}