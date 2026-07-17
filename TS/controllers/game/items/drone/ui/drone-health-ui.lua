-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v2 = u1.Component:extend("DroneHealth");

function v2.init(p3) -- Line: 9
end;

function v2.render(p4) -- Line: 11
    -- upvalues: u1 (copy), ProgressBar (copy), Theme (copy)
    return u1.createElement(ProgressBar, {
        AcceptZero = true,
        Size = Theme.actionBarProgressBarSize,
        Progress = p4.props.health / p4.props.maxHealth,
        BarGradient = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
    });
end;

return {
    DroneHealth = v2
};