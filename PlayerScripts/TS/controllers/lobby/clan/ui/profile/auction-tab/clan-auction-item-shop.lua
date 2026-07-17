-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanAuctionCompletedItemShopCard = RuntimeLib.import(script, script.Parent, "clan-auction-completed-item-shop-card").ClanAuctionCompletedItemShopCard;
local ClanAuctionItemShopCard = RuntimeLib.import(script, script.Parent, "clan-auction-item-shop-card").ClanAuctionItemShopCard;
local u4 = { {
        text = "Price Ascending",
        value = "PRICE_ASC"
    }, {
        text = "Price Descending",
        value = "PRICE_DESC"
    } };

local function u12(p5, u6) -- Line: 27
    local u7 = {};

    if p5 ~= nil then
        local function v11(p8) -- Line: 31
            -- upvalues: u6 (copy), u7 (copy)
            local AuctionId = p8.AuctionId;
            local v9;

            if AuctionId == "" or not AuctionId then
                v9 = nil;
            else
                v9 = u6;

                if v9 ~= nil then
                    v9 = v9[p8.AuctionId];
                end;
            end;

            local AuctionItemIds = p8.AuctionItemIds;

            if AuctionItemIds == nil then
                if v9 ~= nil then
                    v9 = v9.activeItemsIds;
                end;

                AuctionItemIds = v9 == nil and {} or v9;
            end;

            local function _(p10) -- Line: 56
                -- upvalues: u7 (ref)
                table.insert(u7, p10);
            end;

            for i, v in AuctionItemIds do
                local _ = i - 1;
                table.insert(u7, v);
            end;
        end;

        for i, v in p5 do
            v11(v, i, p5);
        end;
    end;

    return u7;
end;

local function u19(p13, u14) -- Line: 70
    local u15 = {};

    if p13 == nil then
        return u15;
    end;

    local function v18(p16) -- Line: 76
        -- upvalues: u14 (copy), u15 (copy)
        if p16.AuctionId == nil then
            return nil;
        end;

        local v17 = u14;

        if v17 ~= nil then
            v17 = v17[p16.AuctionId];
        end;

        local AuctionItemIds = p16.AuctionItemIds;

        if AuctionItemIds == nil then
            if v17 ~= nil then
                v17 = v17.activeItemsIds;
            end;

            AuctionItemIds = v17 == nil and {} or v17;
        end;

        table.insert(u15, {
            Name = p16.Name,
            AuctionId = p16.AuctionId,
            AuctionItemIds = AuctionItemIds,
            OutbidAuctionItemIds = p16.OutbidAuctionItemIds or {}
        });
    end;

    for i, v in p13 do
        v18(v, i, p13);
    end;

    return u15;
end;

local function u28(p20, u21, u22) -- Line: 111
    local v23 = {};
    table.move(p20, 1, #p20, #v23 + 1, v23);
    table.sort(v23, function(p24, p25) -- Line: 116
        -- upvalues: u21 (copy), u22 (copy)
        local v26 = u21[p24];
        local v27 = u21[p25];

        if v26 == nil or v27 == nil then
            return false;
        end;

        if u22 == "PRICE_ASC" then
            return v26.currentBid < v27.currentBid;
        end;

        return v26.currentBid > v27.currentBid;
    end);

    return v23;
end;

local function u34(p29, u30) -- Line: 131
    local v31 = {};
    table.move(p29, 1, #p29, #v31 + 1, v31);
    table.sort(v31, function(p32, p33) -- Line: 136
        -- upvalues: u30 (copy)
        if u30 == "PRICE_ASC" then
            return p32.winningBidAmount < p33.winningBidAmount;
        end;

        return p32.winningBidAmount > p33.winningBidAmount;
    end);

    return v31;
end;

return {
    ClanAuctionItemShop = v3.new(u2)(function(u35, p36) -- Line: 142
        -- upvalues: u12 (copy), RewardUtils (copy), u19 (copy), u28 (copy), u34 (copy), u2 (copy), AutoCompleteSearchbar (copy), Theme (copy), u4 (copy), DropdownComponent (copy), Empty (copy), ColorUtil (copy), ClanAuctionCompletedItemShopCard (copy), BedwarsImageId (copy), Countdown (copy), ClanAuctionItemShopCard (copy), AutoCanvasScrollingFrame (copy)
        local useState = p36.useState;
        local useEffect = p36.useEffect;
        local useMemo = p36.useMemo;
        local u37, u38 = useState("");
        local u39, u40 = useState("PRICE_ASC");
        local u43 = useMemo(function() -- Line: 148
            -- upvalues: u35 (copy)
            local u41 = {};
            local Auctions = u35.Auctions;

            if Auctions ~= nil then
                local function _(p42) -- Line: 152
                    -- upvalues: u41 (copy)
                    u41[p42.id] = p42;

                    return u41;
                end;

                for i, v in Auctions do
                    local _ = i - 1;
                    u41[v.id] = v;
                end;
            end;

            return u41;
        end, { u35.Auctions });
        local v55 = useMemo(function() -- Line: 164
            -- upvalues: u35 (copy), u12 (ref), u43 (copy), RewardUtils (ref)
            local u44 = {};
            local AuctionGroups = u35.AuctionGroups;

            local function v54(p45) -- Line: 167
                -- upvalues: u12 (ref), u43 (ref), u35 (ref), RewardUtils (ref), u44 (copy)
                local function _(p46) -- Line: 169
                    -- upvalues: u35 (ref), RewardUtils (ref), u44 (ref)
                    local v47 = u35.AuctionItems[p46];

                    if v47 == nil then
                        return nil;
                    end;

                    local v48 = {
                        key = RewardUtils.getRewardName(v47.definition.reward)
                    };
                    table.insert(u44, v48);
                end;

                for i, v in u12(p45.Kind.ActiveAuctions, u43) do
                    local _ = i - 1;
                    local v49 = u35.AuctionItems[v];

                    if v49 ~= nil then
                        local v50 = {
                            key = RewardUtils.getRewardName(v49.definition.reward)
                        };
                        table.insert(u44, v50);
                    end;
                end;

                local function _(p51) -- Line: 185
                    -- upvalues: RewardUtils (ref), u44 (ref)
                    local v52 = {
                        key = RewardUtils.getRewardName(p51.reward)
                    };
                    table.insert(u44, v52);
                end;

                for i, v in p45.Kind.PastAuctions or {} do
                    local _ = i - 1;
                    local v53 = {
                        key = RewardUtils.getRewardName(v.reward)
                    };
                    table.insert(u44, v53);
                end;
            end;

            for i, v in AuctionGroups do
                v54(v, i - 1, AuctionGroups);
            end;

            return u44;
        end, { u35.AuctionGroups, u35.AuctionItems, u43 });
        local u56, u57 = useState(nil);
        local u86 = useMemo(function() -- Line: 201
            -- upvalues: u37 (copy), u35 (copy), u19 (ref), u43 (copy), u56 (copy), RewardUtils (ref), u28 (ref), u39 (copy), u34 (ref)
            local u58 = #u37 > 0;
            local AuctionGroups = u35.AuctionGroups;

            local function v82(p59) -- Line: 204
                -- upvalues: u19 (ref), u43 (ref), u35 (ref), u58 (copy), u56 (ref), RewardUtils (ref), u28 (ref), u39 (ref), u34 (ref)
                local v60 = u19(p59.Kind.ActiveAuctions, u43);

                local function v71(p61) -- Line: 206
                    -- upvalues: u35 (ref), u58 (ref), u56 (ref), RewardUtils (ref), u28 (ref), u39 (ref)
                    local function _(p62) -- Line: 208
                        -- upvalues: u35 (ref), u58 (ref), u56 (ref), RewardUtils (ref)
                        local v63 = u35.AuctionItems[p62];

                        if v63 == nil then
                            return false;
                        end;

                        if not u58 or u56 == nil then
                            return true;
                        end;

                        local v64 = RewardUtils.getRewardName(v63.definition.reward);

                        return table.find(u56, v64) ~= nil;
                    end;

                    local v65 = 0;
                    local v66 = {};

                    for i, v in p61.AuctionItemIds do
                        local _ = i - 1;
                        local v67 = u35.AuctionItems[v];
                        local v68;

                        if v67 == nil then
                            v68 = false;
                        elseif u58 and u56 ~= nil then
                            local v69 = RewardUtils.getRewardName(v67.definition.reward);
                            v68 = table.find(u56, v69) ~= nil;
                        else
                            v68 = true;
                        end;

                        if v68 == true then
                            v65 = v65 + 1;
                            v66[v65] = v;
                        end;
                    end;

                    if #v66 == 0 then
                        return nil;
                    end;

                    local v70 = {};

                    for i, v in p61 do
                        v70[i] = v;
                    end;

                    v70.AuctionItemIds = u28(v66, u35.AuctionItems, u39);

                    return v70;
                end;

                local v72 = 0;
                local v73 = {};

                for i, v in v60 do
                    local v74 = v71(v, i - 1, v60);

                    if v74 ~= nil then
                        v72 = v72 + 1;
                        v73[v72] = v74;
                    end;
                end;

                local function _(p75) -- Line: 255
                    -- upvalues: u58 (ref), u56 (ref), RewardUtils (ref)
                    if not u58 or u56 == nil then
                        return true;
                    end;

                    local v76 = RewardUtils.getRewardName(p75.reward);

                    return table.find(u56, v76) ~= nil;
                end;

                local v77 = 0;
                local v78 = {};

                for i, v in p59.Kind.PastAuctions or {} do
                    local _ = i - 1;
                    local v79;

                    if u58 and u56 ~= nil then
                        local v80 = RewardUtils.getRewardName(v.reward);
                        v79 = table.find(u56, v80) ~= nil;
                    else
                        v79 = true;
                    end;

                    if v79 == true then
                        v77 = v77 + 1;
                        v78[v77] = v;
                    end;
                end;

                local v81 = {};

                for i, v in p59 do
                    v81[i] = v;
                end;

                v81.DisplayedActiveAuctionGroups = v73;
                v81.DisplayedPastAuctions = u34(v78, u39);

                return v81;
            end;

            local v83 = 0;
            local v84 = {};

            for i, v in AuctionGroups do
                local v85 = v82(v, i - 1, AuctionGroups);

                if v85 ~= nil then
                    v83 = v83 + 1;
                    v84[v83] = v85;
                end;
            end;

            return v84;
        end, {
            u37,
            u39,
            u35.AuctionGroups,
            u35.AuctionItems,
            u43,
            u56
        });
        local u93 = useMemo(function() -- Line: 294
            -- upvalues: u86 (copy)
            local u87 = {};

            local function v92(p88) -- Line: 296
                -- upvalues: u87 (copy)
                local DisplayedActiveAuctionGroups = p88.DisplayedActiveAuctionGroups;

                local function v91(p89) -- Line: 298
                    -- upvalues: u87 (ref)
                    local function _(p90) -- Line: 300
                        -- upvalues: u87 (ref)
                        table.insert(u87, p90);

                        return #u87;
                    end;

                    for i, v in p89.AuctionItemIds do
                        local _ = i - 1;
                        table.insert(u87, v);
                        local _ = #u87;
                    end;
                end;

                for i, v in DisplayedActiveAuctionGroups do
                    v91(v, i - 1, DisplayedActiveAuctionGroups);
                end;
            end;

            for i, v in u86 do
                v92(v, i - 1, u86);
            end;

            return u87;
        end, { u86 });
        local v98 = useMemo(function() -- Line: 318
            -- upvalues: u86 (copy)
            local u94 = 0;

            local function v97(p95) -- Line: 320
                -- upvalues: u94 (ref)
                local function _(p96) -- Line: 322
                    -- upvalues: u94 (ref)
                    u94 = u94 + #p96.AuctionItemIds;
                end;

                for i, v in p95.DisplayedActiveAuctionGroups do
                    local _ = i - 1;
                    u94 = u94 + #v.AuctionItemIds;
                end;

                u94 = u94 + #p95.DisplayedPastAuctions;
            end;

            for i, v in u86 do
                v97(v, i - 1, u86);
            end;

            return u94;
        end, { u86 });
        useEffect(function() -- Line: 335
            -- upvalues: u93 (copy), u35 (copy)
            if #u93 == 0 then
                return nil;
            end;

            local v99 = u35.ActiveAuctionItemId ~= nil and table.find(u93, u35.ActiveAuctionItemId) ~= nil;

            if v99 then
                return nil;
            end;

            u35.SetActiveAuctionItemId(u93[1]);
        end, { u93, u35.ActiveAuctionItemId, u35.SetActiveAuctionItemId });
        local v100 = {};

        local function v103(p101, p102) -- Line: 349
            -- upvalues: u38 (copy), u57 (copy)
            u38(p101);

            if p101 == "" then
                u57(nil);

                return nil;
            end;

            u57(p102);
        end;

        for i, v in u35 do
            v100[i] = v;
        end;

        v100.AuctionGroups = nil;
        v100.ActiveAuctionItemId = nil;
        v100.SetActiveAuctionItemId = nil;
        v100.MyClanId = nil;
        v100.BidderUserId = nil;
        v100.Auctions = nil;
        v100.AuctionItems = nil;
        local v104 = {};

        for i, v in v100 do
            v104[i] = v;
        end;

        local v105 = { u2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 6)
            }) };
        local v106 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v107 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local _ = #v107;
        local v108 = {
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 47)
        };
        local v109 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2)
            }) };
        local v110 = {
            LayoutOrder = 1,
            ZIndex = 2,
            Size = UDim2.new(1, 0, 0, 25)
        };
        local v111 = { u2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 6)
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 6)
            }), u2.createElement(AutoCompleteSearchbar, {
                BackgroundTransparency = 0,
                PlaceHolderText = "Search Bids",
                LayoutOrder = 1,
                Size = UDim2.new(0.65, 0, 1, 0),
                BackgroundColor3 = Theme.backgroundTertiary,
                Items = v55,
                InputText = u37,
                OnTextChange = v103
            }) };
        local v112 = {
            ButtonTransparency = 0,
            Size = UDim2.new(0.35, 0, 1, 0),
            ButtonColor = Theme.backgroundTertiary,
            CornerRadius = UDim.new(0, 3)
        };

        local function _(p113) -- Line: 439
            -- upvalues: u39 (copy)
            return p113.value == u39;
        end;

        local v114 = nil;

        for i, v in u4 do
            local _ = i - 1;

            if v.value == u39 == true then
                v114 = v;
                break;
            end;
        end;

        if v114 == nil then
            v114 = u4[1];
        end;

        v112.DefaultItem = v114;
        v112.Items = u4;

        function v112.OnItemSelected(p115) -- Line: 457
            -- upvalues: u40 (copy)
            return u40((tostring(p115)));
        end;

        v112.LayoutOrder = 2;
        v112.ZIndex = 20;
        v111[#v111 + 1] = u2.createElement(DropdownComponent, v112);
        v109[#v109 + 1] = u2.createElement(Empty, v110, v111);
        v109.InfoBar = u2.createElement(Empty, {
            LayoutOrder = 2,
            ZIndex = 1,
            Size = UDim2.new(1, 0, 0, 20)
        }, { u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = Enum.AutomaticSize.X
            }, { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 3),
                    PaddingBottom = UDim.new(0, 3)
                }), u2.createElement("TextLabel", {
                    TextTransparency = 0.5,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0, 1),
                    AutomaticSize = Enum.AutomaticSize.X,
                    Text = tostring(v98) .. " Result" .. (v98 == 1 and "" or "s"),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                }) }) });
        v107.SearchContainer = u2.createElement(Empty, v108, v109);

        local function v168(p116, u117) -- Line: 494
            -- upvalues: u2 (ref), Theme (ref), Empty (ref), ColorUtil (ref), ClanAuctionCompletedItemShopCard (ref), u43 (copy), BedwarsImageId (ref), Countdown (ref), u35 (copy), ClanAuctionItemShopCard (ref)
            local v118 = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0),
                AutomaticSize = Enum.AutomaticSize.Y
            };
            local v119 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) };
            local v120 = #v119;
            local v121 = {
                Size = UDim2.new(1, 0, 0, u117 == 0 and 20 or 28),
                LayoutOrder = u117
            };
            local v122 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) };
            local v123 = #v122;
            local v124;

            if u117 == 0 then
                v124 = false;
            else
                v124 = u2.createFragment({ u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        LayoutOrder = 1,
                        Size = UDim2.new(1, 0, 0, 4),
                        BackgroundColor3 = Theme.backgroundPrimary
                    }, { u2.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) }), u2.createElement(Empty, {
                        LayoutOrder = 2,
                        Size = UDim2.new(1, 0, 0, 4)
                    }) });
            end;

            if v124 then
                v122[v123 + 1] = v124;
            end;

            local v125 = #v122;
            local v126 = p116.Name ~= nil;

            if v126 then
                local v127 = {
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 0, 20)
                };
                local v128 = {};
                local v129 = #v128;
                local v130;

                if p116.Name == nil then
                    v130 = false;
                else
                    v130 = u2.createElement("TextLabel", {
                        LayoutOrder = 1,
                        TextTransparency = 0.15,
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0, 1),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        AutomaticSize = Enum.AutomaticSize.X,
                        Text = p116.Name,
                        TextColor3 = ColorUtil.WHITE,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                    });
                end;

                if v130 then
                    v128[v129 + 1] = v130;
                end;

                v126 = u2.createElement(Empty, v127, v128);
            end;

            if v126 then
                v122[v125 + 1] = v126;
            end;

            v119[v120 + 1] = u2.createElement(Empty, v121, v122);
            local v131;

            if #p116.DisplayedPastAuctions == 0 and #p116.DisplayedActiveAuctionGroups == 0 then
                v131 = u2.createElement("TextLabel", {
                    LayoutOrder = 3,
                    Text = "No auctions found.",
                    TextScaled = true,
                    TextTransparency = 0.45,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 20),
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
                });
            elseif #p116.DisplayedPastAuctions > 0 then
                local v132 = { u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 10)
                    }) };
                local _ = #v132;
                local DisplayedPastAuctions = p116.DisplayedPastAuctions;

                local function v135(p133, p134) -- Line: 597
                    -- upvalues: u2 (ref), u117 (copy), ClanAuctionCompletedItemShopCard (ref), Theme (ref)
                    return u2.createFragment({
                        [tostring(u117) .. "-past-" .. tostring(p134)] = u2.createElement(ClanAuctionCompletedItemShopCard, {
                            LayoutOrder = p134,
                            BackgroundColor3 = Theme.backgroundTertiary,
                            WinningAuctionBid = p133
                        })
                    });
                end;

                local v136 = table.create(#DisplayedPastAuctions);

                for i, v in DisplayedPastAuctions do
                    v136[i] = v135(v, i - 1, DisplayedPastAuctions);
                end;

                local v137 = {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0),
                    AutomaticSize = Enum.AutomaticSize.Y
                };
                local v138 = { u2.createElement("UIGridLayout", {
                        FillDirectionMaxCells = 2,
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        CellPadding = UDim2.fromOffset(8, 8),
                        CellSize = UDim2.new(0.5, -8, 0, 120)
                    }) };
                local v139 = #v138;

                for i, v in v136 do
                    v138[v139 + i] = v;
                end;

                v132.CompletedBidsGrid = u2.createFragment({
                    CompletedBidsGrid = u2.createElement("Frame", v137, v138)
                });
                v131 = u2.createFragment(v132);
            else
                local DisplayedActiveAuctionGroups = p116.DisplayedActiveAuctionGroups;

                local function v162(u140, p141) -- Line: 639
                    -- upvalues: u43 (ref), u2 (ref), ColorUtil (ref), Empty (ref), BedwarsImageId (ref), Countdown (ref), u35 (ref), Theme (ref), u117 (copy), ClanAuctionItemShopCard (ref)
                    local v142 = u43[u140.AuctionId];
                    local v143 = v142 ~= nil;

                    if v143 then
                        local v144 = {
                            LayoutOrder = 1,
                            Size = UDim2.new(1, 0, 0, 12)
                        };
                        local v145 = {};
                        local v146 = #v145;
                        local v147;

                        if u140.Name == nil then
                            v147 = false;
                        else
                            v147 = u2.createElement("TextLabel", {
                                LayoutOrder = 1,
                                TextTransparency = 0.3,
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(0, 1),
                                Position = UDim2.fromScale(0, 0.5),
                                AnchorPoint = Vector2.new(0, 0.5),
                                AutomaticSize = Enum.AutomaticSize.X,
                                Text = u140.Name,
                                TextColor3 = ColorUtil.WHITE,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
                            });
                        end;

                        if v147 then
                            v145[v146 + 1] = v147;
                        end;

                        local _ = #v145;
                        v145.CountdownTimer = u2.createElement(Empty, {
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(0, 1),
                            AutomaticSize = Enum.AutomaticSize.X,
                            Position = UDim2.fromScale(1, 0.5),
                            AnchorPoint = Vector2.new(1, 0.5)
                        }, { u2.createElement("UIListLayout", {
                                Padding = UDim.new(0, 6),
                                FillDirection = Enum.FillDirection.Horizontal,
                                VerticalAlignment = Enum.VerticalAlignment.Center,
                                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), u2.createElement("ImageLabel", {
                                BackgroundTransparency = 1,
                                LayoutOrder = 1,
                                Size = UDim2.fromScale(1, 1),
                                ScaleType = Enum.ScaleType.Fit,
                                Image = BedwarsImageId.HUD_TIMER_ICON
                            }, { u2.createElement("UIAspectRatioConstraint", {
                                    AspectRatio = 1
                                }) }), u2.createElement(Countdown, {
                                PostText = "<font transparency=\"0.3\" size=\"12\">  Auction Ends</font>",
                                EndTime = v142.endEpochTime,
                                CountdownConfig = {
                                    days = true,
                                    hours = true,
                                    seperator = ":"
                                },
                                TextLabel = {
                                    TextScaled = false,
                                    TextSize = 14,
                                    LayoutOrder = 2,
                                    Size = UDim2.fromScale(0, 1),
                                    AutomaticSize = Enum.AutomaticSize.X,
                                    TextXAlignment = Enum.TextXAlignment.Right
                                }
                            }) });
                        v143 = u2.createElement(Empty, v144, v145);
                    end;

                    local v148 = {
                        Size = UDim2.fromScale(1, 0),
                        AutomaticSize = Enum.AutomaticSize.Y,
                        LayoutOrder = p141
                    };
                    local v149 = { u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 4)
                        }) };
                    local v150 = #v149;

                    if v143 then
                        v149[v150 + 1] = v143;
                    end;

                    local _ = #v149;
                    local AuctionItemIds = u140.AuctionItemIds;

                    local function v155(p151, p152) -- Line: 731
                        -- upvalues: u35 (ref), Theme (ref), u140 (copy), u2 (ref), u117 (ref), ClanAuctionItemShopCard (ref)
                        local v153 = u35.AuctionItems[p151];

                        if v153 == nil then
                            return nil;
                        end;

                        local v154 = {
                            LayoutOrder = p152,
                            BackgroundColor3 = Theme.backgroundTertiary,
                            AuctionItem = v153,
                            MyClanId = u35.MyClanId,
                            BidderUserId = u35.BidderUserId,
                            IsOutbid = table.find(u140.OutbidAuctionItemIds, p151) ~= nil,
                            ActiveAuctionItemId = u35.ActiveAuctionItemId,
                            SetActiveAuctionItemId = u35.SetActiveAuctionItemId
                        };

                        return u2.createFragment({
                            [tostring(u117) .. "-" .. u140.AuctionId .. "-" .. tostring(p152)] = u2.createElement(ClanAuctionItemShopCard, v154)
                        });
                    end;

                    local v156 = 0;
                    local v157 = {};

                    for i, v in AuctionItemIds do
                        local v158 = v155(v, i - 1, AuctionItemIds);

                        if v158 ~= nil then
                            v156 = v156 + 1;
                            v157[v156] = v158;
                        end;
                    end;

                    local v159 = {
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0),
                        AutomaticSize = Enum.AutomaticSize.Y
                    };
                    local v160 = { u2.createElement("UIGridLayout", {
                            FillDirectionMaxCells = 3,
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Top,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            CellPadding = UDim2.fromOffset(8, 8),
                            CellSize = UDim2.new(0.3333333333333333, -8, 0, 120)
                        }) };
                    local v161 = #v160;

                    for i, v in v157 do
                        v160[v161 + i] = v;
                    end;

                    v149["ActiveBidsGrid-" .. u140.AuctionId] = u2.createElement("Frame", v159, v160);

                    return u2.createFragment({
                        ["ActiveAuctionGroup-" .. tostring(u117) .. "-" .. u140.AuctionId] = u2.createElement(Empty, v148, v149)
                    });
                end;

                local v163 = table.create(#DisplayedActiveAuctionGroups);

                for i, v in DisplayedActiveAuctionGroups do
                    v163[i] = v162(v, i - 1, DisplayedActiveAuctionGroups);
                end;

                local v164 = { u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 10)
                    }) };
                local v165 = #v164;

                for i, v in v163 do
                    v164[v165 + i] = v;
                end;

                v131 = u2.createFragment(v164);
            end;

            local v166 = {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0),
                AutomaticSize = Enum.AutomaticSize.Y
            };
            local v167 = {
                [#v167 + 1] = v131
            };
            v119[v120 + 2] = u2.createElement(Empty, v166, v167);

            return u2.createFragment({
                ["AuctionContainer-" .. tostring(u117)] = u2.createElement(Empty, v118, v119)
            });
        end;

        local v169 = table.create(#u86);

        for i, v in u86 do
            v169[i] = v168(v, i - 1, u86);
        end;

        local v170 = {
            ScrollingFrameProps = {
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 1, -51)
            }
        };
        local v171 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 6)
            }) };
        local v172 = #v171;

        for i, v in v169 do
            v171[v172 + i] = v;
        end;

        v107.BidsList = u2.createElement(AutoCanvasScrollingFrame, v170, v171);
        v105[#v105 + 1] = u2.createElement(Empty, v106, v107);

        return u2.createFragment({
            ClanAuctionItemList = u2.createElement(Empty, v104, v105)
        });
    end)
};