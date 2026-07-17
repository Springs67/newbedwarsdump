-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local KitContractRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MatchEndScreenController = RuntimeLib.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController;
local MatchEndProgressWrapper = RuntimeLib.import(script, script.Parent, "ui", "match-end-progress").MatchEndProgressWrapper;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "ProgressScreenController";
    end,

    __index = MatchEndScreenController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: MatchEndScreenController (copy)
    MatchEndScreenController.constructor(p5, 4);
    p5.Name = "ProgressScreenController";
    p5.matchEndMissionProgressData = {};
end;

function u3.KnitStart(u6) -- Line: 32
    -- upvalues: MatchEndScreenController (copy), default (copy), KnitClient2 (copy), BedwarsKit (copy), KitContractRewards (copy)
    MatchEndScreenController.KnitStart(u6);
    default.Client:GetNamespace("BattlePass"):OnEvent("MatchExperienceEarned", function(p7) -- Line: 35
        -- upvalues: u6 (copy)
        u6.battlePassMatchExperienceEarned = p7.matchExperienceEarned;
    end);
    default.Client:OnEvent("ClanContributionProcessed", function(p8) -- Line: 39
        -- upvalues: u6 (copy)
        u6.clanContributionEarned = p8.amount;
    end);
    default.Client:OnEvent("BedCoinsProcessed", function(p9) -- Line: 43
        -- upvalues: u6 (copy)
        u6.bedCoinsEarnedDto = p9.earned;
    end);
    default.Client:OnEvent("PlayerLevelMatchXpFinalize", function(p10) -- Line: 47
        -- upvalues: KnitClient2 (ref), u6 (copy)
        local v11 = KnitClient2.Controllers.PlayerLevelController:getPlayerLevelTotalExperience();

        if v11 == 0 or (v11 ~= v11 or not v11) then
            return nil;
        end;

        u6.playerMatchExperienceEarned = {
            startingExperience = v11,
            totalExperienceEarned = p10.matchXpGained,
            reasons = p10.reasons
        };
    end);
    default.Client:OnEvent("MatchEndMissionProgressEvent", function(p12) -- Line: 59
        -- upvalues: u6 (copy)
        u6.matchEndMissionProgressData = p12.progressedMissions;
    end);
    default.Client:OnEvent("ArmorTrimXpFinalized", function(p13) -- Line: 63
        -- upvalues: u6 (copy)
        u6.armorTrimXpEarned = {
            kit = p13.kit,
            equipped = p13.equipped,
            xpEarned = p13.xpEarned
        };
    end);
    default.Client:OnEvent("KitStatsFinalized", function(p14) -- Line: 71
        -- upvalues: BedwarsKit (ref), KitContractRewards (ref), u6 (copy)
        local v15;

        if p14.kit == BedwarsKit.NONE then
            v15 = nil;
        else
            v15 = KitContractRewards[p14.kit];
        end;

        local v16;

        if v15 == nil then
            v16 = false;
        else
            v16 = not v15.disabled;
        end;

        if not v16 then
            return nil;
        end;

        u6.kitStatsDelta = p14.statsDelta;
        u6.equippedKit = p14.kit;
    end);
end;

function u3.renderScreen(p17) -- Line: 81
    -- upvalues: CreateRoduxApp (copy), MatchEndProgressWrapper (copy)
    if not p17.matchEndEvent then
        return nil;
    end;

    if not p17.tree then
        p17.tree = CreateRoduxApp("MatchEndProgress", MatchEndProgressWrapper, {
            PlayerMatchExperienceEarned = p17.playerMatchExperienceEarned,
            BattlePassMatchExperienceEarned = p17.battlePassMatchExperienceEarned,
            WinningTeamId = p17.matchEndEvent.winningTeamId,
            RankChangeData = p17.rankChangeDto,
            BedCoinsEarned = p17.bedCoinsEarnedDto,
            ClanContributionEarned = p17.clanContributionEarned,
            MissionProgress = p17.matchEndMissionProgressData,
            ArmorTrimXpEarned = p17.armorTrimXpEarned,
            KitStatsDelta = p17.kitStatsDelta,
            EquippedKit = p17.equippedKit
        });
    end;
end;

function u3.unmountScreen(p18) -- Line: 100
    -- upvalues: u2 (copy)
    if p18.tree then
        u2.unmount(p18.tree);
        p18.tree = nil;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;