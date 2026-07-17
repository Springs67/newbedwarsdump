-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v4.MarketplaceService;
local Players = v4.Players;
local TweenService = v4.TweenService;
local Badge = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "badge").Badge;
local BasePurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "base-purchase-button").BasePurchaseButton;
local GiftPurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "gift-purchase-button").GiftPurchaseButton;
local Gradient = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "gradient").Gradient;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local RobuxProductType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType;
local UgcMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-meta").UgcMeta;
local MarketplaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil;

return {
    RobuxStoreItemShowcaseCard = v3.new(u2)(function(u5, p6) -- Line: 25
        -- upvalues: u2 (copy), RobuxProductType (copy), MarketplaceService (copy), Players (copy), default (copy), UgcMeta (copy), MarketplaceUtil (copy), TweenService (copy), SoundManager (copy), GameSound (copy), DeviceUtil (copy), UIUtil (copy), Badge (copy), BedwarsImageId (copy), ColorUtil (copy), Gradient (copy), GiftPurchaseButton (copy), BasePurchaseButton (copy), Empty (copy)
        local useState = p6.useState;
        local useValue = p6.useValue;
        local useEffect = p6.useEffect;
        local u7 = u2.createRef();
        local u8, u9 = useState(false);
        local u10, u11 = useState(nil);
        local u12 = useValue(u2.createRef());
        local u13 = u2.createRef();
        local AspectRatio = u5.AspectRatio;
        local v14 = AspectRatio == nil and 0.8043478260869565 or AspectRatio;
        local u15 = UDim2.fromScale(1.45, 1.45);

        local function v16() -- Line: 41
            -- upvalues: u5 (copy), RobuxProductType (ref), MarketplaceService (ref), Players (ref), default (ref)
            if u5.Product.ProductType == RobuxProductType.GamePass then
                MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, u5.Product.ProductId);

                return;
            end;

            if u5.Product.ProductType == RobuxProductType.DevProduct then
                MarketplaceService:PromptProductPurchase(Players.LocalPlayer, u5.Product.ProductId);

                return;
            end;

            if u5.Product.ProductType == RobuxProductType.BedwarsUGC then
                default.Client:Get("PurchaseUGCRequest"):SendToServer({
                    ugcType = u5.Product.UgcType
                });
            end;
        end;

        local function _() -- Line: 52
            -- upvalues: u5 (copy), RobuxProductType (ref), u10 (copy), UgcMeta (ref)
            if u5.Product.ProductType == RobuxProductType.GamePass or u5.Product.ProductType == RobuxProductType.DevProduct then
                local v17 = u10;

                if v17 == nil then
                    v17 = u5.Product.Price;
                end;

                return v17;
            end;

            if u5.Product.ProductType ~= RobuxProductType.BedwarsUGC then
                return 0;
            end;

            local Price = u5.Product.Price;

            if Price == nil then
                Price = UgcMeta[u5.Product.UgcType].basePrice;
            end;

            return Price;
        end;

        useEffect(function() -- Line: 68
            -- upvalues: u11 (copy), u5 (copy), RobuxProductType (ref), MarketplaceUtil (ref)
            u11(nil);

            if u5.Product.ProductType == RobuxProductType.DevProduct then
                MarketplaceUtil.getDevProductInfoAsync(u5.Product.ProductId):andThen(function(p18) -- Line: 72
                    -- upvalues: u11 (ref)
                    local v19;

                    if p18 == nil then
                        v19 = p18;
                    else
                        v19 = p18.PriceInRobux;
                    end;

                    if v19 ~= nil then
                        u11(p18.PriceInRobux);
                    end;
                end):catch(function() -- Line: 81
                end);

                return;
            end;

            if u5.Product.ProductType == RobuxProductType.GamePass then
                MarketplaceUtil.getGamePassProductInfoAsync(u5.Product.ProductId):andThen(function(p20) -- Line: 84
                    -- upvalues: u11 (ref)
                    local v21;

                    if p20 == nil then
                        v21 = p20;
                    else
                        v21 = p20.PriceInRobux;
                    end;

                    if v21 ~= nil then
                        u11(p20.PriceInRobux);
                    end;
                end):catch(function() -- Line: 93
                end);
            end;
        end, { u5.Product });
        useEffect(function() -- Line: 96
            -- upvalues: u12 (copy), u13 (copy), u8 (copy), TweenService (ref), SoundManager (ref), GameSound (ref), u15 (copy)
            local v22 = u12.value:getValue();

            if not v22 then
                return nil;
            end;

            local v23 = u13:getValue();

            if not v23 then
                return nil;
            end;

            if not u8 then
                TweenService:Create(v22, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                    ImageTransparency = 0,
                    Size = u15
                }):Play();
                TweenService:Create(v23, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                    ImageTransparency = 1
                }):Play();

                return;
            end;

            TweenService:Create(v22, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                ImageTransparency = 0.4,
                Size = UDim2.fromScale(1.6, 1.6)
            }):Play();
            TweenService:Create(v23, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                ImageTransparency = 0.2
            }):Play();
            SoundManager:playSound(GameSound.UI_HOVER);
        end, { u8 });
        useEffect(function() -- Line: 124
            -- upvalues: u5 (copy), DeviceUtil (ref), u7 (copy), UIUtil (ref)
            if u5.GamepadShouldAutoSelect and (DeviceUtil.isGamepadControls() and not DeviceUtil.isHoarceKat()) then
                UIUtil:selectGui((u7:getValue()));
            end;
        end, {});
        local v24 = {
            Size = u5.Size or UDim2.fromScale(1, 1)
        };
        local v25 = {};
        local v26 = #v25;
        local v27 = u5.New and u2.createElement(Badge, {
            Text = "NEW",
            Size = UDim2.fromScale(0.2, 0.2),
            FrameProps = {
                Position = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.new(0.4, 0.25)
            }
        });

        if v27 then
            v25[v26 + 1] = v27;
        end;

        local v28 = #v25;
        local v29 = u5.OnClick and u2.createFragment({
            PreviewIndicator = u2.createElement("ImageLabel", {
                [u2.Ref] = u13,
                Size = UDim2.fromScale(0.4, 0.4),
                ScaleType = Enum.ScaleType.Fit,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = BedwarsImageId.EYE_SOLID,
                ImageColor3 = ColorUtil.WHITE,
                ImageTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ZIndex = 10
            })
        });

        if v29 then
            v25[v28 + 1] = v29;
        end;

        local _ = #v25;
        local v30 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
            ClipsDescendants = true,

            [u2.Event.Activated] = function() -- Line: 171
                -- upvalues: u5 (copy)
                local OnClick = u5.OnClick;

                if OnClick ~= nil then
                    OnClick();
                end;
            end,

            [u2.Event.MouseEnter] = function() -- Line: 177
                -- upvalues: u9 (copy)
                u9(true);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 180
                -- upvalues: u9 (copy)
                u9(false);
            end,

            Selectable = false
        };
        local v31 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = v14
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), (u2.createElement(Gradient, {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 44, 59)) })
            })) };
        local createElement = u2.createElement;
        local v32 = {
            BorderSizePixel = 0,
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        };
        local v33 = {};
        local v34 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        });
        local createElement2 = u2.createElement;
        local v35 = {
            Rotation = 90
        };
        local new = ColorSequence.new;
        local v36 = {};
        local v37 = ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33));
        local new2 = ColorSequenceKeypoint.new;
        local v38;

        if u5.IsOwned then
            v38 = Color3.fromRGB(33, 33, 33);
        else
            v38 = Color3.fromRGB(176, 160, 84);
        end;

        v36[1], v36[2] = v37, new2(1, v38);
        v35.Color = new(v36);
        v35.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, u5.IsOwned and 0.75 or 1), NumberSequenceKeypoint.new(0.6, u5.IsOwned and 0.75 or 1), NumberSequenceKeypoint.new(1, 0.75) });
        v33[1], v33[2] = v34, createElement2(Gradient, v35);
        v31.BottomGlow = createElement("Frame", v32, v33);
        local v39 = #v31;
        local v40;

        if u5.Title == nil then
            v40 = false;
        else
            v40 = u2.createFragment({
                Title = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextXAlignment = "Center",
                    TextScaled = true,
                    LayoutOrder = 1,
                    ZIndex = 2,
                    Size = UDim2.fromScale(0.88, 0.18),
                    Position = UDim2.fromScale(0.5, 0.05),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Text = u5.Title,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }, {
                    UIGradientTest = u2.createElement(Gradient, {
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 231, 159)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 63)) })
                    }),
                    u2.createElement("UIStroke", {
                        Transparency = 0.2,
                        Color = Color3.fromRGB(25, 25, 25)
                    })
                })
            });
        end;

        if v40 then
            v31[v39 + 1] = v40;
        end;

        local v41 = #v31;
        local v42 = {
            Image = u5.Image,
            Size = u15,
            Position = UDim2.fromScale(0.5, 0.58),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            BackgroundTransparency = 1,
            [u2.Ref] = u12.value
        };
        local ProductImageProps = u5.ProductImageProps;

        if ProductImageProps then
            for i, v in ProductImageProps do
                v42[i] = v;
            end;
        end;

        v42.ZIndex = 1;
        v31.ProductImage = u2.createElement("ImageLabel", v42);
        local v43 = not u5.DisablePurchase;

        if v43 then
            local v44 = {
                LayoutOrder = 10,
                ZIndex = 3,
                Size = UDim2.fromScale(0.85, u5.IsOwned and 0.145 or 0.18),
                Position = UDim2.fromScale(0.5, u5.IsOwned and 0.95 or 0.98),
                AnchorPoint = Vector2.new(0.5, 1)
            };
            local v45 = { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Right",
                    VerticalAlignment = "Bottom",
                    SortOrder = "LayoutOrder",
                    VerticalFlex = "Fill",
                    HorizontalFlex = "Fill",
                    Padding = UDim.new(0, v14 / 2.5 * 16)
                }) };
            local v46 = #v45;
            local v47;

            if u5.Product.ProductType == RobuxProductType.BedwarsUGC then
                v47 = false;
            else
                v47 = u5.Product.GiftType;

                if v47 then
                    local createElement3 = u2.createElement;
                    local v48 = {
                        ZIndex = 3,
                        GiftType = u5.Product.GiftType
                    };
                    local v49;

                    if u5.IsOwned then
                        v49 = u5.GamepadShouldAutoSelect;
                    else
                        v49 = false;
                    end;

                    v48.GamepadShouldAutoSelect = v49;
                    v47 = createElement3(GiftPurchaseButton, v48);
                end;
            end;

            if v47 then
                v45[v46 + 1] = v47;
            end;

            local v50;

            if u5.IsOwned then
                v50 = u2.createElement("TextLabel", {
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
                local v51 = {
                    Size = UDim2.fromScale(0.6, 1)
                };

                if u5.Product.ProductType == RobuxProductType.GamePass or u5.Product.ProductType == RobuxProductType.DevProduct then
                    if u10 == nil then
                        u10 = u5.Product.Price;
                    end;
                elseif u5.Product.ProductType == RobuxProductType.BedwarsUGC then
                    u10 = u5.Product.Price;

                    if u10 == nil then
                        u10 = UgcMeta[u5.Product.UgcType].basePrice;
                    end;
                else
                    u10 = 0;
                end;

                v51.Price = u10;
                v51.OnClick = v16;
                local v52;

                if u5.Discount then
                    v52 = {};
                    local Discount = u5.Discount;

                    if Discount ~= nil then
                        Discount = Discount.OriginalPrice;
                    end;

                    v52.OriginalPrice = Discount;
                else
                    v52 = nil;
                end;

                v51.Discount = v52;
                v51.GamepadShouldAutoSelect = u5.GamepadShouldAutoSelect;
                v51.ZIndex = 3;
                v50 = u2.createElement(BasePurchaseButton, v51);
            end;

            v45[#v45 + 1] = v50;
            v43 = u2.createFragment({
                PurchaseButtons = u2.createElement(Empty, v44, v45)
            });
        end;

        if v43 then
            v31[v41 + 1] = v43;
        end;

        v25.Card = u2.createElement("ImageButton", v30, v31);

        return u2.createFragment({
            RobuxStoreItemCard = u2.createElement(Empty, v24, v25)
        });
    end)
};