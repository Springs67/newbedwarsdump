-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local GiftingCore = RuntimeLib.import(script, script.Parent, "gifting-core").GiftingCore;
local v3 = u1.PureComponent:extend("GiftingAppBase");

function v3.init(p4) -- Line: 10
end;

function v3.render(p5) -- Line: 12
    -- upvalues: DeviceUtil (copy), u1 (copy), GiftingCore (copy)
    local v6 = {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v7 = {};
    local v8 = {};

    for i, v in p5.props do
        v8[i] = v;
    end;

    v7[#v7 + 1] = u1.createElement(GiftingCore, v8);

    return u1.createElement("ScreenGui", v6, v7);
end;

return {
    GiftingApp = v2.connect(function(p9, p10) -- Line: 27
        return p10;
    end)(v3)
};