local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-type").BattlePass
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-type").PetType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v11 = {
    [v10.NONE] = {
        ["name"] = "None"
    }
}
local v12 = v10.HANG_GLIDER
local v13 = {
    ["name"] = "Hang Glider",
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["itemType"] = v6.HANG_GLIDER
        }
    },
    ["preview"] = {
        ["hidden"] = true
    }
}
v11[v12] = v13
local v14 = v10.RAGEBLADE
local v15 = {
    ["name"] = "Rageblade",
    ["unlockedInBattlePass"] = true,
    ["items"] = {
        {
            ["itemType"] = v6.RAGEBLADE
        }
    },
    ["battlepassSeason"] = v3.season3
}
v11[v14] = v15
local v16 = v10.SNOW_BALL
local v17 = {
    ["name"] = "Snow Ball",
    ["unlockedInBattlePass"] = true,
    ["items"] = {
        {
            ["amount"] = 3,
            ["refillable"] = true,
            ["itemType"] = v6.SNOWBALL
        }
    },
    ["battlepassSeason"] = v3.season3
}
v11[v16] = v17
local v18 = v10.JUMP_BOOTS
local v19 = {
    ["name"] = "Jump Boots",
    ["unlockedInBattlePass"] = true,
    ["items"] = {
        {
            ["itemType"] = v6.JUMP_BOOTS
        }
    },
    ["battlepassSeason"] = v3.season3
}
v11[v18] = v19
local v20 = v10.SPEED_BOOTS
local v21 = {
    ["name"] = "Speed Boots",
    ["unlockedInBattlePass"] = true,
    ["items"] = {
        {
            ["itemType"] = v6.SPEED_BOOTS
        }
    },
    ["battlepassSeason"] = v3.season3
}
v11[v20] = v21
local v22 = v10.JADE_HAMMER
local v23 = {
    ["name"] = "Jade Hammer",
    ["unlockedInBattlePass"] = true,
    ["items"] = {
        {
            ["itemType"] = v6.JADE_HAMMER
        }
    },
    ["battlepassSeason"] = v3.season4
}
v11[v22] = v23
local v24 = v10.FREIYA_ICE_SWORD
local v25 = {
    ["name"] = "Freiya Ice Sword",
    ["unlockedInBattlePass"] = true,
    ["items"] = {
        {
            ["itemType"] = v6.ICE_SWORD
        }
    },
    ["battlepassSeason"] = v3.season4
}
v11[v24] = v25
local v26 = v10.RAVEN
local v27 = {
    ["name"] = "Raven",
    ["unlockedInBattlePass"] = true,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["itemType"] = v6.RAVEN
        }
    },
    ["battlepassSeason"] = v3.season4
}
v11[v26] = v27
local v28 = v10.INFERNAL_SABER
local v29 = {
    ["name"] = "Infernal Saber",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.INFERNAL_SABER
        }
    }
}
v11[v28] = v29
local v30 = v10.LIGHT_SWORD
local v31 = {
    ["name"] = "Light Sword",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.HEAVENLY_SWORD
        }
    }
}
v11[v30] = v31
local v32 = v10.GRAPPLING_HOOK
local v33 = {
    ["name"] = "Grappling Hook",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.GRAPPLING_HOOK
        }
    }
}
v11[v32] = v33
local v34 = v10.VOID_SWORD
local v35 = {
    ["name"] = "Void Sword",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.VOID_SWORD
        }
    }
}
v11[v34] = v35
local v36 = v10.SCYTHE
local v37 = {
    ["name"] = "Scythe",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.SCYTHE
        }
    }
}
v11[v36] = v37
local v38 = v10.BLUNDERBUSS
local v39 = {
    ["name"] = "Blunderbuss",
    ["image"] = "rbxassetid://10722841562",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.BLUNDERBUSS
        }
    }
}
v11[v38] = v39
local v40 = v10.CUTLASS_GHOST
local v41 = {
    ["name"] = "Ghost Cutlass",
    ["image"] = "rbxassetid://10729541018",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.CUTLASS_GHOST
        }
    }
}
v11[v40] = v41
local v42 = v10.TOY_HAMMER
local v43 = {
    ["name"] = "Toy Hammer",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.TOY_HAMMER
        }
    }
}
v11[v42] = v43
local v44 = v10.TWIRL_BLADE
local v45 = {
    ["name"] = "Twirl Blade",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.TWIRLBLADE
        }
    }
}
v11[v44] = v45
local v46 = v10.GRENADE_LAUNCHER
local v47 = {
    ["name"] = "Grenade Launcher",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.GRENADE_LAUNCHER
        },
        {
            ["amount"] = 5,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.STUN_GRENADE
        }
    },
    ["preview"] = {
        ["featuredItem"] = v6.GRENADE_LAUNCHER,
        ["idleAnimation"] = v2.ROCKET_LAUNCHER_IDLE
    }
}
v11[v46] = v47
local v48 = v10.ROCKET_BELT
local v49 = {
    ["name"] = "Rocket Belt",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.ROCKET_BELT
        }
    },
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, 0.9599310885968813, 0)
    }
}
v11[v48] = v49
local v50 = v10.NECROMANCER_STAFF
local v51 = {
    ["name"] = "Necromancer Staff",
    ["image"] = "rbxassetid://11350214469",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.NECROMANCER_STAFF
        }
    }
}
v11[v50] = v51
local v52 = v10.FROSTY_HAMMER
local v53 = {
    ["name"] = "Frosty Hammer",
    ["image"] = v5(v6.FROSTY_HAMMER).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.FROSTY_HAMMER
        }
    }
}
v11[v52] = v53
v11[v10.DODO_BIRD] = {
    ["name"] = "Dodo Bird",
    ["image"] = v4.DODO_BIRD_RENDER,
    ["mount"] = v7.DODO_BIRD
}
local v54 = v10.LASER_SWORD
local v55 = {
    ["name"] = "Laser Sword",
    ["image"] = v5(v6.LASER_SWORD).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.LASER_SWORD
        }
    }
}
v11[v54] = v55
local v56 = v10.VOID_AXE
local v57 = {
    ["name"] = "Void Axe",
    ["image"] = v5(v6.VOID_AXE).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.VOID_AXE
        }
    }
}
v11[v56] = v57
local v58 = v10.GLITCH_GUITAR
local v59 = {
    ["name"] = "Glitch Guitar",
    ["image"] = v5(v6.GLITCH_GUITAR).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.GLITCH_GUITAR
        }
    }
}
v11[v58] = v59
local v60 = v10.TENNIS_RACKET
local v61 = {
    ["name"] = "Tennis Racket",
    ["image"] = v5(v6.TENNIS_RACKET).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.TENNIS_RACKET
        },
        {
            ["amount"] = 4,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.TENNIS_BALL
        }
    },
    ["preview"] = {
        ["hidden"] = true
    }
}
v11[v60] = v61
v11[v10.DINO_MOUNT] = {
    ["name"] = "Dino Mount",
    ["image"] = "rbxassetid://9855535867",
    ["mount"] = v7.DINO
}
local v62 = v10.MYTHIC_GAUNTLETS
local v63 = {
    ["name"] = v5(v6.MYTHIC_GAUNTLETS).displayName,
    ["image"] = v5(v6.MYTHIC_GAUNTLETS).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.MYTHIC_GAUNTLETS
        }
    }
}
v11[v62] = v63
local v64 = v10.FLYING_BACKPACK
local v65 = {
    ["name"] = v5(v6.FLYING_BACKPACK).displayName,
    ["image"] = v5(v6.FLYING_BACKPACK).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.FLYING_BACKPACK
        }
    },
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, 0.9599310885968813, 0)
    }
}
v11[v64] = v65
local v66 = v10.MYTHIC_DAGGER
local v67 = {
    ["name"] = v5(v6.MYTHIC_DAGGER).displayName,
    ["image"] = v5(v6.MYTHIC_DAGGER).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.MYTHIC_DAGGER
        }
    }
}
v11[v66] = v67
local v68 = v10.IMPULSE_GUN
local v69 = {
    ["name"] = "Impulse Gun",
    ["image"] = v5(v6.IMPULSE_GUN).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.IMPULSE_GUN
        }
    }
}
v11[v68] = v69
local v70 = v10.RAINBOW_STAFF
local v71 = {
    ["name"] = v5(v6.RAINBOW_STAFF).displayName,
    ["image"] = v5(v6.RAINBOW_STAFF).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.RAINBOW_STAFF
        }
    }
}
v11[v70] = v71
local v72 = v10.MYTHIC_GREAT_HAMMER
local v73 = {
    ["name"] = "Paragon",
    ["image"] = v5(v6.MYTHIC_GREAT_HAMMER).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.MYTHIC_GREAT_HAMMER
        }
    }
}
v11[v72] = v73
local v74 = v10.LEATHER_HELMET
local v75 = {
    ["name"] = "Leather Helmet",
    ["image"] = v5(v6.LEATHER_HELMET).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.LEATHER_HELMET
        }
    }
}
v11[v74] = v75
local v76 = v10.BARBARIAN_HELMET
local v77 = {
    ["name"] = "Barbarian Helmet",
    ["image"] = v5(v6.BARBARIAN_HELMET).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.BARBARIAN_HELMET
        }
    }
}
v11[v76] = v77
local v78 = v10.HEADHUNTER
local v79 = {
    ["name"] = "Headhunter",
    ["image"] = v5(v6.HEADHUNTER).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.HEADHUNTER
        },
        {
            ["amount"] = 4,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.ARROW
        }
    },
    ["preview"] = {
        ["featuredItem"] = v6.HEADHUNTER
    }
}
v11[v78] = v79
local v80 = v10.CAN_OF_BEANS
local v81 = {
    ["name"] = "Can of Beans",
    ["image"] = v5(v6.CAN_OF_BEANS).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.CAN_OF_BEANS
        }
    }
}
v11[v80] = v81
local v82 = v10.FLYING_BROOM
local v83 = {
    ["name"] = "Flying Broom",
    ["image"] = v5(v6.FLYING_BROOM_DEPLOY).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["itemType"] = v6.FLYING_BROOM_DEPLOY
        }
    },
    ["vehicle"] = v9.FLYING_BROOM,
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(-0.2617993877991494, -0.2617993877991494, 0)
    }
}
v11[v82] = v83
local v84 = v10.HUNTERS_ECHO
local v85 = {
    ["name"] = "Hunter\'s Echo",
    ["image"] = v5(v6.HUNTERS_ECHO).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["refillCooldown"] = 10,
            ["itemType"] = v6.HUNTERS_ECHO
        }
    }
}
v11[v84] = v85
local v86 = v10.FIREWORK_ROCKET_LAUNCHER
local v87 = {
    ["name"] = "Firework Rocket Launcher",
    ["image"] = v5(v6.FIREWORK_ROCKET_LAUNCHER).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.FIREWORK_ROCKET_LAUNCHER
        },
        {
            ["amount"] = 2,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.FIREWORK_ROCKET_MISSILE
        }
    },
    ["preview"] = {
        ["featuredItem"] = v6.FIREWORK_ROCKET_LAUNCHER,
        ["idleAnimation"] = v2.ROCKET_LAUNCHER_IDLE
    }
}
v11[v86] = v87
local v88 = v10.SNOWBALL_LAUNCHER
local v89 = {
    ["name"] = "Snowball Launcher",
    ["image"] = v5(v6.SNOWBALL_LAUNCHER).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.SNOWBALL_LAUNCHER
        },
        {
            ["amount"] = 4,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.SNOWBALL
        }
    },
    ["preview"] = {
        ["featuredItem"] = v6.SNOWBALL_LAUNCHER
    }
}
v11[v88] = v89
v11[v10.ELK_MOUNT] = {
    ["name"] = "Elk Mount",
    ["image"] = "rbxassetid://15716032069",
    ["mount"] = v7.ELK
}
local v90 = v10.SPIRIT_ASSASSIN_DAGGER
local v91 = {
    ["name"] = "Spirit Dagger",
    ["image"] = v5(v6.SPIRIT_DAGGER).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.SPIRIT_DAGGER
        }
    }
}
v11[v90] = v91
local v92 = v10.MENDING_CANOPY_STAFF_TIER_3
local v93 = {
    ["name"] = "Nyoka Staff",
    ["image"] = v5(v6.MENDING_CANOPY_STAFF_TIER_3).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.MENDING_CANOPY_STAFF_TIER_3
        }
    }
}
v11[v92] = v93
local v94 = v10.FALCONER_BOW
local v95 = {
    ["name"] = "Bekzat Bow",
    ["image"] = v5(v6.FALCONER_BOW).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.FALCONER_BOW
        },
        {
            ["amount"] = 4,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.ARROW
        }
    },
    ["preview"] = {
        ["featuredItem"] = v6.FALCONER_BOW
    }
}
v11[v94] = v95
local v96 = v10.DIAMOND_CHAKRAM
local v97 = {
    ["name"] = "Diamond Chakram",
    ["image"] = v5(v6.NINJA_CHAKRAM_3).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.NINJA_CHAKRAM_3
        }
    }
}
v11[v96] = v97
local v98 = v10.ARES_SPEAR
local v99 = {
    ["name"] = "Ares Spear",
    ["image"] = v5(v6.SPEAR).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["refillCooldown"] = 3,
            ["itemType"] = v6.SPEAR
        }
    }
}
v11[v98] = v99
local v100 = v10.NOCTURNE
local v101 = {
    ["name"] = "Nocturne",
    ["image"] = v5(v6.MYTHIC_SCYTHE).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.MYTHIC_SCYTHE
        }
    },
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, 3.7524578917878086, 0)
    }
}
v11[v100] = v101
local v102 = v10.ANGEL_WINGS
local v103 = {
    ["name"] = "Angel Wings",
    ["image"] = "rbxassetid://17192935133",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.ANGEL_WINGS
        }
    },
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, 3.141592653589793, 0)
    }
}
v11[v102] = v103
local v104 = v10.PARTY_HAT_LAUNCHER
local v105 = {
    ["name"] = "Party Hat Launcher",
    ["image"] = v5(v6.PARTY_HAT_LAUNCHER).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.PARTY_HAT_LAUNCHER
        },
        {
            ["amount"] = 2,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.PARTY_HAT_MISSILE
        }
    },
    ["preview"] = {
        ["featuredItem"] = v6.PARTY_HAT_LAUNCHER,
        ["idleAnimation"] = v2.ROCKET_LAUNCHER_IDLE
    }
}
v11[v104] = v105
local v106 = v10.ANNIVERSARY_BALLOONS
local v107 = {
    ["name"] = "Anniversary Balloons",
    ["image"] = v4.ANNIVERSARY_BALLOON_LOBBY_GADGET,
    ["items"] = {
        {
            ["amount"] = 3,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.ANNIVERSARY_BALLOON
        }
    },
    ["preview"] = {
        ["hideItemInHand"] = true
    }
}
v11[v106] = v107
local v108 = v10.BEACHBALL
local v109 = {
    ["name"] = "Beachball",
    ["image"] = "rbxassetid://18149456734",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.BEACHBALL
        }
    }
}
v11[v108] = v109
local v110 = v10.WATER_GUN
local v111 = {
    ["name"] = "Water Gun",
    ["image"] = "rbxassetid://102523795493590",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.WATER_GUN
        }
    }
}
v11[v110] = v111
local v112 = v10.GRIM_REAPER_SCYTHE
local v113 = {
    ["name"] = "Grim Reaper Scythe",
    ["image"] = v4.REAPER_SCYTHE,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.REAPER_SCYTHE
        }
    },
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, 3.7524578917878086, 0)
    }
}
v11[v112] = v113
local v114 = v10.JELLYFISH_MOUNT
local v115 = {
    ["name"] = "Jellyfish Mount",
    ["image"] = "rbxassetid://18129974979",
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["itemType"] = v6.JELLYFISH_MOUNT_DEPLOY
        }
    },
    ["vehicle"] = v9.JELLYFISH_MOUNT,
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, -0.7853981633974483, 0)
    }
}
v11[v114] = v115
v11[v10.SUMMER_2024_CRAB] = {
    ["name"] = "Summer 2024 Crab",
    ["image"] = "rbxassetid://18235888419",
    ["pet"] = v8.CRAB
}
v11[v10.SUMMER_2024_TURTLE] = {
    ["name"] = "Summer 2024 Turtle",
    ["image"] = "rbxassetid://18460677701",
    ["pet"] = v8.TURTLE
}
local v116 = v10.HOT_AIR_BALLOON
local v117 = {
    ["name"] = "Hot Air Balloon",
    ["image"] = "rbxassetid://13701861348",
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["itemType"] = v6.HOT_AIR_BALLOON_DEPLOY
        }
    },
    ["vehicle"] = v9.HOT_AIR_BALLOON,
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, -0.7853981633974483, 0)
    }
}
v11[v116] = v117
local v118 = v10.LASSO
local v119 = {
    ["name"] = "Lasso",
    ["image"] = "rbxassetid://7192710930",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.LASSO
        }
    }
}
v11[v118] = v119
local v120 = v10.CLOAK
local v121 = {
    ["name"] = "Cloak",
    ["image"] = "rbxassetid://18952530979",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.CLOAK
        }
    },
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, 0.9599310885968813, 0)
    }
}
v11[v120] = v121
local v122 = v10.INVISIBILITY_POTION
local v123 = {
    ["name"] = "Invisibility Potion",
    ["image"] = v5(v6.INVISIBILITY_POTION).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.INVISIBILITY_POTION
        }
    }
}
v11[v122] = v123
local v124 = v10.SKY_SCYTHE
local v125 = {
    ["name"] = "Sky Scythe",
    ["image"] = v5(v6.SKY_SCYTHE).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["refillCooldown"] = 8,
            ["itemType"] = v6.SKY_SCYTHE
        }
    }
}
v11[v124] = v125
v11[v10.HALLOWEEN_2024_SPIDER] = {
    ["name"] = "Halloween 2024 Spider",
    ["image"] = "rbxassetid://126845989227505",
    ["pet"] = v8.DEFAULT_SPIDER
}
local v126 = v10.SLEIGH
local v127 = {
    ["name"] = "Sleigh",
    ["image"] = v5(v6.SLEIGH_DEPLOY).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["itemType"] = v6.SLEIGH_DEPLOY
        }
    },
    ["vehicle"] = v9.SLEIGH,
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, -0.7853981633974483, 0)
    }
}
v11[v126] = v127
local v128 = v10.CHRISTMAS_TREE
local v129 = {
    ["name"] = "Christmas Tree",
    ["image"] = v5(v6.CHRISTMAS_TREE_DEPLOY).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["itemType"] = v6.CHRISTMAS_TREE_DEPLOY
        }
    },
    ["preview"] = {
        ["hidden"] = true
    }
}
v11[v128] = v129
local v130 = v10.BANANARANG
local v131 = {
    ["name"] = "Bananarang",
    ["image"] = "rbxassetid://115717861330143",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.BANANARANG
        }
    }
}
v11[v130] = v131
local v132 = v10.KAIDA_CLAW
local v133 = {
    ["name"] = "Kaida\'s Claw",
    ["image"] = "rbxassetid://18974202582",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.SUMMONER_CLAW_4
        }
    },
    ["preview"] = {
        ["hidden"] = true
    }
}
v11[v132] = v133
local v134 = v10.POGO_STICK
local v135 = {
    ["name"] = "Pogo Stick",
    ["image"] = "rbxassetid://105174521741104",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.POGO_STICK
        }
    }
}
v11[v134] = v135
local v136 = v10.VIP_HOVER_BOARD
local v137 = {
    ["name"] = "Hoverboard Pro Max",
    ["image"] = v4.VIP_HOVER_BOARD,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.LOBBY_VIP_HOVERBOARD
        }
    },
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(0, 0.9599310885968813, 0)
    }
}
v11[v136] = v137
local v138 = v10.SHRINK_POTION
local v139 = {
    ["name"] = "Shrink Potion",
    ["image"] = "rbxassetid://7911163448",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.SHRINK_POTION
        }
    }
}
v11[v138] = v139
local v140 = v10.SPRING_PUNCH
local v141 = {
    ["name"] = "Spring Punch",
    ["image"] = "rbxassetid://89187423732739",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.LOBBY_SPRING_PUNCH
        }
    }
}
v11[v140] = v141
v11[v10.LNY_2025_GOLDEN_SNAKE] = {
    ["name"] = "LNY 2025 Golden Snake",
    ["image"] = "rbxassetid://117347663487455",
    ["pet"] = v8.GOLDEN_SNAKE
}
local v142 = v10.EMERALD_DAO
local v143 = {
    ["name"] = "Emerald Dao",
    ["image"] = v5(v6.EMERALD_DAO).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.EMERALD_DAO
        }
    }
}
v11[v142] = v143
v11[v10.EGYPTIAN_CAT] = {
    ["name"] = "Egyptian Cat",
    ["image"] = "rbxassetid://76878942623937",
    ["pet"] = v8.EGYPTIAN_CAT
}
local v144 = v10.FLYING_CARPET
local v145 = {
    ["name"] = "Flying Carpet",
    ["image"] = "rbxassetid://140415462671020",
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["itemType"] = v6.FLYING_CARPET_DEPLOY
        }
    },
    ["vehicle"] = v9.FLYING_CARPET,
    ["preview"] = {
        ["customAngle"] = CFrame.Angles(-0.2617993877991494, 0.9599310885968813, 0)
    }
}
v11[v144] = v145
local v146 = v10.DIAMOND_GUN_BLADE
local v147 = {
    ["name"] = "Diamond Cutlass and Blunderbuss",
    ["image"] = "rbxassetid://95595318707967",
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.DIAMOND_GUN_BLADE
        }
    }
}
v11[v146] = v147
local v148 = v10.PILLOW
local v149 = {
    ["name"] = "Pillow",
    ["image"] = "rbxassetid://77581289137921",
    ["items"] = {
        {
            ["itemType"] = v6.PILLOW
        }
    }
}
v11[v148] = v149
local v150 = v10.AERY_CROWN
local v151 = {
    ["name"] = "Aery Crown",
    ["image"] = v5(v6.AERY_CROWN).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.AERY_CROWN
        }
    }
}
v11[v150] = v151
local v152 = v10.ADETUNDE_CROWN
local v153 = {
    ["name"] = "Adetunde Crown",
    ["image"] = v5(v6.ADETUNDE_CROWN).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.ADETUNDE_CROWN
        }
    }
}
v11[v152] = v153
local v154 = v10.ELEKTRA_CROWN
local v155 = {
    ["name"] = "Elektra Crown",
    ["image"] = v5(v6.ELEKTRA_CROWN).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.ELEKTRA_CROWN
        }
    }
}
v11[v154] = v155
v11[v10.JELLYFISH] = {
    ["name"] = "Jellyfish",
    ["image"] = "rbxassetid://18129975091",
    ["pet"] = v8.JELLYFISH
}
v11[v10.OWL] = {
    ["name"] = "Spirit Owl",
    ["image"] = v4.OWL_LOBBY_GADGET_PET_RENDER,
    ["pet"] = v8.OWL
}
v11[v10.CHAMELEON] = {
    ["name"] = "Chameleon Mount",
    ["image"] = v4.CHAMELEON_MOUNT_RENDER,
    ["mount"] = v7.CHAMELEON
}
v11[v10.DRAGON] = {
    ["name"] = "Dragon",
    ["image"] = "rbxassetid://118191804278594",
    ["pet"] = v8.DRAGON
}
v11[v10.BABY_PENGUIN] = {
    ["name"] = "Baby Penguin",
    ["image"] = "rbxassetid://101321886221022",
    ["pet"] = v8.BABY_PENGUIN
}
local v156 = v10.BRB_SIGN
local v157 = {
    ["name"] = "Brb",
    ["image"] = "rbxassetid://75760243397525",
    ["items"] = {
        {
            ["itemType"] = v6.BRB_SIGN
        }
    },
    ["preview"] = {
        ["idleAnimation"] = v2.HOLDING_SIGN
    }
}
v11[v156] = v157
local v158 = v10.METEOR_CALLER_STAFF
local v159 = {
    ["name"] = "Meteor Caller",
    ["image"] = v4.METEOR_STAFF,
    ["items"] = {
        {
            ["itemType"] = v6.METEOR_CALLER
        }
    }
}
v11[v158] = v159
local v160 = v10.SNOWBOARD
local v161 = {
    ["name"] = "Snowboard",
    ["image"] = v4.SNOWBOARD,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.LOBBY_SNOWBOARD
        }
    },
    ["preview"] = {
        ["hidden"] = true,
        ["customAngle"] = CFrame.Angles(0, 0.9599310885968813, 0)
    }
}
v11[v160] = v161
local v162 = v10.SNOWBOARD_SPECIAL
local v163 = {
    ["name"] = "Gift-Wrapped Snowboard",
    ["image"] = v4.SNOWBOARD_SPECIAL,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.LOBBY_SNOWBOARD_SPECIAL
        }
    },
    ["preview"] = {
        ["hidden"] = true,
        ["customAngle"] = CFrame.Angles(0, 0.9599310885968813, 0)
    }
}
v11[v162] = v163
local v164 = v10.ICE_MAGE_STAFF
local v165 = {
    ["name"] = "Freezing Staff",
    ["image"] = v5(v6.FROST_STAFF_3).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.FROST_STAFF_3
        }
    },
    ["preview"] = {
        ["disableIdleAnimation"] = true
    }
}
v11[v164] = v165
local v166 = v10.WEB_SHOOTER
local v167 = {
    ["name"] = "Web Launcher",
    ["image"] = v5(v6.WEB_LAUNCHER).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.BIG_WEB_LAUNCHER
        }
    },
    ["preview"] = {
        ["disableIdleAnimation"] = true
    }
}
v11[v166] = v167
local v168 = v10.LOVE_CHAIR
local v169 = {
    ["name"] = "Love Chair",
    ["image"] = v5(v6.LOVE_CHAIR_DEPLOY).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["refillable"] = true,
            ["itemType"] = v6.LOVE_CHAIR_DEPLOY
        }
    },
    ["preview"] = {
        ["hidden"] = true
    }
}
v11[v168] = v169
local v170 = v10.VOID_KNIGHT_SWORD
local v171 = {
    ["name"] = "Noctium Blade",
    ["image"] = v5(v6.NOCTIUM_BLADE_4).image,
    ["items"] = {
        {
            ["amount"] = 1,
            ["itemType"] = v6.NOCTIUM_BLADE_4
        }
    }
}
v11[v170] = v171
v11[v10.VOID_KNIGHT_ARMOR] = {
    ["name"] = "Noctium Armor",
    ["image"] = "rbxassetid://73636326782144"
}
v11[v10.CHICKEN] = {
    ["name"] = "Chicken",
    ["image"] = "rbxassetid://13988247449",
    ["pet"] = v8.CHICKEN
}
return {
    ["LobbyGadgetMeta"] = v11
}