local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "frosty-balance").FrostyBalance
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "scarab-balance").ScarabBalance
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-type").BattlePass
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util").JellyfishBalance
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "difficulty", "bedwars-kit-difficulty").BedwarsKitDifficulty
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "agni", "agni-util").AgniKitUtil
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-constants").SpiritSummonerBalance
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "lore", "angi-lore").AngiLoreStory
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "lore", "barbarian-lore").BarbarianLoreStory
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "lore", "evelynn-lore").EvenlynnLoreStory
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "lore", "grim-reaper-lore").GrimReaperLoreStory
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "lore", "silas-lore").SilasLoreStory
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "lore", "styx-lore").StyxLoreStory
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "lore", "trixie-lore").TrixieLoreStory
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "lore", "wren-lore").WrenLoreStory
local v30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "lore", "zephyr-lore").ZephyrLoreStory
local u31 = {
    [v9.NONE] = {
        ["name"] = "None",
        ["description"] = "The none kit.",
        ["notGiftable"] = true,
        ["disableKitRenting"] = true,
        ["kitClass"] = nil,
        ["difficulty"] = v19.NONE,
        ["renderImage"] = v10.NONE_KIT_RENDER
    },
    [v9.RANDOM] = {
        ["name"] = "Random",
        ["description"] = "A random kit will be selected when the game starts",
        ["freeKit"] = true,
        ["notGiftable"] = true,
        ["disableKitRenting"] = true,
        ["kitClass"] = nil,
        ["difficulty"] = v19.NONE,
        ["renderImage"] = v10.QUESTION_MARK_SOLID
    },
    [v9.FARMER_CLETUS] = {
        ["priceRobux"] = 399,
        ["name"] = "Farmer Cletus",
        ["description"] = "Invest your resources into crops that yield more diamonds and emeralds.",
        ["renderImage"] = "rbxassetid://9155466936",
        ["gamepassId"] = v17.isProduction() and 18876495 or 18875964,
        ["bedCoinProduct"] = {
            ["bedCoinProductId"] = 1
        },
        ["difficulty"] = v19.EASY,
        ["kitItems"] = {
            {
                ["previewOnLobbyDisplayModel"] = true,
                ["removeWhenDeactivatingKit"] = true,
                ["itemType"] = v12.WATERING_CAN
            },
            {
                ["itemType"] = v12.CARROT_SEEDS
            },
            {
                ["itemType"] = v12.MELON_SEEDS
            },
            {
                ["itemType"] = v12.PUMPKIN_SEEDS
            }
        },
        ["kitClass"] = v18.ECONOMY
    }
}
local v32 = v9.BARBARIAN
local v33 = {
    ["priceRobux"] = 399,
    ["name"] = "Barbarian",
    ["description"] = "Build rage by damaging enemies. Instead of buying swords, your sword is upgraded upon reaching max rage. You lose half your rage upon death. Emerald Sword is replaced by the Rageblade.",
    ["renderImage"] = "rbxassetid://9166207628"
}
v17.isProduction()
local v34 = 19551065
v33.gamepassId = v34
v33.bedCoinProduct = {
    ["bedCoinProductId"] = 3
}
v33.difficulty = v19.EASY
v33.kitItems = {
    {
        ["previewOnLobbyDisplayModel"] = true,
        ["featuredInKitSelection"] = true,
        ["removeWhenDeactivatingKit"] = true,
        ["itemType"] = v12.RAGEBLADE
    }
}
v33.kitClass = v18.FIGHTER
v33.lore = v23
u31[v32] = v33
local v35 = v9.BUILDER
local v36 = {
    ["priceRobux"] = 399,
    ["name"] = "Builder",
    ["description"] = "Fortify blocks with extra health and blast protection using the Builder\'s hammer. Purchase the Hammer from the Item Shop.",
    ["renderImage"] = "rbxassetid://9155463708"
}
v17.isProduction()
local v37 = 19088340
v36.gamepassId = v37
v36.bedCoinProduct = {
    ["bedCoinProductId"] = 4
}
v36.difficulty = v19.EASY
v36.kitItems = {
    {
        ["previewOnLobbyDisplayModel"] = true,
        ["featuredInKitSelection"] = true,
        ["removeWhenDeactivatingKit"] = true,
        ["itemType"] = v12.HAMMER,
        ["innateItem"] = {
            ["amount"] = 1,
            ["firstSpawnOnly"] = true
        }
    },
    {
        ["featuredInKitSelection"] = true,
        ["itemType"] = v12.STONE_BRICK,
        ["innateItem"] = {
            ["amount"] = 8,
            ["firstSpawnOnly"] = true
        }
    }
}
v36.kitClass = v18.DEFENDER
u31[v35] = v36
u31[v9.BAKER] = {
    ["priceRobux"] = 399,
    ["name"] = "Baker",
    ["description"] = "Gain access to health-gain apples, speed-boost pies, and spawn with a knockback baguette!",
    ["renderImage"] = "rbxassetid://9155463919",
    ["gamepassId"] = v17.isProduction() and 19086951 or 19088230,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 5
    },
    ["difficulty"] = v19.EASY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.BAGUETTE,
            ["innateItem"] = {
                ["amount"] = 1
            }
        },
        {
            ["itemType"] = v12.APPLE
        },
        {
            ["previewOnLobbyDisplayModel"] = true,
            ["itemType"] = v12.PIE
        },
        {
            ["itemType"] = v12.GOLDEN_APPLE
        }
    },
    ["kitClass"] = v18.SUPPORT
}
u31[v9.ARCHER] = {
    ["priceRobux"] = 399,
    ["name"] = "Archer",
    ["description"] = "Can headshot with any projectile! Deal 12.5% more projectile damage and gain access to the Tactical Crossbow in the Item Shop.",
    ["renderImage"] = "rbxassetid://9224796984",
    ["gamepassId"] = v17.isProduction() and 19275795 or 19088230,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 6
    },
    ["difficulty"] = v19.EASY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.TACTICAL_CROSSBOW
        },
        {
            ["itemType"] = v12.TACTICAL_HEADHUNTER
        }
    },
    ["kitClass"] = v18.RANGED,
    ["forgeGearSubstitutes"] = {
        [v12.WOOD_CROSSBOW] = v12.TACTICAL_CROSSBOW,
        [v12.HEADHUNTER] = v12.TACTICAL_HEADHUNTER
    }
}
local v38 = v9.SHIELDER
local v39 = {
    ["priceRobux"] = 399,
    ["name"] = "Infernal Shielder",
    ["description"] = "Spawn with a massive shield. Gain energy while holding your shield, and raise your shield to deflect incoming projectiles.",
    ["renderImage"] = "rbxassetid://9155464114"
}
v17.isProduction()
local v40 = 19546564
v39.gamepassId = v40
v39.bedCoinProduct = {
    ["bedCoinProductId"] = 7
}
v39.difficulty = v19.EASY
v39.kitItems = {
    {
        ["featuredInKitSelection"] = true,
        ["previewOnLobbyDisplayModel"] = true,
        ["removeWhenDeactivatingKit"] = true,
        ["itemType"] = v12.INFERNAL_SHIELD,
        ["innateItem"] = {
            ["amount"] = 1
        }
    }
}
v39.kitClass = v18.TANK
v39.previewLobbyDisplayConfig = {
    ["poseAnimation"] = v4.KNIGHT_SHIELD_RAISE_SHIELD
}
u31[v38] = v39
local v41 = v9.MELODY
local v42 = {
    ["priceRobux"] = 399,
    ["name"] = "Melody",
    ["description"] = "Use a guitar and the power of music to heal nearby teammates. Heal yourself for 50% of heal given.",
    ["renderImage"] = "rbxassetid://9155464915"
}
v17.isProduction()
local v43 = 19722364
v42.gamepassId = v43
v42.bedCoinProduct = {
    ["bedCoinProductId"] = 8
}
v42.difficulty = v19.EASY
v42.kitItems = {
    {
        ["featuredInKitSelection"] = true,
        ["previewOnLobbyDisplayModel"] = true,
        ["removeWhenDeactivatingKit"] = true,
        ["itemType"] = v12.GUITAR
    }
}
v42.kitClass = v18.SUPPORT
v42.abilities = {
    {
        ["abilityId"] = v3.MELODY_HEAL
    }
}
u31[v41] = v42
local v44 = v9.DAVEY
local v45 = {
    ["priceRobux"] = 399,
    ["name"] = "Pirate Davey",
    ["description"] = "Use a TNT Cannon to bombard your enemies.",
    ["renderImage"] = "rbxassetid://9155464612"
}
v17.isProduction()
local v46 = 20030035
v45.gamepassId = v46
v45.bedCoinProduct = {
    ["bedCoinProductId"] = 9
}
v45.difficulty = v19.HARD
v45.kitItems = {
    {
        ["featuredInKitSelection"] = true,
        ["previewOnLobbyDisplayModel"] = true,
        ["removeWhenDeactivatingKit"] = true,
        ["itemType"] = v12.CANNON
    },
    {
        ["featuredInKitSelection"] = true,
        ["itemType"] = v12.TNT,
        ["innateItem"] = {
            ["amount"] = 1,
            ["firstSpawnOnly"] = true
        }
    }
}
v45.kitClass = v18.DESTROYER
u31[v44] = v45
local v47 = v9.BIGMAN
local v48 = {
    ["priceRobux"] = 399,
    ["name"] = "Eldertree",
    ["description"] = "Collect tree orbs around the map to increase size and max HP. Cannot buy armor.",
    ["renderImage"] = "rbxassetid://9155467211",
    ["forceSkin"] = true
}
v17.isProduction()
local v49 = 20245233
v48.gamepassId = v49
v48.bedCoinProduct = {
    ["bedCoinProductId"] = 10
}
v48.difficulty = v19.EASY
v48.kitClass = v18.TANK
u31[v47] = v48
u31[v9.COWGIRL] = {
    ["priceRobux"] = 399,
    ["name"] = "Lassy",
    ["description"] = "Wrangle enemies towards you using a lasso.",
    ["renderImage"] = "rbxassetid://9155462968",
    ["gamepassId"] = v17.isProduction() and 20645574 or 20245233,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 11
    },
    ["difficulty"] = v19.MEDIUM,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.LASSO
        }
    },
    ["kitClass"] = v18.FIGHTER
}
u31[v9.GRIM_REAPER] = {
    ["gamepassId"] = 20872871,
    ["priceRobux"] = 399,
    ["name"] = "Grim Reaper",
    ["description"] = "Consuming enemy souls grants health regen, movespeed, and invulnerability for 2.5s. Combat is disabled while consuming.",
    ["renderImage"] = "rbxassetid://9155467410",
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 12
    },
    ["difficulty"] = v19.EASY,
    ["kitClass"] = v18.FIGHTER,
    ["lore"] = v25
}
u31[v9.WIZARD] = {
    ["gamepassId"] = 21261740,
    ["priceRobux"] = 399,
    ["name"] = "Zeno (Wizard)",
    ["description"] = "Use a magical staff to cast lightning spells.",
    ["renderImage"] = "rbxassetid://13353923546",
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 13
    },
    ["difficulty"] = v19.MEDIUM,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.WIZARD_STAFF,
            ["innateItem"] = {
                ["amount"] = 1,
                ["disableSword"] = true
            }
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.WIZARD_STICK,
            ["innateItem"] = {
                ["amount"] = 1,
                ["disableSword"] = true
            }
        },
        {
            ["itemType"] = v12.WIZARD_STAFF
        },
        {
            ["itemType"] = v12.WIZARD_STAFF_2
        },
        {
            ["itemType"] = v12.WIZARD_STAFF_3
        }
    },
    ["kitClass"] = v18.RANGED,
    ["abilities"] = {
        {
            ["innate"] = false,
            ["abilityId"] = v3.LIGHTNING_STRIKE
        },
        {
            ["innate"] = false,
            ["abilityId"] = v3.SHOCKWAVE
        },
        {
            ["innate"] = false,
            ["abilityId"] = v3.LIGHTNING_STORM
        }
    }
}
u31[v9.VULCAN] = {
    ["gamepassId"] = 21421966,
    ["priceRobux"] = 399,
    ["name"] = "Vulcan",
    ["description"] = "Use a high-tech tablet to control camera turrets across the map. While holding the tablet, mark enemies or link to your turrets\' view.",
    ["renderImage"] = "rbxassetid://9155465543",
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 14
    },
    ["difficulty"] = v19.EASY,
    ["abilities"] = {
        {
            ["abilityId"] = v3.VULCAN_ARTILLERY_MARK
        },
        {
            ["abilityId"] = v3.VULCAN_TABLET_TURRET_CONTROL
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.TABLET,
            ["innateItem"] = {
                ["amount"] = 1
            }
        },
        {
            ["itemType"] = v12.CAMERA_TURRET
        }
    },
    ["kitClass"] = v18.DEFENDER,
    ["previewLobbyDisplayConfig"] = {
        ["poseAnimation"] = v4.USE_TABLET
    }
}
u31[v9.PYRO] = {
    ["name"] = "Pyro",
    ["description"] = "Use your flamethrower to spray fir - making enemies brittle, and taking more damage from attacks. Killing brittle enemies rewards Ember, which you can use to upgrade your flamethrower.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9155464770",
    ["difficulty"] = v19.HARD,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.FLAMETHROWER
        }
    },
    ["lobbyAnimation"] = {
        ["primary"] = "rbxassetid://7303855489"
    },
    ["battlepassSeason"] = v8.season1,
    ["kitClass"] = v18.FIGHTER,
    ["previewLobbyDisplayConfig"] = {
        ["poseAnimation"] = v4.FLAMETHROWER_IDLE
    }
}
u31[v9.RAVEN] = {
    ["name"] = "Raven",
    ["description"] = "Buy ravens and fly at enemies to deliver deadly doses of poison.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166206554",
    ["difficulty"] = v19.EASY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.RAVEN
        }
    },
    ["battlepassSeason"] = v8.season1,
    ["kitClass"] = v18.RANGED,
    ["previewLobbyDisplayConfig"] = {
        ["poseAnimation"] = v4.RAVEN_HOLD
    }
}
u31[v9.BEEKEEPER] = {
    ["name"] = "Beekeeper Beatrix",
    ["description"] = "Catch bees around the map to upgrade your Bee Hive. Upgrading your Bee Hive will return additional iron and emeralds.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9312831285",
    ["difficulty"] = v19.MEDIUM,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.BEE_NET,
            ["innateItem"] = {
                ["amount"] = 1
            }
        },
        {
            ["itemType"] = v12.BEEHIVE
        }
    },
    ["battlepassSeason"] = v8.season1,
    ["kitClass"] = v18.ECONOMY
}
u31[v9.JADE] = {
    ["name"] = "Jade",
    ["description"] = "Jade carries a giant war hammer that can knock up nearby enemies.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166306816",
    ["difficulty"] = v19.HARD,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.JADE_HAMMER
        }
    },
    ["battlepassSeason"] = v8.season1,
    ["kitClass"] = v18.MOVEMENT,
    ["previewLobbyDisplayConfig"] = {
        ["poseAnimation"] = v4.JADE_HAMMER_IDLE
    }
}
u31[v9.WARRIOR] = {
    ["name"] = "Warrior",
    ["description"] = "Gain grit in battle and can keep fighting after taken fatal damage.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166207008",
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season1,
    ["kitClass"] = v18.TANK,
    ["kitItems"] = {
        {
            ["itemType"] = v12.WARRIOR_CHESTPLATE
        }
    },
    ["previewLobbyDisplayConfig"] = {
        ["armorSet"] = "WARRIOR"
    },
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.WARRIOR_STRIKE
        }
    }
}
u31[v9.BOUNTY_HUNTER] = {
    ["name"] = "Bounty Hunter",
    ["description"] = "Get assigned bounties for killing certain players in the match. Completing a bounty rewards a random amount of resources.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166208649",
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season1,
    ["kitClass"] = v18.ECONOMY,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.BOUNTY_HUNTER_REROLL
        }
    }
}
u31[v9.SPIRIT_CATCHER] = {
    ["name"] = "Spirit Catcher",
    ["description"] = "Purchase spirits from the Item Shop and place them around the map. Spirits will chase down and explode nearby enemies.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166207943",
    ["difficulty"] = v19.EASY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SPIRIT
        }
    },
    ["battlepassSeason"] = v8.season1,
    ["kitClass"] = v18.RANGED
}
u31[v9.VOID_KNIGHT] = {
    ["name"] = "Void Knight",
    ["description"] = "Feed your Void Corruption with resources and kills to upgrade your gear and unlock your abilities of Void Decay and Shielding. With enough resources, unlock the full power of the Void and become the Ascended Void Knight. Void Knight\'s base health is reduced by 10%.",
    ["renderImage"] = "rbxassetid://73636326782144",
    ["forceSkin"] = true,
    ["priceRobux"] = 399,
    ["hpModifier"] = 0.9,
    ["difficulty"] = v19.EASY,
    ["kitClass"] = v18.FIGHTER,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.VOID_KNIGHT_CONSUME_IRON
        },
        {
            ["innate"] = false,
            ["abilityId"] = v3.VOID_KNIGHT_CONSUME_EMERALD
        },
        {
            ["innate"] = false,
            ["abilityId"] = v3.VOID_KNIGHT_ASCEND
        }
    },
    ["gamepassId"] = v16.VOID_KNIGHT_KIT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 46
    }
}
u31[v9.ANGEL] = {
    ["name"] = "Trinity",
    ["description"] = "Ascend into an angelic form and switch freely between Light and Void. When you melee attack, Light form grants shield for you and allies, and Void form inflicts max health decay on your target.",
    ["priceRobux"] = 399,
    ["renderImage"] = "rbxassetid://9166208240",
    ["difficulty"] = v19.EASY,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 15
    },
    ["devProductId"] = v17.isProduction() and 1207029649 or 1206777428,
    ["kitClass"] = v18.SUPPORT,
    ["abilities"] = {
        {
            ["abilityId"] = v3.TRINITY_SWAP_FORM
        }
    }
}
u31[v9.AXOLOTL] = {
    ["name"] = "Axolotl Amy",
    ["description"] = "Use your pet axolotls to empower yourself and nearby teammates with shields, increased attack damage, faster break speed, and health regen.",
    ["priceRobux"] = 399,
    ["gamepassId"] = 24393543,
    ["renderImage"] = "rbxassetid://9155466713",
    ["difficulty"] = v19.EASY,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 16
    },
    ["kitItems"] = {
        {
            ["itemType"] = v12.DAMAGE_AXOLOTL
        },
        {
            ["itemType"] = v12.SHIELD_AXOLOTL
        },
        {
            ["itemType"] = v12.BREAK_SPEED_AXOLOTL
        },
        {
            ["itemType"] = v12.HEALTH_REGEN_AXOLOTL
        }
    },
    ["kitClass"] = v18.SUPPORT
}
u31[v9.TRAPPER] = {
    ["name"] = "Trapper",
    ["description"] = "Place Snap Traps to stun unexpecting enemies. Damaging a recently trapped enemy will consume a mark dealing extra damage.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166206875",
    ["difficulty"] = v19.HARD,
    ["battlepassSeason"] = v8.season2,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SNAP_TRAP
        }
    },
    ["kitClass"] = v18.DEFENDER
}
u31[v9.FISHERMAN] = {
    ["name"] = "Fisherman",
    ["description"] = "Why fight when you can fish?",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166208359",
    ["difficulty"] = v19.EASY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.FISHING_ROD
        }
    },
    ["battlepassSeason"] = v8.season2,
    ["kitClass"] = v18.ECONOMY,
    ["previewLobbyDisplayConfig"] = {
        ["poseAnimation"] = v4.FISHING_ROD_IDLE
    }
}
u31[v9.GHOST_CATCHER] = {
    ["name"] = "Gompy",
    ["description"] = "Gompy the Ghost Hunter! Find ghosts around the map, vacuum them and fire them across the map.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9224802656",
    ["difficulty"] = v19.HARD,
    ["battlepassSeason"] = v8.season2,
    ["kitClass"] = v18.RANGED,
    ["kitItems"] = {
        {
            ["previewOnLobbyDisplayModel"] = true,
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.VACUUM
        }
    },
    ["previewLobbyDisplayConfig"] = {
        ["poseAnimation"] = v4.VACUUM_IDLE
    }
}
u31[v9.OIL_MAN] = {
    ["name"] = "Jack",
    ["description"] = "Lob bundles of poisonous pumpkin oil across the map.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166206259",
    ["difficulty"] = v19.MEDIUM,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.OIL_CONSUMABLE
        }
    },
    ["battlepassSeason"] = v8.season2,
    ["kitClass"] = v18.RANGED
}
u31[v9.SPEARMAN] = {
    ["name"] = "Ares",
    ["description"] = "A powerful ancient warrior that uses electric-charged throwing spears to destroy his enemies.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166207341",
    ["difficulty"] = v19.MEDIUM,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SPEAR,
            ["loadoutinfo"] = {
                ["reoccuringTimeSeconds"] = 40
            }
        }
    },
    ["battlepassSeason"] = v8.season2,
    ["kitClass"] = v18.RANGED
}
u31[v9.TRIPLE_SHOT] = {
    ["name"] = "Vanessa",
    ["description"] = "Supercharge your bow to perform a triple shot.",
    ["priceRobux"] = 399,
    ["gamepassId"] = 24913310,
    ["renderImage"] = "rbxassetid://9166208149",
    ["difficulty"] = v19.EASY,
    ["kitItems"] = {
        {
            ["previewOnLobbyDisplayModel"] = true,
            ["itemType"] = v12.FEATHER_BOW
        }
    },
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 17
    },
    ["kitClass"] = v18.RANGED
}
u31[v9.INFECTED] = {
    ["name"] = "Infected",
    ["description"] = "\240\159\167\159\226\128\141\226\153\130\239\184\143",
    ["kitClass"] = nil,
    ["hiddenInShop"] = true,
    ["disableInLobby"] = true,
    ["disableKitRenting"] = true,
    ["difficulty"] = v19.NONE,
    ["renderImage"] = v10.INFECTED_RENDER
}
u31[v9.SUPER_INFECTED] = {
    ["name"] = "Super Infected",
    ["description"] = "\240\159\145\145\240\159\167\159",
    ["kitClass"] = nil,
    ["hiddenInShop"] = true,
    ["disableInLobby"] = true,
    ["disableKitRenting"] = true,
    ["difficulty"] = v19.NONE,
    ["renderImage"] = v10.SUPER_INFECTED_RENDER
}
u31[v9.INFECTED_TANK] = {
    ["name"] = "Infected Tank",
    ["description"] = "\240\159\167\159\226\128\141\226\153\130\239\184\143",
    ["kitClass"] = nil,
    ["hiddenInShop"] = true,
    ["disableInLobby"] = true,
    ["disableKitRenting"] = true,
    ["difficulty"] = v19.NONE,
    ["renderImage"] = v10.INFECTED_RENDER
}
u31[v9.INFECTED_RUSH] = {
    ["name"] = "Infected Rush",
    ["description"] = "\240\159\167\159\226\128\141\226\153\130\239\184\143",
    ["kitClass"] = nil,
    ["hiddenInShop"] = true,
    ["disableInLobby"] = true,
    ["disableKitRenting"] = true,
    ["difficulty"] = v19.NONE,
    ["renderImage"] = v10.INFECTED_RENDER
}
u31[v9.INFECTED_DISRUPTOR] = {
    ["name"] = "Infected Disruptor",
    ["description"] = "\240\159\167\159\226\128\141\226\153\130\239\184\143",
    ["kitClass"] = nil,
    ["hiddenInShop"] = true,
    ["disableInLobby"] = true,
    ["disableKitRenting"] = true,
    ["difficulty"] = v19.NONE,
    ["renderImage"] = v10.INFECTED_RENDER
}
u31[v9.INFECTED_PROWLER] = {
    ["name"] = "Infected Prowler",
    ["description"] = "\240\159\167\159\226\128\141\226\153\130\239\184\143",
    ["kitClass"] = nil,
    ["hiddenInShop"] = true,
    ["disableInLobby"] = true,
    ["disableKitRenting"] = true,
    ["difficulty"] = v19.NONE,
    ["renderImage"] = v10.INFECTED_RENDER
}
u31[v9.ICE_QUEEN] = {
    ["name"] = "Freiya",
    ["description"] = "Dealing damage will apply stacks of Frost. At four stacks, Frost is consumed and applies Frostbite to the target, making them fragile. Emerald Sword is replaced by the Ice Sword, which applies two stacks per hit. Use your Frost Explosion ability to immediately deal damage to nearby targets with stacks of Frost.",
    ["priceRobux"] = 399,
    ["gamepassId"] = 25647124,
    ["renderImage"] = "rbxassetid://9155466204",
    ["difficulty"] = v19.EASY,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 18
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.ICE_SWORD
        }
    },
    ["kitClass"] = v18.FIGHTER,
    ["forgeGearSubstitutes"] = {
        [v12.DIAMOND_SWORD] = v12.ICE_SWORD
    },
    ["abilities"] = {
        {
            ["abilityId"] = v3.ICE_QUEEN
        }
    }
}
u31[v9.AERY] = {
    ["name"] = "Aery",
    ["description"] = "Killing enemies adds to your collection of spirit butterflies. Each spirit butterfly amplifies sword & projectile damage. Aery\'s base health is reduced by 10%.",
    ["renderImage"] = "rbxassetid://9155463221",
    ["unlockedInBattlePass"] = true,
    ["hpModifier"] = 0.9,
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season3,
    ["kitClass"] = v18.FIGHTER
}
u31[v9.YETI] = {
    ["name"] = "Yeti",
    ["description"] = "Let out a Glacial Roar to temporarily freeze nearby blocks. Frozen blocks can be destroyed extremely fast.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166205917",
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season3,
    ["kitClass"] = v18.DESTROYER,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.YETI_GLACIAL_ROAR,
            ["triggerConfigOverride"] = {
                ["abilityType"] = "KitPrimary",
                ["abilityButton"] = {
                    ["icon"] = v10.YETI_GLACIAL_ROAR
                }
            }
        }
    }
}
u31[v9.GINGERBREAD_MAN] = {
    ["name"] = "Gingerbread Man",
    ["description"] = "Place gumdrops bounce pads for extreme movement. Using a gumdrop bounce pad negates all fall damage and grants a shield.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9155464364",
    ["difficulty"] = v19.HARD,
    ["battlepassSeason"] = v8.season3,
    ["kitClass"] = v18.SUPPORT,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.GUMDROP_BOUNCE_PAD
        }
    }
}
u31[v9.SANTA] = {
    ["name"] = "Santa",
    ["description"] = "Play as Santa and call in high-explosive sleigh strafe runs!",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166206101",
    ["difficulty"] = v19.HARD,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SANTA_BOMB
        },
        {
            ["itemType"] = v12.SANTA_BOMB_SIEGE
        }
    },
    ["battlepassSeason"] = v8.season3,
    ["kitClass"] = v18.DESTROYER
}
u31[v9.FROSTY] = {
    ["name"] = "Frosty",
    ["description"] = "Passively create Frosted Snowballs for free. Frosted Snowballs are larger and faster.",
    ["unlockedInBattlePass"] = true,
    ["renderImage"] = "rbxassetid://9166208762",
    ["difficulty"] = v19.EASY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.FROSTED_SNOWBALL,
            ["loadoutinfo"] = {
                ["reoccuringTimeSeconds"] = v6.GIVE_COOLDOWN
            }
        }
    },
    ["battlepassSeason"] = v8.season3,
    ["kitClass"] = v18.RANGED
}
u31[v9.REGENT] = {
    ["name"] = "Void Regent",
    ["description"] = "Use a Void Axe to dash forward while slashing at enemies, healing for a portion of the damage dealt.\n\n<i>(Part of the Holiday 2021 Bundle)</i>",
    ["notGiftable"] = true,
    ["limitedTime"] = true,
    ["renderImage"] = "rbxassetid://9166208904",
    ["difficulty"] = v19.HARD,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.VOID_AXE
        }
    },
    ["kitClass"] = v18.MOVEMENT
}
u31[v9.SMOKE] = {
    ["name"] = "Smoke",
    ["description"] = "A stealth-focused kit that uses smoke charges to grant invisibility.",
    ["renderImage"] = "rbxassetid://9155462247",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SMOKE_BOMB
        },
        {
            ["itemType"] = v12.SMOKE_BLOCK
        }
    },
    ["battlepassSeason"] = v8.season3,
    ["kitClass"] = v18.DESTROYER
}
u31[v9.DASHER] = {
    ["name"] = "Yuzi",
    ["description"] = "Swords are replaced by traditional Dao Swords. Hold attack to execute a forward dash AOE attack.",
    ["priceRobux"] = 399,
    ["gamepassId"] = 28594502,
    ["renderImage"] = "rbxassetid://9155467645",
    ["difficulty"] = v19.HARD,
    ["kitItems"] = {
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.WOOD_DAO
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.STONE_DAO
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.IRON_DAO
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.DIAMOND_DAO
        },
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.EMERALD_DAO
        }
    },
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 19
    },
    ["kitClass"] = v18.MOVEMENT,
    ["forgeGearSubstitutes"] = {
        [v12.WOOD_SWORD] = v12.WOOD_DAO,
        [v12.STONE_SWORD] = v12.STONE_DAO,
        [v12.IRON_SWORD] = v12.IRON_DAO,
        [v12.DIAMOND_SWORD] = v12.DIAMOND_DAO,
        [v12.EMERALD_SWORD] = v12.EMERALD_DAO
    },
    ["abilities"] = {
        {
            ["abilityId"] = v3.DASH
        }
    }
}
local v50 = v9.ALCHEMIST
local v51 = {
    ["name"] = "Alchemist",
    ["description"] = "Use flasks to brew various potions with foraged ingredients.",
    ["renderImage"] = "rbxassetid://9155462512",
    ["difficulty"] = v19.MEDIUM,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["itemType"] = v12.INVISIBILITY_POTION
        },
        {
            ["itemType"] = v12.ALCHEMIST_FLASK
        }
    }
}
local v52 = {
    ["abilityId"] = v3.ALCHEMIST_ADD_FLOWER
}
local v53 = {
    ["abilityType"] = "KitPrimary"
}
local v54 = {}
local v55 = v11(v12.WILD_FLOWER).image
v54.icon = v55 == nil and "" or v55
v53.abilityButton = v54
v52.triggerConfigOverride = v53
local v56 = {
    ["abilityId"] = v3.ALCHEMIST_ADD_MUSHROOMS
}
local v57 = {
    ["abilityType"] = "KitSecondary"
}
local v58 = {}
local v59 = v11(v12.MUSHROOMS).image
v58.icon = v59 == nil and "" or v59
v57.abilityButton = v58
v56.triggerConfigOverride = v57
local v60 = {
    ["abilityId"] = v3.ALCHEMIST_ADD_THORNS
}
local v61 = {
    ["abilityType"] = "KitTertiary"
}
local v62 = {}
local v63 = v11(v12.THORNS).image
v62.icon = v63 == nil and "" or v63
v61.abilityButton = v62
v60.triggerConfigOverride = v61
v51.abilities = { v52, v56, v60 }
v51.unlockedInBattlePass = true
v51.battlepassSeason = v8.season4
v51.kitClass = v18.SUPPORT
u31[v50] = v51
u31[v9.MINER] = {
    ["name"] = "Miner",
    ["description"] = "Killing enemies turns them into stone. The Miner can then break down the stone for valuables resources (scaled by the price of the enemy\'s armor + sword). Unable to purchase Axes.",
    ["renderImage"] = "rbxassetid://9166208461",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitItems"] = {
        {
            ["previewOnLobbyDisplayModel"] = true,
            ["itemType"] = v12.MINER_PICKAXE
        }
    },
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 20
    },
    ["gamepassId"] = v16.MINER,
    ["kitClass"] = v18.ECONOMY
}
u31[v9.MIDNIGHT] = {
    ["name"] = "Nyx",
    ["description"] = "Trigger the darkness of Midnight to deal ramping increased damage and armor pen.",
    ["renderImage"] = "rbxassetid://9155462763",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season4,
    ["kitClass"] = v18.FIGHTER,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.MIDNIGHT,
            ["triggerConfigOverride"] = {
                ["abilityType"] = "KitPrimary",
                ["abilityButton"] = {
                    ["icon"] = "rbxassetid://9120422525"
                }
            }
        }
    }
}
u31[v9.SHEEP_HERDER] = {
    ["name"] = "Sheep Herder",
    ["description"] = "Find and tame wild sheep around the map. Each tamed sheep amplifies your damage.",
    ["renderImage"] = "rbxassetid://9155465730",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season4,
    ["kitItems"] = {
        {
            ["previewOnLobbyDisplayModel"] = true,
            ["itemType"] = v12.CROOK
        }
    },
    ["kitClass"] = v18.FIGHTER
}
u31[v9.BEAST] = {
    ["name"] = "Crocowolf",
    ["description"] = "Being in the vicinity of damage dealt builds bloodlust. Activate Beast Form to temporarily give you enhanced damage, knockback, and movement speed. Dealing damage to non-player entities builds more bloodlust. When your bed breaks you will be given full bloodlust.",
    ["renderImage"] = "rbxassetid://9155465124",
    ["forceSkin"] = true,
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.EASY,
    ["battlepassSeason"] = v8.season4,
    ["kitClass"] = v18.FIGHTER,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.BEAST_FORM
        }
    }
}
u31[v9.METAL_DETECTOR] = {
    ["name"] = "Metal Detector",
    ["description"] = "Use a Metal Detector to find treasure around the map.",
    ["renderImage"] = "rbxassetid://9378298061",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season4,
    ["kitClass"] = v18.ECONOMY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.METAL_DETECTOR,
            ["innateItem"] = {
                ["amount"] = 1
            }
        }
    }
}
u31[v9.CONQUEROR] = {
    ["name"] = "Conqueror",
    ["description"] = "Place banners to empower nearby allies.",
    ["renderImage"] = "rbxassetid://9568930198",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season4,
    ["kitClass"] = v18.SUPPORT,
    ["kitItems"] = {
        {
            ["itemType"] = v12.DAMAGE_BANNER
        },
        {
            ["itemType"] = v12.DEFENSE_BANNER
        },
        {
            ["itemType"] = v12.HEAL_BANNER
        }
    }
}
u31[v9.CYBER] = {
    ["name"] = "Cyber",
    ["description"] = "Deploy and control drones to pick up resources from around the map. Drones can also airdrop primed TNT.",
    ["renderImage"] = "rbxassetid://9507126891",
    ["priceRobux"] = 399,
    ["gamepassId"] = 42490369,
    ["difficulty"] = v19.EASY,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 21
    },
    ["abilities"] = {
        {
            ["abilityId"] = v3.DRONE_SPEED_BOOST
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.DRONE
        }
    },
    ["kitClass"] = v18.ECONOMY
}
u31[v9.EMBER] = {
    ["name"] = "Ember",
    ["description"] = "Charge the Blade of Fire to ignite in a deadly spin! Striking enemies OR killing Lumen will upgrade your ability to a much more powerful spin.",
    ["renderImage"] = "rbxassetid://9630017904",
    ["hiddenInShopTillUnlocked"] = true,
    ["notGiftable"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.FIGHTER,
    ["forgeGearSubstitutes"] = {
        [v12.DIAMOND_SWORD] = v12.INFERNAL_SABER
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.INFERNAL_SABER
        }
    }
}
u31[v9.LUMEN] = {
    ["name"] = "Lumen",
    ["description"] = "Charge the Sword of Light to shoot powerful waves at enemies! Hitting light waves OR killing Ember will upgrade your ability to shoot many powerful beams at once.",
    ["renderImage"] = "rbxassetid://9630018371",
    ["hiddenInShopTillUnlocked"] = true,
    ["notGiftable"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.FIGHTER,
    ["forgeGearSubstitutes"] = {
        [v12.DIAMOND_SWORD] = v12.HEAVENLY_SWORD
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.HEAVENLY_SWORD
        }
    }
}
u31[v9.MERCHANT] = {
    ["name"] = "Merchant Marco",
    ["description"] = "Get resources back on certain item shop purchases! This refund is randomized each game!",
    ["renderImage"] = "rbxassetid://9872356790",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.EASY,
    ["battlepassSeason"] = v8.season5,
    ["kitClass"] = v18.ECONOMY,
    ["kitItems"] = {
        {
            ["itemType"] = v12.IRON,
            ["innateItem"] = {
                ["amount"] = 15,
                ["firstSpawnOnly"] = true
            }
        }
    },
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.MERCHANT_REROLL
        }
    }
}
u31[v9.DINO_TAMER] = {
    ["name"] = "Dino Tamer Dom",
    ["description"] = "Can purchase a Dino mount. Charge into defenses to knock them down!",
    ["renderImage"] = "rbxassetid://9872357009",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["battlepassSeason"] = v8.season5,
    ["kitClass"] = v18.DESTROYER,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.DINO_DEPLOY
        }
    },
    ["abilities"] = {
        {
            ["abilityId"] = v3.DINO_CHARGE
        }
    },
    ["previewLobbyDisplayConfig"] = {
        ["mount"] = v14.DINO
    }
}
u31[v9.WIND_WALKER] = {
    ["name"] = "Zephyr",
    ["description"] = "Killing enemies gives you a stack of wind, decaying a short while after. Each stack of wind gives you more speed and adds a second wind strike to your attack. At 5 stacks you can triple jump!",
    ["renderImage"] = "rbxassetid://9872355499",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season5,
    ["kitClass"] = v18.MOVEMENT,
    ["lore"] = v30
}
u31[v9.STAR_COLLECTOR] = {
    ["name"] = "Star Collector Stella",
    ["description"] = "Pick up floating stars around the map. Consume them while near teammates to share permanent Max Health and Critical Strike chance!",
    ["renderImage"] = "rbxassetid://9872356516",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season5,
    ["kitClass"] = v18.SUPPORT
}
u31[v9.PINATA] = {
    ["name"] = "Luc\195\173a",
    ["description"] = "Use the candy you get from damaging players to fill up your pi\195\177ata. When you\'re ready, smash it for lots of loot!",
    ["renderImage"] = "rbxassetid://10011261147",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season5,
    ["kitClass"] = v18.ECONOMY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.PINATA,
            ["innateItem"] = {
                ["amount"] = 1
            }
        }
    }
}
u31[v9.SPIRIT_ASSASSIN] = {
    ["name"] = "Evelynn",
    ["description"] = "Damage enemies to attract nearby spirits. Consume spirits to instantly teleport and gain an attack buff for a short duration.",
    ["renderImage"] = "rbxassetid://10406002412",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.HARD,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 22
    },
    ["gamepassId"] = v16.EVELYNN,
    ["kitClass"] = v18.FIGHTER,
    ["lore"] = v24
}
u31[v9.BATTERY] = {
    ["name"] = "Cobalt",
    ["description"] = "Every time you take damage you have a chance of dropping a battery on the ground. Once the battery activates you can pick it up for a small shield. After collecting 3 batteries you will overload, gaining movement speed and damage!",
    ["renderImage"] = "rbxassetid://10159166528",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["battlepassSeason"] = v8.season5,
    ["kitClass"] = v18.TANK
}
u31[v9.HANNAH] = {
    ["name"] = "Hannah",
    ["description"] = "Activate your Execute ability to defeat a nearby enemy with low health! Hannah\'s base health is reduced by 10%.",
    ["renderImage"] = "rbxassetid://10726577232",
    ["unlockedInBattlePass"] = false,
    ["priceRobux"] = 399,
    ["gamepassId"] = 83730490,
    ["hpModifier"] = 0.9,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.FIGHTER,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 23
    }
}
u31[v9.DRAGON_SLAYER] = {
    ["name"] = "Kaliyah",
    ["description"] = "A fearsome warrior with a fiery punch!",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["renderImage"] = v10.DRAGON_SLAYER_RENDER,
    ["battlepassSeason"] = v8.season6,
    ["kitClass"] = v18.FIGHTER
}
u31[v9.MAGE] = {
    ["name"] = "Whim",
    ["description"] = "Master arcane secrets to unlock elemental powers! Spawn with a magic spellbook. Deal 20% reduced damage with swords and take 10% increased damage from all sources.",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.MAGE_RENDER,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.MAGE_SPELLBOOK,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            }
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.WIZARD_STICK,
            ["innateItem"] = {
                ["amount"] = 1,
                ["disableSword"] = true
            }
        }
    },
    ["battlepassSeason"] = v8.season6,
    ["kitClass"] = v18.FIGHTER
}
u31[v9.VOID_DRAGON] = {
    ["name"] = "Xu\'rot",
    ["description"] = "Transform into Dragon Form, unlocking a decaying dragon breath and the ability to fly. Items can\'t be used while in dragon form and damage scales with the highest tier sword obtained.",
    ["unlockedInBattlePass"] = true,
    ["forceSkin"] = true,
    ["difficulty"] = v19.HARD,
    ["renderImage"] = v10.VOID_DRAGON_RENDER,
    ["battlepassSeason"] = v8.season6,
    ["kitClass"] = v18.FIGHTER,
    ["abilities"] = {
        {
            ["abilityId"] = v3.END_DRAGON
        }
    }
}
u31[v9.NECROMANCER] = {
    ["name"] = "Crypt",
    ["description"] = "Claim souls to build your undead army! Could be unlocked for FREE by completing Crypt\'s Trials during the Halloween 2022 event.",
    ["renderImage"] = "rbxassetid://11343458097",
    ["priceRobux"] = 399,
    ["gamepassId"] = 97149830,
    ["difficulty"] = v19.MEDIUM,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 24
    },
    ["kitClass"] = v18.FIGHTER,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.NECROMANCER_STAFF,
            ["innateItem"] = {
                ["amount"] = 1
            }
        }
    }
}
u31[v9.PALADIN] = {
    ["name"] = "Lani",
    ["description"] = "An ascended healer, Lani can purchase the Scepter of Light. Use this Scepter to fly to your low health allies, providing healing and damage reduction!",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["renderImage"] = v10.PALADIN_RENDER,
    ["battlepassSeason"] = v8.season6,
    ["kitClass"] = v18.SUPPORT,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SCEPTER
        }
    }
}
u31[v9.DISRUPTOR] = {
    ["name"] = "Zenith",
    ["description"] = "Deploy a satellite to disrupt enemy team economies. Enemy shop prices are increased and you get a cut of each purchase!",
    ["renderImage"] = "rbxassetid://11596993583",
    ["gamepassId"] = 104797973,
    ["priceRobux"] = 399,
    ["difficulty"] = v19.EASY,
    ["kitClass"] = v18.ECONOMY,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 25
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SATELLITE_DISH
        }
    }
}
u31[v9.JAILOR] = {
    ["name"] = "Warden",
    ["description"] = "Imprison the souls of recently killed enemies to increase their respawn time. For each actively imprisoned soul you gain Break Speed and Shield Regeneration.",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.WARDEN_RENDER,
    ["battlepassSeason"] = v8.season6,
    ["kitClass"] = v18.DESTROYER
}
u31[v9.FROSTY_HAMMER] = {
    ["name"] = "Adetunde",
    ["description"] = "Start with a powerful Frost Hammer. Damaging people using the hammer has a chance to drop Frost Crystals which can be used to upgrade your hammer.",
    ["renderImage"] = "rbxassetid://11838567073",
    ["gamepassId"] = 111620008,
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.FIGHTER,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 26
    },
    ["forgeGearSubstitutes"] = {
        [v12.WOOD_SWORD] = v12.FROSTY_HAMMER
    },
    ["abilities"] = {
        {
            ["abilityId"] = v3.FROST_SHIELD
        },
        {
            ["abilityId"] = v3.FROST_HAMMER_SLAM
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.FROSTY_HAMMER,
            ["innateItem"] = {
                ["amount"] = 1,
                ["disableSword"] = true
            }
        }
    }
}
u31[v9.SEAHORSE] = {
    ["name"] = "Sheila",
    ["description"] = "Start the game with an egg on your shoulder. Get kills to hatch and evolve your Seahorse, increasing its damage and unlocking passive abilities.\n<i>(Part of the Holiday 2022 Bundle)</i>",
    ["renderImage"] = "rbxassetid://11902552560",
    ["limitedTime"] = true,
    ["notGiftable"] = true,
    ["difficulty"] = v19.EASY,
    ["kitClass"] = v18.FIGHTER
}
u31[v9.HATTER] = {
    ["name"] = "Umbra",
    ["description"] = "Toss a hat onto other players to gain the ability to teleport to them from anywhere on the map. Ally players near the target destination are given boosted movement speed and several seconds of invulnerability while enemy players are knocked back and briefly slowed.",
    ["renderImage"] = "rbxassetid://12509388633",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.SUPPORT,
    ["battlepassSeason"] = v8.season7,
    ["abilities"] = {
        {
            ["abilityId"] = v3.HATTER_PEEK
        },
        {
            ["abilityId"] = v3.HATTER_TELEPORT
        },
        {
            ["abilityId"] = v3.HATTER_TARGET_ALERT
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.TELEPORT_HAT
        }
    }
}
u31[v9.OWL] = {
    ["name"] = "Whisper",
    ["description"] = "Control a Spirit Owl to support ally players. Unlocked at Player Level 10.",
    ["notGiftable"] = true,
    ["difficulty"] = v19.EASY,
    ["renderImage"] = v10.OWL_KIT_RENDER,
    ["kitClass"] = v18.SUPPORT,
    ["abilities"] = {
        {
            ["abilityId"] = v3.OWL_LIFT
        },
        {
            ["abilityId"] = v3.OWL_HEAL
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.OWL_ORB,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            }
        }
    }
}
u31[v9.BLOOD_ASSASSIN] = {
    ["name"] = "Caitlyn",
    ["description"] = "Fulfill assassination contracts to empower your attacks with a deadly decay.",
    ["renderImage"] = "rbxassetid://12520290159",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.FIGHTER,
    ["battlepassSeason"] = v8.season7,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.BLOOD_ASSASSIN_MENU,
            ["triggerConfigOverride"] = {
                ["abilityType"] = "KitPrimary",
                ["abilityButton"] = {
                    ["icon"] = "rbxassetid://12518331579"
                }
            }
        }
    }
}
u31[v9.QUEEN_BEE] = {
    ["name"] = "Flora",
    ["description"] = "Use explosive beehives to deal high damage to enemies or throw them at yourself for a massive launch.",
    ["renderImage"] = "rbxassetid://12671498918",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.MOVEMENT,
    ["battlepassSeason"] = v8.season7,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.QUEEN_BEE_GLIDE,
            ["triggerConfigOverride"] = {
                ["abilityType"] = "KitPrimary",
                ["abilityButton"] = {
                    ["icon"] = "rbxassetid://12669133874"
                }
            }
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.BEEHIVE_GRENADE,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            },
            ["loadoutinfo"] = {
                ["reoccuringTimeSeconds"] = v5.FLORA_GRENADE_INTERVAL
            }
        }
    }
}
u31[v9.DRILL] = {
    ["name"] = "Drill",
    ["description"] = "Purchase Drills to deploy on Diamond and Emerald generators. Drills automatically harvest 2x gen resources. Control them to fight off attackers.",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.DRILL_KIT_RENDER,
    ["kitClass"] = v18.ECONOMY,
    ["battlepassSeason"] = v8.season7,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.DRILL,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            }
        },
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.DRILL_CONTROLLER,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            }
        }
    }
}
u31[v9.LYLA] = {
    ["name"] = "Lyla",
    ["description"] = "Your bow is replaced with the Floral Bow! Shooting an enemy twice will bloom a flower on their head, attracting a swarm of bees!",
    ["gamepassId"] = 169772861,
    ["priceRobux"] = 399,
    ["difficulty"] = v19.HARD,
    ["renderImage"] = v10.FLOWER_KIT,
    ["kitClass"] = v18.RANGED,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 27
    },
    ["forgeGearSubstitutes"] = {
        [v12.WOOD_BOW] = v12.FLOWER_BOW,
        [v12.WOOD_CROSSBOW] = v12.FLOWER_CROSSBOW,
        [v12.HEADHUNTER] = v12.FLOWER_HEADHUNTER
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.FLOWER_BOW
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.FLOWER_CROSSBOW
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.FLOWER_HEADHUNTER
        }
    }
}
u31[v9.IGNIS] = {
    ["name"] = "Ignis",
    ["description"] = "Use a spirit bridge to travel around the map healing your allies and providing them with armor buffs.",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["renderImage"] = v10.IGNIS_KIT_RENDER,
    ["kitClass"] = v18.SUPPORT,
    ["battlepassSeason"] = v8.season8,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SPIRIT_BRIDGE
        }
    }
}
u31[v9.ELEKTRA] = {
    ["name"] = "Elektra",
    ["description"] = "Dash through players to deal electric damage! Hold up to two stacks of dashes and regain all stacks if you kill an enemy with your dash.",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["renderImage"] = v10.ELEKTRA_KIT_RENDER,
    ["kitClass"] = v18.MOVEMENT,
    ["battlepassSeason"] = v8.season8,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.ELECTRIC_DASH
        }
    }
}
u31[v9.CARD] = {
    ["name"] = "Fortuna",
    ["description"] = "Summon cards to attack players! Deal damage to enhance your cards with different effects.",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.FORTUNA_KIT_RENDER,
    ["kitClass"] = v18.FIGHTER,
    ["battlepassSeason"] = v8.season8,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.CARD_THROW
        },
        {
            ["abilityId"] = v3.CARD_UPGRADES
        }
    }
}
u31[v9.TALIYAH] = {
    ["name"] = "Taliyah",
    ["description"] = "Buy eggs & hatch them into chickens! Chickens can either be sold back to the merchant or deployed in combat!",
    ["notGiftable"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.TALIYAH_KIT_RENDER,
    ["kitClass"] = v18.ECONOMY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.CHICKEN_EGG
        }
    }
}
u31[v9.MIMIC] = {
    ["name"] = "Milo",
    ["description"] = "Disguise as a block and pickpocket other players!",
    ["priceRobux"] = 399,
    ["gamepassId"] = 255781462,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.MIMIC_KIT_RENDER,
    ["kitClass"] = v18.ECONOMY,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 28
    },
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.MIMIC_BLOCK
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.MIMIC_BLOCK_HIDDEN
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.MIMIC_BLOCK_PICKPOCKET
        }
    }
}
u31[v9.WARLOCK] = {
    ["name"] = "Eldric",
    ["description"] = "Drain health from enemies or sacrifice your health to heal allies. Could be unlocked for FREE by completing Crypt\'s Coven during the Halloween 2023 event.",
    ["renderImage"] = "rbxassetid://15186338366",
    ["priceRobux"] = 399,
    ["gamepassId"] = 641095710,
    ["difficulty"] = v19.HARD,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 29
    },
    ["kitClass"] = v18.FIGHTER,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.WARLOCK_STAFF,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true,
                ["disableSword"] = false
            }
        }
    },
    ["previewLobbyDisplayConfig"] = {
        ["poseAnimation"] = v4.WARLOCK_IDLE
    }
}
u31[v9.CAT] = {
    ["name"] = "Yamini",
    ["description"] = "Climb and pounce with feline dexterity! Fall damage is reduced since you always land on your feet.",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["renderImage"] = v10.CAT_KIT_RENDER,
    ["kitClass"] = v18.MOVEMENT,
    ["battlepassSeason"] = v8.season9,
    ["abilities"] = {
        {
            ["abilityId"] = v3.CAT_POUNCE
        }
    }
}
u31[v9.SLIME_TAMER] = {
    ["name"] = "Noelle",
    ["description"] = "Tame slimes to befriend your team, providing your teammates with unique buffs that strengthen over time!",
    ["renderImage"] = "rbxassetid://15379766168",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.SUPPORT,
    ["battlepassSeason"] = v8.season9,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SLIME_TAMER_FLUTE,
            ["innateItem"] = {
                ["amount"] = 1
            }
        },
        {
            ["itemType"] = v12.HEALING_SLIME
        },
        {
            ["itemType"] = v12.VOID_SLIME
        },
        {
            ["itemType"] = v12.STICKY_SLIME
        },
        {
            ["itemType"] = v12.FROSTY_SLIME
        }
    }
}
u31[v9.STEAM_ENGINEER] = {
    ["name"] = "Cogsworth",
    ["description"] = "Deploy robots that search for generators and collect resources!",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.STEAM_ENGINEER_RENDER,
    ["kitClass"] = v18.ECONOMY,
    ["battlepassSeason"] = v8.season9,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.STEAM_ENGINEER_OVERCLOCK
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.GATHER_BOT_BASIC,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            }
        },
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.GATHER_BOT_PRO
        }
    }
}
u31[v9.BLOCK_KICKER] = {
    ["name"] = "Terra",
    ["description"] = "Stomp the ground to gather protective blocks, then kick them at your enemies. Each successful hit permanently increases kick damage!",
    ["renderImage"] = "rbxassetid://15382536098",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.FIGHTER,
    ["battlepassSeason"] = v8.season9,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.BLOCK_KICK
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.BLOCK_STOMP
        }
    }
}
u31[v9.NINJA] = {
    ["name"] = "Umeko",
    ["description"] = "Use chakrams to fight at mid-range. You can turn invisible and escape from battle if you get attacked by a melee attack.",
    ["renderImage"] = "rbxassetid://15517037848",
    ["unlockedInBattlePass"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.RANGED,
    ["battlepassSeason"] = v8.season9,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.NINJA_CHAKRAM_1
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.NINJA_CHAKRAM_2
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.NINJA_CHAKRAM_3
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.NINJA_CHAKRAM_4
        }
    }
}
u31[v9.ELK_MASTER] = {
    ["name"] = "Sigrid",
    ["description"] = "Summon your mount, charge at your enemies and send them flying! Cannot use weapons while riding the Elk.",
    ["renderImage"] = "rbxassetid://15714972287",
    ["notGiftable"] = true,
    ["limitedTime"] = true,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.MOVEMENT,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.ELK_MOUNTED
        },
        {
            ["abilityId"] = v3.ELK_ANTLER_UPPERCUT
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.ELK_SUMMON
        },
        {
            ["abilityId"] = v3.ELK_DISMISS
        }
    },
    ["previewLobbyDisplayConfig"] = {
        ["mount"] = v14.ELK
    }
}
u31[v9.DRAGON_SWORD] = {
    ["name"] = "Lian",
    ["description"] = "A mysterious warrior gifted by the dragon. Control the swords to fight your enemy",
    ["renderImage"] = "rbxassetid://16215630104",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.FIGHTER,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 30
    },
    ["gamepassId"] = v16.LIAN,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.DRAGON_SWORD,
            ["triggerConfigOverride"] = {
                ["abilityType"] = "KitPrimary",
                ["abilityButton"] = {
                    ["icon"] = "rbxassetid://16215603369"
                }
            }
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.DRAGON_SWORD_ULT,
            ["triggerConfigOverride"] = {
                ["abilityType"] = "KitSecondary",
                ["abilityButton"] = {
                    ["icon"] = "rbxassetid://16215603585"
                }
            }
        }
    }
}
u31[v9.FALCONER] = {
    ["name"] = "Bekzat",
    ["description"] = "Summon a mythical falcon to dominate an area. Work in tandem to critically strike your companion\'s targets with your feather light bows",
    ["renderImage"] = "rbxassetid://17022941869",
    ["unlockedInBattlePass"] = true,
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.RANGED,
    ["forgeGearSubstitutes"] = {
        [v12.WOOD_BOW] = v12.FALCONER_BOW,
        [v12.WOOD_CROSSBOW] = v12.FALCONER_CROSSBOW,
        [v12.HEADHUNTER] = v12.FALCONER_HEADHUNTER
    },
    ["battlepassSeason"] = v8.season10,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 40
    },
    ["gamepassId"] = v16.BEKZAT_KIT,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.ACTIVATE_FALCON_INDICATOR
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.RECALL_FALCON
        },
        {
            ["abilityId"] = v3.SEND_FALCON
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.FALCONER_BOW
        },
        {
            ["itemType"] = v12.FALCONER_CROSSBOW
        },
        {
            ["itemType"] = v12.FALCONER_HEADHUNTER
        }
    }
}
u31[v9.AGNI] = {
    ["name"] = "Agni",
    ["description"] = "Throw cluster bombs at your enemies and watch them go flying! Blast off with your Rocket Boost ability.",
    ["renderImage"] = "rbxassetid://17024640133",
    ["unlockedInBattlePass"] = true,
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.FIGHTER,
    ["battlepassSeason"] = v8.season10,
    ["lore"] = v22,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 41
    },
    ["gamepassId"] = v16.AGNI_KIT,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.ROCKET_DETONATE
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.CLUSTER_BOMB,
            ["loadoutinfo"] = {
                ["reoccuringTimeSeconds"] = v20.CLUSTER_INTERVAL
            }
        }
    }
}
u31[v9.NYOKA] = {
    ["name"] = "Nyoka",
    ["description"] = "Charge your Mending Canopy to shine healing light on your allies.",
    ["renderImage"] = "rbxassetid://17022941410",
    ["unlockedInBattlePass"] = true,
    ["priceRobux"] = 399,
    ["difficulty"] = v19.EASY,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.MENDING_CANOPY_STAFF_TIER_1,
            ["loadoutinfo"] = {
                ["startingItem"] = true
            }
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.MENDING_CANOPY_STAFF_TIER_2
        },
        {
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.MENDING_CANOPY_STAFF_TIER_3
        }
    },
    ["kitClass"] = v18.SUPPORT,
    ["battlepassSeason"] = v8.season10,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 42
    },
    ["gamepassId"] = v16.NYOKA_KIT
}
u31[v9.TINKER] = {
    ["name"] = "Hephaestus",
    ["description"] = "Upgrade your Talos Mech to increase your shield and damage! Activate Self-Destruct to deal massive damage.",
    ["renderImage"] = "rbxassetid://17025762404",
    ["unlockedInBattlePass"] = true,
    ["priceRobux"] = 399,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.TANK,
    ["battlepassSeason"] = v8.season10,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 43
    },
    ["gamepassId"] = v16.HEPHAESTUS_KIT,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.TINKER_WOOD_CHAINSAW,
            ["loadoutinfo"] = {
                ["startingItem"] = true
            }
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.TINKER_DIAMOND_CHAINSAW
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.TINKER_EMERALD_CHAINSAW
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.TINKER_IRON_CHAINSAW
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.TINKER_VOID_CHAINSAW
        },
        {
            ["itemType"] = v12.TINKER_IRON_MECH_UPGRADE
        },
        {
            ["itemType"] = v12.TINKER_DIAMOND_MECH_UPGRADE
        },
        {
            ["itemType"] = v12.TINKER_EMERALD_MECH_UPGRADE
        },
        {
            ["itemType"] = v12.TINKER_VOID_MECH_UPGRADE
        }
    },
    ["abilities"] = {
        {
            ["abilityId"] = v3.TINKER_SELF_REPAIR
        },
        {
            ["abilityId"] = v3.TINKER_SELF_DESTRUCTION
        }
    },
    ["previewLobbyDisplayConfig"] = {
        ["characterScaleMultiplier"] = 0.67,
        ["mount"] = v14.TINKER
    }
}
u31[v9.STYX] = {
    ["name"] = "Styx",
    ["description"] = "Connect your Confluence portal to a slain enemy to teleport you and your allies to their location.",
    ["renderImage"] = "rbxassetid://17014536631",
    ["unlockedInBattlePass"] = true,
    ["priceRobux"] = 399,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.MOVEMENT,
    ["battlepassSeason"] = v8.season10,
    ["lore"] = v27,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 44
    },
    ["gamepassId"] = v16.STYX_KIT,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.STYX_ENTRANCE_PORTAL
        }
    }
}
u31[v9.HARPOON] = {
    ["name"] = "Triton",
    ["description"] = "An agile warrior with a Trident! Hurl your trident toward a wall, or your opponents, to quickly travel and dominate the battlefield.",
    ["renderImage"] = "rbxassetid://18250634847",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.MOVEMENT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 31
    },
    ["gamepassId"] = v16.TRITON,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.HARPOON
        }
    }
}
u31[v9.JELLYFISH] = {
    ["name"] = "Marina",
    ["description"] = "Deploy jellyfish and electrify them with your Electric Pulse ability, causing them to zap nearby enemies. Connect jellyfish to increase the range and power of your ability.",
    ["renderImage"] = "rbxassetid://18129974852",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.EASY,
    ["kitClass"] = v18.DEFENDER,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 32
    },
    ["gamepassId"] = v16.MARINA_KIT,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.ELECTRIFY_JELLYFISH,
            ["triggerConfigOverride"] = {
                ["abilityType"] = "KitPrimary",
                ["abilityButton"] = {
                    ["icon"] = v10.ELECTRIFY_JELLYFISH_ICON
                }
            }
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.JELLYFISH,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            },
            ["loadoutinfo"] = {
                ["reoccuringTimeSeconds"] = v13.GetJellyfishTime
            }
        }
    }
}
u31[v9.OASIS] = {
    ["name"] = "Nahla",
    ["description"] = "Use Water Veil to temporarily boost the health regen of nearby allies. Purchase upgrades for your Oasis Vessel to strengthen your healing and buffing abilities.",
    ["renderImage"] = "rbxassetid://120283205213823",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.SUPPORT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 54
    },
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.OASIS_HEAL_VEIL,
            ["triggerConfigOverride"] = {
                ["abilityType"] = "KitPrimary",
                ["abilityButton"] = {
                    ["icon"] = v10.OASIS_WATER_VEIL
                }
            }
        }
    },
    ["devProductId"] = v15.OASIS_KIT,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.OASIS_VESSEL,
            ["loadoutinfo"] = {
                ["startingItem"] = true
            }
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.OASIS_VESSEL_2
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.OASIS_VESSEL_3
        }
    }
}
u31[v9.BLACK_MARKET_TRADER] = {
    ["name"] = "Wren",
    ["description"] = "Summon a secret black market offering powerful potions and random deals. Earn a cut from every sale, and use shadow coins gathered from fallen players to upgrade your shop.",
    ["renderImage"] = "rbxassetid://18922642482",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.ECONOMY,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.OPEN_BLACK_MARKET
        },
        {
            ["abilityId"] = v3.CLOSE_BLACK_MARKET
        }
    },
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 34
    },
    ["gamepassId"] = v16.WREN_KIT,
    ["lore"] = v29
}
u31[v9.SWORD_SHIELD] = {
    ["name"] = "Isabel",
    ["description"] = "Upgrade her shield by purchasing better swords. Each upgraded shield will block more damage before breaking. The final upgrade, the Emerald Shield, will block all damage from the first hit. Shields reactivate after 30 seconds.",
    ["renderImage"] = "rbxassetid://131690429591874",
    ["freeKit"] = true,
    ["disableKitRenting"] = true,
    ["difficulty"] = v19.EASY,
    ["kitClass"] = v18.FIGHTER
}
u31[v9.BERSERKER] = {
    ["name"] = "Ragnar",
    ["description"] = "Use your Berserker Rage ability to increase break speed, reduce incoming damage, and prevent incoming knockback to rush in on an enemy\'s bed defense.",
    ["renderImage"] = "rbxassetid://84569046641940",
    ["freeKit"] = true,
    ["disableKitRenting"] = true,
    ["difficulty"] = v19.EASY,
    ["kitClass"] = v18.DESTROYER,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.BERSERKER_RAGE
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["itemType"] = v12.WOOD_AXE,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            }
        }
    }
}
local v64 = v9.DEFENDER
local v65 = {
    ["name"] = "Marcel"
}
local v66 = v11(v12.TESLA_TRAP).block
if v66 ~= nil then
    v66 = v66.maxPlaced
end
local v67 = v66 == nil and 2 or v66
v65.description = "Use your Defense Scanner to instantly purchase blocks in the Defense Schematic shown around your team\'s bed. Can place down " .. tostring(v67) .. " Tesla Traps."
v65.difficulty = v19.EASY
v65.renderImage = "rbxassetid://116567110607862"
v65.kitClass = v18.DEFENDER
v65.freeKit = true
v65.disableKitRenting = true
v65.previewLobbyDisplayConfig = {
    ["poseAnimation"] = v4.PAINT_SHOTGUN_IDLE
}
v65.kitItems = {
    {
        ["featuredInKitSelection"] = true,
        ["previewOnLobbyDisplayModel"] = true,
        ["itemType"] = v12.DEFENSE_SCANNER,
        ["innateItem"] = {
            ["amount"] = 1,
            ["firstSpawnOnly"] = true
        }
    }
}
u31[v64] = v65
u31[v9.NAZAR] = {
    ["name"] = "Nazar",
    ["description"] = "Give up out-of-combat health regeneration to manipulate your life force and empower your attacks or heal. Gain life force by landing shots with life arrows and attacking.",
    ["renderImage"] = "rbxassetid://18926951849",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.FIGHTER,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.CONSUME_LIFE_FORCE
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.ENABLE_LIFE_FORCE_ATTACK
        },
        {
            ["abilityId"] = v3.DISABLE_LIFE_FORCE_ATTACK
        }
    },
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 33
    },
    ["gamepassId"] = v16.NAZAR_KIT,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.LIFE_BOW
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.LIFE_CROSSBOW
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.LIFE_HEADHUNTER
        }
    }
}
u31[v9.SORCERER] = {
    ["name"] = "Death Adder",
    ["description"] = "Charge up explosive comets to rain destruction on your enemy\'s base. Collect alchemy crystals to unlock even stronger abilities!",
    ["renderImage"] = "rbxassetid://97940108361528",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.DESTROYER,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 35
    },
    ["gamepassId"] = v16.SORCERER_KIT,
    ["abilities"] = {
        {
            ["abilityId"] = v3.SORCERER_EXPLOSION_TIER_1
        },
        {
            ["abilityId"] = v3.SORCERER_EXPLOSION_TIER_2
        },
        {
            ["abilityId"] = v3.SORCERER_EXPLOSION_TIER_3
        },
        {
            ["abilityId"] = v3.SORCERER_EXPLOSION_TIER_4
        },
        {
            ["abilityId"] = v3.SORCERER_EXPLOSION_TIER_5
        },
        {
            ["abilityId"] = v3.SORCERER_PROJECTILE_CANCEL
        },
        {
            ["abilityId"] = v3.SORCERER_PROJECTILE_FIRE
        }
    }
}
u31[v9.REBELLION_LEADER] = {
    ["name"] = "Silas",
    ["description"] = "The leader of the citizens\226\128\153 rebellion, who encourages and buffs his allies with healing and damage auras!",
    ["renderImage"] = "rbxassetid://18926409564",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.SUPPORT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 36
    },
    ["gamepassId"] = v16.SILAS_KIT,
    ["lore"] = v26,
    ["abilities"] = {
        {
            ["abilityId"] = v3.REBELLION_AURA_SWAP
        },
        {
            ["abilityId"] = v3.REBELLION_SHIELD
        }
    }
}
u31[v9.SUMMONER] = {
    ["name"] = "Kaida",
    ["description"] = "Summon a powerful dragon\'s claw to swipe multiple enemies, or summon a dragon\'s head from a rune below you to damage any surrounding enemies. Upgrade your claw and spell by damaging enemies with your summon spell.",
    ["renderImage"] = "rbxassetid://18922378956",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.FIGHTER,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 37
    },
    ["gamepassId"] = v16.SUMMONER_KIT,
    ["abilities"] = {
        {
            ["abilityId"] = v3.SUMMONER_START_CHARGING
        },
        {
            ["abilityId"] = v3.SUMMONER_FINISH_CHARGING
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SUMMONER_CLAW_1
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SUMMONER_CLAW_2
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SUMMONER_CLAW_3
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SUMMONER_CLAW_4
        }
    }
}
u31[v9.SPIDER_QUEEN] = {
    ["name"] = "Arachne",
    ["description"] = "The Spider Queen uses web bridges to traverse the map and can summon spiderlings from her webs to attack enemies. Enemies are slowed if they run into her webs.",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.SPIDER_QUEEN_ICON,
    ["kitClass"] = v18.MOVEMENT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 39
    },
    ["gamepassId"] = v16.ARACHNE_KIT,
    ["abilities"] = {
        {
            ["abilityId"] = v3.SPIDER_QUEEN_WEB_BRIDGE_AIM
        },
        {
            ["abilityId"] = v3.SPIDER_QUEEN_WEB_BRIDGE_FIRE
        },
        {
            ["abilityId"] = v3.SPIDER_QUEEN_WEB_BRIDGE_CANCEL
        },
        {
            ["abilityId"] = v3.SPIDER_QUEEN_SUMMON_SPIDERS
        }
    }
}
u31[v9.SPIRIT_SUMMONER] = {
    ["name"] = "Uma",
    ["description"] = "Summon creatures from the spirit world to assist you in combat, healing, and resource collecting!",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.SPIRIT_SUMMONER_ICON,
    ["kitClass"] = v18.RANGED,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.CHANGE_SPIRIT_AFFINITY
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.SUMMON_ATTACK_SPIRIT
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.SUMMON_HEAL_SPIRIT
        }
    },
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 47
    },
    ["gamepassId"] = v16.SPIRIT_CRITTER_KIT,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SPIRIT_STAFF,
            ["innateItem"] = {
                ["amount"] = 1
            }
        },
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SUMMON_STONE,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            },
            ["loadoutinfo"] = {
                ["reoccuringTimeSeconds"] = v21.PASSIVE_RECEIVE_TIME
            }
        }
    }
}
u31[v9.SPIRIT_GARDENER] = {
    ["name"] = "Grove",
    ["description"] = "Purchase seeds and grow them into flowers that buff allies and enhance generator production. Keep your flowers alive by providing them with spirit energy gathered around the map to prevent them from withering.",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.HARD,
    ["renderImage"] = v10.SPIRIT_GARDENER_RENDER,
    ["kitClass"] = v18.ECONOMY,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 45
    },
    ["gamepassId"] = v16.GROVE_KIT,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.SPIRIT_GARDENER_WATER
        },
        {
            ["abilityId"] = v3.SPIRIT_GARDENER_WATER_CANCEL
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SOULVINE_SEED,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            }
        },
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.TEARBLOOM_SEED,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            }
        },
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.CRYSTALHEART_SEED
        }
    }
}
u31[v9.GLACIAL_SKATER] = {
    ["name"] = "Krystal",
    ["description"] = "Keep moving (especially on frozen blocks!) to increase your momentum and movement speed. At high momentum, trigger jumps to dodge.",
    ["limitedTime"] = true,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.GLACIAL_SKATER_ICON,
    ["kitClass"] = v18.MOVEMENT,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.SKATING_JUMP
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.SKATING_FREEZE
        }
    }
}
u31[v9.VOID_HUNTER] = {
    ["name"] = "Skoll",
    ["description"] = "Summon your void wolf companion Fenrir to mark an enemy. Deal extra damage to your marked target, gain a speed boost when following their trail, and see them through walls. You can detonate the mark to end the effect and deal damage. Ability cooldown reduces if Fenrir misses, and resets instantly if you kill your marked target.",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.VOID_HUNTER_KIT_RENDER,
    ["kitClass"] = v18.FIGHTER,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.VOID_HUNTER_MARK
        },
        {
            ["innate"] = false,
            ["abilityId"] = v3.VOID_HUNTER_DETONATE
        }
    },
    ["gamepassId"] = v16.SKOLL_KIT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 48
    }
}
u31[v9.VOID_WALKER] = {
    ["name"] = "Trixie",
    ["description"] = "Warp through spirit and void to teleport around and confuse your enemies in combat. Every time you use Rift Warp you gain Rift Madness which allows melee attacks to reduce Rift Warp\'s cooldown. You can also use Rift Rewind to teleport back to your last warp point.",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.HARD,
    ["renderImage"] = v10.VOID_WALKER_RENDER,
    ["kitClass"] = v18.FIGHTER,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.VOID_WALKER_WARP
        },
        {
            ["innate"] = false,
            ["abilityId"] = v3.VOID_WALKER_REWIND
        }
    },
    ["gamepassId"] = v16.TRIXIE_KIT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 49
    },
    ["lore"] = v28
}
u31[v9.CACTUS] = {
    ["name"] = "Martin",
    ["description"] = "Absorb life essence from nearby enemies and convert it to max hp! Attack is slower but passively reflects damage for melee hits to the enemy",
    ["renderImage"] = "rbxassetid://104436517801089",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.TANK,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 55
    },
    ["devProductId"] = v15.CACTUS_KIT,
    ["abilities"] = {
        {
            ["innate"] = false,
            ["abilityId"] = v3.CACTUS_FIRE
        }
    }
}
u31[v9.AIRBENDER] = {
    ["name"] = "Ramil",
    ["description"] = "Create sandstorms to control the battlefield, move enemies, and protect allies.",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.AIRBENDER_KIT_RENDER,
    ["kitClass"] = v18.FIGHTER,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 53
    },
    ["devProductId"] = v15.SANDBENDER_KIT,
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.AIRBENDER_TORNADO
        },
        {
            ["innate"] = true,
            ["abilityId"] = v3.AIRBENDER_MOVING_TORNADO
        }
    }
}
u31[v9.SCARAB] = {
    ["name"] = "Abaddon",
    ["description"] = "Places Scarab Hives that periodically spawns scarabs to seek out and attack nearby enemies and beds.",
    ["renderImage"] = "rbxassetid://137137517627492",
    ["priceRobux"] = 399,
    ["difficulty"] = v19.MEDIUM,
    ["kitClass"] = v18.FIGHTER,
    ["devProductId"] = v15.ABADDON_KIT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 56
    },
    ["abilities"] = {
        {
            ["abilityId"] = v3.PLACE_SCARAB_HIVE
        }
    },
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.SCARAB_SPAWNER,
            ["innateItem"] = {
                ["amount"] = 1,
                ["firstSpawnOnly"] = true
            },
            ["loadoutinfo"] = {
                ["reoccuringTimeSeconds"] = v7.cooldown
            }
        }
    }
}
u31[v9.GUN_BLADE] = {
    ["name"] = "Zarrah",
    ["description"] = "Wields a Cutlass and Blunderbuss. Ability fires the Blunderbuss, damaging and marking enemies ahead while knocking you back. Melee hits on marked foes reset cooldown, cause bleeding, and grant a speed boost.",
    ["renderImage"] = "rbxassetid://138231219644853",
    ["priceRobux"] = 399,
    ["releaseTime"] = 1755900000,
    ["difficulty"] = v19.HARD,
    ["kitClass"] = v18.FIGHTER,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 57
    },
    ["devProductId"] = v15.ZARRAH_KIT,
    ["kitItems"] = {
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.WOOD_GUN_BLADE
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.STONE_GUN_BLADE
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.IRON_GUN_BLADE
        },
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.DIAMOND_GUN_BLADE
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.EMERALD_GUN_BLADE
        }
    },
    ["abilities"] = {
        {
            ["abilityId"] = v3.HAND_GUN
        }
    },
    ["forgeGearSubstitutes"] = {
        [v12.WOOD_SWORD] = v12.WOOD_GUN_BLADE,
        [v12.STONE_SWORD] = v12.STONE_GUN_BLADE,
        [v12.IRON_SWORD] = v12.IRON_GUN_BLADE,
        [v12.DIAMOND_SWORD] = v12.DIAMOND_GUN_BLADE,
        [v12.EMERALD_SWORD] = v12.EMERALD_GUN_BLADE
    },
    ["previewLobbyDisplayConfig"] = {
        ["poseAnimation"] = v4.GUN_BLADE_IDLE
    }
}
u31[v9.SKELETON] = {
    ["name"] = "Marrow",
    ["description"] = "Defy death and hop around as a skull after taking mortal damage. Survive long enough in this form and you will revive! Use your ability to create poison clouds that damage and slow enemies (this ability also triggers while in skull form).",
    ["priceRobux"] = 399,
    ["releaseTime"] = 1761343200,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.SKELETON_KIT_RENDER,
    ["kitClass"] = v18.MISC,
    ["devProductId"] = v15.SKELETON_KIT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 66
    },
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.SKELETON_ABILITY
        }
    }
}
u31[v9.ICE_MAGE] = {
    ["name"] = "Sophia",
    ["description"] = "Use a Frost Staff to slow and freeze enemies!",
    ["limitedTime"] = true,
    ["releaseTime"] = 1766185200,
    ["difficulty"] = v19.MEDIUM,
    ["renderImage"] = v10.ICE_MAGE_KIT_RENDER,
    ["kitClass"] = v18.MISC,
    ["kitItems"] = {
        {
            ["featuredInKitSelection"] = true,
            ["previewOnLobbyDisplayModel"] = true,
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.FROST_STAFF_1,
            ["innateItem"] = {
                ["amount"] = 1
            }
        },
        {
            ["removeWhenDeactivatingKit"] = true,
            ["itemType"] = v12.WIZARD_STICK,
            ["innateItem"] = {
                ["amount"] = 1,
                ["disableSword"] = true
            }
        },
        {
            ["itemType"] = v12.FROST_STAFF_2
        },
        {
            ["itemType"] = v12.FROST_STAFF_3
        }
    }
}
u31[v9.SOUL_BROKER] = {
    ["name"] = "Zola",
    ["description"] = "Connect enemies with soul links! Damage dealt to linked enemies incurs bonus damage to any other linked enemies. Allies can also be linked, allowing you to take damage in their place.",
    ["priceRobux"] = 479,
    ["disableKitRenting"] = true,
    ["releaseTime"] = 1776463200,
    ["renderImage"] = v10.ZOLA_KIT_RENDER,
    ["kitClass"] = v18.SUPPORT,
    ["difficulty"] = v19.MEDIUM,
    ["devProductId"] = v15.SOUL_BROKER_KIT,
    ["bedCoinProduct"] = {
        ["bedCoinProductId"] = 71
    },
    ["abilities"] = {
        {
            ["innate"] = true,
            ["abilityId"] = v3.SOUL_LINK
        }
    }
}
local v68 = u2.values(v8)
local function v77(p69, p70) --[[ Line: 2557 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u31
    --]]
    local v71 = 0
    local v72 = {}
    for v73, v74 in u2.entries(u31) do
        local _ = v73 - 1
        local v75 = v74[1]
        local v76 = v74[2]
        if not v76.battlepassSeason or v76.battlepassSeason ~= p70 then
            v75 = nil
        end
        if v75 ~= nil then
            v71 = v71 + 1
            v72[v71] = v75
        end
    end
    p69[p70] = v72
    return p69
end
local v78 = {}
local function v80(p79) --[[ Line: 2553 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    return u31[p79]
end
for v81 = 1, #v68 do
    v78 = v77(v78, v68[v81], v81 - 1, v68)
end
return {
    ["getBedwarsKitMeta"] = v80,
    ["BedwarsKitMeta"] = u31,
    ["BedwarsBPKits"] = v78
}