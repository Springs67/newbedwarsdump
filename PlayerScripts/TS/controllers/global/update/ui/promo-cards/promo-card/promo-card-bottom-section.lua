-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    GameUpdateKitCardBottom = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 8
        -- upvalues: u2 (copy), DeviceUtil (copy), ColorUtil (copy)
        local _ = p4.useState;

        return u2.createFragment({
            BottomHalf = u2.createElement("Frame", {
                AutomaticSize = "Y",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, DeviceUtil.isSmallScreen() and 8 or 14),
                    PaddingBottom = UDim.new(0, DeviceUtil.isSmallScreen() and 8 or 14),
                    PaddingLeft = p3.PaddingHorizontal,
                    PaddingRight = p3.PaddingHorizontal
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 6)
                }),
                u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    TextXAlignment = "Left",
                    Text = "Description:",
                    LayoutOrder = 1,
                    Size = UDim2.new(0.9, 0, 0, 0),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 18
                    }) }),
                u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextScaled = true,
                    TextXAlignment = "Left",
                    TextTransparency = 0.2,
                    LayoutOrder = 2,
                    Size = UDim2.new(0.9, 0, 0, 0),
                    Font = Enum.Font.Roboto,
                    TextColor3 = ColorUtil.WHITE,
                    Text = p3.Description
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 18
                    }) })
            })
        });
    end)
};