-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local RateMapModal = RuntimeLib.import(script, script.Parent.Parent.Parent, "map", "published-maps", "rate-map-modal").RateMapModal;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local MapBrowser = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-constants").MapBrowser;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "CustomMapBrowserController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p3);
    p3.Name = "CustomMapBrowserController";
    p3.remotes = default.Client:GetNamespace("CustomMapBrowser");
end;

function u1.KnitStart(p4) -- Line: 29
    -- upvalues: KnitController (copy), ClientStore (copy), Flamework (copy), RateMapModal (copy)
    KnitController.KnitStart(p4);
    p4.remotes:Get("ClearBatchData"):Connect(function() -- Line: 31
        -- upvalues: ClientStore (ref)
        local Lobby = ClientStore:getState().Lobby;
        local v5 = {
            joinedMaps = Lobby.mapBrowserProfileData.joinedMaps
        };
        local v6 = {};
        local v7 = #v6;
        local v8 = {
            type = "LobbySetMapBrowserProfileData"
        };

        for i, v in Lobby.mapBrowserProfileData.ratings do
            v7 = v7 + 1;
            v6[v7] = { i, v };
        end;

        for i, v in Lobby.pendingMapRatings do
            v7 = v7 + 1;
            v6[v7] = { i, v };
        end;

        local v9 = {};

        for _, v in v6 do
            v9[v[1]] = v[2];
        end;

        v5.ratings = v9;
        v8.mapBrowserProfileData = v5;
        ClientStore:dispatch(v8);
        ClientStore:dispatch({
            type = "LobbyClearPendingMapData"
        });
    end);
    p4.remotes:Get("DisplayRateMapPopup"):Connect(function(p10) -- Line: 65
        -- upvalues: Flamework (ref), RateMapModal (ref)
        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("RateMapModal") then
            return nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "RateMapModal",
            app = RateMapModal
        }, {
            AppId = "RateMapModal",
            mapData = p10
        });
    end);
end;

function u1.getExistingLocalRatings(p11) -- Line: 78
    -- upvalues: ClientStore (copy)
    if p11.existingMapData then
        return p11.existingMapData;
    end;

    p11.existingMapData = p11.remotes:Get("GetMyMapBrowserData"):CallServer();
    ClientStore:dispatch({
        type = "LobbySetMapBrowserProfileData",
        mapBrowserProfileData = p11.existingMapData
    });

    return p11.existingMapData;
end;

function u1.getPublishedMapCount(p12) -- Line: 89
    return p12.remotes:Get("MapBrowserGetPublishedCount"):CallServerAsync();
end;

function u1.getFeaturedList(p13) -- Line: 92
    return p13.remotes:Get("MapBrowserGetFeaturedList"):CallServerAsync(8);
end;

function u1.searchMap(p14, p15) -- Line: 95
    return p14.remotes:Get("MapBrowserSearchMap"):CallServerAsync(p15);
end;

function u1.publishMap(p16, p17, p18) -- Line: 98
    return p16.remotes:Get("MapBrowserPublishMap"):CallServerAsync(p17, p18);
end;

function u1.updateMapMetadata(p19, p20, p21) -- Line: 101
    p19.remotes:Get("MapBrowserUpdateMap"):SendToServer({
        mapId = p20,
        patchDto = p21
    });
end;

function u1.userRateMap(p22, p23) -- Line: 107
    -- upvalues: MapBrowser (copy), Flamework (copy), ClientStore (copy)
    if MapBrowser.MAP_RATING_DISABLED then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "Rating a map is temporarily disabled. Check back soon!"
        });

        return {
            success = false,
            errorMessage = "Rating a map is temporarily disabled. Check back soon!"
        };
    end;

    if ClientStore:getState().Lobby.mapBrowserProfileData.joinedMaps[p23.mapId] == nil then
        return {
            success = false,
            errorMessage = "You must play the map before rating it."
        };
    end;

    ClientStore:dispatch({
        type = "LobbySetMapRating",
        rating = p23
    });
    p22.remotes:Get("MapBrowserRateMap"):SendToServer(p23);

    return {
        success = true
    };
end;

KnitClient.CreateController(u1.new());

return nil;