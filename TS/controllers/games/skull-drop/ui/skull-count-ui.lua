-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    SkullBillBoard = v2.new(u1)(function(p3, p4) -- Line: 6
        -- upvalues: u1 (copy), BedwarsImageId (copy)
        local _ = p4.useState;
        local v5 = u1.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Image = BedwarsImageId.PIRATE_SKULL_ICON,
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local v6 = Color3.fromRGB(255, 255, 255);

        if p3.amount > 9 then
            v6 = Color3.fromRGB(255, 0, 0);
        elseif p3.amount > 4 then
            v6 = Color3.fromRGB(252, 135, 0);
        end;

        return u1.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u1.createElement("UIGridLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                CellSize = UDim2.fromScale(0.45, 0.9),
                CellPadding = UDim2.fromScale(0.02)
            }), v5, u1.createElement("TextLabel", {
                Font = "LuckiestGuy",
                TextScaled = true,
                BackgroundTransparency = 1,
                Text = tostring(p3.amount),
                TextColor3 = v6,
                Size = UDim2.fromScale(0.95, 0.3),
                Position = UDim2.fromScale(0.5, 0.9),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, { u1.createElement("UIStroke", {
                    Thickness = 2
                }), u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }) });
    end)
};