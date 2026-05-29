local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game-hud", "game-hud-widget").GameHudWidget
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-type").BedTeamUpgrade
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-type").TeamUpgrade
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-team-id").BlockHuntTeamId
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "hot-potato", "hot-potato-config").HotPotatoConfig
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "hot-potato", "hot-potato-team-id").HotPotatoTeamId
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-util").LassoWarsUtil
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelToggle
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-meta").KeyMeta
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-type").KeyType
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-mode").MatchDraftMode
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "place-id").PlaceId
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "queue-dodge", "queue-dodge-configs").QueueDodgePenaltyType
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "glicko-category")
local v21 = v20.GlickoCategory
local v22 = v20.GlickoCategoryType
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "og-environment").OG_ENVIRONMENT
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local v30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-assets").getMapAsset
local v31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-list")
local v32 = v31.JuggernautMaps
local v33 = v31.Maps
local v34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-type").MapType
local v35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u37 = {
    [v35.MINE_WARS] = {
        ["title"] = "Mine Wars",
        ["enableTeamCrates"] = true,
        ["disableRecalling"] = true,
        ["enableWormholeItem"] = true,
        ["noKits"] = true,
        ["disabled"] = false,
        ["queueFromPlaylistOnly"] = true,
        ["matchStartTime"] = 45,
        ["backgroundImageRender"] = { v30("MapMines_mw").Image },
        ["teams"] = {
            {
                ["id"] = "1",
                ["maxPlayers"] = 6,
                ["displayName"] = "Blue",
                ["colorHex"] = v36.lightBlue
            },
            {
                ["id"] = "2",
                ["maxPlayers"] = 6,
                ["displayName"] = "Orange",
                ["colorHex"] = v36.orange
            }
        },
        ["maps"] = v33[v34.MINE_WARS],
        ["queueSize"] = {
            ["min"] = 1,
            ["max"] = 6
        },
        ["placeId"] = v18.GAME,
        ["game"] = v29.MINE_WARS,
        ["glickoCategory"] = v21.NORMALS,
        ["teamGenSpeedMultipliers"] = {
            ["all"] = 0.7
        },
        ["bedwars"] = {
            ["reconnectEnabled"] = true
        },
        ["hudWidgets"] = { v4.BEDS }
    },
    [v35.ALL_RANDOM_KIT_TO4] = {
        ["title"] = "All Random Kit (Squads)",
        ["killBounties"] = true,
        ["disabled"] = true,
        ["hyperGenGamemode"] = true,
        ["matchStartTime"] = 45,
        ["helperIcons"] = {
            ["text"] = {
                { "\226\143\176", "Limited Time Mode" }
            }
        },
        ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
        ["description"] = {
            ["text"] = "Everyone plays with random kits!"
        },
        ["teams"] = {
            {
                ["id"] = "1",
                ["maxPlayers"] = 4,
                ["displayName"] = "Blue",
                ["colorHex"] = v36.lightBlue
            },
            {
                ["id"] = "2",
                ["maxPlayers"] = 4,
                ["displayName"] = "Orange",
                ["colorHex"] = v36.orange
            },
            {
                ["id"] = "3",
                ["maxPlayers"] = 4,
                ["displayName"] = "Pink",
                ["colorHex"] = v36.pink
            },
            {
                ["id"] = "4",
                ["maxPlayers"] = 4,
                ["displayName"] = "Yellow",
                ["colorHex"] = v36.yellow
            }
        },
        ["bedwars"] = {
            ["reconnectEnabled"] = true
        },
        ["maps"] = v33[v34.BEDWARS_SQUADS],
        ["queueSize"] = {
            ["min"] = 1,
            ["max"] = 4
        },
        ["placeId"] = v18.GAME,
        ["game"] = v29.BEDWARS,
        ["glickoCategory"] = v21.NORMALS,
        ["queueDodgeConfig"] = v19.RANKED
    },
    [v35.TOURNAMENT] = {
        ["title"] = "BedWars Tournament (5v5)",
        ["disabled"] = false,
        ["disableLimitedTimeItems"] = true,
        ["killBounties"] = true,
        ["disableInCustom"] = true,
        ["tournament"] = true,
        ["teams"] = {
            {
                ["id"] = "1",
                ["maxPlayers"] = 5,
                ["displayName"] = "Blue",
                ["colorHex"] = v36.lightBlue
            },
            {
                ["id"] = "2",
                ["maxPlayers"] = 5,
                ["displayName"] = "Orange",
                ["colorHex"] = v36.orange
            }
        },
        ["maps"] = v33[v34.BEDWARS_FIVE_VS_FIVE],
        ["queueSize"] = {
            ["min"] = 5,
            ["max"] = 5
        },
        ["placeId"] = v18.GAME,
        ["game"] = v29.BEDWARS,
        ["glickoCategory"] = v21.NORMALS,
        ["bedwars"] = {
            ["reconnectEnabled"] = true
        },
        ["matchValidator"] = {
            ["reqPlayersPerTeamPercentile"] = 0.7
        },
        ["queueDodgeConfig"] = v19.ALL_RANDOM_KIT,
        ["disabledFeatures"] = {
            ["disableTeamBuff"] = true
        }
    },
    [v35.LB_ONEBLOCK] = {
        ["title"] = "LuckyBlock Oneblock",
        ["disableLeaderboardProgression"] = true,
        ["noKits"] = true,
        ["disableRecalling"] = true,
        ["killBounties"] = false,
        ["enablePregameVoting"] = false,
        ["disableCharacterReset"] = false,
        ["disabled"] = false,
        ["queueFromPlaylistOnly"] = true,
        ["icon"] = v13.LUCKYBLOCK_RENDER,
        ["backgroundImageRender"] = { "rbxassetid://106419340539759" },
        ["description"] = {
            ["text"] = "Start on a single Lucky Block and break it to get random items! Use what you get to survive, fight, and grow stronger."
        },
        ["helperIcons"] = {
            ["text"] = {
                { "\226\143\176", "Limited Time Mode" }
            }
        },
        ["eventText"] = "\240\159\164\160 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
        ["teams"] = {
            {
                ["id"] = "1",
                ["maxPlayers"] = 1,
                ["displayName"] = "Blue",
                ["colorHex"] = v36.lightBlue
            },
            {
                ["id"] = "2",
                ["maxPlayers"] = 1,
                ["displayName"] = "Orange",
                ["colorHex"] = v36.orange
            },
            {
                ["id"] = "3",
                ["maxPlayers"] = 1,
                ["displayName"] = "Pink",
                ["colorHex"] = v36.pink
            },
            {
                ["id"] = "4",
                ["maxPlayers"] = 1,
                ["displayName"] = "Yellow",
                ["colorHex"] = v36.yellow
            }
        },
        ["matchStartTime"] = v3:IsStudio() and 5 or 30,
        ["maps"] = {
            {
                ["mapName"] = "lbob_Sky",
                ["weight"] = 1
            }
        },
        ["queueSize"] = {
            ["min"] = 1,
            ["max"] = 1
        },
        ["placeId"] = v18.GAME,
        ["game"] = v29.LB_ONEBLOCK,
        ["luckyBlock"] = {
            ["luckSystem"] = true
        },
        ["bedwars"] = {
            ["disableSpawnDenyRegion"] = true,
            ["disableGiveStarterItems"] = true
        },
        ["hudWidgets"] = { v4.BEDS },
        ["disabledFeatures"] = {
            ["disableDiamondGuardians"] = true,
            ["disableTitan"] = true,
            ["disableVoidInvasion"] = true,
            ["disableTeamBuff"] = true
        },
        ["customMatchConfig"] = {
            ["hostPanel"] = {
                ["disabledPanelTabs"] = {},
                ["disabledToggles"] = { v12.SpawnGuardians, v12.SpawnOres, v12.SpawnTitan }
            }
        }
    },
    [v35.LB_ONEBLOCK_TO2] = {
        ["title"] = "LuckyBlock Oneblock (Doubles)",
        ["disableLeaderboardProgression"] = true,
        ["noKits"] = true,
        ["disableRecalling"] = true,
        ["killBounties"] = false,
        ["enablePregameVoting"] = false,
        ["disableCharacterReset"] = false,
        ["disabled"] = false,
        ["queueFromPlaylistOnly"] = true,
        ["icon"] = v13.LUCKYBLOCK_RENDER,
        ["eventText"] = "\240\159\164\160 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
        ["backgroundImageRender"] = { "rbxassetid://106419340539759" },
        ["helperIcons"] = {
            ["text"] = {
                { "\226\143\176", "Limited Time Mode" },
                { "2\239\184\143\226\131\163", "Doubles" }
            }
        },
        ["teams"] = {
            {
                ["id"] = "1",
                ["maxPlayers"] = 2,
                ["displayName"] = "Blue",
                ["colorHex"] = v36.lightBlue
            },
            {
                ["id"] = "2",
                ["maxPlayers"] = 2,
                ["displayName"] = "Orange",
                ["colorHex"] = v36.orange
            },
            {
                ["id"] = "3",
                ["maxPlayers"] = 2,
                ["displayName"] = "Pink",
                ["colorHex"] = v36.pink
            },
            {
                ["id"] = "4",
                ["maxPlayers"] = 2,
                ["displayName"] = "Yellow",
                ["colorHex"] = v36.yellow
            }
        },
        ["matchStartTime"] = v3:IsStudio() and 5 or 30,
        ["maps"] = {
            {
                ["mapName"] = "lbob_to2_Sky",
                ["weight"] = 1
            }
        },
        ["queueSize"] = {
            ["min"] = 1,
            ["max"] = 2
        },
        ["placeId"] = v18.GAME,
        ["game"] = v29.LB_ONEBLOCK,
        ["luckyBlock"] = {
            ["luckSystem"] = true
        },
        ["bedwars"] = {
            ["disableSpawnDenyRegion"] = true,
            ["disableGiveStarterItems"] = true,
            ["reconnectEnabled"] = true
        },
        ["hudWidgets"] = { v4.BEDS },
        ["disabledFeatures"] = {
            ["disableDiamondGuardians"] = true,
            ["disableTitan"] = true,
            ["disableVoidInvasion"] = true,
            ["disableTeamBuff"] = true
        },
        ["customMatchConfig"] = {
            ["hostPanel"] = {
                ["disabledPanelTabs"] = {},
                ["disabledToggles"] = { v12.SpawnGuardians, v12.SpawnOres, v12.SpawnTitan }
            }
        }
    },
    [v35.PVP_ARENA] = {
        ["title"] = "Arena Duels",
        ["matchStartTime"] = 60,
        ["disabled"] = false,
        ["disableLeaderboardProgression"] = true,
        ["noKits"] = true,
        ["allowMultipleKits"] = true,
        ["defaultNoneKitProgression"] = true,
        ["disableRecalling"] = true,
        ["killBounties"] = false,
        ["enablePregameVoting"] = false,
        ["disableCharacterReset"] = false,
        ["enableBedwarsShopAnywhere"] = true,
        ["queueFromPlaylistOnly"] = true,
        ["icon"] = v13.PVP_ARENA_ICON,
        ["helperIcons"] = {
            ["text"] = {
                { "\226\143\176", "Limited Time Mode" }
            }
        },
        ["backgroundImageRender"] = { "rbxassetid://134675553681063" },
        ["eventText"] = "\240\159\164\160 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
        ["teams"] = {
            {
                ["id"] = "1",
                ["maxPlayers"] = 2,
                ["displayName"] = "Blue",
                ["colorHex"] = v36.lightBlue
            },
            {
                ["id"] = "2",
                ["maxPlayers"] = 2,
                ["displayName"] = "Orange",
                ["colorHex"] = v36.orange
            },
            {
                ["id"] = "3",
                ["maxPlayers"] = 2,
                ["displayName"] = "Pink",
                ["colorHex"] = v36.pink
            },
            {
                ["id"] = "4",
                ["maxPlayers"] = 2,
                ["displayName"] = "Yellow",
                ["colorHex"] = v36.yellow
            },
            {
                ["id"] = "5",
                ["maxPlayers"] = 2,
                ["displayName"] = "Brown",
                ["colorHex"] = v36.brown
            },
            {
                ["id"] = "6",
                ["maxPlayers"] = 2,
                ["displayName"] = "White",
                ["colorHex"] = v36.white
            },
            {
                ["id"] = "7",
                ["maxPlayers"] = 2,
                ["displayName"] = "Cyan",
                ["colorHex"] = v36.cyan
            },
            {
                ["id"] = "8",
                ["maxPlayers"] = 2,
                ["displayName"] = "Purple",
                ["colorHex"] = v36.purple
            }
        },
        ["maps"] = v33[v34.PVP_ARENA],
        ["queueSize"] = {
            ["min"] = 1,
            ["max"] = 2
        },
        ["placeId"] = v18.GAME,
        ["game"] = v29.PVP_ARENA,
        ["bedwars"] = {
            ["reconnectEnabled"] = true
        },
        ["disabledFeatures"] = {
            ["disableDiamondGuardians"] = true,
            ["disableTitan"] = true,
            ["disableVoidInvasion"] = true,
            ["disableTeamBuff"] = true
        },
        ["customMatchConfig"] = {
            ["hostPanel"] = {
                ["disabledPanelTabs"] = {},
                ["disabledToggles"] = { v12.SpawnGuardians, v12.SpawnOres, v12.SpawnTitan }
            }
        },
        ["hudWidgets"] = { v4.PVP_ARENA },
        ["glickoCategory"] = v22.PVP_ARENA,
        ["excludedStats"] = { v27.BEDBREAKS }
    },
    [v35.PVP_ARENA_SOLO] = {
        ["title"] = "Arena Solo",
        ["matchStartTime"] = 60,
        ["allowMultipleKits"] = true,
        ["defaultNoneKitProgression"] = true,
        ["disabled"] = true,
        ["disableLeaderboardProgression"] = true,
        ["noKits"] = true,
        ["disableRecalling"] = true,
        ["killBounties"] = false,
        ["enablePregameVoting"] = false,
        ["disableCharacterReset"] = false,
        ["enableBedwarsShopAnywhere"] = true,
        ["icon"] = v13.PVP_ARENA_ICON,
        ["backgroundImageRender"] = { "rbxassetid://134675553681063" },
        ["helperIcons"] = {
            ["text"] = {
                { "\226\143\176", "Limited Time Mode" }
            }
        },
        ["eventText"] = "\240\159\164\160 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
        ["teams"] = {
            {
                ["id"] = "1",
                ["maxPlayers"] = 1,
                ["displayName"] = "Blue",
                ["colorHex"] = v36.lightBlue
            },
            {
                ["id"] = "2",
                ["maxPlayers"] = 1,
                ["displayName"] = "Orange",
                ["colorHex"] = v36.orange
            },
            {
                ["id"] = "3",
                ["maxPlayers"] = 1,
                ["displayName"] = "Pink",
                ["colorHex"] = v36.pink
            },
            {
                ["id"] = "4",
                ["maxPlayers"] = 1,
                ["displayName"] = "Yellow",
                ["colorHex"] = v36.yellow
            },
            {
                ["id"] = "5",
                ["maxPlayers"] = 1,
                ["displayName"] = "Brown",
                ["colorHex"] = v36.brown
            },
            {
                ["id"] = "6",
                ["maxPlayers"] = 1,
                ["displayName"] = "White",
                ["colorHex"] = v36.white
            },
            {
                ["id"] = "7",
                ["maxPlayers"] = 1,
                ["displayName"] = "Cyan",
                ["colorHex"] = v36.cyan
            },
            {
                ["id"] = "8",
                ["maxPlayers"] = 1,
                ["displayName"] = "Purple",
                ["colorHex"] = v36.purple
            }
        },
        ["maps"] = v33[v34.PVP_ARENA],
        ["queueSize"] = {
            ["min"] = 1,
            ["max"] = 3
        },
        ["placeId"] = v18.GAME,
        ["game"] = v29.PVP_ARENA,
        ["disabledFeatures"] = {
            ["disableDiamondGuardians"] = true,
            ["disableTitan"] = true,
            ["disableVoidInvasion"] = true,
            ["disableTeamBuff"] = true
        },
        ["customMatchConfig"] = {
            ["hostPanel"] = {
                ["disabledPanelTabs"] = {},
                ["disabledToggles"] = { v12.SpawnGuardians, v12.SpawnOres, v12.SpawnTitan }
            }
        },
        ["hudWidgets"] = { v4.PVP_ARENA },
        ["glickoCategory"] = v22.PVP_ARENA,
        ["teamGenSpeedMultipliers"] = {
            ["diamond"] = 0.5
        },
        ["excludedStats"] = { v27.BEDBREAKS }
    }
}
local v38 = v35.HOT_POTATO
local v39 = {
    ["title"] = "Hot Potato",
    ["icon"] = "rbxassetid://11465631173",
    ["disableLeaderboardProgression"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disableDamageHighlight"] = true,
    ["disabled"] = true,
    ["queueFromPlaylistOnly"] = true,
    ["killBounties"] = false,
    ["disableRecalling"] = true,
    ["disableInCustom"] = false,
    ["disableCharacterReset"] = true,
    ["noKits"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\165\179 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\165\179",
    ["teams"] = {
        {
            ["maxPlayers"] = 16,
            ["displayName"] = "Cold",
            ["id"] = v9.COLD,
            ["colorHex"] = v36.lightBlue
        },
        {
            ["maxPlayers"] = 2,
            ["displayName"] = "Hot",
            ["id"] = v9.HOT,
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = {
        {
            ["mapName"] = "BH_Castle",
            ["weight"] = 0.5
        },
        {
            ["mapName"] = "HP_Plaza",
            ["weight"] = 1
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 10
    }
}
local v40 = v8.MAX_NUM_WINNERS <= 1 and "Man" or v8.MAX_NUM_WINNERS
v39.winConInfoHud = "Last " .. tostring(v40) .. " Standing"
v39.placeId = v18.GAME_MEGA
v39.game = v29.HOT_POTATO
v39.disabledFeatures = {
    ["disableEnchantTable"] = true,
    ["disableTitan"] = true,
    ["hideHpBar"] = true,
    ["disableVoidInvasion"] = true
}
v39.disabledMatchEndScreens = { 2 }
v39.customTeamMatching = {
    ["ignorePlayFabTeamMatching"] = true
}
u37[v38] = v39
u37[v35.BLOCK_HUNT] = {
    ["icon"] = "rbxassetid://14983595388",
    ["title"] = "Block Hunt",
    ["winConInfoHud"] = "Win at 8:45",
    ["disableLeaderboardProgression"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disabled"] = false,
    ["queueFromPlaylistOnly"] = true,
    ["killBounties"] = false,
    ["disableRecalling"] = true,
    ["disableInCustom"] = false,
    ["noKits"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["backgroundImageRender"] = { "rbxassetid://82093567667847" },
    ["description"] = {
        ["text"] = "Hiders disguise as blocks, seekers hunt them down! If a hider is killed, they join the seekers."
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\165\179 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\165\179",
    ["teams"] = {
        {
            ["maxPlayers"] = 20,
            ["displayName"] = "Hiders",
            ["id"] = v7.HIDERS,
            ["colorHex"] = v36.lightBlue
        },
        {
            ["maxPlayers"] = 2,
            ["displayName"] = "Hunter",
            ["id"] = v7.HUNTERS,
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.BLOCK_HUNT],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 22
    },
    ["placeId"] = v18.GAME_MEGA,
    ["game"] = v29.BLOCK_HUNT,
    ["disabledFeatures"] = {
        ["disableEnchantTable"] = true,
        ["disableTitan"] = true,
        ["hideHpBar"] = true,
        ["disableTeamBuff"] = true,
        ["disableVoidInvasion"] = true
    },
    ["disabledMatchEndScreens"] = {},
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    }
}
u37[v35.SANDBOX] = {
    ["title"] = "Sandbox",
    ["disableMatchStatsProgression"] = true,
    ["disabled"] = false,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 32,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 32,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 32,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 32,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = {
        {
            ["mapName"] = "to4_Sandbox",
            ["weight"] = 1
        }
    },
    ["placeId"] = v18.GAME_MEGA,
    ["game"] = v29.SANDBOX,
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 1
    }
}
u37[v35.BEDWARS_TEST] = {
    ["title"] = "BedWars (Testing)",
    ["disableInCustom"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disabled"] = true,
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>POPULAR!!</b></font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = {
        {
            ["mapName"] = "to4_Aztec",
            ["weight"] = 1
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["placeId"] = v18.GAME_MEGA,
    ["hudWidgets"] = { v4.BEDS },
    ["game"] = v29.BEDWARS
}
u37[v35.BEDWARS_TO1] = {
    ["title"] = "BedWars (Solo)",
    ["beginnerQueue"] = true,
    ["disableInCustom"] = true,
    ["killBounties"] = true,
    ["enablePregameVoting"] = false,
    ["backgroundImageRender"] = { "rbxassetid://106810557217677" },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 1,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 1,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 1,
            ["displayName"] = "Brown",
            ["colorHex"] = v36.brown
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 1,
            ["displayName"] = "White",
            ["colorHex"] = v36.white
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 1,
            ["displayName"] = "Cyan",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 1,
            ["displayName"] = "Purple",
            ["colorHex"] = v36.purple
        }
    },
    ["maps"] = v33[v34.BEDWARS_DOUBLES],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 1
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    },
    ["teamGenSpeedMultipliers"] = {
        ["diamond"] = 0.5
    }
}
u37[v35.BEDWARS_TO2] = {
    ["title"] = "BedWars (Doubles)",
    ["beginnerQueue"] = true,
    ["disabled"] = false,
    ["disabledMessage"] = "DISABLED",
    ["enablePregameVoting"] = false,
    ["killBounties"] = true,
    ["backgroundImageRender"] = { "rbxassetid://129883549487106" },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 2,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 2,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 2,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 2,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 2,
            ["displayName"] = "Brown",
            ["colorHex"] = v36.brown
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 2,
            ["displayName"] = "White",
            ["colorHex"] = v36.white
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 2,
            ["displayName"] = "Cyan",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 2,
            ["displayName"] = "Purple",
            ["colorHex"] = v36.purple
        }
    },
    ["maps"] = v33[v34.BEDWARS_DOUBLES],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 2
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    },
    ["teamGenSpeedMultipliers"] = {
        ["diamond"] = 0.5
    },
    ["revealEnemies"] = {
        ["revealTeamOnBedBreak"] = {
            ["enabled"] = true,
            ["delaySec"] = 60
        }
    }
}
u37[v35.BEDWARS_TO4] = {
    ["title"] = "BedWars (Squads)",
    ["beginnerQueue"] = true,
    ["killBounties"] = true,
    ["enablePregameVoting"] = true,
    ["backgroundImageRender"] = { "rbxassetid://100438919893865" },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>POPULAR!!</b></font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    },
    ["revealEnemies"] = {
        ["revealTeamOnBedBreak"] = {
            ["enabled"] = true,
            ["delaySec"] = 60
        }
    }
}
u37[v35.BEDWARS_20v20] = {
    ["title"] = "BedWars (30v30)",
    ["matchStartTime"] = 45,
    ["beginnerQueue"] = true,
    ["disabled"] = true,
    ["killBounties"] = true,
    ["backgroundImageRender"] = { "rbxassetid://134971692258285" },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcAqua) .. "\">FUN!</font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 16,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 16,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_THIRTY_VS_THIRTY],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 16
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME_MEGA,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 2
    },
    ["globalGenSpeedMultipliers"] = {
        ["diamond"] = 1.6,
        ["emerald"] = 2
    },
    ["revealEnemies"] = {
        ["revealTeamOnBedBreak"] = {
            ["enabled"] = true,
            ["delaySec"] = 60
        }
    }
}
u37[v35.BEDWARS_16v16] = {
    ["title"] = "BedWars (16v16)",
    ["matchStartTime"] = 40,
    ["beginnerQueue"] = true,
    ["disabled"] = false,
    ["killBounties"] = true,
    ["backgroundImageRender"] = { "rbxassetid://134971692258285" },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcAqua) .. "\">FUN!</font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 16,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 16,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_THIRTY_VS_THIRTY],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 16
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME_MEGA,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 2
    },
    ["globalGenSpeedMultipliers"] = {
        ["diamond"] = 1.6,
        ["emerald"] = 2
    }
}
u37[v35.BEDWARS_5v5] = {
    ["title"] = "BedWars (5v5)",
    ["disabled"] = false,
    ["disableLimitedTimeItems"] = true,
    ["killBounties"] = true,
    ["playerLevelReq"] = 3,
    ["backgroundImageRender"] = { "rbxassetid://121876634276082" },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_FIVE_VS_FIVE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["disabledFeatures"] = {
        ["disableTeamBuff"] = true
    },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    },
    ["drafting"] = {
        ["enabled"] = false,
        ["mode"] = v17.TWO_TEAMS
    },
    ["revealEnemies"] = {
        ["revealTeamOnBedBreak"] = {
            ["enabled"] = true,
            ["delaySec"] = 60
        }
    }
}
u37[v35.BEDWARS_20v20_LB] = {
    ["title"] = "Lucky Block (30v30)",
    ["beginnerQueue"] = true,
    ["disabled"] = true,
    ["killBounties"] = true,
    ["eventText"] = "\226\156\168 <font color=\"" .. v2.richTextColor(v25.mcAqua) .. "\">LIMITED TIME MODE!</font> \226\156\168",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 30,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 30,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.BEDWARS_THIRTY_VS_THIRTY],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 30
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME_MEGA,
    ["game"] = v29.BEDWARS,
    ["luckyBlock"] = {
        ["spawnLuckyblocks"] = true,
        ["luckSystem"] = true
    },
    ["glickoCategory"] = v21.LUCKY_BLOCK,
    ["hudWidgets"] = { v4.BEDS },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    },
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 2
    },
    ["globalGenSpeedMultipliers"] = {
        ["diamond"] = 1.6,
        ["emerald"] = 2
    }
}
u37[v35.BEDWARS_DISASTERS_20v20] = {
    ["title"] = "Disasters (30v30)",
    ["disasters"] = true,
    ["disabled"] = true,
    ["killBounties"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 30,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 30,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.BEDWARS_THIRTY_VS_THIRTY],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 30
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME_MEGA,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS }
}
u37[v35.BEDWARS_MEGA] = {
    ["icon"] = "rbxassetid://17096736589",
    ["title"] = "Bed Royale (48 PLAYERS)",
    ["disabled"] = false,
    ["killBounties"] = true,
    ["queueFromPlaylistOnly"] = true,
    ["matchStartTime"] = 45,
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">Doubles</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 2,
            ["displayName"] = "Blue Alpha",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 2,
            ["displayName"] = "Brown Alpha",
            ["colorHex"] = v36.brown
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 2,
            ["displayName"] = "Green Alpha",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 2,
            ["displayName"] = "Yellow Alpha",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 2,
            ["displayName"] = "Orange Alpha",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 2,
            ["displayName"] = "Pink Alpha",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 2,
            ["displayName"] = "Cyan Alpha",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 2,
            ["displayName"] = "Purple Alpha",
            ["colorHex"] = v36.purple
        },
        {
            ["id"] = "9",
            ["maxPlayers"] = 2,
            ["displayName"] = "Black Alpha",
            ["colorHex"] = v36.black
        },
        {
            ["id"] = "10",
            ["maxPlayers"] = 2,
            ["displayName"] = "Gray Alpha",
            ["colorHex"] = v36.gray
        },
        {
            ["id"] = "11",
            ["maxPlayers"] = 2,
            ["displayName"] = "Lime Alpha",
            ["colorHex"] = v36.lime
        },
        {
            ["id"] = "12",
            ["maxPlayers"] = 2,
            ["displayName"] = "White Alpha",
            ["colorHex"] = v36.white
        },
        {
            ["id"] = "13",
            ["maxPlayers"] = 2,
            ["displayName"] = "Blue Beta",
            ["colorHex"] = v36.lightBlue + 10
        },
        {
            ["id"] = "14",
            ["maxPlayers"] = 2,
            ["displayName"] = "Brown Beta",
            ["colorHex"] = v36.brown + 10
        },
        {
            ["id"] = "15",
            ["maxPlayers"] = 2,
            ["displayName"] = "Green Beta",
            ["colorHex"] = v36.green + 10
        },
        {
            ["id"] = "16",
            ["maxPlayers"] = 2,
            ["displayName"] = "Yellow Beta",
            ["colorHex"] = v36.yellow + 10
        },
        {
            ["id"] = "17",
            ["maxPlayers"] = 2,
            ["displayName"] = "Orange Beta",
            ["colorHex"] = v36.orange + 10
        },
        {
            ["id"] = "18",
            ["maxPlayers"] = 2,
            ["displayName"] = "Pink Beta",
            ["colorHex"] = v36.pink + 10
        },
        {
            ["id"] = "19",
            ["maxPlayers"] = 2,
            ["displayName"] = "Cyan Beta",
            ["colorHex"] = v36.cyan + 10
        },
        {
            ["id"] = "20",
            ["maxPlayers"] = 2,
            ["displayName"] = "Purple Beta",
            ["colorHex"] = v36.purple + 10
        },
        {
            ["id"] = "21",
            ["maxPlayers"] = 2,
            ["displayName"] = "Black Beta",
            ["colorHex"] = v36.black + 10
        },
        {
            ["id"] = "22",
            ["maxPlayers"] = 2,
            ["displayName"] = "Gray Beta",
            ["colorHex"] = v36.gray + 10
        },
        {
            ["id"] = "23",
            ["maxPlayers"] = 2,
            ["displayName"] = "Lime Beta",
            ["colorHex"] = v36.lime + 10
        },
        {
            ["id"] = "24",
            ["maxPlayers"] = 2,
            ["displayName"] = "White Beta",
            ["colorHex"] = v36.white + 10
        }
    },
    ["maps"] = v33[v34.ROYALE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 2
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true,
        ["options"] = {
            ["autoAssignPartiesToTeams"] = true
        }
    },
    ["placeId"] = v18.GAME_MEGA,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS }
}
u37[v35.BEDWARS_DUELS] = {
    ["title"] = "Duels (2v2)",
    ["disabled"] = false,
    ["killBounties"] = true,
    ["playerLevelReq"] = 3,
    ["backgroundImageRender"] = { "rbxassetid://130056555886499" },
    ["eventText"] = "\240\159\165\179 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\165\179",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 2,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 2,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_DUELS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 2
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["disabledFeatures"] = {
        ["disableBedPlating"] = true,
        ["disableTeamBuff"] = true
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.DUELS,
    ["hudWidgets"] = { v4.BEDS },
    ["globalGenSpeedMultipliers"] = {
        ["all"] = 2
    }
}
u37[v35.BEDWARS_LUCKY_BLOCK] = {
    ["title"] = "Lucky Block (Squads)",
    ["beginnerQueue"] = true,
    ["enablePregameVoting"] = true,
    ["killBounties"] = true,
    ["backgroundImageRender"] = { "rbxassetid://92611813545645", "rbxassetid://102782644484939" },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["luckyBlock"] = {
        ["spawnLuckyblocks"] = true,
        ["luckSystem"] = true
    },
    ["glickoCategory"] = v21.LUCKY_BLOCK,
    ["hudWidgets"] = { v4.BEDS },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    },
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 1.25
    },
    ["revealEnemies"] = {
        ["revealTeamOnBedBreak"] = {
            ["enabled"] = true,
            ["delaySec"] = 60
        }
    }
}
u37[v35.BEDWARS_LUCKY_BLOCK_TO2] = {
    ["title"] = "Lucky Block (Doubles)",
    ["beginnerQueue"] = true,
    ["killBounties"] = true,
    ["backgroundImageRender"] = { "rbxassetid://81605931792750" },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 2,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 2,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 2,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 2,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 2,
            ["displayName"] = "Brown",
            ["colorHex"] = v36.brown
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 2,
            ["displayName"] = "White",
            ["colorHex"] = v36.white
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 2,
            ["displayName"] = "Cyan",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 2,
            ["displayName"] = "Purple",
            ["colorHex"] = v36.purple
        }
    },
    ["maps"] = v33[v34.BEDWARS_DOUBLES],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 2
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["luckyBlock"] = {
        ["spawnLuckyblocks"] = true,
        ["luckSystem"] = true
    },
    ["glickoCategory"] = v21.LUCKY_BLOCK,
    ["hudWidgets"] = { v4.BEDS },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    },
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 1.25
    },
    ["revealEnemies"] = {
        ["revealTeamOnBedBreak"] = {
            ["enabled"] = true,
            ["delaySec"] = 60
        }
    }
}
u37[v35.BEDWARS_RANKED_BETA] = {
    ["title"] = "Ranked Beta (Squads)",
    ["eventText"] = "BETA SEASON",
    ["disableInCustom"] = true,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Green",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["glickoCategory"] = v21.RANKED_BETA,
    ["rankCategory"] = v23.RANKED_BETA,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED,
    ["disabledFeatures"] = {
        ["disableTeamBuff"] = true
    }
}
u37[v35.BEDWARS_RANKED_S4] = {
    ["title"] = "Ranked S4 (Squads)",
    ["eventText"] = "SEASON 4",
    ["disableInCustom"] = true,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Green",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["glickoCategory"] = v21.RANKED_S4,
    ["rankCategory"] = v23.RANKED_S4,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED,
    ["disabledFeatures"] = {
        ["disableTeamBuff"] = true
    }
}
u37[v35.BEDWARS_RANKED_S5] = {
    ["title"] = "Ranked S5 (Squads)",
    ["eventText"] = "SEASON 5",
    ["disableInCustom"] = true,
    ["minWinReq"] = 100,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Green",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["glickoCategory"] = v21.RANKED_S5,
    ["rankCategory"] = v23.RANKED_S5,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
u37[v35.BEDWARS_RANKED_S6] = {
    ["title"] = "Ranked S6 (Squads)",
    ["eventText"] = "SEASON 6",
    ["disableInCustom"] = true,
    ["minWinReq"] = 100,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Green",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["glickoCategory"] = v21.RANKED_S6,
    ["rankCategory"] = v23.RANKED_S6,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
u37[v35.BEDWARS_RANKED_S7] = {
    ["title"] = "Ranked S7 (5v5)",
    ["eventText"] = "SEASON 7",
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 10,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["killBounties"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.BEDWARS_FIVE_VS_FIVE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["glickoCategory"] = v21.RANKED_S7,
    ["rankCategory"] = v23.RANKED_S7,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
u37[v35.BEDWARS_RANKED_S8] = {
    ["title"] = "Ranked S8 (5v5)",
    ["eventText"] = "Season 8 (ENDED)",
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 10,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["killBounties"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.BEDWARS_FIVE_VS_FIVE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["glickoCategory"] = v21.RANKED_S8,
    ["rankCategory"] = v23.RANKED_S8,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
u37[v35.BEDWARS_RANKED_S9] = {
    ["title"] = "Ranked S9 (5v5)",
    ["eventText"] = "Season 9",
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 10,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["killBounties"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_FIVE_VS_FIVE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["glickoCategory"] = v21.RANKED_S9,
    ["rankCategory"] = v23.RANKED_S9,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
u37[v35.BEDWARS_RANKED_S10] = {
    ["title"] = "Ranked S10 (Squads)",
    ["eventText"] = "Season 10",
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 10,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["killBounties"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["glickoCategory"] = v21.RANKED_S10,
    ["rankCategory"] = v23.RANKED_S10,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
u37[v35.BEDWARS_RANKED_S11] = {
    ["title"] = "Ranked S11 (5v5)",
    ["eventText"] = "Season 11",
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 10,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["killBounties"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_FIVE_VS_FIVE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["glickoCategory"] = v21.RANKED_S11,
    ["rankCategory"] = v23.RANKED_S11,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
u37[v35.BEDWARS_RANKED_S12] = {
    ["title"] = "Ranked S12 (5v5)",
    ["eventText"] = "Season 12",
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 20,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["killBounties"] = true,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_FIVE_VS_FIVE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["glickoCategory"] = v21.RANKED_S12,
    ["rankCategory"] = v23.RANKED_S12,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED,
    ["disabledFeatures"] = {
        ["disableTeamBuff"] = true
    }
}
u37[v35.BEDWARS_RANKED_S13] = {
    ["title"] = "Ranked S13 (5v5)",
    ["eventText"] = "Season 13",
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 20,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["killBounties"] = true,
    ["backgroundImageRender"] = { "rbxassetid://120045062120974" },
    ["helperIcons"] = {
        ["text"] = {
            { "\240\159\143\134", "End-of-season rewards for players ranked Gold or higher" },
            { "\226\132\185\239\184\143", "Player Level 20 Required" }
        }
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = {
        {
            ["mapName"] = "to5_Crystalmount",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Champions-Valley",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Sanctuary",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Desert-Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Citadel-Towers",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Elder-Woods",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Stone-Fortress",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Blossom",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Winter-Forest",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Desert-Oasis",
            ["weight"] = 1
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["glickoCategory"] = v21.RANKED_S13,
    ["rankCategory"] = v23.RANKED_S13,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS },
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED,
    ["disabledFeatures"] = {
        ["disableTeamBuff"] = true
    },
    ["drafting"] = {
        ["enabled"] = true,
        ["mode"] = v17.TWO_TEAMS
    }
}
u37[v35.BEDWARS_RANKED_S14] = {
    ["title"] = "Ranked S14 (5v5)",
    ["eventText"] = "Season 14",
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 20,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = false,
    ["killBounties"] = true,
    ["lobbyDelaySecs"] = 40,
    ["backgroundImageRender"] = { "rbxassetid://120045062120974" },
    ["helperIcons"] = {
        ["text"] = {
            { "\240\159\143\134", "End-of-season rewards for players ranked Gold or higher" },
            { "\226\132\185\239\184\143", "Player Level 20 Required" }
        }
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = {
        {
            ["mapName"] = "to5_Crystalmount",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Desert-Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Citadel-Towers",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Elder-Woods",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Stone-Fortress",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Winter-Forest",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Winter-Forest",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Farmland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Volatile",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Sanctuary-Winter",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Champions-Valley-Winter",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Blossom-Winter",
            ["weight"] = 1
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["glickoCategory"] = v21.RANKED_S14,
    ["rankCategory"] = v23.RANKED_S14,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS },
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED,
    ["disabledFeatures"] = {
        ["disableTeamBuff"] = true
    },
    ["drafting"] = {
        ["enabled"] = true,
        ["mode"] = v17.TWO_TEAMS
    }
}
u37[v35.BEDWARS_RANKED_S15] = {
    ["title"] = "Ranked S15 (Squads)",
    ["eventText"] = "Season 15",
    ["endTime"] = 1778223600,
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 20,
    ["partyGlickoFunction"] = "max",
    ["disabled"] = true,
    ["killBounties"] = true,
    ["lobbyDelaySecs"] = 40,
    ["enableAntiTeaming"] = true,
    ["backgroundImageRender"] = { "rbxassetid://120045062120974" },
    ["helperIcons"] = {
        ["text"] = {
            { "\240\159\143\134", "End-of-season rewards for players ranked Gold or higher" },
            { "\226\132\185\239\184\143", "Player Level 20 Required" }
        }
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = {},
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["glickoCategory"] = v21.RANKED_S15,
    ["rankCategory"] = v23.RANKED_S15,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS },
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.75
    },
    ["queueDodgeConfig"] = v19.RANKED,
    ["disabledFeatures"] = {
        ["disableTeamBuff"] = true,
        ["disableMajorWeatherEvents"] = true
    },
    ["drafting"] = {
        ["enabled"] = true,
        ["mode"] = v17.MULTI_TEAM
    },
    ["blockDecay"] = {
        ["enabled"] = true
    }
}
u37[v35.BEDWARS_RANKED_S16] = {
    ["title"] = "Ranked S16 (5v5)",
    ["eventText"] = "Season 16",
    ["endTime"] = 1787349600,
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 20,
    ["partyGlickoFunction"] = "mean",
    ["disabled"] = false,
    ["killBounties"] = true,
    ["bedInvulnerabilityDuration"] = 30,
    ["lobbyDelaySecs"] = 40,
    ["backgroundImageRender"] = { "rbxassetid://120045062120974" },
    ["helperIcons"] = {
        ["text"] = {
            { "\240\159\143\134", "End-of-season rewards for players ranked Gold or higher" },
            { "\226\132\185\239\184\143", "Player Level 20 Required" }
        }
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_RANKED_S16],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["glickoCategory"] = v21.RANKED_S16,
    ["rankCategory"] = v23.RANKED_S16,
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS },
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED,
    ["disabledFeatures"] = {
        ["disableTeamBuff"] = true,
        ["disableMajorWeatherEvents"] = true
    },
    ["drafting"] = {
        ["enabled"] = true,
        ["mode"] = v17.TWO_TEAMS
    },
    ["blockDecay"] = {
        ["enabled"] = true
    }
}
u37[v35.BEDWARS_VOICE_CHAT] = {
    ["title"] = "BedWars Voice Chat (Squads)",
    ["eventText"] = "\240\159\148\138 VOICE CHAT ONLY \240\159\148\138",
    ["voiceChatOnly"] = true,
    ["enablePregameVoting"] = true,
    ["killBounties"] = true,
    ["backgroundImageRender"] = { "rbxassetid://100438919893865" },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["game"] = v29.BEDWARS,
    ["placeId"] = v18.GAME,
    ["hudWidgets"] = { v4.BEDS }
}
u37[v35.INFECTED] = {
    ["title"] = "\226\154\160 Infected \226\154\160",
    ["defaultTeamId"] = "1",
    ["disableLeaderboardProgression"] = true,
    ["disableMatchStatsProgression"] = true,
    ["winConInfoHud"] = "Win at 10:00",
    ["disableRecalling"] = true,
    ["disabled"] = false,
    ["queueFromPlaylistOnly"] = true,
    ["icon"] = v13.SUPER_INFECTED_RENDER,
    ["backgroundImageRender"] = { "rbxassetid://108057088235530" },
    ["description"] = {
        ["text"] = "Survivors vs. Infected! Infected choose from 3 classes and try to wipe out the survivors. Last team standing wins!"
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\167\159\226\128\141\226\153\128\239\184\143 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\167\159\226\128\141\226\153\130\239\184\143",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 24,
            ["displayName"] = "Humans",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 0,
            ["displayName"] = "Infected",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.INFECTED],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 24
    },
    ["game"] = v29.INFECTED,
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME_MEGA,
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 2
    },
    ["globalGenSpeedMultipliers"] = {
        ["diamond"] = 1.6,
        ["emerald"] = 2
    },
    ["disabledFeatures"] = {
        ["disableVoidInvasion"] = true
    }
}
u37[v35.SKYWARS_TO2] = {
    ["title"] = "SkyWars (Doubles)",
    ["disabled"] = false,
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["autoQueue"] = false,
    ["disableLeaderboardProgression"] = true,
    ["disableSummer2025TreasureMap"] = true,
    ["backgroundImageRender"] = { "rbxassetid://92564229561424" },
    ["description"] = {
        ["text"] = "Team up in pairs and fight to be the last duo standing on floating islands!"
    },
    ["eventText"] = "\226\154\148\239\184\143 <font color=\"" .. v2.richTextColor(v25.mcRed) .. "\">FAST PACED!</font> \226\154\148\239\184\143",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 2,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 2,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 2,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 2,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 2,
            ["displayName"] = "Brown",
            ["colorHex"] = v36.brown
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 2,
            ["displayName"] = "White",
            ["colorHex"] = v36.white
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 2,
            ["displayName"] = "Cyan",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 2,
            ["displayName"] = "Purple",
            ["colorHex"] = v36.purple
        },
        {
            ["id"] = "9",
            ["maxPlayers"] = 2,
            ["displayName"] = "Black",
            ["colorHex"] = v36.black
        },
        {
            ["id"] = "10",
            ["maxPlayers"] = 2,
            ["displayName"] = "Gray",
            ["colorHex"] = v36.gray
        },
        {
            ["id"] = "11",
            ["maxPlayers"] = 2,
            ["displayName"] = "Lime",
            ["colorHex"] = v36.lime
        },
        {
            ["id"] = "12",
            ["maxPlayers"] = 2,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.SKYWARS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 2
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["game"] = v29.SKYWARS,
    ["hudWidgets"] = { v4.ALIVE_PLAYERS },
    ["placeId"] = v18.GAME,
    ["glickoCategory"] = v22.SKYWARS,
    ["teamGenSpeedMultipliers"] = {
        ["diamond"] = 0.5
    },
    ["disabledFeatures"] = {
        ["disableVoidInvasion"] = true
    },
    ["revealEnemies"] = {
        ["globalRevealOnPlayerPercent"] = {
            ["enabled"] = true,
            ["percent"] = 0.20833333333333334
        }
    }
}
u37[v35.SKYWARS_TO4] = {
    ["title"] = "SkyWars (Squads)",
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["disabled"] = true,
    ["disableLeaderboardProgression"] = true,
    ["disableSummer2025TreasureMap"] = true,
    ["eventText"] = "\226\154\148\239\184\143 <font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\">FAST PACED!</font> \226\154\148\239\184\143",
    ["description"] = {
        ["text"] = "Battle on floating islands with your team of four. Last team standing wins!"
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Brown",
            ["colorHex"] = v36.brown
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "White",
            ["colorHex"] = v36.white
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 4,
            ["displayName"] = "Cyan",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 4,
            ["displayName"] = "Purple",
            ["colorHex"] = v36.purple
        }
    },
    ["maps"] = v33[v34.SKYWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["game"] = v29.SKYWARS,
    ["hudWidgets"] = { v4.ALIVE_PLAYERS },
    ["placeId"] = v18.GAME,
    ["glickoCategory"] = v22.SKYWARS,
    ["disabledFeatures"] = {
        ["disableVoidInvasion"] = true
    },
    ["revealEnemies"] = {
        ["globalRevealOnPlayerPercent"] = {
            ["enabled"] = true,
            ["percent"] = 0.3333333333333333
        }
    }
}
u37[v35.SURVIVAL] = {
    ["title"] = "Penguin Survival",
    ["disabled"] = true,
    ["noKits"] = false,
    ["disableLeaderboardProgression"] = true,
    ["disableMatchStatsProgression"] = true,
    ["winConInfoHud"] = "Win at Wave 10",
    ["enableTeamCrates"] = true,
    ["backgroundImageRender"] = { "rbxassetid://117972427459556" },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\144\167 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">Limited Time Event!</font> \240\159\144\167",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Alive",
            ["colorHex"] = v36.lightBlue
        }
    },
    ["maps"] = v33[v34.PVE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["game"] = v29.SURVIVAL,
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME,
    ["disableInCustom"] = not v26.isStaging(),
    ["globalGenSpeedMultipliers"] = {
        ["diamond"] = 0.4,
        ["emerald"] = 0.5
    },
    ["disabledBedTeamUpgrades"] = { v5.BED_ALARM, v5.BED_SHIELD }
}
u37[v35.JUGGERNAUT_TDM] = {
    ["title"] = "Juggernaut TDM",
    ["winConInfoHud"] = "Ends in 10:00!",
    ["disableInCustom"] = true,
    ["disabled"] = true,
    ["eventText"] = "\240\159\154\168 <font color=\"" .. v2.richTextColor(v25.mcRed) .. "\">LIMITED TIME MODE!</font> \240\159\154\168",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 30,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 30,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v32.jugg_ffa,
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 8
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME_MEGA,
    ["game"] = v29.JUGGERNAUT,
    ["hudWidgets"] = { v4.SCORE },
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 1.6
    },
    ["excludedStats"] = { v27.BEDBREAKS }
}
u37[v35.BEDWARS_DISASTERS_TO4] = {
    ["title"] = "Disasters (Squads)",
    ["disasters"] = true,
    ["disabled"] = true,
    ["killBounties"] = true,
    ["description"] = {
        ["text"] = "Survive random disasters while battling other players. Stay alive and win!"
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\148\165 <font color=\"" .. v2.richTextColor(v25.mcRed) .. "\">LIMITED TIME MODE!</font> \240\159\148\165",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS }
}
u37[v35.FLAG_CAPTURE] = {
    ["title"] = "Capture the Flag",
    ["noKits"] = false,
    ["winConInfoHud"] = "Ends at 15:00",
    ["disabled"] = true,
    ["killBounties"] = true,
    ["enableTeamCrates"] = true,
    ["eventText"] = "\240\159\154\168 <font color=\"" .. v2.richTextColor(v25.mcRed) .. "\">LIMITED TIME MODE!</font> \240\159\154\168",
    ["description"] = {
        ["text"] = "Protect your own flag and capture the enemy\226\128\153s flag 3 times to win."
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 12,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 12,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.FLAG_CAPTURE_MAP_TYPE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 12
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.FLAG_CAPTURE,
    ["hudWidgets"] = {},
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 2
    },
    ["globalGenSpeedMultipliers"] = {
        ["diamond"] = 1.6,
        ["emerald"] = 2
    },
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableVoidInvasion"] = true
    },
    ["excludedStats"] = { v27.BEDBREAKS }
}
u37[v35.GUN_GAME] = {
    ["title"] = "Gun Game",
    ["noKits"] = true,
    ["autoQueue"] = false,
    ["disableRecalling"] = true,
    ["disabled"] = false,
    ["queueFromPlaylistOnly"] = true,
    ["icon"] = v13.KNIFE_RAIN,
    ["backgroundImageRender"] = { "rbxassetid://96674239265252" },
    ["description"] = {
        ["text"] = "Start with a weapon and swap your weapon by getting kills. Be the first to reach 15 kills to win!"
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\148\165 <font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>LIMITED TIME MODE!</b></font> \240\159\148\165",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue Alpha",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 1,
            ["displayName"] = "Red Alpha",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 1,
            ["displayName"] = "Green Alpha",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 1,
            ["displayName"] = "Yellow Alpha",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange Alpha",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 1,
            ["displayName"] = "Pink Alpha",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 1,
            ["displayName"] = "Cyan Alpha",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 1,
            ["displayName"] = "Purple Alpha",
            ["colorHex"] = v36.purple
        },
        {
            ["id"] = "9",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue Beta",
            ["colorHex"] = v36.lightBlue + 10
        },
        {
            ["id"] = "10",
            ["maxPlayers"] = 1,
            ["displayName"] = "Red Beta",
            ["colorHex"] = v36.red + 10
        },
        {
            ["id"] = "11",
            ["maxPlayers"] = 1,
            ["displayName"] = "Green Beta",
            ["colorHex"] = v36.green + 10
        },
        {
            ["id"] = "12",
            ["maxPlayers"] = 1,
            ["displayName"] = "Yellow Beta",
            ["colorHex"] = v36.yellow + 10
        }
    },
    ["maps"] = v33[v34.GUN_GAME],
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 6
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.GUN_GAME,
    ["hudWidgets"] = {},
    ["disabledFeatures"] = {
        ["disableVoidInvasion"] = true
    },
    ["excludedStats"] = { v27.BEDBREAKS }
}
u37[v35.JUGGERNAUT_V2] = {
    ["title"] = "Juggernaut",
    ["noKits"] = true,
    ["winConInfoHud"] = "First to 20 Kills",
    ["autoQueue"] = false,
    ["disabled"] = true,
    ["disableDamageHighlight"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\148\165 <font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>LIMITED TIME MODE!</b></font> \240\159\148\165",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 16,
            ["displayName"] = "Players",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 0,
            ["displayName"] = "Juggernaut",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.JUGGERNAUT_FFA],
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 12
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.JUGGERNAUT_V2,
    ["hudWidgets"] = {},
    ["excludedStats"] = { v27.BEDBREAKS }
}
u37[v35.MURDER_GAME] = {
    ["noKits"] = true,
    ["autoQueue"] = false,
    ["disabled"] = true,
    ["disableDamageHighlight"] = true,
    ["disableRecalling"] = true,
    ["disableKillFeed"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableLeaderboardProgression"] = true,
    ["disableMatchStatsProgression"] = true,
    ["enableFriendlyFire"] = true,
    ["disableKillEffects"] = true,
    ["disableTablistStats"] = true,
    ["title"] = v11.GAME_NAME,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\148\165 <font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>LIMITED TIME MODE!</b></font> \240\159\148\165",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 12,
            ["displayName"] = "Innocent",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 0,
            ["displayName"] = "Murderer",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.MURDER_GAME],
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 10
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.MURDERER_GAME,
    ["hudWidgets"] = {},
    ["disabledMatchEndScreens"] = { 2 }
}
u37[v35.MURDER_GAME_VC] = {
    ["eventText"] = "\240\159\148\138 VOICE CHAT ONLY \240\159\148\138",
    ["noKits"] = true,
    ["voiceChatOnly"] = true,
    ["autoQueue"] = false,
    ["disabled"] = true,
    ["disableDamageHighlight"] = true,
    ["disableRecalling"] = true,
    ["disableKillFeed"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableLeaderboardProgression"] = true,
    ["disableMatchStatsProgression"] = true,
    ["enableFriendlyFire"] = true,
    ["disableKillEffects"] = true,
    ["disableTablistStats"] = true,
    ["title"] = v11.GAME_NAME .. " (Voice Chat)",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 12,
            ["displayName"] = "Innocent",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 0,
            ["displayName"] = "Murderer",
            ["colorHex"] = v36.red
        }
    },
    ["maps"] = v33[v34.MURDER_GAME],
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 12
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.MURDERER_GAME,
    ["hudWidgets"] = {},
    ["disabledMatchEndScreens"] = { 2 }
}
u37[v35.ROYALE] = {
    ["title"] = "Battle Royale",
    ["disableInCustom"] = true,
    ["disableLeaderboardProgression"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disabled"] = true,
    ["eventText"] = "\240\159\154\167 <font color=\"" .. v2.richTextColor(v25.mcAqua) .. "\">PUBLIC BETA!</font> \240\159\154\167",
    ["teams"] = {},
    ["maps"] = {},
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.ROYALE,
    ["game"] = v29.BEDWARS
}
u37[v35.TNT_WARS] = {
    ["title"] = "TNT Wars",
    ["noKits"] = true,
    ["disabled"] = false,
    ["killBounties"] = true,
    ["queueFromPlaylistOnly"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\148\165 <font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>LIMITED TIME MODE!</b></font> \240\159\148\165",
    ["placeId"] = v18.GAME,
    ["game"] = v29.TNT_WARS,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 8,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 8,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.TNT_WARS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 8
    },
    ["hudWidgets"] = {},
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableEnchantTable"] = true,
        ["disableVoidInvasion"] = true
    },
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 1.2
    },
    ["globalGenSpeedMultipliers"] = {
        ["emerald"] = 1.2
    }
}
u37[v35.WINTER_EVENT] = {
    ["title"] = "Minigame Mountain",
    ["noKits"] = true,
    ["disabled"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disableSpectatePlatform"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableFreecam"] = true,
    ["disableRecalling"] = true,
    ["disableEmotes"] = true,
    ["lobbyDelaySecs"] = 60,
    ["backgroundImageRender"] = { "rbxassetid://127277946591392", "rbxassetid://11847964691", "rbxassetid://11847878245" },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcAqua) .. "\">Fun!</font>",
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" },
            { "\240\159\142\129", "Free Kit For Winning!" }
        }
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.WINTER_EVENT,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Green",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 4,
            ["displayName"] = "Cyan",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 4,
            ["displayName"] = "Purple",
            ["colorHex"] = v36.purple
        }
    },
    ["maps"] = {},
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["disableInCustom"] = not v26.isStaging(),
    ["scene"] = { v24.WINTER_MINIGAME_MOUNTAIN },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["hudWidgets"] = {},
    ["disabledFeatures"] = {
        ["disableVoidInvasion"] = true,
        ["disableEnchantTable"] = true,
        ["disableTitan"] = true,
        ["disableBedPlating"] = true,
        ["disableDiamondGuardians"] = true,
        ["disableGenerators"] = true,
        ["disableGoldenGoose"] = true
    },
    ["bedwars"] = {
        ["disableGiveStarterItems"] = true
    }
}
u37[v35.SKULL_DROP] = {
    ["title"] = "Skull Drop",
    ["disabled"] = false,
    ["queueFromPlaylistOnly"] = true,
    ["killBounties"] = false,
    ["disableBlockPlace"] = true,
    ["disableMatchStatsProgression"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableKillEffects"] = true,
    ["disableRecalling"] = true,
    ["noKits"] = true,
    ["backgroundImageRender"] = { "rbxassetid://96674239265252" },
    ["description"] = {
        ["text"] = "Collect skulls and loot to upgrade your gear. The most skulls wins!"
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue Alpha",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 1,
            ["displayName"] = "White Alpha",
            ["colorHex"] = v36.white
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 1,
            ["displayName"] = "Brown Alpha",
            ["colorHex"] = v36.brown
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 1,
            ["displayName"] = "Yellow Alpha",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange Alpha",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 1,
            ["displayName"] = "Pink Alpha",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 1,
            ["displayName"] = "Cyan Alpha",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 1,
            ["displayName"] = "Purple Alpha",
            ["colorHex"] = v36.purple
        },
        {
            ["id"] = "9",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue Beta",
            ["colorHex"] = v36.lightBlue + 10
        },
        {
            ["id"] = "10",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange Beta",
            ["colorHex"] = v36.orange + 10
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 10
    },
    ["maps"] = {
        {
            ["mapName"] = "BH_Castle",
            ["weight"] = 1
        }
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME_MEGA,
    ["game"] = v29.SKULL_DROP,
    ["glickoCategory"] = v21.NORMALS,
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableEnchantTable"] = true
    }
}
u37[v35.SKYWARS_ROYALE] = {
    ["title"] = "SkyWars Royale (Trios)",
    ["matchStartTime"] = 60,
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["killBounties"] = false,
    ["autoQueue"] = false,
    ["disableLeaderboardProgression"] = true,
    ["disabled"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\148\165 <font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\">50 PLAYER ROYALE</font> \240\159\148\165",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 3,
            ["displayName"] = "Blue Alpha",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 3,
            ["displayName"] = "Red Alpha",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 3,
            ["displayName"] = "Green Alpha",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 3,
            ["displayName"] = "Yellow Alpha",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 3,
            ["displayName"] = "Orange Alpha",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 3,
            ["displayName"] = "Pink Alpha",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 3,
            ["displayName"] = "Cyan Alpha",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 3,
            ["displayName"] = "Purple Alpha",
            ["colorHex"] = v36.purple
        },
        {
            ["id"] = "9",
            ["maxPlayers"] = 3,
            ["displayName"] = "Blue Beta",
            ["colorHex"] = v36.lightBlue + 10
        },
        {
            ["id"] = "10",
            ["maxPlayers"] = 3,
            ["displayName"] = "Red Beta",
            ["colorHex"] = v36.red + 10
        },
        {
            ["id"] = "11",
            ["maxPlayers"] = 3,
            ["displayName"] = "Green Beta",
            ["colorHex"] = v36.green + 10
        },
        {
            ["id"] = "12",
            ["maxPlayers"] = 3,
            ["displayName"] = "Yellow Beta",
            ["colorHex"] = v36.yellow + 10
        },
        {
            ["id"] = "13",
            ["maxPlayers"] = 3,
            ["displayName"] = "Orange Beta",
            ["colorHex"] = v36.orange + 10
        },
        {
            ["id"] = "14",
            ["maxPlayers"] = 3,
            ["displayName"] = "Pink Beta",
            ["colorHex"] = v36.pink + 10
        },
        {
            ["id"] = "15",
            ["maxPlayers"] = 3,
            ["displayName"] = "Cyan Beta",
            ["colorHex"] = v36.cyan + 10
        },
        {
            ["id"] = "16",
            ["maxPlayers"] = 3,
            ["displayName"] = "Purple Beta",
            ["colorHex"] = v36.purple + 10
        },
        {
            ["id"] = "17",
            ["maxPlayers"] = 3,
            ["displayName"] = "Blue Charlie",
            ["colorHex"] = v36.lightBlue + 20
        },
        {
            ["id"] = "18",
            ["maxPlayers"] = 3,
            ["displayName"] = "Red Charlie",
            ["colorHex"] = v36.red + 20
        },
        {
            ["id"] = "19",
            ["maxPlayers"] = 3,
            ["displayName"] = "Green Charlie",
            ["colorHex"] = v36.green + 20
        },
        {
            ["id"] = "20",
            ["maxPlayers"] = 3,
            ["displayName"] = "Yellow Charlie",
            ["colorHex"] = v36.yellow + 20
        },
        {
            ["id"] = "21",
            ["maxPlayers"] = 3,
            ["displayName"] = "Orange Charlie",
            ["colorHex"] = v36.orange + 20
        },
        {
            ["id"] = "22",
            ["maxPlayers"] = 3,
            ["displayName"] = "Pink Charlie",
            ["colorHex"] = v36.pink + 20
        },
        {
            ["id"] = "23",
            ["maxPlayers"] = 3,
            ["displayName"] = "Cyan Charlie",
            ["colorHex"] = v36.cyan + 20
        },
        {
            ["id"] = "24",
            ["maxPlayers"] = 3,
            ["displayName"] = "Purple Charlie",
            ["colorHex"] = v36.purple + 20
        }
    },
    ["maps"] = v33[v34.SKYWARS_ROYALE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 3
    },
    ["game"] = v29.SKYWARS,
    ["hudWidgets"] = { v4.ALIVE_PLAYERS },
    ["placeId"] = v18.GAME_MEGA,
    ["glickoCategory"] = v22.SKYWARS,
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    }
}
u37[v35.HYPER_GEN_TO4] = {
    ["title"] = "Hyper Gen (Squads)",
    ["killBounties"] = true,
    ["hyperGenGamemode"] = true,
    ["disabled"] = true,
    ["icon"] = v13.DIAMOND,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["backgroundImageRender"] = { "rbxassetid://121053693249106" },
    ["description"] = {
        ["text"] = "Fast, intense classic squads with nonstop action!"
    },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>Fast!</b></font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 1.66
    },
    ["globalGenSpeedMultipliers"] = {
        ["all"] = 1.33
    }
}
u37[v35.ALL_SAME_KIT_TO4] = {
    ["title"] = "All Same Kit (Squads)",
    ["killBounties"] = true,
    ["disabled"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["description"] = {
        ["text"] = "Everyone plays with the same kit\226\128\148equal gear, equal chance!"
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS }
}
u37[v35.BEDWARS_OG_TO4] = {
    ["title"] = "OG BedWars",
    ["killBounties"] = false,
    ["disabled"] = false,
    ["queueFromPlaylistOnly"] = true,
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["ogTeamUpgradeOverride"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\240\159\155\143\239\184\143", "Old School" },
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGold) .. "\"><b>OG!</b></font>",
    ["description"] = {
        ["text"] = "Classic 2021 BedWars gameplay\226\128\148nostalgia and pure fun!"
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Red",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Green",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.OG_BEDWARS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["hudWidgets"] = { v4.BEDS },
    ["disabledFeatures"] = {
        ["disableEnchantTable"] = true,
        ["disableTitan"] = true,
        ["hideHpBar"] = true,
        ["disableVoidInvasion"] = true,
        ["disableTeamBuff"] = true,
        ["disableBedPlating"] = true,
        ["disableDiamondGuardians"] = true,
        ["disableBedTeamUpgrades"] = true
    },
    ["environment"] = v28
}
u37[v35.BEDWARS_NB4] = {
    ["icon"] = "rbxassetid://7884372987",
    ["title"] = "No-Build BedWars (Squads)",
    ["killBounties"] = true,
    ["autoBedDefense"] = true,
    ["disabled"] = false,
    ["queueFromPlaylistOnly"] = true,
    ["backgroundImageRender"] = { "rbxassetid://111694224335424" },
    ["description"] = {
        ["text"] = "No building allowed! Fight with classic squad BedWars rules \226\128\148 just without blocks."
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_NO_BUILD_4],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["teamGenSpeedMultipliers"] = {
        ["all"] = 1.25
    }
}
u37[v35.WINSTREAK_1v1] = {
    ["title"] = "Winstreak (1v1)",
    ["disabled"] = false,
    ["killBounties"] = true,
    ["playerLevelReq"] = 3,
    ["backgroundImageRender"] = { "rbxassetid://102769417497339" },
    ["eventText"] = "\240\159\165\179 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\165\179",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_DUELS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 1
    },
    ["disabledFeatures"] = {
        ["disableBedPlating"] = true,
        ["disableVoidInvasion"] = true
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS },
    ["glickoCategory"] = v21.DUELS,
    ["teamGenSpeedMultipliers"] = {
        ["diamond"] = 0.5
    }
}
u37[v35.BRIDGE_DUEL] = {
    ["title"] = "Bridge Battle (1v1)",
    ["disabled"] = false,
    ["disableLeaderboardProgression"] = true,
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["killBounties"] = false,
    ["disableCharacterReset"] = true,
    ["queueFromPlaylistOnly"] = true,
    ["icon"] = v13.CROSSED_SWORDS,
    ["backgroundImageRender"] = { "rbxassetid://136159158029468" },
    ["description"] = {
        ["text"] = "Duel on a narrow bridge and be the last one standing!"
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BRIDGE_DUEL],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 1
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.BRIDGE_DUEL,
    ["glickoCategory"] = v21.BRIDGE_DUELS,
    ["hudWidgets"] = { v4.BRIDGE_DUEL_SCORE },
    ["disabledFeatures"] = {
        ["disableEnchantTable"] = true,
        ["disableTitan"] = true,
        ["disableVoidInvasion"] = true,
        ["disableTeamBuff"] = true
    },
    ["teamGenSpeedMultipliers"] = {
        ["diamond"] = 0.5
    },
    ["excludedStats"] = { v27.BEDBREAKS }
}
u37[v35.BRIDGE_DUEL_TO2] = {
    ["title"] = "Bridge Battle (2v2)",
    ["disabled"] = false,
    ["queueFromPlaylistOnly"] = true,
    ["disableLeaderboardProgression"] = true,
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["killBounties"] = false,
    ["disableCharacterReset"] = true,
    ["backgroundImageRender"] = { "rbxassetid://136159158029468" },
    ["description"] = {
        ["text"] = "Team up and duel on a narrow bridge and be the last team standing!"
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 2,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 2,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BRIDGE_DUEL],
    ["queueSize"] = {
        ["min"] = 2,
        ["max"] = 2
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.BRIDGE_DUEL,
    ["glickoCategory"] = v21.BRIDGE_DUELS,
    ["hudWidgets"] = { v4.BRIDGE_DUEL_SCORE },
    ["disabledFeatures"] = {
        ["disableEnchantTable"] = true,
        ["disableTitan"] = true,
        ["disableVoidInvasion"] = true,
        ["disableTeamBuff"] = true
    },
    ["excludedStats"] = { v27.BEDBREAKS }
}
u37[v35.CAPTURE_POINTS] = {
    ["title"] = "Domination",
    ["noKits"] = false,
    ["winConInfoHud"] = "First team get 2500 pts Wins",
    ["disabled"] = false,
    ["queueFromPlaylistOnly"] = true,
    ["killBounties"] = false,
    ["disableLeaderboardProgression"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableKillEffects"] = true,
    ["disableRecalling"] = false,
    ["disableLimitedTimeItems"] = true,
    ["icon"] = v13.CROSSED_SWORDS,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\154\168 <font color=\"" .. v2.richTextColor(v25.mcRed) .. "\">LIMITED TIME MODE!</font> \240\159\154\168",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 8,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 8,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.DOMINATION_MAP_TYPE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 8
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.CAPTURE_THE_POINTS,
    ["hudWidgets"] = {},
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableEnchantTable"] = true,
        ["disableVoidInvasion"] = true
    },
    ["excludedStats"] = { v27.BEDBREAKS }
}
u37[v35.ONE_IN_THE_CHAMBER] = {
    ["title"] = "One In The Chamber",
    ["icon"] = "rbxassetid://13421692306",
    ["disabled"] = false,
    ["killBounties"] = false,
    ["disableBlockPlace"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disableLeaderboardProgression"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableKillEffects"] = true,
    ["disableRecalling"] = true,
    ["noKits"] = true,
    ["disableCharacterReset"] = true,
    ["queueFromPlaylistOnly"] = true,
    ["description"] = {
        ["text"] = "One arrow, one shot! Miss and use your sword\226\128\148get a kill to earn another. Most points wins!"
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue Alpha",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 1,
            ["displayName"] = "Red Alpha",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 1,
            ["displayName"] = "Green Alpha",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 1,
            ["displayName"] = "Yellow Alpha",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange Alpha",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 1,
            ["displayName"] = "Pink Alpha",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 1,
            ["displayName"] = "Cyan Alpha",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 1,
            ["displayName"] = "Purple Alpha",
            ["colorHex"] = v36.purple
        },
        {
            ["id"] = "9",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue Beta",
            ["colorHex"] = v36.lightBlue + 10
        },
        {
            ["id"] = "10",
            ["maxPlayers"] = 1,
            ["displayName"] = "Red Beta",
            ["colorHex"] = v36.red + 10
        },
        {
            ["id"] = "11",
            ["maxPlayers"] = 1,
            ["displayName"] = "Green Beta",
            ["colorHex"] = v36.green + 10
        },
        {
            ["id"] = "12",
            ["maxPlayers"] = 1,
            ["displayName"] = "Yellow Beta",
            ["colorHex"] = v36.yellow + 10
        },
        {
            ["id"] = "13",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange Beta",
            ["colorHex"] = v36.orange + 10
        },
        {
            ["id"] = "14",
            ["maxPlayers"] = 1,
            ["displayName"] = "Pink Beta",
            ["colorHex"] = v36.pink + 10
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["maps"] = {
        {
            ["mapName"] = "BH_Castle",
            ["weight"] = 0.6
        },
        {
            ["mapName"] = "chamber_Ruins",
            ["weight"] = 0.4
        }
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.ONE_IN_THE_CHAMBER,
    ["glickoCategory"] = v21.NORMALS,
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableEnchantTable"] = true,
        ["disableVoidInvasion"] = true
    }
}
u37[v35.BEDWARS_CLAN_WAR_TO10] = {
    ["title"] = "BedWars Clan War [BETA] (10v10)",
    ["disabled"] = true,
    ["disableLimitedTimeItems"] = true,
    ["killBounties"] = true,
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 10,
    ["clanWar"] = true,
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>Clan War [BETA]</b></font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["displayName"] = "Blue",
            ["maxPlayers"] = v26.isStaging() and 1 or 10,
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["displayName"] = "Orange",
            ["maxPlayers"] = v26.isStaging() and 1 or 10,
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_THIRTY_VS_THIRTY],
    ["queueSize"] = {
        ["min"] = 10,
        ["max"] = 10
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS },
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
local v41 = v35.BEDWARS_CLAN_WAR_TO8
local v42 = {
    ["title"] = "BedWars Clan War [BETA] (8v8)",
    ["disabled"] = true,
    ["disableLimitedTimeItems"] = true,
    ["killBounties"] = true,
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 10,
    ["clanWar"] = true,
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>Clan War [BETA]</b></font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["displayName"] = "Blue",
            ["maxPlayers"] = v26.isStaging() and 1 or 8,
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["displayName"] = "Orange",
            ["maxPlayers"] = v26.isStaging() and 1 or 8,
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.BEDWARS_THIRTY_VS_THIRTY],
    ["queueSize"] = {
        ["min"] = 8,
        ["max"] = 8
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS },
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
u37[v41] = v42
u37[v35.BEDWARS_CLAN_WAR_TO4] = {
    ["title"] = "BedWars Clan War",
    ["disabled"] = false,
    ["disableLimitedTimeItems"] = true,
    ["killBounties"] = true,
    ["disableInCustom"] = true,
    ["playerLevelReq"] = 10,
    ["clanWar"] = true,
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>Clan War!</b></font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["displayName"] = "Blue",
            ["maxPlayers"] = v26.isStaging() and 1 or 4,
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["displayName"] = "Orange",
            ["maxPlayers"] = v26.isStaging() and 1 or 4,
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = {
        {
            ["mapName"] = "to30_Fortress",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Reservoir",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Ships-Ahoy",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Pagoda",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Rabbits-Field",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Castle",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Campsite",
            ["weight"] = 1
        }
    },
    ["queueSize"] = {
        ["min"] = 4,
        ["max"] = 4
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.BEDWARS,
    ["hudWidgets"] = { v4.BEDS },
    ["matchValidator"] = {
        ["reqPlayersPerTeamPercentile"] = 0.7
    },
    ["queueDodgeConfig"] = v19.RANKED
}
u37[v35.TRAINING_ROOM] = {
    ["title"] = "Training Room",
    ["disabled"] = false,
    ["killBounties"] = false,
    ["disableMatchStatsProgression"] = true,
    ["disableLeaderboardProgression"] = true,
    ["disableMissionProgress"] = true,
    ["disableMatchXpProgress"] = true,
    ["disableTablistStats"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableKillEffects"] = true,
    ["disableRecalling"] = true,
    ["disableTeamEventCollectable"] = true,
    ["disableSummer2025TreasureMap"] = true,
    ["disableGlobalTeamTimedGoals"] = true,
    ["disableCharacterReset"] = true,
    ["matchStartTime"] = 4,
    ["enableKitChangeDuringMatch"] = true,
    ["allowUnownedKits"] = true,
    ["backgroundImageRender"] = { "rbxassetid://91979046711373" },
    ["description"] = {
        ["text"] = "Test weapons, build faster, and improve your aim with no pressure. Perfect for warming up or getting better.",
        ["overridePlayMenuDescription"] = true
    },
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcGold) .. "\">TRAINING AREA!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 1
    },
    ["maps"] = {
        {
            ["mapName"] = "tr_Range",
            ["weight"] = 1
        }
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.TRAINING_ROOM,
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableEnchantTable"] = true,
        ["disableVoidInvasion"] = true
    }
}
u37[v35.BEGINNER_TUTORIAL] = {
    ["title"] = "Beginner Tutorial",
    ["disableInCustom"] = true,
    ["killBounties"] = false,
    ["disableMissionProgress"] = true,
    ["disableKillEffects"] = true,
    ["disableTeamEventCollectable"] = true,
    ["disableGlobalTeamTimedGoals"] = true,
    ["disableSummer2025TreasureMap"] = true,
    ["disableSpectatePlatform"] = true,
    ["enablePregameVoting"] = false,
    ["disableMatchStatsProgression"] = true,
    ["disableLeaderboardProgression"] = true,
    ["disableMatchXpProgress"] = true,
    ["disableTablistStats"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["noKits"] = true,
    ["beginnerQueue"] = true,
    ["backgroundImageRender"] = { "rbxassetid://99405334317804" },
    ["description"] = {
        ["text"] = "Learn how to gather items, protect your bed, and fight other players. It\226\128\153s a quick and easy way to get started before jumping into real matches.",
        ["overridePlayMenuDescription"] = true
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = {
        {
            ["mapName"] = "tutorial_Academy",
            ["weight"] = 1
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 1
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.BEDWARS,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableEnchantTable"] = true,
        ["disableVoidInvasion"] = true,
        ["disablePassiveWeatherEffects"] = true,
        ["disableMajorWeatherEvents"] = true
    },
    ["disabledMatchEndScreens"] = {
        2,
        4,
        5,
        3,
        6
    }
}
u37[v35.EGG_HUNT] = {
    ["title"] = "Egg Hunt - THE HUNT!",
    ["disabled"] = true,
    ["killBounties"] = false,
    ["disableMissionProgress"] = false,
    ["disableBlockPlace"] = false,
    ["disableMatchStatsProgression"] = true,
    ["disableLeaderboardProgression"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableKillEffects"] = true,
    ["disableRecalling"] = true,
    ["noKits"] = true,
    ["disableCharacterReset"] = true,
    ["disableInCustom"] = true,
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 8,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 8,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 8
    },
    ["maps"] = v33[v34.EGG_HUNT],
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.EGG_HUNT,
    ["glickoCategory"] = v21.NORMALS,
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableEnchantTable"] = true,
        ["disableGenerators"] = true,
        ["disableVoidInvasion"] = true
    }
}
local v43 = v35.LASSO_WARS
local v44 = {
    ["icon"] = "rbxassetid://9155462968",
    ["title"] = "Lasso Wars",
    ["disabled"] = false,
    ["disableLeaderboardProgression"] = true,
    ["noKits"] = true,
    ["disableRecalling"] = false,
    ["killBounties"] = false,
    ["disableCharacterReset"] = true,
    ["queueFromPlaylistOnly"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\164\160 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 5,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 5,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["maps"] = v33[v34.LASSO_WARS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 5
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.LASSO_WARS
}
local v45 = v10.WIN_AMOUNT
v44.winConInfoHud = "First team to " .. tostring(v45) .. " Kills"
v44.disabledFeatures = {
    ["disableEnchantTable"] = true,
    ["disableTitan"] = true,
    ["disableGenerators"] = true,
    ["disableVoidInvasion"] = true
}
v44.excludedStats = { v27.BEDBREAKS }
u37[v43] = v44
u37[v35.FAST_CASUAL] = {
    ["title"] = "Quick Play",
    ["disabled"] = true,
    ["disableLeaderboardProgression"] = true,
    ["noKits"] = false,
    ["disableRecalling"] = false,
    ["killBounties"] = false,
    ["disableCharacterReset"] = false,
    ["matchStartTime"] = 5,
    ["disableGeneratorWhenTeamIsEliminated"] = true,
    ["enablePregameVoting"] = false,
    ["enableTeamCrates"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\143\131\226\128\141\226\153\130\239\184\143 <font color=\"" .. v2.richTextColor(v25.mcPink) .. "\">LIMITED TIME MODE!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.FAST_CASUAL,
    ["globalGenSpeedMultipliers"] = {
        ["diamond"] = 2,
        ["emerald"] = 1.5
    },
    ["bedwars"] = {
        ["firstSpawnItems"] = {
            { v14.MULTI_BREAK_TOOL, 1 }
        },
        ["respawnItems"] = {
            { v14.MULTI_BREAK_TOOL, 1 }
        }
    },
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableDiamondGuardians"] = true,
        ["disableVoidInvasion"] = true
    },
    ["ltmCustomConfigs"] = {
        ["deathMatchStartTime"] = 600
    }
}
u37[v35.BATTLE_ROYALE] = {
    ["title"] = "Battle Royale (Trios)",
    ["matchStartTime"] = 60,
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["killBounties"] = false,
    ["autoQueue"] = false,
    ["disabled"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "\240\159\148\165 <font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\">45 PLAYER ROYALE</font> \240\159\148\165",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 3,
            ["displayName"] = "Blue Alpha",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 3,
            ["displayName"] = "Red Alpha",
            ["colorHex"] = v36.red
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 3,
            ["displayName"] = "Green Alpha",
            ["colorHex"] = v36.green
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 3,
            ["displayName"] = "Yellow Alpha",
            ["colorHex"] = v36.yellow
        },
        {
            ["id"] = "5",
            ["maxPlayers"] = 3,
            ["displayName"] = "Orange Alpha",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "6",
            ["maxPlayers"] = 3,
            ["displayName"] = "Pink Alpha",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "7",
            ["maxPlayers"] = 3,
            ["displayName"] = "Cyan Alpha",
            ["colorHex"] = v36.cyan
        },
        {
            ["id"] = "8",
            ["maxPlayers"] = 3,
            ["displayName"] = "Purple Alpha",
            ["colorHex"] = v36.purple
        },
        {
            ["id"] = "9",
            ["maxPlayers"] = 3,
            ["displayName"] = "Blue Beta",
            ["colorHex"] = v36.lightBlue + 10
        },
        {
            ["id"] = "10",
            ["maxPlayers"] = 3,
            ["displayName"] = "Red Beta",
            ["colorHex"] = v36.red + 10
        },
        {
            ["id"] = "11",
            ["maxPlayers"] = 3,
            ["displayName"] = "Green Beta",
            ["colorHex"] = v36.green + 10
        },
        {
            ["id"] = "12",
            ["maxPlayers"] = 3,
            ["displayName"] = "Yellow Beta",
            ["colorHex"] = v36.yellow + 10
        },
        {
            ["id"] = "13",
            ["maxPlayers"] = 3,
            ["displayName"] = "Orange Beta",
            ["colorHex"] = v36.orange + 10
        },
        {
            ["id"] = "14",
            ["maxPlayers"] = 3,
            ["displayName"] = "Pink Beta",
            ["colorHex"] = v36.pink + 10
        },
        {
            ["id"] = "15",
            ["maxPlayers"] = 3,
            ["displayName"] = "Cyan Beta",
            ["colorHex"] = v36.cyan + 10
        }
    },
    ["maps"] = v33[v34.BED_ROYALE],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 3
    },
    ["game"] = v29.BATTLE_ROYALE,
    ["hudWidgets"] = { v4.ALIVE_PLAYERS },
    ["placeId"] = v18.GAME_MEGA,
    ["glickoCategory"] = v22.SKYWARS,
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["disabledFeatures"] = {
        ["disableHealthRegen"] = true,
        ["disableVoidInvasion"] = true
    },
    ["excludedStats"] = { v27.BEDBREAKS }
}
local v46 = v35.HALLOWEEN_EVENT
local v47 = {
    ["title"] = "Marrow\'s Madness",
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["disabled"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disableSpectatePlatform"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableFreecam"] = true,
    ["skipMatchStartEvent"] = true,
    ["lobbyDelaySecs"] = 60,
    ["backgroundImageRender"] = { v13.SKELETON_KIT_RENDER },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" },
            { "\240\159\148\145", "Requires 1 " .. v15[v16.HALLOWEEN_LTM].name }
        }
    },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcAqua) .. "\">FREE KIT!</font>",
    ["placeId"] = v18.GAME,
    ["game"] = v29.HALLOWEEN_EVENT,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Explorers",
            ["colorHex"] = v36.lightBlue
        }
    },
    ["maps"] = {},
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["hudWidgets"] = {},
    ["disableInCustom"] = not v26.isStaging(),
    ["disabledFeatures"] = {
        ["disableEnchantTable"] = true,
        ["disableTitan"] = true,
        ["hideHpBar"] = true
    },
    ["requiredKeys"] = {
        {
            ["amount"] = 1,
            ["partyLeaderOnly"] = true,
            ["keyType"] = v16.HALLOWEEN_LTM
        }
    }
}
local v48
if v3:IsStudio() then
    v48 = { v24.SKELETON_BOSS }
else
    v48 = { v24.HALLOWEEN_GRAVEYARD, v24.HALLOWEEN_GRAVEYARD_2023 }
end
v47.scene = v48
v47.customTeamMatching = {
    ["ignorePlayFabTeamMatching"] = true
}
v47.disabledMatchEndScreens = { 1 }
u37[v46] = v47
u37[v35.HALLOWEEN_2023_EVENT] = {
    ["title"] = "Crypt\'s Coven",
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["disabled"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disableSpectatePlatform"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableFreecam"] = true,
    ["skipMatchStartEvent"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" },
            { "\240\159\148\145", "Requires 1 " .. v15[v16.HALLOWEEN_LTM].name }
        }
    },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcAqua) .. "\">FREE KIT!</font>",
    ["placeId"] = v18.GAME,
    ["game"] = v29.HALLOWEEN_EVENT,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Explorers",
            ["colorHex"] = v36.lightBlue
        }
    },
    ["maps"] = {},
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["hudWidgets"] = {},
    ["disableInCustom"] = not v26.isStaging(),
    ["disabledFeatures"] = {
        ["disableEnchantTable"] = true,
        ["disableTitan"] = true,
        ["hideHpBar"] = true
    },
    ["requiredKeys"] = {
        {
            ["amount"] = 1,
            ["partyLeaderOnly"] = true,
            ["keyType"] = v16.HALLOWEEN_LTM
        }
    },
    ["scene"] = { v24.HALLOWEEN_GRAVEYARD_2023 },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    }
}
local v49 = v35.HALLOWEEN_2024_EVENT
local v50 = {
    ["title"] = "Arachne\'s Lair",
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["disabled"] = true,
    ["disableInCustom"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disableSpectatePlatform"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableFreecam"] = true,
    ["skipMatchStartEvent"] = true,
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" },
            { "\240\159\148\145", "Requires 1 " .. v15[v16.HALLOWEEN_LTM].name }
        }
    },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcAqua) .. "\">Spooky!</font>",
    ["placeId"] = v18.GAME,
    ["game"] = v29.HALLOWEEN_2024_EVENT,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Explorers",
            ["colorHex"] = v36.lightBlue
        }
    },
    ["maps"] = {},
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["hudWidgets"] = {},
    ["disabledFeatures"] = {
        ["disableEnchantTable"] = true,
        ["disableTitan"] = true,
        ["disableBedPlating"] = true,
        ["disableDiamondGuardians"] = true,
        ["disableGenerators"] = true,
        ["disableVoidInvasion"] = true
    },
    ["requiredKeys"] = {
        {
            ["amount"] = 1,
            ["partyLeaderOnly"] = true,
            ["keyType"] = v16.HALLOWEEN_LTM
        }
    }
}
local v51 = {}
local v52
if v3:IsStudio() then
    v52 = v24.HALLOWEEN_2024_STAGE_1
else
    v52 = v24.HALLOWEEN_2024_STAGE_1
end
__set_list(v51, 1, {v52})
v50.scene = v51
v50.customTeamMatching = {
    ["ignorePlayFabTeamMatching"] = true
}
u37[v49] = v50
u37[v35.COMBINED_KIT_TO4] = {
    ["title"] = "Kit Fusion (Squads)",
    ["matchStartTime"] = 45,
    ["killBounties"] = true,
    ["allowMultipleKits"] = true,
    ["enableTeamCrates"] = true,
    ["disabled"] = false,
    ["backgroundImageRender"] = { "rbxassetid://81103063432393" },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>POPULAR!!</b></font>",
    ["description"] = {
        ["text"] = "Choose two kits instead of one. Mix and match kit abilities, items, and mechanics to discover cool synergies and overpowered combos. Have fun and break the game!"
    },
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.COMBINED_KIT,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    }
}
u37[v35.CUSTOM_KIT] = {
    ["title"] = "Custom Kit (Squads)",
    ["matchStartTime"] = 45,
    ["killBounties"] = true,
    ["allowMultipleKits"] = true,
    ["enableTeamCrates"] = true,
    ["disabled"] = true,
    ["backgroundImageRender"] = {},
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>POPULAR!!</b></font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.CUSTOM_KIT,
    ["glickoCategory"] = v21.NORMALS,
    ["hudWidgets"] = { v4.BEDS },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    }
}
u37[v35.CUSTOM_KIT_CREATION] = {
    ["title"] = "Custom Kit Creator",
    ["disabled"] = true,
    ["killBounties"] = false,
    ["disableMatchStatsProgression"] = true,
    ["disableLeaderboardProgression"] = true,
    ["disableMissionProgress"] = true,
    ["disableMatchXpProgress"] = true,
    ["disableTablistStats"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableKillEffects"] = true,
    ["disableRecalling"] = true,
    ["disableTeamEventCollectable"] = true,
    ["disableSummer2025TreasureMap"] = true,
    ["disableGlobalTeamTimedGoals"] = true,
    ["disableCharacterReset"] = true,
    ["matchStartTime"] = 4,
    ["enableKitChangeDuringMatch"] = true,
    ["allowUnownedKits"] = true,
    ["backgroundImageRender"] = {},
    ["description"] = {
        ["text"] = "Create and customize your own kit for the Custom Kit LTM!",
        ["overridePlayMenuDescription"] = true
    },
    ["eventText"] = "\240\159\154\128 <font color=\"" .. v2.richTextColor(v25.mcGold) .. "\">Custom Kit Creator!</font> \240\159\154\128",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 1,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 1,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        }
    },
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 1
    },
    ["maps"] = {
        {
            ["mapName"] = "tr_Range",
            ["weight"] = 1
        }
    },
    ["customTeamMatching"] = {
        ["ignorePlayFabTeamMatching"] = true
    },
    ["placeId"] = v18.GAME_MICRO,
    ["game"] = v29.CUSTOM_KIT_CREATOR,
    ["disabledFeatures"] = {
        ["disableTitan"] = true,
        ["disableEnchantTable"] = true,
        ["disableVoidInvasion"] = true
    }
}
local v53 = v35.HALLOWEEN_2025_EVENT_PVE
local v54 = {
    ["title"] = "Arachne\'s Lair",
    ["noKits"] = true,
    ["disableRecalling"] = true,
    ["disabled"] = true,
    ["disableInCustom"] = true,
    ["disableMatchStatsProgression"] = true,
    ["disableSpectatePlatform"] = true,
    ["ignoreBoundaryDamage"] = true,
    ["disableFreecam"] = true,
    ["skipMatchStartEvent"] = true,
    ["backgroundImageRender"] = { v13.SPIDER_QUEEN_ICON },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" },
            { "\240\159\148\145", "Requires 1 " .. v15[v16.HALLOWEEN_LTM].name }
        }
    },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcAqua) .. "\">Spooky!</font>",
    ["placeId"] = v18.GAME,
    ["game"] = v29.HALLOWEEN_2025_EVENT_PVE,
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Explorers",
            ["colorHex"] = v36.lightBlue
        }
    },
    ["maps"] = {},
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["hudWidgets"] = {},
    ["disabledFeatures"] = {
        ["disableEnchantTable"] = true,
        ["disableTitan"] = true,
        ["disableBedPlating"] = true,
        ["disableDiamondGuardians"] = true,
        ["disableGenerators"] = true,
        ["disableVoidInvasion"] = true
    },
    ["requiredKeys"] = {
        {
            ["amount"] = 1,
            ["partyLeaderOnly"] = true,
            ["keyType"] = v16.HALLOWEEN_LTM
        }
    }
}
local v55 = {}
local v56
if v3:IsStudio() then
    v56 = v24.HALLOWEEN_2024_STAGE_1
else
    v56 = v24.HALLOWEEN_2024_STAGE_1
end
__set_list(v55, 1, {v56})
v54.scene = v55
v54.customTeamMatching = {
    ["ignorePlayFabTeamMatching"] = true
}
u37[v53] = v54
u37[v35.OVERPOWERED] = {
    ["title"] = "Hyper Kits (Squads)",
    ["disableMatchStatsProgression"] = true,
    ["enablePregameVoting"] = true,
    ["respawnTimerMultiplier"] = 0.7,
    ["enableTeamCrates"] = true,
    ["backgroundImageRender"] = { "rbxassetid://108585132377529" },
    ["description"] = {
        ["text"] = "EVERYTHING is faster and overpowered! Item and abilities recharge super quick for nonstop action in this chaotic mode!"
    },
    ["eventText"] = "<font color=\"" .. v2.richTextColor(v25.mcGreen) .. "\"><b>POPULAR!!</b></font>",
    ["teams"] = {
        {
            ["id"] = "1",
            ["maxPlayers"] = 4,
            ["displayName"] = "Blue",
            ["colorHex"] = v36.lightBlue
        },
        {
            ["id"] = "2",
            ["maxPlayers"] = 4,
            ["displayName"] = "Orange",
            ["colorHex"] = v36.orange
        },
        {
            ["id"] = "3",
            ["maxPlayers"] = 4,
            ["displayName"] = "Pink",
            ["colorHex"] = v36.pink
        },
        {
            ["id"] = "4",
            ["maxPlayers"] = 4,
            ["displayName"] = "Yellow",
            ["colorHex"] = v36.yellow
        }
    },
    ["maps"] = v33[v34.BEDWARS_SQUADS],
    ["queueSize"] = {
        ["min"] = 1,
        ["max"] = 4
    },
    ["bedwars"] = {
        ["reconnectEnabled"] = true,
        ["firstSpawnItems"] = {
            { v14.MULTI_BREAK_TOOL, 1 }
        },
        ["respawnItems"] = {
            { v14.MULTI_BREAK_TOOL, 1 }
        },
        ["disableSpecificStarterItems"] = { v14.WOOD_PICKAXE, v14.WOOD_AXE, v14.SHEARS }
    },
    ["placeId"] = v18.GAME,
    ["game"] = v29.OVERPOWERED,
    ["hudWidgets"] = { v4.BEDS },
    ["playfabMatchMakingRules"] = {
        ["partyLevel"] = true
    },
    ["oreBlockOverrides"] = {
        ["initialSpawnCount"] = 4,
        ["spawnInterval"] = 120,
        ["diamondChances"] = {
            { 3, 0.3 },
            { 480, 0.6 },
            { 780, 0.8 }
        },
        ["emeraldChances"] = {
            { 3, 0.25 },
            { 480, 0.5 },
            { 780, 0.7 }
        }
    },
    ["eventTimeOverrides"] = {
        ["diamondGuardians"] = { 60, 180, 360 },
        ["titan"] = {
            ["initialSpawnTime"] = 360,
            ["timeBetweenSpawns"] = 180
        }
    },
    ["shopPriceModifiers"] = {
        ["roundingMethod"] = "down",
        ["canGoToZero"] = false,
        ["ironMultiplier"] = v3:IsStudio() and 0.1 or 0.75
    },
    ["oreGeneratorResourceSplitRatioOverrides"] = {
        [v14.IRON] = {
            ["splitRatio"] = 0.7
        }
    },
    ["startingTeamUpgrades"] = {
        { v6.TEAM_GENERATOR, 3 },
        { v6.DIAMOND_GENERATOR, 1 }
    }
}
return {
    ["getQueueMeta"] = function(p57) --[[ Name: getQueueMeta, Line 4435 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        return u37[p57]
    end,
    ["QueueMeta"] = u37
}