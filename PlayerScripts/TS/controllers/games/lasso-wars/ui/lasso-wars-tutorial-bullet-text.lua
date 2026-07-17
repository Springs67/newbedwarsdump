-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    LassoWarsTutorialBulletText = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 7
        -- upvalues: u1 (copy), ColorUtil (copy)
        local _ = p3.useState;
        local _ = p3.useEffect;

        return u1.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextStrokeTransparency = 0.5,
            LayoutOrder = 1,
            TextSize = 28,
            TextWrap = true,
            Size = UDim2.fromScale(1, 0.15),
            Text = "• " .. p2.text,
            AutomaticSize = Enum.AutomaticSize.Y,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.SourceSans,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextStrokeColor3 = Color3.fromRGB(122, 122, 122)
        });
    end)
};