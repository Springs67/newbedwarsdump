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
local ClanLobbySelectorType = RuntimeLib.import(script, script.Parent, "clan-lobby-selector-type").ClanLobbySelectorType;
local ClanTagSelectorWidget = RuntimeLib.import(script, script.Parent, "clan-tag-selector-widget").ClanTagSelectorWidget;
local PodiumBannerSelectorWidget = RuntimeLib.import(script, script.Parent, "podium-banner-selector-widget").PodiumBannerSelectorWidget;
local v12 = v3.new(u2)(function(u5) -- Line: 16
    -- upvalues: u2 (copy), DeviceUtil (copy), DarkBackground (copy), Flamework (copy), BedwarsAppIds (copy), ClanProfileTab (copy), SlideIn (copy), ClanLobbySelectorType (copy), PodiumBannerSelectorWidget (copy), ClanTagSelectorWidget (copy)
    local myClanId = u5.myClanId;

    if myClanId == "" or not myClanId then
        return u2.createFragment();
    end;

    local createElement = u2.createElement;
    local v6 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v7 = {};
    local v8 = u2.createElement(DarkBackground, {
        AppId = u5.AppId,

        OnClick = function() -- Line: 28, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy), ClanProfileTab (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                ClanId = u5.myClanId,
                tab = ClanProfileTab.MANAGEMENT
            });

            return true;
        end
    });
    local createElement2 = u2.createElement;
    local v9 = {};
    local v10 = {};
    local v11;

    if u5.type == ClanLobbySelectorType.PODIUM_BANNER then
        v11 = u2.createElement(PodiumBannerSelectorWidget, {
            AppId = u5.AppId,
            store = u5.store
        });
    elseif u5.type == ClanLobbySelectorType.CLAN_TAG_COLOR then
        v11 = u2.createElement(ClanTagSelectorWidget, {
            AppId = u5.AppId,
            store = u5.store
        });
    else
        v11 = u2.createFragment();
    end;

    v10[1] = v11;
    v7[1], v7[2] = v8, createElement2(SlideIn, v9, v10);

    return createElement("ScreenGui", v6, v7);
end);

return {
    ClanLobbySelectorApp = v4.connect(function(p13, p14) -- Line: 48
        local v15 = {};

        for i, v in p14 do
            v15[i] = v;
        end;

        v15.store = p13;
        v15.myClanId = p13.Clans.myClanId;

        return v15;
    end)(v12)
};