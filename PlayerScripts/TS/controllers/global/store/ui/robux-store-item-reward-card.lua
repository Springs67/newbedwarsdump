-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local TweenService = v4.TweenService;
local BasePurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "base-purchase-button").BasePurchaseButton;
local BedcoinPurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "bedcoin-purchase-button").BedcoinPurchaseButton;
local GiftPurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "gift-purchase-button").GiftPurchaseButton;
local Gradient = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "gradient").Gradient;
local RewardTile = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts");
local RobuxProductType = v5.RobuxProductType;
local StoreCurrency = v5.StoreCurrency;
local MarketplaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil;

return {
    RobuxStoreItemRewardCard = v3.new(u2)(function(u6, p7) -- Line: 22
        -- upvalues: u2 (copy), TweenService (copy), SoundManager (copy), GameSound (copy), RobuxProductType (copy), MarketplaceUtil (copy), RuntimeLib (copy), RewardUtils (copy), Players (copy), Gradient (copy), RewardTile (copy), GiftPurchaseButton (copy), StoreCurrency (copy), BasePurchaseButton (copy), BedcoinPurchaseButton (copy), Empty (copy)
        local useState = p7.useState;
        local useValue = p7.useValue;
        local useEffect = p7.useEffect;
        local v8, u9 = useState(0);
        local u10, u11 = useState(false);
        local v12, u13 = useState(false);
        local u14 = useValue(u2.createRef());
        local AspectRatio = u6.AspectRatio;
        local v15 = AspectRatio == nil and 0.8043478260869565 or AspectRatio;
        local u16 = UDim2.fromScale(1.45, 1.45);
        useEffect(function() -- Line: 37
            -- upvalues: u14 (copy), u10 (copy), TweenService (ref), SoundManager (ref), GameSound (ref), u16 (copy)
            local v17 = u14.value:getValue();

            if not v17 then
                return nil;
            end;

            if not u10 then
                TweenService:Create(v17, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                    Size = u16
                }):Play();

                return;
            end;

            TweenService:Create(v17, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.fromScale(1.6, 1.6)
            }):Play();
            SoundManager:playSound(GameSound.UI_HOVER);
        end, { u10 });
        useEffect(function() -- Line: 53
            -- upvalues: u6 (copy), u13 (copy)
            local IsOwned = u6.IsOwned;

            if IsOwned == nil then
                IsOwned = false;
            end;

            u13(IsOwned);

            return function() -- Line: 59
            end;
        end, { u6.IsOwned });
        useEffect(function() -- Line: 62
            -- upvalues: u6 (copy), RobuxProductType (ref), MarketplaceUtil (ref), u9 (copy), RuntimeLib (ref), RewardUtils (ref), Players (ref), u13 (copy)
            local RobuxProduct = u6.RobuxProduct;

            if RobuxProduct ~= nil then
                RobuxProduct = RobuxProduct.ProductType;
            end;

            if RobuxProduct == RobuxProductType.DevProduct then
                MarketplaceUtil.getDevProductInfoAsync(u6.RobuxProduct.ProductId):andThen(function(p18) -- Line: 69
                    -- upvalues: u9 (ref)
                    local v19;

                    if p18 == nil then
                        v19 = p18;
                    else
                        v19 = p18.PriceInRobux;
                    end;

                    if v19 ~= 0 and (v19 == v19 and v19) then
                        u9(p18.PriceInRobux);
                    end;
                end);
            else
                local RobuxProduct2 = u6.RobuxProduct;

                if RobuxProduct2 ~= nil then
                    RobuxProduct2 = RobuxProduct2.ProductType;
                end;

                if RobuxProduct2 == RobuxProductType.GamePass then
                    MarketplaceUtil.getGamePassProductInfoAsync(u6.RobuxProduct.ProductId):andThen(function(p20) -- Line: 86
                        -- upvalues: u9 (ref)
                        local v21;

                        if p20 == nil then
                            v21 = p20;
                        else
                            v21 = p20.PriceInRobux;
                        end;

                        if v21 ~= 0 and (v21 == v21 and v21) then
                            u9(p20.PriceInRobux);
                        end;
                    end);
                end;
            end;

            local u26 = RuntimeLib.Promise.new(function(p22, p23) -- Line: 98
                -- upvalues: u6 (ref), RewardUtils (ref), Players (ref)
                if u6.IsOwned then
                    p23();

                    return nil;
                end;

                p22((RewardUtils.playerOwnsReward(Players.LocalPlayer, u6.Reward)));
            end):andThen(function(p24) -- Line: 106
                -- upvalues: u13 (ref)
                u13(p24);
            end):catch(function(p25) -- Line: 109
                print(p25);
            end);

            return function() -- Line: 112
                -- upvalues: u26 (copy)
                u26:cancel();
            end;
        end, { u6.Reward });
        local v27 = {
            Size = u6.Size or UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
            ClipsDescendants = true,

            [u2.Event.MouseEnter] = function() -- Line: 121
                -- upvalues: u11 (copy)
                u11(true);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 124
                -- upvalues: u11 (copy)
                u11(false);
            end,

            LayoutOrder = u6.LayoutOrder,
            Selectable = false
        };
        local v28 = {};
        local v29 = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = v15
        });
        local v30 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        });
        local createElement = u2.createElement;
        local v31 = {
            Rotation = 90
        };
        local new = ColorSequence.new;
        local v32 = {};
        local v33 = ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33));
        local new2 = ColorSequenceKeypoint.new;
        local v34;

        if u6.Highlight then
            v34 = RewardUtils.getRewardColors(u6.Reward).borderColor;
        else
            v34 = Color3.fromRGB(41, 44, 59);
        end;

        v32[1], v32[2] = v33, new2(1, v34);
        v31.Color = new(v32);
        v28[1], v28[2], v28[3] = v29, v30, createElement(Gradient, v31);
        local createElement2 = u2.createElement;
        local v35 = {
            BorderSizePixel = 0,
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        };
        local v36 = {};
        local v37 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        });
        local createElement3 = u2.createElement;
        local v38 = {
            Rotation = 90
        };
        local new3 = ColorSequence.new;
        local v39 = {};
        local v40 = ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33));
        local new4 = ColorSequenceKeypoint.new;
        local v41;

        if v12 then
            v41 = Color3.fromRGB(33, 33, 33);
        else
            v41 = RewardUtils.getRewardColors(u6.Reward).backgroundColor;
        end;

        v39[1], v39[2] = v40, new4(1, v41);
        v38.Color = new3(v39);
        v38.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12 and 0.75 or 1), NumberSequenceKeypoint.new(0.6, v12 and 0.75 or 1), NumberSequenceKeypoint.new(1, 0.75) });
        v36[1], v36[2] = v37, createElement3(Gradient, v38);
        v28.BottomGlow = createElement2("Frame", v35, v36);
        local v42 = #v28;
        local v43;

        if u6.Reward == nil then
            v43 = false;
        else
            v43 = u2.createFragment({
                RewardType = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextXAlignment = "Right",
                    TextScaled = true,
                    LayoutOrder = 1,
                    TextTransparency = 0.3,
                    ZIndex = 2,
                    Size = UDim2.fromScale(0.88, 0.085),
                    Position = UDim2.fromScale(0.5, 0.05),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Text = RewardUtils.getRewardType(u6.Reward),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }, { u2.createElement("UIStroke", {
                        Transparency = 0.2,
                        Color = Color3.fromRGB(25, 25, 25)
                    }) })
            });
        end;

        if v43 then
            v28[v42 + 1] = v43;
        end;

        v28[#v28 + 1] = u2.createElement(RewardTile, {
            ZIndex = 3,
            Reward = u6.Reward,
            ImageButtonProps = {
                Size = UDim2.new(0.85, 0, 0.45, 0),
                Position = UDim2.fromScale(0.5, 0.44),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }
        });
        local v44 = {
            LayoutOrder = 10,
            ZIndex = 3,
            Size = UDim2.fromScale(0.85, v12 and 0.145 or 0.18)
        };
        v44.Position = UDim2.fromScale(0.5, 0.94);
        v44.AnchorPoint = Vector2.new(0.5, 1);
        local v45 = {};
        local v46 = #v45;
        local v47 = {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder",
            VerticalFlex = "Fill"
        };
        local RobuxProduct = u6.RobuxProduct;

        if RobuxProduct ~= nil then
            RobuxProduct = RobuxProduct.GiftType;
        end;

        v47.HorizontalFlex = RobuxProduct and "Fill" or "SpaceEvenly";
        v47.Padding = UDim.new(0, v15 / 2.5 * 16);
        v45[v46 + 1] = u2.createElement("UIListLayout", v47);
        local RobuxProduct2 = u6.RobuxProduct;

        if RobuxProduct2 ~= nil then
            RobuxProduct2 = RobuxProduct2.GiftType;
        end;

        if RobuxProduct2 then
            RobuxProduct2 = u2.createElement(GiftPurchaseButton, {
                ZIndex = 3,
                GiftType = u6.RobuxProduct.GiftType,
                GamepadShouldAutoSelect = u6.GamepadShouldAutoSelect and v12
            });
        end;

        if RobuxProduct2 then
            v45[v46 + 2] = RobuxProduct2;
        end;

        local v48 = #v45;
        local v49;

        if v12 then
            v49 = u2.createElement("TextLabel", {
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
            v49 = v12;
        end;

        if v49 then
            v45[v48 + 1] = v49;
        end;

        local v50 = #v45;
        local v51 = not v12 and (u6.RobuxProduct or u6.IsFree);

        if v51 then
            local v52 = {};
            local RobuxProduct3 = u6.RobuxProduct;

            if RobuxProduct3 ~= nil then
                RobuxProduct3 = RobuxProduct3.GiftType;
            end;

            v52.Size = UDim2.fromScale(RobuxProduct3 and 0.6 or 1, 1);
            v52.Price = u6.IsFree and -1 or v8;

            function v52.OnClick() -- Line: 254
                -- upvalues: u6 (copy), StoreCurrency (ref)
                u6.OnAttemptPuchase(StoreCurrency.Robux);
            end;

            local v53;

            if u6.Discount then
                v53 = {};
                local Discount = u6.Discount;

                if Discount ~= nil then
                    Discount = Discount.OriginalPrice;
                end;

                v53.OriginalPrice = Discount;
            else
                v53 = nil;
            end;

            v52.Discount = v53;
            v52.Effects = {
                Shine = u6.IsFree
            };
            v52.ZIndex = 3;
            local BedcoinProductId = u6.BedcoinProductId;
            v52.AspectRatio = (BedcoinProductId == 0 or (BedcoinProductId ~= BedcoinProductId or not BedcoinProductId)) and 3.1666666666666665 or 2.8333333333333335;
            v52.GamepadShouldAutoSelect = u6.GamepadShouldAutoSelect;
            v51 = u2.createElement(BasePurchaseButton, v52);
        end;

        if v51 then
            v45[v50 + 1] = v51;
        end;

        local v54 = #v45;
        local v55 = not v12 and u6.BedcoinProductId ~= nil;

        if v55 then
            local v56 = {
                BedcoinProductId = u6.BedcoinProductId
            };
            local v57 = {
                ZIndex = 3,

                OnClick = function() -- Line: 290, Name: OnClick
                    -- upvalues: u6 (copy), StoreCurrency (ref)
                    u6.OnAttemptPuchase(StoreCurrency.BedCoin);
                end,

                Size = UDim2.fromScale(u6.RobuxProduct and 0.45 or 0.6, 1)
            };
            local RobuxProduct3 = u6.RobuxProduct;

            if RobuxProduct3 ~= nil then
                RobuxProduct3 = RobuxProduct3.ProductId;
            end;

            v57.AspectRatio = (RobuxProduct3 == 0 or (RobuxProduct3 ~= RobuxProduct3 or not RobuxProduct3)) and 3.1666666666666665 or 2.8333333333333335;
            v56.PurchaseButtonProps = v57;
            local GamepadShouldAutoSelect = u6.GamepadShouldAutoSelect;

            if GamepadShouldAutoSelect then
                local RobuxProduct4 = u6.RobuxProduct;

                if RobuxProduct4 ~= nil then
                    RobuxProduct4 = RobuxProduct4.ProductId;
                end;

                GamepadShouldAutoSelect = RobuxProduct4 == nil;
            end;

            v56.GamepadShouldAutoSelect = GamepadShouldAutoSelect;
            v55 = u2.createElement(BedcoinPurchaseButton, v56);
        end;

        if v55 then
            v45[v54 + 1] = v55;
        end;

        v28.PurchaseButtons = u2.createElement(Empty, v44, v45);

        return u2.createFragment({
            Card = u2.createElement("ImageButton", v27, v28)
        });
    end)
};