-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    TripleShotProgressBar = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: u1 (copy), TweenService (copy), ColorUtil (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        local u6 = u1.createRef();
        useEffect(function() -- Line: 12
            -- upvalues: TweenService (ref), u5 (copy), u6 (copy), u3 (copy)
            TweenService:Create(u5:getValue(), TweenInfo.new(0.12), {
                Size = UDim2.fromScale(0.18, 0.1)
            }):Play();
            TweenService:Create(u6:getValue(), TweenInfo.new(u3.chargeTime, Enum.EasingStyle.Linear), {
                Size = UDim2.fromScale(1, 1)
            }):Play();
        end, {});

        return u1.createFragment({ u1.createElement("Frame", {
                [u1.Ref] = u5,
                Size = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 0.7),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0.7,
                BorderSizePixel = 0
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 10.95890410958904,
                    DominantAxis = "Height"
                }), u1.createElement("Frame", {
                    [u1.Ref] = u6,
                    Size = UDim2.fromScale(0, 1),
                    BorderSizePixel = 0
                }, { u1.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new(Color3.fromRGB(112, 219, 255), ColorUtil.darken(Color3.fromRGB(112, 219, 255), 0.93))
                    }) }) }), u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Font = "LuckiestGuy",
                TextScaled = true,
                Text = u3.title,
                Size = UDim2.fromScale(0.13, 0.07),
                Position = UDim2.fromScale(0.5, 0.71),
                AnchorPoint = Vector2.new(0.5, 0),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }) });
    end)
};