-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local UILayers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local PlayerProfileApp = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby", "player-profile", "ui", "player-profile-app").PlayerProfileApp;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "PlayerProfileUIController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 23
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "PlayerProfileUIController";
end;

function u1.KnitStart(u4) -- Line: 31
    -- upvalues: KnitController (copy), PlaceUtil (copy), default2 (copy), Players (copy), default (copy), ClientStore (copy)
    KnitController.KnitStart(u4);
    task.spawn(function() -- Line: 33
        -- upvalues: PlaceUtil (ref), default2 (ref), Players (ref), default (ref), ClientStore (ref)
        while not game:IsLoaded() do
            task.wait(0.5);
        end;

        if PlaceUtil.isLobbyServer() then
            default2.Client:Get("RequestProfileData"):CallServerAsync(Players.LocalPlayer):andThen(function(p5) -- Line: 39
                -- upvalues: default (ref), Players (ref), ClientStore (ref)
                if p5 then
                    default.Info("Successfully retrieved profile data for " .. Players.LocalPlayer.Name);
                    ClientStore:dispatch({
                        type = "LobbySetProfileData",
                        profileData = p5
                    });
                end;
            end);
        end;
    end);
    default2.Client:Get("OpenPlayerProfile"):Connect(function(p6) -- Line: 51
        -- upvalues: PlaceUtil (ref), ClientStore (ref), u4 (copy)
        if p6.profileData then
            if PlaceUtil.isLobbyServer() then
                ClientStore:dispatch({
                    type = "LobbySetCurrentlyViewingProfileData",
                    profileData = p6.profileData
                });
            end;
        else
            u4:openPlayerProfileLoading();
        end;
    end);
end;

function u1.openPlayerProfileFromData(p7, p8) -- Line: 64
    -- upvalues: PlaceUtil (copy), KnitClient (copy), Flamework (copy), PlayerProfileApp (copy), UILayers (copy)
    if PlaceUtil.isLobbyServer() then
        KnitClient.Controllers.PlayerProfileHighlightController:unmountPlayerInfoBillboard();
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "PlayerProfile",
        app = PlayerProfileApp,
        layer = UILayers.MAIN
    }, {
        AppId = "PlayerProfile",
        ProfileData = p8
    });
end;

function u1.openPlayerProfileLoading(p9) -- Line: 77
    -- upvalues: PlaceUtil (copy), KnitClient (copy), ClientStore (copy), Flamework (copy), PlayerProfileApp (copy), UILayers (copy)
    if PlaceUtil.isLobbyServer() then
        KnitClient.Controllers.PlayerProfileHighlightController:unmountPlayerInfoBillboard();
        ClientStore:dispatch({
            type = "LobbySetCurrentlyViewingProfileData",
            profileData = nil
        });
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "PlayerProfile",
        app = PlayerProfileApp,
        layer = UILayers.MAIN
    }, {
        AppId = "PlayerProfile"
    });
end;

function u1.openPlayerProfile(p10, p11) -- Line: 93
    -- upvalues: default2 (copy), ClientStore (copy), Flamework (copy)
    p10:openPlayerProfileLoading();
    default2.Client:Get("RequestProfileData"):CallServerAsync(p11):andThen(function(p12) -- Line: 96
        -- upvalues: ClientStore (ref), Flamework (ref)
        if p12 then
            ClientStore:dispatch({
                type = "LobbySetCurrentlyViewingProfileData",
                profileData = p12
            });

            return;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PlayerProfile");
    end);
end;

KnitClient.CreateController(u1.new());

return nil;