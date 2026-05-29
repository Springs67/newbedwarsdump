local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController
local u8 = v1.import(script, script.Parent, "match-end-summary").MatchEndSummaryAppWrapper
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "SummaryScreenController"
    end,
    ["__index"] = u7
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p12, 6)
    p12.Name = "SummaryScreenController"
    p12.matchEndMissionProgressData = {}
end
function u9.KnitStart(u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u4
    --]]
    u7.KnitStart(u13)
    u6.Client:OnEvent("MatchEndEvent", function(_) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u6
        --]]
        u13.trackedStats = u6.Client:Get("GetMatchStats"):CallServer()
    end)
    u6.Client:GetNamespace("BattlePass"):OnEvent("MatchExperienceEarned", function(p14) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.battlePassMatchExperienceEarned = p14.matchExperienceEarned
    end)
    u6.Client:OnEvent("PlayerLevelMatchXpFinalize", function(p15) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
        --]]
        local v16 = u4.Controllers.PlayerLevelController:getPlayerLevelTotalExperience()
        if v16 == 0 or (v16 ~= v16 or not v16) then
            return nil
        end
        u13.playerMatchExperienceEarned = {
            ["startingExperience"] = v16,
            ["totalExperienceEarned"] = p15.matchXpGained,
            ["reasons"] = p15.reasons
        }
    end)
    u6.Client:OnEvent("ClanContributionProcessed", function(p17) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.clanContributionEarned = p17.amount
    end)
    u6.Client:OnEvent("BedCoinsProcessed", function(p18) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.bedCoinsEarnedDto = p18.earned
    end)
    u6.Client:OnEvent("MatchEndMissionProgressEvent", function(p19) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.matchEndMissionProgressData = p19.progressedMissions
    end)
    u6.Client:OnEvent("PostGameStatCardsGenerated", function(p20) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.statCardsEvent = p20
    end)
    u6.Client:OnEvent("ArmorTrimXpFinalized", function(p21) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.armorTrimXpEarned = {
            ["kit"] = p21.kit,
            ["equipped"] = p21.equipped,
            ["xpEarned"] = p21.xpEarned
        }
    end)
    u6.Client:OnEvent("KitStatsFinalized", function(p22) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.kitStatsDelta = p22.statsDelta
        u13.equippedKit = p22.kit
    end)
end
function u9.renderScreen(p23) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
    --]]
    if not p23.matchEndEvent then
        return nil
    end
    if not p23.tree then
        local v24 = {
            ["PlayerMatchExperienceEarned"] = p23.playerMatchExperienceEarned,
            ["BattlePassMatchExperienceEarned"] = p23.battlePassMatchExperienceEarned,
            ["WinningTeamId"] = p23.matchEndEvent.winningTeamId,
            ["RankChangeData"] = p23.rankChangeDto,
            ["BedCoinsEarned"] = p23.bedCoinsEarnedDto,
            ["ClanContributionEarned"] = p23.clanContributionEarned,
            ["MissionProgress"] = p23.matchEndMissionProgressData,
            ["TrackedStats"] = p23.trackedStats,
            ["PreviousLeaderboardPosition"] = p23.matchEndEvent.previousLeaderboardPosition,
            ["NewLeaderboardPosition"] = p23.matchEndEvent.newLeaderboardPosition
        }
        local v25 = p23.statCardsEvent
        if v25 ~= nil then
            v25 = v25.cards
        end
        v24.PlayerHighlights = v25
        v24.ArmorTrimXpEarned = p23.armorTrimXpEarned
        v24.KitStatsDelta = p23.kitStatsDelta
        v24.EquippedKit = p23.equippedKit
        p23.tree = u5("MatchEndSummary", u8, v24)
    end
end
function u9.unmountScreen(_) --[[ Line: 110 ]] end
v3.CreateController(u9.new())
return nil