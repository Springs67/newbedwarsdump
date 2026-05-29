local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHexStrings
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "performance", "match-outcome").MatchOutcome
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "performance", "match-performance").makeStarterMatchPerformance
local v8 = v7(v2.Dummy.oiogy)
v8.generic.matchOutcome = v6.WIN
v8.ranked = {
    ["rpDelta"] = 10
}
v8.bedwars.kit = v5.OWL
v8.bedwars.bedBreaks = 2
v8.bedwars.finalKills = 3
v8.generic.kills = {
    ["playerKills"] = 14,
    ["total"] = 17
}
v8.generic.damageDealt = 2546
local v9 = v7(v2.Dummy.oiogy)
v9.generic.matchOutcome = v6.LOSS
v9.ranked = {
    ["rpDelta"] = -10
}
local v10 = {}
local v11 = {
    ["matchId"] = "4",
    ["matchDuration"] = 600,
    ["mapId"] = "to4_Blossom",
    ["matchStartTime"] = os.time() - 864060,
    ["queueType"] = v3.BEDWARS_TO4,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v12 = {}
local v13 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.Asen.userId] = v2.Dummy.Asen,
        [v2.Dummy.Bryan3838.userId] = v2.Dummy.Bryan3838,
        [v2.Dummy.DVwastaken.userId] = v2.Dummy.DVwastaken
    },
    ["colorHex"] = v4.lightBlue
}
local v14 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.Asen.userId] = v2.Dummy.Asen,
        [v2.Dummy.Bryan3838.userId] = v2.Dummy.Bryan3838,
        [v2.Dummy.DVwastaken.userId] = v2.Dummy.DVwastaken
    },
    ["colorHex"] = v4.orange
}
local v15 = {
    ["id"] = "3",
    ["name"] = "Pink",
    ["placement"] = 2,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.Asen.userId] = v2.Dummy.Asen,
        [v2.Dummy.Bryan3838.userId] = v2.Dummy.Bryan3838,
        [v2.Dummy.DVwastaken.userId] = v2.Dummy.DVwastaken
    },
    ["colorHex"] = v4.pink
}
local v16 = {
    ["id"] = "4",
    ["name"] = "Brown",
    ["placement"] = 3,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.Asen.userId] = v2.Dummy.Asen,
        [v2.Dummy.Bryan3838.userId] = v2.Dummy.Bryan3838,
        [v2.Dummy.DVwastaken.userId] = v2.Dummy.DVwastaken
    },
    ["colorHex"] = v4.brown
}
__set_list(v12, 1, {v13, v14, v15, v16})
v11.teams = v12
v11.players = { v8, v7(v2.Dummy.Chase) }
local v17 = {
    ["matchId"] = "30",
    ["matchDuration"] = 1030,
    ["mapId"] = "to4_Airship",
    ["matchStartTime"] = os.time() - 100000,
    ["queueType"] = v3.BEDWARS_20v20,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v18 = {}
local v19 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.Asen.userId] = v2.Dummy.Asen,
        [v2.Dummy.Bryan3838.userId] = v2.Dummy.Bryan3838,
        [v2.Dummy.Candelz.userId] = v2.Dummy.Candelz,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.DVwastaken.userId] = v2.Dummy.DVwastaken,
        [v2.Dummy.JKJ.userId] = v2.Dummy.JKJ,
        [v2.Dummy.LongNameMan.userId] = v2.Dummy.LongNameMan,
        [v2.Dummy.Midciel.userId] = v2.Dummy.Midciel,
        [v2.Dummy.Rascal.userId] = v2.Dummy.Rascal,
        [v2.Dummy.SnickTrix.userId] = v2.Dummy.SnickTrix,
        [v2.Dummy.SteamPulse.userId] = v2.Dummy.SteamPulse,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy,
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy
    },
    ["colorHex"] = v4.lightBlue
}
local v20 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase,
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase
    },
    ["colorHex"] = v4.orange
}
__set_list(v18, 1, {v19, v20})
v17.teams = v18
v17.players = { v7(v2.Dummy.oiogy), v7(v2.Dummy.Chase) }
local v21 = {
    ["matchId"] = "3",
    ["matchDuration"] = 790,
    ["mapId"] = "to4_Pond",
    ["matchStartTime"] = os.time() - 60,
    ["queueType"] = v3.BEDWARS_TO4,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v22 = {}
local v23 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy
    },
    ["colorHex"] = v4.lightBlue
}
local v24 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase
    },
    ["colorHex"] = v4.orange
}
__set_list(v22, 1, {v23, v24})
v21.teams = v22
v21.players = { v9, v7(v2.Dummy.Chase) }
local v25 = {
    ["matchId"] = "4",
    ["matchDuration"] = 790,
    ["mapId"] = "to4_Treehouse",
    ["matchStartTime"] = os.time() - 60,
    ["queueType"] = v3.BEDWARS_RANKED_S11,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v26 = {}
local v27 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy
    },
    ["colorHex"] = v4.lightBlue
}
local v28 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase
    },
    ["colorHex"] = v4.orange
}
__set_list(v26, 1, {v27, v28})
v25.teams = v26
v25.players = { v8, v7(v2.Dummy.Chase) }
local v29 = {
    ["matchId"] = "5",
    ["matchDuration"] = 790,
    ["mapId"] = "to4_Sanctum",
    ["matchStartTime"] = os.time() - 60,
    ["queueType"] = v3.BEDWARS_RANKED_S11,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v30 = {}
local v31 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy
    },
    ["colorHex"] = v4.lightBlue
}
local v32 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase
    },
    ["colorHex"] = v4.orange
}
__set_list(v30, 1, {v31, v32})
v29.teams = v30
v29.players = { v8, v7(v2.Dummy.Chase) }
local v33 = {
    ["matchId"] = "6",
    ["matchDuration"] = 790,
    ["mapId"] = "to4_Sanctum",
    ["matchStartTime"] = os.time() - 60,
    ["queueType"] = v3.BEDWARS_RANKED_S11,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v34 = {}
local v35 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy
    },
    ["colorHex"] = v4.lightBlue
}
local v36 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase
    },
    ["colorHex"] = v4.orange
}
__set_list(v34, 1, {v35, v36})
v33.teams = v34
v33.players = { v7(v2.Dummy.Chase) }
local v37 = {
    ["matchId"] = "7",
    ["matchDuration"] = 790,
    ["mapId"] = "to4_Sanctum",
    ["matchStartTime"] = os.time() - 60,
    ["queueType"] = v3.BEDWARS_RANKED_S11,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v38 = {}
local v39 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy
    },
    ["colorHex"] = v4.lightBlue
}
local v40 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase
    },
    ["colorHex"] = v4.orange
}
__set_list(v38, 1, {v39, v40})
v37.teams = v38
v37.players = { v7(v2.Dummy.Chase) }
local v41 = {
    ["matchId"] = "8",
    ["matchDuration"] = 790,
    ["mapId"] = "to4_Sanctum",
    ["matchStartTime"] = os.time() - 60,
    ["queueType"] = v3.BEDWARS_RANKED_S11,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v42 = {}
local v43 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy
    },
    ["colorHex"] = v4.lightBlue
}
local v44 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase
    },
    ["colorHex"] = v4.orange
}
__set_list(v42, 1, {v43, v44})
v41.teams = v42
v41.players = { v8, v7(v2.Dummy.Chase) }
local v45 = {
    ["matchId"] = "9",
    ["matchDuration"] = 790,
    ["mapId"] = "to4_Sanctum",
    ["matchStartTime"] = os.time() - 60,
    ["queueType"] = v3.BEDWARS_RANKED_S11,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v46 = {}
local v47 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy
    },
    ["colorHex"] = v4.lightBlue
}
local v48 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase
    },
    ["colorHex"] = v4.orange
}
__set_list(v46, 1, {v47, v48})
v45.teams = v46
v45.players = { v8, v7(v2.Dummy.Chase) }
local v49 = {
    ["matchId"] = "10",
    ["matchDuration"] = 790,
    ["mapId"] = "to4_Sanctum",
    ["matchStartTime"] = os.time() - 60,
    ["queueType"] = v3.BEDWARS_RANKED_S11,
    ["serverRegion"] = {
        ["region"] = "CA",
        ["countryCode"] = "US"
    }
}
local v50 = {}
local v51 = {
    ["id"] = "1",
    ["name"] = "Blue",
    ["placement"] = 0,
    ["members"] = {
        [v2.Dummy.oiogy.userId] = v2.Dummy.oiogy
    },
    ["colorHex"] = v4.lightBlue
}
local v52 = {
    ["id"] = "2",
    ["name"] = "Orange",
    ["placement"] = 1,
    ["members"] = {
        [v2.Dummy.Chase.userId] = v2.Dummy.Chase
    },
    ["colorHex"] = v4.orange
}
__set_list(v50, 1, {v51, v52})
v49.teams = v50
v49.players = { v8, v7(v2.Dummy.Chase) }
__set_list(v10, 1, {v11, v17, v21, v25, v29, v33, v37, v41, v45, v49})
return {
    ["DummyMatchHistory"] = v10
}