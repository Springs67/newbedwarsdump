-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;

return {
    ChickenUi = v2.new(u1)(function(p3, p4) -- Line: 6
        -- upvalues: getItemMeta (copy), u1 (copy)
        local _ = p4.useState;
        local image = getItemMeta(p3.currency).image;

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
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 1)
            }),
            ChickenIcon = u1.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                Image = "rbxassetid://13988247449",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1)
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }),
            DividerText = u1.createElement("TextLabel", {
                AutomaticSize = "X",
                Text = "=",
                Font = "LuckiestGuy",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0, 0.8),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }),
            RewardIcon = u1.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.fromScale(1, 1),
                Image = image == nil and "rbxassetid://6850537969" or image
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }),
            PriceText = u1.createElement("TextLabel", {
                AutomaticSize = "X",
                Font = "LuckiestGuy",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 4,
                Size = UDim2.fromScale(0, 0.8),
                Text = tostring(p3.chickenPrice),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            })
        });
    end)
};