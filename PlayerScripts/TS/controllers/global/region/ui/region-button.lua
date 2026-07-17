-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    QueueRegionButton = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: ColorUtil (copy), u2 (copy), Theme (copy), Padding (copy), DeviceUtil (copy)
        local _ = p5.useState;
        local v6 = {};
        local _ = #v6;
        local v7 = {
            AutomaticSize = "X",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Selectable = false,
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.fromScale(0.99, 0.99),
            Size = UDim2.fromScale(0.065, 0.05),
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v8 = {
            u2.createElement(
                "UIAspectRatioConstraint",
                {
                    AspectRatio = 3,
                    AspectType = "ScaleWithParentSize",
                    DominantAxis = "Height"
                }
            ),
            u2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(234, 45)
            }),
            u2.createElement("UIGradient", {
                Rotation = 45,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Theme.buttonPrimary), ColorSequenceKeypoint.new(1, Theme.buttonPrimary) })
            }),
            u2.createElement(Padding, {
                Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 6)
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            })
        };
        local _ = #v8;
        local v9 = {
            Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 1 or 0.8, DeviceUtil.isSmallScreen() and 1 or 0.8),
            Image = ({
                EU = "rbxassetid://10469521157",
                SEA = "rbxassetid://10469521246",
                NA = "rbxassetid://10469464193"
            })[p4.Region],
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            ImageColor3 = ColorUtil.WHITE,
            ImageTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 2
        };
        v8.RegionIcon = u2.createElement("ImageLabel", v9, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }) });
        v8.Region = u2.createElement("TextLabel", {
            AutomaticSize = "X",
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            TextTransparency = 0.5,
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Size = UDim2.fromScale(0, 1),
            Text = "<b>" .. p4.Region .. "</b>",
            TextScaled = not DeviceUtil.isSmallScreen(),
            TextColor3 = ColorUtil.WHITE
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        v6.QueueRegionButton = u2.createElement("ImageButton", v7, v8);

        return u2.createFragment({
            QueueRegionDisplay = u2.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, v6)
        });
    end)
};