-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    FisherMinigameGameOver = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: u1 (copy), ColorUtil (copy)
        local _ = p3.useState;
        local v4 = string.split(p2.fishType, "_");
        local v5 = #v4;
        local v6 = v4[v5];
        v4[v5] = nil;
        local createFragment = u1.createFragment;
        local v7 = {};
        local createElement = u1.createElement;
        local v8 = {
            AutomaticSize = "X",
            BackgroundTransparency = 0.6,
            BorderSizePixel = 0,
            TextScaled = true,
            RichText = true,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0, 0.1),
            BackgroundColor3 = ColorUtil.BLACK,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        };
        local v9;

        if p2.win then
            v9 = "You caught a <b>" .. tostring(v6) .. " fish</b>!";
        else
            v9 = "The <b>" .. tostring(v6) .. " fish</b> got away";
        end;

        v8.Text = v9;
        v7.GameOverScreen = createElement("TextLabel", v8, { u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0, 6),
                PaddingRight = UDim.new(0, 6)
            }), u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), u1.createElement("UITextSizeConstraint", {
                MaxTextSize = 20
            }) });

        return createFragment(v7);
    end)
};