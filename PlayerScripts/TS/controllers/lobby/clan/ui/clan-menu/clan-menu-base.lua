-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ClanMenu = RuntimeLib.import(script, script.Parent, "clan-menu-core").ClanMenu;
local v4 = u2.PureComponent:extend("ClanMenuBase");

function v4.init(p5) -- Line: 13
end;

function v4.render(p6) -- Line: 15
    -- upvalues: u2 (copy), DeviceUtil (copy), DarkBackground (copy), SlideIn (copy), ClanMenu (copy)
    return u2.createElement("ScreenGui", {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = not DeviceUtil.isSmallScreen()
    }, { u2.createElement(DarkBackground, {
            AppId = p6.props.AppId
        }), u2.createElement(SlideIn, {}, { u2.createElement(ClanMenu, {
                AppId = p6.props.AppId,
                store = p6.props.store,
                StartingTab = p6.props.tab
            }) }) });
end;

return {
    ClanMenuApp = v3.connect(function(p7, p8) -- Line: 34
        local v9 = {
            store = p7
        };

        for i, v in p8 do
            v9[i] = v;
        end;

        return v9;
    end)(v4)
};