-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v7 = v3.new(u2)(function(p5, p6) -- Line: 10
    -- upvalues: u2 (copy), DeviceUtil (copy), Empty (copy), Countdown (copy)
    local _ = p6.useState;
    local _ = p6.useEffect;

    return u2.createFragment({
        MatchEventCountdown = u2.createElement("Frame", {
            BackgroundTransparency = 0.3,
            Size = UDim2.fromScale(DeviceUtil.isMobileControls() and 0.25 or 0.2, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        }, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                Padding = UDim.new(0, 8)
            }),
            u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                Image = p5.image
            }),
            u2.createElement(Empty, {
                AutomaticSize = "X",
                LayoutOrder = 2,
                Size = UDim2.fromScale(0, 1)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Left",
                    Padding = UDim.new(0, 0.15)
                }),
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.1, 0),
                    PaddingBottom = UDim.new(0.1, 0)
                }),
                Title = u2.createElement("TextLabel", {
                    AutomaticSize = "X",
                    Font = "GothamBold",
                    TextScaled = true,
                    RichText = false,
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    TextTransparency = 0.3,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0, 0.3),
                    Text = p5.name,
                    TextColor3 = Color3.fromRGB(255, 212, 13)
                }),
                u2.createElement(Countdown, {
                    EndTime = p5.time,
                    CountdownConfig = {
                        days = false,
                        hours = false
                    },
                    TextLabel = {
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0, 0.55),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                }, { u2.createElement("UIStroke", {
                        Thickness = 2,
                        Color = Color3.fromRGB(0, 0, 0)
                    }) })
            })
        })
    });
end);

return {
    MatchEventCountdown = v4.connect(function(p8, p9) -- Line: 89
        local v10 = {};

        for i, v in p9 do
            v10[i] = v;
        end;

        return v10;
    end)(v7)
};