-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local PlayerViewport = v1.PlayerViewport;
local StringUtil = v1.StringUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v4.TweenService;
local UserInputService = v4.UserInputService;

return {
    ShopItemTile = v3.new(u2)(function(u5, p6) -- Line: 17
        -- upvalues: u2 (copy), TweenService (copy), ColorUtil (copy), UserInputService (copy), UIUtil (copy), DeviceUtil (copy), PlayerViewport (copy), Empty (copy), Padding (copy), StringUtil (copy), AutoSizedText (copy)
        local useEffect = p6.useEffect;
        local u7, u8 = p6.useState(false);
        local TimesPurchased = u5.TimesPurchased;
        local v9 = (TimesPurchased == nil and 0 or TimesPurchased) >= u5.MaxPurchases;
        local u10 = u2.createRef();
        local u11 = u2.createRef();
        useEffect(function() -- Line: 29
            -- upvalues: u10 (copy), u11 (copy), u7 (copy), TweenService (ref), ColorUtil (ref), u5 (copy)
            local v12 = u10:getValue();
            local v13 = u11:getValue();

            if not (v12 and v13) then
                return nil;
            end;

            if u7 then
                TweenService:Create(v12, TweenInfo.new(0.3), {
                    Size = v12.Size - UDim2.fromScale(0.05, 0.05)
                }):Play();
                TweenService:Create(v13, TweenInfo.new(0.4), {
                    BackgroundColor3 = ColorUtil.darken(Color3.fromHex("#6B6EB5"), 0.8)
                }):Play();

                return;
            end;

            TweenService:Create(v12, TweenInfo.new(0.3), {
                Size = UDim2.new(u5.Item.TextImage == nil and 0.65 or 0.8, 0, 0.65, 0)
            }):Play();
            TweenService:Create(v13, TweenInfo.new(0.4), {
                BackgroundColor3 = Color3.fromHex("#6B6EB5")
            }):Play();
        end, { u7 });
        useEffect(function() -- Line: 57
            -- upvalues: UserInputService (ref), UIUtil (ref), u11 (copy)
            if UserInputService.GamepadEnabled then
                UIUtil:selectGui(u11:getValue());
            end;
        end, {});
        local v14 = {
            [u2.Event.Activated] = function() -- Line: 63
                -- upvalues: u5 (copy)
                u5.OnClick();
            end,

            [u2.Event.MouseEnter] = function() -- Line: 66
                -- upvalues: u8 (copy)
                u8(true);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 69
                -- upvalues: u8 (copy)
                u8(false);
            end,

            BackgroundColor3 = Color3.fromHex("#6B6EB5"),
            AutoButtonColor = false,
            Selectable = true,
            BorderSizePixel = 0,
            LayoutOrder = u5.LayoutOrder,
            Size = UDim2.fromScale(1, 1)
        };
        local FrameProps = u5.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v14[i] = v;
            end;
        end;

        v14[u2.Ref] = u11;
        local v15 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }),
            GradientGlow = u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1)
            }, { u2.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.BLACK), ColorSequenceKeypoint.new(1, u5.RarityColor or ColorUtil.WHITE) }),
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.65) })
                }) })
        };
        local v16 = #v15;
        local v17 = {
            Size = UDim2.new(u5.Item.TextImage == nil and 0.65 or 0.8, 0, 0.65, 0),
            Position = UDim2.fromScale(0.5, 0.325),
            AnchorPoint = Vector2.new(0.5, 0.5),
            [u2.Ref] = u10,
            ZIndex = 1
        };
        local v18 = {};
        local v19 = #v18;
        local v20;

        if u5.Item.Image == nil then
            v20 = false;
        else
            v20 = u2.createFragment({
                ItemImage = u2.createElement("ImageLabel", {
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 1,
                    Image = u5.Item.Image,
                    Size = UDim2.new(1, 0, 1, 0)
                })
            });
        end;

        if v20 then
            v18[v19 + 1] = v20;
        end;

        local v21 = #v18;
        local v22;

        if u5.Item.TextImage == nil then
            v22 = false;
        else
            v22 = u2.createFragment({
                ItemTextImage = u2.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    Text = u5.Item.TextImage,
                    Font = Enum.Font.LuckiestGuy,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 30
                    }) })
            });
        end;

        if v22 then
            v18[v21 + 1] = v22;
        end;

        local v23 = #v18;
        local v24;

        if u5.Item.Animation == nil then
            v24 = false;
        else
            v24 = u2.createFragment({
                RewardShowcase = u2.createElement(PlayerViewport, {
                    ImageTransparency = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Animation = u5.Item.Animation,
                    Size = UDim2.new(1, 0, 1, 0),
                    LayoutOrder = u5.LayoutOrder
                })
            });
        end;

        if v24 then
            v18[v23 + 1] = v24;
        end;

        v15.ItemFrame = u2.createElement(Empty, v17, v18);
        local createElement = u2.createElement;
        local v25 = {
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1)
        };
        local v26 = {
            u2.createElement(Padding, {
                Padding = {
                    Horizontal = 6,
                    Vertical = 14
                }
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Bottom",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 0.1)
            }),
            Name = u2.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                ZIndex = 2,
                Size = UDim2.new(1, 0, 0, 30),
                Text = "<b>" .. string.upper(u5.Item.Name) .. "</b>",
                TextColor3 = u5.RarityColor,
                Font = Enum.Font.Roboto
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) })
        };
        local v27;

        if v9 then
            v27 = u2.createElement(AutoSizedText, {
                Text = "PURCHASED",
                TextSize = 12,
                ZIndex = 2,
                LayoutOrder = 2,
                Font = Enum.Font.SourceSansBold,
                TextColor3 = ColorUtil.WHITE,
                Limits = Vector2.new(220, 32),
                TextYAlignment = Enum.TextYAlignment.Top
            });
        else
            v27 = u2.createFragment({
                CostContainer = u2.createElement("Frame", {
                    AutomaticSize = "X",
                    ClipsDescendants = false,
                    BackgroundTransparency = 0.6,
                    BorderSizePixel = 0,
                    LayoutOrder = 2,
                    Size = UDim2.new(0, 0, 0, 22),
                    BackgroundColor3 = u5.RarityColor
                }, {
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    u2.createElement(Padding, {
                        Padding = {
                            Vertical = 4,
                            Horizontal = 6
                        }
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 4)
                    }),
                    CurrencyIcon = u2.createElement("ImageLabel", {
                        SizeConstraint = "RelativeYY",
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        LayoutOrder = -1,
                        ZIndex = 2,
                        Size = UDim2.new(1, 0, 1, 0),
                        Image = u5.Currency.Icon
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }),
                    PriceText = u2.createElement("TextLabel", {
                        TextSize = 11,
                        TextWrapped = false,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        LayoutOrder = 2,
                        AutomaticSize = Enum.AutomaticSize.XY,
                        Text = StringUtil.formatNumberWithCommas(u5.Currency.Price),
                        Font = Enum.Font.SourceSansBold,
                        TextColor3 = ColorUtil.WHITE,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    })
                })
            });
        end;

        v26[3] = v27;
        v15.Content = createElement(Empty, v25, v26);
        v15.BottomBorder = u2.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 3,
            Size = UDim2.fromScale(1, 0.02),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = u5.RarityColor
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }) });
        local v28 = not v9 and u5.MaxPurchases >= 1;

        if v28 then
            local v29 = {
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0.06, 0.04),
                Size = UDim2.new(1, 0, 0.07, 0)
            };
            local TimesPurchased2 = u5.TimesPurchased;
            v29.Text = "<b>" .. tostring(u5.MaxPurchases - (TimesPurchased2 == nil and 0 or TimesPurchased2)) .. "/" .. tostring(u5.MaxPurchases) .. " Left</b>";
            v29.Font = Enum.Font.Roboto;
            v29.RichText = true;
            v29.TextScaled = true;
            v29.TextXAlignment = Enum.TextXAlignment.Left;
            v29.BackgroundTransparency = 1;
            v29.BorderSizePixel = 0;
            v29.TextTransparency = 0.3;
            v29.TextColor3 = ColorUtil.WHITE;
            v29.ZIndex = 15;
            v28 = u2.createFragment({
                PurchasesLeft = u2.createElement("TextLabel", v29, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 30
                    }) })
            });
        end;

        if v28 then
            v15[v16 + 1] = v28;
        end;

        return u2.createElement("ImageButton", v14, v15);
    end)
};