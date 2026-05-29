local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-shop").ClanShop
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u4 = {}
local v5 = {
    ["name"] = v2.ClanShopCurrencyMeta[v2.ClanShopCurrency.CLAN_WAR_CRYSTAL].name,
    ["icon"] = v2.ClanShopCurrencyMeta[v2.ClanShopCurrency.CLAN_WAR_CRYSTAL].icon,
    ["currencyType"] = {
        ["clanShopCurrency"] = v2.ClanShopCurrency.CLAN_WAR_CRYSTAL
    }
}
u4.ClanWarCrystal = v5
local v6 = {
    ["name"] = v2.ClanShopCurrencyMeta[v2.ClanShopCurrency.CLAN_CONTRIBUTION_COIN].name,
    ["icon"] = v2.ClanShopCurrencyMeta[v2.ClanShopCurrency.CLAN_CONTRIBUTION_COIN].icon,
    ["currencyType"] = {
        ["clanShopCurrency"] = v2.ClanShopCurrency.CLAN_CONTRIBUTION_COIN
    }
}
u4.ClanContributionCoin = v6
u4.BedCoins = {
    ["name"] = "Bed Coins",
    ["icon"] = v3.BED_COIN_ICON,
    ["currencyType"] = {
        ["bedCoins"] = true
    }
}
return {
    ["AUCTION_BID_CURRENCIES_META"] = u4,
    ["getAuctionBidCurrencyMeta"] = function(p7) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p7]
    end
}