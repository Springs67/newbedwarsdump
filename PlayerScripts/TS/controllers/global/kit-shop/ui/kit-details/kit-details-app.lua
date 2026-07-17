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
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KitDetailsCenterContainer = RuntimeLib.import(script, script.Parent, "kit-details-center-container").KitDetailsCenterContainer;
local KitDetailsLeftContainer = RuntimeLib.import(script, script.Parent, "kit-details-left-container", "kit-details-left-container").KitDetailsLeftContainer;
local KitDetailsRightContainer = RuntimeLib.import(script, script.Parent, "kit-details-right-container", "kit-details-right-container").KitDetailsRightContainer;
local v21 = v3.new(u2)(function(u5, p6) -- Line: 21
    -- upvalues: SoundManager (copy), GameSound (copy), Flamework (copy), UILayers (copy), BedwarsAppIds (copy), FullScreenMenuBackgroundPresets (copy), u2 (copy), DeviceUtil (copy), KitDetailsLeftContainer (copy), BundleMeta (copy), KitDetailsCenterContainer (copy), KitDetailsRightContainer (copy), Empty (copy), SlideIn (copy), FullScreenMenu (copy)
    local useEffect = p6.useEffect;
    local SelectedKitSkin = u5.SelectedKitSkin;

    if not SelectedKitSkin then
        if u5.SelectedKit and u5.store.Bedwars.equippedKitSkins then
            SelectedKitSkin = u5.store.Bedwars.equippedKitSkins[u5.SelectedKit];
        else
            SelectedKitSkin = nil;
        end;
    end;

    local v7, u8 = p6.useState(SelectedKitSkin);
    useEffect(function() -- Line: 25
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        return function() -- Line: 27
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});

    local function v9() -- Line: 31
        -- upvalues: Flamework (ref), UILayers (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
    end;

    local function v10() -- Line: 34
        -- upvalues: Flamework (ref), UILayers (ref), BedwarsAppIds (ref), u5 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_SHOP_APP, {
            SaveInitialState = true,
            SelectedKit = u5.store.Bedwars.kit
        });
    end;

    local v11 = {};
    local v12 = {};

    for i, v in FullScreenMenuBackgroundPresets.GENERIC_BW_IMAGE_PRESET do
        v11[i] = v;
    end;

    v12.Background = v11;
    v12.ExitButton = {
        OnClick = v9
    };
    v12.BackButton = {
        OnClick = v10
    };
    local v13 = {};
    local v14 = { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(DeviceUtil.isSmallScreen() and 0.175 or 0.025, 0),
            PaddingLeft = UDim.new(0.025, 0),
            PaddingRight = UDim.new(0.025, 0)
        }) };
    local v15 = {
        Size = UDim2.fromScale(1, 0.9)
    };
    local v17 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }), u2.createElement(KitDetailsLeftContainer, {
            store = u5.store,
            Size = UDim2.fromScale(0.3, 1),
            SelectedKit = u5.SelectedKit,
            SelectedKitSkin = v7,

            SetSelectedKitSkin = function(p16) -- Line: 78, Name: SetSelectedKitSkin
                -- upvalues: u8 (copy)
                u8(p16);
            end,

            SelectedKitBundle = u5.SelectedBundle
        }) };
    local v18 = #v17;
    local v19 = {
        Size = UDim2.fromScale(0.4, 1),
        SelectedKit = u5.SelectedKit,
        SelectedKitSkin = v7
    };
    local v20;

    if u5.SelectedBundle then
        v20 = BundleMeta[u5.SelectedBundle].kitShopBundle;

        if v20 ~= nil then
            v20 = v20.image;
        end;
    else
        v20 = nil;
    end;

    v19.ItemImage = v20;
    v17[v18 + 1] = u2.createElement(KitDetailsCenterContainer, v19);
    v17[v18 + 2] = u2.createElement(KitDetailsRightContainer, {
        Size = UDim2.fromScale(0.3, 1),
        SelectedKit = u5.SelectedKit,
        SelectedKitSkin = v7,
        SelectedKitBundle = u5.SelectedBundle,
        store = u5.store
    });
    v14[#v14 + 1] = u2.createElement(Empty, v15, v17);
    v13[#v13 + 1] = u2.createElement(SlideIn, {}, v14);

    return u2.createElement(FullScreenMenu, v12, v13);
end);

return {
    KitDetailsApp = v4.connect(function(p22, p23) -- Line: 114
        local v24 = {
            store = p22
        };

        for i, v in p23 do
            v24[i] = v;
        end;

        return v24;
    end)(v21)
};