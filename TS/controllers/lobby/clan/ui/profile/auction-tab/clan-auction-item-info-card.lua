-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase;
local getAuctionBidCurrencyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-bid-currencies").getAuctionBidCurrencyMeta;
local AuctionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").AuctionType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanAuctionInfoCardPill = RuntimeLib.import(script, script.Parent, "clan-auction-item-info-card-pill").ClanAuctionInfoCardPill;

return {
    ClanAuctionItemInfoCard = v3.new(u2)(function(u4, p5) -- Line: 20
        -- upvalues: AuctionType (copy), DeviceUtil (copy), KnitClient (copy), u2 (copy), Padding (copy), Empty (copy), RewardShowcase (copy), RewardUtils (copy), ColorUtil (copy), BedwarsImageId (copy), Countdown (copy), ClanAuctionInfoCardPill (copy), Theme (copy), getAuctionBidCurrencyMeta (copy), Button (copy)
        local u6 = not u4.AuctionItem and 0 or u4.AuctionItem.currentBid;
        local u7, u8 = p5.useState("");
        local AuctionItem = u4.AuctionItem;

        if AuctionItem ~= nil then
            local function _(p9) -- Line: 27
                -- upvalues: u4 (copy)
                local v10;

                if p9.bidderId.kind == "Player" and (u4.BidderUserId ~= nil and p9.bidderId.id == u4.BidderUserId) then
                    v10 = true;
                elseif p9.bidderId.kind == "Clan" and u4.MyClanId ~= nil then
                    v10 = p9.bidderId.id == u4.MyClanId;
                else
                    v10 = false;
                end;

                return v10;
            end;

            AuctionItem = nil;

            for i, v in AuctionItem.winningBids do
                local _ = i - 1;
                local v11;

                if v.bidderId.kind == "Player" and (u4.BidderUserId ~= nil and v.bidderId.id == u4.BidderUserId) then
                    v11 = true;
                elseif v.bidderId.kind == "Clan" and u4.MyClanId ~= nil then
                    v11 = v.bidderId.id == u4.MyClanId;
                else
                    v11 = false;
                end;

                if v11 == true then
                    AuctionItem = v;
                    break;
                end;
            end;
        end;

        local function u15() -- Line: 42
            -- upvalues: u4 (copy), u7 (copy), u6 (copy), AuctionType (ref), DeviceUtil (ref), KnitClient (ref)
            if not u4.AuctionItem then
                return nil;
            end;

            local v12;

            if #u7 == 0 then
                v12 = tostring(u6);
            else
                v12 = u7;
            end;

            local v13 = tonumber(v12);

            if v13 == nil then
                return nil;
            end;

            local v14;

            if u4.AuctionItem.auctionType == AuctionType.Clan then
                if u4.MyClanId == nil then
                    return nil;
                end;

                v14 = {
                    kind = "Clan",
                    id = u4.MyClanId
                };
            else
                if u4.BidderUserId == nil then
                    return nil;
                end;

                v14 = {
                    kind = "Player",
                    id = u4.BidderUserId
                };
            end;

            if DeviceUtil.isHoarceKat() then
                print("Placing bid for " .. u4.AuctionItem.id .. " with max bid " .. tostring(v13));

                return nil;
            end;

            KnitClient.Controllers.AuctionController:openBidModal(u4.AuctionItem.id, v13, v14);
        end;

        local v16 = {};

        for i, v in u4 do
            v16[i] = v;
        end;

        v16.Auction = nil;
        v16.AuctionItem = nil;
        v16.MyClanId = nil;
        v16.BidderUserId = nil;
        local v17 = {};

        for i, v in v16 do
            v17[i] = v;
        end;

        local AuctionItem2 = u4.AuctionItem;

        if AuctionItem2 then
            local v18 = {
                Size = UDim2.fromScale(1, 1)
            };
            local v19 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                }), u2.createElement(Padding, {
                    Padding = UDim.new(0.04, 0)
                }), u2.createElement(Empty, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.6)
                }, { u2.createElement(Padding, {
                        Padding = UDim.new(0.05, 0)
                    }), u2.createElement(RewardShowcase, {
                        Reward = u4.AuctionItem.definition.reward,
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }), u2.createElement("TextLabel", {
                            ZIndex = 10,
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 0.25),
                            Position = UDim2.fromScale(0.5, 1),
                            AnchorPoint = Vector2.new(0.5, 0.8),
                            Text = RewardUtils.getRewardName(u4.AuctionItem.definition.reward),
                            TextColor3 = ColorUtil.WHITE,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextYAlignment = Enum.TextYAlignment.Center,
                            FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                        }, { u2.createElement("UITextSizeConstraint", {
                                MinTextSize = 10,
                                MaxTextSize = 28
                            }) }) }) }) };
            local v20 = #v19;
            local v21 = {
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 15)
            };
            local v22 = {};
            local v23 = #v22;
            local v24 = {
                Size = UDim2.fromScale(1, 1)
            };
            local v25 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                }), u2.createElement("ImageLabel", {
                    LayoutOrder = 0,
                    BackgroundTransparency = 1,
                    Image = BedwarsImageId.HUD_TIMER_ICON,
                    Size = UDim2.fromOffset(14, 14),
                    ScaleType = Enum.ScaleType.Fit
                }) };
            local v26 = #v25;
            local v27 = u4.Auction and u2.createElement(Countdown, {
                EndTime = u4.Auction.endEpochTime,
                CountdownConfig = {
                    days = true,
                    hours = true,
                    seperator = ":"
                },
                TextLabel = {
                    TextScaled = true,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0, 1),
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center
                }
            });

            if v27 then
                v25[v26 + 1] = v27;
            end;

            v22[v23 + 1] = u2.createElement(Empty, v24, v25);
            v22[v23 + 2] = u2.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                Text = tostring(#u4.AuctionItem.winningBids) .. "/" .. tostring(u4.AuctionItem.maxWinningBids) .. " Bids",
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            });
            v19[v20 + 1] = u2.createElement(Empty, v21, v22);
            v19[v20 + 2] = u2.createElement(ClanAuctionInfoCardPill, {
                BorderSizePixel = 0,
                Text = "Current Bid",
                LayoutOrder = 3,
                Size = UDim2.fromScale(1, 0.075),
                BackgroundColor3 = Theme.backgroundSecondary,
                Icon = {
                    image = BedwarsImageId.MONEY_BILL_TREND_UP_SHARP_SOLID_FULL,
                    color = Theme.mcGold
                },
                Amount = u4.AuctionItem.currentBid,
                CurrencyIcon = getAuctionBidCurrencyMeta(u4.AuctionItem.definition.bidCurrency).icon
            });
            local v28;

            if AuctionItem == nil then
                v28 = false;
            else
                v28 = u2.createElement(ClanAuctionInfoCardPill, {
                    BorderSizePixel = 0,
                    Text = "Your Max Bid",
                    LayoutOrder = 4,
                    Size = UDim2.fromScale(1, 0.075),
                    BackgroundColor3 = Theme.backgroundSecondary,
                    Icon = {
                        image = BedwarsImageId.SACK_DOLLAR_SOLID_FULL,
                        color = ColorUtil.darken(Theme.mcGreen, 0.8)
                    },
                    Amount = AuctionItem.maxAmount,
                    CurrencyIcon = getAuctionBidCurrencyMeta(u4.AuctionItem.definition.bidCurrency).icon
                });
            end;

            if v28 then
                v19[v20 + 3] = v28;
            end;

            local v29 = #v19;
            v19[v29 + 1] = u2.createElement("Frame", {
                LayoutOrder = 6,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 3),
                BackgroundColor3 = Theme.backgroundSecondary
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) });
            v19[v29 + 2] = u2.createElement("TextLabel", {
                Text = "Max Bid",
                TextTransparency = 0.2,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 7,
                Size = UDim2.fromScale(1, 0.045),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            });
            v19[v29 + 3] = u2.createElement(Empty, {
                LayoutOrder = 8,
                Size = UDim2.fromScale(1, 0.075)
            }, { u2.createElement("UIListLayout", {
                    HorizontalFlex = "SpaceBetween",
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                }), u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    Size = UDim2.new(0.7, -2, 1, 0),
                    BackgroundColor3 = Theme.backgroundTertiary
                }, { u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 2),
                        PaddingBottom = UDim.new(0, 2),
                        PaddingLeft = UDim.new(0, 4)
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }), u2.createElement("TextBox", {
                        Size = UDim2.fromScale(1, 1),
                        Text = "",
                        PlaceholderText = "DEFAULT BID: " .. tostring(u4.AuctionItem.currentBid),
                        PlaceholderColor3 = Color3.fromRGB(166, 166, 186),
                        ClearTextOnFocus = false,
                        TextColor3 = ColorUtil.WHITE,
                        TextScaled = true,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        BackgroundTransparency = 1,
                        FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),

                        [u2.Change.Text] = function(p30) -- Line: 290
                            -- upvalues: u8 (copy)
                            u8(p30.Text);
                        end
                    }) }), u2.createElement(Button, {
                    Text = "BID",
                    Size = UDim2.new(0.3, -2, 1, 0),
                    TextLabel = {
                        TextScaled = true,
                        FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                    },
                    BackgroundColor3 = Theme.backgroundSuccess,

                    OnClick = function() -- Line: 303, Name: OnClick
                        -- upvalues: u15 (copy)
                        u15();
                    end
                }) });
            AuctionItem2 = u2.createElement(Empty, v18, v19);
        end;

        local v31 = {};
        local v32 = #v31;

        if AuctionItem2 then
            v31[v32 + 1] = AuctionItem2;
        end;

        return u2.createFragment({
            ClanAuctionItemInfoCard = u2.createElement("Frame", v17, v31)
        });
    end)
};