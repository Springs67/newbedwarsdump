-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "PregameVotingController";
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
    p3.Name = "PregameVotingController";
end;

function u1.KnitStart(u4) -- Line: 31
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy), ClientSyncEvents (copy), MatchState (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("PregameVotingStarted"):Connect(function(u5) -- Line: 33
        -- upvalues: ClientStore (ref), u4 (copy)
        ClientStore:dispatch({
            type = "BedwarsSetPregameVoteState",
            voteState = u5.snapshot
        });
        ClientStore:dispatch({
            type = "GameSetSome",
            data = {
                pregameVotingEnabled = true
            }
        });
        task.delay(2, function() -- Line: 44
            -- upvalues: u4 (ref), u5 (copy)
            u4:tryMount(u5.voteEndTime);
        end);
    end);
    default.Client:Get("PregameVoteSnapshotUpdate"):Connect(function(p6) -- Line: 48
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "BedwarsSetPregameVoteState",
            voteState = p6.snapshot
        });
    end);
    default.Client:Get("PregameVoteEnded"):Connect(function(p7) -- Line: 54
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "SetPregameVoteWon",
            winningVotingOption = p7.pregameVotingSelection,
            winningVoterIndex = p7.winningVoterIndex
        });
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p8) -- Line: 61
        -- upvalues: MatchState (ref)
        local _ = p8.matchState == MatchState.PRE;
    end);
end;

function u1.voteForPregameOption(p9, p10) -- Line: 66
    -- upvalues: SoundManager (copy), GameSound (copy), default (copy)
    SoundManager:playSound(GameSound.UI_CLICK_2);
    default.Client:Get("CastPregameVote"):SendToServer({
        votingOptionIndex = p10
    });
end;

function u1.tryMount(p11, p12) -- Line: 72
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), ClientStore (copy), MatchState (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.PREGAME_VOTING) then
        return nil;
    end;

    if ClientStore:getState().Game.matchState ~= MatchState.PRE then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.PREGAME_VOTING, {
        VoteStartTime = os.time(),
        VoteEndTime = p12
    });
end;

KnitClient.CreateController(u1.new());

return nil;