local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.AbilityState
local v4 = v2.ColorUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file")
local v7 = v6.BalanceFile
local v8 = v6.DinoTamerBalance
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "black-marketeer-balance").BlackMarketeerBalance
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cat-balance").CatBalance
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "frosty-hammer-balance").FrostyHammerBalance
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "jade-balance").JadeBalance
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "juggernaut-balance-file").JuggernautUtil
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "owl-balance-file").OwlBalance
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance")
local v16 = v15.SorcererBalance
local v17 = v15.SorcererTier
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-regent-balance").VoidRegentBalance
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "werewolf-tail-balance").WerewolfTailBalance
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "agni", "agni-util").AgniKitUtil
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "beast", "beast-util").BeastKit
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "block-kicker", "block-kicker-kit-balance").BlockKickerKitBalance
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "falconer", "falcon-constants").SEND_BIRD_COOLDOWN
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "glacial-skater", "glacial-skater-balance").GlacialSkaterBalance
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "nazar", "nazar-kit-balance").NazarKitBalance
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "queen-bee", "queen-bee-util").QueenBeeUtil
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cactus-balance").CactusBalance
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "gun-blade-balance").GunBladeBalance
local v30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "airbender", "airbender-kit-balance").AirbenderKitBalance
local v31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "berserker", "berserker-kit-balance").BerserkerKitBalance
local v32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "melody", "melody-kit-balance").MelodyKitBalance
local v33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "skeleton", "skeleton-kit-balance").SkeletonKitBalance
local v34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-gardener", "spirit-gardener-balance").SpiritGardenerKitBalance
local v35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "steam-engineer", "gather-bot-constants").GatherBotBalance
local v36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-balance").SummonerKitBalance
local v37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "void-hunter", "void-hunter-kit-balance").VoidHunterKitBalance
local v38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "void-walker", "void-walker-kit-balance").VoidWalkerKitBalance
local v39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "vulcan", "vulcan-util").VulcanUtil
local v40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-config").BlockHuntConfig
local v41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-currency-categories")
local v42 = v41.getHiderCurrency
local v43 = v41.HiderScoreType
local v44 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v45 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v46 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v47 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "firework-backpack", "firework-backpack-balance").FireworkBackpackBalance
local v48 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "oasis", "oasis-constants").OasisBalance
local v49 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-constants", "elk-constants").ElkConstants
local v50 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local v51 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "wormhole", "wormhole-util").WormholeUtil
local v52 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local v53 = {
    [v52.RECALL] = {
        ["actionBarName"] = "Go to base",
        ["cooldown"] = {
            ["id"] = v20.WORMHOLE,
            ["duration"] = v51.WORMHOLE_COOLDOWN
        },
        ["blockingStatusEffects"] = { v50.SILENCE }
    },
    [v52.SUPER_JUMP] = {
        ["actionBarName"] = "Super Jump",
        ["cooldown"] = {
            ["duration"] = 3,
            ["id"] = v20.SUPER_JUMP
        },
        ["blockingStatusEffects"] = { v50.SILENCE }
    },
    [v52.TRUMPET_PLAY] = {
        ["actionBarName"] = "Trumpet Play",
        ["cooldown"] = {
            ["duration"] = 1,
            ["id"] = v20.TRUMPET
        },
        ["blockingStatusEffects"] = { v50.SILENCE }
    },
    [v52.PARTY_POPPER] = {
        ["actionBarName"] = "Party Popper",
        ["cooldown"] = {
            ["duration"] = 1,
            ["id"] = v20.PARTY_POPPER
        },
        ["blockingStatusEffects"] = { v50.SILENCE }
    },
    [v52.GLITCH_TRUMPET_PLAY] = {
        ["actionBarName"] = "Trumpet Play",
        ["cooldown"] = {
            ["duration"] = 1,
            ["id"] = v20.GLITCH_TRUMPET
        },
        ["blockingStatusEffects"] = { v50.SILENCE }
    },
    [v52.OASIS_HEAL_PROJECTILE] = {
        ["actionBarName"] = "Oasis Heal Projectile",
        ["cooldown"] = {
            ["id"] = v20.OASIS_PROJECTILE,
            ["duration"] = v48.ProjectileCooldown
        },
        ["blockingStatusEffects"] = {}
    },
    [v52.OASIS_BUFF_PROJECTILE] = {
        ["actionBarName"] = "Oasis Buff Projectile",
        ["cooldown"] = {
            ["id"] = v20.OASIS_PROJECTILE,
            ["duration"] = v48.ProjectileCooldown
        },
        ["blockingStatusEffects"] = {}
    },
    [v52.OASIS_SWAP_STAFF] = {
        ["actionBarName"] = "Oasis Swap Staff",
        ["cooldown"] = {
            ["duration"] = 1,
            ["id"] = v20.NYOKA_SWAP
        }
    },
    [v52.OASIS_HEAL_VEIL] = {
        ["actionBarName"] = "Oasis Heal Veil",
        ["cooldown"] = {
            ["duration"] = 20,
            ["id"] = v20.OASIS_HEAL_VEIL
        },
        ["blockingStatusEffects"] = {}
    },
    [v52.SELF_DAMAGE] = {
        ["actionBarName"] = "Self Damage",
        ["usableProgress"] = {
            ["progressNeededPerUse"] = 3
        }
    },
    [v52.MIDNIGHT] = {
        ["actionBarName"] = "Midnight",
        ["usableProgress"] = {
            ["progressNeededPerUse"] = 120,
            ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v4.hexColor(13558527)), ColorSequenceKeypoint.new(1, v4.hexColor(12904703)) })
        },
        ["blockingStatusEffects"] = { v50.SILENCE }
    },
    [v52.DASH] = {
        ["actionBarName"] = "Dash",
        ["usableProgress"] = {
            ["progressNeededPerUse"] = 2,
            ["stacks"] = 4,
            ["initialProgress"] = 8,
            ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v4.hexColor(13558527)), ColorSequenceKeypoint.new(1, v4.hexColor(12904703)) })
        },
        ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
    },
    [v52.VOID_AXE_JUMP] = {
        ["actionBarName"] = "Void Slam",
        ["cooldown"] = {
            ["id"] = v20.VOID_AXE,
            ["duration"] = v18.AXE_COOLDOWN
        },
        ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
    },
    [v52.JADE_HAMMER_JUMP] = {
        ["actionBarName"] = "Hammer Leap",
        ["cooldown"] = {
            ["id"] = v20.JADE_HAMMER,
            ["duration"] = v12.HAMMER_COOLDOWN
        },
        ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
    }
}
local v54 = v52.DINO_CHARGE
local v55 = {
    ["actionBarName"] = "Charge Attack",
    ["cooldown"] = {
        ["id"] = v20.DINO_ATTACK,
        ["duration"] = v5:IsStudio() and 5 or v8.DINO_CHARGE_COOLDOWN
    }
}
local v56 = {}
local v57 = {}
local v58 = v45(v46.DINO_DEPLOY).image
v57.icon = v58 == nil and "" or v58
v56.abilityButton = v57
v56.abilityType = "KitPrimary"
v55.triggerConfig = v56
v55.blockingStatusEffects = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
v53[v54] = v55
v53[v52.VOID_TURRET_FIRE] = {
    ["actionBarName"] = "Void Laser",
    ["cooldown"] = {
        ["duration"] = 2.4,
        ["id"] = v20.VOID_LASER
    }
}
v53[v52.VULCAN_ARTILLERY_MARK] = {
    ["actionBarName"] = "Artillery Mark",
    ["actionBarDescription"] = "Mark an enemy causing up to 3 nearby turrets to fire at them. Will not have an effect if there are no turrets nearby.",
    ["cooldown"] = {
        ["id"] = v20.VULCAN_ARTILLERY_MARK,
        ["duration"] = v39.ARTILLERY_MARK_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.TURRET_CROSSHAIR
        }
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
local v59 = v52.VULCAN_TABLET_TURRET_CONTROL
local v60 = {
    ["actionBarName"] = "Turret Link",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.VULCAN_TABLET_TURRET_CONTROL
    }
}
local v61 = {}
local v62 = {}
local v63 = v45(v46.TABLET).image
v62.icon = v63 == nil and "" or v63
v61.abilityButton = v62
v61.abilityType = "ItemSecondary"
v60.triggerConfig = v61
v60.blockingStatusEffects = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
v53[v59] = v60
v53[v52.ROCKET_BELT] = {
    ["actionBarName"] = "Rocket Belt",
    ["cooldown"] = {
        ["duration"] = 15,
        ["id"] = v20.ROCKET_BELT
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.HEALING_BACKPACK] = {
    ["actionBarName"] = "First Aid",
    ["cooldown"] = {
        ["duration"] = 20,
        ["id"] = v20.HEALING_BELT
    }
}
v53[v52.PUMPKIN_BACKPACK] = {
    ["actionBarName"] = "Trigger",
    ["cooldown"] = {
        ["duration"] = 20,
        ["id"] = v20.HEALING_BELT
    }
}
v53[v52.DETONATE_BOMB] = {
    ["actionBarName"] = "Detonate",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.DETONATE_BOMB
    }
}
v53[v52.PIRATE_TELESCOPE] = {
    ["actionBarName"] = "Telescope",
    ["cooldown"] = {
        ["duration"] = 20,
        ["id"] = v20.PIRATE_TELESCOPE
    }
}
v53[v52.END_DRAGON] = {
    ["actionBarName"] = "Exit Dragon Form",
    ["cooldown"] = {
        ["duration"] = 5,
        ["id"] = v20.DRAGON_BREATH
    }
}
v53[v52.PALADIN_ABILITY] = {
    ["actionBarName"] = "Teleport",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.PALADIN_ABILITY
    }
}
v53[v52.TREASURE_BACKPACK] = {
    ["actionBarName"] = "Open Shop",
    ["cooldown"] = {
        ["duration"] = 0,
        ["id"] = v20.BACKPACK
    }
}
v53[v52.THRUSTER_BACKPACK] = {
    ["actionBarName"] = "Open Shop",
    ["cooldown"] = {
        ["duration"] = 10,
        ["id"] = v20.THRUSTER
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.SPIRIT_ASSASSIN_TELEPORT] = {
    ["actionBarName"] = "Teleport",
    ["cooldown"] = {
        ["duration"] = 10,
        ["id"] = v20.NO_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.TELEPEARL] = {
    ["actionBarName"] = "Teleport",
    ["cooldown"] = {
        ["duration"] = 10,
        ["id"] = v20.NO_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.JUGGERNAUT_ULTIMATE] = {
    ["actionBarName"] = "Ult",
    ["cooldown"] = {
        ["id"] = v20.JUGGERNAUT_ULT,
        ["duration"] = v13.ULT_COOLDOWN,
        ["config"] = {
            ["playSounds"] = true
        }
    }
}
v53[v52.JUGGERNAUT_SPIN] = {
    ["actionBarName"] = "SPIN",
    ["cooldown"] = {
        ["id"] = v20.JUGGERNAUT_SPIN,
        ["duration"] = v13.SPIN_COOLDOWN,
        ["config"] = {
            ["playSounds"] = true
        }
    }
}
v53[v52.JUGGERNAUT_DASH] = {
    ["actionBarName"] = "DASH",
    ["cooldown"] = {
        ["id"] = v20.JUGGERNAUT_DASH,
        ["duration"] = v13.DASH_COOLDOWN,
        ["config"] = {
            ["playSounds"] = true
        }
    }
}
v53[v52.FROST_SHIELD] = {
    ["actionBarName"] = "Permafrost Shield",
    ["cooldown"] = {
        ["id"] = v20.FROST_SHIELD,
        ["duration"] = v11.SHIELD_COOLDOWN,
        ["config"] = {
            ["playSounds"] = true
        }
    },
    ["triggerConfig"] = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.FROST_SHIELD,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(66, 232, 255)
            }
        }
    }
}
v53[v52.FROST_HAMMER_SLAM] = {
    ["actionBarName"] = "Arctic Slam",
    ["cooldown"] = {
        ["id"] = v20.FROST_SLAM,
        ["duration"] = v11.SLAM_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.FROST_HAMMER_SLAM,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(66, 232, 255)
            }
        }
    }
}
v53[v52.NOXIOUS_SLEDGEHAMMER_SLAM] = {
    ["actionBarName"] = "Crush",
    ["clientPredictUseAbility"] = true,
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 2,
        ["stacks"] = 3,
        ["initialProgress"] = 6,
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v4.hexColor(9371415)), ColorSequenceKeypoint.new(1, v4.hexColor(7274240)) })
    }
}
v53[v52.USE_CONFETTI_CANNON] = {
    ["actionBarName"] = "Confetti Cannon",
    ["cooldown"] = {
        ["duration"] = 20,
        ["id"] = v20.NO_COOLDOWN
    }
}
v53[v52.HATTER_TELEPORT] = {
    ["actionBarName"] = "Teleport",
    ["cooldown"] = {
        ["duration"] = 3,
        ["id"] = v20.HATTER_TELEPORT
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://12517846659",
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(235, 95, 180)
            }
        }
    }
}
v53[v52.HATTER_PEEK] = {
    ["actionBarName"] = "Peek",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.NO_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://12517846385",
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(235, 95, 180)
            }
        }
    }
}
v53[v52.HATTER_TARGET_ALERT] = {
    ["actionBarName"] = "Alert Hatter",
    ["cooldown"] = {
        ["duration"] = 5,
        ["id"] = v20.NO_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "MiscPrimary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://12517846780",
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(235, 95, 180)
            }
        }
    }
}
v53[v52.HOVERBOARD_LONG_JUMP] = {
    ["actionBarName"] = "A Trick!",
    ["cooldown"] = {
        ["duration"] = 3,
        ["id"] = v20.HOVERBOARD_LONG_JUMP
    }
}
v53[v52.SUMMON_OWL] = {
    ["actionBarName"] = "Summon Owl",
    ["cooldown"] = {
        ["duration"] = 3,
        ["id"] = v20.SUMMON_OWL
    }
}
v53[v52.DEACTIVE_OWL] = {
    ["actionBarName"] = "Deactive Owl",
    ["cooldown"] = {
        ["duration"] = 3,
        ["id"] = v20.SUMMON_OWL
    }
}
v53[v52.OWL_LIFT] = {
    ["actionBarName"] = "Owl Lift",
    ["cooldown"] = {
        ["id"] = v20.OWL_LIFT,
        ["duration"] = v14.OWL_LIFT_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.OWL_WINGS
        }
    }
}
v53[v52.OWL_HEAL] = {
    ["actionBarName"] = "Heal + Speed",
    ["cooldown"] = {
        ["id"] = v20.OWL_HEAL,
        ["duration"] = v14.OWL_HEAL_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.OWL_HEAL
        }
    }
}
v53[v52.BLOOD_ASSASSIN_MENU] = {
    ["actionBarName"] = "Contracts",
    ["clientPredictUseAbility"] = true
}
v53[v52.RAINBOW_AXE] = {
    ["actionBarName"] = "Activate",
    ["cooldown"] = {
        ["id"] = v20.RAINBOW_AXE,
        ["duration"] = v7.RAINBOW_AXE_ABILITY_COOLDOWN,
        ["config"] = {
            ["cooldownBar"] = {
                ["color"] = Color3.fromRGB(247, 133, 212)
            }
        }
    }
}
v53[v52.MURDERER_DAGGER_KILL] = {
    ["actionBarName"] = "Kill",
    ["cooldown"] = {
        ["duration"] = 0.5,
        ["id"] = v20.MURDERER_KILL
    }
}
v53[v52.QUEEN_BEE_GLIDE] = {
    ["actionBarName"] = "Glide",
    ["cooldown"] = {
        ["id"] = v20.QUEEN_BEE_GLIDE,
        ["duration"] = v27.GLIDE_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.ACTIVE_SHIELDER_INDICATOR] = {
    ["actionBarName"] = "Leap",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.ACTIVE_SHIELDER_INDICATOR
    }
}
v53[v52.DEACTIVE_SHIELDER_INDICATOR] = {
    ["actionBarName"] = "Leap",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.ACTIVE_SHIELDER_INDICATOR
    }
}
v53[v52.SHIELDER_ULT] = {
    ["actionBarName"] = "Leap",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.ACTIVE_SHIELDER_INDICATOR
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.WIZARD_MANA] = {
    ["actionBarName"] = "Mana",
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 2,
        ["stacks"] = 4,
        ["initialProgress"] = 8,
        ["gradientRotation"] = 0,
        ["stacksBarDividerTransparency"] = 0.4,
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 205, 205)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 161, 247)) }),
        ["stacksBarDividerColor"] = v4.WHITE
    }
}
v53[v52.WIZARD_MANA_2] = {
    ["actionBarName"] = "Mana",
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 2,
        ["stacks"] = 5,
        ["initialProgress"] = 10,
        ["gradientRotation"] = 0,
        ["stacksBarDividerTransparency"] = 0.4,
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 205, 205)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 161, 247)) }),
        ["stacksBarDividerColor"] = v4.WHITE
    }
}
v53[v52.WIZARD_MANA_3] = {
    ["actionBarName"] = "Mana",
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 2,
        ["stacks"] = 6,
        ["initialProgress"] = 12,
        ["gradientRotation"] = 0,
        ["stacksBarDividerTransparency"] = 0.4,
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 205, 205)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 161, 247)) }),
        ["stacksBarDividerColor"] = v4.WHITE
    }
}
v53[v52.LIGHTNING_STRIKE] = {
    ["actionBarName"] = "Lightning Strike",
    ["cooldown"] = {
        ["duration"] = 0.8,
        ["id"] = v20.LIGHTNING_STRIKE
    }
}
v53[v52.CLOUD_LIGHTNING_STRIKE] = {
    ["actionBarName"] = "Lightning Strike",
    ["cooldown"] = {
        ["duration"] = 2,
        ["id"] = v20.CLOUD_LIGHTNING_STRIKE
    }
}
v53[v52.SHOCKWAVE] = {
    ["actionBarName"] = "Shockwave",
    ["cooldown"] = {
        ["duration"] = 15,
        ["id"] = v20.SHOCKWAVE
    }
}
v53[v52.LIGHTNING_STORM] = {
    ["actionBarName"] = "Lightning Storm",
    ["cooldown"] = {
        ["duration"] = 30,
        ["id"] = v20.LIGHTNING_STORM
    }
}
v53[v52.ELECTRIC_DASH] = {
    ["actionBarName"] = "Electric Dash",
    ["clientPredictUseAbility"] = true,
    ["usableProgress"] = {
        ["displayProgressOnButton"] = true,
        ["progressNeededPerUse"] = 1,
        ["stacks"] = 2,
        ["initialProgress"] = 0
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.ELECTRIC_DASH_ICON
        }
    }
}
v53[v52.CARD_THROW] = {
    ["actionBarName"] = "Card Throw",
    ["cooldown"] = {
        ["duration"] = 15,
        ["id"] = v20.CARD_THROW
    },
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.CARD_THROW,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(70, 53, 26)
            }
        }
    }
}
v53[v52.CARD_UPGRADES] = {
    ["actionBarName"] = "See Current Upgrades",
    ["triggerConfig"] = {
        ["abilityType"] = "KitTertiary",
        ["abilityButton"] = {
            ["icon"] = v44.CARD_UPGRADE,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(70, 53, 26)
            }
        }
    }
}
v53[v52.IMPULSE_GUN] = {
    ["actionBarName"] = "Impulse Gun",
    ["cooldown"] = {
        ["duration"] = 3,
        ["id"] = v20.IMPULSE_GUN
    }
}
v53[v52.HOT_AIR_BALLOON_TNT] = {
    ["actionBarName"] = "Drop TNT",
    ["cooldown"] = {
        ["duration"] = 3,
        ["id"] = v20.HOT_AIR_BALLOON_TNT
    }
}
v53[v52.DAGGER_DASH] = {
    ["actionBarName"] = "Dash",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.NO_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.SCYTHE_DASH_AND_SPIN] = {
    ["actionBarName"] = "Reap",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.NO_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.SPIRIT_BRIDGE] = {
    ["actionBarName"] = "Spirit Bridge",
    ["cooldown"] = {
        ["duration"] = 60,
        ["id"] = v20.SPIRIT_BRIDGE
    }
}
v53[v52.WORLD_EDIT_RADIAL_WHEEL] = {
    ["actionBarName"] = "World Edit",
    ["clientPredictUseAbility"] = true
}
v53[v52.CONDIMENT_GUN_CYCLE] = {
    ["actionBarName"] = "Switch Condiment"
}
v53[v52.BLOCK_PICKER] = {
    ["actionBarName"] = "Get current highlighted block.",
    ["cooldown"] = {
        ["duration"] = 0.25,
        ["id"] = v20.NO_COOLDOWN
    }
}
v53[v52.VOID_KNIGHT_CONSUME_IRON] = {
    ["actionBarName"] = "Consume Iron",
    ["actionBarDescription"] = "Consume iron to feed the Void Corruption within you and grow stronger.",
    ["cooldown"] = {
        ["duration"] = 0.2,
        ["id"] = v20.VOID_KNIGHT_CONSUME_IRON
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.VOID_KNIGHT_CONSUME_IRON,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(200, 50, 200),
                [v3.DISABLED] = Color3.fromRGB(200, 200, 200)
            }
        }
    }
}
v53[v52.VOID_KNIGHT_CONSUME_EMERALD] = {
    ["actionBarName"] = "Consume Emeralds",
    ["actionBarDescription"] = "Consume emeralds to feed the Void Corruption within you and grow stronger.",
    ["cooldown"] = {
        ["duration"] = 0.2,
        ["id"] = v20.VOID_KNIGHT_CONSUME_IRON
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.VOID_KNIGHT_CONSUME_EMERALD,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(200, 50, 200),
                [v3.DISABLED] = Color3.fromRGB(200, 200, 200)
            }
        }
    }
}
v53[v52.VOID_KNIGHT_ASCEND] = {
    ["actionBarName"] = "Void Ascension",
    ["actionBarDescription"] = "Allow the Void to grant you its full power and temporarily ascend to a higher form.",
    ["cooldown"] = {
        ["duration"] = 60,
        ["id"] = v20.VOID_KNIGHT_ASCENDANCY
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.VOID_KNIGHT_TIER_5,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(200, 50, 200),
                [v3.DISABLED] = Color3.fromRGB(200, 200, 200)
            }
        }
    }
}
v53[v52.MIMIC_BLOCK] = {
    ["actionBarName"] = "Block Morph",
    ["actionBarDescription"] = "Morph into selected block.",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.NO_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.MIMIC_BLOCK
        }
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.MIMIC_BLOCK_HIDDEN] = {
    ["actionBarName"] = "Block Morph",
    ["actionBarDescription"] = "Morph into selected block.",
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 1,
        ["stacks"] = 120,
        ["initialProgress"] = 120,
        ["stacksBarDividerTransparency"] = 1,
        ["gradientRotation"] = 0,
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.5, 0.5)), ColorSequenceKeypoint.new(1, Color3.new(0.18, 0.77, 0.28)) })
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary"
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE }
}
v53[v52.MIMIC_BLOCK_PICKPOCKET] = {
    ["actionBarName"] = "Pickpocket",
    ["cooldown"] = {
        ["duration"] = 0.5,
        ["id"] = v20.MIMIC_BLOCK_PICKPOCKET
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.WEREWOLF_HOWL] = {
    ["actionBarName"] = "Howl",
    ["cooldown"] = {
        ["id"] = v20.WEREWOLF_HOWL,
        ["duration"] = v19.HOWL_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.BH_HIDER_DISGUISE_BLOCK] = {
    ["actionBarName"] = "Morph into the selected block!",
    ["cooldown"] = {
        ["duration"] = 3,
        ["id"] = v20.BH_HIDER_DISGUISE_BLOCK
    }
}
local v64 = v52.BH_HIDER_TAUNT_SOUND
local v65 = {
    ["actionBarName"] = "Play a sound to taunt nearby hunters!"
}
local v66 = v43.TauntSound
v65.actionBarDescription = "+" .. tostring(v42(v66)) .. " Coins"
v65.cooldown = {
    ["duration"] = 10,
    ["id"] = v20.BH_HIDER_TAUNT_SOUND
}
v53[v64] = v65
local v67 = v52.BH_HIDER_TAUNT_FIREWORK
local v68 = {
    ["actionBarName"] = "Send up a firework to taunt nearby hunters!"
}
local v69 = v43.TauntFirework
v68.actionBarDescription = "+" .. tostring(v42(v69)) .. " Coins"
v68.cooldown = {
    ["duration"] = 20,
    ["id"] = v20.BH_HIDER_TAUNT_FIREWORK
}
v68.blockingStatusEffects = { v50.SILENCE }
v53[v67] = v68
local v70 = v52.BH_HIDER_INVISIBLITY
local v71 = {}
local v72 = v40.HIDER_INVISIBLITY_DURATION
v71.actionBarName = "Turn invisible for " .. tostring(v72) .. " second" .. (v40.HIDER_INVISIBLITY_DURATION > 1 and "s" or "") .. "."
v71.cooldown = {
    ["duration"] = 120,
    ["id"] = v20.BH_HIDER_INVISIBLITY
}
v71.blockingStatusEffects = { v50.SILENCE }
v53[v70] = v71
v53[v52.WARLOCK_LINK] = {
    ["actionBarName"] = "Link target",
    ["cooldown"] = {
        ["duration"] = 0.5,
        ["id"] = v20.WARLOCK
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.CAT_POUNCE] = {
    ["actionBarName"] = "Pounce",
    ["cooldown"] = {
        ["id"] = v20.CAT_POUNCE,
        ["duration"] = v10.POUNCE_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.FROSTED, v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.CAT_POUNCE
        }
    }
}
local v73 = v52.SORCERER_EXPLOSION_TIER_1
local v74 = {
    ["actionBarName"] = "Charge Explosive Comet (Lv1)"
}
local v75 = v16.getSorcererTierData(v17.TIER_2).numTotalCrystalsReq
v74.actionBarDescription = "Collect alchemy crystals to use this ability. Upgrade to the next level at " .. tostring(v75) .. " crystals"
v74.blockingStatusEffects = { v50.SILENCE }
v74.cooldown = {
    ["duration"] = 1,
    ["id"] = v20.SORCERER_EXPLOSION
}
v74.triggerConfig = {
    ["abilityType"] = "KitPrimary",
    ["abilityButton"] = {
        ["icon"] = v16.getSorcererTierData(v17.TIER_1).abilityIcon
    }
}
v53[v73] = v74
local v76 = v52.SORCERER_EXPLOSION_TIER_2
local v77 = {
    ["actionBarName"] = "Charge Explosive Comet (Lv2)"
}
local v78 = v16.getSorcererTierData(v17.TIER_3).numTotalCrystalsReq - v16.getSorcererTierData(v17.TIER_2).numTotalCrystalsReq
v77.actionBarDescription = "Collect alchemy crystals to use this ability. Upgrade to the next level at " .. tostring(v78) .. " crystals"
v77.blockingStatusEffects = { v50.SILENCE }
v77.cooldown = {
    ["duration"] = 1,
    ["id"] = v20.SORCERER_EXPLOSION
}
v53[v76] = v77
local v79 = v52.SORCERER_EXPLOSION_TIER_3
local v80 = {
    ["actionBarName"] = "Charge Explosive Comet (Lv3)"
}
local v81 = v16.getSorcererTierData(v17.TIER_4).numTotalCrystalsReq - v16.getSorcererTierData(v17.TIER_3).numTotalCrystalsReq
v80.actionBarDescription = "Collect alchemy crystals to use this ability. Upgrade to the next level at " .. tostring(v81) .. " crystals"
v80.blockingStatusEffects = { v50.SILENCE }
v80.cooldown = {
    ["duration"] = 1,
    ["id"] = v20.SORCERER_EXPLOSION
}
v53[v79] = v80
local v82 = v52.SORCERER_EXPLOSION_TIER_4
local v83 = {
    ["actionBarName"] = "Charge Explosive Comet (Lv4)"
}
local v84 = v16.getSorcererTierData(v17.TIER_5).numTotalCrystalsReq - v16.getSorcererTierData(v17.TIER_4).numTotalCrystalsReq
v83.actionBarDescription = "Collect alchemy crystals to use this ability. Upgrade to the next level at " .. tostring(v84) .. " crystals"
v83.blockingStatusEffects = { v50.SILENCE }
v83.cooldown = {
    ["duration"] = 1,
    ["id"] = v20.SORCERER_EXPLOSION
}
v53[v82] = v83
v53[v52.SORCERER_EXPLOSION_TIER_5] = {
    ["actionBarName"] = "Charge Explosive Comet (Lv5)",
    ["actionBarDescription"] = "Collect alchemy crystals to use this ability",
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.SORCERER_EXPLOSION
    }
}
v53[v52.SORCERER_PROJECTILE_FIRE] = {
    ["actionBarName"] = "Fire",
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.SORCERER_FIRE
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SORCERER_FIRE_ABILITY
        }
    }
}
v53[v52.SORCERER_PROJECTILE_CANCEL] = {
    ["actionBarName"] = "Cancel",
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://16812686987"
        }
    }
}
v53[v52.SORCERER_EXPLOSION_HALLOWEEN] = {
    ["actionBarName"] = "Charge Explosive Comet",
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["cooldown"] = {
        ["duration"] = 10,
        ["id"] = v20.SORCERER_EXPLOSION_HALLOWEEN
    }
}
v53[v52.STEAM_ENGINEER_OVERCLOCK] = {
    ["actionBarName"] = "Overclock",
    ["cooldown"] = {
        ["id"] = v20.STEAM_ENGINEER_OVERCLOCK,
        ["duration"] = v35.GATHER_BOT_OVERCLOCK_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.STEAM_ENGINEER_OVERCLOCK_ICON
        }
    }
}
v53[v52.SLIME_CYCLE] = {
    ["actionBarName"] = "Cycle Slime",
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.SLIME_DIRECT] = {
    ["actionBarName"] = "Direct/Recall Slime",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.SLIME_DIRECT
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.BLOCK_STOMP] = {
    ["actionBarName"] = "Block Stomp",
    ["cooldown"] = {
        ["id"] = v20.BLOCK_STOMP,
        ["duration"] = v23.STOMP_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.BLOCK_STOMP
        }
    }
}
v53[v52.BLOCK_KICK] = {
    ["actionBarName"] = "Block Kick",
    ["cooldown"] = {
        ["id"] = v20.BLOCK_KICK,
        ["duration"] = v23.KICK_BLOCK_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.BLOCK_KICK
        }
    }
}
v53[v52.SNOWBALL_LAUNCHER_CYCLE] = {
    ["actionBarName"] = "Switch Launcher Mode"
}
v53[v52.TRAIN_WHISTLE] = {
    ["actionBarName"] = "Whistle",
    ["cooldown"] = {
        ["duration"] = 2,
        ["id"] = v20.TRAIN_WHISTLE
    }
}
v53[v52.ELK_SUMMON] = {
    ["actionBarName"] = "Summon Elk",
    ["cooldown"] = {
        ["duration"] = 15,
        ["id"] = v20.ELK_SUMMON_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.ELK_SUMMON
        }
    },
    ["blockingStatusEffects"] = { v50.GROUNDED, v50.SILENCE }
}
v53[v52.ELK_MOUNTED] = {
    ["actionBarName"] = "Mounted Elk",
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 1,
        ["stacks"] = 3,
        ["initialProgress"] = 0.75,
        ["stacksBarDividerTransparency"] = 0.2,
        ["gradientRotation"] = 0,
        ["stacksBarDividerColor"] = v4.BLACK,
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.46, 0.15)), ColorSequenceKeypoint.new(1, Color3.new(0.85, 0.3, 0.16)) })
    }
}
v53[v52.ELK_ANTLER_UPPERCUT] = {
    ["actionBarName"] = "Charge Attack",
    ["cooldown"] = {
        ["id"] = v20.ELK_ANTLER_UPPERCUT_COOLDOWN,
        ["duration"] = v49.CHARGE_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.ELK_UPPERCUT
        }
    }
}
v53[v52.ELK_DISMISS] = {
    ["actionBarName"] = "Dismount Elk",
    ["cooldown"] = {
        ["duration"] = 5,
        ["id"] = v20.ELK_DISMISS_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.ELK_DISMISS
        }
    }
}
v53[v52.DRAGON_SWORD] = {
    ["actionBarName"] = "Dragon Sword",
    ["cooldown"] = {
        ["duration"] = 2,
        ["id"] = v20.DRAGON_SWORD
    }
}
v53[v52.DRAGON_SWORD_ULT] = {
    ["actionBarName"] = "Dragon Sword Ult",
    ["cooldown"] = {
        ["duration"] = 15,
        ["id"] = v20.DRAGON_SWORD_ULT
    }
}
v53[v52.WORLD_GUARD_RADIAL_WHEEL] = {
    ["actionBarName"] = "World Guard",
    ["clientPredictUseAbility"] = true
}
v53[v52.ICE_QUEEN] = {
    ["actionBarName"] = "Detonate Ice Stacks",
    ["cooldown"] = {
        ["duration"] = 15,
        ["id"] = v20.ICE_QUEEN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.ICE_ABILITY
        }
    }
}
v53[v52.HERO_WAND_HEAL] = {
    ["actionBarName"] = "Wand Heal Cast",
    ["cooldown"] = {
        ["duration"] = 5,
        ["id"] = v20.HERO_WAND_HEAL
    }
}
v53[v52.VILLAIN_WAND_HEAL] = {
    ["actionBarName"] = "Wand Heal Cast",
    ["cooldown"] = {
        ["duration"] = 5,
        ["id"] = v20.VILLAIN_WAND_HEAL
    }
}
v53[v52.HERO_WAND_BUBBLE] = {
    ["actionBarName"] = "Wand Bubble Cast",
    ["cooldown"] = {
        ["duration"] = 5,
        ["id"] = v20.HERO_WAND_BUBBLE
    }
}
v53[v52.VILLAIN_WAND_BUBBLE] = {
    ["actionBarName"] = "Wand Bubble Cast",
    ["cooldown"] = {
        ["duration"] = 5,
        ["id"] = v20.VILLAIN_WAND_BUBBLE
    }
}
v53[v52.MORTAR] = {
    ["actionBarName"] = "Dragon Mortar",
    ["cooldown"] = {
        ["duration"] = 0.1,
        ["id"] = v20.MORTAR
    }
}
v53[v52.ACTIVATE_FALCON_INDICATOR] = {
    ["actionBarName"] = "Summon Falcon",
    ["cooldown"] = {
        ["id"] = v20.ACTIVATE_FALCON_INDICATOR,
        ["duration"] = v24
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SUMMON_FALCON
        }
    }
}
v53[v52.SEND_FALCON] = {
    ["actionBarName"] = "Send Falcon",
    ["cooldown"] = {
        ["duration"] = 0.5,
        ["id"] = v20.SEND_FALCON
    }
}
v53[v52.RECALL_FALCON] = {
    ["actionBarName"] = "Recall Falcon",
    ["cooldown"] = {
        ["duration"] = 3,
        ["id"] = v20.RECALL_FALCON
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.RECALL_FALCON
        }
    }
}
v53[v52.MENDING_CANOPY_STAFF_MANA_TIER_1] = {
    ["actionBarName"] = "Mana",
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 1,
        ["stacks"] = 100,
        ["initialProgress"] = 100,
        ["stacksBarDividerTransparency"] = 1,
        ["gradientRotation"] = 0,
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 127, 18)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 243, 1)) })
    }
}
v53[v52.MENDING_CANOPY_STAFF_MANA_TIER_2] = {
    ["actionBarName"] = "Mana",
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 1,
        ["stacks"] = 110,
        ["initialProgress"] = 110,
        ["stacksBarDividerTransparency"] = 1,
        ["gradientRotation"] = 0,
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 127, 18)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 243, 1)) })
    }
}
v53[v52.MENDING_CANOPY_STAFF_MANA_TIER_3] = {
    ["actionBarName"] = "Mana",
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 1,
        ["stacks"] = 120,
        ["initialProgress"] = 120,
        ["stacksBarDividerTransparency"] = 1,
        ["gradientRotation"] = 0,
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 127, 18)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 243, 1)) })
    }
}
v53[v52.MENDING_CANOPY_STAFF_CHARGE_ENABLED] = {
    ["actionBarName"] = "Charge Staff",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.MENDING_CANOPY_STAFF_CHARGE_ENABLED
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.MENDING_CANOPY_STAFF_CHARGE_DISABLED] = {
    ["actionBarName"] = "Stop Charging Staff",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.MENDING_CANOPY_STAFF_CHARGE_DISABLED
    }
}
v53[v52.MENDING_CANOPY_STAFF_OVERCHARGE] = {
    ["actionBarName"] = "Overcharge Staff",
    ["cooldown"] = {
        ["duration"] = 60,
        ["id"] = v20.MENDING_CANOPY_STAFF_OVERCHARGE
    }
}
v53[v52.TINKER_SELF_REPAIR] = {
    ["actionBarName"] = "Self-Repair",
    ["cooldown"] = {
        ["duration"] = 6,
        ["id"] = v20.TINKER_SELF_REPAIR
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://11533277908"
        }
    }
}
v53[v52.TINKER_SELF_DESTRUCTION] = {
    ["actionBarName"] = "Self-Destruct",
    ["cooldown"] = {
        ["duration"] = 25,
        ["id"] = v20.TINKER_SELF_DESTRUCTION
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.VOID_TINKER_MECH
        }
    }
}
v53[v52.DRONE_SPEED_BOOST] = {
    ["actionBarName"] = "Drone Speed Boost",
    ["cooldown"] = {
        ["id"] = v20.DRONE_SPEED_BOOST,
        ["duration"] = v7.CyberDrone.SPEED_BOOST_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.CYBER_DRONE_RENDER
        }
    }
}
v53[v52.ROCKET_DETONATE] = {
    ["actionBarName"] = "Rocket Boost",
    ["cooldown"] = {
        ["id"] = v20.ROCKET_DETONATE_COOLDOWN,
        ["duration"] = v5:IsStudio() and 3 or v21.ROCKET_ABILITY_COOLDOWN
    },
    ["blockingStatusEffects"] = {
        v50.GROUNDED,
        v50.FROSTED,
        v50.ZAPPED_3,
        v50.SILENCE
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.AGNI_ROCKET
        }
    }
}
v53[v52.WHIRLING_DEATH] = {
    ["actionBarName"] = "Whirling Death",
    ["cooldown"] = {
        ["duration"] = 10,
        ["id"] = v20.WHIRLING_DEATH
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitTertiary",
        ["abilityButton"] = {
            ["icon"] = v44.EMERALD_CHAINSAW
        }
    }
}
v53[v52.DISRUPTOR_EXPLOSION_EMP] = {
    ["actionBarName"] = "Disruptor EMP",
    ["cooldown"] = {
        ["duration"] = 12,
        ["id"] = v20.DISRUPTOR_EXPLOSION
    }
}
v53[v52.PROWLER_MARK] = {
    ["actionBarName"] = "Prowler\'s Mark",
    ["cooldown"] = {
        ["duration"] = 20,
        ["id"] = v20.PROWLER_MARK
    }
}
v53[v52.TINKER_SUMMON] = {
    ["actionBarName"] = "Summon Talos Mech",
    ["cooldown"] = {
        ["id"] = v20.TINKER_SUMMON,
        ["duration"] = v5:IsStudio() and 3 or 15
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.VOID_TINKER_MECH
        }
    }
}
v53[v52.STYX_RESPAWN] = {
    ["actionBarName"] = "Respawn Early",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.STYX_RESPAWN
    }
}
v53[v52.SWAP_HOT_POTATO_MODE] = {
    ["actionBarName"] = "Swap Hot Potato Mode",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.SWAP_HOT_POTATO_MODE
    }
}
v53[v52.ELECTRIFY_JELLYFISH] = {
    ["actionBarName"] = "Electrify Jellyfish",
    ["actionBarDescription"] = "Enemies near Marina\'s jellyfish are electrified, taking damage. The more jellyfish that are connected, the more damage they will do.",
    ["cooldown"] = {
        ["duration"] = 9,
        ["id"] = v20.ELECTRIFY_JELLYFISH
    }
}
v53[v52.JELLYFISH_MOUNT_SWAP_COLOR] = {
    ["actionBarName"] = "Swap Color",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.JELLYFISH_MOUNT_SWAP_COLOR
    }
}
v53[v52.TRINITY_SWAP_FORM] = {
    ["actionBarName"] = "Inversion",
    ["cooldown"] = {
        ["duration"] = 30,
        ["id"] = v20.TRINITY_SWAP_FORM
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.TRINITY_SWAP_FORM
        }
    }
}
local v85 = v52.OPEN_BLACK_MARKET
local v86 = {
    ["actionBarName"] = "Open Black Market",
    ["disableAfterUse"] = true
}
local v87 = v9.BLACK_MARKET_PROFIT_PERCENT * 10
local v88 = math.round(v87)
v86.actionBarDescription = "Summons the black market in front of you. You receive " .. tostring(v88) .. "% of the profits"
v86.cooldown = {
    ["id"] = v20.OPEN_BLACK_MARKET,
    ["duration"] = v5:IsStudio() and 2 or v9.BLACK_MARKET_OPEN_SHOP_COOLDOWN
}
v86.enableAbilityOnUse = v52.CLOSE_BLACK_MARKET
v86.triggerConfig = {
    ["abilityType"] = "KitPrimary",
    ["abilityButton"] = {
        ["icon"] = v44.OPEN_BLACK_MARKET_ABILITY_ICON
    }
}
v53[v85] = v86
v53[v52.CLOSE_BLACK_MARKET] = {
    ["actionBarName"] = "Close Black Market",
    ["disableAfterUse"] = true,
    ["enableAbilityOnUse"] = v52.OPEN_BLACK_MARKET,
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.CLOSE_BLACK_MARKET_ABILITY_ICON
        }
    }
}
v53[v52.ENABLE_LIFE_FORCE_ATTACK] = {
    ["actionBarName"] = "Enable Empowered Attacks",
    ["actionBarDescription"] = "Enable to consume life force in exchange for increased damage on melee and ranged attacks.",
    ["disableAfterUse"] = true,
    ["cooldown"] = {
        ["id"] = v20.ENABLE_LIFE_FORCE_ATTACK,
        ["duration"] = v26.TOGGLE_LIFE_FORCE_ATTACK_COOLDOWN_SEC
    },
    ["enableAbilityOnUse"] = v52.DISABLE_LIFE_FORCE_ATTACK,
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.EMPOWER_ENABLE_ICON
        }
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.DISABLE_LIFE_FORCE_ATTACK] = {
    ["actionBarName"] = "Disable Empowered Attacks",
    ["actionBarDescription"] = "Disable to stop using life force to increase damage on melee and ranged attacks.",
    ["disableAfterUse"] = true,
    ["cooldown"] = {
        ["id"] = v20.DISABLE_LIFE_FORCE_ATTACK,
        ["duration"] = v26.TOGGLE_LIFE_FORCE_ATTACK_COOLDOWN_SEC
    },
    ["enableAbilityOnUse"] = v52.ENABLE_LIFE_FORCE_ATTACK,
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.EMPOWER_DISABLE_ICON
        }
    }
}
v53[v52.CONSUME_LIFE_FORCE] = {
    ["actionBarName"] = "Consume Life Force",
    ["actionBarDescription"] = "Consume life force to heal yourself.",
    ["cooldown"] = {
        ["id"] = v20.CONSUME_LIFE_FORCE,
        ["duration"] = v26.CONSUME_LIFE_FORCE_COOLDOWN_SEC
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.CONSUME_ICON
        }
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.REBELLION_AURA_SWAP] = {
    ["actionBarName"] = "Swap Aura",
    ["actionBarDescription"] = "Swap Aura Effect",
    ["cooldown"] = {
        ["duration"] = 7,
        ["id"] = v20.AURA_SWAP
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://94018856518848"
        }
    }
}
v53[v52.REBELLION_SHIELD] = {
    ["actionBarName"] = "Press the Attack!",
    ["actionBarDescription"] = "Charge! Gives your allies a shield and buffs the effectiveness of your aura",
    ["cooldown"] = {
        ["duration"] = 18,
        ["id"] = v20.REBELLION_SHIELD
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://133802871831157"
        }
    }
}
v53[v52.SUMMONER_START_CHARGING] = {
    ["actionBarName"] = "Summon",
    ["cooldown"] = {
        ["id"] = v20.SUMMONER_START_CHARGING,
        ["duration"] = v36.SPELL_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SUMMONER_SUMMON_START
        }
    }
}
v53[v52.SUMMONER_FINISH_CHARGING] = {
    ["actionBarName"] = "Finish Summon",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.SUMMONER_FINISH_CHARGING
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SUMMONER_SUMMON_FINISH
        }
    }
}
v53[v52.OPEN_TOURNAMENT_TEAM_UI_TEST] = {
    ["actionBarName"] = "OPEN TEAM UI"
}
v53[v52.SPIDER_QUEEN_SUMMON_SPIDERS] = {
    ["actionBarName"] = "Summon Spiders",
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["cooldown"] = {
        ["duration"] = 10,
        ["id"] = v20.SPIDER_QUEEN_SUMMON_SPIDERS
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.SPIDER_QUEEN_SUMMON_SPIDERS_ICON
        }
    }
}
v53[v52.SPIDER_QUEEN_WEB_BRIDGE_AIM] = {
    ["actionBarName"] = "Aim Web Bridge",
    ["blockingStatusEffects"] = { v50.SILENCE, v50.GROUNDED },
    ["cooldown"] = {
        ["duration"] = 8,
        ["id"] = v20.SPIDER_QUEEN_WEB_BRIDGE_AIM
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SPIDER_QUEEN_WEB_BRIDGE_ICON
        },
        ["getExtraData"] = function() --[[ Name: getExtraData, Line 1509 ]] end
    }
}
v53[v52.SPIDER_QUEEN_WEB_BRIDGE_FIRE] = {
    ["actionBarName"] = "Fire Web Bridge",
    ["blockingStatusEffects"] = { v50.SILENCE, v50.GROUNDED },
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.SPIDER_QUEEN_WEB_BRIDGE_FIRE
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SPIDER_QUEEN_WEB_BRIDGE_ICON
        }
    }
}
v53[v52.SPIDER_QUEEN_WEB_BRIDGE_CANCEL] = {
    ["actionBarName"] = "Cancel Web Bridge"
}
v53[v52.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE] = {
    ["actionBarName"] = "Knockback Strike",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.KNOCKBACK_STRIKE
        }
    }
}
v53[v52.HALLOWEEN_VIEW_ABILITIES] = {
    ["actionBarName"] = "See current upgrades",
    ["triggerConfig"] = {
        ["abilityType"] = "MiscPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.EYE_SOLID
        }
    }
}
v53[v52.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE] = {
    ["actionBarName"] = "Defensive Stance",
    ["actionBarDescription"] = "Take reduced damage with slower movement speed and gain a shield attack.",
    ["disableAfterUse"] = true,
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE
    },
    ["enableAbilityOnUse"] = v52.EXIT_KNIGHT_SHIELD_DEFENSIVE_STANCE,
    ["triggerConfig"] = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.KNIGHT_SHIELD_RENDER
        }
    }
}
v53[v52.EXIT_KNIGHT_SHIELD_DEFENSIVE_STANCE] = {
    ["actionBarName"] = "Exit Defensive Stance",
    ["disableAfterUse"] = true,
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.EXIT_KNIGHT_SHIELD_DEFENSIVE_STANCE
    },
    ["enableAbilityOnUse"] = v52.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE,
    ["triggerConfig"] = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.KNIGHT_SHIELD_EXIT_DEFENSIVE_STANCE
        }
    }
}
v53[v52.SUMMON_ATTACK_SPIRIT] = {
    ["actionBarName"] = "Summon Attack Spirit",
    ["actionBarDescription"] = "Use a summon stone to summon a spirit that specializes in attacking.",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.SPIRIT_SUMMON
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.SUMMON_ATTACK_SPIRIT_ICON,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(207, 59, 186)
            }
        }
    }
}
v53[v52.SUMMON_HEAL_SPIRIT] = {
    ["actionBarName"] = "Summon Heal Spirit",
    ["actionBarDescription"] = "Use a summon stone to summon a spirit that specializes in healing.",
    ["cooldown"] = {
        ["duration"] = 0.9,
        ["id"] = v20.SPIRIT_SUMMON
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitTertiary",
        ["abilityButton"] = {
            ["icon"] = v44.SUMMON_HEAL_SPIRIT_ICON,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(41, 186, 209)
            }
        }
    }
}
v53[v52.CHANGE_SPIRIT_AFFINITY] = {
    ["actionBarName"] = "Change Spirit Affinity",
    ["actionBarDescription"] = "Change what type of spirit you send out.",
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.ROTATE,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(56, 56, 56)
            }
        }
    }
}
v53[v52.YETI_GLACIAL_ROAR] = {
    ["actionBarName"] = "Glacial Roar",
    ["actionBarDescription"] = "Roar to freeze nearby blocks and make them brittle.",
    ["cooldown"] = {
        ["duration"] = 35,
        ["id"] = v20.YETI_ABILITY
    }
}
v53[v52.SPIRIT_GARDENER_WATER] = {
    ["actionBarName"] = "Spirit Transfer",
    ["actionBarDescription"] = "Transfer Energy to nearby plants.",
    ["disableAfterUse"] = true,
    ["cooldown"] = {
        ["id"] = v20.SPIRIT_GARDENER_WATER,
        ["duration"] = v5:IsStudio() and 1 or v34.WATER_ABILITY_COOLDOWN
    },
    ["enableAbilityOnUse"] = v52.SPIRIT_GARDENER_WATER_CANCEL,
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SPIRIT_GARDENER_WATER_ICON
        }
    }
}
v53[v52.SPIRIT_GARDENER_WATER_CANCEL] = {
    ["actionBarName"] = "Stop Transfer",
    ["disableAfterUse"] = true,
    ["enableAbilityOnUse"] = v52.SPIRIT_GARDENER_WATER,
    ["cooldown"] = {
        ["id"] = v20.SPIRIT_GARDENER_WATER_CANCEL,
        ["duration"] = v5:IsStudio() and 1 or v34.WATER_ABILITY_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SPIRIT_GARDENER_WATER_CANCEL_ICON
        }
    }
}
v53[v52.FROST_HAMMER_MENU] = {
    ["actionBarName"] = "Opens Hammer Upgrades"
}
v53[v52.SKATING_JUMP] = {
    ["actionBarName"] = "Spin and Dodge",
    ["actionBarDescription"] = "Enables at high speeds! Activate to jump and dodge an attack",
    ["cooldown"] = {
        ["id"] = v20.ICE_SKATING_JUMP,
        ["duration"] = v25.DODGE_COOLDOWN_SECONDS
    },
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 1
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SKATING_JUMP
        }
    }
}
v53[v52.SKATING_FREEZE] = {
    ["actionBarName"] = "Freeze",
    ["actionBarDescription"] = "Activate to freeze the area and gain momentum more quickly",
    ["cooldown"] = {
        ["id"] = v20.ICE_SKATING_FREEZE,
        ["duration"] = v25.FREEZE_COOLDOWN_SECONDS
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.SKATING_ON_ICE
        }
    }
}
v53[v52.BOUNTY_HUNTER_REROLL] = {
    ["actionBarName"] = "Reroll Bounty",
    ["actionBarDescription"] = "Reroll your current bounty for a new one.",
    ["cooldown"] = {
        ["duration"] = 60,
        ["id"] = v20.BOUNTY_HUNTER_REROLL
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.MULTIPLE_DICE_SOLID
        }
    }
}
v53[v52.VOID_HUNTER_MARK] = {
    ["actionBarName"] = "Fenrir",
    ["actionBarDescription"] = "Send Fenrir to mark an enemy. Deal increased damage to them, gain speed on their trail, and see them through walls. Cooldown reduced if you miss, instantly reset if you kill your mark.",
    ["cooldown"] = {
        ["id"] = v20.VOID_HUNTER_MARK,
        ["duration"] = v37.MARK_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.VOID_HUNTER_PROJECTILE_ABILITY_ICON
        }
    }
}
v53[v52.VOID_HUNTER_DETONATE] = {
    ["actionBarName"] = "Hunt\'s End",
    ["actionBarDescription"] = "Detonate your active mark, removing it and dealing damage. You will lose buffs against the target, so use wisely!",
    ["cooldown"] = {
        ["id"] = v20.VOID_HUNTER_DETONATE,
        ["duration"] = v37.DETONATE_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.VOID_HUNTER_DETONATE_ABILITY_ICON
        }
    }
}
v53[v52.VOID_WALKER_WARP] = {
    ["actionBarName"] = "Rift Warp",
    ["actionBarDescription"] = "Warp ahead and create a portal that you can return to later. Gives you Rift Madness",
    ["cooldown"] = {
        ["id"] = v20.VOID_WALKER_WARP,
        ["duration"] = v38.WARP_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.VOID_WALKER_WARP_ICON1
        }
    },
    ["blockingStatusEffects"] = { v50.SILENCE, v50.GROUNDED, v50.FROZEN }
}
v53[v52.VOID_WALKER_REWIND] = {
    ["actionBarName"] = "Rift Rewind",
    ["actionBarDescription"] = "Warp back to your last portal. Does NOT give Rift Madness",
    ["cooldown"] = {
        ["id"] = v20.VOID_WALKER_REWIND,
        ["duration"] = v38.REWIND_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.VOID_WALKER_REWIND_ICON
        }
    },
    ["blockingStatusEffects"] = { v50.SILENCE, v50.GROUNDED, v50.FROZEN }
}
v53[v52.YUZI_DRAGON_FIRE_BREATH_WIN_EFFECT] = {
    ["actionBarName"] = "Fire Breath"
}
local v89 = v52.MELODY_HEAL
local v90 = {
    ["actionBarName"] = "Heal",
    ["cooldown"] = {
        ["id"] = v20.MELODY,
        ["duration"] = v32.HEAL_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
local v91 = {}
local v92 = {}
local v93 = v45(v46.GUITAR).image
v92.icon = v93 == nil and "" or v93
v91.abilityButton = v92
v91.abilityType = "ItemPrimary"
v90.triggerConfig = v91
v53[v89] = v90
local v94 = v52.RAVEN_SPAWN
local v95 = {
    ["actionBarName"] = "Spawn"
}
local v96 = {}
local v97 = {}
local v98 = v45(v46.RAVEN).image
v97.icon = v98 == nil and "" or v98
v96.abilityButton = v97
v96.abilityType = "ItemPrimary"
v95.triggerConfig = v96
v53[v94] = v95
local v99 = v52.RAVEN_DETONATE
local v100 = {
    ["actionBarName"] = "Detonate"
}
local v101 = {}
local v102 = {}
local v103 = v45(v46.RAVEN).image
v102.icon = v103 == nil and "" or v103
v101.abilityButton = v102
v101.abilityType = "ItemPrimary"
v100.triggerConfig = v101
v53[v99] = v100
v53[v52.CACTUS_FIRE] = {
    ["actionBarName"] = "Wild Growth",
    ["actionBarDescription"] = "Siphon life essence from nearby enemies and gain max HP permanently.",
    ["cooldown"] = {
        ["id"] = v20.CACTUS_FIRE,
        ["duration"] = v28.WILD_GROWTH_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.CACTUS_BALL,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(70, 53, 26)
            }
        }
    }
}
v53[v52.AIRBENDER_TORNADO] = {
    ["actionBarName"] = "Sandstorm",
    ["actionBarDescription"] = "Create a sandstorm that follows you. Enemies in range are pulled toward the center and take light damage over time. Blocks enemy projectiles.",
    ["cooldown"] = {
        ["id"] = v20.AIRBENDER_TORNADO,
        ["duration"] = v30.TORNADO_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.AIRBENDER_SANDSTORM_ABILITY_ICON
        }
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.AIRBENDER_MOVING_TORNADO] = {
    ["actionBarName"] = "Moving Sandstorm",
    ["actionBarDescription"] = "Create a sandstorm that moves forward. Enemies in range are pulled toward the center and take light damage over time. Blocks enemy projectiles.",
    ["cooldown"] = {
        ["id"] = v20.AIRBENDER_MOVING_TORNADO,
        ["duration"] = v30.MOVING_TORNADO_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.AIRBENDER_MOVING_SANDSTORM_ABILITY_ICON
        }
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.BERSERKER_RAGE] = {
    ["actionBarName"] = "Berserker Rage",
    ["actionBarDescription"] = "Activate to gain break speed, prevent knockback, and reduce incoming damage.",
    ["cooldown"] = {
        ["id"] = v20.BERSERKER_RAGE,
        ["duration"] = v31.RageCooldown
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.BERSERKER_KIT_ABILITY
        }
    },
    ["blockingStatusEffects"] = {}
}
v53[v52.PLACE_SCARAB_HIVE] = {
    ["actionBarName"] = "Place hive",
    ["actionBarDescription"] = "Place down a scarab hive.",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.PLACE_HIVE
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SCARAB_SPAWNER_1
        }
    },
    ["blockingStatusEffects"] = {}
}
v53[v52.CANCEL_SCARAB_HIVE] = {
    ["actionBarName"] = "Cancel"
}
v53[v52.SUMMON_HIVE] = {
    ["actionBarName"] = "Cancel",
    ["cooldown"] = {
        ["id"] = v20.SUMMON_HIVE,
        ["duration"] = v5:IsStudio() and 10 or 30
    }
}
v53[v52.BUY_NEXT_DEFENSE_LEVEL] = {
    ["actionBarName"] = "Open Defender Menu",
    ["actionBarDescription"] = "",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.NO_COOLDOWN
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.DEFENDER_KIT_ICON
        }
    },
    ["blockingStatusEffects"] = {}
}
v53[v52.BEAST_FORM] = {
    ["actionBarName"] = "Beast Form",
    ["actionBarDescription"] = "Activate your beast form at full bloodlust. Build bloodlust by being near damage dealt, gain more from non-player entities",
    ["cooldown"] = {
        ["id"] = v20.BEAST_ABILITY,
        ["duration"] = v22.MinBeastActiveTime
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.WEREWOLF_HOWL_ABILITY
        }
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.HAND_GUN] = {
    ["actionBarName"] = "Fire!",
    ["actionBarDescription"] = "Deals damage and marks all enemies in front. The impulse will also knock you backward.",
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://95595318707967"
        }
    },
    ["cooldown"] = {
        ["id"] = v20.HAND_GUN,
        ["duration"] = v29.GUN_COOLDOWN
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.FIREWORK_BACKPACK] = {
    ["actionBarName"] = "Deploy fireworks!",
    ["actionBarDescription"] = "Launch yourself into the air! Also activates automatically upon reaching the void.",
    ["cooldown"] = {
        ["id"] = v20.BACKPACK,
        ["duration"] = v47.COOLDOWN
    },
    ["usableProgress"] = {
        ["progressNeededPerUse"] = 1,
        ["stacks"] = 2,
        ["initialProgress"] = 2,
        ["displayProgressOnButton"] = true
    },
    ["blockingStatusEffects"] = { v50.GROUNDED }
}
v53[v52.SKELETON_ABILITY] = {
    ["actionBarName"] = "Toxic Escape",
    ["actionBarDescription"] = "Start creating poison clouds around you for a period of time that slow enemies and deal poison damage",
    ["cooldown"] = {
        ["id"] = v20.SKELETON_ABILITY,
        ["duration"] = v33.AbilityCooldown
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SKELETON_KIT_ABILITY_ICON
        }
    },
    ["blockingStatusEffects"] = {}
}
v53[v52.SUPER_MELODY_HEAL] = {
    ["actionBarName"] = "Tone of Peace",
    ["actionBarDescription"] = "Heals nearby allies",
    ["cooldown"] = {
        ["duration"] = 6,
        ["id"] = v20.SUPER_MELODY_HEAL
    }
}
v53[v52.SUPER_MELODY_ULT] = {
    ["actionBarName"] = "Lets Dance!",
    ["actionBarDescription"] = "Force nearby enemies to dance",
    ["cooldown"] = {
        ["duration"] = 20,
        ["id"] = v20.SUPER_MELODY_ULT
    }
}
v53[v52.SUPER_MELODY_AURA] = {
    ["actionBarName"] = "Harmonic Tone",
    ["actionBarDescription"] = "Continously heal nearby allies and damage enemies",
    ["cooldown"] = {
        ["duration"] = 15,
        ["id"] = v20.SUPER_MELODY_AURA
    }
}
v53[v52.METEOR_SUMMON] = {
    ["actionBarName"] = "Summon Meteor",
    ["cooldown"] = {
        ["duration"] = 20,
        ["id"] = v20.METEOR_CALLER
    },
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.ALCHEMIST_ADD_FLOWER] = {
    ["actionBarName"] = "Add Flower",
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.ALCHEMIST_ADD_MUSHROOMS] = {
    ["actionBarName"] = "Add Mushrooms",
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.ALCHEMIST_ADD_THORNS] = {
    ["actionBarName"] = "Add Thorns",
    ["blockingStatusEffects"] = { v50.SILENCE }
}
v53[v52.FROSTY_GUN_SWAP] = {
    ["actionBarName"] = "Swap Weapon Mode",
    ["actionBarDescription"] = "Swap Weapon Mode"
}
v53[v52.MERCHANT_REROLL] = {
    ["actionBarName"] = "Reroll",
    ["cooldown"] = {
        ["duration"] = 180,
        ["id"] = v20.MERCHANT_REROLL
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.MULTIPLE_DICE_SOLID
        }
    }
}
v53[v52.SNOWBAL_RIDER_WIN_EFFECT] = {
    ["actionBarName"] = "Drop Exploding Snowball",
    ["actionBarDescription"] = "Explodes on impact!",
    ["cooldown"] = {
        ["duration"] = 3,
        ["id"] = v20.SNOWBALL_SHOOT_WINEFFECT
    }
}
v53[v52.SOUL_LINK] = {
    ["actionBarName"] = "Soul Link",
    ["actionBarDescription"] = "Link enemies to force them to take extra damage with other linked enemies, or link allies to take damage in their place.",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.SOUL_LINK
    },
    ["blockingStatusEffects"] = { v50.SILENCE },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SOUL_LINK_ICON,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(26, 69, 66)
            }
        }
    }
}
v53[v52.SOUL_UNLINK] = {
    ["actionBarName"] = "Clear All Links",
    ["triggerConfig"] = {
        ["abilityType"] = "KitSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.SOUL_UNLINK_ICON,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(26, 69, 66)
            }
        }
    }
}
v53[v52.NECROMANCER_RECALL_SKELETONS] = {
    ["actionBarName"] = "Recall Skeletons",
    ["cooldown"] = {
        ["duration"] = 5,
        ["id"] = v20.NECROMANCER_SKELETON_ACTIONS
    },
    ["triggerConfig"] = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = v44.SKELETON_RECALL,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(26, 69, 66)
            }
        }
    }
}
v53[v52.NECROMANCER_SKELETONS_ATTACK] = {
    ["actionBarName"] = "Set Target",
    ["cooldown"] = {
        ["duration"] = 1,
        ["id"] = v20.NECROMANCER_SKELETON_MARK
    },
    ["triggerConfig"] = {
        ["abilityType"] = "ItemSecondary",
        ["abilityButton"] = {
            ["icon"] = v44.SKELETON_MARK,
            ["stateColors"] = {
                [v3.READY] = Color3.fromRGB(26, 69, 66)
            }
        }
    }
}
v53[v52.NECROMANCER_SWAP] = {
    ["actionBarName"] = "Swap Skeleton Type",
    ["actionBarDescription"] = "Swap Skeleton Type"
}
v53[v52.WARRIOR_STRIKE] = {
    ["actionBarName"] = "Warrior\'s Strike",
    ["actionBarDescription"] = "Strike nearby enemies. Damage and effects scale off current grit",
    ["cooldown"] = {
        ["id"] = v20.WARROIR_STRIKE,
        ["duration"] = v5:IsStudio() and 4 or 8
    },
    ["triggerConfig"] = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://99557836542587"
        }
    }
}
return {
    ["AbilityMeta"] = v53
}