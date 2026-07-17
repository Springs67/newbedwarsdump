-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    WarlockStaffDisplay = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 5
        -- upvalues: u1 (copy)
        local _ = p3.useState;
        local v4 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.2, 1)
        };
        local v5 = { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.667
            }), u1.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                Padding = UDim.new(0, 2)
            }) };
        local v6 = #v5;
        local v7 = {
            Size = UDim2.fromScale(1, 1)
        };
        local icon = p2.icon;
        v7.Image = icon == nil and "rbxassetid://15186577197" or icon;
        v7.BackgroundTransparency = 1;
        v5[v6 + 1] = u1.createElement("ImageLabel", v7, { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v5[v6 + 2] = u1.createElement("TextLabel", {
            Font = "LuckiestGuy",
            TextScaled = true,
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.8, 0.8),
            Text = tostring(p2.energyStacks),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }, { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.3
            }) });

        return u1.createElement("Frame", v4, v5);
    end)
};