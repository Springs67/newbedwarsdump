-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local AfkShopUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ProgressBarUI = RuntimeLib.import(script, script.Parent, "progress-bar-ui").ProgressBarUI;

return {
    AfkPlaceProgressBar = v4.new(u3)(function(u5, p6) -- Line: 15
        -- upvalues: u3 (copy), AfkPlaceUtils (copy), TweenService (copy), u2 (copy), DeviceUtil (copy), ColorUtil (copy), AfkShopUtils (copy), Empty (copy), ProgressBarUI (copy), BedwarsImageId (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local _, u7 = useState(function() -- Line: 28
            -- upvalues: u5 (copy)
            return math.floor(u5.AfkStartTime * 900 / 3600);
        end);
        local _, u8 = useState(u5.AfkCoinStart);
        local _, u9 = useState(u5.BedCoinStart);
        local _, _ = useState(0);
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        local v10 = u3.createRef();
        local v11 = u3.createRef();
        local v12 = u3.createRef();
        local v13 = u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        u3.createRef();
        local u14 = 1;

        if u5.isVip then
            u14 = u14 + AfkPlaceUtils.vipMultiplier;
        end;

        if u5.isPremium then
            u14 = u14 + AfkPlaceUtils.premiumMultiplier;
        end;

        local function _(p15) -- Line: 66
            -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
            if p15 == nil then
                return nil;
            end;

            TweenService:Create(p15, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ImageTransparency = 1
            }):Play();
        end;

        local function _(p16, p17) -- Line: 75
            -- upvalues: TweenService (ref)
            print(p16);

            if not p16 then
                return nil;
            end;

            TweenService:Create(p16, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Size = UDim2.fromScale(p17, 1)
            }):Play();
        end;

        local function _(p18) -- Line: 85
            -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
            if p18 == nil then
                return nil;
            end;

            TweenService:Create(p18, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                TextTransparency = 1,
                TextStrokeTransparency = 1
            }):Play();
        end;

        local function _(p19) -- Line: 95
            -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
            if p19 == nil then
                return nil;
            end;

            TweenService:Create(p19, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                BackgroundTransparency = 1
            }):Play();
        end;

        useEffect(function() -- Line: 104
            -- upvalues: u5 (copy), u2 (ref), AfkPlaceUtils (ref), u7 (copy), u14 (ref), u8 (copy), u9 (copy)
            local u20 = nil;
            local u21 = nil;
            local u22 = nil;
            local u23 = os.time();
            local u24 = os.time() - u5.MountStartTime + u5.AfkStartTime;
            local u25 = u2.new();

            local function u26() -- Line: 112
                -- upvalues: u20 (ref), u23 (copy), u21 (ref), AfkPlaceUtils (ref), u24 (ref), u5 (ref), u7 (ref), u14 (ref), u8 (ref), u9 (ref), u22 (ref), u26 (ref)
                u20 = os.time() - u23;
                u21 = math.floor(u20 * AfkPlaceUtils.baseExperiencePerHour / 3600);
                u24 = os.time() - u5.MountStartTime + u5.AfkStartTime;
                u7((math.floor(u24 * AfkPlaceUtils.baseExperiencePerHour * u14 / 3600)));
                u8((math.floor(u24 * AfkPlaceUtils.baseAfkCoinsPerHour * u14 / 3600)));
                u9((math.floor(u24 * AfkPlaceUtils.baseAfkBedCoinsPerHour * u14 / 3600)));
                u22 = task.delay(1, u26);
            end;

            u26();

            return function() -- Line: 124
                -- upvalues: u22 (ref), u25 (copy)
                if u22 then
                    task.cancel(u22);
                end;

                u25:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 132
            return nil;
        end, { u5.ReturnButtonPressed });
        local v27 = {
            Size = u5.Size or UDim2.fromScale(0.8, 0.6)
        };
        local LayoutOrder = u5.LayoutOrder;
        v27.LayoutOrder = LayoutOrder == nil and 5 or LayoutOrder;
        local v28 = { u3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical,
                Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 12)
            }) };
        local _ = #v28;
        local v29 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 5,
            Size = UDim2.fromScale(0.75, 0.45),
            Position = UDim2.fromScale(0, 0.25),
            BackgroundColor3 = Color3.fromRGB(49, 50, 84)
        };
        local v30 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal
            }), u3.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.12, 1),
                BackgroundColor3 = ColorUtil.WHITE
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u3.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(175, 96, 255)) }),
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.85), NumberSequenceKeypoint.new(1, 0.6) })
                }), u3.createElement("ImageLabel", {
                    Size = UDim2.fromScale(0.7, 0.7),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    SizeConstraint = "RelativeXY",
                    ScaleType = "Fit",
                    Image = AfkShopUtils.currencyIcon,
                    [u3.Ref] = v12,
                    BackgroundTransparency = 1
                }) }) };
        local _ = #v30;
        local v31 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.6, 1)
        };
        local v32 = {
            u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0),
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            CurrencyName = u3.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.425)
            }, { u3.createElement("TextLabel", {
                    Text = AfkShopUtils.currencyName,
                    Size = UDim2.fromScale(0, 1),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.fromScale(0, 0),
                    FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
                    TextScaled = true,
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    LayoutOrder = 0,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    [u3.Ref] = v13
                }), u3.createElement("TextLabel", {
                    Text = "(Base: +" .. tostring(AfkPlaceUtils.baseAfkCoinsPerHour) .. "/hr)",
                    AnchorPoint = Vector2.new(0, 0),
                    Size = UDim2.fromScale(0.25, 0.75),
                    Position = UDim2.fromScale(0.37, 0.15),
                    FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Medium),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextScaled = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = 0.5,
                    LayoutOrder = 1,
                    [u3.Ref] = v13
                }) })
        };
        local _ = #v32;
        local v33 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.35)
        };
        local v34 = {};
        local v35 = u3.createElement("UIListLayout", {
            VerticalAlignment = "Center",
            HorizontalAlignment = "Left",
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal
        });
        local createElement = u3.createElement;
        local v36 = {
            [u3.Ref] = v11
        };
        local v37 = math.round(AfkPlaceUtils.baseAfkCoinsPerHour * u14);
        v36.Text = "+" .. tostring(v37) .. "/Hour";
        v36.AnchorPoint = Vector2.new(0.5, 0.5);
        v36.Position = UDim2.fromScale(0.5, 0.8);
        v36.Size = UDim2.fromScale(0, 1);
        v36.FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold);
        v36.BackgroundTransparency = 1;
        v36.BorderSizePixel = 0;
        v36.AutomaticSize = Enum.AutomaticSize.X;
        v36.TextStrokeTransparency = 1;
        v36.TextScaled = true;
        v36.TextXAlignment = Enum.TextXAlignment.Left;
        v36.TextColor3 = ColorUtil.WHITE;
        v36.TextTransparency = 0.3;
        v36.LayoutOrder = 1;
        v34[1], v34[2] = v35, createElement("TextLabel", v36);
        local v38 = #v34;
        local isVip = u5.isVip;

        if isVip then
            local createElement2 = u3.createElement;
            local v39 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 28,
                TextStrokeTransparency = 1,
                TextTransparency = 0.2,
                TextScaled = true,
                SizeConstraint = "RelativeYY",
                LayoutOrder = 2
            };
            local v40 = math.round(AfkPlaceUtils.baseAfkCoinsPerHour * AfkPlaceUtils.vipMultiplier);
            v39.Text = "(+" .. tostring(v40) .. " VIP)";
            v39.Size = UDim2.fromScale(0, 0.75);
            v39.FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Regular);
            v39.AutomaticSize = Enum.AutomaticSize.X;
            v39.TextXAlignment = Enum.TextXAlignment.Left;
            v39.TextYAlignment = Enum.TextYAlignment.Bottom;
            v39.TextColor3 = Color3.fromRGB(48, 255, 8);
            isVip = createElement2("TextLabel", v39);
        end;

        if isVip then
            v34[v38 + 1] = isVip;
        end;

        local v41 = #v34;
        local isPremium = u5.isPremium;

        if isPremium then
            local createElement2 = u3.createElement;
            local v42 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 28,
                TextStrokeTransparency = 1,
                TextTransparency = 0.2,
                TextScaled = true,
                SizeConstraint = "RelativeYY",
                LayoutOrder = 2
            };
            local v43 = math.round(AfkPlaceUtils.baseAfkCoinsPerHour * AfkPlaceUtils.vipMultiplier);
            v42.Text = "(+" .. tostring(v43) .. " Roblox Premium)";
            v42.Size = UDim2.fromScale(0, 0.75);
            v42.FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Regular);
            v42.AutomaticSize = Enum.AutomaticSize.X;
            v42.TextXAlignment = Enum.TextXAlignment.Left;
            v42.TextYAlignment = Enum.TextYAlignment.Bottom;
            v42.TextColor3 = Color3.fromRGB(255, 247, 100);
            isPremium = createElement2("TextLabel", v42);
        end;

        if isPremium then
            v34[v41 + 1] = isPremium;
        end;

        v32.ActualRate = u3.createElement("Frame", v33, v34);
        v30.MiddleComponent = u3.createElement("Frame", v31, v32);
        v30.AfkAmountPill = u3.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.28, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = 0.55,
            BorderSizePixel = 0,
            [u3.Ref] = v10,
            LayoutOrder = 2
        }, { u3.createElement(ProgressBarUI, {
                startTime = u5.AfkStartTime,
                mountStartTime = u5.MountStartTime,
                multiplier = u14,
                image = AfkShopUtils.currencyIcon,
                rate = AfkPlaceUtils.baseAfkCoinsPerHour,
                isVip = u5.isVip,
                isPremium = u5.isPremium,
                startAmount = u5.AfkCoinStart
            }) });
        v28.AfkCurrencyContainer = u3.createElement("Frame", v29, v30);
        local v44 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 5,
            Size = UDim2.fromScale(0.75, 0.45),
            Position = UDim2.fromScale(0, 0.25),
            BackgroundColor3 = Color3.fromRGB(49, 50, 84)
        };
        local v45 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal
            }), u3.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.12, 1),
                BackgroundColor3 = ColorUtil.WHITE
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u3.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 104)) }),
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.85), NumberSequenceKeypoint.new(1, 0.6) })
                }), u3.createElement("ImageLabel", {
                    Size = UDim2.fromScale(0.6, 0.6),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    SizeConstraint = "RelativeXY",
                    ScaleType = "Fit",
                    Image = BedwarsImageId.BED_COIN_ICON,
                    [u3.Ref] = v12,
                    BackgroundTransparency = 1
                }) }) };
        local _ = #v45;
        local v46 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.6, 1)
        };
        local v47 = {
            u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0),
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            BedcoinCurrencyName = u3.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.425)
            }, { u3.createElement("TextLabel", {
                    Text = "Bed Coins",
                    TextScaled = true,
                    LayoutOrder = 0,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0, 1),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.fromScale(0, 0),
                    FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left
                }), u3.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    TextTransparency = 0.5,
                    LayoutOrder = 1,
                    Text = "(Base: +" .. tostring(AfkPlaceUtils.baseAfkBedCoinsPerHour) .. "/hr)",
                    AnchorPoint = Vector2.new(0, 0),
                    Size = UDim2.fromScale(0.25, 0.75),
                    FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Medium),
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Position = UDim2.fromScale(0.37, 0.15)
                }) })
        };
        local _ = #v47;
        local v48 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.35)
        };
        local v49 = {};
        local v50 = u3.createElement("UIListLayout", {
            VerticalAlignment = "Center",
            HorizontalAlignment = "Left",
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal
        });
        local createElement2 = u3.createElement;
        local v51 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextStrokeTransparency = 1,
            TextScaled = true,
            TextTransparency = 0.3,
            LayoutOrder = 1
        };
        local v52 = math.round(AfkPlaceUtils.baseAfkBedCoinsPerHour * u14);
        v51.Text = "+" .. tostring(v52) .. "/Hour";
        v51.AnchorPoint = Vector2.new(0.5, 0.5);
        v51.Position = UDim2.fromScale(0.5, 0.8);
        v51.Size = UDim2.fromScale(0, 1);
        v51.FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold);
        v51.AutomaticSize = Enum.AutomaticSize.X;
        v51.TextXAlignment = Enum.TextXAlignment.Left;
        v51.TextColor3 = ColorUtil.WHITE;
        v49[1], v49[2] = v50, createElement2("TextLabel", v51);
        local v53 = #v49;
        local isVip2 = u5.isVip;

        if isVip2 then
            local createElement3 = u3.createElement;
            local v54 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 28,
                TextStrokeTransparency = 1,
                TextTransparency = 0.2,
                TextScaled = true,
                SizeConstraint = "RelativeYY",
                LayoutOrder = 2
            };
            local v55 = math.round(AfkPlaceUtils.baseAfkBedCoinsPerHour * AfkPlaceUtils.vipMultiplier);
            v54.Text = "(+" .. tostring(v55) .. " VIP)";
            v54.Size = UDim2.fromScale(0, 0.75);
            v54.FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Regular);
            v54.AutomaticSize = Enum.AutomaticSize.X;
            v54.TextXAlignment = Enum.TextXAlignment.Left;
            v54.TextYAlignment = Enum.TextYAlignment.Bottom;
            v54.TextColor3 = Color3.fromRGB(48, 255, 8);
            isVip2 = createElement3("TextLabel", v54);
        end;

        if isVip2 then
            v49[v53 + 1] = isVip2;
        end;

        local v56 = #v49;
        local isPremium2 = u5.isPremium;

        if isPremium2 then
            local createElement3 = u3.createElement;
            local v57 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 28,
                TextStrokeTransparency = 1,
                TextTransparency = 0.2,
                TextScaled = true,
                SizeConstraint = "RelativeYY",
                LayoutOrder = 2
            };
            local v58 = math.round(AfkPlaceUtils.baseAfkBedCoinsPerHour * AfkPlaceUtils.vipMultiplier);
            v57.Text = "(+" .. tostring(v58) .. " Roblox Premium)";
            v57.Size = UDim2.fromScale(0, 0.75);
            v57.FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Regular);
            v57.AutomaticSize = Enum.AutomaticSize.X;
            v57.TextXAlignment = Enum.TextXAlignment.Left;
            v57.TextYAlignment = Enum.TextYAlignment.Bottom;
            v57.TextColor3 = Color3.fromRGB(255, 247, 100);
            isPremium2 = createElement3("TextLabel", v57);
        end;

        if isPremium2 then
            v49[v56 + 1] = isPremium2;
        end;

        v47.BedcoinActualRate = u3.createElement("Frame", v48, v49);
        v45.BedcoinMiddleComponent = u3.createElement("Frame", v46, v47);
        v45.BedCoinAmountPill = u3.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.28, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = 0.55,
            BorderSizePixel = 0,
            [u3.Ref] = v10,
            LayoutOrder = 2
        }, { u3.createElement(ProgressBarUI, {
                startTime = u5.AfkStartTime,
                mountStartTime = u5.MountStartTime,
                multiplier = u14,
                image = BedwarsImageId.BED_COIN_ICON,
                rate = AfkPlaceUtils.baseAfkBedCoinsPerHour,
                isVip = u5.isVip,
                isPremium = u5.isPremium,
                startAmount = u5.BedCoinStart
            }) });
        v28.AfkBedcoinContainer = u3.createElement("Frame", v44, v45);

        return u3.createFragment({
            ProgressBarContainer = u3.createElement(Empty, v27, v28)
        });
    end)
};