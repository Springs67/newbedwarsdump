-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local LockerCore = RuntimeLib.import(script, script.Parent, "locker-core").LockerCore;
local v15 = v3.new(u2)(function(p5, p6) -- Line: 14
    -- upvalues: Flamework (copy), UILayers (copy), KnitClient (copy), DeviceUtil (copy), FullScreenMenuBackgroundPresets (copy), u2 (copy), FullScreenMenu (copy), LockerCore (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local u7, u8 = useState(0);
    local v9, v10 = useState(false);

    local function v11() -- Line: 19
        -- upvalues: Flamework (ref), UILayers (ref), KnitClient (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
        KnitClient.Controllers.LockerPreviewController:closePreview();
    end;

    if not (DeviceUtil.isHoarceKat() or KnitClient.Controllers.LockerPreviewController:isPreviewOpen()) then
        KnitClient.Controllers.LockerPreviewController:openPreview();
    end;

    useEffect(function() -- Line: 26
        -- upvalues: KnitClient (ref)
        return function() -- Line: 27
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.LockerPreviewController:closeFullscreenPreview();
            KnitClient.Controllers.LockerPreviewController:closePreview();
        end;
    end, {});
    local v12 = {
        ContainerSize = UDim2.fromScale(1, 1)
    };
    local v13 = {};

    for i, v in FullScreenMenuBackgroundPresets.GENERIC_BW_IMAGE_PRESET do
        v13[i] = v;
    end;

    local v14 = {};
    local BackgroundImageProps = FullScreenMenuBackgroundPresets.GENERIC_BW_IMAGE_PRESET.BackgroundImageProps;

    if type(BackgroundImageProps) == "table" then
        for i, v in BackgroundImageProps do
            v14[i] = v;
        end;
    end;

    v14.BackgroundTransparency = 1;
    v13.BackgroundImageProps = v14;
    v12.Background = v13;
    v12.ExitButton = {
        OnClick = v11
    };
    v12.BackButton = {
        ShouldShow = v9,

        OnClick = function() -- Line: 55, Name: OnClick
            -- upvalues: u8 (copy), u7 (copy)
            u8(u7 + 1);
        end
    };
    v12.EnableButtonBackgroundPanel = true;
    v12.DisableScaleComponent = true;
    v12.ScreenGuiProps = {
        ClipToDeviceSafeArea = false
    };
    v12.UseFrame = true;

    return u2.createElement(FullScreenMenu, v12, { u2.createElement(LockerCore, {
            AppId = p5.AppId,
            InitialTab = p5.InitialTab,
            LockerDto = {
                selectedKillEffect = p5.selectedKillEffect,
                killEffects = p5.killEffects,
                selectedEmotes = p5.selectedEmotes,
                emotes = p5.emotes,
                selectedTitle = p5.selectedTitle,
                titles = p5.titles,
                selectedLobbyGadget = p5.selectedLobbyGadget,
                lobbyGadgets = p5.lobbyGadgets,
                selectedWinEffect = p5.selectedWinEffect,
                winEffects = p5.winEffects,
                selectedBreakBedEffect = p5.selectedBreakBedEffect,
                breakBedEffects = p5.breakBedEffects,
                featuredBadges = p5.featuredBadges,
                badges = p5.badges,
                bedSkin = p5.bedSkin,
                bedSkins = p5.bedSkins,
                itemSkins = p5.itemSkins,
                selectedItemSkins = p5.selectedItemSkins
            },
            ConsumableInventory = p5.consumableInventory,
            FullScreenData = {
                BackButton = {
                    ShouldShowBackButton = v9,
                    SetShouldShowBackButton = v10,
                    BackButtonClickCount = u7
                }
            }
        }) });
end);

return {
    LockerApp = v4.connect(function(p16, p17) -- Line: 101
        local v18 = {
            selectedKillEffect = p16.Locker.selectedKillEffect,
            killEffects = p16.Locker.killEffects,
            selectedEmotes = p16.Locker.selectedEmotes,
            emotes = p16.Locker.emotes,
            selectedTitle = p16.Locker.selectedTitle,
            titles = p16.Locker.titles,
            selectedLobbyGadget = p16.Locker.selectedLobbyGadget,
            lobbyGadgets = p16.Locker.lobbyGadgets,
            selectedWinEffect = p16.Locker.selectedWinEffect,
            winEffects = p16.Locker.winEffects,
            selectedBreakBedEffect = p16.Locker.selectedBreakBedEffect,
            breakBedEffects = p16.Locker.breakBedEffects,
            featuredBadges = p16.Locker.featuredBadges,
            badges = p16.Locker.badges,
            bedSkin = p16.Locker.bedSkin,
            bedSkins = p16.Locker.bedSkins,
            itemSkins = p16.Locker.itemSkins,
            selectedItemSkins = p16.Locker.selectedItemSkins,
            consumableInventory = p16.Consumable.inventory
        };

        for i, v in p17 do
            v18[i] = v;
        end;

        return v18;
    end)(v15)
};