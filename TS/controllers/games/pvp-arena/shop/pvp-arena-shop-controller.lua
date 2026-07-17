-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local WatchPlayerCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local PvPArenaConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig;
local PvPArenaGameState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PvPArenaShopButton = RuntimeLib.import(script, script.Parent.Parent, "ui", "pvp-arena-shop-button").PvPArenaShopButton;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "PvpArenaShopController";
    end,

    __index = GameKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 25
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 29
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p3, { GameType.PVP_ARENA });
    p3.Name = "PvpArenaShopController";
end;

function u1.KnitStart(p4) -- Line: 33
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p4);
end;

function u1.onGameInit(u5) -- Line: 36
    -- upvalues: default (copy), PvPArenaGameState (copy), WatchPlayerCharacter (copy), Players (copy), KnitClient (copy), PvPArenaConfig (copy)
    default.Client:Get("PvPArenaGameStateChanged"):Connect(function(p6) -- Line: 37
        -- upvalues: PvPArenaGameState (ref), u5 (copy)
        if p6.gameState == PvPArenaGameState.INTERMISSION then
            u5:mountShopUI();
        end;

        if p6.gameState == PvPArenaGameState.IN_PROGRESS then
            u5:unMountShopUI();
        end;
    end);
    WatchPlayerCharacter(Players.LocalPlayer, function(p7, p8) -- Line: 45
        -- upvalues: KnitClient (ref), PvPArenaGameState (ref), u5 (copy)
        if KnitClient.Controllers.PvpArenaController:getGameState() == PvPArenaGameState.IN_PROGRESS then
            u5:mountShopUI();
        end;
    end);
    default.Client:Get("PvPArenaMatchupCompleted"):Connect(function(p9) -- Line: 50
        -- upvalues: Players (ref), PvPArenaConfig (ref), u5 (copy)
        if not p9.roundEnded and table.find(p9.winningTeamMembers, Players.LocalPlayer) ~= nil then
            task.delay(PvPArenaConfig.ROUND_END_DELAY - 0.1, function() -- Line: 55
                -- upvalues: u5 (ref)
                u5:mountShopUI();
            end);
        end;
    end);
end;

function u1.mountShopUI(p10) -- Line: 62
    -- upvalues: Flamework (copy), PvPArenaShopButton (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaShopUI") then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "PvPArenaShopUI",
        app = PvPArenaShopButton
    }, {});
end;

function u1.unMountShopUI(p11) -- Line: 71
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaShopUI") then
        return nil;
    end;

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.BEDWARS_ITEM_SHOP) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.BEDWARS_ITEM_SHOP);
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvPArenaShopUI");
end;

KnitClient.CreateController(u1.new());

return nil;