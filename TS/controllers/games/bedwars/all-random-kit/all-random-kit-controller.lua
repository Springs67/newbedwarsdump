-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local BackgroundMusicPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "AllRandomKitController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p5);
    p5.Name = "AllRandomKitController";
    p5.draftMaid = u2.new();
    p5.draftInitialized = false;
end;

function u3.KnitStart(u6) -- Line: 38
    -- upvalues: KnitController (copy), KnitClient (copy), QueueType (copy), default (copy)
    KnitController.KnitStart(u6);
    local v7, v8 = KnitClient.Controllers.MatchController:getQueueTypeAsync():await();

    if not v7 or v8 ~= QueueType.ALL_RANDOM_KIT_TO4 then
        return nil;
    end;

    local v9, v10 = KnitClient.Controllers.MatchController:getCustomMatchConfigAsync():await();

    if not v9 or v10 ~= nil then
        default.Client:Get("CustomMatchStarted"):Connect(function(p11) -- Line: 46
            -- upvalues: QueueType (ref), u6 (copy)
            local customMatchConfig = p11.customMatchConfig;

            if customMatchConfig ~= nil then
                customMatchConfig = customMatchConfig.queueType;
            end;

            if customMatchConfig ~= QueueType.ALL_RANDOM_KIT_TO4 then
                return nil;
            end;

            u6:setupConnections();
        end);

        return nil;
    end;

    u6:setupConnections();
end;

function u3.setupConnections(u12) -- Line: 60
    -- upvalues: KnitClient (copy), MatchState (copy), default (copy), ClientStore (copy)
    if KnitClient.Controllers.MatchController:getMatchState() ~= MatchState.PRE then
        return nil;
    end;

    default.Client:Get("ArkDraftDataUpdate"):Connect(function(p13) -- Line: 64
        -- upvalues: ClientStore (ref), u12 (copy)
        ClientStore:dispatch({
            type = "SetARKDraft",
            data = p13
        });
        u12:initDraft();
    end);
    default.Client:Get("GetARKDraftData"):CallServerAsync():andThen(function(p14) -- Line: 72
        -- upvalues: u12 (copy), ClientStore (ref)
        u12:initDraft();

        if not p14.data then
            return nil;
        end;

        ClientStore:dispatch({
            type = "SetARKDraft",
            data = p14.data
        });
    end);
end;

function u3.initDraft(u15) -- Line: 84
    -- upvalues: KnitClient (copy), MatchState (copy), ClientStore (copy), ClientSyncEvents (copy)
    if KnitClient.Controllers.MatchController:getMatchState() ~= MatchState.PRE then
        return nil;
    end;

    if u15.draftInitialized then
        return nil;
    end;

    u15.draftInitialized = true;
    u15.draftMaid:GiveTask(function() -- Line: 92
        -- upvalues: u15 (copy)
        u15.draftInitialized = false;
    end);
    local u18 = ClientStore.changed:connect(function(p16, p17) -- Line: 95
        -- upvalues: MatchState (ref), u15 (copy)
        if p16.Game ~= p17.Game and p16.Game.matchState ~= MatchState.PRE then
            u15:unmountUI();
        end;
    end);
    u15.draftMaid:GiveTask(function() -- Line: 102
        -- upvalues: u18 (copy)
        u18:disconnect();
    end);
    u15.draftMaid:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p19) -- Line: 105
        -- upvalues: MatchState (ref), u15 (copy)
        if p19.customMatch then
            return nil;
        end;

        if p19.matchState == MatchState.PRE then
            u15:mountUI();

            return;
        end;

        u15:unmountUI();
    end));
    u15:mountUI();
end;

function u3.mountUI(p20) -- Line: 117
    -- upvalues: GameSound (copy), KnitClient (copy), RandomUtil (copy), BackgroundMusicPriority (copy), Flamework (copy), BedwarsAppIds (copy)
    p20:unmountUI();
    KnitClient.Controllers.BackgroundMusicController:startMusic(RandomUtil.randomArraySelectN({ GameSound.MATCH_MUSIC_FORGE }, 1)[1], BackgroundMusicPriority.MENU);
    p20.draftMaid:GiveTask(function() -- Line: 121
        -- upvalues: KnitClient (ref)
        KnitClient.Controllers.BackgroundMusicController:stopMusic(2);
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.ALL_RANDOM_KIT_DRAFT_APP, {});
end;

function u3.unmountUI(p21) -- Line: 126
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), SoundManager (copy), GameSound (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.ALL_RANDOM_KIT_DRAFT_APP) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.ALL_RANDOM_KIT_DRAFT_APP);
        SoundManager:playSound(GameSound.PVP_ARENA_ROUND_END);
        p21.draftMaid:DoCleaning();
    end;
end;

KnitClient.CreateController(u3.new());

return nil;