-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local NewPlayerBundleConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "robux-store", "new-player-bundle-config").NewPlayerBundleConfig;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local getDailyStoreItemMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "robux-daily-store", "robux-daily-store-items").getDailyStoreItemMetadata;
local UIAlert = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ui", "ui-alert").UIAlert;
local NewPlayerBundleClientUtil = RuntimeLib.import(script, script.Parent, "ui", "new-player-bundle-util-client").NewPlayerBundleClientUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "RobuxStoreController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 30
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "RobuxStoreController";
    p4.dailyStorePurchaseHistoryRequseted = false;
    p4.dailyStoreItemsRequested = false;
end;

function u2.KnitStart(u5) -- Line: 40
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), UIAlert (copy), default2 (copy), ClientStore (copy), Players (copy), NewPlayerBundleConfig (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.NewUIAlert:connect(function(p6) -- Line: 43
        -- upvalues: UIAlert (ref), u5 (copy)
        if p6.uiAlert == UIAlert.NEW_PLAYER_BUNDLE and p6.data.alerts > 0 then
            task.delay(5, function() -- Line: 45
                -- upvalues: u5 (ref)
                u5:attemptNewPlayerBundlePopup();
            end);
        end;
    end);
    default2.Client:Get("SendNewPlayerBundleData"):Connect(function(p7, p8) -- Line: 50
        -- upvalues: ClientStore (ref), Players (ref), NewPlayerBundleConfig (ref)
        ClientStore:dispatch({
            type = "LobbySetNewPlayerBundleData",
            newPlayerBundleData = {
                firstJoinTime = p7,
                purchased = p8
            }
        });
        Players.LocalPlayer:SetAttribute("NewPlayerStatusExpireTime", p7 + NewPlayerBundleConfig.NEW_PLAYER_TIME);
    end);
    default2.Client:Get("DailyStoreSendPurchaseUpdate"):Connect(function(p9) -- Line: 60
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "RobuxStoreAddDailyPurchaseHistory",
            item = p9
        });
    end);
    default2.Client:Get("DailyStoreSendItemsUpdate"):Connect(function(p10) -- Line: 66
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "RobuxStoreSetDailyItems",
            items = p10
        });
    end);
    ClientSyncEvents.DailyReset:connect(function() -- Line: 72
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "RobuxStoreSetDailyPurchaseHistory",
            dailyPurchaseHistory = {}
        });
    end);
end;

function u2.openRobuxStoreUI(p11) -- Line: 80
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.STORE_MENU_APP, {
        AppId = BedwarsAppIds.STORE_MENU_APP
    });
end;

function u2.getNewPlayerBundleData(p12) -- Line: 85
    -- upvalues: ClientStore (copy)
    return ClientStore:getState().Lobby.robuxStore.newPlayerBundleData;
end;

function u2.requestDailyStorePurchaseHistory(p13) -- Line: 88
    -- upvalues: ClientStore (copy), default2 (copy)
    if p13.dailyStorePurchaseHistoryRequseted then
        return ClientStore:getState().Lobby.robuxStore.dailyPurchaseHistory;
    end;

    local v14 = default2.Client:Get("DailyStoreRequestPurchaseHistory"):CallServer();
    ClientStore:dispatch({
        type = "RobuxStoreSetDailyPurchaseHistory",
        dailyPurchaseHistory = v14
    });
    p13.dailyStorePurchaseHistoryRequseted = true;

    return v14;
end;

function u2.requestDailyStoreItems(p15) -- Line: 100
    -- upvalues: ClientStore (copy), default2 (copy)
    if p15.dailyStoreItemsRequested then
        return ClientStore:getState().Lobby.robuxStore.dailyStoreItems;
    end;

    local v16 = default2.Client:Get("DailyStoreRequestItems"):CallServer();
    ClientStore:dispatch({
        type = "RobuxStoreSetDailyItems",
        items = v16
    });
    p15.dailyStoreItemsRequested = true;

    return v16;
end;

function u2.purchaseDailyStoreItem(p17, u18, p19) -- Line: 112
    -- upvalues: default2 (copy), getDailyStoreItemMetadata (copy), SoundManager (copy), GameSound (copy), default (copy)
    local v20 = default2.Client:Get("DailyStoreRequestPurchase"):CallServerAsync(u18, p19);
    v20:andThen(function(p21) -- Line: 114
        -- upvalues: getDailyStoreItemMetadata (ref), u18 (copy), SoundManager (ref), GameSound (ref), default (ref)
        if p21.success then
            if getDailyStoreItemMetadata(u18).freeItem then
                SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
            end;
        else
            default.Info(p21.error);
        end;
    end);

    return v20;
end;

function u2.requestDailyStoreRefresh(p22) -- Line: 127
    -- upvalues: KnitClient2 (copy)
    KnitClient2.Controllers.BedCoinProductPurchaseController:purchase({
        productId = 64
    });
end;

function u2.attemptNewPlayerBundlePopup(p23) -- Line: 132
    -- upvalues: ClientStore (copy), UIAlert (copy), NewPlayerBundleClientUtil (copy), KnitClient (copy)
    local uiAlerts = ClientStore:getState().GameUpdates.uiAlerts;

    if uiAlerts ~= nil then
        uiAlerts = uiAlerts[UIAlert.NEW_PLAYER_BUNDLE];
    end;

    if NewPlayerBundleClientUtil.shouldShowNewPlayerBundle() and (uiAlerts and uiAlerts.alerts > 0) then
        p23:openRobuxStoreUI();
        KnitClient.Controllers.UiAlertController:confirmUIAlert(UIAlert.NEW_PLAYER_BUNDLE);
    end;
end;

KnitClient.CreateController(u2.new());

return nil;