local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-assets").getMapAsset
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-type").MapType
local u5 = {}
local v6 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapDuneFortress_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    }
}
u5.DuneFortress = v6
local v7 = {
    ["mapImage"] = {
        [v4.PVP_ARENA] = v3("MapArena_pvpArena")
    }
}
u5.Arena = v7
local v8 = {
    ["mapImage"] = {
        [v4.BEDWARS_DUELS] = v3("MapSteamPunk_duels")
    }
}
u5.SteamPunk = v8
local v9 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapEnchantedForest_to4"),
        [v4.BEDWARS_DUELS] = v3("MapEnchantedForest_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = { "dust4wes", "Thyst" },
        [v4.BEDWARS_THIRTY_VS_THIRTY] = { "dust4wes", "Asoliux" }
    }
}
u5.EnchantedForest = v9
local v10 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapSecretGardens_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    },
    ["lights"] = {},
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "helperoy " }
    }
}
u5.SecretGardens = v10
local v11 = {
    ["mapImage"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapSanctuary_to5"),
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapSanctuary_to30")
    },
    ["credits"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = { "Asoliux", "Thyst", "some3t8ing" },
        [v4.BEDWARS_DUELS] = { "YoRylan", "vector3993", "some3t8ing" }
    }
}
u5.Sanctuary = v11
local v12 = {
    ["mapImage"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapSanctuary_to5")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.SanctuaryWinter = v12
local v13 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapMine_to2")
    }
}
u5.Mine = v13
local v14 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapAquatic_to2")
    }
}
u5.Aquatic = v14
local v15 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapAtlanticTemple_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapAtlanticTemple_to4")
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "OrionYeets", "Rascal" }
    }
}
u5.AtlanticTemple = v15
local v16 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapDarkholm_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapDarkholm_to4"),
        [v4.BEDWARS_DUELS] = v3("MapDarkholm_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Rain
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = { "OrionYeets" }
    }
}
u5.Darkholm = v16
local v17 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapDesertStorm_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapDesertStorm_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" }
    }
}
u5.DesertStorm = v17
local v18 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapDesertOasis_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapDesertOasis_to4"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapDesertOasis_to5"),
        [v4.BEDWARS_DUELS] = v3("MapDesertOasis_duels"),
        [v4.SKYWARS] = v3("MapDesertOasis_sw"),
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapDesertOasis_to30")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" },
        [v4.BEDWARS_THIRTY_VS_THIRTY] = { "OrionYeets" },
        [v4.SKYWARS] = { "OrionYeets" },
        [v4.BEDWARS_DUELS] = { "OrionYeets" },
        [v4.BEDWARS_FIVE_VS_FIVE] = { "OrionYeets" }
    }
}
u5.DesertOasis = v18
local v19 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapSkullIsland_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapSkullIsland_to2"),
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapSkullIsland_to30")
    },
    ["environment"] = {
        ["preset"] = v2.Rain
    }
}
u5.SkullIsland = v19
local v20 = {
    ["mapImage"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapBastion_to5")
    },
    ["credits"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = { "Asoliux", "Thyst" }
    }
}
u5.Bastion = v20
local v21 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapSanctum_to4")
    }
}
u5.Sanctum = v21
local v22 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapNordic_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapNordic_to2"),
        [v4.BEDWARS_DUELS] = v3("MapNordic_duels")
    }
}
u5.Nordic = v22
local v23 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapNordic_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapNordic_to2"),
        [v4.BEDWARS_DUELS] = v3("MapNordic_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" },
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" },
        [v4.BEDWARS_DUELS] = { "OrionYeets" }
    }
}
u5.NordicSnowy = v23
local v24 = {
    ["mapImage"] = {
        [v4.BEDWARS_DUELS] = v3("MapNordicHalloween_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = { "OrionYeets" }
    }
}
u5.NordicHalloween = v24
local v25 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapFountainPeaks_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapFountainPeaks_to2"),
        [v4.BEDWARS_DUELS] = v3("MapFountainPeaks_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Rain
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = {
            "OuterDaily",
            "Thyst",
            "Asoliux",
            "som3t8ing"
        }
    }
}
u5.FountainPeaks = v25
local v26 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapFarmland_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapFarmland_to2"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapFarmland_to5"),
        [v4.BEDWARS_DUELS] = v3("MapFarmland_duels")
    },
    ["credits"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = { "GorillaWithASuit" },
        [v4.BEDWARS_DOUBLES] = { "GorillaWithASuit" }
    }
}
u5.Farmland = v26
local v27 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapDesertShrine_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapDesertShrine_to2"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapDesertShrine_to5"),
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapDesertShrine_to30"),
        [v4.BEDWARS_DUELS] = v3("MapDesertShrine_duels"),
        [v4.SKYWARS] = v3("MapDesertShrine_sw")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    },
    ["credits"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = { "Asoliux", "Thyst" }
    }
}
u5.DesertShrine = v27
local v28 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCreek_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapCreek_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    }
}
u5.Creek = v28
local v29 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapReef_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapReef_to2")
    }
}
u5.Reef = v29
local v30 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapAtlanticRuins_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapAtlanticRuins_to2")
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = {
            "Asoliux",
            "Thyst",
            "som3t8ing",
            "Rascal"
        }
    }
}
u5.AtlanticRuins = v30
local v31 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCobblestoneGardens_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapCobblestoneGardens_to2"),
        [v4.SKYWARS] = v3("MapCobblestoneGardens_sw")
    },
    ["credits"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = {
            "hamed_burger",
            "Asoliux",
            "Thyst",
            "flare"
        }
    }
}
u5.CobblestoneGardens = v31
local v32 = {
    ["disableGolemBoss"] = true,
    ["disableMonarchBoss"] = true,
    ["disableDiamondGuards"] = true,
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapVoidlands_to4")
    }
}
u5.Voidlands = v32
local v33 = {
    ["disableOres"] = true,
    ["disableGolemBoss"] = true,
    ["disableMonarchBoss"] = true,
    ["disableDiamondGuards"] = true,
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapSandbox_to4")
    }
}
u5.Sandbox = v33
local v34 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapAztec_to4"),
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapAztec_to30"),
        [v4.BEDWARS_DOUBLES] = v3("MapAztec_to2")
    }
}
u5.Aztec = v34
local v35 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapAztec_to4"),
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapAztec_to30"),
        [v4.BEDWARS_DOUBLES] = v3("MapAztec_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" },
        [v4.BEDWARS_THIRTY_VS_THIRTY] = { "OrionYeets" }
    }
}
u5.AztecWinter = v35
local v36 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapAztecHalloween_to4"),
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapAztecHalloween_to30")
    },
    ["environment"] = {
        ["preset"] = v2.Night
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" },
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" },
        [v4.BEDWARS_THIRTY_VS_THIRTY] = { "OrionYeets" }
    }
}
u5.AztecHalloween = v36
local v37 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapBlossom_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapBlossom_to2"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapBlossom_to5"),
        [v4.BEDWARS_DUELS] = v3("MapBlossom_duels"),
        [v4.SKYWARS] = v3("MapBlossom_sw")
    },
    ["credits"] = {
        [v4.SKYWARS] = { "OrionYeets" }
    }
}
u5.Blossom = v37
local v38 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapBlossom_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapBlossom_to2"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapBlossom_to5"),
        [v4.BEDWARS_DUELS] = v3("MapBlossom_duels"),
        [v4.SKYWARS] = v3("MapBlossom_sw")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.BlossomWinter = v38
local v39 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapForest_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapForest_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "OrionYeets", "Rascal" },
        [v4.BEDWARS_SQUADS] = { "Asoliux", "Rascal" }
    }
}
u5.Forest = v39
local v40 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapForestHalloween_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapForestHalloween_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Night
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" },
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" }
    }
}
u5.ForestHalloween = v40
local v41 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapPark_to2")
    }
}
u5.Park = v41
local v42 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapWestern_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapWestern_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    }
}
u5.Western = v42
local v43 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapAutumn_to2"),
        [v4.BEDWARS_DUELS] = v3("MapAutumn_duels")
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = { "OuterDaily", "YoRylan", "som3t8ing" }
    }
}
u5.Autumn = v43
local v44 = {
    ["mapImage"] = {
        [v4.BEDWARS_DUELS] = v3("MapPinewood_duels"),
        [v4.SKYWARS] = v3("MapPinewood_sw"),
        [v4.BEDWARS_DOUBLES] = v3("MapPinewood_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapPinewood_to4"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapPinewood_to5")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" },
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" },
        [v4.BEDWARS_DUELS] = { "OrionYeets" },
        [v4.BEDWARS_FIVE_VS_FIVE] = { "OuterDaily", "som3t8ing" }
    }
}
u5.Pinewood = v44
local v45 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapPinefall_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapPinefall_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    }
}
u5.Pinefall = v45
local v46 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapPinefallHalloween_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Night
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" },
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" },
        [v4.BEDWARS_DUELS] = { "OrionYeets" }
    }
}
u5.PinefallHalloween = v46
local v47 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCandyland_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapCandyland_to2"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapCandyland_to5")
    },
    ["credits"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = { "GorillaWithASuit" },
        [v4.BEDWARS_DUELS] = { "GorillaWithASuit" }
    }
}
u5.Candyland = v47
local v48 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapCastle_to30")
    }
}
u5.Castle = v48
local v49 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapCastle_to30")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.CastleWinter = v49
local v50 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapCampsite_to30")
    }
}
u5.Campsite = v50
local v51 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapConstruction_to4")
    }
}
u5.Construction = v51
local v52 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapFactory_to4")
    }
}
u5.Factory = v52
local v53 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapCatacombs_to2")
    }
}
u5.Catacombs = v53
local v54 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapGlacier_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapGlacier_to2"),
        [v4.BEDWARS_DUELS] = v3("MapGlacier_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    },
    ["lighting"] = {
        ["Brightness"] = 2
    }
}
u5.Glacier = v54
local v55 = {
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.GlacialFort = v55
local v56 = {
    ["credits"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = { "Rascal", "Thyst", "som3t8ing" }
    }
}
u5.ForestCamp = v56
local v57 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapSandstorm_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    },
    ["lighting"] = {
        ["Brightness"] = 2.2
    }
}
u5.Sandstorm = v57
local v58 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapSandyCove_sw")
    }
}
u5.SandyCove = v58
local v59 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapSpiritBlossom_to4")
    }
}
u5.SpiritBlossom = v59
local v60 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapDome_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapDome_to2")
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OuterDaily", "som3t8ing" }
    },
    ["lighting"] = {
        ["Brightness"] = 2.6
    }
}
u5.Dome = v60
local v61 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapSandTemple_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapSandTemple_to2"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapSandTemple_to5"),
        [v4.BEDWARS_DUELS] = v3("MapSandTemple_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    },
    ["lighting"] = {
        ["Brightness"] = 2.2
    }
}
u5.SandTemple = v61
local v62 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapVolcano_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapVolcano_to2")
    }
}
u5.Volcano = v62
local v63 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapEgypt_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    }
}
u5.Egypt = v63
local v64 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapFarm_to2")
    }
}
u5.Farm = v64
local v65 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapShipsAhoy_to30")
    }
}
u5.ShipsAhoy = v65
local v66 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapSpring_to30")
    }
}
u5.Spring = v66
local v67 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapTeaTime_to2")
    }
}
u5.TeaTime = v67
local v68 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapAirship_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Rain
    }
}
u5.Airship = v68
local v69 = {
    ["mapImage"] = {
        [v4.ROYALE] = v3("MapMegaPlains_royale")
    }
}
u5.MegaPlains = v69
local v70 = {
    ["mapImage"] = {
        [v4.ROYALE] = v3("MapGorge_royale")
    }
}
u5.Gorge = v70
local v71 = {
    ["mapImage"] = {
        [v4.ROYALE] = v3("MapMegaTundra_royale")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.MegaTundra = v71
u5.Launch = {
    ["lighting"] = {
        ["Brightness"] = 2.2
    }
}
local v72 = {
    ["lighting"] = {
        ["Brightness"] = 1
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.Christmas = v72
local v73 = {
    ["lighting"] = {
        ["Brightness"] = 1
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" }
    }
}
u5.ChristmasSquare = v73
local v74 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapBank_to4")
    }
}
u5.Bank = v74
local v75 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapBayou_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapBayou_to4")
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "Rascal", "Asoliux" },
        [v4.BEDWARS_SQUADS] = { "Rascal", "Asoliux" }
    }
}
u5.Bayou = v75
local v76 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCitadel_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapCitadel_to2")
    }
}
u5.Citadel = v76
local v77 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCitadelTowers_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapCitadelTowers_to2"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapCitadelTowers_to5")
    },
    ["environment"] = {
        ["preset"] = v2.Rain
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "Asoliux", "som3t8ing", "Thyst" }
    }
}
u5.CitadelTowers = v77
local v78 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCitadel_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Night
    }
}
u5.SpookyTowers = v78
local v79 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCrypt_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapCrypt_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Night
    }
}
u5.Crypt = v79
local v80 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapFootballField_to4")
    }
}
u5.FootballField = v80
local v81 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapHighschool_to4")
    }
}
u5.Highschool = v81
local v82 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapIrongate_to4")
    }
}
u5.Irongate = v82
local v83 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapMilitaryBase_to4")
    }
}
u5.MilitaryBase = v83
local v84 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapMiniGolf_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapMiniGolf_to2")
    }
}
u5.MiniGolf = v84
local v85 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapMystic_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapMystic_to2"),
        [v4.BEDWARS_DUELS] = v3("MapMystic_duels")
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = { "som3t8ing", "OuterDaily", "YoRylan" }
    }
}
u5.Mystic = v85
local v86 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapOriental_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapOriental_to2"),
        [v4.BEDWARS_DUELS] = v3("MapOriental_duels")
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = { "som3t8ing", "OuterDaily", "YoRylan" }
    }
}
u5.Oriental = v86
local v87 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapPond_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapPond_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Rain
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "som3t8ing" }
    }
}
u5.Pond = v87
local v88 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapQuarry_to4")
    }
}
u5.Quarry = v88
local v89 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapShrine_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapShrine_to2")
    }
}
u5.Shrine = v89
local v90 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapSwamp_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapSwamp_to2"),
        [v4.SKYWARS] = v3("MapSwamp_sw"),
        [v4.BEDWARS_DUELS] = v3("MapSwamp_duels")
    },
    ["credits"] = {
        [v4.SKYWARS] = { "OrionYeets" },
        [v4.BEDWARS_DUELS] = { "OrionYeets" }
    }
}
u5.Swamp = v90
local v91 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapWindfall_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapWindfall_to2")
    }
}
u5.Windfall = v91
local v92 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCoast_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapCoast_to2")
    }
}
u5.Coast = v92
local v93 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapGrotto_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapGrotto_to2")
    }
}
u5.Grotto = v93
local v94 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapColosseum_to4")
    }
}
u5.Colosseum = v94
local v95 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapFortress_to30")
    }
}
u5.Fortress = v95
local v96 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapFortress_to30")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.FortressWinter = v96
local v97 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapReservoir_to30")
    }
}
u5.Reservoir = v97
local v98 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapRabbitsField_to30")
    }
}
u5.RabbitsField = v98
local v99 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapBambooGarden_sw")
    }
}
u5.BambooGarden = v99
local v100 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapBloom_sw")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    }
}
u5.Bloom = v100
local v101 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapCistern_sw"),
        [v4.SKYWARS_SQUADS] = v3("MapCistern_sw4")
    }
}
u5.Cistern = v101
local v102 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapGlade_sw"),
        [v4.SKYWARS_SQUADS] = v3("MapGlade_to4"),
        [v4.BEDWARS_DUELS] = v3("MapGlade_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    }
}
u5.Glade = v102
local v103 = {
    ["mapImage"] = {
        [v4.BEDWARS_DUELS] = v3("MapGrimGlade_duels"),
        [v4.SKYWARS] = v3("MapGrimGlade_sw")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    },
    ["credits"] = {
        [v4.SKYWARS] = { "OrionYeets" }
    }
}
u5.GrimGlade = v103
local v104 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapGlade_sw"),
        [v4.SKYWARS_SQUADS] = v3("MapGlade_to4"),
        [v4.BEDWARS_DUELS] = v3("MapGlade_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.GladeWinter = v104
local v105 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapTundra_sw"),
        [v4.SKYWARS_SQUADS] = v3("MapTundra_sw4")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.Tundra = v105
local v106 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapVolatile_sw"),
        [v4.SKYWARS_SQUADS] = v3("MapVolatile_sw4"),
        [v4.BEDWARS_DUELS] = v3("MapVolatile_duels"),
        [v4.BEDWARS_DOUBLES] = v3("MapVolatile_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapVolatile_to4"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapVolatile_to5")
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" },
        [v4.BEDWARS_DUELS] = { "Asoliux" },
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" },
        [v4.BEDWARS_FIVE_VS_FIVE] = { "Rascal", "OrionYeets" }
    }
}
u5.Volatile = v106
local v107 = {
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "som3t8ing", "OuterDaily", "YoRylan" }
    }
}
u5.VolatileV2 = v107
local v108 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapWasteland_sw"),
        [v4.SKYWARS_SQUADS] = v3("MapWasteland_sw4")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    }
}
u5.Wasteland = v108
local v109 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapArch_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapArch_to4")
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" }
    }
}
u5.Arch = v109
local v110 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapMineshaft_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Cave
    }
}
u5.Mineshaft = v110
local v111 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapPlaza_to2")
    }
}
u5.Plaza = v111
local v112 = {
    ["mapImage"] = {
        [v4.BEDWARS_DUELS] = v3("MapCanyon_duels"),
        [v4.BEDWARS_DOUBLES] = v3("MapCanyon_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapCanyon_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "OrionYeets" }
    }
}
u5.Canyon = v112
local v113 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapGoldRush_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "Asoliux", "Thyst" }
    }
}
u5.GoldRush = v113
local v114 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapFusion_to2")
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "Thyst", "Asoliux" }
    }
}
u5.Fusion = v114
local v115 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapRuins_to4"),
        [v4.BEDWARS_DUELS] = v3("MapRuins_duels"),
        [v4.GUN_GAME] = v3("MapRuins_gg")
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OuterDaily", "Asoliux", "Thyst" },
        [v4.BEDWARS_DUELS] = { "Rascal" }
    }
}
u5.Ruins = v115
local v116 = {
    ["mapImage"] = {
        [v4.GUN_GAME] = v3("MapSiege_gg")
    }
}
u5.Siege = v116
local v117 = {
    ["mapImage"] = {
        [v4.GUN_GAME] = v3("MapTreetop_gg")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    }
}
u5.Treetop = v117
local v118 = {
    ["mapImage"] = {
        [v4.INFECTED] = v3("MapIndustry_infected")
    }
}
u5.Industry = v118
local v119 = {
    ["mapImage"] = {
        [v4.INFECTED] = v3("MapFrostSite_infected")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.FrostSite = v119
local v120 = {
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.FrozenPond = v120
local v121 = {
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.Frostbite = v121
local v122 = {
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.FestiveFalls = v122
local v123 = {
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.Festive = v123
local v124 = {
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.Winter = v124
local v125 = {
    ["mapImage"] = {
        [v4.PVE] = v3("MapIceberg_pve")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.Iceberg = v125
local v126 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCraglands_to4")
    }
}
u5.Craglands = v126
local v127 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapFungiLand_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapFungiLand_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    }
}
u5.FungiLand = v127
local v128 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapGrandpeak_to30"),
        [v4.BEDWARS_SQUADS] = v3("MapGrandpeak_to4")
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = { "YoRylan", "turtlemon_25", "som3t8ing" },
        [v4.BEDWARS_SQUADS] = { "som3t8ing", "OuterDaily", "YoRylan" }
    }
}
u5.Grandpeak = v128
local v129 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapGrandpeak_to30")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.GrandpeakWinter = v129
local v130 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapKingdomGardens_to30")
    }
}
u5.KingdomGardens = v130
local v131 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapKingdomGardens_to30")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.KingdomGardensWinter = v131
local v132 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapSandShrine_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapSandShrine_to2")
    },
    ["environment"] = {
        ["preset"] = v2.Desert
    }
}
u5.SandShrine = v132
local v133 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCherryHills_to4"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapCherryHills_to5")
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = {
            "som3t8ing",
            "OuterDaily",
            "YoRylan",
            "Asoliux"
        }
    }
}
u5.CherryHills = v133
local v134 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapPagoda_to30"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapPagoda_to5")
    },
    ["credits"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = { "SimplyPanda", "Asoliux", "som3t8ing" }
    }
}
u5.Pagoda = v134
local v135 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapSeasonal_to4"),
        [v4.BEDWARS_DOUBLES] = v3("MapSeasonal_to2"),
        [v4.BEDWARS_DUELS] = v3("MapSeasonal_duels")
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = {
            "hamed_burger",
            "Asoliux",
            "Thyst",
            "flareiea"
        }
    }
}
u5.Seasonal = v135
local v136 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapTreehouse_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    }
}
u5.Treehouse = v136
local v137 = {
    ["mapImage"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapChampionsValley_to5")
    }
}
u5.ChampionsValley = v137
local v138 = {
    ["mapImage"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapChampionsValley_to5")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.ChampionsValleyWinter = v138
local v139 = {
    ["mapImage"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapSummit_to5")
    },
    ["environment"] = {
        ["preset"] = v2.Rain
    }
}
u5.Summit = v139
local v140 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapVineyard_to2"),
        [v4.BEDWARS_SQUADS] = v3("MapVineyard_to4")
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" }
    }
}
u5.Vineyard = v140
local v141 = {
    ["mapImage"] = {
        [v4.BEDWARS_DUELS] = v3("MapSnowLodge_duels")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    }
}
u5.SnowLodge = v141
local v142 = {
    ["environment"] = {
        ["preset"] = v2.Winter
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" },
        [v4.SKYWARS] = { "OrionYeets" },
        [v4.BEDWARS_DUELS] = { "OrionYeets" }
    }
}
u5.SnowmanPark = v142
local v143 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapUnderworld_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Night
    }
}
u5.Underworld = v143
local v144 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapWorkshop_to4")
    }
}
u5.Workshop = v144
local v145 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCastle-Grounds_to4")
    }
}
u5.CastleGrounds = v145
local v146 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapCrystalmount_to4"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapCrystalmount_to5"),
        [v4.BEDWARS_DUELS] = v3("MapCrystalmount_duels"),
        [v4.BEDWARS_DOUBLES] = v3("MapCrystalmount_to2")
    },
    ["credits"] = {
        [v4.BEDWARS_DUELS] = { "Thyst", "Asoliux" },
        [v4.BEDWARS_DOUBLES] = { "Thyst", "Asoliux" }
    }
}
u5.Crystalmount = v146
local v147 = {
    ["mapImage"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapElderWoods_to5")
    },
    ["environment"] = {
        ["preset"] = v2.Forest
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "som3t8ing", "Asoliux" },
        [v4.BEDWARS_FIVE_VS_FIVE] = { "Asoliux" }
    }
}
u5.ElderWoods = v147
local v148 = {
    ["mapImage"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapStoneFortress_to5")
    }
}
u5.StoneFortress = v148
local v149 = {
    ["mapImage"] = {
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapWinterForest_to5"),
        [v4.BEDWARS_SQUADS] = v3("MapWinterForest_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Winter
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "Asoliux", "Thyst", "som3t8ing" }
    }
}
u5.WinterForest = v149
local v150 = {
    ["mapImage"] = {
        [v4.SKYWARS] = v3("MapPalace_sw")
    }
}
u5.Palace = v150
local v151 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapHauntedManor_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Night
    }
}
u5.HauntedManor = v151
local v152 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapSpookyMansion_to4")
    },
    ["environment"] = {
        ["preset"] = v2.Night
    }
}
u5.SpookMansion = v152
local v153 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapPumpkin_to4")
    }
}
u5.Pumpkin = v153
local v154 = {
    ["environment"] = {
        ["preset"] = v2.Night
    }
}
u5.PumpkinManor = v154
local v155 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapPumpkinPatch_to4"),
        [v4.BEDWARS_FIVE_VS_FIVE] = v3("MapPumpkinPatch_to5"),
        [v4.BEDWARS_DUELS] = v3("MapPumpkinPatch_duels"),
        [v4.SKYWARS] = v3("MapPumpkinPatch_sw"),
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapPumpkinPatch_to30")
    },
    ["environment"] = {
        ["preset"] = v2.Night
    },
    ["credits"] = {
        [v4.SKYWARS] = { "OrionYeets" },
        [v4.BEDWARS_DUELS] = { "OrionYeets" },
        [v4.BEDWARS_THIRTY_VS_THIRTY] = { "OrionYeets" },
        [v4.BEDWARS_FIVE_VS_FIVE] = { "GorillaWithASuit" }
    }
}
u5.PumpkinPatch = v155
local v156 = {
    ["description"] = "A spooky map for night time Halloween 2025 that evolves as the game progresses.",
    ["environment"] = {
        ["preset"] = v2.Night
    },
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapHalloweenMap2025_to4")
    }
}
u5.HalloweenMap2025 = v156
local v157 = {
    ["mapImage"] = {
        [v4.MINE_WARS] = v3("MapMines_mw")
    },
    ["environment"] = {
        ["preset"] = v2.Cave
    }
}
u5.Mines = v157
local v158 = {
    ["mapImage"] = {
        [v4.BEDWARS_DOUBLES] = v3("MapShadowfall_to2")
    },
    ["credits"] = {
        [v4.BEDWARS_DOUBLES] = { "som3t8ing" }
    }
}
u5.Shadowfall = v158
local v159 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapTranquilMeadow_to4")
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" }
    }
}
u5.TranquilMeadow = v159
local v160 = {
    ["mapImage"] = {
        [v4.BEDWARS_SQUADS] = v3("MapStreamValley_to4")
    },
    ["credits"] = {
        [v4.BEDWARS_SQUADS] = { "OrionYeets" }
    }
}
u5.StreamValley = v160
local v161 = {
    ["mapImage"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = v3("MapDesertedRuins_to30")
    },
    ["credits"] = {
        [v4.BEDWARS_THIRTY_VS_THIRTY] = { "yhpro1230" }
    }
}
u5.DesertedRuins = v161
return {
    ["getMapMeta"] = function(p162) --[[ Name: getMapMeta, Line 1321 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local v163 = string.split(p162, "_")[2]
        if v163 == "" or not v163 then
            return {}
        end
        local v164 = string.gsub(v163, "-", "")
        if u5[v164] then
            return u5[v164]
        end
    end,
    ["getMapType"] = function(p165) --[[ Name: getMapType, Line 1331 ]]
        return string.split(p165, "_")[1]
    end,
    ["getMapName"] = function(p166) --[[ Name: getMapName, Line 1334 ]]
        return string.split(p166, "_")[2]
    end
}