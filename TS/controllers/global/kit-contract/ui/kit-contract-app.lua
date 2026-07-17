-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KitContractCore = RuntimeLib.import(script, script.Parent, "kit-contract-core").KitContractCore;
local v11 = v3.new(u2)(function(u5, p6) -- Line: 16
    -- upvalues: SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy), UILayers (copy), FullScreenMenuBackgroundPresets (copy), u2 (copy), FullScreenMenu (copy), SlideIn (copy), KitContractCore (copy)
    local _ = p6.useState;
    p6.useEffect(function() -- Line: 19
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        return function() -- Line: 21
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});

    local function v7() -- Line: 25
        -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.KIT_CONTRACT_APP);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
            SelectedKit = u5.SelectedKit
        });
    end;

    local function v8() -- Line: 31
        -- upvalues: Flamework (ref), UILayers (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
    end;

    local v9 = {};
    local v10 = {};

    for i, v in FullScreenMenuBackgroundPresets.GENERIC_BW_IMAGE_PRESET do
        v9[i] = v;
    end;

    v9.OnClick = v8;
    v10.Background = v9;
    v10.BackButton = {
        OnClick = v7
    };
    v10.ExitButton = {
        OnClick = v8
    };

    return u2.createElement(FullScreenMenu, v10, { u2.createElement(SlideIn, {}, {
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.025, 0)
            }),
            KitContractCore = u2.createElement(KitContractCore, {
                Size = UDim2.fromScale(1, 0.875),
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0),
                SelectedKit = u5.SelectedKit,
                store = u5.store
            })
        }) });
end);

return {
    KitContractApp = v4.connect(function(p12, p13) -- Line: 63
        local v14 = {
            store = p12
        };

        for i, v in p13 do
            v14[i] = v;
        end;

        return v14;
    end)(v11)
};