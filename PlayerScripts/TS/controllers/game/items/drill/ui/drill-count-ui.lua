-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    DrillCountDisplay = v2.new(u1)(function(p3, p4) -- Line: 6
        -- upvalues: u1 (copy), BedwarsImageId (copy)
        local _ = p4.useState;

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
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.Drill_RENDER
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
                Text = tostring(p3.count),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.3
                }) })
        });
    end)
};