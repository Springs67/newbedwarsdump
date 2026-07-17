-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local StringUtil = v1.StringUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local UserInputService = v4.UserInputService;
local PlayerViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "player-viewport").PlayerViewport;
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase;
local EventCurrencyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventShopItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-meta").EventShopItemMeta;
local EventShopItemTierMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-tier-meta").EventShopItemTierMeta;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;

return {
    EventShopItemTile = v3.new(u2)(function(u5, p6) -- Line: 26
        -- upvalues: EventShopItemMeta (copy), EmoteMeta (copy), EventCurrencyMeta (copy), EventMeta (copy), EventShopItemTierMeta (copy), EventUtil (copy), u2 (copy), TweenService (copy), ColorUtil (copy), UserInputService (copy), UIUtil (copy), Flamework (copy), DeviceUtil (copy), RewardShowcase (copy), ReplicatedStorage (copy), PlayerViewport (copy), Empty (copy), Padding (copy), AutoSizedText (copy), StringUtil (copy)
        local useEffect = p6.useEffect;
        local u7, u8 = p6.useState(false);
        local u9 = EventShopItemMeta[u5.Item];
        local v10 = nil;
        local animation = u9.animation;

        if animation ~= "" and animation then
            local function _(p11) -- Line: 35
                return p11.emote ~= nil;
            end;

            local v12 = nil;

            for i, v in u9.items do
                local _ = i - 1;

                if v.emote ~= nil == true then
                    v12 = v;
                    break;
                end;
            end;

            if v12 ~= nil then
                v12 = v12.emote;
            end;

            if v12 == nil then
                v12 = nil;
            end;

            if v12 then
                v10 = EmoteMeta[v12];
            end;
        end;

        local v13 = EventCurrencyMeta[u9.currency or EventMeta[u5.EventType].currencies[1]];
        local v14;

        if u9.tier then
            v14 = EventShopItemTierMeta[u9.tier].color;
        else
            v14 = EventUtil.getItemColorRarity(u9.price);
        end;

        local u15 = u2.createRef();
        local u16 = u2.createRef();
        useEffect(function() -- Line: 65
            -- upvalues: u15 (copy), u16 (copy), u7 (copy), TweenService (ref), ColorUtil (ref), u9 (copy)
            local v17 = u15:getValue();
            local v18 = u16:getValue();

            if not (v17 and v18) then
                return nil;
            end;

            if u7 then
                TweenService:Create(v17, TweenInfo.new(0.3), {
                    Size = v17.Size - UDim2.fromScale(0.05, 0.05)
                }):Play();
                TweenService:Create(v18, TweenInfo.new(0.4), {
                    BackgroundColor3 = ColorUtil.darken(Color3.fromHex("#6B6EB5"), 0.8)
                }):Play();

                return;
            end;

            TweenService:Create(v17, TweenInfo.new(0.3), {
                Size = UDim2.new(u9.textImage == nil and 0.65 or 0.8, 0, 0.65, 0)
            }):Play();
            TweenService:Create(v18, TweenInfo.new(0.4), {
                BackgroundColor3 = Color3.fromHex("#6B6EB5")
            }):Play();
        end, { u7 });
        useEffect(function() -- Line: 93
            -- upvalues: UserInputService (ref), UIUtil (ref), u16 (copy)
            if UserInputService.GamepadEnabled then
                UIUtil:selectGui(u16:getValue());
            end;
        end, {});
        local v19 = {
            [u2.Event.Activated] = function() -- Line: 99
                -- upvalues: u5 (copy), u9 (copy), Flamework (ref)
                if u5.SoldOut then
                    return nil;
                end;

                if u9.comingSoon then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = "Can\'t purchase at this time. Coming Soon"
                    });

                    return nil;
                end;

                u5.PromptPurchase(u5.Item);
            end,

            [u2.Event.MouseEnter] = function() -- Line: 111
                -- upvalues: u8 (copy)
                u8(true);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 114
                -- upvalues: u8 (copy)
                u8(false);
            end,

            BackgroundColor3 = Color3.fromHex("#6B6EB5"),
            AutoButtonColor = false,
            Selectable = true,
            BorderSizePixel = 0
        };
        local v20;

        if u9.tier then
            v20 = 1;
        else
            local LayoutOrder = u5.LayoutOrder;
            v20 = (LayoutOrder == nil and 0 or LayoutOrder) + 2;
        end;

        v19.LayoutOrder = v20;
        v19[u2.Ref] = u16;
        local v21 = not u5.SoldOut and u5.MaxPurchases > 1;

        if v21 then
            local v22 = {
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0.06, 0.04),
                Size = UDim2.new(1, 0, 0.07, 0)
            };
            local TimesPurchased = u5.TimesPurchased;
            v22.Text = "<b>" .. tostring(u5.MaxPurchases - (TimesPurchased == nil and 0 or TimesPurchased)) .. "/" .. tostring(u5.MaxPurchases) .. " Left</b>";
            v22.Font = Enum.Font.Roboto;
            v22.RichText = true;
            v22.TextScaled = true;
            v22.TextXAlignment = Enum.TextXAlignment.Left;
            v22.BackgroundTransparency = 1;
            v22.BorderSizePixel = 0;
            v22.TextTransparency = 0.3;
            v22.TextColor3 = ColorUtil.WHITE;
            v21 = u2.createFragment({
                PurchasesLeft = u2.createElement("TextLabel", v22, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 30
                    }) })
            });
        end;

        local v23 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }),
            GradientGlow = u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1)
            }, { u2.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.BLACK), ColorSequenceKeypoint.new(1, v14) }),
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.65) })
                }) })
        };
        local v24 = #v23;

        if v21 then
            v23[v24 + 1] = v21;
        end;

        local _ = #v23;
        local v25 = {
            Size = UDim2.new(u9.textImage == nil and 0.65 or 0.8, 0, 0.65, 0),
            Position = UDim2.fromScale(0.5, 0.325),
            AnchorPoint = Vector2.new(0.5, 0.5),
            [u2.Ref] = u15
        };
        local v26 = {};
        local v27 = #v26;
        local v28 = u9.comingSoon and u2.createFragment({
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

        if v28 then
            v26[v27 + 1] = v28;
        end;

        local v29 = #v26;
        local v30;

        if u9.image == nil then
            v30 = false;
        else
            v30 = u2.createFragment({
                ItemImage = u2.createElement("ImageLabel", {
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = u9.image,
                    Size = UDim2.new(1, 0, 1, 0)
                })
            });
        end;

        if v30 then
            v26[v29 + 1] = v30;
        end;

        local v31 = #v26;
        local v32;

        if u9.textImage == nil then
            v32 = false;
        else
            v32 = u2.createFragment({
                ItemTextImage = u2.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    Text = u9.textImage,
                    Font = Enum.Font.LuckiestGuy,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 30
                    }) })
            });
        end;

        if v32 then
            v26[v31 + 1] = v32;
        end;

        local v33 = #v26;
        local image = u9.image;

        if image == "" then
            image = false;
        end;

        local v34 = not image;

        if v34 then
            local textImage = u9.textImage;

            if textImage == "" then
                textImage = false;
            end;

            v34 = not textImage and (u9.items[1] and u2.createElement(RewardShowcase, {
                Reward = u9.items[1]
            }));
        end;

        if v34 then
            v26[v33 + 1] = v34;
        end;

        local v35 = #v26;
        local v36 = u9.animation ~= nil;

        if v36 then
            local v37 = {
                ImageTransparency = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Animation = u9.animation,
                Size = UDim2.new(1, 0, 1, 0),
                LayoutOrder = u5.LayoutOrder
            };
            local v38;

            if v10 == nil then
                v38 = v10;
            else
                v38 = v10.animation;

                if v38 ~= nil then
                    v38 = v38.previewItems;
                end;
            end;

            v37.PreviewItemTypes = v38;

            if v10 ~= nil then
                v10 = v10.animation;

                if v10 ~= nil then
                    local previewReplicatedStorageAssets = v10.previewReplicatedStorageAssets;

                    if previewReplicatedStorageAssets == nil then
                        v10 = previewReplicatedStorageAssets;
                    else
                        local function v44(p39) -- Line: 283
                            -- upvalues: ReplicatedStorage (ref)
                            local v40 = string.split(p39, "/");
                            local Assets = ReplicatedStorage.Assets;

                            local function _(p41) -- Line: 286
                                -- upvalues: Assets (ref)
                                local v42 = Assets;

                                if v42 ~= nil then
                                    v42 = v42:FindFirstChild(p41);
                                end;

                                if v42 then
                                    Assets = v42;
                                end;
                            end;

                            for i, v in v40 do
                                local _ = i - 1;
                                local v43 = Assets;

                                if v43 ~= nil then
                                    v43 = v43:FindFirstChild(v);
                                end;

                                if v43 then
                                    Assets = v43;
                                end;
                            end;

                            return Assets;
                        end;

                        local v45 = 0;
                        v10 = {};

                        for i, v in previewReplicatedStorageAssets do
                            local v46 = v44(v, i - 1, previewReplicatedStorageAssets);

                            if v46 ~= nil then
                                v45 = v45 + 1;
                                v10[v45] = v46;
                            end;
                        end;
                    end;
                end;
            end;

            v37.PreviewAccessories = v10;
            v36 = u2.createFragment({
                RewardShowcase = u2.createElement(PlayerViewport, v37)
            });
        end;

        if v36 then
            v26[v35 + 1] = v36;
        end;

        v23.ItemFrame = u2.createElement(Empty, v25, v26);
        local createElement = u2.createElement;
        local v47 = {
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1)
        };
        local v48 = {
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
                Text = "<b>" .. string.upper(u9.name) .. "</b>",
                TextColor3 = v14,
                Font = Enum.Font.Roboto
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) })
        };
        local v49;

        if u5.SoldOut then
            v49 = u2.createElement(AutoSizedText, {
                Text = "PURCHASED",
                TextSize = 12,
                ZIndex = 2,
                LayoutOrder = 2,
                Font = Enum.Font.SourceSansBold,
                TextColor3 = ColorUtil.WHITE,
                Limits = Vector2.new(100, 12),
                TextYAlignment = Enum.TextYAlignment.Top
            });
        else
            v49 = u2.createFragment({
                CostContainer = u2.createElement("Frame", {
                    AutomaticSize = "X",
                    BackgroundTransparency = 0.6,
                    BorderSizePixel = 0,
                    LayoutOrder = 2,
                    Size = UDim2.new(0, 0, 0, 20),
                    BackgroundColor3 = v14
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
                        Padding = UDim.new(0, 3)
                    }),
                    CurrencyIcon = u2.createElement("ImageLabel", {
                        SizeConstraint = "RelativeYY",
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        LayoutOrder = -1,
                        ZIndex = 2,
                        Size = UDim2.new(1.2, 0, 1.2, 0),
                        Image = v13.icon
                    }),
                    u2.createElement(AutoSizedText, {
                        TextSize = 11,
                        ZIndex = 2,
                        LayoutOrder = 2,
                        Text = StringUtil.formatNumberWithCommas((tonumber(StringUtil.roundNumber(u9.price, 0)))),
                        Font = Enum.Font.SourceSansBold,
                        TextColor3 = ColorUtil.WHITE,
                        Limits = Vector2.new(100, 12),
                        TextYAlignment = Enum.TextYAlignment.Center
                    })
                })
            });
        end;

        v48[3] = v49;
        v23.Content = createElement(Empty, v47, v48);
        v23.BottomBorder = u2.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 3,
            Size = UDim2.fromScale(1, 0.02),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = v14
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }) });

        return u2.createElement("ImageButton", v19, v23);
    end)
};