-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local AuctionTypeMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").AuctionTypeMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanAuctionItemInfoCard = RuntimeLib.import(script, script.Parent, "clan-auction-item-info-card").ClanAuctionItemInfoCard;
local ClanAuctionItemShop = RuntimeLib.import(script, script.Parent, "clan-auction-item-shop").ClanAuctionItemShop;
local v45 = v3.new(u2)(function(u5, p6) -- Line: 15
    -- upvalues: DeviceUtil (copy), OfflinePlayerUtil (copy), Players (copy), AuctionTypeMeta (copy), u2 (copy), ClanAuctionItemShop (copy), Theme (copy), ClanAuctionItemInfoCard (copy), Empty (copy)
    local useState = p6.useState;
    local useMemo = p6.useMemo;
    local u7;

    if DeviceUtil.isHoarceKat() then
        u7 = OfflinePlayerUtil.Dummy.Bryan3838.userId;
    else
        u7 = Players.LocalPlayer;

        if u7 ~= nil then
            u7 = u7.UserId;
        end;
    end;

    local u28 = useMemo(function() -- Line: 29
        -- upvalues: u5 (copy), u7 (copy), AuctionTypeMeta (ref)
        local v8 = {};
        local v9 = #v8;
        local v10 = u5.AllAuctionBidIds or {};
        local v11 = #v10;
        table.move(v10, 1, v11, v9 + 1, v8);
        local v12 = u5.ClanAllAuctionBidIds or {};
        table.move(v12, 1, #v12, v9 + v11 + 1, v8);
        local u13 = {};
        local u14 = {};

        for _, v in v8 do
            u13[v] = true;
        end;

        local function u19(p15) -- Line: 44
            -- upvalues: u7 (ref), u5 (ref)
            local function _(p16) -- Line: 46
                -- upvalues: u7 (ref), u5 (ref)
                local v17;

                if p16.bidderId.kind == "Player" and (u7 ~= nil and p16.bidderId.id == u7) then
                    v17 = true;
                elseif p16.bidderId.kind == "Clan" then
                    v17 = p16.bidderId.id == u5.MyClanId;
                else
                    v17 = false;
                end;

                return v17;
            end;

            for i, v in p15.winningBids do
                local _ = i - 1;
                local v18;

                if v.bidderId.kind == "Player" and (u7 ~= nil and v.bidderId.id == u7) then
                    v18 = true;
                elseif v.bidderId.kind == "Clan" then
                    v18 = v.bidderId.id == u5.MyClanId;
                else
                    v18 = false;
                end;

                if v18 == true then
                    return v;
                end;
            end;

            return nil;
        end;

        local Auctions = u5.Auctions;

        if Auctions ~= nil then
            local function v27(p20) -- Line: 62
                -- upvalues: u5 (ref), u19 (copy), u13 (copy), AuctionTypeMeta (ref), u14 (copy)
                if u5.AuctionTabType == nil then
                    return nil;
                end;

                if u5.AuctionTabType ~= "My Auctions" and p20.auctionType ~= u5.AuctionTabType then
                    return nil;
                end;

                local u21 = {};
                local u22 = {};
                local activeItemsIds = p20.activeItemsIds;

                local function v26(p23) -- Line: 72
                    -- upvalues: u5 (ref), u19 (ref), u13 (ref), u21 (copy), u22 (copy)
                    local AuctionItems = u5.AuctionItems;

                    if AuctionItems ~= nil then
                        AuctionItems = AuctionItems[p23];
                    end;

                    if AuctionItems == nil then
                        return nil;
                    end;

                    local v24 = u19(AuctionItems) ~= nil;
                    local v25 = u13[AuctionItems.id] ~= nil;

                    if u5.AuctionTabType == "My Auctions" and not (v24 or v25) then
                        return nil;
                    end;

                    table.insert(u21, p23);

                    if u5.AuctionTabType == "My Auctions" and (v25 and not v24) then
                        table.insert(u22, p23);
                    end;
                end;

                for i, v in activeItemsIds do
                    v26(v, i - 1, activeItemsIds);
                end;

                if #u21 > 0 then
                    u14[p20.id] = {
                        Name = AuctionTypeMeta[p20.auctionType].name .. " Auctions",
                        AuctionId = p20.id,
                        AuctionItemIds = u21,
                        OutbidAuctionItemIds = u22
                    };
                end;
            end;

            for i, v in Auctions do
                v27(v, i - 1, Auctions);
            end;
        end;

        return u14;
    end, {
        u5.Auctions,
        u5.AuctionItems,
        u5.AuctionTabType,
        u5.MyClanId,
        u5.AllAuctionBidIds,
        u5.ClanAllAuctionBidIds,
        u7
    });
    local u29, v30 = useState(nil);
    local v31 = useMemo(function() -- Line: 116
        -- upvalues: u5 (copy)
        return u5.Auctions or {};
    end, { u5.Auctions });
    local v32 = useMemo(function() -- Line: 119
        -- upvalues: u5 (copy)
        return u5.AuctionItems or {};
    end, { u5.AuctionItems });
    local u35 = useMemo(function() -- Line: 122
        -- upvalues: u29 (copy), u28 (copy)
        if u29 == nil then
            return nil;
        end;

        local u33 = nil;

        local function _(p34) -- Line: 127
            -- upvalues: u33 (ref), u29 (ref)
            if u33 ~= nil then
                return nil;
            end;

            local AuctionItemIds = p34.AuctionItemIds;

            if AuctionItemIds ~= nil then
                AuctionItemIds = table.find(AuctionItemIds, u29) ~= nil;
            end;

            if AuctionItemIds then
                u33 = p34;
            end;
        end;

        for _, v in u28 do
            if u33 == nil then
                local AuctionItemIds = v.AuctionItemIds;

                if AuctionItemIds ~= nil then
                    AuctionItemIds = table.find(AuctionItemIds, u29) ~= nil;
                end;

                if AuctionItemIds then
                    u33 = v;
                end;
            end;
        end;

        if u33 == nil then
            return nil;
        end;

        return u33;
    end, { u29, u28 });
    local v37 = useMemo(function() -- Line: 147
        -- upvalues: u28 (copy), u5 (copy)
        local v36 = {
            {
                Name = "Active Auctions",
                Kind = {
                    ActiveAuctions = u28
                }
            }
        };

        if u5.AuctionTabType == "My Auctions" then
            table.insert(v36, {
                Name = "Winning Auctions",
                Kind = {
                    PastAuctions = u5.WinningAuctionBids
                }
            });
        end;

        return v36;
    end, { u5.AuctionTabType, u5.WinningAuctionBids, u28 });
    local v38 = {};

    for i, v in u5 do
        v38[i] = v;
    end;

    v38.MyClanId = nil;
    v38.ClanCoins = nil;
    v38.ClanContributionCoins = nil;
    v38.WinningAuctionBids = nil;
    v38.AllAuctionBidIds = nil;
    v38.ClanAllAuctionBidIds = nil;
    v38.AuctionTabType = nil;
    v38.Auctions = nil;
    v38.AuctionItems = nil;
    local v39 = {};

    for i, v in v38 do
        v39[i] = v;
    end;

    local v40 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }), u2.createElement(ClanAuctionItemShop, {
            LayoutOrder = 0,
            Size = UDim2.fromScale(0.6, 1),
            AuctionGroups = v37,
            ActiveAuctionItemId = u29,
            SetActiveAuctionItemId = v30,
            MyClanId = u5.MyClanId,
            BidderUserId = u7,
            Auctions = v31,
            AuctionItems = v32
        }) };
    local v41 = {
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.4, 1),
        BackgroundColor3 = Theme.backgroundPrimary,
        MyClanId = u5.MyClanId,
        BidderUserId = u7
    };
    local Auctions = u5.Auctions;

    if Auctions ~= nil then
        local function _(p42) -- Line: 214
            -- upvalues: u35 (copy)
            local v43 = u35;

            if v43 ~= nil then
                v43 = v43.AuctionId;
            end;

            return p42.id == v43;
        end;

        Auctions = nil;

        for i, v in Auctions do
            local _ = i - 1;
            local v44;

            if u35 == nil then
                v44 = u35;
            else
                v44 = u35.AuctionId;
            end;

            if v.id == v44 == true then
                Auctions = v;
                break;
            end;
        end;
    end;

    v41.Auction = Auctions;
    local AuctionItems = u5.AuctionItems;

    if AuctionItems ~= nil then
        AuctionItems = AuctionItems[u29];
    end;

    v41.AuctionItem = AuctionItems;
    v40[#v40 + 1] = u2.createElement(ClanAuctionItemInfoCard, v41);

    return u2.createFragment({
        ClanAuction = u2.createElement(Empty, v39, v40)
    });
end);

return {
    ClanAuction = v4.connect(function(p46, p47) -- Line: 245
        local v48 = {};

        for i, v in p47 do
            v48[i] = v;
        end;

        v48.MyClanId = p46.Clans.myClanId;
        local myClan = p46.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.coins;
        end;

        v48.ClanCoins = myClan;
        local clanContributionShop = p46.Clans.clanContributionShop;

        if clanContributionShop ~= nil then
            clanContributionShop = clanContributionShop.clanContributionCoins;
        end;

        v48.ClanContributionCoins = clanContributionShop;
        v48.WinningAuctionBids = p46.Clans.winningAuctionBids;
        v48.AllAuctionBidIds = p46.Clans.allAuctionBidIds;
        local myClan2 = p46.Clans.myClan;

        if myClan2 ~= nil then
            myClan2 = myClan2.placeAuctionBids;
        end;

        v48.ClanAllAuctionBidIds = myClan2;
        v48.Auctions = p46.Clans.auctions;
        v48.AuctionItems = p46.Clans.auctionItems;

        return v48;
    end)(v45)
};