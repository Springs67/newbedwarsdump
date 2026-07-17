-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConfettiGroup = v1.ConfettiGroup;
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local Padding = v1.Padding;
local ShineEffect = v1.ShineEffect;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v4.MarketplaceService;
local Players = v4.Players;
local Ripple = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "ripple").Ripple;
local RobuxProductType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType;
local MarketplaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil;
local BasePurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "base-purchase-button").BasePurchaseButton;
local GiftPurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "gift-purchase-button").GiftPurchaseButton;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "gradient");
local Gradient = v5.Gradient;
local GradientAnimationType = v5.GradientAnimationType;
local RewardTile = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile;

return {
    RobuxStoreBannerCard = v3.new(u2)(function(u6, p7) -- Line: 23
        -- upvalues: RobuxProductType (copy), MarketplaceService (copy), Players (copy), MarketplaceUtil (copy), u2 (copy), GradientAnimationType (copy), Gradient (copy), Ripple (copy), ShineEffect (copy), ConfettiGroup (copy), Padding (copy), Countdown (copy), Empty (copy), RewardTile (copy), GiftPurchaseButton (copy), BasePurchaseButton (copy)
        local useEffect = p7.useEffect;
        local Contents = u6.Contents;

        if Contents ~= nil then
            local Rewards = Contents.Rewards;
            Contents = Rewards ~= nil and #Rewards or Rewards;
        end;

        local v8 = Contents == nil and 0 or Contents;
        local u9, u10 = p7.useState(nil);
        local v11 = (v8 > 6 and 0.75 or 1) * 0.2;
        local v12 = (v8 > 6 and 0.75 or 1) * 0.1;
        local v13 = v8 > 6 and 2.2884615384615383 or 2.975;

        local function v14() -- Line: 46
            -- upvalues: u6 (copy), RobuxProductType (ref), MarketplaceService (ref), Players (ref)
            if u6.EndTime ~= nil and os.time() > u6.EndTime then
                return nil;
            end;

            if u6.Product.ProductType == RobuxProductType.GamePass then
                MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, u6.Product.ProductId);

                return;
            end;

            if u6.Product.ProductType == RobuxProductType.DevProduct then
                MarketplaceService:PromptProductPurchase(Players.LocalPlayer, u6.Product.ProductId);
            end;
        end;

        local function _() -- Line: 57
            -- upvalues: u9 (copy), u6 (copy)
            local v15 = u9;

            if v15 == nil then
                v15 = u6.Product.Price;
            end;

            return v15;
        end;

        useEffect(function() -- Line: 64
            -- upvalues: u10 (copy), u6 (copy), RobuxProductType (ref), MarketplaceUtil (ref)
            u10(nil);

            if u6.Product.ProductType == RobuxProductType.DevProduct then
                MarketplaceUtil.getDevProductInfoAsync(u6.Product.ProductId):andThen(function(p16) -- Line: 68
                    -- upvalues: u10 (ref)
                    local v17;

                    if p16 == nil then
                        v17 = p16;
                    else
                        v17 = p16.PriceInRobux;
                    end;

                    if v17 ~= nil then
                        u10(p16.PriceInRobux);
                    end;
                end):catch(function() -- Line: 77
                end);

                return;
            end;

            if u6.Product.ProductType == RobuxProductType.GamePass then
                MarketplaceUtil.getGamePassProductInfoAsync(u6.Product.ProductId):andThen(function(p18) -- Line: 80
                    -- upvalues: u10 (ref)
                    local v19;

                    if p18 == nil then
                        v19 = p18;
                    else
                        v19 = p18.PriceInRobux;
                    end;

                    if v19 ~= nil then
                        u10(p18.PriceInRobux);
                    end;
                end):catch(function() -- Line: 89
                end);
            end;
        end, { u6.Product });
        local v20 = {
            Size = u6.Size or UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
            LayoutOrder = u6.LayoutOrder,
            ClipsDescendants = true,

            [u2.Event.Activated] = function() -- Line: 98
                -- upvalues: u6 (copy)
                local OnClick = u6.OnClick;

                if OnClick ~= nil then
                    OnClick();
                end;
            end,

            Selectable = false
        };
        local v21 = {};
        local v22 = #v21;
        local v23 = {};
        local AspectRatio = u6.AspectRatio;

        if AspectRatio == nil then
            AspectRatio = v13;
        end;

        v23.AspectRatio = AspectRatio;
        v21[v22 + 1] = u2.createElement("UIAspectRatioConstraint", v23);
        v21[v22 + 2] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        });
        local v24 = {
            Color = u6.BackgroundGradient or ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 44, 59)) })
        };
        local Effects = u6.Effects;

        if Effects ~= nil then
            Effects = Effects.DisableBGGradientAnim;
        end;

        local v25;

        if Effects then
            v25 = nil;
        else
            v25 = GradientAnimationType.ROTATE;
        end;

        v24.Animation = v25;
        v24.Rotation = 90;
        v21[v22 + 3] = u2.createElement(Gradient, v24);
        local v26 = u6[u2.Children];

        if v26 then
            for i, v in v26 do
                if type(i) == "number" then
                    v21[v22 + 3 + i] = v;
                else
                    v21[i] = v;
                end;
            end;
        end;

        local v27 = #v21;
        local BackgroundImage = u6.BackgroundImage;

        if BackgroundImage then
            local v28 = {
                Size = UDim2.fromScale(1, 1),
                Image = u6.BackgroundImage.Image
            };
            local Transparency = u6.BackgroundImage.Transparency;
            v28.ImageTransparency = Transparency == nil and 0.95 or Transparency;
            v28.BackgroundTransparency = 1;
            v28.ScaleType = Enum.ScaleType.Crop;
            BackgroundImage = u2.createFragment({
                BackgroundImage = u2.createElement("ImageLabel", v28, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }) })
            });
        end;

        if BackgroundImage then
            v21[v27 + 1] = BackgroundImage;
        end;

        local v29 = #v21;
        local Effects2 = u6.Effects;

        if Effects2 ~= nil then
            Effects2 = Effects2.Ripple;
        end;

        if Effects2 then
            Effects2 = u2.createElement(Ripple);
        end;

        if Effects2 then
            v21[v29 + 1] = Effects2;
        end;

        local v30 = #v21;
        local Effects3 = u6.Effects;

        if Effects3 ~= nil then
            Effects3 = Effects3.ShineEffect;
        end;

        if Effects3 then
            Effects3 = u2.createElement(ShineEffect);
        end;

        if Effects3 then
            v21[v30 + 1] = Effects3;
        end;

        local v31 = #v21;
        local Effects4 = u6.Effects;

        if Effects4 ~= nil then
            Effects4 = Effects4.Confetti;
        end;

        if Effects4 then
            Effects4 = u2.createElement(ConfettiGroup, {
                Lifetime = 10,
                ConfettiSizeScale = 0.01,
                Direction = UDim2.new(0, 0, 0.6, 0)
            });
        end;

        if Effects4 then
            v21[v31 + 1] = Effects4;
        end;

        local v32 = #v21;
        local Discount = u6.Discount;

        if Discount ~= nil then
            Discount = Discount.OriginalPrice;
        end;

        local v33 = Discount ~= nil;

        if v33 then
            local v34 = {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.25, 0.18),
                Position = UDim2.fromScale(0.95, 0),
                AnchorPoint = Vector2.new(1, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            };
            local v35 = {
                u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 2.193548387096774
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 2)
                }),
                u2.createElement(Padding, {
                    Padding = {
                        Horizontal = 8,
                        Vertical = 4
                    }
                }),
                UIGradientTest = u2.createElement(Gradient, {
                    Rotation = 90,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 34, 34)), ColorSequenceKeypoint.new(1, Color3.fromRGB(191, 28, 28)) })
                })
            };
            local v36 = #v35;
            local v37;

            if u6.Discount.OriginalPrice == nil then
                v37 = false;
            else
                local createFragment = u2.createFragment;
                local v38 = {};
                local createElement = u2.createElement;
                local v39 = {
                    BackgroundTransparency = 1,
                    TextXAlignment = "Center",
                    TextScaled = true,
                    Size = UDim2.fromScale(0.95, 0.95),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v40;

                if u9 == nil then
                    v40 = u6.Product.Price;
                else
                    v40 = u9;
                end;

                local v41 = math.round((u6.Discount.OriginalPrice - v40) / u6.Discount.OriginalPrice * 100);
                v39.Text = "-" .. tostring(v41) .. "%";
                v39.TextColor3 = Color3.fromRGB(255, 255, 255);
                v39.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold);
                v38[1] = createElement("TextLabel", v39, { u2.createElement("UIStroke", {
        Transparency = 0.45,
        Thickness = 1.5,
        Color = Color3.fromRGB(0, 0, 0)
    }) });
                v37 = createFragment(v38);
            end;

            if v37 then
                v35[v36 + 1] = v37;
            end;

            v33 = u2.createFragment({
                DiscountContainer = u2.createElement("Frame", v34, v35)
            });
        end;

        if v33 then
            v21[v32 + 1] = v33;
        end;

        local _ = #v21;
        local v42 = {
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v43 = { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.055, 0),
                PaddingRight = UDim.new(0.055, 0),
                PaddingBottom = UDim.new(v8 > 6 and 0.06 or 0.08, 0),
                PaddingTop = UDim.new(v8 > 6 and 0.06 or 0.08, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Bottom",
                SortOrder = "LayoutOrder",
                VerticalFlex = Enum.UIFlexAlignment.SpaceAround
            }) };
        local v44 = #v43;
        local v45;

        if u6.Title == nil then
            v45 = false;
        else
            v45 = u2.createFragment({
                Title = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextXAlignment = "Left",
                    TextScaled = true,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, v11),
                    Text = u6.Title,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }, {
                    UIGradientTest = u2.createElement(Gradient, {
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 231, 159)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 63)) })
                    })
                })
            });
        end;

        if v45 then
            v43[v44 + 1] = v45;
        end;

        local v46 = #v43;
        local v47;

        if u6.EndTime == nil then
            v47 = false;
        else
            v47 = u2.createElement(Countdown, {
                EndTime = u6.EndTime,
                PreText = "<font transparency=\"" .. tostring(0.2) .. "\">⌛ Expires In: </font>",
                TextLabel = {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0, v12),
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }
            });
        end;

        if v47 then
            v43[v46 + 1] = v47;
        end;

        local v48 = #v43;
        local v49 = {
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, (v8 > 6 and 1.33 or 1) * 0.41 + (u6.EndTime ~= nil and 0 or v12))
        };
        local v50 = {};
        local v51 = #v50;
        local v52 = {};
        local Contents2 = u6.Contents;

        if Contents2 ~= nil then
            Contents2 = Contents2.Description;
        end;

        v52.FillDirection = Contents2 and "Horizontal" or "Vertical";
        v52.SortOrder = "LayoutOrder";
        v52.Padding = UDim.new(0, 12);
        v50[v51 + 1] = u2.createElement("UIListLayout", v52);
        local Contents3 = u6.Contents;

        if Contents3 ~= nil then
            Contents3 = Contents3.Description;
        end;

        if Contents3 then
            local v53 = {};
            local Contents4 = u6.Contents;

            if Contents4 ~= nil then
                Contents4 = Contents4.Rewards;
            end;

            v53.Size = UDim2.new(Contents4 and 0.45 or 1, 0, 1, 0);
            v53.LayoutOrder = 2;
            local Contents5 = u6.Contents;

            if Contents5 ~= nil then
                local Description = Contents5.Description;

                if Description == nil then
                    Contents5 = Description;
                else
                    local function v56(p54, p55) -- Line: 351
                        -- upvalues: u2 (ref), u6 (copy)
                        return u2.createElement("TextLabel", {
                            BackgroundTransparency = 1,
                            TextXAlignment = "Left",
                            RichText = true,
                            TextScaled = true,
                            LineHeight = 1.25,
                            Size = UDim2.fromScale(1, (math.max(1 / #u6.Contents.Description, 0.2))),
                            Text = p54,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Medium),
                            LayoutOrder = p55
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 24
                            }) });
                    end;

                    Contents5 = table.create(#Description);

                    for i, v in Description do
                        Contents5[i] = v56(v, i - 1, Description);
                    end;
                end;
            end;

            local v57 = { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 8)
                }) };
            local v58 = #v57;

            for i, v in Contents5 do
                v57[v58 + i] = v;
            end;

            Contents3 = u2.createElement(Empty, v53, v57);
        end;

        if Contents3 then
            v50[v51 + 2] = Contents3;
        end;

        local v59 = #v50;
        local Contents4 = u6.Contents;

        if Contents4 ~= nil then
            Contents4 = Contents4.Rewards;
        end;

        if Contents4 then
            local Contents5 = u6.Contents;
            local v60;

            if (Contents5 ~= nil and #Contents5.Rewards or Contents5) > 6 then
                local v61 = {};
                local Contents6 = u6.Contents;

                if Contents6 ~= nil then
                    Contents6 = Contents6.Description;
                end;

                local Contents7 = u6.Contents;

                if Contents7 ~= nil then
                    Contents7 = Contents7.Description;
                end;

                v61.Size = UDim2.new(Contents6 and 0.55 or 1, 0, 1, Contents7 and -6 or 0);
                v61.LayoutOrder = 2;
                v61.BorderSizePixel = 0;
                v61.BackgroundTransparency = 1;
                v61.AutomaticCanvasSize = Enum.AutomaticSize.Y;
                v61.CanvasSize = UDim2.fromScale(1, 1);
                v61.ScrollBarThickness = 3;
                v61.ScrollBarImageTransparency = 0.3;
                v61.ScrollingDirection = Enum.ScrollingDirection.Y;
                local v62 = {};
                local v63 = #v62;
                local v64 = {};
                local AspectRatio2 = u6.AspectRatio;
                v64.PaddingRight = UDim.new(0, (AspectRatio2 == 0 or (AspectRatio2 ~= AspectRatio2 or not AspectRatio2)) and 16 or u6.AspectRatio / 2.5 * 16);
                v64.PaddingLeft = UDim.new(0, 2);
                v64.PaddingTop = UDim.new(0, 6);
                v62[v63 + 1] = u2.createElement("UIPadding", v64);
                local v65 = {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Top",
                    SortOrder = "LayoutOrder",
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                };
                local Contents8 = u6.Contents;

                if Contents8 ~= nil then
                    Contents8 = Contents8.Description;
                end;

                v65.FillDirectionMaxCells = Contents8 and 5 or 6;
                v65.CellSize = UDim2.new(0, 76, 0, 76);
                v65.CellPadding = UDim2.new(0, 10, 0, 10);
                local UIGridLayout = u6.Contents.UIGridLayout;

                if UIGridLayout then
                    for i, v in UIGridLayout do
                        v65[i] = v;
                    end;
                end;

                v62[v63 + 2] = u2.createElement("UIGridLayout", v65);
                local Contents9 = u6.Contents;

                if Contents9 ~= nil then
                    local Rewards = Contents9.Rewards;

                    if Rewards == nil then
                        Contents9 = Rewards;
                    else
                        local function _(p66) -- Line: 458
                            -- upvalues: u2 (ref), RewardTile (ref)
                            return u2.createElement(RewardTile, {
                                Reward = p66
                            });
                        end;

                        Contents9 = table.create(#Rewards);

                        for i, v in Rewards do
                            local _ = i - 1;
                            Contents9[i] = u2.createElement(RewardTile, {
                                Reward = v
                            });
                        end;
                    end;
                end;

                for i, v in Contents9 do
                    v62[v63 + 2 + i] = v;
                end;

                v60 = u2.createElement("ScrollingFrame", v61, v62);
            else
                local v67 = {};
                local Contents6 = u6.Contents;

                if Contents6 ~= nil then
                    Contents6 = Contents6.Description;
                end;

                local Contents7 = u6.Contents;

                if Contents7 ~= nil then
                    Contents7 = Contents7.Description;
                end;

                v67.Size = UDim2.new(Contents6 and 0.55 or 1, 0, 1, Contents7 and -6 or 0);
                v67.LayoutOrder = 2;
                local v68 = {};
                local v69 = #v68;
                local v70 = {};
                local AspectRatio2 = u6.AspectRatio;
                v70.PaddingRight = UDim.new(0, (AspectRatio2 == 0 or (AspectRatio2 ~= AspectRatio2 or not AspectRatio2)) and 16 or u6.AspectRatio / 2.5 * 16);
                v68[v69 + 1] = u2.createElement("UIPadding", v70);
                local v71 = {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Top",
                    SortOrder = "LayoutOrder",
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                };
                local Contents8 = u6.Contents;

                if Contents8 ~= nil then
                    Contents8 = Contents8.Description;
                end;

                v71.FillDirectionMaxCells = Contents8 and 5 or 6;
                v71.CellSize = UDim2.new(0, 76, 0, 76);
                v71.CellPadding = UDim2.new(0, 10, 0, 10);
                local UIGridLayout = u6.Contents.UIGridLayout;

                if UIGridLayout then
                    for i, v in UIGridLayout do
                        v71[i] = v;
                    end;
                end;

                v68[v69 + 2] = u2.createElement("UIGridLayout", v71);
                local Contents9 = u6.Contents;

                if Contents9 ~= nil then
                    local Rewards = Contents9.Rewards;

                    if Rewards == nil then
                        Contents9 = Rewards;
                    else
                        local function _(p72) -- Line: 519
                            -- upvalues: u2 (ref), RewardTile (ref)
                            return u2.createElement(RewardTile, {
                                Reward = p72
                            });
                        end;

                        Contents9 = table.create(#Rewards);

                        for i, v in Rewards do
                            local _ = i - 1;
                            Contents9[i] = u2.createElement(RewardTile, {
                                Reward = v
                            });
                        end;
                    end;
                end;

                for i, v in Contents9 do
                    v68[v69 + 2 + i] = v;
                end;

                v60 = u2.createElement(Empty, v67, v68);
            end;

            local v73 = {
                [#v73 + 1] = v60
            };
            Contents4 = u2.createFragment(v73);
        end;

        if Contents4 then
            v50[v59 + 1] = Contents4;
        end;

        v43[v48 + 1] = u2.createElement(Empty, v49, v50);
        v43[v48 + 2] = u2.createElement(Empty, {
            LayoutOrder = 5,
            Size = UDim2.fromScale(1, 0.01)
        });
        local v74 = {
            LayoutOrder = 10,
            Size = UDim2.fromScale(1, (v8 > 6 and 0.75 or 1) * 0.22)
        };
        local v75 = {};
        local v76 = #v75;
        local v77 = {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Right",
            SortOrder = "LayoutOrder"
        };
        local AspectRatio2 = u6.AspectRatio;
        v77.Padding = UDim.new(0, (AspectRatio2 == 0 or (AspectRatio2 ~= AspectRatio2 or not AspectRatio2)) and 16 or u6.AspectRatio / 2.5 * 16);
        v75[v76 + 1] = u2.createElement("UIListLayout", v77);
        local GiftType = u6.Product.GiftType;

        if GiftType then
            local createElement = u2.createElement;
            local v78 = {
                ZIndex = 2,
                GiftType = u6.Product.GiftType
            };
            v78.GamepadShouldAutoSelect = u6.IsOwned and u6.GamepadShouldAutoSelect;
            GiftType = createElement(GiftPurchaseButton, v78);
        end;

        if GiftType then
            v75[v76 + 2] = GiftType;
        end;

        local v79;

        if u6.IsOwned then
            v79 = u2.createElement("TextLabel", {
                Text = "OWNED",
                TextXAlignment = "Center",
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                ZIndex = 3,
                Size = UDim2.fromScale(0.3, 0.3),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            });
        else
            local v80 = {};

            if u9 == nil then
                u9 = u6.Product.Price;
            end;

            v80.Price = u9;
            v80.OnClick = v14;
            local v81;

            if u6.Discount then
                v81 = {};
                local Discount2 = u6.Discount;

                if Discount2 ~= nil then
                    Discount2 = Discount2.OriginalPrice;
                end;

                v81.OriginalPrice = Discount2;
            else
                v81 = nil;
            end;

            v80.Discount = v81;
            v80.ZIndex = 2;
            v80.TextPositionScaleShift = 0.05;
            v80.Effects = {
                Shine = true
            };
            v80.GamepadShouldAutoSelect = u6.GamepadShouldAutoSelect;
            v79 = u2.createElement(BasePurchaseButton, v80);
        end;

        v75[#v75 + 1] = v79;
        v43.PurchaseButtons = u2.createElement(Empty, v74, v75);
        v21.Content = u2.createElement(Empty, v42, v43);

        return u2.createFragment({
            Card = u2.createElement("ImageButton", v20, v21)
        });
    end)
};