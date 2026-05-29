local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController
local u11 = v1.import(script, script.Parent, "ui", "match-end-progress").MatchEndProgressWrapper
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "ProgressScreenController"
    end,
    ["__index"] = u10
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p15, 4)
    p15.Name = "ProgressScreenController"
    p15.matchEndMissionProgressData = {}
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u4
        [4] = u7
        [5] = u8
    --]]
    u10.KnitStart(u16)
    u9.Client:GetNamespace("BattlePass"):OnEvent("MatchExperienceEarned", function(p17) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.battlePassMatchExperienceEarned = p17.matchExperienceEarned
    end)
    u9.Client:OnEvent("ClanContributionProcessed", function(p18) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.clanContributionEarned = p18.amount
    end)
    u9.Client:OnEvent("BedCoinsProcessed", function(p19) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.bedCoinsEarnedDto = p19.earned
    end)
    u9.Client:OnEvent("PlayerLevelMatchXpFinalize", function(p20) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u16
        --]]
        local v21 = u4.Controllers.PlayerLevelController:getPlayerLevelTotalExperience()
        if v21 == 0 or (v21 ~= v21 or not v21) then
            return nil
        end
        u16.playerMatchExperienceEarned = {
            ["startingExperience"] = v21,
            ["totalExperienceEarned"] = p20.matchXpGained,
            ["reasons"] = p20.reasons
        }
    end)
    u9.Client:OnEvent("MatchEndMissionProgressEvent", function(p22) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.matchEndMissionProgressData = p22.progressedMissions
    end)
    u9.Client:OnEvent("ArmorTrimXpFinalized", function(p23) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.armorTrimXpEarned = {
            ["kit"] = p23.kit,
            ["equipped"] = p23.equipped,
            ["xpEarned"] = p23.xpEarned
        }
    end)
    u9.Client:OnEvent("KitStatsFinalized", function(p24) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u16
        --]]
        local v25
        if p24.kit == u7.NONE then
            v25 = nil
        else
            v25 = u8[p24.kit]
        end
        local v26
        if v25 == nil then
            v26 = false
        else
            v26 = not v25.disabled
        end
        if not v26 then
            return nil
        end
        u16.kitStatsDelta = p24.statsDelta
        u16.equippedKit = p24.kit
    end)
end
function u12.renderScreen(p27) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
    --]]
    if not p27.matchEndEvent then
        return nil
    end
    if not p27.tree then
        p27.tree = u6("MatchEndProgress", u11, {
            ["PlayerMatchExperienceEarned"] = p27.playerMatchExperienceEarned,
            ["BattlePassMatchExperienceEarned"] = p27.battlePassMatchExperienceEarned,
            ["WinningTeamId"] = p27.matchEndEvent.winningTeamId,
            ["RankChangeData"] = p27.rankChangeDto,
            ["BedCoinsEarned"] = p27.bedCoinsEarnedDto,
            ["ClanContributionEarned"] = p27.clanContributionEarned,
            ["MissionProgress"] = p27.matchEndMissionProgressData,
            ["ArmorTrimXpEarned"] = p27.armorTrimXpEarned,
            ["KitStatsDelta"] = p27.kitStatsDelta,
            ["EquippedKit"] = p27.equippedKit
        })
    end
end
function u12.unmountScreen(p28) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p28.tree then
        u5.unmount(p28.tree)
        p28.tree = nil
    end
end
v3.CreateController(u12.new())
return nil