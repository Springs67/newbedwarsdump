-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    PlayerProfileEmpty = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u2 (copy), Empty (copy), ColorUtil (copy), Theme (copy)
        local _ = p5.useState;

        return u2.createElement(Empty, {
            LayoutOrder = 2,
            Size = p4.Size
        }, { u2.createElement("Frame", {
                BackgroundTransparency = 0.7,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.9, 0.9),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.05, 0)
                }), u2.createElement("TextLabel", {
                    TextSize = 18,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Text = p4.Text,
                    TextColor3 = Theme.textPrimary,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }) }) });
    end)
};