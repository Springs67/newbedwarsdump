-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ImageId = v1.ImageId;
local TooltipContainer = v1.TooltipContainer;
local UILayers = v1.UILayers;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local GiftMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta;
local GiftUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils;
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;

return {
    KitShopGiftButton = v3.new(u2)(function(u4, p5) -- Line: 19
        -- upvalues: GiftMeta (copy), u2 (copy), GiftUtils (copy), BedwarsKit (copy), Button (copy), Flamework (copy), BedwarsAppIds (copy), KitViewport (copy), UILayers (copy), ColorUtil (copy), DeviceUtil (copy), ImageId (copy), TooltipContainer (copy), AutoSizedText (copy)
        local _ = p5.useState;

        if not GiftMeta[u4.GiftType] then
            return u2.createFragment();
        end;

        local u6 = GiftUtils.isKitGift(u4.GiftType);
        local u7 = u4.GiftType == BedwarsKit.NONE;

        if u6 and u7 then
            return u2.createFragment();
        end;

        return u2.createFragment({
            GiftKitButton = u2.createElement(Button, {
                BackgroundTransparency = 1,
                Selectable = true,
                Size = u4.Size,

                OnClick = function() -- Line: 37, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), u4 (copy), u6 (copy), u7 (copy), u2 (ref), KitViewport (ref), UILayers (ref)
                    local v8 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                    local GIFTING = BedwarsAppIds.GIFTING;
                    local v9 = {
                        GiftType = u4.GiftType
                    };
                    local v10;

                    if u6 and not u7 then
                        v10 = u2.createElement(KitViewport, {
                            SizeConstraint = "RelativeYY",
                            Kit = u4.GiftType,
                            Size = UDim2.fromScale(1, 1)
                        });
                    else
                        v10 = nil;
                    end;

                    v9.CustomImage = v10;
                    v8:openApp(GIFTING, v9, UILayers.OVERLAY);
                end,

                LayoutOrder = u4.LayoutOrder
            }, {
                u2.createElement("UIStroke", {
                    Color = ColorUtil.hexColor(13934614),
                    Thickness = DeviceUtil.isSmallScreen() and 1 or 2
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1000, 0)
                }),
                u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScaleType = "Fit",
                    SizeConstraint = "RelativeYY",
                    Image = ImageId.GIFTS_SOLID,
                    ImageColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.fromScale(0.65, 0.65),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5)
                }),
                u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        Text = "Gift Item",
                        TextSize = 16,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }), u2.createElement(AutoSizedText, {
                        TextSize = 14,
                        Text = GiftMeta[u4.GiftType].name,
                        Font = Enum.Font.SourceSansSemibold,
                        Limits = Vector2.new(300, 500)
                    }) })
            })
        });
    end)
};