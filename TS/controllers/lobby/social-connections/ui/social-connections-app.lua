-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local SocialConnectionsCore = RuntimeLib.import(script, script.Parent, "social-connections-core").SocialConnectionsCore;
local v3 = u1.PureComponent:extend("SocialConnectionsAppBase");

function v3.init(p4) -- Line: 10
end;

function v3.render(p5) -- Line: 12
    -- upvalues: u1 (copy), DeviceUtil (copy), SocialConnectionsCore (copy)
    return u1.createElement("ScreenGui", {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    }, { u1.createElement(SocialConnectionsCore, {
            store = p5.props.store,
            AppId = p5.props.AppId
        }) });
end;

return {
    SocialConnectionsApp = v2.connect(function(p6, p7) -- Line: 24
        local v8 = {
            store = p6
        };

        for i, v in p7 do
            v8[i] = v;
        end;

        return v8;
    end)(v3)
};