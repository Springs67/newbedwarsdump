-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "merchant", "merchant-types");
local discountColor = v3.discountColor;
local discountImage = v3.discountImage;
local ShopItemLockCause = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-item-lock-cause").ShopItemLockCause;
local TaxTheme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-tax-util").TaxTheme;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local v4 = u2.Component:extend("BedwarsShopItemCard");

function v4.init(p5) -- Line: 26
    -- upvalues: u2 (copy)
    p5.ref = u2.createRef();
end;

function v4.didMount(u6) -- Line: 29
    -- upvalues: UserInputService (copy), SoundManager (copy), GameSound (copy), UIUtil (copy)
    local v7 = UserInputService.GamepadEnabled and (not UserInputService.MouseEnabled and u6.ref:getValue());

    if v7 then
        v7.SelectionGained:Connect(function() -- Line: 33
            -- upvalues: SoundManager (ref), GameSound (ref), u6 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);
            u6.props.OnClick();
        end);

        if u6.props.Selected then
            UIUtil:selectGui(v7);
        end;
    end;
end;

function v4.getMerchantKitDiscountedItems(p8) -- Line: 43
    -- upvalues: DeviceUtil (copy), PlaceUtil (copy), KnitClient (copy)
    return (DeviceUtil.isHoarceKat() or not PlaceUtil.isGameServer()) and {} or KnitClient.Controllers.MerchantKitController.discountedItems;
end;

function v4.render(u9) -- Line: 49
    -- upvalues: Theme (copy), discountImage (copy), DeviceUtil (copy), KnitClient (copy), TaxTheme (copy), discountColor (copy), BedwarsImageId (copy), ShopItemLockCause (copy), u2 (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), ItemViewport (copy), Empty (copy), getItemMeta (copy)
    local textPrimary = Theme.textPrimary;

    local function _(p10) -- Line: 53
        -- upvalues: u9 (copy)
        return p10.item.itemType == u9.props.ShopItem.itemType;
    end;

    local v11 = nil;

    for i, v in u9:getMerchantKitDiscountedItems() do
        local _ = i - 1;

        if v.item.itemType == u9.props.ShopItem.itemType == true then
            v11 = v;
            break;
        end;
    end;

    local v12;

    if v11 == nil then
        v12 = v11;
    else
        v12 = v11.tier;
    end;

    local v13;

    if v12 == nil then
        v13 = nil;
    else
        v13 = discountImage[v12];
    end;

    local priceMultiplier = u9.props.ShopItem.priceMultiplier;

    if priceMultiplier ~= nil then
        if priceMultiplier > 1 then
            textPrimary = Color3.fromRGB(212, 56, 56);
        elseif priceMultiplier < 1 then
            textPrimary = Color3.fromRGB(212, 175, 55);
        end;
    end;

    local v14 = DeviceUtil.isHoarceKat() and {} or KnitClient.Controllers.ShopTaxController:getTaxedItems();
    local v15 = table.find(v14, u9.props.ShopItem.itemType) ~= nil;

    if v15 then
        textPrimary = TaxTheme.Outline;
    else
        local v16;

        if v11 then
            v16 = v11.tier;
        else
            v16 = v11;
        end;

        if v16 ~= 0 and (v16 == v16 and v16) then
            textPrimary = discountColor[v11.tier];
        end;
    end;

    local v17;

    if DeviceUtil.isHoarceKat() then
        v17 = math.random() > 0.5 and {
            reason = "",
            buttonColor = Color3.fromRGB(255, 255, 255),
            disabledIcon = BedwarsImageId.LOCK_ART,
            lockCause = ShopItemLockCause.LOCKED
        } or nil;
    else
        v17 = nil;
    end;

    if u9.props.ShopItem and not DeviceUtil.isHoarceKat() then
        v17 = KnitClient.Controllers.BedwarsShopController:getDisabledStatus(u9.props.ShopItem);
    end;

    local v18;

    if v17 == nil then
        v18 = v17;
    else
        v18 = v17.lockCause;
    end;

    if v18 then
        v15 = false;
    end;

    local v19;

    if v17 == nil then
        v19 = v17;
    else
        v19 = v17.disabledIcon;
    end;

    local v20, v21;

    if v17 then
        textPrimary = Color3.fromRGB(217, 217, 217);
        v20 = 0.5;
        v21 = 0.7;
    else
        v20 = nil;
        v21 = nil;
    end;

    local v22 = {
        [u2.Ref] = u9.ref,
        Size = UDim2.fromScale(1, 1)
    };
    local v23;

    if v15 then
        v23 = TaxTheme.Background;
    else
        v23 = ColorUtil.BLACK;
    end;

    v22.BackgroundColor3 = v23;
    local v24 = nil;
    v22.BackgroundTransparency = v24 == nil and 0.6 or v24;
    v22.LayoutOrder = u9.props.LayoutOrder;

    v22[u2.Event.Activated] = function() -- Line: 152
        -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref)
        if u9.props.Selected then
            u9.props.OnRightClick();

            return nil;
        end;

        SoundManager:playSound(GameSound.UI_CLICK);
        u9.props.OnClick();
    end;

    v22[u2.Event.MouseButton2Click] = function() -- Line: 160
        -- upvalues: u9 (copy)
        if u9.props.Locked then
            return nil;
        end;

        u9.props.OnRightClick();
    end;

    v22[u2.Event.MouseEnter] = function() -- Line: 166
    end;

    v22[u2.Event.MouseLeave] = function() -- Line: 167
    end;

    local v25 = {};
    local v26 = #v25;
    local v27 = {
        Color = textPrimary,
        Thickness = v11 and 2 or 1,
        Transparency = math.max(v20 == nil and 0 or v20, u9.props.Locked and 0.6 or 0)
    };
    v25[v26 + 1] = u2.createElement("UIStroke", v27);
    local v28 = u9.props.ShopItem ~= nil;

    if v28 then
        local v29 = {
            ItemType = u9.props.ShopItem.itemType,
            ImageTransparency = math.max(v21 == nil and 0 or v21, u9.props.Locked and 0.6 or 0),
            Amount = 1,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            IgnoreInitialPop = true,
            ShowCooldownBar = false,
            ZIndex = 2
        };
        v28 = u2.createElement(ItemViewport, v29);
    end;

    if v28 then
        v25[v26 + 2] = v28;
    end;

    local _ = #v25;
    local v30 = {
        ZIndex = 2,
        Size = UDim2.fromScale(1, 0.35),
        Position = UDim2.fromScale(-0.08, 1.08),
        AnchorPoint = Vector2.new(0, 1)
    };
    local v31 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal"
        }) };
    local v32 = #v31;
    local v33;

    if v19 == nil then
        v33 = false;
    else
        v33 = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            Size = UDim2.fromScale(0.35, 1),
            Image = v19
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    end;

    if v33 then
        v31[v32 + 1] = v33;
    end;

    local v34 = #v31;
    local v35;

    if u9.props.ShopItem == nil then
        v35 = false;
    else
        v35 = u9.props.ShopItem.mechanicItem;
    end;

    if v35 then
        local v36 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.35, 1)
        };
        local mechanicItemIconOverride = u9.props.ShopItem.mechanicItemIconOverride;
        v36.Image = mechanicItemIconOverride == nil and "rbxassetid://7121706441" or mechanicItemIconOverride;
        v36.BorderSizePixel = 0;
        v36.ZIndex = 2;
        v35 = u2.createElement("ImageLabel", v36, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.7517241379310344
            }) });
    end;

    if v35 then
        v31[v34 + 1] = v35;
    end;

    local v37 = #v31;
    local v38;

    if u9.props.ShopItem == nil then
        v38 = false;
    else
        v38 = u9.props.ShopItem.limitedTimeItem;
    end;

    if v38 then
        local v39 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.35, 1)
        };
        local limitedTimeItemIconOverride = u9.props.ShopItem.limitedTimeItemIconOverride;
        v39.Image = limitedTimeItemIconOverride == nil and "rbxassetid://7121706441" or limitedTimeItemIconOverride;
        v39.BorderSizePixel = 0;
        v39.ZIndex = 2;
        v38 = u2.createElement("ImageLabel", v39, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.7517241379310344
            }) });
    end;

    if v38 then
        v31[v37 + 1] = v38;
    end;

    local v40 = #v31;

    if v11 then
        if v13 == nil then
            v11 = false;
        else
            v11 = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 2,
                Size = UDim2.fromScale(0.35, 1),
                Image = v13
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 0.7517241379310344
                }) });
        end;
    end;

    if v11 then
        v31[v40 + 1] = v11;
    end;

    v25.ShopIcons = u2.createElement(Empty, v30, v31);
    v25.BackgroundGradient = u2.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 1,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = ColorUtil.WHITE
    }, { u2.createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(23, 23, 23)), ColorSequenceKeypoint.new(1, Color3.fromRGB(23, 23, 23)) }),
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(0.3, 1), NumberSequenceKeypoint.new(1, 1) })
        }) });
    v25.Price = u2.createElement(Empty, {
        ZIndex = 2,
        Size = UDim2.fromScale(0.925, 0.25),
        Position = UDim2.fromScale(0.5, 1),
        AnchorPoint = Vector2.new(0.5, 1)
    }, { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Right",
            Padding = UDim.new(0, 4)
        }), u2.createElement(Empty, {
            SizeConstraint = "RelativeYY",
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1)
        }, { u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                SizeConstraint = "RelativeYY",
                BorderSizePixel = 0,
                LayoutOrder = 1,
                ZIndex = 2,
                Size = UDim2.fromScale(1.5, 1.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.45),
                ImageTransparency = v21,
                Image = getItemMeta(u9.props.ShopItem.currency).image
            }) }), u2.createElement("TextLabel", {
            AutomaticSize = "X",
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            ZIndex = 2,
            Size = UDim2.fromScale(0, 0.9),
            Text = tostring(u9.props.ShopItem.price),
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextTransparency = v21
        }) });
    local ShopItem = u9.props.ShopItem;

    if ShopItem ~= nil then
        ShopItem = ShopItem.itemType;
    end;

    return u2.createFragment({
        [(ShopItem == nil and "" or ShopItem) .. "_ShopItemCard"] = u2.createElement("ImageButton", v22, v25)
    });
end;

return {
    BedwarsShopItemCard = v4
};