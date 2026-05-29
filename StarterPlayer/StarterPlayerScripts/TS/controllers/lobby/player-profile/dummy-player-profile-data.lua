local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, script.Parent.Parent.Parent, "global", "match-history", "ui", "dummy-match-history").DummyMatchHistory
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stats", "queue-stats-util").QueueStatsUtil
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "user-input", "user-input-type").UserInputType
local v16 = {}
for v17, v18 in v14.makeStarterBedwarsQueueStats() do
    v16[v17] = v18
end
v16.firstPlayTime = 0
v16.lastPlayTime = 0
v16.wins = 18
v16.losses = 72
v16.ties = 0
v16.earlyLeaves = 0
v16.matches = 23
v16.kills = 56532
v16.deaths = 343
v16.currentWinStreak = 3
v16.highestWinStreak = 7
v16.bedBreaks = 3
v16.finalKills = 5
v16.damage = 0
v16.healing = 0
v16.totalPlayTime = 0
v16.damageTaken = 0
v16.knockIntoVoid = 0
v16.blockBreaks = 0
v16.blocksPlaced = 0
v16.projectilesUsed = 0
v16.projectileDamage = 0
v16.arrowDamage = 0
v16.ironCollected = 0
v16.diamondCollected = 0
v16.emeraldCollected = 0
v16.diamondGuardianKills = 0
v16.titanKills = 0
v16.telepearlsUsed = 0
v16.telepearlBlocksTravelled = 0
v16.enchants = 0
v16.multiKills = 0
v16.highestKillStreak = 0
v16.highestMultiKillChain = 0
local u19 = {}
for v20, v21 in v14.makeStarterBedwarsQueueStats() do
    u19[v20] = v21
end
u19.firstPlayTime = 0
u19.lastPlayTime = 0
u19.wins = 162
u19.losses = 72
u19.ties = 0
u19.earlyLeaves = 0
u19.matches = 23
u19.kills = 5632
u19.deaths = 343
u19.currentWinStreak = 32
u19.highestWinStreak = 734
u19.bedBreaks = 333
u19.finalKills = 533
u19.damage = 0
u19.healing = 0
u19.totalPlayTime = 123
u19.damageTaken = 0
u19.knockIntoVoid = 0
u19.blockBreaks = 0
u19.blocksPlaced = 0
u19.projectilesUsed = 0
u19.projectileDamage = 0
u19.arrowDamage = 2
u19.ironCollected = 1
u19.diamondCollected = 0
u19.emeraldCollected = 0
u19.diamondGuardianKills = 0
u19.titanKills = 0
u19.telepearlsUsed = 0
u19.telepearlBlocksTravelled = 0
u19.enchants = 0
u19.multiKills = 0
u19.highestKillStreak = 0
u19.highestMultiKillChain = 0
local v22 = {
    v6.AERY,
    v6.AXOLOTL,
    v6.BATTERY,
    v6.ANGEL,
    v6.BEAST,
    v6.BEEKEEPER,
    v6.GRIM_REAPER,
    v6.HATTER,
    v6.ICE_QUEEN
}
local v23 = v2.values(u5)
local v24 = table.create(#v23)
local function v32(p25) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u19
    --]]
    if p25 == u5.SKYWARS_TO4 or p25 == u5.SKYWARS_TO2 then
        local v26 = {}
        for v27, v28 in u19 do
            v26[v27] = v28
        end
        v26.extra = {
            ["skywars"] = {
                ["chestsOpened"] = 12
            }
        }
        return { p25, v26 }
    end
    if p25 ~= u5.PVP_ARENA and p25 ~= u5.PVP_ARENA_SOLO then
        return { p25, u19 }
    end
    local v29 = {}
    for v30, v31 in u19 do
        v29[v30] = v31
    end
    v29.extra = {
        ["pvpArena"] = {
            ["goldEarned"] = 4500
        }
    }
    return { p25, v29 }
end
local v33 = {
    ["rankPoints"] = 3000,
    ["matchesPlayed"] = 10,
    ["leaderboardPosition"] = 100
}
for v34, v35 in v23 do
    v24[v34] = v32(v35, v34 - 1, v23)
end
local v36 = os.date("%x")
local v37 = {
    ["userId"] = 21406719,
    ["name"] = "Username",
    ["region"] = "US",
    ["level"] = 10,
    ["platform"] = v15.GAMEPAD,
    ["equipped"] = {
        ["bedSkin"] = nil,
        ["activeKit"] = v6.NONE,
        ["selectedTitle"] = v12.SUPER,
        ["selectedBedBreakEffect"] = v9.NONE,
        ["selectedKillEffect"] = v11.NONE,
        ["selectedWinEffect"] = v13.NONE,
        ["featuredBadges"] = { v8.NONE }
    },
    ["locker"] = {
        ["emotes"] = {
            v10.ROCK_OUT,
            v10.BANANA_BARBARIAN,
            v10.BUILDER_HELP_PLS,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT,
            v10.CLETUS_CARROT
        },
        ["titles"] = {},
        ["lobbyGadgets"] = {},
        ["winEffects"] = {},
        ["breakBedEffect"] = {},
        ["killEffects"] = {},
        ["bedSkins"] = {},
        ["itemSkins"] = {}
    },
    ["clan"] = {
        ["id"] = "121",
        ["name"] = "Clan Name",
        ["tag"] = "TEST",
        ["image"] = v7.CLAN
    },
    ["globalStats"] = v16,
    ["queues"] = v2.fromEntries(v24),
    ["rankStats"] = v33,
    ["kits"] = v22,
    ["favoriteKitData"] = {
        [v6.AXOLOTL] = 10,
        [v6.BATTERY] = 200,
        [v6.ANGEL] = 1,
        [v6.CARD] = 1,
        [v6.LYLA] = 1,
        [v6.MIMIC] = 1
    },
    ["matchHistory"] = v3
}
local v38 = {
    [v4.MULTIKILLCHAIN_1] = {
        ["achieved"] = true,
        ["rewardsClaimed"] = false,
        ["dateAchieved"] = v36
    },
    [v4.MULTIKILLCHAIN_2] = {
        ["achieved"] = true,
        ["dateAchieved"] = v36
    },
    [v4.MULTIKILLCHAIN_3] = {
        ["achieved"] = true,
        ["rewardsClaimed"] = true,
        ["dateAchieved"] = v36
    },
    [v4.BEDWARS_NO_ARMOR] = {
        ["achieved"] = true,
        ["dateAchieved"] = v36
    },
    [v4.BEDWARS_NO_DAMAGE] = {
        ["achieved"] = true,
        ["dateAchieved"] = v36
    },
    [v4.BEDWARS_NO_DEATHS] = {
        ["achieved"] = true,
        ["dateAchieved"] = v36
    },
    [v4.BEDWARS_NO_SWORD] = {
        ["achieved"] = true,
        ["dateAchieved"] = v36
    },
    [v4.KIT_VARIETY_1] = {
        ["achieved"] = true,
        ["dateAchieved"] = v36
    },
    [v4.KIT_VARIETY_2] = {
        ["achieved"] = true,
        ["dateAchieved"] = v36
    },
    [v4.KIT_VARIETY_3] = {
        ["achieved"] = true,
        ["dateAchieved"] = v36
    },
    [v4.DAMAGE_LEGEND_1] = {
        ["achieved"] = false,
        ["dateAchieved"] = v36
    },
    [v4.DAMAGE_LEGEND_2] = {
        ["achieved"] = false,
        ["dateAchieved"] = v36
    },
    [v4.DAMAGE_LEGEND_3] = {
        ["achieved"] = false
    }
}
v37.achievements = v38
v37.achievementProgressValues = {
    [v4.MULTIKILLCHAIN_1] = 10,
    [v4.MULTIKILLCHAIN_2] = 10,
    [v4.MULTIKILLCHAIN_3] = 10,
    [v4.KIT_VARIETY_1] = 10
}
v37.honor = {
    ["honorPointsReceived"] = 250,
    ["honorPointsGiven"] = 500
}
return {
    ["DummyProfileData"] = v37
}