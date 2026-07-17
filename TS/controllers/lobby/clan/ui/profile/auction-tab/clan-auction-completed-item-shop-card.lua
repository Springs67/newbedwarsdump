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
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanAuctionItemTagBanner = RuntimeLib.import(script, script.Parent, "clan-auction-item-tag-banner").ClanAuctionItemTagBanner;

return {
    ClanAuctionCompletedItemShopCard = v3.new(u2)(function(p4) -- Line: 15
        -- upvalues: u2 (copy), Empty (copy), ClanAuctionItemTagBanner (copy), Padding (copy), RewardShowcase (copy), RewardUtils (copy), ColorUtil (copy), Theme (copy), StringUtil (copy), getAuctionBidCurrencyMeta (copy)
        local v5 = {};

        for i, v in p4 do
            v5[i] = v;
        end;

        local Size = p4.Size;
        local v6 = os.date("!%x", p4.WinningAuctionBid.auctionEndTime);
        v5.Size = nil;
        v5.WinningAuctionBid = nil;
        local v7 = {};
        local v8 = {};
        local v9 = {
            BackgroundTransparency = 1,
            Size = Size
        };

        for i, v in v5 do
            v8[i] = v;
        end;

        v8.Size = UDim2.new(1, -2, 1, -2);
        v8.AnchorPoint = Vector2.new(0.5, 0.5);
        v8.Position = UDim2.fromScale(0.5, 0.5);
        v8.ClipsDescendants = true;
        v7[#v7 + 1] = u2.createElement("Frame", v8, {
            u2.createElement(Empty, {
                ZIndex = 1000,
                Size = UDim2.fromScale(1, 0.84)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.05, 0)
                }),
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.05, 0)
                }),
                u2.createElement(ClanAuctionItemTagBanner, {
                    Type = "time",
                    LayoutOrder = 1,
                    Text = "Ended " .. v6
                }),
                u2.createElement(ClanAuctionItemTagBanner, {
                    Type = "bids",
                    LayoutOrder = 2,
                    Text = tostring(p4.WinningAuctionBid.numberOfWinningBids) .. " Won"
                })
            }),
            u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.84)
            }, { u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, { u2.createElement(Padding, {
                        Padding = UDim.new(0.05, 0)
                    }), u2.createElement(RewardShowcase, {
                        Reward = p4.WinningAuctionBid.reward,
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
                    Text = RewardUtils.getRewardName(p4.WinningAuctionBid.reward),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MinTextSize = 10,
                        MaxTextSize = 18
                    }) }) }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }),
            u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.18),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                BackgroundColor3 = Theme.backgroundPrimary
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                }),
                u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 6),
                    PaddingRight = UDim.new(0, 6),
                    PaddingTop = UDim.new(0, 3),
                    PaddingBottom = UDim.new(0, 3)
                }),
                u2.createElement("TextLabel", {
                    Text = "Sold For",
                    TextScaled = true,
                    TextTransparency = 0.1,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.3, 1),
                    Position = UDim2.fromScale(0, 0.5),
                    AnchorPoint = Vector2.new(0, 0.5),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    TextColor3 = ColorUtil.WHITE
                }),
                u2.createElement(Empty, {
                    Size = UDim2.fromScale(0.7, 1),
                    Position = UDim2.fromScale(1, 0.5),
                    AnchorPoint = Vector2.new(1, 0.5)
                }, { u2.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 4)
                    }), u2.createElement("TextLabel", {
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.new(1, -18, 1, 0),
                        Text = StringUtil.formatNumberWithCommas(p4.WinningAuctionBid.winningBidAmount),
                        TextXAlignment = Enum.TextXAlignment.Right,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                        TextColor3 = ColorUtil.WHITE
                    }), u2.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromOffset(14, 14),
                        Image = getAuctionBidCurrencyMeta(p4.WinningAuctionBid.currency).icon
                    }) })
            })
        });

        return u2.createFragment({
            ClanAuctionCompletedItemShopCard = u2.createElement("Frame", v9, v7)
        });
    end)
};