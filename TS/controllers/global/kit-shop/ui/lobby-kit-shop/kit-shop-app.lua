-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KitShopItemList = RuntimeLib.import(script, script.Parent, "kit-shop-item-list").KitShopItemList;
local v13 = v3.new(u2)(function(p5, p6) -- Line: 16
    -- upvalues: SoundManager (copy), GameSound (copy), Flamework (copy), UILayers (copy), FullScreenMenuBackgroundPresets (copy), u2 (copy), DeviceUtil (copy), KnitClient (copy), KitShopItemList (copy), FullScreenMenu (copy)
    p6.useEffect(function() -- Line: 18
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        return function() -- Line: 20
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});

    local function v7() -- Line: 24
        -- upvalues: Flamework (ref), UILayers (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
    end;

    local v8 = {};
    local v9 = {};

    for i, v in FullScreenMenuBackgroundPresets.GENERIC_BW_IMAGE_PRESET do
        v8[i] = v;
    end;

    v8.OnClick = v7;
    v9.Background = v8;
    v9.ExitButton = {
        OnClick = v7
    };
    v9.EnableButtonBackgroundPanel = true;
    local v10 = { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(DeviceUtil.isSmallScreen() and 0.175 or 0.025, 0)
        }) };
    local v11 = {
        Size = UDim2.fromScale(0.7, 1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        store = p5.store,
        SelectedKit = p5.SelectedKit,
        InitialState = p5.SaveInitialState and {
            CanvasPositionY = p5.store.Lobby.kitShop.CanvasPositionY,
            KitClassFilter = p5.store.Lobby.kitShop.KitClassFilter,
            OwnedFilter = p5.store.Lobby.kitShop.OwnedFilter,
            FavoritedToggle = p5.store.Lobby.kitShop.FavoritedToggle,
            SearchText = p5.store.Lobby.kitShop.SearchText
        } or nil
    };
    local v12;

    if DeviceUtil.isHoarceKat() then
        v12 = false;
    else
        local MatchController = KnitClient.Controllers.MatchController;

        if MatchController ~= nil then
            MatchController = MatchController:getQueueMeta();

            if MatchController ~= nil then
                MatchController = MatchController.allowUnownedKits;
            end;
        end;

        v12 = MatchController == true;
    end;

    v11.ShowAllKits = v12;
    v10[#v10 + 1] = u2.createElement(KitShopItemList, v11);

    return u2.createElement(FullScreenMenu, v9, v10);
end);

return {
    KitShopApp = v4.connect(function(p14, p15) -- Line: 76
        local v16 = {
            store = p14
        };

        for i, v in p15 do
            v16[i] = v;
        end;

        return v16;
    end)(v13)
};