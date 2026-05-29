local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-type")
local v2 = v1.BedwarsMapType
local v3 = v1.DominationMapType
local v4 = v1.MapType
local v5 = {
    [v4.SKYWARS] = {
        {
            ["mapName"] = "sw_Cistern",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Wasteland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Volatile",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Tundra",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Bamboo-Garden",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Bloom",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Palace",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Sandy-Cove",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Pinewood",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Desert-Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Cobblestone-Gardens",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Blossom",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Swamp",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw_Glade",
            ["weight"] = 1
        }
    },
    [v4.SKYWARS_SQUADS] = {
        {
            ["mapName"] = "sw4_Wasteland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw4_Volatile",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw4_Tundra",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw4_Glade",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw4_Cistern",
            ["weight"] = 1
        },
        {
            ["mapName"] = "sw4_BambooGarden",
            ["weight"] = 1
        }
    },
    [v4.SKYWARS_ROYALE] = {
        {
            ["mapName"] = "swroyale_Skyfield",
            ["weight"] = 1
        }
    }
}
local v6 = {
    [v4.BEDWARS_RANKED_S16] = {
        {
            ["mapName"] = "to5_Champions-Valley",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Citadel-Towers",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Stone-Fortress",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Elder-Woods",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Desert-Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Sanctuary",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Crystalmount",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Winter-Forest",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Volatile",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Farmland",
            ["weight"] = 1
        }
    },
    [v4.BEDWARS_SQUADS] = {
        {
            ["mapName"] = "to4_Sandbox",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Atlantic-Ruins",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Cobblestone-Gardens",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Creek",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Desert-Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Dome",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Farmland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Fountain-Peaks",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Sanctum",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Sand-Temple",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Seasonal",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Skull-Island",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Underworld",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Workshop",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Crystalmount",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Volcano_1",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Canyon_1",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Citadel",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Desert-Oasis",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Swamp",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Egypt",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Candyland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Atlantic-Temple",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Desert-Storm",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Airship",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Reef",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Pond",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Glacier",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Forest",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Pinefall",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Pinewood",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Arch",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Ruins",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Gold-Rush",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Stream-Valley",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Tranquil-Meadow",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Winter-Forest",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Bayou",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Citadel-Towers",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Darkholm",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Grandpeak",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Grotto",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Sand-Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Vineyard",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Western",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Aztec",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Nordic",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Blossom",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Cherry-Hills",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Crypt",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4_Fungi-Land",
            ["weight"] = 1
        }
    },
    [v4.BEDWARS_DOUBLES] = {
        {
            ["mapName"] = "to2_Secret-Gardens",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Aquatic",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Autumn",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Cobblestone-Gardens",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Creek",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Darkholm",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Desert-Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Desert-Storm",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Fountain-Peaks",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Sand-Temple",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Skull-Island",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Volcano_1",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Canyon",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Pinefall",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Forest",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Citadel",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Desert-Oasis",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Swamp",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Volatile",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Candyland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Atlantic-Temple",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Dome",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Oriental",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Farmland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Pinewood",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Seasonal",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Reef",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Pond",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Arch",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Crystalmount",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Fungi-Land",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Fusion",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Tranquil-Meadow",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Bayou",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Catacombs",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Sanctum",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Shadowfall",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Vineyard",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Aztec",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Blossom",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Nordic",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Windfall",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to2_Crypt",
            ["weight"] = 1
        }
    },
    [v4.BEDWARS_DUELS] = {
        {
            ["mapName"] = "duels_Volatile",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Ruins",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Glacier",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Blossom",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Sand-Temple",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Canyon",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Mystic",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Farmland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Desert-Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_SteamPunk",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Darkholm",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Desert-Oasis",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Swamp",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Pinewood",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Autumn",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Crystalmount",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Fountain-Peaks",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Seasonal",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Candyland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Glade",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Nordic",
            ["weight"] = 1
        },
        {
            ["mapName"] = "duels_Oriental",
            ["weight"] = 1
        }
    },
    [v4.BEDWARS_THIRTY_VS_THIRTY] = {
        {
            ["mapName"] = "to30_Skull-Island",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Desert-Shrine",
            ["weight"] = 1
        },
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
        },
        {
            ["mapName"] = "to30_Desert-Oasis",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Grandpeak",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Kingdom-Gardens",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Aztec",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Deserted-Ruins",
            ["weight"] = 1
        }
    },
    [v2.BEDWARS_FIVE_VS_FIVE] = {
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
            ["mapName"] = "to5_Cherry-Hills",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Farmland",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Desert-Oasis",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Bastion",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Volatile",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Winter-Forest",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Pinewood",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to5_Pagoda",
            ["weight"] = 1
        }
    },
    [v2.OG_BEDWARS] = {
        {
            ["mapName"] = "to4OG_Old-Aztec",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4OG_Old-Blossom",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4OG_Old-Glacier",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to4OG_Old-Mini-Golf",
            ["weight"] = 1
        }
    },
    [v2.BEDWARS_NO_BUILD_4] = {
        {
            ["mapName"] = "nb4_Aztec",
            ["weight"] = 1
        },
        {
            ["mapName"] = "nb4_Blossom",
            ["weight"] = 1
        },
        {
            ["mapName"] = "nb4_Sanctum",
            ["weight"] = 1
        },
        {
            ["mapName"] = "nb4_Shrine",
            ["weight"] = 1
        },
        {
            ["mapName"] = "nb4_Dome",
            ["weight"] = 1
        }
    }
}
local v7 = {
    [v4.FLAG_CAPTURE_MAP_TYPE] = {
        {
            ["mapName"] = "to30_Castle",
            ["weight"] = 1
        },
        {
            ["mapName"] = "to30_Fortress",
            ["weight"] = 1
        }
    }
}
local v8 = {
    [v3.DOMINATION_MAP_TYPE] = {
        {
            ["mapName"] = "dom_Valley",
            ["weight"] = 1
        },
        {
            ["mapName"] = "dom_Grand-Pass",
            ["weight"] = 1
        }
    }
}
local v9 = {
    [v4.JUGGERNAUT_TDM] = v6[v4.BEDWARS_THIRTY_VS_THIRTY],
    [v4.JUGGERNAUT_FFA] = {
        {
            ["mapName"] = "jugg_Outskirts",
            ["weight"] = 1
        }
    }
}
local v10 = {}
for v11, v12 in v6 do
    v10[v11] = v12
end
for v13, v14 in v5 do
    v10[v13] = v14
end
for v15, v16 in v7 do
    v10[v15] = v16
end
for v17, v18 in v9 do
    v10[v17] = v18
end
for v19, v20 in v8 do
    v10[v19] = v20
end
v10[v4.ROYALE] = {
    {
        ["mapName"] = "royale_Mega-Plains",
        ["weight"] = 1
    },
    {
        ["mapName"] = "royale_Mega-Tundra",
        ["weight"] = 1
    },
    {
        ["mapName"] = "royale_Gorge",
        ["weight"] = 1
    }
}
v10[v4.BLOCK_HUNT] = {
    {
        ["mapName"] = "BH_Kingdom",
        ["weight"] = 1
    },
    {
        ["mapName"] = "BH_Excavation",
        ["weight"] = 1
    }
}
v10[v4.EGG_HUNT] = {
    {
        ["mapName"] = "egg_Shrine",
        ["weight"] = 1
    },
    {
        ["mapName"] = "egg_Sanctum",
        ["weight"] = 1
    }
}
v10[v4.INFECTED] = {
    {
        ["mapName"] = "infected_Construction",
        ["weight"] = 1
    }
}
v10[v4.PVE] = {
    {
        ["mapName"] = "pve_Tropica",
        ["weight"] = 1
    },
    {
        ["mapName"] = "pve_Iceberg",
        ["weight"] = 1
    },
    {
        ["mapName"] = "pve_TreasureIsles",
        ["weight"] = 1
    }
}
v10[v4.GUN_GAME] = {
    {
        ["mapName"] = "gg_Siege",
        ["weight"] = 1
    },
    {
        ["mapName"] = "gg_Ruins",
        ["weight"] = 1
    },
    {
        ["mapName"] = "gg_Treetop",
        ["weight"] = 1
    },
    {
        ["mapName"] = "gg_Hydroplant",
        ["weight"] = 1
    },
    {
        ["mapName"] = "gg_Harbour",
        ["weight"] = 1
    }
}
v10[v4.TNT_WARS] = {
    {
        ["mapName"] = "tnt_Ruins",
        ["weight"] = 1
    },
    {
        ["mapName"] = "tnt_Shore",
        ["weight"] = 1
    },
    {
        ["mapName"] = "tnt_Plaza",
        ["weight"] = 1
    }
}
v10[v4.MURDER_GAME] = {
    {
        ["mapName"] = "nm_Castle-Grounds",
        ["weight"] = 1
    }
}
v10[v4.BRIDGE_DUEL] = {
    {
        ["mapName"] = "bridgeDuel_Dunes",
        ["weight"] = 1
    },
    {
        ["mapName"] = "bridgeDuel_Blossom",
        ["weight"] = 1
    },
    {
        ["mapName"] = "bridgeDuel_Desert",
        ["weight"] = 1
    }
}
v10[v4.LASSO_WARS] = {
    {
        ["mapName"] = "LassoWars_1",
        ["weight"] = 1
    }
}
v10[v4.PVP_ARENA] = {
    {
        ["mapName"] = "pvpArena_Arena",
        ["weight"] = 1
    }
}
v10[v4.BED_ROYALE] = {
    {
        ["mapName"] = "bedRoyale_Kingdom",
        ["weight"] = 1
    }
}
v10[v4.MINE_WARS] = {
    {
        ["mapName"] = "mw_Mines",
        ["weight"] = 1
    }
}
return {
    ["SkywarsMaps"] = v5,
    ["BedwarsMaps"] = v6,
    ["FlagCaptureMaps"] = v7,
    ["DominationMaps"] = v8,
    ["JuggernautMaps"] = v9,
    ["Maps"] = v10
}