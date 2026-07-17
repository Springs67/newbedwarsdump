-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    SquareImageButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: ColorUtil (copy), u1 (copy)
        local _ = p3.useState;
        local v4 = {};

        for i, v in p2 do
            v4[i] = v;
        end;

        v4.Image = nil;
        v4.OnClick = nil;
        local v5 = {
            ImageTransparency = 1,
            BackgroundColor3 = ColorUtil.BLACK,
            BorderSizePixel = 0,
            [u1.Event.Activated] = p2.OnClick
        };

        for i, v in v4 do
            v5[i] = v;
        end;

        return u1.createElement("ImageButton", v5, { u1.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }), u1.createElement("UIGradient", {
                    Rotation = 90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
                }) }), u1.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }), u1.createElement("ImageLabel", {
                LayoutOrder = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.6, 0.6),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = p2.Image,
                ScaleType = Enum.ScaleType.Fit
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }) });
    end)
};