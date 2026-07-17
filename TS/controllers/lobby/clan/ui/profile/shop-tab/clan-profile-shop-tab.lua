-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClanShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-shop").ClanShop;
local ClanUpgradeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type").ClanUpgradeType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ClanProfilePageLayout = RuntimeLib.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local PillCounter = RuntimeLib.import(script, script.Parent.Parent, "war-tab", "pill-counter").PillCounter;
local ClanProfileShop = RuntimeLib.import(script, script.Parent, "clan-profile-shop").ClanProfileShop;

return {
    ClanProfileShopTab = v2.new(u1)(function(p3) -- Line: 12
        -- upvalues: u1 (copy), ClanShop (copy), PillCounter (copy), BedwarsImageId (copy), Empty (copy), ClanUpgradeType (copy), ClanProfileShop (copy), ClanProfilePageLayout (copy)
        local v4 = { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }) };
        local v5 = {
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 20)
        };
        local v6 = {};
        local v7 = {
            Size = UDim2.fromScale(0.65, 1)
        };
        local v8 = { u1.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0.05, 0)
            }) };
        local v9 = #v8;
        local v10 = {
            Icon = ClanShop.ClanShopCurrencyMeta[ClanShop.ClanShopCurrency.CLAN_CONTRIBUTION_COIN].icon
        };
        local clanContributionShop = p3.store.Clans.clanContributionShop;

        if clanContributionShop ~= nil then
            clanContributionShop = clanContributionShop.clanContributionCoins;
        end;

        v10.Amount = clanContributionShop == nil and 0 or clanContributionShop;
        v10.Tooltip = ClanShop.ClanShopCurrencyMeta[ClanShop.ClanShopCurrency.CLAN_CONTRIBUTION_COIN].name;
        v10.FrameProps = {
            LayoutOrder = 1,
            Size = UDim2.new(0, 125, 1, 0)
        };
        v8[v9 + 1] = u1.createElement(PillCounter, v10);
        local v11 = {
            Icon = BedwarsImageId.CLAN_CRYSTAL
        };
        local clanWarCoins = p3.Clan.clanWarCoins;
        v11.Amount = clanWarCoins == nil and 0 or clanWarCoins;
        v11.Tooltip = ClanShop.ClanShopCurrencyMeta[ClanShop.ClanShopCurrency.CLAN_WAR_CRYSTAL].name;
        v11.FrameProps = {
            LayoutOrder = 2,
            Size = UDim2.new(0, 125, 1, 0)
        };
        v8[v9 + 2] = u1.createElement(PillCounter, v11);
        local v12 = {
            Icon = ClanShop.ClanShopCurrencyMeta[ClanShop.ClanShopCurrency.CLAN_COIN].icon
        };
        local myClan = p3.store.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.coins;
        end;

        v12.Amount = myClan == nil and 0 or myClan;
        v12.Tooltip = ClanShop.ClanShopCurrencyMeta[ClanShop.ClanShopCurrency.CLAN_COIN].name;
        v12.FrameProps = {
            LayoutOrder = 3,
            Size = UDim2.new(0, 125, 1, 0)
        };
        v8[v9 + 3] = u1.createElement(PillCounter, v12);
        v6[#v6 + 1] = u1.createElement(Empty, v7, v8);
        v4.Header = u1.createElement(Empty, v5, v6);
        local v13 = {
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 1, -40)
        };
        local v14 = {
            [#v14 + 1] = u1.createElement(ClanProfileShop, {
                ClanShopTier = p3.Clan.upgrades[ClanUpgradeType.SHOP]
            })
        };
        v4[#v4 + 1] = u1.createElement(Empty, v13, v14);

        return u1.createElement(ClanProfilePageLayout, {}, v4);
    end)
};