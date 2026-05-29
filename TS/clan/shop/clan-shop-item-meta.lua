local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-border-meta")
local v8 = v7.ClanBorderMeta
local v9 = v7.ClanBorderType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-background-music-meta").getClanHqBackgroundMusicMeta
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-skybox-meta").getClanHqSkyboxMeta
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types")
local v14 = v13.ClanHqBackgroundMusicType
local v15 = v13.ClanHqSkyboxType
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type").ClanUpgradeTier
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-shop").ClanShop
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-shop-items").ClanShopItem
local v19 = {}
local v20 = v3.LEVEL_UP_CRATE
local v21 = {
    ["price"] = 10000,
    ["maxPurchasesPerCycle"] = 1,
    ["name"] = v2(v3.LEVEL_UP_CRATE).displayName,
    ["image"] = v2(v3.LEVEL_UP_CRATE).image,
    ["currency"] = v17.ClanShopCurrency.CLAN_CONTRIBUTION_COIN
}
local v22 = {}
local v23 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v3.LEVEL_UP_CRATE
    }
}
__set_list(v22, 1, {v23})
v21.items = v22
v21.rarityColor = v6(v2(v3.LEVEL_UP_CRATE).rarity).gradient.colorTop
v21.unlockedFromTier = v16.SHOP2
v19[v20] = v21
v19[v18.BED_COIN_200] = {
    ["name"] = "200 Bed Coins",
    ["price"] = 4000,
    ["maxPurchasesPerCycle"] = 1,
    ["image"] = v4.BED_COIN_ICON,
    ["currency"] = v17.ClanShopCurrency.CLAN_CONTRIBUTION_COIN,
    ["items"] = {
        {
            ["bedCoins"] = 200
        }
    },
    ["rarityColor"] = v6(v5.THREE_STAR).gradient.colorTop,
    ["unlockedFromTier"] = v16.SHOP2
}
v19[v18.BED_COIN_300] = {
    ["name"] = "300 Bed Coins",
    ["price"] = 8000,
    ["maxPurchasesPerCycle"] = 1,
    ["image"] = v4.BED_COIN_ICON,
    ["currency"] = v17.ClanShopCurrency.CLAN_CONTRIBUTION_COIN,
    ["items"] = {
        {
            ["bedCoins"] = 300
        }
    },
    ["rarityColor"] = v6(v5.THREE_STAR).gradient.colorTop,
    ["unlockedFromTier"] = v16.SHOP3
}
local v24 = v18.VOID_SKYBOX
local v25 = {
    ["price"] = 20000,
    ["name"] = v12(v15.VOID_SKYBOX).title,
    ["image"] = v12(v15.VOID_SKYBOX).iconId,
    ["currency"] = v17.ClanShopCurrency.CLAN_WAR_CRYSTAL,
    ["items"] = {
        {
            ["clanHqSkybox"] = v15.VOID_SKYBOX
        }
    },
    ["rarityColor"] = v6(v5.THREE_STAR).gradient.colorTop,
    ["unlockedFromTier"] = v16.SHOP1,
    ["minimumPurchaseRank"] = v10.ADMIN
}
v19[v24] = v25
local v26 = v18.S10_LOBBY_MUSIC
local v27 = {
    ["name"] = v11(v14.S10_LOBBY_MUSIC).title
}
local v28 = v11(v14.S10_LOBBY_MUSIC).imageId
if v28 == nil then
    v28 = v4.MUSIC_SOLID
end
v27.image = v28
v27.price = 15000
v27.currency = v17.ClanShopCurrency.CLAN_WAR_CRYSTAL
v27.items = {
    {
        ["clanHqBackgroundMusic"] = v14.S10_LOBBY_MUSIC
    }
}
v27.rarityColor = v6(v5.THREE_STAR).gradient.colorTop
v27.unlockedFromTier = v16.SHOP1
v27.minimumPurchaseRank = v10.ADMIN
v19[v26] = v27
local v29 = v18.VOID_MUSIC
local v30 = {
    ["name"] = v11(v14.VOID_MUSIC).title
}
local v31 = v11(v14.VOID_MUSIC).imageId
if v31 == nil then
    v31 = v4.MUSIC_SOLID
end
v30.image = v31
v30.price = 15000
v30.currency = v17.ClanShopCurrency.CLAN_WAR_CRYSTAL
v30.items = {
    {
        ["clanHqBackgroundMusic"] = v14.VOID_MUSIC
    }
}
v30.rarityColor = v6(v5.THREE_STAR).gradient.colorTop
v30.unlockedFromTier = v16.SHOP1
v30.minimumPurchaseRank = v10.ADMIN
v19[v29] = v30
local v32 = v18.SILVER_CLAN_BORDER
local v33 = {
    ["price"] = 225000,
    ["name"] = v8[v9.SILVER].title,
    ["image"] = v8[v9.SILVER].borderImage,
    ["currency"] = v17.ClanShopCurrency.CLAN_COIN,
    ["items"] = {
        {
            ["clanBorder"] = v9.SILVER
        }
    },
    ["rarityColor"] = v6(v5.THREE_STAR).gradient.colorTop,
    ["unlockedFromTier"] = v16.CLAN_LEVEL6,
    ["minimumPurchaseRank"] = v10.ADMIN
}
v19[v32] = v33
local v34 = v18.GOLD_CLAN_BORDER
local v35 = {
    ["price"] = 500000,
    ["name"] = v8[v9.GOLD].title,
    ["image"] = v8[v9.GOLD].borderImage,
    ["currency"] = v17.ClanShopCurrency.CLAN_COIN,
    ["items"] = {
        {
            ["clanBorder"] = v9.GOLD
        }
    },
    ["rarityColor"] = v6(v5.THREE_STAR).gradient.colorTop,
    ["unlockedFromTier"] = v16.CLAN_LEVEL10,
    ["minimumPurchaseRank"] = v10.ADMIN
}
v19[v34] = v35
return {
    ["ClanShopItemsMeta"] = v19
}