-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ClanProfileTab = RuntimeLib.import(script, script.Parent.Parent.Parent, "clan-profile-core").ClanProfileTab;
local BackgroundMusicSelectorWidget = RuntimeLib.import(script, script.Parent, "background-music-selector-widget").BackgroundMusicSelectorWidget;
local ClanHqSelectorType = RuntimeLib.import(script, script.Parent, "clan-hq-selector-type").ClanHqSelectorType;
local SkyboxSelectorWidget = RuntimeLib.import(script, script.Parent, "skybox-selector-widget").SkyboxSelectorWidget;
local v13 = v3.new(u2)(function(u5, p6) -- Line: 16
    -- upvalues: u2 (copy), DeviceUtil (copy), DarkBackground (copy), Flamework (copy), BedwarsAppIds (copy), ClanProfileTab (copy), SlideIn (copy), ClanHqSelectorType (copy), BackgroundMusicSelectorWidget (copy), SkyboxSelectorWidget (copy)
    local _ = p6.useState;
    local myClanId = u5.myClanId;

    if myClanId == "" or not myClanId then
        return u2.createFragment();
    end;

    local createElement = u2.createElement;
    local v7 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v8 = {};
    local v9 = u2.createElement(DarkBackground, {
        AppId = u5.AppId,

        OnClick = function() -- Line: 29, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy), ClanProfileTab (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                ClanId = u5.myClanId,
                tab = ClanProfileTab.MANAGEMENT
            });

            return true;
        end
    });
    local createElement2 = u2.createElement;
    local v10 = {};
    local v11 = {};
    local v12;

    if u5.type == ClanHqSelectorType.BACKGROUND_MUSIC then
        v12 = u2.createElement(BackgroundMusicSelectorWidget, {
            AppId = u5.AppId,
            store = u5.store
        });
    else
        v12 = u2.createElement(SkyboxSelectorWidget, {
            AppId = u5.AppId,
            store = u5.store
        });
    end;

    v11[1] = v12;
    v8[1], v8[2] = v9, createElement2(SlideIn, v10, v11);

    return createElement("ScreenGui", v7, v8);
end);

return {
    ClanHqSelectorApp = v4.connect(function(p14, p15) -- Line: 49
        local v16 = {};

        for i, v in p15 do
            v16[i] = v;
        end;

        v16.store = p14;
        v16.myClanId = p14.Clans.myClanId;
        local myClan = p14.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.clanHq;
        end;

        v16.clanHq = myClan;

        return v16;
    end)(v13)
};