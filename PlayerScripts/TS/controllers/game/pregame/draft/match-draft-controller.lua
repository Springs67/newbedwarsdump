-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local BackgroundMusicPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "MatchDraftController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p6);
    p6.Name = "MatchDraftController";
    p6.draftMaid = u3.new();
    p6.draftInitialized = false;
end;

function u4.KnitStart(u7) -- Line: 40
    -- upvalues: KnitController (copy), KnitClient (copy), QueueMeta (copy), default (copy), ClientStore (copy)
    KnitController.KnitStart(u7);
    KnitClient.Controllers.MatchController:getQueueTypeAsync():andThen(function(p8) -- Line: 43
        -- upvalues: KnitClient (ref), QueueMeta (ref), default (ref), ClientStore (ref), u7 (copy)
        local _, v9 = KnitClient.Controllers.MatchController:getCustomMatchConfigAsync():await();
        local drafting = QueueMeta[p8].drafting;

        if drafting ~= nil then
            drafting = drafting.enabled;
        end;

        if drafting then
            drafting = v9 == nil;
        end;

        if drafting then
            default.Client:Get("MatchDraftDataUpdate"):Connect(function(p10) -- Line: 54
                -- upvalues: ClientStore (ref), u7 (ref)
                ClientStore:dispatch({
                    type = "SetDraft",
                    data = p10
                });

                if not u7.draftInitialized then
                    u7:initDraft();
                end;
            end);
            u7:requestDraftData();
        end;
    end);
end;

function u4.requestDraftData(u11, p12) -- Line: 68
    -- upvalues: default (copy), u4 (ref), KnitClient2 (copy), MatchState (copy), ClientStore (copy)
    local u13 = p12 == nil and 0 or p12;
    default.Client:Get("GetMatchDraftData"):CallServerAsync():andThen(function(p14) -- Line: 73
        -- upvalues: u11 (copy), u13 (ref), u4 (ref), KnitClient2 (ref), MatchState (ref), ClientStore (ref)
        if not u11.draftInitialized then
            u11:initDraft();
        end;

        if not p14.data then
            if u13 < u4.DRAFT_DATA_MAX_ATTEMPTS - 1 and KnitClient2.Controllers.MatchController:getMatchState() == MatchState.PRE then
                task.delay(u4.DRAFT_DATA_RETRY_SECONDS, function() -- Line: 79
                    -- upvalues: u11 (ref), u13 (ref)
                    u11:requestDraftData(u13 + 1);
                end);
            end;

            return nil;
        end;

        ClientStore:dispatch({
            type = "SetDraft",
            data = p14.data
        });
    end);
end;

function u4.initDraft(u15) -- Line: 92
    -- upvalues: KnitClient2 (copy), MatchState (copy), ClientStore (copy), ClientSyncEvents (copy)
    if u15.draftInitialized then
        return nil;
    end;

    u15.draftInitialized = true;
    u15.draftMaid:GiveTask(function() -- Line: 97
        -- upvalues: u15 (copy)
        u15.draftInitialized = false;
    end);

    if KnitClient2.Controllers.MatchController:getMatchState() == MatchState.PRE then
        u15:mountUI(KnitClient2.Controllers.MapController:getMapName());
    end;

    local u18 = ClientStore.changed:connect(function(p16, p17) -- Line: 103
        -- upvalues: MatchState (ref), u15 (copy)
        if p16.Game ~= p17.Game and p16.Game.matchState ~= MatchState.PRE then
            u15:unmountUI();
        end;
    end);
    u15.draftMaid:GiveTask(function() -- Line: 110
        -- upvalues: u18 (copy)
        u18:disconnect();
    end);
    u15.draftMaid:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p19) -- Line: 113
        -- upvalues: MatchState (ref), u15 (copy), KnitClient2 (ref)
        if p19.customMatch then
            return nil;
        end;

        if p19.matchState == MatchState.PRE then
            u15:mountUI(KnitClient2.Controllers.MapController:getMapName());

            return;
        end;

        u15:unmountUI();
    end));
end;

function u4.mountUI(p20, p21) -- Line: 124
    -- upvalues: GameSound (copy), KnitClient (copy), RandomUtil (copy), BackgroundMusicPriority (copy), Flamework (copy), BedwarsAppIds (copy)
    p20:unmountUI();
    KnitClient.Controllers.BackgroundMusicController:startMusic(RandomUtil.randomArraySelectN({ GameSound.MATCH_MUSIC_FORGE }, 1)[1], BackgroundMusicPriority.MENU);
    p20.draftMaid:GiveTask(function() -- Line: 128
        -- upvalues: KnitClient (ref)
        KnitClient.Controllers.BackgroundMusicController:stopMusic(2);
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.MATCH_DRAFT_APP, {
        MapId = p21
    });
end;

function u4.unmountUI(p22) -- Line: 135
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), SoundManager (copy), GameSound (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.MATCH_DRAFT_APP) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.MATCH_DRAFT_APP);
        SoundManager:playSound(GameSound.PVP_ARENA_ROUND_END);
        p22.draftMaid:DoCleaning();
    end;
end;

u4.DRAFT_DATA_MAX_ATTEMPTS = 5;
u4.DRAFT_DATA_RETRY_SECONDS = 1;
KnitClient.CreateController(u4.new());

return nil;