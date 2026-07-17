-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DarkBackground = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DarkBackground;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local QueueSelectionAppCore = RuntimeLib.import(script, script.Parent, "queue-selection-app-core").QueueSelectionAppCore;
local v3 = u1.PureComponent:extend("QueueSelectionAppBase");

function v3.init(p4) -- Line: 10
end;

function v3.render(p5) -- Line: 12
    -- upvalues: u1 (copy), DarkBackground (copy), QueueSelectionAppCore (copy)
    local v6 = { u1.createElement(DarkBackground, {
            BackgroundTransparency = 0.4,
            AppId = p5.props.AppId
        }) };
    local v7 = {};
    local v8 = {
        DisplayOrder = 20,
        ResetOnSpawn = false
    };

    for i, v in p5.props do
        v7[i] = v;
    end;

    v6[#v6 + 1] = u1.createElement(QueueSelectionAppCore, v7);

    return u1.createElement("ScreenGui", v8, v6);
end;

return {
    QueueSelectionApp = v2.connect(function(p9, p10) -- Line: 32
        local v11 = {
            store = p9
        };

        for i, v in p10 do
            v11[i] = v;
        end;

        return v11;
    end)(v3)
};