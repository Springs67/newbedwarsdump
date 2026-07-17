-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    StarCollectorDisplay = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 5
        -- upvalues: u1 (copy)
        local _ = p3.useState;

        return u1.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.2, 1)
        }, {
            u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.667
            }),
            u1.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                Padding = UDim.new(0, 2)
            }),
            u1.createElement("ImageLabel", {
                Image = "rbxassetid://9871799391",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1)
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }),
            u1.createElement("TextLabel", {
                Font = "LuckiestGuy",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.8, 0.8),
                Text = tostring(p2.greenStars),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.3
                }) }),
            u1.createElement("ImageLabel", {
                Image = "rbxassetid://9871798596",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1)
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }),
            u1.createElement("TextLabel", {
                Font = "LuckiestGuy",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.8, 0.8),
                Text = tostring(p2.yellowStars),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.3
                }) })
        });
    end)
};