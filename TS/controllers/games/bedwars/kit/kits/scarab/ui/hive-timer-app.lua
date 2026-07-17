-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local TimedProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").TimedProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = u1.Component:extend("HiveTimerApp");

function v2.init(p3, p4) -- Line: 8
    p3.alive = true;
end;

function v2.didMount(p5) -- Line: 11
end;

function v2.willUnmount(p6) -- Line: 13
    p6.alive = false;
end;

function v2.render(p7) -- Line: 16
    -- upvalues: u1 (copy), TimedProgressBar (copy)
    Color3.fromRGB(255, 255, 255);

    return u1.createFragment({
        ScarabTimer = u1.createElement("BillboardGui", {
            StudsOffsetWorldSpace = Vector3.new(0, 4.5, 1.5),
            ResetOnSpawn = false,
            MaxDistance = 150,
            Adornee = p7.props.block,
            Size = UDim2.fromScale(8, 2)
        }, { u1.createElement(TimedProgressBar, {
                Size = UDim2.fromScale(1, 0.05),
                EndTime = p7.props.expireTime,
                ProgressBarConfig = {
                    GradientRotation = 0,
                    BarGradient = ColorSequence.new(Color3.fromRGB(28, 112, 255), Color3.fromRGB(51, 148, 255))
                }
            }) })
    });
end;

return {
    HiveTimerApp = v2
};