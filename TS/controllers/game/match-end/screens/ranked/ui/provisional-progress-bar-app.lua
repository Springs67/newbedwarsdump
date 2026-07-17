-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ProvisionalProgressBarCore = RuntimeLib.import(script, script.Parent, "provisional-progress-bar-core").ProvisionalProgressBarCore;
local v3 = u1.PureComponent:extend("ProvisionalProgressBarAppBase");

function v3.init(p4) -- Line: 9
end;

function v3.render(p5) -- Line: 11
    -- upvalues: u1 (copy), ProvisionalProgressBarCore (copy)
    local v6 = {};
    local v7 = {};
    local v8 = {
        ResetOnSpawn = false,
        DisplayOrder = 101
    };

    for i, v in p5.props do
        v7[i] = v;
    end;

    v6[#v6 + 1] = u1.createElement(ProvisionalProgressBarCore, v7);

    return u1.createElement("ScreenGui", v8, v6);
end;

return {
    ProvisionalProgressBarApp = v2.connect(function(p9, p10) -- Line: 26
        local v11 = {
            store = p9
        };

        for i, v in p10 do
            v11[i] = v;
        end;

        return v11;
    end)(v3)
};