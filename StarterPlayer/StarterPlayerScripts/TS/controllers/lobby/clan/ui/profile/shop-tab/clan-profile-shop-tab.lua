local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-shop").ClanShop
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type").ClanUpgradeType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout
local u9 = v1.import(script, script.Parent.Parent, "war-tab", "pill-counter").PillCounter
local u10 = v1.import(script, script.Parent, "clan-profile-shop").ClanProfileShop
return {
    ["ClanProfileShopTab"] = v4.new(u3)(function(p11) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u9
            [4] = u7
            [5] = u2
            [6] = u6
            [7] = u10
            [8] = u8
        --]]
        local v12 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v13 = #v12
        local v14 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 20)
        }
        local v15 = {}
        local v16 = #v15
        local v17 = {
            ["Size"] = UDim2.fromScale(0.65, 1)
        }
        local v18 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v19 = #v18
        local v20 = {
            ["Icon"] = u5.ClanShopCurrencyMeta[u5.ClanShopCurrency.CLAN_CONTRIBUTION_COIN].icon
        }
        local v21 = p11.store.Clans.clanContributionShop
        if v21 ~= nil then
            v21 = v21.clanContributionCoins
        end
        v20.Amount = v21 == nil and 0 or v21
        v20.Tooltip = u5.ClanShopCurrencyMeta[u5.ClanShopCurrency.CLAN_CONTRIBUTION_COIN].name
        v20.FrameProps = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0, 125, 1, 0)
        }
        v18[v19 + 1] = u3.createElement(u9, v20)
        local v22 = {
            ["Icon"] = u7.CLAN_CRYSTAL
        }
        local v23 = p11.Clan.clanWarCoins
        v22.Amount = v23 == nil and 0 or v23
        v22.Tooltip = u5.ClanShopCurrencyMeta[u5.ClanShopCurrency.CLAN_WAR_CRYSTAL].name
        v22.FrameProps = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0, 125, 1, 0)
        }
        v18[v19 + 2] = u3.createElement(u9, v22)
        local v24 = {
            ["Icon"] = u5.ClanShopCurrencyMeta[u5.ClanShopCurrency.CLAN_COIN].icon
        }
        local v25 = p11.store.Clans.myClan
        if v25 ~= nil then
            v25 = v25.coins
        end
        v24.Amount = v25 == nil and 0 or v25
        v24.Tooltip = u5.ClanShopCurrencyMeta[u5.ClanShopCurrency.CLAN_COIN].name
        v24.FrameProps = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(0, 125, 1, 0)
        }
        v18[v19 + 3] = u3.createElement(u9, v24)
        v15[v16 + 1] = u3.createElement(u2, v17, v18)
        v12.Header = u3.createElement(u2, v14, v15)
        local v26 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 1, -40)
        }
        local v27 = {}
        local v28 = #v27
        local v29 = {
            ["ClanShopTier"] = p11.Clan.upgrades[u6.SHOP]
        }
        v27[v28 + 1] = u3.createElement(u10, v29)
        v12[v13 + 1] = u3.createElement(u2, v26, v27)
        return u3.createElement(u8, {}, v12)
    end)
}