local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "black-marketeer", "black-marketeer-constants").BlackMarketShopTier
local v2 = {
    ["COIN_LIFETIME_SEC"] = 20,
    ["BLACK_MARKET_OPEN_SHOP_COOLDOWN"] = 20,
    ["BLACK_MARKET_REROLL_SHOP_COOLDOWN"] = 8,
    ["BLACK_MARKET_NUM_RAND_ITEMS"] = {
        [v1[1]] = 5,
        [v1[2]] = 6,
        [v1[3]] = 7,
        [v1[4]] = 8
    },
    ["BLACK_MARKET_RAND_ITEM_DISCOUNT"] = {
        [v1[1]] = 0.15,
        [v1[2]] = 0.2,
        [v1[3]] = 0.2,
        [v1[4]] = 0.25
    },
    ["BLACK_MARKET_PROFIT_PERCENT"] = 0.2,
    ["FURY_POTION_DURATION"] = 35,
    ["FURY_POTION_ATTACK_SPEED_MULTIPLIER"] = 1.2,
    ["SERPENTS_TOUCH_POTION_DURATION"] = 35
}
return {
    ["BlackMarketeerBalance"] = v2
}