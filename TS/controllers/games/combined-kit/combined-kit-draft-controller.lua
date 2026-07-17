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
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local BackgroundMusicPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KIT_SELECTION_LENGTH = RuntimeLib.import(script, script.Parent, "ui", "combined-kit-draft-app").KIT_SELECTION_LENGTH;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "CombinedKitDraftController";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: GameKnitController (copy), GameType (copy), u3 (copy)
    GameKnitController.constructor(p6, { GameType.COMBINED_KIT });
    p6.Name = "CombinedKitDraftController";
    p6.draftMaid = u3.new();
    p6.draftInitialized = false;
end;

function u4.KnitStart(p7) -- Line: 42
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p7);
end;

function u4.onGameInit(p8) -- Line: 45
    p8:initDraft();
end;

u4.onKitSelect = RuntimeLib.async(function(p9, p10, p11) -- Line: 48
    -- upvalues: KIT_SELECTION_LENGTH (copy), BedwarsKit (copy), RuntimeLib (copy), default (copy)
    if not p9.draftKit then
        p9.draftKit = table.create(KIT_SELECTION_LENGTH, BedwarsKit.RANDOM);
    end;

    p9.draftKit[p11 + 1] = p10;
    local v12 = RuntimeLib.await(default.Client:Get("CombinedKitDraftSelectKit"):CallServerAsync({
        kit = p10,
        index = p11
    }));

    if v12 then
        p9.draftKit = v12;
    end;

    return p9.draftKit;
end);

function u4.initDraft(u13) -- Line: 62
    -- upvalues: KnitClient2 (copy), MatchState (copy), ClientStore (copy), ClientSyncEvents (copy)
    if u13.draftInitialized then
        return nil;
    end;

    u13.draftInitialized = true;
    u13.draftMaid:GiveTask(function() -- Line: 67
        -- upvalues: u13 (copy)
        u13.draftInitialized = false;
    end);

    if KnitClient2.Controllers.MatchController:getMatchState() == MatchState.PRE then
        u13:mountUI();
    end;

    local u16 = ClientStore.changed:connect(function(p14, p15) -- Line: 73
        -- upvalues: MatchState (ref), u13 (copy)
        if p14.Game ~= p15.Game and p14.Game.matchState ~= MatchState.PRE then
            u13:unmountUI(true);
        end;
    end);
    u13.draftMaid:GiveTask(function() -- Line: 80
        -- upvalues: u16 (copy)
        u16:disconnect();
    end);
    u13.draftMaid:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p17) -- Line: 83
        -- upvalues: MatchState (ref), u13 (copy)
        if p17.customMatch then
            return nil;
        end;

        if p17.matchState == MatchState.PRE then
            u13:mountUI();

            return;
        end;

        u13:unmountUI(true);
    end));
end;

function u4.mountUI(p18) -- Line: 94
    -- upvalues: GameSound (copy), KnitClient (copy), RandomUtil (copy), BackgroundMusicPriority (copy), Flamework (copy), BedwarsAppIds (copy)
    p18:unmountUI();
    KnitClient.Controllers.BackgroundMusicController:startMusic(RandomUtil.randomArraySelectN({ GameSound.MATCH_MUSIC_FORGE }, 1)[1], BackgroundMusicPriority.MENU);
    p18.draftMaid:GiveTask(function() -- Line: 98
        -- upvalues: KnitClient (ref)
        KnitClient.Controllers.BackgroundMusicController:stopMusic(2);
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.COMBINED_KIT_DRAFT_APP, {
        SelectedKits = p18.draftKit
    });
end;

function u4.unmountUI(p19, p20) -- Line: 105
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), SoundManager (copy), GameSound (copy)
    if p20 == nil then
        p20 = false;
    end;

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.COMBINED_KIT_DRAFT_APP) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.COMBINED_KIT_DRAFT_APP);

        if p20 then
            SoundManager:playSound(GameSound.PVP_ARENA_ROUND_END);
        end;

        p19.draftMaid:DoCleaning();
    end;
end;

KnitClient.CreateController(u4.new());

return nil;