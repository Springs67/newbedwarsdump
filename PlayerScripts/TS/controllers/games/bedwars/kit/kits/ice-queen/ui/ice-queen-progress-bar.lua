-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v2 = u1.Component:extend("IceQueenProgressBar");

function v2.init(p3) -- Line: 9
end;

function v2.render(p4) -- Line: 11
    -- upvalues: Theme (copy), u1 (copy), ProgressBar (copy)
    local v5 = {
        Size = Theme.actionBarProgressBarSize
    };
    local iceQueenProgress = p4.props.store.Kit.iceQueenProgress;
    v5.Progress = iceQueenProgress == nil and 0.01 or iceQueenProgress;
    v5.BarGradient = ColorSequence.new(Color3.fromRGB(140, 212, 255), Color3.fromRGB(15, 79, 255));
    v5.AcceptZero = true;

    return u1.createElement(ProgressBar, v5);
end;

function v2.shouldUpdate(p6, p7) -- Line: 24
    return p7.store.Kit.iceQueenProgress ~= p6.props.store.Kit.iceQueenProgress;
end;

return {
    IceQueenProgressBar = v2
};