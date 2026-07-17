-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase;
local getAuctionBidCurrencyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-bid-currencies").getAuctionBidCurrencyMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanAuctionItemTagBanner = RuntimeLib.import(script, script.Parent, "clan-auction-item-tag-banner").ClanAuctionItemTagBanner;

return {
    ClanAuctionItemShopCard = v3.new(u2)(function(u4, p5) -- Line: 16
        -- upvalues: u2 (copy), ClanAuctionItemTagBanner (copy), Empty (copy), Padding (copy), RewardShowcase (copy), RewardUtils (copy), ColorUtil (copy), Theme (copy), BedwarsImageId (copy), StringUtil (copy), getAuctionBidCurrencyMeta (copy)
        local useMemo = p5.useMemo;
        local v6 = useMemo(function() -- Line: 18
            -- upvalues: u4 (copy)
            return u4.ActiveAuctionItemId == u4.AuctionItem.id;
        end, { u4.ActiveAuctionItemId, u4.AuctionItem });
        local v10 = useMemo(function() -- Line: 21
            -- upvalues: u4 (copy)
            local function _(p7) -- Line: 23
                -- upvalues: u4 (ref)
                local v8;

                if p7.bidderId.kind == "Player" and (u4.BidderUserId ~= nil and p7.bidderId.id == u4.BidderUserId) then
                    v8 = true;
                elseif p7.bidderId.kind == "Clan" and u4.MyClanId ~= nil then
                    v8 = p7.bidderId.id == u4.MyClanId;
                else
                    v8 = false;
                end;

                return v8;
            end;

            for i, v in u4.AuctionItem.winningBids do
                local _ = i - 1;
                local v9;

                if v.bidderId.kind == "Player" and (u4.BidderUserId ~= nil and v.bidderId.id == u4.BidderUserId) then
                    v9 = true;
                elseif v.bidderId.kind == "Clan" and u4.MyClanId ~= nil then
                    v9 = v.bidderId.id == u4.MyClanId;
                else
                    v9 = false;
                end;

                if v9 == true then
                    return v;
                end;
            end;

            return nil;
        end, { u4.AuctionItem, u4.MyClanId, u4.BidderUserId });
        local v11 = {};

        for i, v in u4 do
            v11[i] = v;
        end;

        local Size = u4.Size;
        v11.Size = nil;
        v11.AuctionItem = nil;
        v11.ActiveAuctionItemId = nil;
        v11.SetActiveAuctionItemId = nil;
        v11.MyClanId = nil;
        v11.BidderUserId = nil;
        v11.IsOutbid = nil;
        local v12 = {
            Size = Size,
            ImageTransparency = 1,
            BackgroundTransparency = 1,

            [u2.Event.Activated] = function() -- Line: 54
                -- upvalues: u4 (copy)
                u4.SetActiveAuctionItemId(u4.AuctionItem.id);
            end
        };
        local v13 = {};
        local v14 = {};

        for i, v in v11 do
            v14[i] = v;
        end;

        v14.Size = UDim2.new(1, -2, 1, -2);
        v14.AnchorPoint = Vector2.new(0.5, 0.5);
        v14.Position = UDim2.fromScale(0.5, 0.5);
        v14.ClipsDescendants = true;
        local v15 = {};
        local v16 = #v15;
        local v17 = {
            ZIndex = 1000,
            Size = UDim2.fromScale(1, 0.84)
        };
        local v18 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.05, 0)
            }) };
        local v19 = #v18;
        local v20 = u4.IsOutbid and u2.createElement(ClanAuctionItemTagBanner, {
            Type = "outbid",
            LayoutOrder = 1,
            Text = "OUTBIDDED"
        });

        if v20 then
            v18[v19 + 1] = v20;
        end;

        local v21 = #v18;
        local v22;

        if v10 == nil then
            v22 = false;
        else
            v22 = u2.createElement(ClanAuctionItemTagBanner, {
                Type = "bidding",
                LayoutOrder = 1,
                Text = "BIDDING"
            });
        end;

        if v22 then
            v18[v21 + 1] = v22;
        end;

        v18[#v18 + 1] = u2.createElement(ClanAuctionItemTagBanner, {
            Type = "bids",
            LayoutOrder = 2,
            Text = tostring(#u4.AuctionItem.winningBids) .. "/" .. tostring(u4.AuctionItem.maxWinningBids)
        });
        v15[v16 + 1] = u2.createElement(Empty, v17, v18);
        v15[v16 + 2] = u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.84)
        }, { u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, { u2.createElement(Padding, {
                    Padding = UDim.new(0.05, 0)
                }), u2.createElement(RewardShowcase, {
                    Reward = u4.AuctionItem.definition.reward,
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) }), u2.createElement("TextLabel", {
                TextScaled = true,
                TextWrapped = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.25),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 1),
                Text = RewardUtils.getRewardName(u4.AuctionItem.definition.reward),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MinTextSize = 10,
                    MaxTextSize = 18
                }) }) });
        v15[v16 + 3] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        });

        if v6 then
            v6 = u2.createElement("UIStroke", {
                Thickness = 2,
                Color = Theme.mcGold
            });
        end;

        if v6 then
            v15[v16 + 4] = v6;
        end;

        local v23 = {
            Size = UDim2.fromScale(1, 0.16),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v24 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }) };
        local v25 = #v24;
        local v26 = {
            ClipsDescendants = true,
            Size = UDim2.new(1, -20, 1, 0),
            Position = UDim2.fromScale(0, 0.5),
            AnchorPoint = Vector2.new(0, 0.5)
        };
        local v27 = {};
        local v28 = u2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2)
        });
        local v29 = u2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 2),
            PaddingRight = UDim.new(0, 2)
        });
        local createElement = u2.createElement;
        local v30 = {
            LayoutOrder = 1
        };
        local v31;

        if v10 == nil then
            v31 = UDim2.fromScale(1, 1);
        else
            v31 = UDim2.fromScale(0.5, 1);
        end;

        v30.Size = v31;
        v27[1], v27[2], v27[3] = v28, v29, createElement(Empty, v30, { u2.createElement("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 1)
    }), u2.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromOffset(12, 12),
        Image = BedwarsImageId.MONEY_BILL_TREND_UP_SHARP_SOLID_FULL,
        ImageColor3 = Theme.mcGold
    }, { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) }), u2.createElement("TextLabel", {
        LayoutOrder = 2,
        TextScaled = true,
        TextTransparency = 0.2,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -13, 1, 0),
        Text = StringUtil.formatNumberShorthand(u4.AuctionItem.currentBid),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        Font = Enum.Font.Roboto,
        TextColor3 = ColorUtil.BLACK,
        TextTruncate = Enum.TextTruncate.AtEnd
    }, { u2.createElement("UITextSizeConstraint", {
            MinTextSize = 6,
            MaxTextSize = 22
        }) }) });
        local v32 = #v27;
        local v33;

        if v10 == nil then
            v33 = false;
        else
            v33 = u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.5, 1)
            }, { u2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 1)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromOffset(12, 12),
                    Image = BedwarsImageId.SACK_DOLLAR_SOLID_FULL,
                    ImageColor3 = ColorUtil.darken(Theme.mcGreen, 0.8)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }), u2.createElement("TextLabel", {
                    LayoutOrder = 2,
                    TextScaled = true,
                    TextTransparency = 0.2,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, -13, 1, 0),
                    Text = StringUtil.formatNumberShorthand(v10.maxAmount),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Font = Enum.Font.Roboto,
                    TextColor3 = ColorUtil.BLACK,
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, { u2.createElement("UITextSizeConstraint", {
                        MinTextSize = 6,
                        MaxTextSize = 22
                    }) }) });
        end;

        if v33 then
            v27[v32 + 1] = v33;
        end;

        v24[v25 + 1] = u2.createElement(Empty, v26, v27);
        v24[v25 + 2] = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -4, 1, -4),
            Position = UDim2.fromScale(1, 0.5),
            AnchorPoint = Vector2.new(1, 0.5),
            Image = getAuctionBidCurrencyMeta(u4.AuctionItem.definition.bidCurrency).icon
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v15[#v15 + 1] = u2.createElement("Frame", v23, v24);
        v13[#v13 + 1] = u2.createElement("Frame", v14, v15);

        return u2.createFragment({
            ClanAuctionItemShopCard = u2.createElement("ImageButton", v12, v13)
        });
    end)
};