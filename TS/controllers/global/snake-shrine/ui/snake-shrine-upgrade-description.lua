-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    SnakeShrineUpgradeDescription = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3) -- Line: 9
        -- upvalues: DeviceUtil (copy), u2 (copy), Empty (copy), ColorUtil (copy)
        local v4 = DeviceUtil.isSmallScreen();

        return u2.createElement(Empty, {
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0),
            Size = p3.Size or UDim2.fromScale(1, 0.4),
            LayoutOrder = p3.LayoutOrder
        }, { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextWrap = true,
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0, 0),
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                TextColor3 = ColorUtil.WHITE,
                Text = p3.Description,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Medium),
                LayoutOrder = p3.LayoutOrder
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = v4 and 14 or 20
                }) }) });
    end)
};