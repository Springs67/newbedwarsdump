-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SettingsCore = RuntimeLib.import(script, script.Parent, "settings-core").SettingsCore;
local v15 = v3.new(u2)(function(u5, p6) -- Line: 17
    -- upvalues: SoundManager (copy), GameSound (copy), DeviceUtil (copy), u2 (copy), DarkBackground (copy), Theme (copy), ScaleComponent (copy), Flamework (copy), SettingsCore (copy), WidgetComponent (copy), SlideIn (copy)
    local _ = p6.useState;
    p6.useEffect(function() -- Line: 20
        -- upvalues: SoundManager (ref), GameSound (ref)
        return function() -- Line: 21
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});
    local v7 = {
        ResetOnSpawn = false,
        DisplayOrder = 50,
        IgnoreGuiInset = not DeviceUtil.isSmallScreen()
    };
    local v8 = { u2.createElement(DarkBackground, {
            AppId = "SettingsApp"
        }) };
    local v9 = {};
    local v10 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = Theme.widgetSize
    };
    local v11 = { u2.createElement(ScaleComponent, {
            MaximumSize = Theme.widgetScaleComponentMaxSize,
            ScreenPadding = Theme.widgetScaleComponentScreenPadding
        }) };
    local v12 = {
        ClipsDescendents = false,
        Title = "Settings",
        AppId = u5.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 58, Name: OnClose
            -- upvalues: Flamework (ref), u5 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
        end
    };
    local v13 = {};
    local v14 = {};

    for i, v in u5 do
        v14[i] = v;
    end;

    v13[#v13 + 1] = u2.createElement(SettingsCore, v14);
    v11[#v11 + 1] = u2.createElement(WidgetComponent, v12, v13);
    v9[#v9 + 1] = u2.createElement("Frame", v10, v11);
    v8[#v8 + 1] = u2.createElement(SlideIn, {}, v9);

    return u2.createFragment({
        SettingsAppGui = u2.createElement("ScreenGui", v7, v8)
    });
end);

return {
    SettingsApp = v4.connect(function(p16, p17) -- Line: 77
        local v18 = {};

        for i, v in p17 do
            v18[i] = v;
        end;

        v18.Settings = p16.Settings;

        return v18;
    end)(v15)
};