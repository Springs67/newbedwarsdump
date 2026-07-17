-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    HelperPlayerText = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 8
        -- upvalues: u2 (copy), Empty (copy), ColorUtil (copy)
        local useEffect = p4.useEffect;
        local v5 = u2.createRef();
        useEffect(function() -- Line: 11
        end, {});

        return u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement(Empty, {
                Position = UDim2.fromScale(0.5, 0.6),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(0.5, 0.35),
                [u2.Ref] = v5
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }), u2.createElement("Frame", {
                    AutomaticSize = "X",
                    BackgroundTransparency = 0.3,
                    ZIndex = 3,
                    Size = UDim2.fromScale(0.75, 0.18),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.85),
                    BackgroundColor3 = ColorUtil.BLACK
                }, { u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0.005, 0),
                        PaddingRight = UDim.new(0.005, 0)
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), u2.createElement("TextLabel", {
                        TextScaled = true,
                        TextXAlignment = "Center",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        ZIndex = 4,
                        Size = UDim2.fromScale(1, 0.8),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Font = Enum.Font.FredokaOne,
                        Text = p3.HelperText,
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 16
                        }) }) }) }) });
    end)
};