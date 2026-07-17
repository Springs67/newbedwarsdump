-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
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
local AfkShopItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-item-meta").AfkShopItemMeta;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils");
local AfkShopUtils = v5.AfkShopUtils;
local getItemColorRarity = v5.getItemColorRarity;
local EventShopItemTierMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-tier-meta").EventShopItemTierMeta;

return {
    AfkShopItemTile = v3.new(u2)(function(u6, p7) -- Line: 23
        -- upvalues: AfkShopItemMeta (copy), EventShopItemTierMeta (copy), getItemColorRarity (copy), u2 (copy), TweenService (copy), ColorUtil (copy), UserInputService (copy), UIUtil (copy), DeviceUtil (copy), Flamework (copy), PlayerViewport (copy), Empty (copy), Padding (copy), AfkShopUtils (copy), AutoSizedText (copy), StringUtil (copy)
        local useEffect = p7.useEffect;
        local u8, u9 = p7.useState(false);
        local u10 = AfkShopItemMeta[u6.Item];
        local v11;

        if u10.tier then
            v11 = EventShopItemTierMeta[u10.tier].color;
        else
            v11 = getItemColorRarity(u10.price);
        end;

        local u12 = u2.createRef();
        local u13 = u2.createRef();
        local v14 = u6.MaxPurchases == (1 / 0);
        useEffect(function() -- Line: 33
            -- upvalues: u12 (copy), u13 (copy), u8 (copy), TweenService (ref), ColorUtil (ref), u10 (copy)
            local v15 = u12:getValue();
            local v16 = u13:getValue();

            if not (v15 and v16) then
                return nil;
            end;

            if u8 then
                TweenService:Create(v15, TweenInfo.new(0.3), {
                    Size = v15.Size - UDim2.fromScale(0.05, 0.05)
                }):Play();
                TweenService:Create(v16, TweenInfo.new(0.4), {
                    BackgroundColor3 = ColorUtil.darken(Color3.fromHex("#6B6EB5"), 0.8)
                }):Play();

                return;
            end;

            TweenService:Create(v15, TweenInfo.new(0.3), {
                Size = UDim2.new(u10.textImage == nil and 0.65 or 0.8, 0, 0.65, 0)
            }):Play();
            TweenService:Create(v16, TweenInfo.new(0.4), {
                BackgroundColor3 = Color3.fromHex("#6B6EB5")
            }):Play();
        end, { u8 });
        useEffect(function() -- Line: 61
            -- upvalues: UserInputService (ref), UIUtil (ref), u13 (copy)
            if UserInputService.GamepadEnabled then
                UIUtil:selectGui(u13:getValue());
            end;
        end, {});
        local v17 = not u6.SoldOut;

        if v17 then
            if u6.MaxPurchases > 1 then
                v17 = not v14;
            else
                v17 = false;
            end;
        end;

        if v17 then
            local v18 = {
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0.06, 0.04),
                Size = UDim2.new(1, 0, 0.07, 0)
            };
            local TimesPurchased = u6.TimesPurchased;
            v18.Text = "<b>" .. tostring(u6.MaxPurchases - (TimesPurchased == nil and 0 or TimesPurchased)) .. "/" .. tostring(u6.MaxPurchases) .. " Left</b>";
            v18.Font = Enum.Font.Roboto;
            v18.RichText = true;
            v18.TextScaled = true;
            v18.TextXAlignment = Enum.TextXAlignment.Left;
            v18.BackgroundTransparency = 1;
            v18.BorderSizePixel = 0;
            v18.TextTransparency = 0.3;
            v18.TextColor3 = ColorUtil.WHITE;
            v17 = u2.createFragment({
                PurchasesLeft = u2.createElement("TextLabel", v18, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 30
                    }) })
            });
        end;

        local v19 = {
            [u2.Event.Activated] = function() -- Line: 96
                -- upvalues: u6 (copy), u10 (copy), Flamework (ref)
                if u6.SoldOut then
                    return nil;
                end;

                if u10.comingSoon then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = "Can\'t purchase at this time. Coming Soon"
                    });

                    return nil;
                end;

                u6.PromptPurchase(u6.Item);
            end,

            [u2.Event.MouseEnter] = function() -- Line: 108
                -- upvalues: u9 (copy)
                u9(true);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 111
                -- upvalues: u9 (copy)
                u9(false);
            end,

            BackgroundColor3 = Color3.fromHex("#6B6EB5"),
            AutoButtonColor = false,
            Selectable = true,
            BorderSizePixel = 0,
            LayoutOrder = u10.tier and 1 or u6.LayoutOrder,
            [u2.Ref] = u13
        };
        local v20 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }),
            GradientGlow = u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1)
            }, { u2.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.BLACK), ColorSequenceKeypoint.new(1, v11) }),
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.65) })
                }) })
        };
        local v21 = #v20;

        if v17 then
            v20[v21 + 1] = v17;
        end;

        local _ = #v20;
        local v22 = {
            Size = UDim2.new(u10.textImage == nil and 0.65 or 0.8, 0, 0.65, 0),
            Position = UDim2.fromScale(0.5, 0.325),
            AnchorPoint = Vector2.new(0.5, 0.5),
            [u2.Ref] = u12
        };
        local v23 = {};
        local v24 = #v23;
        local v25 = u10.comingSoon and u2.createFragment({
            ItemTextImage = u2.createElement("TextLabel", {
                Text = "COMING SOON...",
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.LuckiestGuy,
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 30
                }) })
        });

        if v25 then
            v23[v24 + 1] = v25;
        end;

        local v26 = #v23;
        local v27;

        if u10.image == nil then
            v27 = false;
        else
            v27 = u2.createFragment({
                ItemImage = u2.createElement("ImageLabel", {
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = u10.image,
                    Size = UDim2.new(1, 0, 1, 0)
                })
            });
        end;

        if v27 then
            v23[v26 + 1] = v27;
        end;

        local v28 = #v23;
        local v29;

        if u10.textImage == nil then
            v29 = false;
        else
            v29 = u2.createFragment({
                ItemTextImage = u2.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    Text = u10.textImage,
                    Font = Enum.Font.LuckiestGuy,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 30
                    }) })
            });
        end;

        if v29 then
            v23[v28 + 1] = v29;
        end;

        local v30 = #v23;
        local v31;

        if u10.animation == nil then
            v31 = false;
        else
            v31 = u2.createFragment({
                RewardShowcase = u2.createElement(PlayerViewport, {
                    ImageTransparency = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Animation = u10.animation,
                    Size = UDim2.new(1, 0, 1, 0),
                    LayoutOrder = u6.LayoutOrder
                })
            });
        end;

        if v31 then
            v23[v30 + 1] = v31;
        end;

        v20.ItemFrame = u2.createElement(Empty, v22, v23);
        local createElement = u2.createElement;
        local v32 = {
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1)
        };
        local v33 = {
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
                Text = "<b>" .. string.upper(u10.name) .. "</b>",
                TextColor3 = v11,
                Font = Enum.Font.Roboto
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) })
        };
        local v34;

        if u6.SoldOut then
            v34 = u2.createElement(AutoSizedText, {
                Text = "PURCHASED",
                TextSize = 12,
                ZIndex = 2,
                LayoutOrder = 2,
                Font = Enum.Font.SourceSansBold,
                TextColor3 = ColorUtil.WHITE,
                Limits = Vector2.new(100, 24),
                TextYAlignment = Enum.TextYAlignment.Top
            });
        else
            v34 = u2.createFragment({
                CostContainer = u2.createElement("Frame", {
                    AutomaticSize = "X",
                    BackgroundTransparency = 0.6,
                    BorderSizePixel = 0,
                    LayoutOrder = 2,
                    Size = UDim2.new(0, 0, 0, 20),
                    BackgroundColor3 = v11
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
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 6)
                    }),
                    CurrencyIcon = u2.createElement("ImageLabel", {
                        SizeConstraint = "RelativeYY",
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        LayoutOrder = -1,
                        ZIndex = 2,
                        Size = UDim2.new(1, 0, 1, 0),
                        Image = AfkShopUtils.currencyIcon
                    }),
                    u2.createElement(AutoSizedText, {
                        TextSize = 11,
                        ZIndex = 2,
                        LayoutOrder = 2,
                        Text = StringUtil.formatNumberWithCommas((tonumber(StringUtil.roundNumber(u10.price, 0)))),
                        Font = Enum.Font.SourceSansBold,
                        TextColor3 = ColorUtil.WHITE,
                        Limits = Vector2.new(100, 12),
                        TextYAlignment = Enum.TextYAlignment.Center
                    })
                })
            });
        end;

        v33[3] = v34;
        v20.Content = createElement(Empty, v32, v33);
        v20.BottomBorder = u2.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 3,
            Size = UDim2.fromScale(1, 0.02),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = v11
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }) });

        return u2.createElement("ImageButton", v19, v20);
    end)
};