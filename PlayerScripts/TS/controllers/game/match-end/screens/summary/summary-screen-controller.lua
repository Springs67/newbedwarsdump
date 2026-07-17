-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MatchEndScreenController = RuntimeLib.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController;
local MatchEndSummaryAppWrapper = RuntimeLib.import(script, script.Parent, "match-end-summary").MatchEndSummaryAppWrapper;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "SummaryScreenController";
    end,

    __index = MatchEndScreenController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: MatchEndScreenController (copy)
    MatchEndScreenController.constructor(p4, 6);
    p4.Name = "SummaryScreenController";
    p4.matchEndMissionProgressData = {};
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: MatchEndScreenController (copy), default (copy), KnitClient2 (copy)
    MatchEndScreenController.KnitStart(u5);
    default.Client:OnEvent("MatchEndEvent", function(p6) -- Line: 32
        -- upvalues: u5 (copy), default (ref)
        u5.trackedStats = default.Client:Get("GetMatchStats"):CallServer();
    end);
    default.Client:GetNamespace("BattlePass"):OnEvent("MatchExperienceEarned", function(p7) -- Line: 36
        -- upvalues: u5 (copy)
        u5.battlePassMatchExperienceEarned = p7.matchExperienceEarned;
    end);
    default.Client:OnEvent("PlayerLevelMatchXpFinalize", function(p8) -- Line: 40
        -- upvalues: KnitClient2 (ref), u5 (copy)
        local v9 = KnitClient2.Controllers.PlayerLevelController:getPlayerLevelTotalExperience();

        if v9 == 0 or (v9 ~= v9 or not v9) then
            return nil;
        end;

        u5.playerMatchExperienceEarned = {
            startingExperience = v9,
            totalExperienceEarned = p8.matchXpGained,
            reasons = p8.reasons
        };
    end);
    default.Client:OnEvent("ClanContributionProcessed", function(p10) -- Line: 52
        -- upvalues: u5 (copy)
        u5.clanContributionEarned = p10.amount;
    end);
    default.Client:OnEvent("BedCoinsProcessed", function(p11) -- Line: 56
        -- upvalues: u5 (copy)
        u5.bedCoinsEarnedDto = p11.earned;
    end);
    default.Client:OnEvent("MatchEndMissionProgressEvent", function(p12) -- Line: 60
        -- upvalues: u5 (copy)
        u5.matchEndMissionProgressData = p12.progressedMissions;
    end);
    default.Client:OnEvent("PostGameStatCardsGenerated", function(p13) -- Line: 64
        -- upvalues: u5 (copy)
        u5.statCardsEvent = p13;
    end);
    default.Client:OnEvent("ArmorTrimXpFinalized", function(p14) -- Line: 68
        -- upvalues: u5 (copy)
        u5.armorTrimXpEarned = {
            kit = p14.kit,
            equipped = p14.equipped,
            xpEarned = p14.xpEarned
        };
    end);
    default.Client:OnEvent("KitStatsFinalized", function(p15) -- Line: 76
        -- upvalues: u5 (copy)
        u5.kitStatsDelta = p15.statsDelta;
        u5.equippedKit = p15.kit;
    end);
end;

function u2.renderScreen(p16) -- Line: 81
    -- upvalues: CreateRoduxApp (copy), MatchEndSummaryAppWrapper (copy)
    if not p16.matchEndEvent then
        return nil;
    end;

    if not p16.tree then
        local v17 = {
            PlayerMatchExperienceEarned = p16.playerMatchExperienceEarned,
            BattlePassMatchExperienceEarned = p16.battlePassMatchExperienceEarned,
            WinningTeamId = p16.matchEndEvent.winningTeamId,
            RankChangeData = p16.rankChangeDto,
            BedCoinsEarned = p16.bedCoinsEarnedDto,
            ClanContributionEarned = p16.clanContributionEarned,
            MissionProgress = p16.matchEndMissionProgressData,
            TrackedStats = p16.trackedStats,
            PreviousLeaderboardPosition = p16.matchEndEvent.previousLeaderboardPosition,
            NewLeaderboardPosition = p16.matchEndEvent.newLeaderboardPosition
        };
        local statCardsEvent = p16.statCardsEvent;

        if statCardsEvent ~= nil then
            statCardsEvent = statCardsEvent.cards;
        end;

        v17.PlayerHighlights = statCardsEvent;
        v17.ArmorTrimXpEarned = p16.armorTrimXpEarned;
        v17.KitStatsDelta = p16.kitStatsDelta;
        v17.EquippedKit = p16.equippedKit;
        p16.tree = CreateRoduxApp("MatchEndSummary", MatchEndSummaryAppWrapper, v17);
    end;
end;

function u2.unmountScreen(p18) -- Line: 110
end;

KnitClient.CreateController(u2.new());

return nil;