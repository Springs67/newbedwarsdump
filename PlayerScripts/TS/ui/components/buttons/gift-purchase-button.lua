-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local TooltipContainer = v1.TooltipContainer;
local UILayers = v1.UILayers;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent, "types", "app-config").BedwarsAppIds;
local GiftMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    GiftPurchaseButton = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: Flamework (copy), BedwarsAppIds (copy), UILayers (copy), u2 (copy), DeviceUtil (copy), BedwarsImageId (copy), AutoSizedText (copy), GiftMeta (copy), TooltipContainer (copy), Button (copy)
        local _ = p5.useState;
        local v6 = {
            BorderSizePixel = 0,
            Selectable = true,
            AutoButtonColor = true,
            Size = u4.Size or UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),

            OnClick = function() -- Line: 23, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u4 (copy), UILayers (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                    GiftType = u4.GiftType
                }, UILayers.OVERLAY);
            end,

            LayoutOrder = u4.LayoutOrder
        };
        local ZIndex = u4.ZIndex;
        v6.ZIndex = (ZIndex == nil and 1 or ZIndex) + 1;
        local v7 = {
            u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(1000, 0)
            }),
            u2.createElement("UIStroke", {
                Transparency = 0.65,
                Color = Color3.fromRGB(49, 252, 255),
                Thickness = DeviceUtil.isSmallScreen() and 1 or 2
            }),
            u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(84, 203, 198)), ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 136, 142)) })
            })
        };
        local v8 = #v7;
        local v9 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            Image = BedwarsImageId.GIFT_SOLID,
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.65, 0.65),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local ZIndex2 = u4.ZIndex;
        v9.ZIndex = (ZIndex2 == nil and 1 or ZIndex2) + 1;
        v7[v8 + 1] = u2.createElement("ImageLabel", v9);
        local v10 = { u2.createElement(AutoSizedText, {
                Text = "Gift Item",
                TextSize = 16,
                Font = Enum.Font.SourceSansBold,
                Limits = Vector2.new(300, 60)
            }) };
        local v11 = {};
        local v12 = GiftMeta[u4.GiftType];

        if v12 ~= nil then
            v12 = v12.name;
        end;

        v11.Text = v12;
        v11.Font = Enum.Font.SourceSansSemibold;
        v11.TextSize = 14;
        v11.Limits = Vector2.new(300, 500);
        v10[#v10 + 1] = u2.createElement(AutoSizedText, v11);
        v7[v8 + 2] = u2.createElement(TooltipContainer, {}, v10);

        return u2.createFragment({
            GiftKitButton = u2.createElement(Button, v6, v7)
        });
    end)
};