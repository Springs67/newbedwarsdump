local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types")
local v4 = v3.GlobalTeamEventKey
local v5 = v3.GlobalTeamKey
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata")
local v7 = v6.EventCurrencyType
local v8 = v6.EventType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-system").CheckInSystem
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "events", "egg-hunt-2026-missions").EggHuntEvent_2026_Missions
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "events", "lny-2026-missions").LNY_2026_Missions
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "events", "xmas-2025-missions").XMAS_2025_Special_Missions
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem
local v20 = {
    [v8.FOUR_YEAR_ANNIVERSARY] = {
        ["name"] = "\240\159\142\130 4 Year Anniversary \240\159\142\130",
        ["subtitle"] = "\226\158\161\239\184\143 Free Rewards \226\172\133\239\184\143",
        ["active"] = false,
        ["endDate"] = 1749852000,
        ["npcCollectionTag"] = "EventNPC",
        ["disableMissionsSort"] = true,
        ["npcConfig"] = {
            ["NpcName"] = "dodo_whisper"
        },
        ["currencies"] = {},
        ["startDate"] = (v2:IsStudio() or v14.isDevTesting()) and 1747951200 or 1748037600,
        ["shops"] = {},
        ["missionGenerators"] = {},
        ["checkInSystem"] = v12.FOUR_YEAR_ANNIVERSARY,
        ["lobbyButtonConfig"] = {
            ["icon"] = "rbxassetid://7122143895",
            ["bannerImage"] = "rbxassetid://13551298435",
            ["backgroundGradient"] = ColorSequence.new(Color3.fromRGB(255, 232, 105), Color3.fromRGB(255, 59, 105))
        }
    },
    [v8.EGG_HUNT_2025] = {
        ["name"] = "Egg Hunt Event 2025",
        ["active"] = false,
        ["endDate"] = 1746223200,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "Collect eggs to earn rewards!",
        ["disableMissionsSort"] = true,
        ["npcConfig"] = {
            ["NpcName"] = "uma_easter_bunny"
        },
        ["currencies"] = {},
        ["startDate"] = (v2:IsStudio() or v14.isDevTesting()) and 1680386400 or 1744408800,
        ["shops"] = {},
        ["missionGenerators"] = {}
    },
    [v8.LNY_2025] = {
        ["name"] = "\240\159\167\167 LNY 2025 \240\159\167\167",
        ["subtitle"] = "Event",
        ["active"] = false,
        ["navbarImage"] = "",
        ["startDate"] = 1737759600,
        ["endDate"] = 1739574000,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "",
        ["disableMissionsSort"] = true,
        ["lobbyButtonConfig"] = {
            ["bannerImage"] = "rbxassetid://100219891366707",
            ["backgroundGradient"] = ColorSequence.new(Color3.fromRGB(252, 222, 61), Color3.fromRGB(255, 18, 74))
        },
        ["npcConfig"] = {
            ["NpcName"] = "hannah_lunar_big"
        },
        ["currencies"] = { v7.LNY_2025_CURRENCY },
        ["shops"] = {
            {
                ["name"] = "LNY 2025 Event Shop",
                ["items"] = {
                    v19.LNY_25_EMOTE_2,
                    v19.LNY_25_EMOTE_3,
                    v19.LNY_25_EMOTE_4,
                    v19.LNY_25_EMOTE_5,
                    v19.LNY_25_EMOTE_6,
                    v19.LNY_25_ANIMATED_EMOTE_1,
                    v19.LNY_25_KIT_SKIN_1,
                    v19.LUCKY_CRATE,
                    v19.BATTLE_PASS_2X,
                    v19.AUTO_COMPLETE_DAILY_MISSION_TICKET,
                    v19.AUTO_COMPLETE_WEEKLY_MISSION_TICKET,
                    v19.LNY_LOBBY_GADGET_1,
                    v19.LNY_25_TITLE_1,
                    v19.LNY_25_TITLE_2,
                    v19.LNY_25_TITLE_3,
                    v19.LNY_25_TITLE_4
                }
            }
        },
        ["missionGenerators"] = {},
        ["checkInSystem"] = v12.LNY_2025
    },
    [v8.XMAS_2024] = {
        ["name"] = "\226\157\132\239\184\143 Holiday Event 2024 \240\159\142\132",
        ["subtitle"] = "\240\159\142\137 Minigame Mountain",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://11815911253",
        ["startDate"] = 1734390000,
        ["endDate"] = 1736550000,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "",
        ["disableMissionsSort"] = true,
        ["lobbyButtonConfig"] = {
            ["icon"] = "rbxassetid://11838567073",
            ["bannerImage"] = "rbxassetid://11815911253"
        },
        ["npcConfig"] = {
            ["NpcName"] = "lassy_reindeer_wrangler_big"
        },
        ["currencies"] = {},
        ["shops"] = {},
        ["missionGenerators"] = {},
        ["checkInSystem"] = v12.XMAS_2024
    },
    [v8.SUMMER_2024] = {
        ["name"] = "\240\159\143\150\239\184\143 Summer 2024 \240\159\143\150\239\184\143",
        ["active"] = false,
        ["startDate"] = 1719006640,
        ["endDate"] = 1720821040,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "Chill out and enjoy the summer sun!",
        ["disableMissionsSort"] = true,
        ["npcConfig"] = {
            ["NpcName"] = "shielder_surfer_big"
        },
        ["navbarImage"] = v13.SUMMER_FULL_ART,
        ["currencies"] = { v7.SUMMER_2024_CURRENCY },
        ["shops"] = {
            {
                ["name"] = "Summer 2024 Event Shop",
                ["items"] = {
                    v19.SUMMER_24_EMOTE_1,
                    v19.SUMMER_24_EMOTE_2,
                    v19.SUMMER_24_EMOTE_3,
                    v19.SUMMER_24_EMOTE_4,
                    v19.SUMMER_24_EMOTE_5,
                    v19.SUMMER_24_EMOTE_6,
                    v19.SUMMER_24_KIT_SKIN_1,
                    v19.SUMMER_24_KIT_SKIN_2,
                    v19.SUMMER_24_KIT_SKIN_3,
                    v19.SUMMER_24_ANIMATED_EMOTE_1,
                    v19.SUMMER_24_ANIMATED_EMOTE_2,
                    v19.SUMMER_24_KILL_EFFECT_1,
                    v19.LUCKY_CRATE,
                    v19.KIT_RENTAL_LIMITED_7,
                    v19.KIT_RENTAL_FIGHTER_7,
                    v19.KIT_RENTAL_SUPPORT_7,
                    v19.KIT_RENTAL_TANK_7,
                    v19.KIT_RENTAL_DEFENDER_7,
                    v19.KIT_RENTAL_MOVEMENT_7,
                    v19.KIT_RENTAL_ECONOMY_7,
                    v19.KIT_RENTAL_DESTROYER_7,
                    v19.KIT_RENTAL_RANGED_7,
                    v19.BATTLE_PASS_2X,
                    v19.AUTO_COMPLETE_DAILY_MISSION_TICKET,
                    v19.AUTO_COMPLETE_WEEKLY_MISSION_TICKET,
                    v19.SUMMER_24_TITLE_1,
                    v19.SUMMER_24_TITLE_2,
                    v19.SUMMER_24_TITLE_3
                }
            }
        },
        ["missionGenerators"] = {
            {
                ["id"] = "lastChance",
                ["name"] = "Last Chance",
                ["selectAmount"] = 1,
                ["layoutOrder"] = 1,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.SUMMER_2024_CURRENCY, nil, 5000)
            }
        },
        ["customPagesConfig"] = {
            ["setTeamPage"] = {
                ["eventDescription"] = "Pick a side, play to collect shells, and contribute to your team\'s victory!",
                ["globalTeamEventKey"] = v4.SUMMER_2024,
                ["eventContributionCurrency"] = v13.SHELL_COIN,
                ["team1"] = {
                    ["name"] = "TURTLE",
                    ["nameTagIcon"] = "\240\159\144\162",
                    ["backgroundImage"] = v13.SUMMER_LEFT_BACKGROUND,
                    ["iconImage"] = v13.SUMMER_LEFT_TURTLE,
                    ["foregroundImage"] = v13.SUMMER_LEFT_FOREGROUND,
                    ["globalTeamKey"] = v5.SUMMER_2024_TURTLE,
                    ["teamColor"] = Color3.fromRGB(150, 212, 31)
                },
                ["team2"] = {
                    ["name"] = "CRAB",
                    ["nameTagIcon"] = "\240\159\166\128",
                    ["backgroundImage"] = v13.SUMMER_RIGHT_BACKGROUND,
                    ["iconImage"] = v13.SUMMER_RIGHT_CRAB,
                    ["foregroundImage"] = v13.SUMMER_RIGHT_FOREGROUND,
                    ["globalTeamKey"] = v5.SUMMER_2024_CRAB,
                    ["teamColor"] = Color3.fromRGB(255, 36, 29)
                }
            }
        },
        ["globalTeamEventKey"] = v4.SUMMER_2024
    },
    [v8.THREE_YEAR_ANNIVERSARY] = {
        ["name"] = "\240\159\142\137 3 Year Anniversary \240\159\142\137",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://13551298435",
        ["startDate"] = 1716588000,
        ["endDate"] = 1718402400,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "Celebrate the third anniversary of BedWars!",
        ["disableMissionsSort"] = true,
        ["npcConfig"] = {
            ["NpcName"] = "wizard_anniversary_big"
        },
        ["currencies"] = { v7.THREE_YEAR_COIN },
        ["shops"] = {
            {
                ["name"] = "3 Year Anniversary Event Shop",
                ["items"] = {
                    v19.THREE_YEAR_ANNIVERSARY_BALLOON_LOBBY_GADGET,
                    v19.THREE_YEAR_ANNIVERSARY_PARTY_HAT_LOBBY_GADGET,
                    v19.THREE_YEAR_ANNIVERSARY_KILL_EFFECT_1,
                    v19.THREE_YEAR_ANNIVERSARY_TITLE_2,
                    v19.THREE_YEAR_ANNIVERSARY_TITLE_3,
                    v19.THREE_YEAR_ANNIVERSARY_CONGA_EMOTE,
                    v19.THREE_YEAR_ANNIVERSARY_EMOTE_BEKZAT,
                    v19.THREE_YEAR_ANNIVERSARY_EMOTE_BARBARIAN,
                    v19.THREE_YEAR_ANNIVERSARY_EMOTE_LYLA,
                    v19.THREE_YEAR_ANNIVERSARY_EMOTE_CAKE_FACE,
                    v19.THREE_YEAR_ANNIVERSARY_EMOTE_BAKER,
                    v19.THREE_YEAR_ANNIVERSARY_KIT_SKIN_1,
                    v19.LUCKY_CRATE,
                    v19.KIT_RENTAL_LIMITED_7,
                    v19.KIT_RENTAL_FIGHTER_7,
                    v19.KIT_RENTAL_SUPPORT_7,
                    v19.KIT_RENTAL_TANK_7,
                    v19.KIT_RENTAL_DEFENDER_7,
                    v19.KIT_RENTAL_MOVEMENT_7,
                    v19.KIT_RENTAL_ECONOMY_7,
                    v19.KIT_RENTAL_DESTROYER_7,
                    v19.KIT_RENTAL_RANGED_7,
                    v19.BATTLE_PASS_2X,
                    v19.BATTLE_PASS_3X,
                    v19.AUTO_COMPLETE_DAILY_MISSION_TICKET,
                    v19.AUTO_COMPLETE_WEEKLY_MISSION_TICKET
                }
            }
        },
        ["missionGenerators"] = {
            {
                ["id"] = "daily",
                ["name"] = "Daily",
                ["selectAmount"] = 3,
                ["layoutOrder"] = 2,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.THREE_YEAR_COIN)
            },
            {
                ["id"] = "weekly",
                ["name"] = "Weekly",
                ["selectAmount"] = 2,
                ["layoutOrder"] = 3,
                ["resetTime"] = {
                    ["intervalSeconds"] = 604800
                },
                ["pool"] = v15.generateBaseWeeklyMissions(v7.THREE_YEAR_COIN)
            },
            {
                ["id"] = "lastChance",
                ["name"] = "Last Chance",
                ["selectAmount"] = 1,
                ["layoutOrder"] = 1,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.THREE_YEAR_COIN, nil, 10000)
            }
        }
    },
    [v8.ROBLOX_CLASSIC_2024] = {
        ["name"] = "Roblox Classic Event",
        ["active"] = false,
        ["endDate"] = 1716922800,
        ["npcCollectionTag"] = "",
        ["missionPageDesc"] = "",
        ["npcConfig"] = {},
        ["currencies"] = {},
        ["startDate"] = (v2:IsStudio() or v14.isStaging()) and 1716277166 or 1716476400,
        ["shops"] = {},
        ["missionGenerators"] = {},
        ["customPagesConfig"] = {
            ["infoPage"] = {
                ["description"] = "The Penguins have gone rogue... They have made it clear we are no longer welcome in the Snow. \nFend off hoards of bed-destroying penguins in the new limited time mode: Penguin Survival. \n",
                ["playButtonQueue"] = v11.SURVIVAL
            }
        },
        ["navbarImage"] = v13.CLASSIC_THUMBNAIL
    },
    [v8.EGG_HUNT_2024] = {
        ["name"] = "Egg Hunt Event 2024",
        ["active"] = false,
        ["endDate"] = 1712354400,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "Collect eggs to earn rewards!",
        ["disableMissionsSort"] = true,
        ["npcConfig"] = {
            ["NpcName"] = "big_taliyah_easter"
        },
        ["currencies"] = {},
        ["startDate"] = (v2:IsStudio() or v14.isDevTesting()) and 1680386400 or 1710435600,
        ["shops"] = {},
        ["missionGenerators"] = {}
    },
    [v8.LNY_2024] = {
        ["name"] = "Lunar New Year Event 2024",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://16214027072",
        ["endDate"] = 1708729200,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "big_archer_lunar_dragon"
        },
        ["currencies"] = { v7.RED_ENVELOPE_2024 },
        ["startDate"] = v2:IsStudio() and 1704236400 or 1706914800,
        ["shops"] = {
            {
                ["name"] = "Event Shop",
                ["items"] = {
                    v19.LUCKY_CRATE,
                    v19.KIT_RENTAL_LIMITED_7,
                    v19.KIT_RENTAL_FIGHTER_7,
                    v19.KIT_RENTAL_SUPPORT_7,
                    v19.KIT_RENTAL_TANK_7,
                    v19.KIT_RENTAL_DEFENDER_7,
                    v19.KIT_RENTAL_MOVEMENT_7,
                    v19.KIT_RENTAL_ECONOMY_7,
                    v19.KIT_RENTAL_DESTROYER_7,
                    v19.KIT_RENTAL_RANGED_7,
                    v19.BATTLE_PASS_2X,
                    v19.LNY_24_EMOTE_1,
                    v19.LNY_24_EMOTE_2,
                    v19.LNY_24_EMOTE_3,
                    v19.LNY_24_EMOTE_4,
                    v19.LNY_24_EMOTE_5,
                    v19.LNY_24_TITLE_1,
                    v19.LNY_24_TITLE_2,
                    v19.LNY_24_TITLE_3,
                    v19.LNY_24_TITLE_4,
                    v19.LNY_24_TITLE_5,
                    v19.LNY_24_KITSKIN_1,
                    v19.LNY_24_KILL_EFFECT_1,
                    v19.LNY_24_ANIMATED_EMOTE_1
                }
            }
        },
        ["missionGenerators"] = {
            {
                ["id"] = "daily",
                ["name"] = "Daily",
                ["selectAmount"] = 2,
                ["layoutOrder"] = 2,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.RED_ENVELOPE_2024, nil, 1000)
            },
            {
                ["id"] = "weekly",
                ["name"] = "Weekly",
                ["selectAmount"] = 3,
                ["layoutOrder"] = 3,
                ["resetTime"] = {
                    ["intervalSeconds"] = 604800
                },
                ["pool"] = v15.generateBaseWeeklyMissions(v7.RED_ENVELOPE_2024)
            },
            {
                ["id"] = "lastChance",
                ["name"] = "Last Chance",
                ["selectAmount"] = 1,
                ["layoutOrder"] = 1,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.RED_ENVELOPE_2024, nil, 10000)
            }
        }
    },
    [v8.XMAS_2023] = {
        ["name"] = "Holiday Event 2023",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://11815911253",
        ["startDate"] = 1702681200,
        ["endDate"] = 1704754800,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "big_melody_cozy",
            ["NpcAnimation"] = v10[v9.GUITAR_PLAY]
        },
        ["currencies"] = { v7.XMAS_TOKEN_2023, v7.XMAS_RED_TOKEN_2023 },
        ["shops"] = {
            {
                ["name"] = "Holiday Event Shop",
                ["items"] = {
                    v19.XMAS_23_TITLE_1,
                    v19.XMAS_23_TITLE_2,
                    v19.CHRISTMAS_TITLE_1,
                    v19.CHRISTMAS_TITLE_2,
                    v19.CHRISTMAS_TITLE_3,
                    v19.CHRISTMAS_TITLE_4,
                    v19.XMAS_23_EMOTE_1,
                    v19.XMAS_23_EMOTE_2,
                    v19.XMAS_23_EMOTE_3,
                    v19.XMAS_23_EMOTE_4,
                    v19.XMAS_23_EMOTE_5,
                    v19.XMAS_23_EMOTE_6,
                    v19.ELDRIC_CHRISTMAS_SPIRIT_KITSKIN,
                    v19.MILO_GRINCH_KITSKIN,
                    v19.MELODY_COZY_KITSKIN,
                    v19.SUMMON_SNOW_ANIMATED_EMOTE,
                    v19.PENGUIN_CRUSH_KILL_EFFECT,
                    v19.SNOWBALL_LAUNCHER_LOBBY_GADGET,
                    v19.LUCKY_CRATE,
                    v19.KIT_RENTAL_LIMITED_7,
                    v19.KIT_RENTAL_FIGHTER_7,
                    v19.KIT_RENTAL_SUPPORT_7,
                    v19.KIT_RENTAL_TANK_7,
                    v19.KIT_RENTAL_DEFENDER_7,
                    v19.KIT_RENTAL_MOVEMENT_7,
                    v19.KIT_RENTAL_ECONOMY_7,
                    v19.KIT_RENTAL_DESTROYER_7,
                    v19.KIT_RENTAL_RANGED_7,
                    v19.BATTLE_PASS_2X
                }
            }
        },
        ["missionGenerators"] = {
            {
                ["id"] = "daily",
                ["name"] = "Daily",
                ["selectAmount"] = 2,
                ["layoutOrder"] = 2,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.XMAS_TOKEN_2023, nil, 1000)
            },
            {
                ["id"] = "weekly",
                ["name"] = "Weekly",
                ["selectAmount"] = 3,
                ["layoutOrder"] = 3,
                ["resetTime"] = {
                    ["intervalSeconds"] = 604800
                },
                ["pool"] = v15.generateBaseWeeklyMissions(v7.XMAS_TOKEN_2023)
            }
        }
    },
    [v8.HALLOWEEN_2023] = {
        ["name"] = "Halloween Event 2023",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://11340018523",
        ["startDate"] = 1697234400,
        ["endDate"] = 1699311600,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "dasher_voodoodoll_big"
        },
        ["currencies"] = { v7.CANDY_2023 },
        ["shops"] = {
            {
                ["name"] = "Halloween Event Shop",
                ["items"] = {
                    v19.HW_2023_TITLE_1,
                    v19.HW_2023_TITLE_2,
                    v19.HW_2023_TITLE_3,
                    v19.HW_2023_TITLE_4,
                    v19.HW_2023_EMOTE_1,
                    v19.HW_2023_EMOTE_2,
                    v19.HW_2023_EMOTE_3,
                    v19.HW_2023_EMOTE_4,
                    v19.HW_2023_EMOTE_5,
                    v19.HW_2023_EMOTE_6,
                    v19.SKELETON_KILL_EFFECT,
                    v19.SOULLEAVE_KILL_EFFECT,
                    v19.CORRUPTED_BARBARIAN_KITSKIN,
                    v19.LUCKY_CRATE,
                    v19.KIT_RENTAL_LIMITED_7,
                    v19.KIT_RENTAL_FIGHTER_7,
                    v19.KIT_RENTAL_SUPPORT_7,
                    v19.BATTLE_PASS_2X
                }
            }
        },
        ["missionGenerators"] = {
            {
                ["id"] = "daily",
                ["name"] = "Daily",
                ["selectAmount"] = 2,
                ["layoutOrder"] = 1,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.CANDY_2023)
            },
            {
                ["id"] = "weekly",
                ["name"] = "Weekly",
                ["selectAmount"] = 3,
                ["layoutOrder"] = 2,
                ["resetTime"] = {
                    ["intervalSeconds"] = 604800
                },
                ["pool"] = v15.generateBaseWeeklyMissions(v7.CANDY_2023)
            }
        }
    },
    [v8.HALLOWEEN_2024] = {
        ["name"] = "Halloween Event 2024",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://11340018523",
        ["startDate"] = 1729288800,
        ["endDate"] = 1731366000,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "wren_halloween_big"
        },
        ["currencies"] = { v7.CANDY_2024 },
        ["shops"] = {
            {
                ["name"] = "Halloween Event Shop",
                ["items"] = {
                    v19.HW_2024_TITLE_1,
                    v19.HW_2024_TITLE_2,
                    v19.HW_2024_TITLE_3,
                    v19.HW_2024_TITLE_4,
                    v19.HW_2024_TITLE_5,
                    v19.HW_2024_EMOTE_1,
                    v19.HW_2024_EMOTE_2,
                    v19.HW_2024_EMOTE_3,
                    v19.HW_2024_EMOTE_4,
                    v19.HW_2024_EMOTE_5,
                    v19.HW_2024_EMOTE_6,
                    v19.HW_2024_EMOTE_7,
                    v19.HW_2024_EMOTE_8,
                    v19.MUMMY_NAZAR_KITSKIN,
                    v19.GREAT_WOLF_SILAS_KITSKIN,
                    v19.HALLOWEEN_WREN_KITSKIN,
                    v19.WITCH_KAIDA,
                    v19.GHOSTIFY_BED_BREAK,
                    v19.SPIDER_QUEEN_SPIDER_PET,
                    v19.BATTLE_PASS_2X,
                    v19.LUCKY_CRATE,
                    v19.KIT_RENTAL_LIMITED_7,
                    v19.WEBBED_UP_KILL_EFFECT
                }
            }
        },
        ["missionGenerators"] = {
            {
                ["id"] = "daily",
                ["name"] = "Daily",
                ["selectAmount"] = 2,
                ["layoutOrder"] = 2,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.CANDY_2024)
            },
            {
                ["id"] = "weekly",
                ["name"] = "Weekly",
                ["selectAmount"] = 3,
                ["layoutOrder"] = 3,
                ["resetTime"] = {
                    ["intervalSeconds"] = 604800
                },
                ["pool"] = v15.generateBaseWeeklyMissions(v7.CANDY_2024)
            }
        }
    },
    [v8.TWO_YEAR_ANNIVERSARY] = {
        ["name"] = "\240\159\142\137 2 Year Anniversary \240\159\142\137",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://13551298435",
        ["startDate"] = 1685138400,
        ["endDate"] = 1686348000,
        ["npcCollectionTag"] = "EventNPC",
        ["disableMissionsSort"] = true,
        ["npcConfig"] = {
            ["NpcName"] = "star_collector"
        },
        ["currencies"] = { v7.TWO_YEAR_COIN },
        ["shops"] = {
            {
                ["name"] = "2 Year Anniversary Event Shop",
                ["items"] = {
                    v19.LUCKY_CRATE,
                    v19.KIT_RENTAL_LIMITED_7,
                    v19.KIT_RENTAL_FIGHTER_7,
                    v19.KIT_RENTAL_SUPPORT_7,
                    v19.BATTLE_PASS_2X,
                    v19.BATTLE_PASS_3X,
                    v19.AUTO_COMPLETE_DAILY_MISSION_TICKET,
                    v19.AUTO_COMPLETE_WEEKLY_MISSION_TICKET,
                    v19.TWO_YEAR_EMOTE_1,
                    v19.TWO_YEAR_EMOTE_2,
                    v19.TWO_YEAR_EMOTE_3,
                    v19.TWO_YEAR_EMOTE_4,
                    v19.TWO_YEAR_EMOTE_5,
                    v19.TWO_YEAR_TITLE_1,
                    v19.TWO_YEAR_TITLE_2
                }
            }
        },
        ["missionGenerators"] = {
            {
                ["id"] = "daily",
                ["name"] = "Daily",
                ["selectAmount"] = 3,
                ["layoutOrder"] = 1,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.TWO_YEAR_COIN)
            },
            {
                ["id"] = "weekly",
                ["name"] = "Weekly",
                ["selectAmount"] = 2,
                ["layoutOrder"] = 2,
                ["resetTime"] = {
                    ["intervalSeconds"] = 604800
                },
                ["pool"] = v15.generateBaseWeeklyMissions(v7.TWO_YEAR_COIN)
            }
        }
    },
    [v8.EASTER_2023] = {
        ["name"] = "Easter Event 2023",
        ["active"] = false,
        ["endDate"] = 1682287200,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "Collect eggs to earn rewards!",
        ["disableMissionsSort"] = true,
        ["npcConfig"] = {
            ["NpcName"] = "desertMerchant"
        },
        ["currencies"] = {},
        ["startDate"] = v2:IsStudio() and 1680386400 or 1680904800,
        ["shops"] = {},
        ["missionGenerators"] = {}
    },
    [v8.XMAS_EVENT_2022] = {
        ["name"] = "Christmas Event 2022",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://11815911253",
        ["startDate"] = 1671318000,
        ["endDate"] = 1673650800,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "desertMerchant"
        },
        ["currencies"] = { v7.XMAS_TOKEN },
        ["shops"] = {
            {
                ["name"] = "Christmas Event Shop",
                ["items"] = {
                    v19.CHRISTMAS_CRYPT_SKIN,
                    v19.CHRISTMAS_EVELYNN_SKIN,
                    v19.CHRISTMAS_TITLE_1,
                    v19.CHRISTMAS_TITLE_2,
                    v19.CHRISTMAS_TITLE_3,
                    v19.CHRISTMAS_TITLE_4,
                    v19.CHRISTMAS_EMOTE,
                    v19.CHRISTMAS_EMOTE_2,
                    v19.CHRISTMAS_EMOTE_3,
                    v19.CHRISTMAS_EMOTE_4,
                    v19.CHRISTMAS_EMOTE_5,
                    v19.CHRISTMAS_EMOTE_6,
                    v19.CHRISTMAS_EMOTE_7,
                    v19.CHRISTMAS_EMOTE_8,
                    v19.CHRISTMAS_SNOW_KILL_EFFECT,
                    v19.FROSTY_HAMMER_LOBBY_GADGET
                }
            }
        },
        ["missionGenerators"] = {
            {
                ["id"] = "daily",
                ["name"] = "Daily",
                ["selectAmount"] = 2,
                ["layoutOrder"] = 1,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v15.generateBaseDailyMissions(v7.XMAS_TOKEN)
            },
            {
                ["id"] = "weekly",
                ["name"] = "Weekly",
                ["selectAmount"] = 3,
                ["layoutOrder"] = 2,
                ["resetTime"] = {
                    ["intervalSeconds"] = 604800
                },
                ["pool"] = v15.generateBaseWeeklyMissions(v7.XMAS_TOKEN)
            }
        }
    },
    [v8.HALLOWEEN_EVENT_2022] = {
        ["name"] = "Halloween Event 2022",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://11340018523",
        ["startDate"] = 1666476000,
        ["endDate"] = 1667862000,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "desertMerchant"
        },
        ["currencies"] = { v7.CANDY },
        ["shops"] = {
            {
                ["name"] = "Halloween Event Shop",
                ["items"] = {
                    v19.HALLOWEEN_EMOTE,
                    v19.HALLOWEEN_EMOTE_2,
                    v19.HALLOWEEN_EMOTE_3,
                    v19.HALLOWEEN_EMOTE_4,
                    v19.HALLOWEEN_TITLE_1,
                    v19.HALLOWEEN_TITLE_2,
                    v19.HALLOWEEN_TITLE_3,
                    v19.HALLOWEEN_TITLE_4,
                    v19.HALLOWEEN_TITLE_5,
                    v19.HALLOWEEN_LOBBY_GADGET,
                    v19.HALLOWEEN_LASSY_MUMMY_SKIN,
                    v19.HALLOWEEN_VULCAN_CYBER_VAMPIRE_SKIN,
                    v19.HALLOWEEN_GRAVESTONE_KILL_EFFECT
                }
            }
        },
        ["missionGenerators"] = {}
    },
    [v8.PIRATE_EVENT_2022] = {
        ["name"] = "Pirate Event 2022",
        ["active"] = false,
        ["startDate"] = 1661616000,
        ["endDate"] = 1663365600,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "desertMerchant"
        },
        ["currencies"] = { v7.DOUBLOONS },
        ["shops"] = {
            {
                ["name"] = "Pirate Event Shop",
                ["items"] = {
                    v19.PIRATE_TITLE_1,
                    v19.PIRATE_TITLE_2,
                    v19.PIRATE_TITLE_3,
                    v19.PIRATE_TITLE_4,
                    v19.PIRATE_TITLE_5,
                    v19.PIRATE_TITLE_6,
                    v19.PIRATE_EMOTE_1,
                    v19.PIRATE_EMOTE_2,
                    v19.PIRATE_EMOTE_3,
                    v19.PIRATE_EMOTE_4,
                    v19.PIRATE_EMOTE_5,
                    v19.PIRATE_EMOTE_6,
                    v19.PIRATE_EMOTE_7,
                    v19.PIRATE_EMOTE_8,
                    v19.PIRATE_EMOTE_9,
                    v19.PIRATE_ANIMATED_EMOTE_1,
                    v19.PIRATE_ANIMATED_EMOTE_2,
                    v19.PIRATE_ANIMATED_EMOTE_3,
                    v19.PIRATE_GHOST_KILL_EFFECT,
                    v19.PIRATE_ATTACK_KILL_EFFECT,
                    v19.PIRATE_LOBBY_GADGET_1,
                    v19.PIRATE_DAVEY_GHOST_SKIN
                }
            }
        },
        ["missionGenerators"] = {}
    },
    [v8.SUMMER_2025] = {
        ["name"] = "\240\159\143\150\239\184\143 Summer 2025 \240\159\143\150\239\184\143",
        ["active"] = false,
        ["alwaysActiveInDevTesting"] = false,
        ["navbarImage"] = "rbxassetid://132714828605380",
        ["endDate"] = 1754647200,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "Chill out and enjoy the summer sun!",
        ["disableMissionsSort"] = true,
        ["npcConfig"] = {
            ["NpcName"] = "tidal_wren"
        },
        ["lobbyButtonConfig"] = {
            ["bannerImage"] = "rbxassetid://132714828605380",
            ["icon"] = "rbxassetid://125051862609822"
        },
        ["currencies"] = { v7.SUMMER_2025_CURRENCY },
        ["startDate"] = (v2:IsStudio() or v14.isDevTesting()) and 1751061600 or 1751666400,
        ["checkInSystem"] = v12.SUMMER_2025,
        ["shops"] = {
            {
                ["name"] = "Summer 2025 Event Shop",
                ["items"] = {
                    v19.SUMMER_25_EMOTE_1,
                    v19.SUMMER_25_EMOTE_2,
                    v19.SUMMER_25_EMOTE_3,
                    v19.SUMMER_25_EMOTE_4,
                    v19.SUMMER_25_EMOTE_5,
                    v19.SUMMER_25_EMOTE_6,
                    v19.SUMMER_25_KIT_SKIN_1,
                    v19.SUMMER_25_KIT_SKIN_2,
                    v19.SUMMER_25_KIT_SKIN_3,
                    v19.SUMMER_25_ANIMATED_EMOTE_1,
                    v19.SUMMER_25_ANIMATED_EMOTE_2,
                    v19.SUMMER_25_KILL_EFFECT_1,
                    v19.SUMMER_25_BED_BREAK_EFFECT_1,
                    v19.SUMMER_25_WATER_GUN_LOBBY_GADGET,
                    v19.LUCKY_CRATE,
                    v19.DIAMOND_LUCKY_CRATE,
                    v19.KIT_RENTAL_NORMAL_3,
                    v19.BATTLE_PASS_2X,
                    v19.BATTLE_PASS_3X,
                    v19.AUTO_COMPLETE_DAILY_MISSION_TICKET,
                    v19.AUTO_COMPLETE_WEEKLY_MISSION_TICKET,
                    v19.SUMMER_25_TITLE_1,
                    v19.SUMMER_25_TITLE_2,
                    v19.SUMMER_25_TITLE_3
                }
            }
        },
        ["customPagesConfig"] = {
            ["infoPage"] = {}
        },
        ["globalTeamEventKey"] = v4.SUMMER_2025,
        ["missionGenerators"] = {}
    },
    [v8.SKULL_DROP_1] = {
        ["name"] = "The Harvest",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://11815911253",
        ["startDate"] = 1758931200,
        ["endDate"] = 1759183200,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "grim_reaper"
        },
        ["currencies"] = { v7.SKULLS },
        ["shops"] = {
            {
                ["name"] = "Souls Shop",
                ["items"] = {
                    v19.INCARNATION_GRIM_REAPER,
                    v19.UNDERWORLD_ENVOY_INTERN,
                    v19.UNDERWORLD_ENVOY_AGENT,
                    v19.UNDERWORLD_ENVOY_EMISSARY,
                    v19.GRIM_REAPER_RENTAL,
                    v19.SKULL_DROP_LUCKY_CRATE,
                    v19.EMOTE_GRIM_SKULL_EMOJI,
                    v19.EMOTE_GRIM_SKULL_HARVESTER,
                    v19.BED_COIN_100,
                    v19.BED_COIN_1000
                }
            }
        },
        ["missionGenerators"] = {},
        ["customPagesConfig"] = {
            ["infoPage"] = {
                ["description"] = "Grim Reaper is out on vacation this weekend... He is looking for people to do his job while he is gone. \n Every kill in game gives a Soul, use soul to purchase items in the event shop! \n Top Players will also get unique titles!\n Event is active in all queues"
            }
        }
    },
    [v8.HALLOWEEN_2025] = {
        ["name"] = "\240\159\142\131 Halloween 2025",
        ["subtitle"] = "Event!",
        ["active"] = false,
        ["alwaysActiveInDevTesting"] = false,
        ["navbarImage"] = "rbxassetid://11340018523",
        ["endDate"] = 1763061200,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "demon_triton_big",
            ["NpcScale"] = 1
        },
        ["lobbyButtonConfig"] = {
            ["bannerImage"] = "rbxassetid://11340018523",
            ["icon"] = "rbxassetid://11175136630",
            ["backgroundGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(219, 109, 49)), ColorSequenceKeypoint.new(1, Color3.fromRGB(61, 31, 80)) })
        },
        ["currencies"] = { v7.CANDY_2025, v7.RARE_CANDY_2025 },
        ["startDate"] = (v2:IsStudio() or v14.isDevTesting()) and 1759877023 or 1760738400,
        ["checkInSystem"] = v12.HW_2025,
        ["shops"] = {
            {
                ["name"] = "Halloween 2025 Event Shop",
                ["items"] = {
                    v19.HALLOWEEN_2025_ANIMATED_EMOTE_1,
                    v19.HALLOWEEN_2025_ANIMATED_EMOTE_2,
                    v19.HALLOWEEN_2025_IMAGE_EMOTE_1,
                    v19.HALLOWEEN_2025_IMAGE_EMOTE_2,
                    v19.HALLOWEEN_2025_IMAGE_EMOTE_3,
                    v19.HALLOWEEN_2025_IMAGE_EMOTE_4,
                    v19.HALLOWEEN_2025_IMAGE_EMOTE_5,
                    v19.HALLOWEEN_2025_TITLE_1,
                    v19.HALLOWEEN_2025_TITLE_2,
                    v19.HALLOWEEN_2025_TITLE_3,
                    v19.HALLOWEEN_2025_BATEXPLOSION_KILLEFFECT,
                    v19.HALLOWEEN_2025_BATEXPLOSION_BEDBREAKEFFECT,
                    v19.HALLOWEEN_2025_WITCHPOLYMOPRH_KILLEFFECT,
                    v19.HALLOWEEN_2025_CENTIPEDE_BEDBREAKEFFECT,
                    v19.HALLOWEEN_2025_JIANG_SHI_LIAN_KIT_SKIN,
                    v19.HALLOWEEN_2025_DEMON_TRITON_KIT_SKIN,
                    v19.HALLOWEEN_2025_SKELETON_KIT,
                    v19.LUCKY_CRATE,
                    v19.DIAMOND_LUCKY_CRATE,
                    v19.KIT_RENTAL_NORMAL_3,
                    v19.BED_COIN_100
                }
            }
        },
        ["missionGenerators"] = {}
    },
    [v8.METEOR_LOBBY_EVENT] = {
        ["name"] = "\240\159\148\165 Meteor Shower",
        ["subtitle"] = "Event Shop",
        ["active"] = false,
        ["endDate"] = 1763359800,
        ["npcCollectionTag"] = "EventNPC",
        ["npcConfig"] = {
            ["NpcName"] = "ember"
        },
        ["currencies"] = { v7.METEOR_SHARD },
        ["navbarImage"] = v13.METEOR,
        ["startDate"] = v14.isProduction() and 1763164800 or 1762509623,
        ["shops"] = {
            {
                ["name"] = "Infernal Shop",
                ["items"] = {
                    v19.METEOR_LUCKY_CRATE_1,
                    v19.AGNI_RENTAL_TICKET,
                    v19.SHIELDER_RENTAL_TICKET,
                    v19.PYRO_RENTAL_TICKET,
                    v19.METEOR_STAFF_LOBBY_GADGET,
                    v19.METEOR_BED_COIN_50,
                    v19.METEOR_KILL_EFFECT
                }
            }
        },
        ["missionGenerators"] = {},
        ["customPagesConfig"] = {
            ["infoPage"] = {
                ["description"] = "The Infernal World Emerging! Meteors rain down from the sky! Collect meteor shards for rewards! "
            }
        }
    },
    [v8.PENGUIN_CATCHING_LOBBY_EVENT] = {
        ["name"] = "Catch the Penguins",
        ["subtitle"] = "Event Shop",
        ["active"] = false,
        ["endDate"] = 1770681600,
        ["npcCollectionTag"] = "EventNPC",
        ["eventInterval"] = 7200,
        ["npcConfig"] = {
            ["NpcName"] = "taliyah_penguin_queen"
        },
        ["currencies"] = { v7.PENGUIN_COIN },
        ["navbarImage"] = v13.PENGUIN_CRUSH,
        ["startDate"] = v14.isProduction() and 1770422400 or 1770336000,
        ["shops"] = {
            {
                ["name"] = "Penguin Shop",
                ["items"] = {
                    v19.BABY_PENGUIN_PET,
                    v19.PENGUIN_CATCHING_BED_COIN_50,
                    v19.PENGUIN_CATCHING_LUCKY_CRATE_1,
                    v19.PENGUIN_CATCHING_LUCKY_CRATE_2,
                    v19.PENGUIN_CATCHING_LUCKY_CRATE_3,
                    v19.WEB_SHOOTER_LOBBY_GADGET,
                    v19.YETI_RENTAL_TICKET,
                    v19.FREIYA_RENTAL_TICKET,
                    v19.FROSTY_RENTAL_TICKET
                }
            }
        },
        ["missionGenerators"] = {},
        ["customPagesConfig"] = {
            ["infoPage"] = {
                ["description"] = "The baby penguins are naughty and they are running around! Bring them back to Taliyah for reward! Don\'t hurt them tho"
            }
        }
    },
    [v8.XMAS_2025] = {
        ["name"] = "\226\157\132\239\184\143 Holiday Event 2025 \240\159\142\132",
        ["subtitle"] = "Event NPC",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://11815911253",
        ["endDate"] = 1767999600,
        ["npcCollectionTag"] = "EventNPC",
        ["lobbyButtonConfig"] = {
            ["icon"] = "rbxassetid://11838567073",
            ["bannerImage"] = "rbxassetid://11815911253"
        },
        ["npcConfig"] = {
            ["NpcName"] = "subzeroexpedition_marcel_big",
            ["NpcLookAtPlayer"] = true
        },
        ["currencies"] = {},
        ["startDate"] = v14.isProduction() and not v2:IsStudio() and 1764975600 or 1764630000,
        ["shops"] = {},
        ["checkInSystem"] = v12.XMAS_2025,
        ["missionGenerators"] = {
            {
                ["id"] = "event",
                ["name"] = "Event",
                ["layoutOrder"] = 2,
                ["selectAmount"] = #v18,
                ["pool"] = v18
            }
        }
    },
    [v8.LNY_2026] = {
        ["name"] = "Lunar New Year 2026",
        ["subtitle"] = "Event",
        ["active"] = false,
        ["navbarImage"] = "",
        ["endDate"] = 1773698400,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "",
        ["disableMissionsSort"] = true,
        ["lobbyButtonConfig"] = {
            ["bannerImage"] = "rbxassetid://100219891366707",
            ["backgroundGradient"] = ColorSequence.new(Color3.fromRGB(252, 222, 61), Color3.fromRGB(255, 18, 74))
        },
        ["npcConfig"] = {
            ["NpcName"] = "barbarian_dynasty_big"
        },
        ["currencies"] = { v7.LNY_2026_CURRENCY },
        ["startDate"] = (v14.isStaging() or v2:IsStudio()) and 1770023000 or 1771023600,
        ["shops"] = {
            {
                ["name"] = "LNY 2026 Event Shop",
                ["items"] = { v19.LNY_2026_ENVELOPE, v19.LNY_2026_ENVELOPE_2, v19.LNY_2026_ENVELOPE_3 }
            }
        },
        ["missionGenerators"] = {
            {
                ["id"] = "daily",
                ["name"] = "Daily",
                ["selectAmount"] = 3,
                ["layoutOrder"] = 1,
                ["resetTime"] = {
                    ["intervalSeconds"] = 86400
                },
                ["pool"] = v17
            }
        }
    },
    [v8.EGG_HUNT_2026] = {
        ["name"] = "Egg Hunt Event 2026",
        ["subtitle"] = "\240\159\165\154 Limited Time Event",
        ["active"] = false,
        ["navbarImage"] = "rbxassetid://106328808050239",
        ["endDate"] = 1778882400,
        ["npcCollectionTag"] = "EventNPC",
        ["missionPageDesc"] = "Collect eggs to earn rewards!",
        ["disableMissionsSort"] = true,
        ["npcConfig"] = {
            ["NpcName"] = "grim_reaper_easter"
        },
        ["lobbyButtonConfig"] = {
            ["icon"] = "rbxassetid://117694092872428",
            ["backgroundGradient"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 150, 174)),
                ColorSequenceKeypoint.new(0.25, Color3.fromRGB(159, 244, 223)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(246, 240, 163)),
                ColorSequenceKeypoint.new(0.75, Color3.fromRGB(107, 206, 238)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(217, 182, 253))
            })
        },
        ["currencies"] = {},
        ["startDate"] = (v2:IsStudio() or v14.isDevTesting()) and 1773701653 or 1775253600,
        ["shops"] = {},
        ["missionGenerators"] = {
            {
                ["id"] = "egg_hunt",
                ["name"] = "Egg Hunt",
                ["layoutOrder"] = 1,
                ["selectAmount"] = #v16,
                ["pool"] = v16
            }
        }
    }
}
return {
    ["EventMeta"] = v20
}