-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local DummyMatchHistory = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "match-history", "ui", "dummy-match-history").DummyMatchHistory;
local AchievementId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local QueueStatsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stats", "queue-stats-util").QueueStatsUtil;
local UserInputType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "user-input", "user-input-type").UserInputType;
local v2 = {};

for i, v in QueueStatsUtil.makeStarterBedwarsQueueStats() do
    v2[i] = v;
end;

v2.firstPlayTime = 0;
v2.lastPlayTime = 0;
v2.wins = 18;
v2.losses = 72;
v2.ties = 0;
v2.earlyLeaves = 0;
v2.matches = 23;
v2.kills = 56532;
v2.deaths = 343;
v2.currentWinStreak = 3;
v2.highestWinStreak = 7;
v2.bedBreaks = 3;
v2.finalKills = 5;
v2.damage = 0;
v2.healing = 0;
v2.totalPlayTime = 0;
v2.damageTaken = 0;
v2.knockIntoVoid = 0;
v2.blockBreaks = 0;
v2.blocksPlaced = 0;
v2.projectilesUsed = 0;
v2.projectileDamage = 0;
v2.arrowDamage = 0;
v2.ironCollected = 0;
v2.diamondCollected = 0;
v2.emeraldCollected = 0;
v2.diamondGuardianKills = 0;
v2.titanKills = 0;
v2.telepearlsUsed = 0;
v2.telepearlBlocksTravelled = 0;
v2.enchants = 0;
v2.multiKills = 0;
v2.highestKillStreak = 0;
v2.highestMultiKillChain = 0;
local u3 = {};

for i, v in QueueStatsUtil.makeStarterBedwarsQueueStats() do
    u3[i] = v;
end;

u3.firstPlayTime = 0;
u3.lastPlayTime = 0;
u3.wins = 162;
u3.losses = 72;
u3.ties = 0;
u3.earlyLeaves = 0;
u3.matches = 23;
u3.kills = 5632;
u3.deaths = 343;
u3.currentWinStreak = 32;
u3.highestWinStreak = 734;
u3.bedBreaks = 333;
u3.finalKills = 533;
u3.damage = 0;
u3.healing = 0;
u3.totalPlayTime = 123;
u3.damageTaken = 0;
u3.knockIntoVoid = 0;
u3.blockBreaks = 0;
u3.blocksPlaced = 0;
u3.projectilesUsed = 0;
u3.projectileDamage = 0;
u3.arrowDamage = 2;
u3.ironCollected = 1;
u3.diamondCollected = 0;
u3.emeraldCollected = 0;
u3.diamondGuardianKills = 0;
u3.titanKills = 0;
u3.telepearlsUsed = 0;
u3.telepearlBlocksTravelled = 0;
u3.enchants = 0;
u3.multiKills = 0;
u3.highestKillStreak = 0;
u3.highestMultiKillChain = 0;
local v4 = {
    BedwarsKit.AERY,
    BedwarsKit.AXOLOTL,
    BedwarsKit.BATTERY,
    BedwarsKit.ANGEL,
    BedwarsKit.BEAST,
    BedwarsKit.BEEKEEPER,
    BedwarsKit.GRIM_REAPER,
    BedwarsKit.HATTER,
    BedwarsKit.ICE_QUEEN
};
local v5 = v1.values(QueueType);
local v6 = table.create(#v5);

local function v10(p7) -- Line: 102
    -- upvalues: QueueType (copy), u3 (copy)
    if p7 == QueueType.SKYWARS_TO4 or p7 == QueueType.SKYWARS_TO2 then
        local v8 = {};

        for i, v in u3 do
            v8[i] = v;
        end;

        v8.extra = {
            skywars = {
                chestsOpened = 12
            }
        };

        return { p7, v8 };
    end;

    if p7 ~= QueueType.PVP_ARENA and p7 ~= QueueType.PVP_ARENA_SOLO then
        return { p7, u3 };
    end;

    local v9 = {};

    for i, v in u3 do
        v9[i] = v;
    end;

    v9.extra = {
        pvpArena = {
            goldEarned = 4500
        }
    };

    return { p7, v9 };
end;

local v11 = {
    rankPoints = 3000,
    matchesPlayed = 10,
    leaderboardPosition = 100
};

for i, v in v5 do
    v6[i] = v10(v, i - 1, v5);
end;

local v12 = os.date("%x");

return {
    DummyProfileData = {
        userId = 21406719,
        name = "Username",
        region = "US",
        level = 10,
        platform = UserInputType.GAMEPAD,
        equipped = {
            bedSkin = nil,
            activeKit = BedwarsKit.NONE,
            selectedTitle = TitleType.SUPER,
            selectedBedBreakEffect = BedBreakEffectType.NONE,
            selectedKillEffect = KillEffectType.NONE,
            selectedWinEffect = WinEffectType.NONE,
            featuredBadges = { BadgeType.NONE }
        },
        locker = {
            emotes = {
                EmoteType.ROCK_OUT,
                EmoteType.BANANA_BARBARIAN,
                EmoteType.BUILDER_HELP_PLS,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT
            },
            titles = {},
            lobbyGadgets = {},
            winEffects = {},
            breakBedEffect = {},
            killEffects = {},
            bedSkins = {},
            itemSkins = {}
        },
        clan = {
            id = "121",
            name = "Clan Name",
            tag = "TEST",
            image = BedwarsImageId.CLAN
        },
        globalStats = v2,
        queues = v1.fromEntries(v6),
        rankStats = v11,
        kits = v4,
        favoriteKitData = {
            [BedwarsKit.AXOLOTL] = 10,
            [BedwarsKit.BATTERY] = 200,
            [BedwarsKit.ANGEL] = 1,
            [BedwarsKit.CARD] = 1,
            [BedwarsKit.LYLA] = 1,
            [BedwarsKit.MIMIC] = 1
        },
        matchHistory = DummyMatchHistory,
        achievements = {
            [AchievementId.MULTIKILLCHAIN_1] = {
                achieved = true,
                rewardsClaimed = false,
                dateAchieved = v12
            },
            [AchievementId.MULTIKILLCHAIN_2] = {
                achieved = true,
                dateAchieved = v12
            },
            [AchievementId.MULTIKILLCHAIN_3] = {
                achieved = true,
                rewardsClaimed = true,
                dateAchieved = v12
            },
            [AchievementId.BEDWARS_NO_ARMOR] = {
                achieved = true,
                dateAchieved = v12
            },
            [AchievementId.BEDWARS_NO_DAMAGE] = {
                achieved = true,
                dateAchieved = v12
            },
            [AchievementId.BEDWARS_NO_DEATHS] = {
                achieved = true,
                dateAchieved = v12
            },
            [AchievementId.BEDWARS_NO_SWORD] = {
                achieved = true,
                dateAchieved = v12
            },
            [AchievementId.KIT_VARIETY_1] = {
                achieved = true,
                dateAchieved = v12
            },
            [AchievementId.KIT_VARIETY_2] = {
                achieved = true,
                dateAchieved = v12
            },
            [AchievementId.KIT_VARIETY_3] = {
                achieved = true,
                dateAchieved = v12
            },
            [AchievementId.DAMAGE_LEGEND_1] = {
                achieved = false,
                dateAchieved = v12
            },
            [AchievementId.DAMAGE_LEGEND_2] = {
                achieved = false,
                dateAchieved = v12
            },
            [AchievementId.DAMAGE_LEGEND_3] = {
                achieved = false
            }
        },
        achievementProgressValues = {
            [AchievementId.MULTIKILLCHAIN_1] = 10,
            [AchievementId.MULTIKILLCHAIN_2] = 10,
            [AchievementId.MULTIKILLCHAIN_3] = 10,
            [AchievementId.KIT_VARIETY_1] = 10
        },
        honor = {
            honorPointsReceived = 250,
            honorPointsGiven = 500
        }
    }
};