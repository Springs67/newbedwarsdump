local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["BlackMarketShopTier"] = {
        "TIER0",
        v1.BLACK_MARKET_UPGRADE_1,
        v1.BLACK_MARKET_UPGRADE_2,
        v1.BLACK_MARKET_UPGRADE_3
    }
}