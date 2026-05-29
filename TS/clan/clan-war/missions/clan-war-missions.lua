local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local v5 = {
    v3.BEDWARS_5v5,
    v3.BEDWARS_TO2,
    v3.BEDWARS_TO4,
    v3.BEDWARS_20v20,
    v3.BEDWARS_16v16,
    v3.BEDWARS_DUELS,
    v4.activeRankMeta.queueType,
    v3.BEDWARS_NB4,
    v3.BEDWARS_VOICE_CHAT,
    v3.HYPER_GEN_TO4,
    v3.ALL_SAME_KIT_TO4,
    v3.BEDWARS_OG_TO4
}
return {
    ["CLAN_WAR_MISSIONS"] = {
        {
            ["metricType"] = "BedBreaks",
            ["clanMembersRequired"] = 2,
            ["completionValue"] = 3,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "FinalKills",
            ["clanMembersRequired"] = 2,
            ["completionValue"] = 5,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "EntityKills",
            ["clanMembersRequired"] = 2,
            ["completionValue"] = 10,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "DamageDealt",
            ["clanMembersRequired"] = 2,
            ["completionValue"] = 1500,
            ["disallowInQueues"] = { v2.activeQueue }
        },
        {
            ["metricType"] = "StandardWins",
            ["clanMembersRequired"] = 2,
            ["completionValue"] = 5,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "SkyWarsWins",
            ["clanMembersRequired"] = 2,
            ["completionValue"] = 2,
            ["overrideDescription"] = "Win 2 SkyWars Doubles matches with a full team of clan members.",
            ["allowOnlyInQueues"] = { v3.SKYWARS_TO2 }
        },
        {
            ["metricType"] = "DoublesWins",
            ["clanMembersRequired"] = 2,
            ["completionValue"] = 3,
            ["overrideDescription"] = "Win 3 BedWars Doubles matches with a full team of clan members.",
            ["allowOnlyInQueues"] = { v3.BEDWARS_TO2 }
        },
        {
            ["metricType"] = "LuckyBlockWins",
            ["clanMembersRequired"] = 2,
            ["completionValue"] = 2,
            ["overrideDescription"] = "Win 2 Lucky Block Doubles matches with a full team of clan members.",
            ["allowOnlyInQueues"] = { v3.BEDWARS_LUCKY_BLOCK_TO2 }
        },
        {
            ["metricType"] = "BedBreaks",
            ["clanMembersRequired"] = 3,
            ["completionValue"] = 2,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "FinalKills",
            ["clanMembersRequired"] = 3,
            ["completionValue"] = 4,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "EntityKills",
            ["clanMembersRequired"] = 3,
            ["completionValue"] = 6,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "DamageDealt",
            ["clanMembersRequired"] = 3,
            ["completionValue"] = 1500,
            ["disallowInQueues"] = { v2.activeQueue }
        },
        {
            ["metricType"] = "StandardWins",
            ["clanMembersRequired"] = 3,
            ["completionValue"] = 3,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "SquadsWins",
            ["clanMembersRequired"] = 4,
            ["completionValue"] = 3,
            ["overrideDescription"] = "Win 3 Squads matches with a full team of clan members.",
            ["allowOnlyInQueues"] = { v3.BEDWARS_TO4 }
        },
        {
            ["metricType"] = "BedBreaks",
            ["clanMembersRequired"] = 4,
            ["completionValue"] = 2,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "FinalKills",
            ["clanMembersRequired"] = 4,
            ["completionValue"] = 3,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "EntityKills",
            ["clanMembersRequired"] = 4,
            ["completionValue"] = 5,
            ["allowOnlyInQueues"] = v5
        },
        {
            ["metricType"] = "DamageDealt",
            ["clanMembersRequired"] = 4,
            ["completionValue"] = 1200,
            ["disallowInQueues"] = { v2.activeQueue }
        }
    }
}