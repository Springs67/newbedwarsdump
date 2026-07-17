-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local LockerUtil = RuntimeLib.import(script, script.Parent.Parent, "locker-util").LockerUtil;

return {
    LockerPreviewButtons = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: u2 (copy), DeviceUtil (copy), ButtonComponent (copy), ColorUtil (copy), LockerUtil (copy), Button (copy), BedwarsImageId (copy), Empty (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = {
            Size = UDim2.new(0.75, 0, 0, 40),
            Position = UDim2.new(0.5, 0, 1, -10),
            AnchorPoint = Vector2.new(0.5, 1)
        };
        local v7 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 12 or 6),
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v8 = #v7;
        local v9 = u4.CanReplay and u2.createElement(ButtonComponent, {
            BackgroundTransparency = 0.4,
            Text = "<b>REPLAY</b>",
            TextSize = 24,
            LayoutOrder = 1,
            Size = UDim2.new(0.8, -12, 1, 0),
            BackgroundColor3 = ColorUtil.BLACK,

            OnClick = function() -- Line: 37, Name: OnClick
                -- upvalues: LockerUtil (ref), u4 (copy)
                LockerUtil.previewElement(u4.Element, u4.Tab, true);
            end,

            CornerRadius = UDim.new(0, 10)
        });

        if v9 then
            v7[v8 + 1] = v9;
        end;

        local _ = #v7;
        v7.MaximizeButton = u2.createElement(Button, {
            BackgroundTransparency = 0.4,
            LayoutOrder = 2,
            BackgroundColor3 = ColorUtil.BLACK,
            Size = UDim2.fromScale(0.2, 1),

            OnClick = function() -- Line: 51, Name: OnClick
                -- upvalues: LockerUtil (ref), u4 (copy)
                LockerUtil.openFullscreenPreview(u4.Element, u4.Tab);
            end,

            CornerRadius = UDim.new(0, 10)
        }, { u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7, 0.7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = BedwarsImageId.MAXIMIZE_ICON,
                ScaleType = Enum.ScaleType.Fit
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1,
                DominantAxis = "Height"
            }) });

        return u2.createElement(Empty, v6, v7);
    end)
};