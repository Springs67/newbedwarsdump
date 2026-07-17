-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    EmberProgressBar = function(p3) -- Line: 8, Name: EmberProgressBar
        -- upvalues: u2 (copy), ProgressBar (copy), Theme (copy), ColorUtil (copy)
        local emberProgress = p3.store.Kit.emberProgress;
        local v4 = math.max(0.01, emberProgress == nil and 0.01 or emberProgress);
        local v5 = math.min(1, v4);

        return u2.createElement(ProgressBar, {
            Size = Theme.actionBarProgressBarSize,
            Progress = v5,
            BarGradient = ColorSequence.new(ColorUtil.hexColor(14363435), ColorUtil.hexColor(14573407))
        });
    end
};