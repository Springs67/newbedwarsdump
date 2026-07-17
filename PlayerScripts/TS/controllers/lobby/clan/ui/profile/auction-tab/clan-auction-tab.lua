-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getAuctionBidCurrencyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-bid-currencies").getAuctionBidCurrencyMeta;
local AuctionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").AuctionType;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanProfilePageLayout = RuntimeLib.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local PillCounter = RuntimeLib.import(script, script.Parent.Parent, "war-tab", "pill-counter").PillCounter;
local ClanAuction = RuntimeLib.import(script, script.Parent, "clan-auction").ClanAuction;
local ClanAuctionSubTabButton = RuntimeLib.import(script, script.Parent, "clan-auction-sub-tab-button").ClanAuctionSubTabButton;
local v6 = {};
local u7 = setmetatable({}, {
    __index = v6
});
u7.PERSONAL = 0;
v6[0] = "PERSONAL";
u7.CLAN = 1;
v6[1] = "CLAN";
u7.MY_AUCTIONS = 2;
v6[2] = "MY_AUCTIONS";
local u8 = {
    [u7.PERSONAL] = {
        Text = "Personal",
        Icon = "rbxassetid://7173696651904",
        Index = 0,
        AuctionTabType = AuctionType.ClanIndividual
    },
    [u7.CLAN] = {
        Text = "Clan",
        Icon = "rbxassetid://7173696651904",
        Index = 1,
        AuctionTabType = AuctionType.Clan
    },
    [u7.MY_AUCTIONS] = {
        Text = "My Auctions",
        Icon = "rbxassetid://7173696651904",
        Index = 3,
        AuctionTabType = "My Auctions"
    }
};

local function v46(p9, p10) -- Line: 56
    -- upvalues: u7 (ref), u2 (copy), u8 (copy), RunService (copy), DeviceUtil (copy), LoggerProvider (copy), default (copy), u3 (copy), ClientStore (copy), u4 (copy), ClanAuctionSubTabButton (copy), Theme (copy), ColorUtil (copy), Empty (copy), getAuctionBidCurrencyMeta (copy), PillCounter (copy), ClanAuction (copy), ClanProfilePageLayout (copy)
    local useMemo = p10.useMemo;
    local useEffect = p10.useEffect;
    local u11, u12 = p10.useState(u7.PERSONAL);
    local v14 = useMemo(function() -- Line: 61
        -- upvalues: u2 (ref), u8 (ref), u11 (copy)
        local function _(p13) -- Line: 63
            -- upvalues: u11 (ref)
            return p13.Index == u11;
        end;

        for i, v in u2.values(u8) do
            local _ = i - 1;

            if v.Index == u11 == true then
                return v;
            end;
        end;

        return nil;
    end, { u11 });
    useEffect(function() -- Line: 77
        -- upvalues: RunService (ref), DeviceUtil (ref), LoggerProvider (ref), default (ref), u3 (ref), ClientStore (ref)
        if not RunService:IsClient() or DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local u15 = false;
        local u16 = nil;
        task.defer(function() -- Line: 83
            -- upvalues: u15 (ref), LoggerProvider (ref), default (ref), u3 (ref), ClientStore (ref), u16 (ref)
            if u15 then
                return nil;
            end;

            local u17 = LoggerProvider.getLogger("ClanAuctionTab");
            u17:Debug("Getting all auction info...");
            default.Client:Get("GetAllAuctionInfo"):CallServerAsync():andThen(function(p18) -- Line: 90
                -- upvalues: u15 (ref), u17 (copy), u3 (ref), ClientStore (ref)
                if u15 then
                    return nil;
                end;

                u17:Debug("Setting auctions", u3(p18.auctions));
                ClientStore:dispatch({
                    type = "ClanSetAuctions",
                    auctions = p18.auctions
                });
                u17:Debug("Setting auction items", u3(p18.auctionItems));
                ClientStore:dispatch({
                    type = "ClanSetAuctionItems",
                    auctionItems = p18.auctionItems
                });
            end);
            default.Client:Get("GetAllAuctionBids"):CallServerAsync():andThen(function(p19) -- Line: 106
                -- upvalues: u15 (ref), u17 (copy), u3 (ref), ClientStore (ref)
                if u15 then
                    return nil;
                end;

                u17:Debug("Setting winning auction bids", u3(p19));
                ClientStore:dispatch({
                    type = "ClanSetWinningAuctionBids",
                    winningAuctionBids = p19.winningAuctionBids
                });
                ClientStore:dispatch({
                    type = "ClanSetAllAuctionBidIds",
                    allAuctionBidIds = p19.allAuctionBidIds
                });
            end);
            u16 = default.Client:Get("SendAuctionUpdate"):Connect(function(p20) -- Line: 120
                -- upvalues: u17 (copy), u3 (ref), ClientStore (ref)
                u17:Debug("Recieved auction update", u3(p20));
                ClientStore:dispatch({
                    type = "ClanSetAuctions",
                    auctions = p20.updatedAuctions
                });
                local updatedAuctionItems = p20.updatedAuctionItems;

                local function _(p21) -- Line: 132
                    return { p21.id, p21 };
                end;

                local v22 = table.create(#updatedAuctionItems);
                local v23 = {
                    type = "ClanSetAuctionItems"
                };

                for i, v in updatedAuctionItems do
                    local _ = i - 1;
                    v22[i] = { v.id, v };
                end;

                local v24 = {};

                for _, v in v22 do
                    v24[v[1]] = v[2];
                end;

                v23.auctionItems = v24;
                ClientStore:dispatch(v23);
            end);
        end);

        return function() -- Line: 149
            -- upvalues: u15 (ref), u16 (ref), default (ref), LoggerProvider (ref)
            u15 = true;
            local v25 = u16;

            if v25 ~= nil then
                v25:Disconnect();
            end;

            task.defer(function() -- Line: 155
                -- upvalues: default (ref), LoggerProvider (ref)
                default.Client:Get("UnregisterForAuctionUpdates"):CallServer();
                LoggerProvider.getLogger("ClanAuctionTab"):Debug("Unregistered auction updates.");
            end);
        end;
    end, {});
    local v26 = { u4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            Padding = UDim.new(0, 6),
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v27 = {
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0, 25)
    };
    local v28 = { u4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local _ = #v28;
    local v29 = table.create(4, "");

    local function v35(p30, u31) -- Line: 183
        -- upvalues: u2 (ref), u8 (ref), u4 (ref), ClanAuctionSubTabButton (ref), Theme (ref), ColorUtil (ref), u11 (copy), u12 (copy), Empty (ref)
        local function _(p32) -- Line: 185
            -- upvalues: u31 (copy)
            return p32.Index == u31;
        end;

        local v33 = nil;

        for i, v in u2.values(u8) do
            local _ = i - 1;

            if v.Index == u31 == true then
                v33 = v;
                break;
            end;
        end;

        local v34 = UDim2.new(0.25, -2, 1, 0);

        if v33 then
            return u4.createFragment({
                [tostring(u31)] = u4.createElement(ClanAuctionSubTabButton, {
                    Size = v34,
                    Text = v33.Text,
                    BackgroundColor3 = Theme.backgroundTertiary,
                    TextColor3 = ColorUtil.WHITE,
                    Tab = u31,
                    ActiveTab = u11,
                    SetTab = u12,
                    LayoutOrder = u31
                })
            });
        end;

        return u4.createFragment({
            [tostring(u31)] = u4.createElement(Empty, {
                Size = v34,
                LayoutOrder = u31
            })
        });
    end;

    local v36 = table.create(#v29);

    for i, v in v29 do
        v36[i] = v35(v, i - 1, v29);
    end;

    local v37 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.6, 1)
    };
    local v38 = { u4.createElement("UIListLayout", {
            HorizontalFlex = "SpaceBetween",
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 2),
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }), u4.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 6)
        }) };
    local v39 = #v38;

    for i, v in v36 do
        v38[v39 + i] = v;
    end;

    v28.Tabs = u4.createElement(Empty, v37, v38);
    local v40 = {
        LayoutOrder = 2,
        Size = UDim2.new(0.4, 0, 0, 20)
    };
    local v41 = { u4.createElement("UIListLayout", {
            HorizontalFlex = "SpaceBetween",
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }) };
    local v42 = #v41;
    local v43 = {
        Icon = getAuctionBidCurrencyMeta("ClanContributionCoin").icon
    };
    local clanContributionShop = p9.store.Clans.clanContributionShop;

    if clanContributionShop ~= nil then
        clanContributionShop = clanContributionShop.clanContributionCoins;
    end;

    v43.Amount = clanContributionShop == nil and 0 or clanContributionShop;
    v43.Tooltip = getAuctionBidCurrencyMeta("ClanContributionCoin").name;
    v43.FrameProps = {
        LayoutOrder = 1,
        Size = UDim2.new(0.48, 0, 1, 0)
    };
    v41[v42 + 1] = u4.createElement(PillCounter, v43);
    local v44 = {
        Icon = getAuctionBidCurrencyMeta("ClanWarCrystal").icon
    };
    local clanWarCoins = p9.Clan.clanWarCoins;
    v44.Amount = clanWarCoins == nil and 0 or clanWarCoins;
    v44.Tooltip = getAuctionBidCurrencyMeta("ClanWarCrystal").name;
    v44.FrameProps = {
        LayoutOrder = 2,
        Size = UDim2.new(0.48, 0, 1, 0)
    };
    v41[v42 + 2] = u4.createElement(PillCounter, v44);
    v28.Currency = u4.createElement(Empty, v40, v41);
    v26.Header = u4.createElement(Empty, v27, v28);
    local v45 = {
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 1, -40)
    };

    if v14 ~= nil then
        v14 = v14.AuctionTabType;
    end;

    v45.AuctionTabType = v14;
    v26[#v26 + 1] = u4.createElement(ClanAuction, v45);

    return u4.createElement(ClanProfilePageLayout, {}, v26);
end;

return {
    ClanProfileAuctionTab = v5.new(u4)(v46)
};