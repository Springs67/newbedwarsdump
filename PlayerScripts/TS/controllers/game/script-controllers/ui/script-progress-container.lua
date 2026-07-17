-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local ScriptProgressBar = RuntimeLib.import(script, script.Parent, "script-progress-bar").ScriptProgressBar;
local v2 = u1.Component:extend("ScriptProgressContainer");

function v2.init(p3) -- Line: 8
end;

function v2.render(p4) -- Line: 10
    -- upvalues: u1 (copy), ScriptProgressBar (copy)
    local v5 = {};
    local _ = #v5;
    local progressBars = p4.props.progressBars;

    local function _(p6, p7) -- Line: 17
        -- upvalues: u1 (ref), ScriptProgressBar (ref)
        return u1.createElement(ScriptProgressBar, {
            data = p6,
            alignment = (p7 + 1) % 2 == 0 and "R" or "L",
            row = math.ceil((p7 + 1) / 2)
        });
    end;

    local v8 = table.create(#progressBars);
    local v9 = {
        ResetOnSpawn = false
    };

    for i, v in progressBars do
        local v10 = i - 1;
        v8[i] = u1.createElement(ScriptProgressBar, {
            data = v,
            alignment = (v10 + 1) % 2 == 0 and "R" or "L",
            row = math.ceil((v10 + 1) / 2)
        });
    end;

    local v11 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.5, 0.1),
        Position = UDim2.fromScale(0.25, 0.009)
    };
    local v12 = {};
    local v13 = #v12;

    for i, v in v8 do
        v12[v13 + i] = v;
    end;

    v5.ScriptProgressBarContainer = u1.createElement("Frame", v11, v12);

    return u1.createFragment({
        ScriptProgressBarGUI = u1.createElement("ScreenGui", v9, v5)
    });
end;

function v2.didMount(p14) -- Line: 46
end;

return {
    ScriptProgressContainer = v2
};