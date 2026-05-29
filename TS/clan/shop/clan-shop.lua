local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v2 = {}
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.CLAN_CONTRIBUTION_COIN = 0
v3[0] = "CLAN_CONTRIBUTION_COIN"
v4.CLAN_WAR_CRYSTAL = 1
v3[1] = "CLAN_WAR_CRYSTAL"
v4.CLAN_COIN = 2
v3[2] = "CLAN_COIN"
v2.ClanShopCurrency = v4
local v5 = {
    [v4.CLAN_CONTRIBUTION_COIN] = {
        ["name"] = "Clan Contribution Coins",
        ["icon"] = v1.CLAN_CP_COIN
    },
    [v4.CLAN_WAR_CRYSTAL] = {
        ["name"] = "Crystals",
        ["icon"] = v1.CLAN_CRYSTAL
    },
    [v4.CLAN_COIN] = {
        ["name"] = "Clan Coins",
        ["icon"] = v1.COIN
    }
}
v2.ClanShopCurrencyMeta = v5
return {
    ["ClanShop"] = v2
}