-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConfettiGroup = v1.ConfettiGroup;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ClanProfileCore = RuntimeLib.import(script, script.Parent, "clan-profile-core").ClanProfileCore;
local v4 = u2.PureComponent:extend("ClanProfileBase");

function v4.init(p5) -- Line: 14
end;

function v4.render(p6) -- Line: 16
    -- upvalues: DeviceUtil (copy), u2 (copy), DarkBackground (copy), ConfettiGroup (copy), ClanProfileCore (copy), SlideIn (copy)
    local v7 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v8 = { u2.createElement(DarkBackground, {
            AppId = p6.props.AppId
        }) };
    local v9 = {};
    local v10 = #v9;
    local v11 = p6.props.newClan and u2.createElement(ConfettiGroup, {
        Lifetime = 10
    });

    if v11 then
        v9[v10 + 1] = v11;
    end;

    local v12 = {};

    for i, v in p6.props do
        v12[i] = v;
    end;

    v9[#v9 + 1] = u2.createElement(ClanProfileCore, v12);
    v8[#v8 + 1] = u2.createElement(SlideIn, {}, v9);

    return u2.createElement("ScreenGui", v7, v8);
end;

return {
    ClanProfileApp = v3.connect(function(p13, p14) -- Line: 46
        local v15 = {
            store = p13
        };

        for i, v in p14 do
            v15[i] = v;
        end;

        return v15;
    end)(v4)
};