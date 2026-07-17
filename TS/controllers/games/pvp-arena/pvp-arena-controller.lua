-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local PvPArenaConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig;
local PvPArenaGameState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PvPArenaIntermissionUI = RuntimeLib.import(script, script.Parent, "ui", "pvp-arena-intermission-ui").PvPArenaIntermissionUI;
local PvPArenaRoundUI = RuntimeLib.import(script, script.Parent, "ui", "pvp-arena-round-ui").PvPArenaRoundUI;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "PvpArenaController";
    end,

    __index = GameKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 32
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 36
    -- upvalues: GameKnitController (copy), GameType (copy), PvPArenaGameState (copy)
    GameKnitController.constructor(p4, { GameType.PVP_ARENA });
    p4.Name = "PvpArenaController";
    p4.gameState = PvPArenaGameState.PRE;
end;

function u2.onGameInit(u5) -- Line: 41
    -- upvalues: ClientSyncEvents (copy), PvPArenaGameState (copy), MatchState (copy), KnitClient2 (copy), ClientStore (copy), default (copy), PvPArenaConfig (copy), SoundManager (copy), GameSound (copy), TweenService (copy)
    ClientSyncEvents.CanUseLocalAbility:connect(function(p6) -- Line: 42
        -- upvalues: u5 (copy), PvPArenaGameState (ref)
        if u5.gameState ~= PvPArenaGameState.IN_PROGRESS then
            p6:setCancelled(true);
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p7) -- Line: 47
        -- upvalues: u5 (copy), PvPArenaGameState (ref)
        if u5.gameState ~= PvPArenaGameState.IN_PROGRESS then
            p7:setCancelled(true);
        end;
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p8) -- Line: 52
        -- upvalues: MatchState (ref), KnitClient2 (ref), ClientStore (ref)
        if p8.matchState == MatchState.RUNNING then
            local function _(p9) -- Line: 55
                -- upvalues: ClientStore (ref)
                ClientStore:dispatch({
                    type = "AddPvPArenaTeamHealth",
                    health = 100,
                    team = p9
                });
            end;

            for i, v in KnitClient2.Controllers.TeamController:getTeams() do
                local _ = i - 1;
                ClientStore:dispatch({
                    type = "AddPvPArenaTeamHealth",
                    health = 100,
                    team = v
                });
            end;
        end;
    end);
    default.Client:Get("PvPArenaGameStateChanged"):Connect(function(u10) -- Line: 67
        -- upvalues: PvPArenaGameState (ref), PvPArenaConfig (ref), u5 (copy), SoundManager (ref), GameSound (ref), TweenService (ref)
        if u10.gameState == PvPArenaGameState.IN_PROGRESS then
            task.delay(PvPArenaConfig.GRACE_PERIOD_TIME, function() -- Line: 69
                -- upvalues: u5 (ref), u10 (copy)
                u5.gameState = u10.gameState;
            end);
        else
            u5.gameState = u10.gameState;
        end;

        if u10.gameState == PvPArenaGameState.INTERMISSION then
            u5:mountIntermissionUI();
            u5:mountRoundUI();
            local u11 = SoundManager:playSound(GameSound.PVP_ARENA_INTERMISSION_TRACK):getInstance();
            local roundNumber = u10.roundNumber;
            task.delay(PvPArenaConfig.getIntermissionRoundTime(PvPArenaConfig.isAugmentRound(roundNumber == nil and 0 or roundNumber)), function() -- Line: 87
                -- upvalues: u11 (copy), TweenService (ref)
                if u11 then
                    local v12 = TweenService:Create(u11, TweenInfo.new(3), {
                        Volume = 0
                    });
                    v12:Play();
                    v12.Completed:Once(function() -- Line: 93
                        -- upvalues: u11 (ref)
                        u11:Stop();
                    end);
                end;
            end);
        end;

        local _ = u10.gameState == PvPArenaGameState.IN_PROGRESS;

        if u10.gameState == PvPArenaGameState.POST then
            u5:unMountIntermissionUI();
            u5:unMountRoundUI();
        end;
    end);
    default.Client:Get("PvPArenaTeamHealthChanged"):Connect(function(p13) -- Line: 106
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "SetPvPArenaTeamHealth",
            team = p13.team,
            health = p13.health
        });
    end);
end;

function u2.getGameState(p14) -- Line: 114
    return p14.gameState;
end;

function u2.mountIntermissionUI(p15) -- Line: 117
    -- upvalues: Flamework (copy), PvPArenaIntermissionUI (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaIntermissionUI") then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "PvPArenaIntermissionUI",
        app = PvPArenaIntermissionUI
    }, {});
end;

function u2.unMountIntermissionUI(p16) -- Line: 126
    -- upvalues: Flamework (copy)
    if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaIntermissionUI") then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvPArenaIntermissionUI");
end;

function u2.mountRoundUI(p17) -- Line: 132
    -- upvalues: Flamework (copy), PvPArenaRoundUI (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaRoundUI") then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "PvPArenaRoundUI",
        app = PvPArenaRoundUI
    }, {});
end;

function u2.unMountRoundUI(p18) -- Line: 141
    -- upvalues: Flamework (copy)
    if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaRoundUI") then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvPArenaRoundUI");
end;

KnitClient.CreateController(u2.new());

return nil;