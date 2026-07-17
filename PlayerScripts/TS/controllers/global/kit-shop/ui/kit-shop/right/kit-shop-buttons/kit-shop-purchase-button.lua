-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ImageId = v1.ImageId;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    KitShopPurchaseButton = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: ImageId (copy), BedwarsImageId (copy), u2 (copy), Button (copy), Theme (copy), StringUtil (copy)
        local _ = p5.useState;
        local v6 = "";

        if u4.PurchaseButtonType == "Robux" then
            v6 = ImageId.ROBUX;
        elseif u4.PurchaseButtonType == "BedCoin" then
            v6 = BedwarsImageId.BED_COIN_ICON;
        end;

        return u2.createElement(Button, {
            Selectable = true,
            Size = u4.Size,
            Position = UDim2.fromScale(0.5, 0.895),
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Theme.backgroundSuccess,

            OnClick = function() -- Line: 25, Name: OnClick
                -- upvalues: u4 (copy)
                u4.Purchase();
            end,

            LayoutOrder = u4.LayoutOrder
        }, { u2.createElement("UIListLayout", {
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0.05, 0)
            }), u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                SizeConstraint = "RelativeYY",
                Image = v6,
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(1, 0.7),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.34, 0.5)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }), u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                AutomaticSize = "X",
                TextXAlignment = "Left",
                Text = StringUtil.formatNumberWithCommas(u4.Price),
                Size = UDim2.fromScale(0, 0.45),
                Position = UDim2.fromScale(0.505, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }) });
    end)
};