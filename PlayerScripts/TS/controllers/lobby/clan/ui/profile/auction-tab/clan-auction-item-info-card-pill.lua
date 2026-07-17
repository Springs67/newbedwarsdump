-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanAuctionInfoCardPill = v3.new(u2)(function(p4) -- Line: 11
        -- upvalues: Theme (copy), u2 (copy), Padding (copy), Empty (copy), ColorUtil (copy), StringUtil (copy)
        local v5 = {};

        for i, v in p4 do
            v5[i] = v;
        end;

        v5.Icon = nil;
        v5.Text = nil;
        v5.Amount = nil;
        v5.CurrencyIcon = nil;
        local v6 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundSecondary
        };

        for i, v in v5 do
            v6[i] = v;
        end;

        return u2.createFragment({
            ClanAuctionInfoCard = u2.createElement("Frame", v6, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 5)
                }),
                u2.createElement(Padding, {
                    Padding = UDim.new(0, 5)
                }),
                u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    Image = p4.Icon.image,
                    ImageColor3 = p4.Icon.color,
                    Size = UDim2.fromScale(1, 1),
                    ScaleType = Enum.ScaleType.Fit
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }),
                u2.createElement(Empty, {
                    LayoutOrder = 1,
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 2),
                        PaddingBottom = UDim.new(0, 2)
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 5)
                    }),
                    u2.createElement("TextLabel", {
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 0,
                        Size = UDim2.fromScale(0.5, 1),
                        Text = p4.Text,
                        TextColor3 = ColorUtil.WHITE,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                    }),
                    u2.createElement(Empty, {
                        LayoutOrder = 1,
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, { u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 2)
                        }), u2.createElement("TextLabel", {
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            LayoutOrder = 0,
                            AutomaticSize = Enum.AutomaticSize.XY,
                            Text = StringUtil.formatNumberWithCommas(p4.Amount),
                            TextColor3 = ColorUtil.WHITE,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextYAlignment = Enum.TextYAlignment.Center,
                            FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                        }), u2.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            Image = p4.CurrencyIcon,
                            Size = UDim2.fromScale(1, 1),
                            ScaleType = Enum.ScaleType.Fit
                        }, { u2.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1
                            }) }) })
                })
            })
        });
    end)
};