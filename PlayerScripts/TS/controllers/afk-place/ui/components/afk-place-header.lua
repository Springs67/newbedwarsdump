-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local AfkPlaceCurrentTimer = RuntimeLib.import(script, script.Parent, "afk-place-current-timer").AfkPlaceCurrentTimer;
local v7 = v3.new(u2)(function(p5, p6) -- Line: 11
    -- upvalues: u2 (copy), Empty (copy), AfkPlaceUtils (copy), ColorUtil (copy), AfkPlaceCurrentTimer (copy)
    local _ = p6.useState;
    local _ = p6.useEffect;

    return u2.createFragment({
        Header = u2.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 1,
            Size = p5.Size or UDim2.fromScale(1, 0.25),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            u2.createElement("UIGradient", {
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 54, 112)), ColorSequenceKeypoint.new(1, Color3.fromRGB(23, 23, 32)) })
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 20)
            }),
            TitlesWrapper = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, {
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.125, 0),
                    PaddingBottom = UDim.new(0.125, 0),
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0)
                }),
                u2.createElement("UIListLayout", {
                    VerticalAlignment = "Center",
                    FillDirection = Enum.FillDirection.Vertical,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.05, 0)
                }),
                u2.createElement("TextLabel", {
                    Text = "AFK AREA",
                    TextScaled = true,
                    TextStrokeTransparency = 1,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.4, 0.45),
                    FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Heavy),
                    Font = AfkPlaceUtils.Theme.font,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Bottom,
                    TextColor3 = ColorUtil.WHITE
                }),
                u2.createElement(AfkPlaceCurrentTimer, {
                    AppId = "AfkPlaceTimer",
                    LayoutOrder = 2,
                    AfkStartTime = p5.AfkStartTime,
                    ReturnButtonPressed = p5.ReturnButtonPressed,
                    MountedStartTime = p5.MountedStartTime,
                    size = Vector2.new(0.3, 0.3)
                })
            }),
            ImageContainer = u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.5, 0.9),
                Position = UDim2.fromScale(0.75, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundColor3 = ColorUtil.WHITE
            }, { u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeXY",
                    Image = "rbxassetid://122356771310461",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.8, 1.7),
                    ScaleType = Enum.ScaleType.Crop,
                    Position = UDim2.fromScale(0, -0.45)
                }) })
        })
    });
end);

return {
    AFKHeader = v4.connect(function(p8, p9) -- Line: 88
        local v10 = {};

        for i, v in p9 do
            v10[i] = v;
        end;

        return v10;
    end)(v7)
};