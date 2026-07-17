-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    WinstreakBoard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: u1 (copy), ColorUtil (copy)
        local _ = p3.useState;

        return u1.createFragment({
            WinstreakBoard = u1.createFragment({
                WinstreakBoard = u1.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Text = "🔥 " .. tostring(p2.streak),
                    Size = UDim2.fromScale(0.7, 0.7),
                    Position = UDim2.fromScale(0.5, 0.1),
                    AnchorPoint = Vector2.new(0.5, 0),
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.Arial
                })
            })
        });
    end)
};