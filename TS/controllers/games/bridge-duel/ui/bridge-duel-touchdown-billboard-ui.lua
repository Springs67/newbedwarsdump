-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    BridgeDuelTouchdownBillboardUI = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2) -- Line: 6
        -- upvalues: u1 (copy), Empty (copy)
        return u1.createElement(Empty, {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0, 0)
        }, { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0.02, 0)
            }), u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                TextStrokeTransparency = 0,
                Text = "<b>" .. p2.team.name .. " Goal</b>",
                Size = UDim2.fromScale(1, 0.5),
                Font = Enum.Font.JosefinSans,
                TextColor3 = p2.team.color,
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            }), u1.createElement("TextLabel", {
                Text = "<b>Fall in to score!</b>",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                TextStrokeTransparency = 0,
                Size = UDim2.fromScale(1, 0.4),
                Font = Enum.Font.JosefinSans,
                TextColor3 = Color3.fromRGB(245, 245, 220),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            }) });
    end)
};