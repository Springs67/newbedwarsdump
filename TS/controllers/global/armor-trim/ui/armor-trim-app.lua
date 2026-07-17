-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ArmorTrimType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ArmorTrimCore = RuntimeLib.import(script, script.Parent, "armor-trim-core").ArmorTrimCore;
local ArmorTrimToolbar = RuntimeLib.import(script, script.Parent, "armor-trim-toolbar").ArmorTrimToolbar;
local v14 = v3.new(u2)(function(u5, p6) -- Line: 20
    -- upvalues: SoundManager (copy), GameSound (copy), Flamework (copy), UILayers (copy), BedwarsAppIds (copy), FullScreenMenuBackgroundPresets (copy), u2 (copy), FullScreenMenu (copy), SlideIn (copy), DeviceUtil (copy), Empty (copy), ArmorTrimToolbar (copy), ArmorTrimCore (copy), ArmorTrimType (copy)
    local useEffect = p6.useEffect;
    local u7, u8 = p6.useState(false);
    useEffect(function() -- Line: 24
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        return function() -- Line: 26
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});

    local function v9() -- Line: 33
        -- upvalues: Flamework (ref), UILayers (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
    end;

    local function v10() -- Line: 36
        -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
            SelectedKit = u5.SelectedKit
        });
    end;

    local v11 = {};
    local v12 = {};

    local function v13() -- Line: 30
        -- upvalues: u8 (copy), u7 (copy)
        u8(not u7);
    end;

    for i, v in FullScreenMenuBackgroundPresets.GENERIC_BW_IMAGE_PRESET do
        v11[i] = v;
    end;

    v12.Background = v11;
    v12.ContainerSize = UDim2.fromScale(1, 1);
    v12.DisableScaleComponent = true;
    v12.ExitButton = {
        OnClick = v9
    };
    v12.BackButton = {
        OnClick = v10
    };

    return u2.createElement(FullScreenMenu, v12, { u2.createElement(SlideIn, {}, { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(DeviceUtil.isSmallScreen() and 0.1 or 0.02, 0),
                PaddingBottom = UDim.new(0.11, 0)
            }), u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, { u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1)
                }, { u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical
                    }), u2.createElement(ArmorTrimToolbar, {
                        SelectedKit = u5.SelectedKit,
                        Size = UDim2.fromScale(1, 0.09),
                        OnViewAll = v13,
                        ViewAll = u7
                    }), u2.createElement(ArmorTrimCore, {
                        store = u5.store,
                        SelectedKit = u5.SelectedKit,
                        ArmorTrimType = ArmorTrimType.TRIM_1,
                        ViewAll = u7
                    }) }) }) }) });
end);

return {
    ArmorTrimApp = v4.connect(function(p15, p16) -- Line: 90
        local v17 = {
            store = p15
        };

        for i, v in p16 do
            v17[i] = v;
        end;

        return v17;
    end)(v14)
};