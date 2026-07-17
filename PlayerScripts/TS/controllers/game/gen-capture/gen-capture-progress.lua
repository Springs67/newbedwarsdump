-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    GenCaptureComponent = v4.new(u3)(function(p5, p6) -- Line: 10
        -- upvalues: u2 (copy), u3 (copy), ProgressBar (copy), Theme (copy), ColorUtil (copy)
        local useEffect = p6.useEffect;
        local v7, _ = p6.useState(0);
        useEffect(function() -- Line: 15
            -- upvalues: u2 (ref)
            local u8 = u2.new();

            return function() -- Line: 17
                -- upvalues: u8 (copy)
                u8:DoCleaning();
            end;
        end, {});

        return u3.createElement(ProgressBar, {
            AcceptZero = true,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = v7 / 100,
            BarGradient = ColorSequence.new(ColorUtil.hexColor(12255224), ColorUtil.hexColor(16777215))
        });
    end)
};