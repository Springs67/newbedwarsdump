-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local TeamColorHexStrings = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHexStrings;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local MatchOutcome = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "performance", "match-outcome").MatchOutcome;
local makeStarterMatchPerformance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "performance", "match-performance").makeStarterMatchPerformance;
local v1 = makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.oiogy);
v1.generic.matchOutcome = MatchOutcome.WIN;
v1.ranked = {
    rpDelta = 10
};
v1.bedwars.kit = BedwarsKit.OWL;
v1.bedwars.bedBreaks = 2;
v1.bedwars.finalKills = 3;
v1.generic.kills = {
    playerKills = 14,
    total = 17
};
v1.generic.damageDealt = 2546;
local v2 = makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.oiogy);
v2.generic.matchOutcome = MatchOutcome.LOSS;
v2.ranked = {
    rpDelta = -10
};

return {
    DummyMatchHistory = {
        {
            matchId = "4",
            matchDuration = 600,
            mapId = "to4_Blossom",
            matchStartTime = os.time() - 864060,
            queueType = QueueType.BEDWARS_TO4,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen,
                        [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                        [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen,
                        [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                        [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken
                    },
                    colorHex = TeamColorHexStrings.orange
                },
                {
                    id = "3",
                    name = "Pink",
                    placement = 2,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen,
                        [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                        [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken
                    },
                    colorHex = TeamColorHexStrings.pink
                },
                {
                    id = "4",
                    name = "Brown",
                    placement = 3,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen,
                        [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                        [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken
                    },
                    colorHex = TeamColorHexStrings.brown
                }
            },
            players = { v1, makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        },
        {
            matchId = "30",
            matchDuration = 1030,
            mapId = "to4_Airship",
            matchStartTime = os.time() - 100000,
            queueType = QueueType.BEDWARS_20v20,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen,
                        [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                        [OfflinePlayerUtil.Dummy.Candelz.userId] = OfflinePlayerUtil.Dummy.Candelz,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken,
                        [OfflinePlayerUtil.Dummy.JKJ.userId] = OfflinePlayerUtil.Dummy.JKJ,
                        [OfflinePlayerUtil.Dummy.LongNameMan.userId] = OfflinePlayerUtil.Dummy.LongNameMan,
                        [OfflinePlayerUtil.Dummy.Midciel.userId] = OfflinePlayerUtil.Dummy.Midciel,
                        [OfflinePlayerUtil.Dummy.Rascal.userId] = OfflinePlayerUtil.Dummy.Rascal,
                        [OfflinePlayerUtil.Dummy.SnickTrix.userId] = OfflinePlayerUtil.Dummy.SnickTrix,
                        [OfflinePlayerUtil.Dummy.SteamPulse.userId] = OfflinePlayerUtil.Dummy.SteamPulse,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                    },
                    colorHex = TeamColorHexStrings.orange
                }
            },
            players = { makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.oiogy), makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        },
        {
            matchId = "3",
            matchDuration = 790,
            mapId = "to4_Pond",
            matchStartTime = os.time() - 60,
            queueType = QueueType.BEDWARS_TO4,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                    },
                    colorHex = TeamColorHexStrings.orange
                }
            },
            players = { v2, makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        },
        {
            matchId = "4",
            matchDuration = 790,
            mapId = "to4_Treehouse",
            matchStartTime = os.time() - 60,
            queueType = QueueType.BEDWARS_RANKED_S11,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                    },
                    colorHex = TeamColorHexStrings.orange
                }
            },
            players = { v1, makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        },
        {
            matchId = "5",
            matchDuration = 790,
            mapId = "to4_Sanctum",
            matchStartTime = os.time() - 60,
            queueType = QueueType.BEDWARS_RANKED_S11,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                    },
                    colorHex = TeamColorHexStrings.orange
                }
            },
            players = { v1, makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        },
        {
            matchId = "6",
            matchDuration = 790,
            mapId = "to4_Sanctum",
            matchStartTime = os.time() - 60,
            queueType = QueueType.BEDWARS_RANKED_S11,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                    },
                    colorHex = TeamColorHexStrings.orange
                }
            },
            players = { makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        },
        {
            matchId = "7",
            matchDuration = 790,
            mapId = "to4_Sanctum",
            matchStartTime = os.time() - 60,
            queueType = QueueType.BEDWARS_RANKED_S11,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                    },
                    colorHex = TeamColorHexStrings.orange
                }
            },
            players = { makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        },
        {
            matchId = "8",
            matchDuration = 790,
            mapId = "to4_Sanctum",
            matchStartTime = os.time() - 60,
            queueType = QueueType.BEDWARS_RANKED_S11,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                    },
                    colorHex = TeamColorHexStrings.orange
                }
            },
            players = { v1, makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        },
        {
            matchId = "9",
            matchDuration = 790,
            mapId = "to4_Sanctum",
            matchStartTime = os.time() - 60,
            queueType = QueueType.BEDWARS_RANKED_S11,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                    },
                    colorHex = TeamColorHexStrings.orange
                }
            },
            players = { v1, makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        },
        {
            matchId = "10",
            matchDuration = 790,
            mapId = "to4_Sanctum",
            matchStartTime = os.time() - 60,
            queueType = QueueType.BEDWARS_RANKED_S11,
            serverRegion = {
                region = "CA",
                countryCode = "US"
            },
            teams = {
                {
                    id = "1",
                    name = "Blue",
                    placement = 0,
                    members = {
                        [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy
                    },
                    colorHex = TeamColorHexStrings.lightBlue
                },
                {
                    id = "2",
                    name = "Orange",
                    placement = 1,
                    members = {
                        [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                    },
                    colorHex = TeamColorHexStrings.orange
                }
            },
            players = { v1, makeStarterMatchPerformance(OfflinePlayerUtil.Dummy.Chase) }
        }
    }
};