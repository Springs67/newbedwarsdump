local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BreakBlockDamageType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "shared", "block", "block-meta").BlockHealthType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v5 = v4.ColorUtil
local u6 = v4.RandomUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").ItemUpgradeTierAttr
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "bacon-blade-balance").BaconBladeBalance
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "black-marketeer-balance").BlackMarketeerBalance
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "frankenstein-curse-balance").FrankensteinCurseBalance
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "hotdog-bat-balance").HotdogBatBalance
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "item-balance-file").ItemBalanceFile
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "juggernaut-balance-file").JuggernautUtil
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "magical-girl-rapier-balance").MagicalGirlRapierBalance
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "scissor-sword-balance").ScissorSwordBalance
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "carrot-cannon", "carrot-cannon-constants").CarrotCannonConstants
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "comet-volley", "comet-volley-constants").CometVolleyConstants
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "snowball-launcher", "snowball-launcher-util")
local v24 = v23.SnowballLauncherMode
local v25 = v23.SnowballLauncherUtil
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "agni", "agni-util").AgniKitUtil
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "block-kicker", "block-kicker-kit-balance").BlockKickerKitBalance
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "lumen", "lumen-balance").LumenBalance
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "ninja", "ninja-kit-balance").NinjaKitBalance
local v30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "queen-bee", "queen-bee-util").QueenBeeUtil
local v31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-gardener", "spirit-gardener-balance").SpiritGardenerKitBalance
local v32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-constants").SpiritSummonerBalance
local v33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-projectiles").SpiritSummonerProjectile
local v34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType
local v35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local v37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item-catalog", "item-catalog-collection").ItemCatalogCollection
local v38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "fork-trident", "fork-trident-balance").ForkTridentBalance
local v39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-drop-enums")
local v40 = v39.LuckyBlockCategory
local v41 = v39.LuckyBlockPolarity
local v42 = v39.LuckyBlockRarity
local v43 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "recipe", "recipe-meta")
local v44 = v43.getRecipeMeta
local v45 = v43.recipes
local v46 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "footstep-sounds").BlockFootstepSound
local u47 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v48 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local v49 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v50 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u51 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local v52 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "base-items").BaseItems
local u53 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "base-weapon", "base-weapon-balance").BaseWeaponBalance
local u54 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "create-sounds").createSounds
local v55 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta-block-textures").SetupItemMetaBlockTextures
local v56 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta-hit-sounds").SetupItemMetaHitSounds
local u57 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local function v65(p58) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u47
        [3] = u17
    --]]
    local v59 = {
        ["sharingDisabled"] = true,
        ["displayName"] = p58.displayName,
        ["image"] = p58.image,
        ["sword"] = {
            ["attackSpeed"] = 0.25,
            ["ignoreDamageCooldown"] = true,
            ["respectAttackSpeedForEffects"] = true,
            ["applyCooldownOnMiss"] = true,
            ["damage"] = p58.damage,
            ["swingAnimations"] = { u7.DAGGER_SWING_1, u7.DAGGER_SWING_2 },
            ["firstPersonSwingAnimations"] = { u7.DAGGER_SWING_FP, u7.DAGGER_SWING_2_FP },
            ["swingSounds"] = {
                u47.DAGGER_SWING_1,
                u47.DAGGER_SWING_2,
                u47.DAGGER_SWING_3,
                u47.DAGGER_SWING_4
            },
            ["attackRange"] = 3.5 * u17,
            ["knockbackMultiplier"] = {
                ["horizontal"] = 0.5,
                ["vertical"] = 0.5
            }
        },
        ["firstPerson"] = {
            ["scale"] = 0.8,
            ["verticalOffset"] = -1.2
        }
    }
    local v60 = {}
    for v61, v62 in v59 do
        v60[v61] = v62
    end
    for v63, v64 in p58 do
        v60[v63] = v64
    end
    return v60
end
local function v75(p66) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u53
        [2] = u17
        [3] = u47
        [4] = u7
    --]]
    local v67 = {
        ["sharingDisabled"] = true,
        ["displayName"] = p66.displayName,
        ["image"] = p66.image
    }
    local v68 = {
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["multiHitCheckDurationSec"] = 0.25,
        ["damage"] = p66.damage,
        ["attackSpeed"] = u53.HAMMER_SWING_COOLDOWN,
        ["attackRange"] = 5 * u17,
        ["swingSounds"] = { u47.JUGGERNAUT_ATTACK_SWING_1, u47.JUGGERNAUT_ATTACK_SWING_2 },
        ["swingAnimations"] = { u7.GREAT_HAMMER_SWING_1, u7.GREAT_HAMMER_SWING_2 },
        ["firstPersonSwingAnimations"] = { u7.GREAT_HAMMER_SWING_1_FP, u7.GREAT_HAMMER_SWING_2_FP },
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.2,
            ["vertical"] = 1.1
        }
    }
    local v69 = {
        ["showHoldProgressAfterSec"] = 0.25,
        ["attackCooldown"] = 0.65,
        ["maxChargeTimeSec"] = u53.HAMMER_CHARGE_TIME,
        ["minChargeTimeSec"] = u53.HAMMER_CHARGE_TIME,
        ["bonusDamage"] = p66.damage * 0.35,
        ["bonusKnockback"] = {
            ["horizontal"] = 0.2,
            ["vertical"] = 0.1
        },
        ["walkSpeedModifier"] = {
            ["multiplier"] = 0.9
        },
        ["chargingEffects"] = {
            ["thirdPersonAnim"] = u7.GREAT_HAMMER_CHARGE,
            ["firstPersonAnim"] = u7.GREAT_HAMMER_CHARGE_FP,
            ["sound"] = u47.FRYING_PAN_CHARGE
        },
        ["chargedSwingAnimations"] = { u7.GREAT_HAMMER_CHARGED_SWING },
        ["firstPersonChargedSwingAnimations"] = { u7.GREAT_HAMMER_CHARGED_SWING_FP },
        ["chargedSwingSounds"] = { u47.JUGGERNAUT_ATTACK_SWING_3 }
    }
    v68.chargedAttack = v69
    v67.sword = v68
    local v70 = {}
    for v71, v72 in v67 do
        v70[v71] = v72
    end
    for v73, v74 in p66 do
        v70[v73] = v74
    end
    return v70
end
local function v84(p76) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v77 = {
        ["sharingDisabled"] = true,
        ["displayName"] = p76.displayName,
        ["image"] = p76.image
    }
    local v78 = {
        ["attackSpeed"] = 0.4,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["damage"] = p76.damage,
        ["swingAnimations"] = {},
        ["idleAnimation"] = u7.SCYTHE_HOLD,
        ["chargedAttack"] = {
            ["showHoldProgressAfterSec"] = 0.2,
            ["maxChargeTimeSec"] = 2,
            ["bonusDamage"] = 4,
            ["disableOnGrounded"] = true,
            ["bonusKnockback"] = {
                ["horizontal"] = 0.5,
                ["vertical"] = 0.5
            }
        }
    }
    v77.sword = v78
    v77.firstPerson = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
    local v79 = {}
    for v80, v81 in v77 do
        v79[v80] = v81
    end
    for v82, v83 in p76 do
        v79[v82] = v83
    end
    return v79
end
local function v92(p85) --[[ Line: 186 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v86 = {
        ["sharingDisabled"] = true,
        ["disableFirstPersonHoldAnimation"] = true,
        ["displayName"] = p85.displayName,
        ["image"] = p85.image,
        ["firstPerson"] = {
            ["scale"] = 1,
            ["verticalOffset"] = -1.2
        },
        ["sword"] = {
            ["attackSpeed"] = 0.21,
            ["ignoreDamageCooldown"] = true,
            ["damage"] = p85.damage,
            ["idleAnimation"] = u7.GAUNTLETS_IDLE,
            ["chargedAttack"] = p85.displayName == "Warfists" and {
                ["showHoldProgressAfterSec"] = 0.2,
                ["maxChargeTimeSec"] = 0.75,
                ["bonusKnockback"] = {
                    ["horizontal"] = 1,
                    ["vertical"] = 0.5
                },
                ["walkSpeedModifier"] = {
                    ["multiplier"] = 0.9
                }
            } or nil,
            ["swingSounds"] = {}
        }
    }
    local v87 = {}
    for v88, v89 in v86 do
        v87[v88] = v89
    end
    for v90, v91 in p85 do
        v87[v90] = v91
    end
    return v87
end
local u93 = {}
local v94 = u57.WOOD_SWORD
local v95 = {
    ["displayName"] = "Wood Sword",
    ["image"] = "rbxassetid://6875480974",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 20,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v94] = v95
local v96 = u57.SPIRIT_DAGGER
local v97 = {
    ["displayName"] = "Spirit Dagger",
    ["image"] = "rbxassetid://16385255903",
    ["sword"] = {
        ["damage"] = 0,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
        ["swingAnimations"] = { u7.PUNCH }
    }
}
u93[v96] = v97
local v98 = u57.SPIRIT_DAGGER_LEFT
local v99 = {
    ["displayName"] = "Spirit Dagger",
    ["image"] = "rbxassetid://6875480974",
    ["sword"] = {
        ["damage"] = 0,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
        ["swingAnimations"] = { u7.PUNCH }
    }
}
u93[v98] = v99
u93[u57.PIRATE_SWORD_FP] = {
    ["displayName"] = "Pirate Sword",
    ["image"] = "rbxassetid://10729541408"
}
local v100 = u57.CUTLASS_GHOST
local v101 = {
    ["displayName"] = "Ghost Cutlass",
    ["image"] = "rbxassetid://10729541018",
    ["sword"] = {
        ["damage"] = 0,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    }
}
u93[v100] = v101
u93[u57.WOOD_GREAT_HAMMER] = v75({
    ["displayName"] = "Wood Great Hammer",
    ["description"] = "Deal large amounts of knockback to enemies.",
    ["image"] = "rbxassetid://13832631568",
    ["damage"] = 23
})
u93[u57.STONE_GREAT_HAMMER] = v75({
    ["displayName"] = "Stone Great Hammer",
    ["description"] = "Deal large amounts of knockback to enemies. Downgrades to a Wood Great Hammer upon death.",
    ["image"] = "rbxassetid://13832631765",
    ["damage"] = 29,
    ["replaces"] = { u57.WOOD_GREAT_HAMMER }
})
u93[u57.IRON_GREAT_HAMMER] = v75({
    ["displayName"] = "Iron Great Hammer",
    ["description"] = "Deal large amounts of knockback to enemies. Downgrades to a Stone Great Hammer upon death.",
    ["image"] = "rbxassetid://13832632230",
    ["damage"] = 35,
    ["replaces"] = { u57.WOOD_GREAT_HAMMER, u57.STONE_GREAT_HAMMER }
})
u93[u57.DIAMOND_GREAT_HAMMER] = v75({
    ["displayName"] = "Diamond Great Hammer",
    ["description"] = "Deal large amounts of knockback to enemies. Downgrades to an Iron Great Hammer upon death.",
    ["image"] = "rbxassetid://13832632374",
    ["damage"] = 48,
    ["replaces"] = { u57.WOOD_GREAT_HAMMER, u57.STONE_GREAT_HAMMER, u57.IRON_GREAT_HAMMER }
})
local v102 = u57.MYTHIC_GREAT_HAMMER
local v103 = {
    ["displayName"] = "Paragon",
    ["image"] = "rbxassetid://13832631998",
    ["damage"] = 67,
    ["description"] = "Charge your hammer to activate an aura of healing for your teammates. Bonus healing on a successful charged attack. Downgrades to a Diamond Great Hammer upon death.",
    ["replaces"] = {
        u57.WOOD_GREAT_HAMMER,
        u57.STONE_GREAT_HAMMER,
        u57.IRON_GREAT_HAMMER,
        u57.DIAMOND_GREAT_HAMMER
    },
    ["itemCatalog"] = {
        ["collection"] = v37.MYTHIC_WEAPON
    }
}
u93[v102] = v75(v103)
local v104 = u57.STONE_SWORD
local v105 = {
    ["displayName"] = "Stone Sword",
    ["description"] = "Doesn\'t downgrade",
    ["image"] = "rbxassetid://6875481137",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 25,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v104] = v105
local v106 = u57.IRON_SWORD
local v107 = {
    ["displayName"] = "Iron Sword",
    ["description"] = "Doesn\'t downgrade",
    ["image"] = "rbxassetid://6875481281",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 30,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v106] = v107
local v108 = u57.DIAMOND_SWORD
local v109 = {
    ["displayName"] = "Diamond Sword",
    ["description"] = "Downgrades to an Iron Sword upon death.",
    ["image"] = "rbxassetid://6875481413",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 42,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v108] = v109
u93[u57.ICE_SWORD] = {
    ["displayName"] = "Ice Sword",
    ["image"] = "rbxassetid://8164577874",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 44,
        ["attackSpeed"] = 0.3
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
local v110 = u57.EMERALD_SWORD
local v111 = {
    ["displayName"] = "Emerald Sword",
    ["description"] = "Downgrades to a Diamond Sword upon death.",
    ["image"] = "rbxassetid://6931677551",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 55,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["itemCatalog"] = {
        ["collection"] = v37.MYTHIC_WEAPON
    }
}
u93[v110] = v111
local v112 = u57.VOID_SWORD
local v113 = {
    ["displayName"] = "Void Sword",
    ["image"] = "rbxassetid://9873021357",
    ["sword"] = {
        ["damage"] = 42,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v112] = v113
local v114 = u57.RAGEBLADE
local v115 = {
    ["displayName"] = "Rageblade",
    ["image"] = "rbxassetid://7051149237",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 70,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN * 0.8
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v114] = v115
local v116 = u57.DOUBLE_EDGE_SWORD
local v117 = {
    ["displayName"] = "Double Edge Sword",
    ["description"] = "Heal yourself by hitting or eliminating other players while taking damage over time.",
    ["image"] = "rbxassetid://8995895533",
    ["sword"] = {
        ["damage"] = 35,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v116] = v117
local v118 = u57.WOOD_DAO
local v119 = {
    ["displayName"] = "Wood Dao",
    ["description"] = "Charge to dash forward.",
    ["image"] = "rbxassetid://8665070999",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 20,
        ["daoDash"] = true,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["daoSword"] = {
        ["dashDamage"] = 16.5,
        ["armorMultiplier"] = 0.8
    }
}
u93[v118] = v119
local v120 = u57.STONE_DAO
local v121 = {
    ["displayName"] = "Stone Dao",
    ["description"] = "Charge to dash forward.",
    ["image"] = "rbxassetid://8665071212",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 25,
        ["daoDash"] = true,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["daoSword"] = {
        ["dashDamage"] = 19.8,
        ["armorMultiplier"] = 0.8
    }
}
u93[v120] = v121
local v122 = u57.IRON_DAO
local v123 = {
    ["displayName"] = "Iron Dao",
    ["description"] = "Charge to dash forward.",
    ["image"] = "rbxassetid://8665071395",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 30,
        ["daoDash"] = true,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["daoSword"] = {
        ["dashDamage"] = 23.1,
        ["armorMultiplier"] = 0.8
    }
}
u93[v122] = v123
local v124 = u57.DIAMOND_DAO
local v125 = {
    ["displayName"] = "Diamond Dao",
    ["description"] = "Charge to dash forward. Downgrades to an Iron Dao upon death.",
    ["image"] = "rbxassetid://8665071845",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 42,
        ["daoDash"] = true,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["daoSword"] = {
        ["dashDamage"] = 27.500000000000004,
        ["armorMultiplier"] = 0.75
    }
}
u93[v124] = v125
local v126 = u57.EMERALD_DAO
local v127 = {
    ["displayName"] = "Emerald Dao",
    ["description"] = "Charge to dash forward. Downgrades to a Diamond Dao upon death.",
    ["image"] = "rbxassetid://8665071630",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 55,
        ["daoDash"] = true,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["daoSword"] = {
        ["dashDamage"] = 30.800000000000004,
        ["armorMultiplier"] = 0.7
    }
}
u93[v126] = v127
local v128 = u57.SHEARS
local v129 = {
    ["displayName"] = "Shears",
    ["image"] = "rbxassetid://7261638571",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.WOOL] = 5
    }
}
u93[v128] = v129
local v130 = u57.WOOL_SHEAR
local v131 = {
    ["displayName"] = "Shears",
    ["image"] = "rbxassetid://7261638571",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.WOOL] = 5
    }
}
u93[v130] = v131
local v132 = u57.WOOD_PICKAXE
local v133 = {
    ["displayName"] = "Wood Pickaxe",
    ["image"] = "rbxassetid://6875481046",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.STONE] = 5
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v132] = v133
local v134 = u57.STONE_PICKAXE
local v135 = {
    ["displayName"] = "Stone Pickaxe",
    ["image"] = "rbxassetid://6875481184",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.STONE] = 8
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v134] = v135
local v136 = u57.IRON_PICKAXE
local v137 = {
    ["displayName"] = "Iron Pickaxe",
    ["image"] = "rbxassetid://6875481325",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.STONE] = 13
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v136] = v137
local v138 = u57.DIAMOND_PICKAXE
local v139 = {
    ["displayName"] = "Diamond Pickaxe",
    ["image"] = "rbxassetid://6875481462",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.STONE] = 20
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v138] = v139
local v140 = u57.PIRATE_SHOVEL
local v141 = {
    ["displayName"] = "Pirate Shovel",
    ["image"] = "rbxassetid://10797226616",
    ["description"] = "Dig enemy blocks for treasure",
    ["breakBlock"] = {
        [v2.STONE] = 20
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v140] = v141
local v142 = u57.LASER_PICKAXE
local v143 = {
    ["displayName"] = "Laser Pickaxe",
    ["image"] = "rbxassetid://92568899407180",
    ["description"] = "Break blocks from afar with this powerful laserbeam!",
    ["breakBlockCooldown"] = 0.15,
    ["sharingDisabled"] = true,
    ["disableFirstPersonWalkAnimation"] = true,
    ["breakBlock"] = {
        [v2.STONE] = 22
    },
    ["breakBlockRange"] = 4 * u17,
    ["breakBlockSwingAnimationOverride"] = u7.FLAMETHROWER_USE,
    ["firstPerson"] = {
        ["verticalOffset"] = 0.4,
        ["scale"] = 0.75,
        ["holdAnimation"] = u7.FLAMETHROWER_IDLE
    }
}
u93[v142] = v143
local v144 = u57.DEFENSE_SCANNER
local v145 = {
    ["displayName"] = "Defense Scanner",
    ["image"] = "rbxassetid://111331930769734",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true,
    ["placesBlock"] = {
        ["blockType"] = u57.DEFENSE_SCANNER_BLOCK_SNAPPING
    }
}
u93[v144] = v145
local v146 = u57.DEFENSE_SCANNER_BLOCK_SNAPPING
local v147 = {
    ["displayName"] = "Defense Scanner Block Snapper",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["block"] = {
        ["breakType"] = v2.STONE
    }
}
u93[v146] = v147
local v148 = u57.WOOD_AXE
local v149 = {
    ["displayName"] = "Wood Axe",
    ["image"] = "rbxassetid://6875481089",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.WOOD] = 4
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v148] = v149
local v150 = u57.STONE_AXE
local v151 = {
    ["displayName"] = "Stone Axe",
    ["image"] = "rbxassetid://6875481224",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.WOOD] = 8
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v150] = v151
local v152 = u57.IRON_AXE
local v153 = {
    ["displayName"] = "Iron Axe",
    ["image"] = "rbxassetid://6875481370",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.WOOD] = 12
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v152] = v153
local v154 = u57.DIAMOND_AXE
local v155 = {
    ["displayName"] = "Diamond Axe",
    ["image"] = "rbxassetid://6883832539",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.WOOD] = 17
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v154] = v155
local v156 = u57.WOOD_BOW
local v157 = {
    ["displayName"] = "Bow",
    ["image"] = "rbxassetid://6869295332",
    ["sharingDisabled"] = true
}
local v159 = {
    ["fireDelaySec"] = 0.6,
    ["maxStrengthChargeSec"] = 0.65,
    ["minStrengthScalar"] = 0.3333333333333333,
    ["walkSpeedMultiplier"] = 0.35,
    ["multiShotChargeTime"] = 0.85,
    ["projectileType"] = function(p158) --[[ Name: projectileType, Line 663 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p158 == u57.FIREWORK_ARROW then
            return "firework_arrow"
        end
        if p158 == u57.VOLLEY_ARROW then
            return "volley_arrow"
        end
        if p158 == u57.IRON_ARROW then
            return "iron_arrow"
        end
        local _ = p158 == u57.ARROW
        return "arrow"
    end,
    ["ammoItemTypes"] = {
        u57.FIREWORK_ARROW,
        u57.ARROW,
        u57.VOLLEY_ARROW,
        u57.IRON_ARROW
    },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["chargeBeginSound"] = { u47.BOW_DRAW },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.BOW_AIM,
        ["fireAnimation"] = u7.BOW_FIRE,
        ["drawAnimation"] = u7.BOW_DRAW
    }
}
v157.projectileSource = v159
v157.firstPerson = {
    ["verticalOffset"] = 0
}
u93[v156] = v157
local v160 = u57.WOOD_CROSSBOW
local v161 = {
    ["displayName"] = "Crossbow",
    ["image"] = "rbxassetid://6869295265",
    ["sharingDisabled"] = true
}
local v163 = {
    ["walkSpeedMultiplier"] = 0.35,
    ["multiShotChargeTime"] = 1.6,
    ["projectileType"] = function(p162) --[[ Name: projectileType, Line 703 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p162 == u57.FIREWORK_ARROW then
            return "crossbow_firework_arrow"
        end
        if p162 == u57.VOLLEY_ARROW then
            return "volley_arrow"
        end
        if p162 == u57.IRON_ARROW then
            return "crossbow_arrow_iron"
        end
        local _ = p162 == u57.ARROW
        return "crossbow_arrow"
    end,
    ["ammoItemTypes"] = { u57.FIREWORK_ARROW, u57.ARROW, u57.IRON_ARROW },
    ["fireDelaySec"] = u53.CROSSBOW_FIRE_DELAY,
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.CROSSBOW_AIM,
        ["fireAnimation"] = u7.CROSSBOW_FIRE
    }
}
v161.projectileSource = v163
v161.replaces = { u57.WOOD_BOW }
u93[v160] = v161
local v164 = u57.TACTICAL_CROSSBOW
local v165 = {
    ["displayName"] = "Tactical Crossbow",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7051149016"
}
local v167 = {
    ["walkSpeedMultiplier"] = 0.35,
    ["multiShotChargeTime"] = 1.6,
    ["projectileType"] = function(p166) --[[ Name: projectileType, Line 745 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p166 == u57.FIREWORK_ARROW then
            return "tactical_crossbow_firework_arrow"
        end
        if p166 == u57.VOLLEY_ARROW then
            return "volley_arrow"
        end
        if p166 == u57.IRON_ARROW then
            return "tactical_crossbow_arrow_iron"
        end
        local _ = p166 == u57.ARROW
        return "tactical_crossbow_arrow"
    end,
    ["ammoItemTypes"] = { u57.FIREWORK_ARROW, u57.ARROW, u57.IRON_ARROW },
    ["fireDelaySec"] = u53.CROSSBOW_FIRE_DELAY,
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.CROSSBOW_AIM,
        ["fireAnimation"] = u7.CROSSBOW_FIRE
    }
}
v165.projectileSource = v167
u93[v164] = v165
local v168 = u57.TACTICAL_HEADHUNTER
local v169 = {
    ["displayName"] = "Tactical Headhunter",
    ["description"] = "A tactical adaptation of the legendary Headhunter, this weapon deals massive damage!",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://13887697172"
}
local v171 = {
    ["walkSpeedMultiplier"] = 0.35,
    ["multiShotChargeTime"] = 2,
    ["projectileType"] = function(p170) --[[ Name: projectileType, Line 785 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p170 == u57.FIREWORK_ARROW then
            return "headhunter_firework_arrow"
        end
        if p170 == u57.IRON_ARROW then
            return "tactical_headhunter_arrow_iron"
        end
        local _ = p170 == u57.ARROW
        return "tactical_headhunter_arrow"
    end,
    ["ammoItemTypes"] = { u57.FIREWORK_ARROW, u57.ARROW, u57.IRON_ARROW },
    ["fireDelaySec"] = u53.HEADHUNTER_FIRE_DELAY,
    ["launchSound"] = {
        u47.HEADHUNTER_SHOOT_1,
        u47.HEADHUNTER_SHOOT_2,
        u47.HEADHUNTER_SHOOT_3,
        u47.HEADHUNTER_SHOOT_4
    },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM_FP,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT_FP
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT
    }
}
v169.projectileSource = v171
u93[v168] = v169
local v172 = u57.FEATHER_BOW
local v173 = {
    ["displayName"] = "Feather Bow",
    ["image"] = "rbxassetid://6869295332",
    ["projectileSource"] = {
        ["fireDelaySec"] = 1,
        ["maxStrengthChargeSec"] = 0.9,
        ["minStrengthScalar"] = 0.25,
        ["walkSpeedMultiplier"] = 0.25,
        ["projectileType"] = function() --[[ Name: projectileType, Line 822 ]]
            return "arrow"
        end,
        ["ammoItemTypes"] = { u57.ARROW },
        ["launchSound"] = { u47.NEW_BOW_FIRE },
        ["chargeBeginSound"] = { u47.BOW_DRAW }
    }
}
u93[v172] = v173
local v174 = u57.FALCONER_BOW
local v175 = {
    ["displayName"] = "Feather-light Bow",
    ["description"] = "Blessed by the wind, this lightweight weapon enables skilled archers to hunt their prey with speed and accuracy",
    ["sharingDisabled"] = true
}
local v177 = {
    ["fireDelaySec"] = 0.6,
    ["maxStrengthChargeSec"] = 0.65,
    ["minStrengthScalar"] = 0.3333333333333333,
    ["multiShotChargeTime"] = 1,
    ["projectileType"] = function(p176) --[[ Name: projectileType, Line 839 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p176 == u57.FIREWORK_ARROW then
            return "firework_arrow"
        end
        if p176 == u57.VOLLEY_ARROW then
            return "volley_arrow"
        end
        if p176 == u57.IRON_ARROW then
            return "iron_arrow"
        end
        local _ = p176 == u57.ARROW
        return "arrow"
    end,
    ["ammoItemTypes"] = {
        u57.FIREWORK_ARROW,
        u57.ARROW,
        u57.VOLLEY_ARROW,
        u57.IRON_ARROW
    },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["chargeBeginSound"] = { u47.BOW_DRAW },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.BOW_AIM,
        ["fireAnimation"] = u7.BOW_FIRE,
        ["drawAnimation"] = u7.BOW_DRAW
    }
}
v175.projectileSource = v177
v175.firstPerson = {
    ["verticalOffset"] = 0
}
v175.image = v35.FALCONER_BOW
v175.replaces = { u57.WOOD_BOW }
u93[v174] = v175
local v178 = u57.FALCONER_CROSSBOW
local v179 = {
    ["displayName"] = "Feather-light Crossbow",
    ["description"] = "Blessed by the wind, this lightweight weapon enables skilled archers to hunt their prey with speed and accuracy",
    ["sharingDisabled"] = true
}
local v181 = {
    ["multiShotChargeTime"] = 1.6,
    ["projectileType"] = function(p180) --[[ Name: projectileType, Line 880 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p180 == u57.FIREWORK_ARROW then
            return "crossbow_firework_arrow"
        end
        if p180 == u57.VOLLEY_ARROW then
            return "volley_arrow"
        end
        if p180 == u57.IRON_ARROW then
            return "crossbow_arrow_iron"
        end
        local _ = p180 == u57.ARROW
        return "crossbow_arrow"
    end,
    ["ammoItemTypes"] = { u57.FIREWORK_ARROW, u57.ARROW, u57.IRON_ARROW },
    ["fireDelaySec"] = u53.CROSSBOW_FIRE_DELAY,
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.CROSSBOW_AIM,
        ["fireAnimation"] = u7.CROSSBOW_FIRE
    }
}
v179.projectileSource = v181
v179.image = v35.FALCONER_CROSSBOW
v179.replaces = { u57.FALCONER_BOW, u57.WOOD_BOW, u57.WOOD_CROSSBOW }
v179.firstPerson = {
    ["scale"] = 0.9,
    ["verticalOffset"] = -0.25
}
u93[v178] = v179
local v182 = u57.FALCONER_HEADHUNTER
local v183 = {
    ["displayName"] = "Feather-light Headhunter",
    ["description"] = "Blessed by the wind, this lightweight weapon enables skilled archers to hunt their prey with speed and accuracy. Hit headshots for massive damage!",
    ["sharingDisabled"] = true
}
local v185 = {
    ["multiShotChargeTime"] = 2,
    ["projectileType"] = function(p184) --[[ Name: projectileType, Line 925 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p184 == u57.FIREWORK_ARROW then
            return "headhunter_firework_arrow"
        end
        if p184 == u57.IRON_ARROW then
            return "headhunter_arrow_iron"
        end
        local _ = p184 == u57.ARROW
        return "headhunter_arrow"
    end,
    ["ammoItemTypes"] = { u57.FIREWORK_ARROW, u57.ARROW, u57.IRON_ARROW },
    ["fireDelaySec"] = u53.HEADHUNTER_FIRE_DELAY,
    ["launchSound"] = {
        u47.HEADHUNTER_SHOOT_1,
        u47.HEADHUNTER_SHOOT_2,
        u47.HEADHUNTER_SHOOT_3,
        u47.HEADHUNTER_SHOOT_4
    },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM_FP,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT_FP
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT
    }
}
v183.projectileSource = v185
v183.image = v35.FALCONER_HEADHUNTER
v183.replaces = {
    u57.FALCONER_CROSSBOW,
    u57.WOOD_CROSSBOW,
    u57.FALCONER_BOW,
    u57.WOOD_BOW
}
u93[v182] = v183
local v186 = u57.TELEPEARL
local v187 = {
    ["displayName"] = "Telepearl",
    ["description"] = "A magical teleportation orb that can be thrown.",
    ["image"] = "rbxassetid://6874950144"
}
local v188 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 963 ]]
        return "telepearl"
    end,
    ["ammoItemTypes"] = { u57.TELEPEARL },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v187.projectileSource = v188
u93[v186] = v187
u93[u57.ARROW] = {
    ["displayName"] = "Arrow",
    ["image"] = "rbxassetid://6869295400",
    ["hotbarFillRight"] = true
}
u93[u57.IRON_ARROW] = {
    ["displayName"] = "Iron Arrow",
    ["image"] = "rbxassetid://15579506183",
    ["hotbarFillRight"] = true,
    ["sharingDisabled"] = true,
    ["description"] = "Increased projectile damage"
}
u93[u57.FIREWORK_ARROW] = {
    ["displayName"] = "Firework Arrow",
    ["image"] = "rbxassetid://8665953060",
    ["hotbarFillRight"] = true
}
local v189 = u57.FIREBALL
local v190 = {
    ["displayName"] = "Fireball",
    ["description"] = "Throw fireball that explodes on impact.",
    ["image"] = "rbxassetid://7192711008",
    ["sharingDisabled"] = true
}
local v191 = {
    ["fireDelaySec"] = 1,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 998 ]]
        return "fireball"
    end,
    ["ammoItemTypes"] = { u57.FIREBALL },
    ["launchSound"] = { u47.FIREBALL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.PUNCH
    }
}
v190.projectileSource = v191
u93[v189] = v190
local v192 = u57.DIRT
local v193 = {
    ["displayName"] = "Dirt",
    ["footstepSound"] = v46.GRASS
}
local v194 = {
    ["breakType"] = v2.DIRT,
    ["placeSound"] = function() --[[ Name: placeSound, Line 1021 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 3
        }
    }
}
v193.block = v194
u93[v192] = v193
local v195 = u57.GRASS
local v196 = {
    ["displayName"] = "Grass",
    ["footstepSound"] = v46.GRASS
}
local v197 = {
    ["breakType"] = v2.DIRT,
    ["placeSound"] = function() --[[ Name: placeSound, Line 1037 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 2
        }
    }
}
v196.block = v197
u93[v195] = v196
local v198 = u57.STONE
local v199 = {
    ["displayName"] = "Stone",
    ["footstepSound"] = v46.STONE
}
local v200 = {
    ["health"] = 50,
    ["blastResistance"] = 2,
    ["regenSpeed"] = 0.1,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    }
}
local v201 = {}
local v202 = {
    ["blockId"] = 152,
    ["mapBlockOverride"] = {
        ["filterType"] = "Include",
        ["mapNames"] = { "mw_Mines" },
        ["config"] = {
            ["breakable"] = true
        }
    }
}
__set_list(v201, 1, {{
    ["blockId"] = 1,
    ["blockData"] = 0
}, v202})
v200.minecraftConversions = v201
v199.block = v200
u93[v198] = v199
local v203 = u57.STONE_TILES
local v204 = {
    ["displayName"] = "Stone Tiles",
    ["footstepSound"] = v46.STONE
}
local v205 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 201
        }
    }
}
v204.block = v205
u93[v203] = v204
local v206 = u57.COBBLESTONE
local v207 = {
    ["displayName"] = "Cobblestone",
    ["footstepSound"] = v46.STONE
}
local v208 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 4
        }
    }
}
v207.block = v208
u93[v206] = v207
local v209 = u57.MOSS_BLOCK
local v210 = {
    ["displayName"] = "Moss Block",
    ["footstepSound"] = v46.GRASS
}
local v211 = {
    ["breakType"] = v2.DIRT,
    ["placeSound"] = function() --[[ Name: placeSound, Line 1105 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["greedyMesh"] = {
        ["textures"] = {},
        ["materialColor"] = {
            Color3.fromRGB(60, 229, 0),
            v5.hexColor(2154445),
            v5.hexColor(3264140),
            v5.hexColor(3721138),
            Color3.fromRGB(0, 232, 118)
        }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 48
        }
    }
}
v210.block = v211
u93[v209] = v210
local v212 = u57.STONE_PILLAR
local v213 = {
    ["displayName"] = "Stone Pillar",
    ["footstepSound"] = v46.STONE
}
local v214 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 202
        }
    }
}
v213.block = v214
u93[v212] = v213
local v215 = u57.STONE_SLAB
local v216 = {
    ["displayName"] = "Stone Slab",
    ["footstepSound"] = v46.STONE
}
local v217 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 43,
            ["blockData"] = 8
        },
        {
            ["blockId"] = 43,
            ["blockData"] = 0
        },
        {
            ["blockId"] = 44,
            ["blockData"] = 0
        }
    }
}
v216.block = v217
u93[v215] = v216
local v218 = u57.STONE_BRICK
local v219 = {
    ["displayName"] = "Stone Brick",
    ["footstepSound"] = v46.STONE
}
local v220 = {
    ["blastResistance"] = 2,
    ["health"] = 75,
    ["regenSpeed"] = 0.1,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 98
        }
    }
}
v219.block = v220
u93[v218] = v219
local v221 = u57.STONE_BRICK_BUILDER
local v222 = {
    ["displayName"] = "Stone Wall Builder",
    ["description"] = "Build a stone wall",
    ["image"] = "rbxassetid://10717427173",
    ["footstepSound"] = v46.STONE,
    ["block"] = {
        ["blastResistance"] = 1.73,
        ["health"] = 75,
        ["breakType"] = v2.STONE
    }
}
u93[v221] = v222
local v223 = u57.BRICK
local v224 = {
    ["displayName"] = "Brick",
    ["footstepSound"] = v46.STONE
}
local v225 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 1185 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 45
        }
    }
}
v224.block = v225
u93[v223] = v224
local v226 = u57.ANDESITE
local v227 = {
    ["displayName"] = "ANDESITE",
    ["footstepSound"] = v46.STONE
}
local v228 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 1201 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 1,
            ["blockData"] = 5
        }
    }
}
v227.block = v228
u93[v226] = v227
local v229 = u57.ANDESITE_POLISHED
local v230 = {
    ["displayName"] = "Polished Andesite",
    ["footstepSound"] = v46.STONE
}
local v231 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 1218 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 1,
            ["blockData"] = 6
        }
    }
}
v230.block = v231
u93[v229] = v230
local v232 = u57.DIORITE
local v233 = {
    ["displayName"] = "Diorite",
    ["footstepSound"] = v46.STONE
}
local v234 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 1235 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 1,
            ["blockData"] = 3
        }
    }
}
v233.block = v234
u93[v232] = v233
local v235 = u57.DIORITE_POLISHED
local v236 = {
    ["displayName"] = "Polished Diorite",
    ["footstepSound"] = v46.STONE
}
local v237 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 1252 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 1,
            ["blockData"] = 4
        }
    }
}
v236.block = v237
u93[v235] = v236
local v238 = u57.GRANITE
local v239 = {
    ["displayName"] = "Granite",
    ["footstepSound"] = v46.STONE
}
local v240 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 1269 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 1,
            ["blockData"] = 1
        }
    }
}
v239.block = v240
u93[v238] = v239
local v241 = u57.GRANITE_POLISHED
local v242 = {
    ["displayName"] = "Polished Granite",
    ["footstepSound"] = v46.STONE
}
local v243 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 1286 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 1,
            ["blockData"] = 2
        }
    }
}
v242.block = v243
u93[v241] = v242
local v244 = u57.OBSIDIAN
local v245 = {
    ["displayName"] = "Obsidian",
    ["footstepSound"] = v46.STONE
}
local v246 = {
    ["health"] = 150,
    ["blastResistance"] = 10,
    ["regenSpeed"] = 0.2,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 49
        }
    }
}
v245.block = v246
u93[v244] = v245
local v247 = u57.FISHERMAN_CORAL
local v248 = {
    ["displayName"] = "Coral",
    ["footstepSound"] = v46.STONE
}
local v249 = {
    ["health"] = 210,
    ["blastResistance"] = 5,
    ["regenSpeed"] = 0.2,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 8012
        }
    }
}
v248.block = v249
u93[v247] = v248
local v250 = u57.WOOD_PLANK_OAK
local v251 = {
    ["displayName"] = "Oak Plank",
    ["footstepSound"] = v46.WOOD
}
local v252 = {
    ["blastResistance"] = 1.4,
    ["health"] = 35,
    ["flammable"] = true,
    ["flameSpreadStopChance"] = 0.4,
    ["regenSpeed"] = 0.15,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 5
        }
    }
}
v251.block = v252
u93[v250] = v251
local v253 = u57.WOOD_PLANK_OAK_BUILDER
local v254 = {
    ["displayName"] = "Oak Plank Wall",
    ["description"] = "Build a wood wall",
    ["image"] = "rbxassetid://10717426899",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastResistance"] = 1.4,
        ["health"] = 30,
        ["breakType"] = v2.WOOD
    }
}
u93[v253] = v254
local v255 = u57.DRAWBRIDGE
local v256 = {
    ["displayName"] = "Bridge Printer",
    ["description"] = "Hit with your hammer to toggle a scaffold bridge!",
    ["sharingDisabled"] = true,
    ["footstepSound"] = v46.STONE
}
local v257 = {
    ["blastResistance"] = 1.4,
    ["health"] = 10,
    ["disableInventoryPickup"] = true,
    ["maxPlaced"] = 24,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {},
        ["rotation"] = {}
    }
}
v256.block = v257
v256.drawBridgeSource = {}
u93[v255] = v256
local v258 = u57.SCAFFOLD
local v259 = {
    ["displayName"] = "Scaffold",
    ["sharingDisabled"] = true,
    ["footstepSound"] = v46.WOOD
}
local v260 = {
    ["blastResistance"] = 1.4,
    ["health"] = 1,
    ["disableInventoryPickup"] = true,
    ["flammable"] = true,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {},
        ["rotation"] = {}
    },
    ["collectionServiceTags"] = { "scaffold" }
}
v259.block = v260
u93[v258] = v259
local v261 = u57.OAK_LOG
local v262 = {
    ["displayName"] = "Oak Log",
    ["footstepSound"] = v46.WOOD
}
local v263 = {
    ["health"] = 30,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 17
        },
        {
            ["blockId"] = 35
        },
        {
            ["blockId"] = 159,
            ["blockData"] = 8
        }
    }
}
v262.block = v263
u93[v261] = v262
local v264 = u57.BIRCH_LOG
local v265 = {
    ["displayName"] = "Birch Log",
    ["footstepSound"] = v46.WOOD
}
local v266 = {
    ["health"] = 30,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 17,
            ["blockData"] = 2
        }
    }
}
v265.block = v266
u93[v264] = v265
local v267 = u57.SPRUCE_LOG
local v268 = {
    ["displayName"] = "Spruce Log",
    ["footstepSound"] = v46.WOOD
}
local v269 = {
    ["health"] = 30,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 17,
            ["blockData"] = 1
        }
    }
}
v268.block = v269
u93[v267] = v268
local v270 = u57.HICKORY_LOG
local v271 = {
    ["displayName"] = "Hickory Log",
    ["footstepSound"] = v46.WOOD
}
local v272 = {
    ["health"] = 30,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 17,
            ["blockData"] = 3
        },
        {
            ["blockId"] = 162,
            ["blockData"] = 0
        }
    }
}
v271.block = v272
u93[v270] = v271
local v273 = u57.WOOD_PLANK_BIRCH
local v274 = {
    ["displayName"] = "Birch Wood Plank",
    ["footstepSound"] = v46.WOOD
}
local v275 = {
    ["health"] = 30,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 5,
            ["blockData"] = 2
        }
    }
}
v274.block = v275
u93[v273] = v274
local v276 = u57.WOOD_PLANK_SPRUCE
local v277 = {
    ["displayName"] = "Spruce Wood Plank",
    ["footstepSound"] = v46.WOOD
}
local v278 = {
    ["health"] = 30,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 5,
            ["blockData"] = 1
        }
    }
}
v277.block = v278
u93[v276] = v277
local v279 = u57.WOOD_PLANK_MAPLE
local v280 = {
    ["displayName"] = "Maple Wood Plank",
    ["footstepSound"] = v46.WOOD
}
local v281 = {
    ["health"] = 30,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 5,
            ["blockData"] = 4
        }
    }
}
v280.block = v281
u93[v279] = v280
local v282 = u57.BOOKSHELF
local v283 = {
    ["displayName"] = "Bookshelf",
    ["footstepSound"] = v46.WOOD
}
local v284 = {
    ["health"] = 15,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 47
        }
    }
}
v283.block = v284
u93[v282] = v283
local v285 = u57.GLASS
local v286 = {
    ["displayName"] = "Glass",
    ["image"] = "rbxassetid://6909521321",
    ["footstepSound"] = v46.STONE,
    ["block"] = {
        ["health"] = 1,
        ["seeThrough"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 20
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 0
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 1
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 2
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 3
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 4
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 5
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 6
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 7
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 8
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 9
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 10
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 11
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 12
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 13
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 14
            },
            {
                ["blockId"] = 95,
                ["blockData"] = 15
            }
        }
    }
}
u93[v285] = v286
local v287 = u57.BED
local v288 = {
    ["displayName"] = "Bed",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["blastResistance"] = 10000000,
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 24,
        ["noRegen"] = true,
        ["healthType"] = v3.GLOBAL,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "bed" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12005
            }
        }
    }
}
u93[v287] = v288
local v289 = u57.OG_BED
local v290 = {
    ["displayName"] = "Bed",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["blastResistance"] = 10000000,
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 24,
        ["noRegen"] = true,
        ["healthType"] = v3.GLOBAL,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "bed" }
    }
}
u93[v289] = v290
local v291 = u57.FLAG
local v292 = {
    ["displayName"] = "Flag",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 18,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "flag" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12006
            }
        }
    }
}
u93[v291] = v292
local v293 = u57.PINATA
local v294 = {
    ["displayName"] = "Pi\195\177ata",
    ["image"] = "rbxassetid://10013673974",
    ["sharingDisabled"] = true,
    ["footstepSound"] = v46.STONE,
    ["block"] = {
        ["maxPlaced"] = 1,
        ["disableInventoryPickup"] = true,
        ["health"] = 35,
        ["seeThrough"] = true,
        ["breakType"] = v2.STONE,
        ["placeSound"] = function() --[[ Name: placeSound, Line 1632 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u6
                [3] = u47
            --]]
            return u54(u6.fromList(u47.PINATA_HIT_1, u47.PINATA_HIT_2, u47.PINATA_HIT_3))
        end,
        ["hitSound"] = function() --[[ Name: hitSound, Line 1635 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u6
                [3] = u47
            --]]
            return u54(u6.fromList(u47.PINATA_HIT_1, u47.PINATA_HIT_2, u47.PINATA_HIT_3))
        end,
        ["collectionServiceTags"] = { "piggy-bank" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8013
            }
        }
    }
}
u93[v293] = v294
local v295 = u57.LEATHER_HELMET
local v296 = {
    ["displayName"] = "Leather Helmet",
    ["image"] = "rbxassetid://6855466216",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.12,
        ["slot"] = v36.HELMET
    }
}
u93[v295] = v296
local v297 = u57.LEATHER_CHESTPLATE
local v298 = {
    ["displayName"] = "Leather Chestplate",
    ["image"] = "rbxassetid://6876833204",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.16,
        ["slot"] = v36.CHESTPLATE
    }
}
u93[v297] = v298
local v299 = u57.LEATHER_BOOTS
local v300 = {
    ["displayName"] = "Leather Boots",
    ["image"] = "rbxassetid://6855466456",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.08,
        ["slot"] = v36.BOOTS
    }
}
u93[v299] = v300
local v301 = u57.IRON_HELMET
local v302 = {
    ["displayName"] = "Iron Helmet",
    ["image"] = "rbxassetid://6874272559",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.2,
        ["slot"] = v36.HELMET
    }
}
u93[v301] = v302
local v303 = u57.IRON_CHESTPLATE
local v304 = {
    ["displayName"] = "Iron Chestplate",
    ["image"] = "rbxassetid://6874272631",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.24,
        ["slot"] = v36.CHESTPLATE
    }
}
u93[v303] = v304
local v305 = u57.IRON_BOOTS
local v306 = {
    ["displayName"] = "Iron Boots",
    ["image"] = "rbxassetid://6874272718",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.12,
        ["slot"] = v36.BOOTS
    }
}
u93[v305] = v306
local v307 = u57.DIAMOND_HELMET
local v308 = {
    ["displayName"] = "Diamond Helmet",
    ["image"] = "rbxassetid://6874272793",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.24,
        ["slot"] = v36.HELMET
    }
}
u93[v307] = v308
local v309 = u57.DIAMOND_CHESTPLATE
local v310 = {
    ["displayName"] = "Diamond Chestplate",
    ["image"] = "rbxassetid://6874272898",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.32,
        ["slot"] = v36.CHESTPLATE
    }
}
u93[v309] = v310
local v311 = u57.DIAMOND_BOOTS
local v312 = {
    ["displayName"] = "Diamond Boots",
    ["image"] = "rbxassetid://6874272964",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.2,
        ["slot"] = v36.BOOTS
    }
}
u93[v311] = v312
local v313 = u57.EMERALD_HELMET
local v314 = {
    ["displayName"] = "Emerald Helmet",
    ["image"] = "rbxassetid://6931675766",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.24,
        ["slot"] = v36.HELMET
    }
}
u93[v313] = v314
local v315 = u57.EMERALD_CHESTPLATE
local v316 = {
    ["displayName"] = "Emerald Chestplate",
    ["image"] = "rbxassetid://6931675868",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.4,
        ["slot"] = v36.CHESTPLATE
    }
}
u93[v315] = v316
local v317 = u57.EMERALD_BOOTS
local v318 = {
    ["displayName"] = "Emerald Boots",
    ["image"] = "rbxassetid://6931675942",
    ["sharingDisabled"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.2,
        ["slot"] = v36.BOOTS
    }
}
u93[v317] = v318
local v319 = u57.VOID_HELMET
local v320 = {
    ["displayName"] = "Void Helmet",
    ["image"] = "rbxassetid://9866786767",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.2,
        ["slot"] = v36.HELMET
    }
}
u93[v319] = v320
local v321 = u57.VOID_CHESTPLATE
local v322 = {
    ["displayName"] = "Void Chestplate",
    ["image"] = "rbxassetid://9866786852",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.34,
        ["slot"] = v36.CHESTPLATE
    }
}
u93[v321] = v322
local v323 = u57.VOID_BOOTS
local v324 = {
    ["displayName"] = "Void Boots",
    ["image"] = "rbxassetid://9866786979",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.16,
        ["slot"] = v36.BOOTS
    }
}
u93[v323] = v324
local v325 = u57.JUGGERNAUT_HELMET
local v326 = {
    ["displayName"] = "Juggernaut Helmet",
    ["image"] = "rbxassetid://8730010634",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.26,
        ["slot"] = v36.HELMET
    }
}
u93[v325] = v326
local v327 = u57.JUGGERNAUT_CHESTPLATE
local v328 = {
    ["displayName"] = "Juggernaut Chestplate",
    ["image"] = "rbxassetid://8730010865",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.42,
        ["slot"] = v36.CHESTPLATE
    }
}
u93[v327] = v328
local v329 = u57.JUGGERNAUT_BOOTS
local v330 = {
    ["displayName"] = "Juggernaut Boots",
    ["image"] = "rbxassetid://8730011123",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.22,
        ["slot"] = v36.BOOTS
    }
}
u93[v329] = v330
u93[u57.IRON] = {
    ["displayName"] = "Iron",
    ["image"] = "rbxassetid://6850537969",
    ["hotbarFillRight"] = true,
    ["displayNameColor"] = Color3.fromRGB(255, 255, 255)
}
u93[u57.DIAMOND] = {
    ["displayName"] = "Diamond",
    ["image"] = "rbxassetid://6850538161",
    ["hotbarFillRight"] = true,
    ["displayNameColor"] = v5.hexColor(5636095),
    ["pickUpOverlaySound"] = u47.NEW_DIAMOND_PICKUP
}
u93[u57.EMERALD] = {
    ["displayName"] = "Emerald",
    ["image"] = "rbxassetid://6850538075",
    ["hotbarFillRight"] = true,
    ["displayNameColor"] = v5.hexColor(5635925),
    ["pickUpOverlaySound"] = u47.NEW_EMERALD_PICKUP
}
u93[u57.GOLD] = {
    ["displayName"] = "Gold",
    ["image"] = "rbxassetid://13465460696",
    ["hotbarFillRight"] = true,
    ["displayNameColor"] = Color3.fromRGB(255, 209, 0)
}
u93[u57.CANDY] = {
    ["displayName"] = "Candy",
    ["image"] = "rbxassetid://10013673573",
    ["hotbarFillRight"] = true,
    ["sharingDisabled"] = true,
    ["displayNameColor"] = v5.hexColor(5635925)
}
u93[u57.VOID_CRYSTAL] = {
    ["displayName"] = "Void Crystal",
    ["image"] = "rbxassetid://9866758117",
    ["hotbarFillRight"] = true,
    ["displayNameColor"] = v49.mcPink
}
local v331 = u57.EMERALD_BLOCK
local v332 = {
    ["displayName"] = "Emerald Block",
    ["footstepSound"] = v46.STONE
}
local v333 = {
    ["blastResistance"] = 0.25,
    ["health"] = 100,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 1855 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 133
        }
    }
}
v332.block = v333
u93[v331] = v332
local v334 = u57.GALACTITE
local v335 = {
    ["displayName"] = "Galactite",
    ["footstepSound"] = v46.VOID
}
local v336 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 1871 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 87
        }
    }
}
v335.block = v336
u93[v334] = v335
local v337 = u57.GALACTITE_BRICK
local v338 = {
    ["displayName"] = "Galactite Brick",
    ["footstepSound"] = v46.VOID
}
local v339 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 1887 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 112
        }
    }
}
v338.block = v339
u93[v337] = v338
local v340 = u57.KOBBLAK
local v341 = {
    ["displayName"] = "Kobblak",
    ["footstepSound"] = v46.VOID
}
local v342 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 1903 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 216
        }
    }
}
v341.block = v342
u93[v340] = v341
local v343 = u57.VOID_DIRT
local v344 = {
    ["displayName"] = "Void Dirt",
    ["footstepSound"] = v46.GRASS
}
local v345 = {
    ["breakType"] = v2.DIRT,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 1919 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GRASS_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 3,
            ["blockData"] = 1
        }
    }
}
v344.block = v345
u93[v343] = v344
local v346 = u57.VOID_GROWTH
local v347 = {
    ["displayName"] = "Void Growth",
    ["footstepSound"] = v46.GRASS
}
local v348 = {
    ["breakType"] = v2.DIRT,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 1936 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GRASS_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 214
        }
    }
}
v347.block = v348
u93[v346] = v347
local v349 = u57.VOID_GRASS
local v350 = {
    ["displayName"] = "Kresh",
    ["footstepSound"] = v46.GRASS
}
local v351 = {
    ["breakType"] = v2.DIRT,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 1952 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GRASS_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 3,
            ["blockData"] = 2
        }
    }
}
v350.block = v351
u93[v349] = v350
local v352 = u57.DIAMOND_BLOCK
local v353 = {
    ["displayName"] = "Diamond Block",
    ["footstepSound"] = v46.STONE
}
local v354 = {
    ["blastResistance"] = 0.25,
    ["health"] = 100,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 1971 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 57
        }
    }
}
v353.block = v354
u93[v352] = v353
local v355 = u57.IRON_BLOCK
local v356 = {
    ["displayName"] = "Iron Block",
    ["footstepSound"] = v46.STONE
}
local v357 = {
    ["blastResistance"] = 0.25,
    ["health"] = 100,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 1989 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 42
        }
    }
}
v356.block = v357
u93[v355] = v356
local v358 = u57.GOLD_BLOCK
local v359 = {
    ["displayName"] = "Gold Block",
    ["footstepSound"] = v46.STONE
}
local v360 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 2005 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 251,
            ["blockData"] = 4
        }
    }
}
v359.block = v360
u93[v358] = v359
local v361 = u57.GUILDED_IRON
local v362 = {
    ["displayName"] = "Guilded Iron Block",
    ["footstepSound"] = v46.STONE
}
local v363 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 2022 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 41
        }
    }
}
v362.block = v363
u93[v361] = v362
local v364 = u57.COPPER_BLOCK
local v365 = {
    ["displayName"] = "Copper Block",
    ["footstepSound"] = v46.STONE
}
local v366 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 2038 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 14
        }
    }
}
v365.block = v366
u93[v364] = v365
local v367 = u57.STEEL_BLOCK
local v368 = {
    ["displayName"] = "Steel Block",
    ["footstepSound"] = v46.STONE
}
local v369 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 2054 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 15
        }
    }
}
v368.block = v369
u93[v367] = v368
u93[u57.WOOL_WHITE] = v52.wool({
    ["displayName"] = "White Wool",
    ["minecraftConversions"] = {
        {
            ["blockId"] = 35,
            ["blockData"] = 0
        }
    }
})
local v370 = u57.WOOL_BUILDER
local v371 = {
    ["displayName"] = "Wool Wall",
    ["image"] = "rbxassetid://10717426564",
    ["description"] = "Build a wool wall",
    ["removeFromCustoms"] = true,
    ["footstepSound"] = v46.WOOL,
    ["block"] = {
        ["health"] = 8,
        ["blastResistance"] = 0.65,
        ["wool"] = true,
        ["flammable"] = true,
        ["breakType"] = v2.WOOL,
        ["hitSound"] = function() --[[ Name: hitSound, Line 2076 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.WOOL_BREAK)
        end,
        ["placeSound"] = function() --[[ Name: placeSound, Line 2079 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_PLACE)
        end
    }
}
u93[v370] = v371
u93[u57.WOOL_BLUE] = v52.wool({
    ["displayName"] = "Blue Wool",
    ["minecraftConversions"] = {
        {
            ["blockId"] = 35,
            ["blockData"] = 11
        },
        {
            ["blockId"] = 35,
            ["blockData"] = 3
        }
    }
})
u93[u57.WOOL_RED] = v52.wool({
    ["displayName"] = "Red Wool",
    ["minecraftConversions"] = {
        {
            ["blockId"] = 35,
            ["blockData"] = 14
        }
    }
})
u93[u57.WOOL_GREEN] = v52.wool({
    ["displayName"] = "Green Wool",
    ["minecraftConversions"] = {
        {
            ["blockId"] = 35,
            ["blockData"] = 5
        }
    }
})
u93[u57.WOOL_ORANGE] = v52.wool({
    ["displayName"] = "Orange Wool",
    ["minecraftConversions"] = {
        {
            ["blockId"] = 35,
            ["blockData"] = 1
        }
    }
})
u93[u57.WOOL_YELLOW] = v52.wool({
    ["displayName"] = "Yellow Wool",
    ["minecraftConversions"] = {
        {
            ["blockId"] = 35,
            ["blockData"] = 4
        }
    }
})
u93[u57.WOOL_PINK] = v52.wool({
    ["displayName"] = "Pink Wool",
    ["minecraftConversions"] = {
        {
            ["blockId"] = 35,
            ["blockData"] = 6
        }
    }
})
u93[u57.WOOL_CYAN] = v52.wool({
    ["displayName"] = "Cyan Wool",
    ["minecraftConversions"] = {
        {
            ["blockId"] = 35,
            ["blockData"] = 9
        }
    }
})
u93[u57.WOOL_PURPLE] = v52.wool({
    ["displayName"] = "Purple Wool",
    ["minecraftConversions"] = {
        {
            ["blockId"] = 35,
            ["blockData"] = 10
        }
    }
})
u93[u57.WOOL_BROWN] = v52.wool({
    ["displayName"] = "Brown Wool"
})
local v372 = u57.VOLATILE_STONE
local v373 = {
    ["displayName"] = "Volatile Stone",
    ["footstepSound"] = v46.STONE
}
local v374 = {
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 2159 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["pointLight"] = {
        ["Brightness"] = 0.4,
        ["Shadows"] = true,
        ["Range"] = 12,
        ["Color"] = Color3.fromRGB(176, 250, 191)
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 12020
        }
    }
}
v373.block = v374
u93[v372] = v373
local v375 = u57.VOID_BLOCK
local v376 = {
    ["displayName"] = "Void Rock",
    ["footstepSound"] = v46.VOID
}
local v377 = {
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 2181 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["collectionServiceTags"] = { "void_block" }
}
v376.block = v377
u93[v375] = v376
local v378 = u57.INVISIBLE_BLOCK
local v379 = {
    ["displayName"] = "Void Rock",
    ["removeFromCustoms"] = true,
    ["footstepSound"] = v46.VOID,
    ["block"] = {
        ["disableInventoryPickup"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 2192 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end
    }
}
u93[v378] = v379
local v380 = u57.FLYING_MONSTER_BLOCK
local v381 = {
    ["displayName"] = "Air",
    ["removeFromCustoms"] = true,
    ["block"] = {
        ["disableInventoryPickup"] = true,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 2203 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "no-query-block" }
    }
}
u93[v380] = v381
local v382 = u57.DAMAGE_BANNER
local v383 = {
    ["displayName"] = "Fire Banner",
    ["description"] = "Place banner that grants \'Fire II\' to yourself and any team member inside banner radius.",
    ["image"] = "rbxassetid://9557924197",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 3
    },
    ["block"] = {
        ["health"] = 80,
        ["disableInventoryPickup"] = true,
        ["unbreakableByTeammates"] = true,
        ["seeThrough"] = true,
        ["maxPlaced"] = 1,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.STONE,
        ["placeSound"] = function() --[[ Name: placeSound, Line 2222 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["hitSound"] = function() --[[ Name: hitSound, Line 2225 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "flag-kit" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12007
            }
        }
    }
}
u93[v382] = v383
local v384 = u57.DEFENSE_BANNER
local v385 = {
    ["displayName"] = "Defense Banner",
    ["description"] = "Place banner that grants \'Anti Knockback\' to yourself and any team member inside banner radius.",
    ["image"] = "rbxassetid://9557924054",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 3
    },
    ["block"] = {
        ["health"] = 80,
        ["disableInventoryPickup"] = true,
        ["unbreakableByTeammates"] = true,
        ["seeThrough"] = true,
        ["maxPlaced"] = 1,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.STONE,
        ["placeSound"] = function() --[[ Name: placeSound, Line 2250 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["hitSound"] = function() --[[ Name: hitSound, Line 2253 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "flag-kit" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12008
            }
        }
    }
}
u93[v384] = v385
local v386 = u57.HEAL_BANNER
local v387 = {
    ["displayName"] = "Heal Banner",
    ["description"] = "Place banner that heals yourself and any team member inside banner radius.",
    ["image"] = "rbxassetid://9557924389",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 3
    },
    ["block"] = {
        ["health"] = 80,
        ["disableInventoryPickup"] = true,
        ["unbreakableByTeammates"] = true,
        ["seeThrough"] = true,
        ["maxPlaced"] = 1,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.STONE,
        ["placeSound"] = function() --[[ Name: placeSound, Line 2278 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["hitSound"] = function() --[[ Name: hitSound, Line 2281 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "flag-kit" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12009
            }
        }
    }
}
u93[v386] = v387
local v388 = u57.PIRATE_FLAG
local v389 = {
    ["displayName"] = "Pirate Flag",
    ["description"] = "Periodically collects nearby dropped items",
    ["image"] = "rbxassetid://10797226392",
    ["block"] = {
        ["health"] = 40,
        ["disableInventoryPickup"] = true,
        ["unbreakableByTeammates"] = true,
        ["seeThrough"] = true,
        ["maxPlaced"] = 1,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.STONE,
        ["placeSound"] = function() --[[ Name: placeSound, Line 2302 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["hitSound"] = function() --[[ Name: hitSound, Line 2305 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "pirate-flag" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12022
            }
        }
    }
}
u93[v388] = v389
local v390 = u57.IRON_ORE_MESH_BLOCK
local v391 = {
    ["displayName"] = "Iron Ore",
    ["footstepSound"] = v46.STONE,
    ["block"] = {
        ["health"] = 100,
        ["disableInventoryPickup"] = true,
        ["unbreakableByTeammates"] = true,
        ["noRegen"] = true,
        ["seeThrough"] = true,
        ["blastResistance"] = 0.25,
        ["breakType"] = v2.STONE,
        ["placeSound"] = function() --[[ Name: placeSound, Line 2325 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["hitSound"] = function() --[[ Name: hitSound, Line 2328 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12021
            }
        }
    }
}
u93[v390] = v391
u93[u57.PIRATE_TELESCOPE] = {
    ["displayName"] = "Pirate Telescope",
    ["description"] = "Grants nearby allies enhanced projectiles",
    ["image"] = "rbxassetid://10797226885"
}
local v392 = u57.CLAY
local v393 = {
    ["displayName"] = "Clay",
    ["footstepSound"] = v46.STONE
}
local v394 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2352 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 82
        }
    }
}
v393.block = v394
u93[v392] = v393
local v395 = u57.CLAY_ORANGE
local v396 = {
    ["displayName"] = "Orange Clay",
    ["footstepSound"] = v46.STONE
}
local v397 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2369 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 1
        },
        {
            ["blockId"] = 251,
            ["blockData"] = 1
        }
    }
}
v396.block = v397
u93[v395] = v396
local v398 = u57.CLAY_DARK_GREEN
local v399 = {
    ["displayName"] = "Dark Green Clay",
    ["footstepSound"] = v46.STONE
}
local v400 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2390 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 13
        },
        {
            ["blockId"] = 18,
            ["blockData"] = 1
        }
    }
}
v399.block = v400
u93[v398] = v399
local v401 = u57.CLAY_LIGHT_GREEN
local v402 = {
    ["displayName"] = "Light Green Clay",
    ["footstepSound"] = v46.STONE
}
local v403 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2411 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 5
        }
    }
}
v402.block = v403
u93[v401] = v402
local v404 = u57.CLAY_RED
local v405 = {
    ["displayName"] = "Red Clay",
    ["footstepSound"] = v46.STONE
}
local v406 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2429 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 14
        },
        {
            ["blockId"] = 251,
            ["blockData"] = 14
        }
    }
}
v405.block = v406
u93[v404] = v405
local v407 = u57.CLAY_PINK
local v408 = {
    ["displayName"] = "Pink Clay",
    ["footstepSound"] = v46.STONE
}
local v409 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2450 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 6
        },
        {
            ["blockId"] = 159,
            ["blockData"] = 2
        },
        {
            ["blockId"] = 251,
            ["blockData"] = 6
        }
    }
}
v408.block = v409
u93[v407] = v408
local v410 = u57.CLAY_BLUE
local v411 = {
    ["displayName"] = "Blue Clay",
    ["footstepSound"] = v46.STONE
}
local v412 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2474 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 251,
            ["blockData"] = 11
        }
    }
}
v411.block = v412
u93[v410] = v411
local v413 = u57.CLAY_PURPLE
local v414 = {
    ["displayName"] = "Purple Clay",
    ["footstepSound"] = v46.STONE
}
local v415 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2492 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 10
        },
        {
            ["blockId"] = 251,
            ["blockData"] = 10
        }
    }
}
v414.block = v415
u93[v413] = v414
local v416 = u57.CLAY_BLACK
local v417 = {
    ["displayName"] = "Black Clay",
    ["footstepSound"] = v46.STONE
}
local v418 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2513 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 15
        },
        {
            ["blockId"] = 35,
            ["blockData"] = 7
        },
        {
            ["blockId"] = 251,
            ["blockData"] = 15
        }
    }
}
v417.block = v418
u93[v416] = v417
local v419 = u57.CLAY_TAN
local v420 = {
    ["displayName"] = "Tan Clay",
    ["footstepSound"] = v46.STONE
}
local v421 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2537 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 172,
            ["blockData"] = 0
        }
    }
}
v420.block = v421
u93[v419] = v420
local v422 = u57.CLAY_LIGHT_BROWN
local v423 = {
    ["displayName"] = "Light Brown Clay",
    ["footstepSound"] = v46.STONE
}
local v424 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2555 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 12
        },
        {
            ["blockId"] = 251,
            ["blockData"] = 12
        }
    }
}
v423.block = v424
u93[v422] = v423
local v425 = u57.CLAY_DARK_BROWN
local v426 = {
    ["displayName"] = "Dark Brown Clay",
    ["footstepSound"] = v46.STONE
}
local v427 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2576 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 7
        },
        {
            ["blockId"] = 35,
            ["blockData"] = 12
        }
    }
}
v426.block = v427
u93[v425] = v426
local v428 = u57.CLAY_YELLOW
local v429 = {
    ["displayName"] = "Yellow Clay",
    ["footstepSound"] = v46.STONE
}
local v430 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2597 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 4
        }
    }
}
v429.block = v430
u93[v428] = v429
local v431 = u57.CLAY_WHITE
local v432 = {
    ["displayName"] = "White Clay",
    ["footstepSound"] = v46.STONE
}
local v433 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2615 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 251,
            ["blockData"] = 0
        },
        {
            ["blockId"] = 159,
            ["blockData"] = 0
        }
    }
}
v432.block = v433
u93[v431] = v432
local v434 = u57.CLAY_GRAY
local v435 = {
    ["displayName"] = "Gray Clay",
    ["footstepSound"] = v46.STONE
}
local v436 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2636 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 9
        }
    }
}
v435.block = v436
u93[v434] = v435
local v437 = u57.CLAY_GREEN
local v438 = {
    ["displayName"] = "Green Clay",
    ["footstepSound"] = v46.STONE
}
local v439 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2654 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 251,
            ["blockData"] = 5
        }
    }
}
v438.block = v439
u93[v437] = v438
local v440 = u57.CONCRETE_GREEN
local v441 = {
    ["displayName"] = "Green Concrete",
    ["footstepSound"] = v46.STONE
}
local v442 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2672 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 251,
            ["blockData"] = 13
        }
    }
}
v441.block = v442
u93[v440] = v441
local v443 = u57.MARBLE
local v444 = {
    ["displayName"] = "Marble",
    ["image"] = "rbxassetid://6594536339",
    ["footstepSound"] = v46.STONE
}
local v445 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2690 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 155,
            ["blockData"] = 0
        }
    },
    ["greedyMesh"] = {
        ["textures"] = {}
    }
}
v444.block = v445
u93[v443] = v444
local v446 = u57.MARBLE_PILLAR
local v447 = {
    ["displayName"] = "Marble Pillar",
    ["footstepSound"] = v46.STONE
}
local v448 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2709 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 155,
            ["blockData"] = 2
        }
    }
}
v447.block = v448
u93[v446] = v447
local v449 = u57.SLATE_BRICK
local v450 = {
    ["displayName"] = "Slate Brick",
    ["footstepSound"] = v46.STONE
}
local v451 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2727 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 159,
            ["blockData"] = 11
        }
    }
}
v450.block = v451
u93[v449] = v450
local v452 = u57.SLATE_TILES
local v453 = {
    ["displayName"] = "Slate Tiles",
    ["footstepSound"] = v46.STONE
}
local v454 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2745 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 168,
            ["blockData"] = 2
        }
    }
}
v453.block = v454
u93[v452] = v453
local v455 = u57.SAND
local v456 = {
    ["displayName"] = "Sand",
    ["footstepSound"] = v46.SAND
}
local v457 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2763 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 12,
            ["blockData"] = 0
        }
    }
}
v456.block = v457
u93[v455] = v456
local v458 = u57.RED_SAND
local v459 = {
    ["displayName"] = "Red Sand",
    ["footstepSound"] = v46.SAND
}
local v460 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 2784 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 12,
            ["blockData"] = 1
        }
    }
}
v459.block = v460
u93[v458] = v459
local v461 = u57.SANDSTONE
local v462 = {
    ["displayName"] = "Sandstone",
    ["footstepSound"] = v46.STONE
}
local v463 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2798 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 24,
            ["blockData"] = 0
        }
    }
}
v462.block = v463
u93[v461] = v462
local v464 = u57.SANDSTONE_POLISHED
local v465 = {
    ["displayName"] = "Sandstone Polished",
    ["footstepSound"] = v46.STONE
}
local v466 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2816 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 98,
            ["blockData"] = 2
        }
    }
}
v465.block = v466
u93[v464] = v465
local v467 = u57.SANDSTONE_SMOOTH
local v468 = {
    ["displayName"] = "Sandstone Smooth",
    ["footstepSound"] = v46.STONE
}
local v469 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2834 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 98,
            ["blockData"] = 3
        }
    }
}
v468.block = v469
u93[v467] = v468
local v470 = u57.RED_SANDSTONE
local v471 = {
    ["displayName"] = "Red Sandstone",
    ["footstepSound"] = v46.STONE
}
local v472 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2852 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 179,
            ["blockData"] = 0
        }
    }
}
v471.block = v472
u93[v470] = v471
local v473 = u57.RED_SANDSTONE_POLISHED
local v474 = {
    ["displayName"] = "Red Sandstone Polished",
    ["footstepSound"] = v46.STONE
}
local v475 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2870 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 168
        }
    }
}
v474.block = v475
u93[v473] = v474
local v476 = u57.RED_SANDSTONE_SMOOTH
local v477 = {
    ["displayName"] = "Red Sandstone Smooth",
    ["footstepSound"] = v46.STONE
}
local v478 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2887 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 168,
            ["blockData"] = 1
        }
    }
}
v477.block = v478
u93[v476] = v477
local v479 = u57.SNOW
local v480 = {
    ["displayName"] = "Snow",
    ["footstepSound"] = v46.SNOW
}
local v481 = {
    ["health"] = 1,
    ["breakType"] = v2.WOOL,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2905 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.SNOW_FOOTSTEP_1, u47.SNOW_FOOTSTEP_2, u47.SNOW_FOOTSTEP_3, u47.SNOW_FOOTSTEP_4)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 78
        },
        {
            ["blockId"] = 80
        }
    }
}
v480.block = v481
u93[v479] = v480
local v482 = u57.ICE
local v483 = {
    ["displayName"] = "Ice",
    ["footstepSound"] = v46.ICE
}
local v484 = {
    ["health"] = 8,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2924 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 79
        },
        {
            ["blockId"] = 174
        },
        {
            ["blockId"] = 212
        }
    }
}
v483.block = v484
u93[v482] = v483
local v485 = u57.TNT
local v486 = {
    ["displayName"] = "TNT",
    ["footstepSound"] = v46.SAND
}
local v487 = {
    ["health"] = 1,
    ["breakType"] = v2.WOOL,
    ["hitSound"] = function() --[[ Name: hitSound, Line 2945 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.WOOL_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    }
}
v486.block = v487
u93[v485] = v486
local v488 = u57.SIEGE_TNT
local v489 = {
    ["displayName"] = "Siege TNT",
    ["sharingDisabled"] = true,
    ["footstepSound"] = v46.SAND
}
local v490 = {
    ["health"] = 1,
    ["breakType"] = v2.WOOL,
    ["hitSound"] = function() --[[ Name: hitSound, Line 2959 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.WOOL_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    }
}
v489.block = v490
u93[v488] = v489
local v491 = u57.BLASTPROOF_CERAMIC
local v492 = {
    ["displayName"] = "Blastproof Ceramic",
    ["footstepSound"] = v46.STONE
}
local v493 = {
    ["health"] = 20,
    ["regenSpeed"] = 0.1,
    ["blastProof"] = true,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2974 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.STONE_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 8014
        }
    }
}
v492.block = v493
u93[v491] = v492
local v494 = u57.SLIME_BLOCK
local v495 = {
    ["displayName"] = "Slime Block",
    ["image"] = "rbxassetid://8273432599",
    ["footstepSound"] = v46.SAND
}
local v496 = {
    ["health"] = 1,
    ["fallDamageMultiplier"] = 0,
    ["breakType"] = v2.WOOL,
    ["placeSound"] = function() --[[ Name: placeSound, Line 2994 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.SLIME_BLOCK_PLACE)
    end,
    ["hitSound"] = function() --[[ Name: hitSound, Line 2997 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.SLIME_BLOCK_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["elasticity"] = {
        ["elasticityPercent"] = 0.7,
        ["bounceSound"] = u47.SLIME_BLOCK_BOUNCE
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 165
        }
    }
}
v495.block = v496
u93[v494] = v495
local v497 = u57.MAGIC_GLASS
local v498 = {
    ["displayName"] = "Magic Glass",
    ["description"] = "Blast Proof. Attacks and projectiles phase through this magic window!",
    ["footstepSound"] = v46.VOID
}
local v499 = {
    ["health"] = 20,
    ["blastProof"] = true,
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 3020 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.MAGIC_GLASS_PLACE_1, u47.MAGIC_GLASS_PLACE_2, u47.MAGIC_GLASS_PLACE_3)
    end,
    ["hitSound"] = function() --[[ Name: hitSound, Line 3023 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.MAGIC_GLASS_HIT_1, u47.MAGIC_GLASS_HIT_2, u47.MAGIC_GLASS_HIT_3, u47.MAGIC_GLASS_HIT_4)
    end,
    ["breakSound"] = function() --[[ Name: breakSound, Line 3026 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.MAGIC_GLASS_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    }
}
v498.block = v499
u93[v497] = v498
local v500 = u57.MELON_SEEDS
local v501 = {
    ["displayName"] = "Melon Seeds",
    ["image"] = "rbxassetid://6956387796",
    ["placesBlock"] = {
        ["blockType"] = u57.MELON
    }
}
u93[v500] = v501
local v502 = u57.MELON
local v503 = {
    ["displayName"] = "Melon",
    ["image"] = "rbxassetid://6915428682"
}
local v504 = {
    ["health"] = 5,
    ["denyPlaceOn"] = true,
    ["seeThrough"] = true,
    ["disableFlamableByTeammates"] = true,
    ["disableInventoryPickup"] = true,
    ["hideDamageTextures"] = true,
    ["flammable"] = true,
    ["flameSpreadStopChance"] = 0.4,
    ["breakType"] = v2.WOOD,
    ["placedBy"] = {
        ["itemType"] = u57.MELON_SEEDS
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 3053 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.CROP_PLANT_1, u47.CROP_PLANT_2, u47.CROP_PLANT_3)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 8015
        }
    }
}
v503.block = v504
u93[v502] = v503
local v505 = u57.CARROT_SEEDS
local v506 = {
    ["displayName"] = "Carrot Seeds",
    ["image"] = "rbxassetid://6956387835",
    ["placesBlock"] = {
        ["blockType"] = u57.CARROT
    }
}
u93[v505] = v506
local v507 = u57.CHICKEN_EGG
local v508 = {
    ["displayName"] = "Egg",
    ["image"] = "rbxassetid://13988247733",
    ["sharingDisabled"] = true,
    ["placesBlock"] = {
        ["blockType"] = u57.CHICKEN_EGG_BLOCK
    }
}
u93[v507] = v508
local v509 = u57.CHICKEN_EGG_BLOCK
local v510 = {
    ["displayName"] = "Egg",
    ["image"] = "rbxassetid://3677675280"
}
local v511 = {
    ["health"] = 1,
    ["denyPlaceOn"] = true,
    ["seeThrough"] = true,
    ["disableFlamableByTeammates"] = true,
    ["disableEnemyInventoryPickup"] = true,
    ["unbreakableByTeammates"] = true,
    ["flammable"] = true,
    ["flameSpreadStopChance"] = 0.4,
    ["breakType"] = v2.WOOD,
    ["placedBy"] = {
        ["itemType"] = u57.CHICKEN_EGG
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 3092 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.CHICKEN_EGG_CRACK)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 8016
        }
    }
}
v510.block = v511
u93[v509] = v510
local v512 = u57.CHICKEN_DEPLOY
local v513 = {
    ["displayName"] = "Chicken",
    ["image"] = "rbxassetid://13988247449",
    ["sharingDisabled"] = true,
    ["enablePersonalChest"] = true
}
local v514 = {
    ["fireDelaySec"] = 0.3,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3110 ]]
        return "deploy_chicken"
    end,
    ["ammoItemTypes"] = { u57.CHICKEN_DEPLOY },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.THROW_CHICKEN,
        ["idleAnimation"] = u7.HOLD_CHICKEN
    }
}
v513.projectileSource = v514
u93[v512] = v513
local v515 = u57.CARROT
local v516 = {
    ["displayName"] = "Carrot",
    ["image"] = "rbxassetid://3677675280"
}
local v517 = {
    ["health"] = 5,
    ["denyPlaceOn"] = true,
    ["seeThrough"] = true,
    ["disableFlamableByTeammates"] = true,
    ["disableInventoryPickup"] = true,
    ["hideDamageTextures"] = true,
    ["flammable"] = true,
    ["flameSpreadStopChance"] = 0.4,
    ["breakType"] = v2.WOOD,
    ["placedBy"] = {
        ["itemType"] = u57.CARROT_SEEDS
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 3137 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.CROP_PLANT_1, u47.CROP_PLANT_2, u47.CROP_PLANT_3)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 8016
        }
    }
}
v516.block = v517
u93[v515] = v516
u93[u57.WATERING_CAN] = {
    ["displayName"] = "Watering Can",
    ["image"] = "rbxassetid://6915423754"
}
u93[u57.HAMMER] = {
    ["displayName"] = "Hammer",
    ["image"] = "rbxassetid://6955848801",
    ["sharingDisabled"] = true,
    ["fortifiesBlock"] = true,
    ["keepOnDeath"] = true
}
u93[u57.APPLE] = {
    ["displayName"] = "Health Apple",
    ["image"] = "rbxassetid://6985765179",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["requiresMissingHealth"] = true
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
u93[u57.BIG_APPLE] = {
    ["displayName"] = "The Big Apple",
    ["image"] = "rbxassetid://75449163962073",
    ["description"] = "You\'ll be full after this",
    ["consumable"] = {
        ["consumeTime"] = 2.75,
        ["requiresMissingHealth"] = true
    },
    ["maxStackSize"] = {
        ["amount"] = 2
    }
}
u93[u57.PIE] = {
    ["displayName"] = "Speed Pie",
    ["image"] = "rbxassetid://6985761399",
    ["consumable"] = {
        ["consumeTime"] = 0.8
    }
}
local v518 = u57.ZIPLINE
local v519 = {
    ["displayName"] = "Zipline Launcher",
    ["image"] = "rbxassetid://7051148904"
}
local v520 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3196 ]]
        return "zipline"
    end,
    ["ammoItemTypes"] = { u57.ZIPLINE },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    }
}
v519.projectileSource = v520
u93[v518] = v519
local v521 = u57.ZIPLINE_BASE
local v522 = {
    ["displayName"] = "Zipline Base",
    ["image"] = "rbxassetid://7051148904",
    ["block"] = {
        ["blastProof"] = true,
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["hitSound"] = function() --[[ Name: hitSound, Line 3215 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8017
            }
        }
    }
}
u93[v521] = v522
u93[u57.GUITAR] = {
    ["displayName"] = "Guitar",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7085044606",
    ["cooldownId"] = v19.MELODY
}
local v523 = u57.CANNON
local v524 = {
    ["displayName"] = "Cannon",
    ["image"] = "rbxassetid://7121221753",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 8,
        ["disableInventoryPickup"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 3238 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "cannon" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8018
            }
        }
    }
}
u93[v523] = v524
local v525 = u57.MANUAL_CANNON
local v526 = {
    ["displayName"] = "Manual Cannon",
    ["description"] = "Shoots a single TNT at a time",
    ["image"] = "rbxassetid://10717427560",
    ["block"] = {
        ["health"] = 50,
        ["unbreakableByTeammates"] = true,
        ["disableInventoryPickup"] = true,
        ["noSuffocation"] = true,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12011
            }
        },
        ["collectionServiceTags"] = { "cannon-type" }
    }
}
u93[v525] = v526
local v527 = u57.AUTO_CANNON
local v528 = {
    ["displayName"] = "Auto Cannon",
    ["description"] = "Automatically fires TNT on an interval",
    ["image"] = "rbxassetid://10717427845",
    ["block"] = {
        ["health"] = 100,
        ["unbreakableByTeammates"] = true,
        ["disableInventoryPickup"] = true,
        ["noSuffocation"] = true,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12012
            }
        },
        ["collectionServiceTags"] = { "cannon-type" }
    }
}
u93[v527] = v528
local v529 = u57.SPREAD_CANNON
local v530 = {
    ["displayName"] = "Spread Cannon",
    ["image"] = "rbxassetid://10717427375",
    ["description"] = "Rapidly fires three TNT at a time",
    ["block"] = {
        ["health"] = 150,
        ["unbreakableByTeammates"] = true,
        ["disableInventoryPickup"] = true,
        ["noSuffocation"] = true,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12013
            }
        },
        ["collectionServiceTags"] = { "cannon-type" }
    }
}
u93[v529] = v530
local v531 = u57.PARTY_CANNON
local v532 = {
    ["displayName"] = "Firework Cannon",
    ["image"] = "rbxassetid://11967427804",
    ["description"] = "Now it\'s really a party.",
    ["block"] = {
        ["health"] = 300,
        ["unbreakableByTeammates"] = true,
        ["disableInventoryPickup"] = true,
        ["noSuffocation"] = true,
        ["denyPlaceOn"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12018
            }
        },
        ["collectionServiceTags"] = { "cannon-type" }
    }
}
u93[v531] = v532
local v533 = u57.BALLISTA
local v534 = {
    ["displayName"] = "Ballista",
    ["image"] = "rbxassetid://17858940835"
}
local v535 = {
    ["seeThrough"] = true,
    ["health"] = 8,
    ["disableInventoryPickup"] = false,
    ["noSuffocation"] = true,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 3323 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_HIT)
    end,
    ["collectionServiceTags"] = { "Ballista" },
    ["projectileSource"] = {
        ["fireDelaySec"] = 1.8,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3331 ]]
            return "ballista_projectile"
        end,
        ["launchSound"] = {
            u47.BALLISTA_FIRE_1,
            u47.BALLISTA_FIRE_2,
            u47.BALLISTA_FIRE_3,
            u47.BALLISTA_FIRE_4
        },
        ["relativeOverride"] = {
            ["relX"] = 0,
            ["relY"] = 0,
            ["relZ"] = 0
        }
    }
}
v534.block = v535
u93[v533] = v534
u93[u57.BALLISTA_AMMO] = {
    ["displayName"] = "Explosive Arrow",
    ["description"] = "Explosive ballista ammunition to smash through enemy defenses",
    ["image"] = "rbxassetid://17858940500",
    ["hotbarFillRight"] = true
}
local v536 = u57.EXCALIBUR
local v537 = {
    ["displayName"] = "Excalibur",
    ["image"] = "",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 8,
        ["disableInventoryPickup"] = true,
        ["noSuffocation"] = true,
        ["unbreakable"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 3356 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "Excalibur" }
    }
}
u93[v536] = v537
u93[u57.BALLOON] = {
    ["displayName"] = "Balloon",
    ["description"] = "Use up to three times to gain slowfall and jump boost.",
    ["image"] = "rbxassetid://7122143895",
    ["balloon"] = true,
    ["cooldownId"] = v19.BALLOON,
    ["maxStackSize"] = {
        ["amount"] = 5,
        ["shouldDropExtras"] = false
    }
}
u93[u57.ANNIVERSARY_BALLOON] = {
    ["displayName"] = "Balloon",
    ["description"] = "Use up to three times to gain slowfall and jump boost.",
    ["balloon"] = true,
    ["image"] = v35.ANNIVERSARY_BALLOON_LOBBY_GADGET,
    ["cooldownId"] = v19.BALLOON,
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
local v538 = u57.LASSO
local v539 = {
    ["displayName"] = "Lasso",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7192710930"
}
local v540 = {
    ["fireDelaySec"] = 8,
    ["maxStrengthChargeSec"] = 0.5,
    ["minStrengthScalar"] = 0.5,
    ["walkSpeedMultiplier"] = 0.25,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3393 ]]
        return "lasso"
    end,
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_LASSO_CHARGE,
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v539.projectileSource = v540
u93[v538] = v539
local v541 = u57.WIZARD_STAFF
local v542 = {
    ["displayName"] = "Wizard Staff I",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://13397121945"
}
local v543 = {}
local v544 = {
    ["fireDelaySec"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3412 ]]
        return "electric_orb"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.WIZARD_BALL_CAST
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["cooldownId"] = v19.WIZARD_STAFF
}
v543.electric_orb = v544
local v545 = {
    ["fireDelaySec"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3425 ]]
        return "lightning_strike"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.WIZARD_LIGHTNING_CAST
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["cooldownId"] = v19.WIZARD_STAFF
}
v543.lightning_strike = v545
v542.multiProjectileSource = v543
u93[v541] = v542
local v546 = u57.WIZARD_STAFF_2
local v547 = {
    ["displayName"] = "Wizard Staff II",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://13397121643"
}
local v548 = {}
local v549 = {
    ["fireDelaySec"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3445 ]]
        return "electric_orb"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.WIZARD_BALL_CAST
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["cooldownId"] = v19.WIZARD_STAFF
}
v548.electric_orb = v549
local v550 = {
    ["fireDelaySec"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3458 ]]
        return "lightning_strike"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.WIZARD_LIGHTNING_CAST
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["cooldownId"] = v19.WIZARD_STAFF
}
v548.lightning_strike = v550
v547.multiProjectileSource = v548
v547.replaces = { u57.WIZARD_STAFF }
u93[v546] = v547
local v551 = u57.WIZARD_STAFF_3
local v552 = {
    ["displayName"] = "Wizard Staff III",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://13397121485"
}
local v553 = {}
local v554 = {
    ["fireDelaySec"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3479 ]]
        return "electric_orb"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.WIZARD_BALL_CAST
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["cooldownId"] = v19.WIZARD_STAFF
}
v553.electric_orb = v554
local v555 = {
    ["fireDelaySec"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3492 ]]
        return "lightning_strike"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.WIZARD_LIGHTNING_CAST
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["cooldownId"] = v19.WIZARD_STAFF
}
v553.lightning_strike = v555
v552.multiProjectileSource = v553
v552.replaces = { u57.WIZARD_STAFF, u57.WIZARD_STAFF_2 }
u93[v551] = v552
u93[u57.TABLET] = {
    ["displayName"] = "Tablet",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7290617886"
}
local v556 = u57.CAMERA_TURRET
local v557 = {
    ["displayName"] = "Camera Turret",
    ["image"] = "rbxassetid://7290567966",
    ["sharingDisabled"] = true
}
local v558 = {
    ["seeThrough"] = true,
    ["health"] = 50,
    ["disableInventoryPickup"] = true,
    ["unbreakableByTeammates"] = true,
    ["blastResistance"] = 2.915,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 3518 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_HIT)
    end,
    ["collectionServiceTags"] = { "Turret", v18.VULCAN_TURRET },
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.2,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3528 ]]
            return "turretBullet"
        end,
        ["launchSound"] = { u47.TURRET_SHOOT },
        ["relativeOverride"] = {
            ["relX"] = 0,
            ["relY"] = 0,
            ["relZ"] = 0
        }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 8019
        }
    }
}
v557.block = v558
u93[v556] = v557
u93[u57.FLAMETHROWER] = {
    ["displayName"] = "Flamethrower",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7343272403",
    ["cooldownId"] = v19.FLAMETHROWER_USE
}
u93[u57.EMBER] = {
    ["displayName"] = "Ember",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7343272545",
    ["keepOnDeath"] = true
}
u93[u57.FROST_CRYSTAL] = {
    ["displayName"] = "Frost Crystal",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://11847445215"
}
u93[u57.RAVEN] = {
    ["displayName"] = "Raven",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7343272003"
}
u93[u57.BEE_NET] = {
    ["displayName"] = "Bee Net",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7343519004"
}
u93[u57.BEE] = {
    ["displayName"] = "Bee",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7343272839"
}
local v559 = u57.BEEHIVE
local v560 = {
    ["displayName"] = "Beehive",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7343272692",
    ["block"] = {
        ["unbreakableByTeammates"] = true,
        ["disableEnemyInventoryPickup"] = true,
        ["seeThrough"] = true,
        ["health"] = 25,
        ["maxPlaced"] = 5,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 3582 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "beehive" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8020
            }
        }
    }
}
u93[v559] = v560
local v561 = u57.BREWING_CAULDRON
local v562 = {
    ["displayName"] = "Brewing Cauldron",
    ["image"] = "rbxassetid://9134530108",
    ["sharingDisabled"] = true,
    ["block"] = {
        ["unbreakableByTeammates"] = true,
        ["seeThrough"] = true,
        ["health"] = 25,
        ["disableInventoryPickup"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 3601 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "brewing_cauldron" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8021
            }
        }
    },
    ["crafting"] = {
        ["recipes"] = {
            v44(u57.SLEEP_SPLASH_POTION),
            v44(u57.BIG_SHIELD),
            v44(u57.POISON_SPLASH_POTION),
            v44(u57.HEAL_SPLASH_POTION)
        }
    }
}
u93[v561] = v562
u93[u57.ALCHEMIST_FLASK] = {
    ["displayName"] = "Alchemist Flask",
    ["sharingDisabled"] = true,
    ["image"] = v35.ALCHEMIST_FLASK,
    ["maxStackSize"] = {
        ["amount"] = 16
    }
}
u93[u57.JADE_HAMMER] = {
    ["displayName"] = "Jade Hammer",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7343272236",
    ["firstPerson"] = {
        ["verticalOffset"] = -1.2
    }
}
local v563 = u57.WARRIOR_HELMET
local v564 = {
    ["displayName"] = "Warrior Helmet",
    ["image"] = "rbxassetid://7343992908",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.24,
        ["slot"] = v36.HELMET
    }
}
u93[v563] = v564
local v565 = u57.WARRIOR_CHESTPLATE
local v566 = {
    ["displayName"] = "Warrior Chestplate",
    ["image"] = "rbxassetid://7343992770",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.36,
        ["slot"] = v36.CHESTPLATE
    }
}
u93[v565] = v566
local v567 = u57.WARRIOR_BOOTS
local v568 = {
    ["displayName"] = "Warrior Boots",
    ["image"] = "rbxassetid://7343993019",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.2,
        ["slot"] = v36.BOOTS
    }
}
u93[v567] = v568
local v569 = u57.BAGUETTE
local v570 = {
    ["displayName"] = "Knockback Baguette",
    ["image"] = "rbxassetid://7392211056",
    ["sword"] = {
        ["damage"] = 1,
        ["attackSpeed"] = 0.4,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5,
            ["vertical"] = 1.2
        },
        ["swingSounds"] = { u47.BAGUETTE_SWING }
    },
    ["firstPerson"] = {
        ["scale"] = 0.8
    }
}
u93[v569] = v570
local v571 = u57.SPIRIT
local v572 = {
    ["displayName"] = "Spirit",
    ["image"] = "rbxassetid://7498308261",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 8
    },
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.6,
        ["maxStrengthChargeSec"] = 1.5,
        ["minStrengthScalar"] = 0.2,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3682 ]]
            return "deploy_spirit"
        end,
        ["ammoItemTypes"] = { u57.SPIRIT },
        ["launchSound"] = { u47.TELEPEARL_THROW }
    }
}
u93[v571] = v572
local v573 = u57.TESLA_TRAP
local v574 = {
    ["displayName"] = "Tesla Coil Trap",
    ["image"] = "rbxassetid://7498163110",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 18,
        ["disableInventoryPickup"] = true,
        ["maxPlaced"] = 1,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 3697 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "tesla-trap" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8022
            }
        }
    }
}
u93[v573] = v574
u93[u57.CHARGE_SHIELD] = {
    ["displayName"] = "Charge Shield",
    ["image"] = "rbxassetid://7745351893",
    ["firstPerson"] = {
        ["scale"] = 0.8
    },
    ["cooldownId"] = v19.CHARGE_SHIELD
}
local v575 = u57.ROCKET_LAUNCHER
local v576 = {
    ["displayName"] = "Rocket Launcher",
    ["image"] = "rbxassetid://7680994780",
    ["projectileSource"] = {
        ["fireDelaySec"] = 2.2,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["activeReload"] = true,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3722 ]]
            return "rocket_launcher_missile"
        end,
        ["ammoItemTypes"] = { u57.ROCKET_LAUNCHER_MISSILE },
        ["launchSound"] = { u47.ROCKET_LAUNCHER_FIRE }
    }
}
u93[v575] = v576
u93[u57.ROCKET_LAUNCHER_MISSILE] = {
    ["displayName"] = "Rocket",
    ["image"] = "rbxassetid://7682148316",
    ["hotbarFillRight"] = true
}
local v577 = u57.GRENADE_LAUNCHER
local v578 = {
    ["displayName"] = "Rocket Launcher",
    ["image"] = "rbxassetid://10086864148"
}
local v579 = {
    ["fireDelaySec"] = 2.2,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["activeReload"] = true,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3742 ]]
        return "stun_grenade"
    end,
    ["ammoItemTypes"] = { u57.STUN_GRENADE },
    ["launchSound"] = { u47.CARROT_LAUNCHER_FIRE },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.ROCKET_LAUNCHER_SHOT,
        ["aimAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    }
}
v578.projectileSource = v579
u93[v577] = v578
u93[u57.STUN_GRENADE] = {
    ["displayName"] = "Stun Grenade",
    ["image"] = "rbxassetid://10086863810",
    ["hotbarFillRight"] = true
}
local v580 = u57.TORNADO_LAUNCHER
local v581 = {
    ["displayName"] = "Tornado Launcher",
    ["description"] = "Launch a mini tornado that deals damage & launches up any players caught in its path.",
    ["image"] = "rbxassetid://9193792144"
}
local v582 = {
    ["fireDelaySec"] = 3,
    ["activeReload"] = true,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3767 ]]
        return "tornado_missile"
    end,
    ["launchSound"] = { u47.TORNADO_LAUNCHER_SHOOT },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.TORNADO_LAUNCHER_SHOOT,
        ["aimAnimation"] = u7.TORNADO_LAUNCHER_HOLD
    },
    ["launchScreenShake"] = {
        ["config"] = {
            ["magnitude"] = 0.07,
            ["duration"] = 0.15,
            ["cycles"] = 2
        }
    }
}
v581.projectileSource = v582
v581.thirdPerson = {}
u93[v580] = v581
local v583 = u57.DRAGON_BREATH
local v584 = {
    ["displayName"] = "Dragon Breath",
    ["description"] = "Source of the void energy",
    ["projectileSource"] = {
        ["fireDelaySec"] = 3,
        ["activeReload"] = true,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3791 ]]
            return "dragon_breath"
        end,
        ["launchSound"] = { u47.TORNADO_LAUNCHER_SHOOT }
    }
}
u93[v583] = v584
local v585 = u57.PORTAL_GUN
local v586 = {
    ["displayName"] = "Portal Gun",
    ["description"] = "Create portal rifts that can be linked and traveled between.",
    ["image"] = "rbxassetid://9378655884"
}
local v587 = {
    ["fireDelaySec"] = 3,
    ["activeReload"] = true,
    ["projectileType"] = function() --[[ Name: projectileType, Line 3804 ]]
        return "portal_projectile"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.TORNADO_LAUNCHER_SHOOT,
        ["aimAnimation"] = u7.TORNADO_LAUNCHER_HOLD
    }
}
v586.projectileSource = v587
u93[v585] = v586
local v588 = u57.IMPULSE_GRENADE
local v589 = {
    ["displayName"] = "Impulse Grenade",
    ["description"] = "Delayed explosive grenade that deals little damage but massive knockback.",
    ["image"] = "rbxassetid://7681106844",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 1,
        ["minStrengthScalar"] = 0.3333333333333333,
        ["walkSpeedMultiplier"] = 0.4,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3820 ]]
            return "impulse_grenade"
        end,
        ["ammoItemTypes"] = { u57.IMPULSE_GRENADE },
        ["launchSound"] = { u47.NEW_BOW_FIRE },
        ["firstPerson"] = {}
    }
}
u93[v588] = v589
local v590 = u57.SMOKE_GRENADE
local v591 = {
    ["displayName"] = "Smoke Grenade",
    ["description"] = "Creates a blast of smoke where it lands.",
    ["image"] = "rbxassetid://7681033200",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 1,
        ["minStrengthScalar"] = 0.3333333333333333,
        ["walkSpeedMultiplier"] = 0.4,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3837 ]]
            return "smoke_grenade"
        end,
        ["ammoItemTypes"] = { u57.SMOKE_GRENADE },
        ["launchSound"] = { u47.NEW_BOW_FIRE },
        ["firstPerson"] = {}
    }
}
u93[v590] = v591
local v592 = u57.HOT_POTATO
local v593 = {
    ["displayName"] = "Hot Potato",
    ["description"] = "Harmful potato that damages the player carrying it. Explodes when the holder dies.",
    ["image"] = "rbxassetid://11465631173",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
local v594 = {
    ["damage"] = 0,
    ["attackSpeed"] = 0.75,
    ["knockbackMultiplier"] = {
        ["horizontal"] = 2,
        ["vertical"] = 1
    },
    ["chargedAttack"] = {
        ["minChargeTimeSec"] = 0.5,
        ["maxChargeTimeSec"] = 1,
        ["walkSpeedModifier"] = {
            ["multiplier"] = 0.95,
            ["delay"] = 0.25
        },
        ["chargedSwingAnimations"] = { u7.HEAVENLY_SWORD_SWING },
        ["firstPersonChargedSwingAnimations"] = { u7.FP_HEAVENLY_SWORD_SWING }
    }
}
v593.sword = v594
local v596 = {
    ["fireDelaySec"] = 1,
    ["maxStrengthChargeSec"] = 1,
    ["minStrengthScalar"] = 0.3333333333333333,
    ["walkSpeedMultiplier"] = 0.6,
    ["projectileType"] = function(p595) --[[ Name: projectileType, Line 3877 ]]
        return p595 and "hot_potato" or "hot_potato"
    end,
    ["ammoItemTypes"] = { u57.HOT_POTATO },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.GRENADE_THROW
    }
}
v593.projectileSource = v596
v593.firstPerson = {
    ["scale"] = 0.8
}
u93[v592] = v593
local v597 = u57.SLEEP_SPLASH_POTION
local v598 = {
    ["displayName"] = "Sleep Splash Potion",
    ["description"] = "Places players hit by the potion in a sleep state until the effect wears off.",
    ["image"] = "rbxassetid://9134319146",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 1,
        ["minStrengthScalar"] = 0.3333333333333333,
        ["walkSpeedMultiplier"] = 0.7,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3902 ]]
            return "sleep_splash_potion"
        end,
        ["ammoItemTypes"] = { u57.SLEEP_SPLASH_POTION },
        ["launchSound"] = { u47.NEW_BOW_FIRE },
        ["firstPerson"] = {}
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
u93[v597] = v598
local v599 = u57.POISON_SPLASH_POTION
local v600 = {
    ["displayName"] = "Poison Splash Potion",
    ["description"] = "Splash potion that deals damage over time to enemies in the splash area.",
    ["image"] = "rbxassetid://9135917252",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 1,
        ["minStrengthScalar"] = 0.3333333333333333,
        ["walkSpeedMultiplier"] = 0.7,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3922 ]]
            return "poison_splash_potion"
        end,
        ["ammoItemTypes"] = { u57.POISON_SPLASH_POTION },
        ["launchSound"] = { u47.NEW_BOW_FIRE },
        ["firstPerson"] = {}
    },
    ["maxStackSize"] = {
        ["amount"] = 2
    }
}
u93[v599] = v600
local v601 = u57.HEAL_SPLASH_POTION
local v602 = {
    ["displayName"] = "Heal Splash Potion",
    ["description"] = "Splash potion that heals anyone inside the splash area.",
    ["image"] = "rbxassetid://9135912233",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 1,
        ["minStrengthScalar"] = 0.3333333333333333,
        ["walkSpeedMultiplier"] = 0.7,
        ["projectileType"] = function() --[[ Name: projectileType, Line 3942 ]]
            return "heal_splash_potion"
        end,
        ["ammoItemTypes"] = { u57.HEAL_SPLASH_POTION },
        ["launchSound"] = { u47.NEW_BOW_FIRE },
        ["firstPerson"] = {}
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
u93[v601] = v602
local v603 = u57.KNOCKBACK_FISH
local v604 = {
    ["displayName"] = "Knockback Fish",
    ["description"] = "Deals massive knockback but minimal damage.",
    ["image"] = "rbxassetid://7976208326",
    ["sword"] = {
        ["damage"] = 1,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2
        },
        ["swingSounds"] = { u47.BAGUETTE_SWING }
    },
    ["firstPerson"] = {
        ["scale"] = 0.8
    }
}
u93[v603] = v604
local v605 = u57.INVISIBILITY_POTION
local v606 = {
    ["displayName"] = "Invisiblity Potion",
    ["description"] = "Drink to gain the effects of invisibility.",
    ["image"] = "rbxassetid://7836794914"
}
local v607 = {
    ["consumeTime"] = 0.8,
    ["potion"] = true,
    ["statusEffect"] = {
        ["duration"] = 30,
        ["statusEffectType"] = v48.INVISIBILITY
    }
}
v606.consumable = v607
v606.crafting = {
    ["recipe"] = v45[u57.INVISIBILITY_POTION]
}
v606.maxStackSize = {
    ["amount"] = 2
}
u93[v605] = v606
local v608 = u57.SERPENTS_TOUCH_POTION
local v609 = {
    ["displayName"] = "Serpent\'s Touch",
    ["image"] = "rbxassetid://99777727368131"
}
local v610 = v10.SERPENTS_TOUCH_POTION_DURATION
v609.description = "A deadly toxin that inflicts lingering pain on those struck by the user\226\128\153s weapon. (" .. tostring(v610) .. " seconds)"
local v611 = {
    ["consumeTime"] = 0.8,
    ["potion"] = true,
    ["statusEffect"] = {
        ["statusEffectType"] = v48.SERPENTS_TOUCH_POTION,
        ["duration"] = v10.SERPENTS_TOUCH_POTION_DURATION
    }
}
v609.consumable = v611
v609.maxStackSize = {
    ["amount"] = 3
}
u93[v608] = v609
local v612 = u57.FURY_POTION
local v613 = {
    ["displayName"] = "Fury Potion",
    ["image"] = "rbxassetid://122851344376912"
}
local v614 = v50.roundToDecimalPlaces(v10.FURY_POTION_ATTACK_SPEED_MULTIPLIER - 1, 1) * 100
local v615 = tostring(v614)
local v616 = v10.FURY_POTION_DURATION
v613.description = "A potent mixture that fills the user with uncontrollable rage and power.  Increases attack speed by " .. v615 .. " % for (" .. tostring(v616) .. " seconds)"
local v617 = {
    ["consumeTime"] = 0.8,
    ["potion"] = true,
    ["statusEffect"] = {
        ["statusEffectType"] = v48.FURY_POTION,
        ["duration"] = v10.FURY_POTION_DURATION
    }
}
v613.consumable = v617
v613.maxStackSize = {
    ["amount"] = 3
}
u93[v612] = v613
local v618 = u57.LARGE_ROCK
local v619 = {
    ["displayName"] = "Large Rock (Very)",
    ["image"] = "rbxassetid://7681398025",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4034 ]]
            return "large_rock"
        end,
        ["ammoItemTypes"] = { u57.LARGE_ROCK },
        ["launchSound"] = { u47.NEW_BOW_FIRE }
    }
}
u93[v618] = v619
local v620 = u57.THROWABLE_BRIDGE
local v621 = {
    ["displayName"] = "Portable Bridge",
    ["image"] = "rbxassetid://10866146253",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.15,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4046 ]]
            return "throwable_bridge"
        end,
        ["ammoItemTypes"] = { u57.THROWABLE_BRIDGE }
    }
}
u93[v620] = v621
local v622 = u57.LUCKY_BLOCK
local v623 = {
    ["displayName"] = "Lucky Block"
}
local v624 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 4059 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.LUCKY_BLOCK_BREAK)
    end,
    ["collectionServiceTags"] = { "LuckyBlock" },
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 1
            }
        }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 9000
        }
    }
}
v623.block = v624
u93[v622] = v623
local v625 = u57.PURPLE_LUCKY_BLOCK
local v626 = {
    ["displayName"] = "Purple Lucky Block"
}
local v627 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 30,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 4083 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.LUCKY_BLOCK_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 4
            }
        },
        ["allowedRarity"] = { v42.RARE, v42.EPIC, v42.LEGENDARY },
        ["allowedPolarity"] = { v41.POSITIVE, v41.NEUTRAL }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 9001
        }
    }
}
v626.block = v627
u93[v625] = v626
local v628 = u57.LUCKY_BLOCK_TRAP
local v629 = {
    ["displayName"] = "Lucky Block Trap"
}
local v630 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 4108 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_HIT)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 9002
        }
    }
}
v629.block = v630
u93[v628] = v629
local v631 = u57.VACUUM
local v632 = {
    ["displayName"] = "Vacuum",
    ["description"] = "Used to capture a ghost. If a ghost is already caught, you can fire the ghost to deal damage.",
    ["image"] = "rbxassetid://7813758517",
    ["sharingDisabled"] = true
}
local v633 = {
    ["fireDelaySec"] = 0.8,
    ["projectileType"] = function() --[[ Name: projectileType, Line 4128 ]]
        return "ghost"
    end,
    ["launchSound"] = { u47.GHOST_VACUUM_SHOOT },
    ["cooldownBar"] = {
        ["colorGradient"] = ColorSequence.new(Color3.fromRGB(235, 95, 180))
    },
    ["cooldownId"] = v19.VACUUM_LAUNCH_GHOST
}
v632.projectileSource = v633
u93[v631] = v632
local v634 = u57.SWAP_BALL
local v635 = {
    ["displayName"] = "Swap Ball",
    ["description"] = "Hit players with the ball to swap positions with them.",
    ["image"] = "rbxassetid://7681107021"
}
local v636 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 4144 ]]
        return "swap_ball"
    end,
    ["ammoItemTypes"] = { u57.SWAP_BALL },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v635.projectileSource = v636
u93[v634] = v635
local v637 = u57.BANANA_PEEL
local v638 = {
    ["displayName"] = "Banana Peel",
    ["description"] = "Opponents that walk over the peel will ragdoll.",
    ["image"] = "rbxassetid://7681234378",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4162 ]]
            return "banana_peel"
        end,
        ["ammoItemTypes"] = { u57.BANANA_PEEL },
        ["launchSound"] = { u47.SWORD_SWING_1 }
    }
}
u93[v637] = v638
local v639 = u57.JUMP_BOOTS
local v640 = {
    ["displayName"] = "Jump Boots",
    ["image"] = "rbxassetid://7911163797",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.08,
        ["slot"] = v36.BOOTS
    }
}
u93[v639] = v640
local v641 = u57.SPEED_BOOTS
local v642 = {
    ["displayName"] = "Speed Boots",
    ["image"] = "rbxassetid://7911163144",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.08,
        ["slot"] = v36.BOOTS
    }
}
u93[v641] = v642
u93[u57.SHIELD_AXOLOTL] = {
    ["displayName"] = "Shield Axolotl",
    ["image"] = "rbxassetid://7863780357"
}
u93[u57.DAMAGE_AXOLOTL] = {
    ["displayName"] = "Damage Axolotl",
    ["image"] = "rbxassetid://7863780231"
}
u93[u57.BREAK_SPEED_AXOLOTL] = {
    ["displayName"] = "Break Speed Axolotl",
    ["image"] = "rbxassetid://7863779927"
}
u93[u57.HEALTH_REGEN_AXOLOTL] = {
    ["displayName"] = "Health Regen Axolotl",
    ["image"] = "rbxassetid://7863780097"
}
local v643 = u57.SNAP_TRAP
local v644 = {
    ["displayName"] = "Snap Trap",
    ["image"] = "rbxassetid://7805515071",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 18,
        ["disableEnemyInventoryPickup"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 4209 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "snap_trap" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8001
            }
        }
    }
}
u93[v643] = v644
local v645 = u57.TELEPORT_BLOCK
local v646 = {
    ["displayName"] = "Teleport Block",
    ["image"] = "rbxassetid://9369048721",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 8,
        ["breakType"] = v2.STONE,
        ["placeSound"] = function() --[[ Name: placeSound, Line 4226 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "teleport_block" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8002
            }
        }
    }
}
u93[v645] = v646
u93[u57.JUMP_POTION] = {
    ["displayName"] = "Jump Potion",
    ["image"] = "rbxassetid://7836794681",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["potion"] = true
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
local v647 = u57.SPEED_POTION
local v648 = {
    ["displayName"] = "Speed Potion",
    ["image"] = "rbxassetid://7836794566",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["potion"] = true
    },
    ["crafting"] = {
        ["recipe"] = v45[u57.SPEED_POTION]
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
u93[v647] = v648
local v649 = u57.FISHING_ROD
local v650 = {
    ["displayName"] = "Fishing Rod",
    ["image"] = "rbxassetid://7807308581",
    ["sharingDisabled"] = true,
    ["projectileSource"] = {
        ["fireDelaySec"] = 0,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4271 ]]
            return "fisherman_bobber"
        end,
        ["launchSound"] = { u47.FISHING_ROD_CAST }
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -1
    }
}
u93[v649] = v650
u93[u57.MINI_SHIELD] = {
    ["displayName"] = "Mini Shield",
    ["image"] = "rbxassetid://7863380185",
    ["consumable"] = {
        ["consumeTime"] = 0.8
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
u93[u57.BIG_SHIELD] = {
    ["displayName"] = "Big Shield",
    ["image"] = "rbxassetid://7863380423",
    ["consumable"] = {
        ["consumeTime"] = 1.8
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
local v651 = u57.SPEAR
local v652 = {
    ["displayName"] = "Spear",
    ["image"] = "rbxassetid://7808151805",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 10
    },
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.7,
        ["maxStrengthChargeSec"] = 0.25,
        ["walkSpeedMultiplier"] = 0.2,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4310 ]]
            return "spear"
        end,
        ["ammoItemTypes"] = { u57.SPEAR }
    }
}
u93[v651] = v652
local v653 = {
    ["displayName"] = "Feather",
    ["image"] = "rbxassetid://127232846136294",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 30,
        ["attackSpeed"] = 0.4,
        ["attackRange"] = 24,
        ["swingAnimations"] = {}
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[u57.WHISPER_FEATHER] = v653
local v654 = {
    ["displayName"] = "Guitar",
    ["image"] = "rbxassetid://7085044606",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 40,
        ["attackSpeed"] = 0.9,
        ["attackRange"] = 21,
        ["applyCooldownOnMiss"] = true,
        ["respectAttackSpeedForEffects"] = true,
        ["swingAnimations"] = {}
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[u57.SUPER_GUITAR] = v654
local v655 = u57.OIL_CONSUMABLE
local v656 = {
    ["displayName"] = "Oil Blob",
    ["image"] = "rbxassetid://7808151981",
    ["sharingDisabled"] = true,
    ["projectileSource"] = {
        ["fireDelaySec"] = 1.5,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.25,
        ["walkSpeedMultiplier"] = 0.5,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4357 ]]
            return "oil_projectile"
        end,
        ["ammoItemTypes"] = { u57.OIL_CONSUMABLE }
    }
}
u93[v655] = v656
u93[u57.STOPWATCH] = {
    ["displayName"] = "Stopwatch",
    ["image"] = "rbxassetid://7871761250",
    ["consumable"] = {
        ["soundOverride"] = "None",
        ["disableAnimation"] = true,
        ["consumeTime"] = 1.5
    },
    ["cooldownId"] = v19.STOPWATCH
}
local v657 = u57.GIANT_POTION
local v658 = {
    ["displayName"] = "Giant Potion",
    ["image"] = "rbxassetid://7911163626",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["potion"] = true
    },
    ["crafting"] = {
        ["recipe"] = v45[u57.GIANT_POTION]
    }
}
u93[v657] = v658
local v659 = u57.SHRINK_POTION
local v660 = {
    ["displayName"] = "Shrink Potion",
    ["image"] = "rbxassetid://7911163448",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["potion"] = true
    },
    ["crafting"] = {
        ["recipe"] = v45[u57.SHRINK_POTION]
    }
}
u93[v659] = v660
local v661 = u57.SNOWBALL
local v662 = {
    ["displayName"] = "Snowball",
    ["image"] = "rbxassetid://7911163294",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.22,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4413 ]]
            return "snowball"
        end,
        ["ammoItemTypes"] = { u57.SNOWBALL },
        ["launchSound"] = { u47.SNOWBALL_THROW }
    },
    ["maxStackSize"] = {
        ["amount"] = 80
    }
}
u93[v661] = v662
local v663 = {
    ["displayName"] = "Baseball Bat",
    ["sword"] = {
        ["damage"] = 100,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["attackSpeed"] = 6,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 5
        },
        ["swingSounds"] = {}
    }
}
u93[u57.BASEBALL_BAT] = v663
local v664 = u57.FAKE_BED
local v665 = {
    ["displayName"] = "Fake Bed",
    ["image"] = "rbxassetid://7911164143",
    ["block"] = {
        ["blastProof"] = true,
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 18,
        ["breakType"] = v2.WOOD,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8023
            }
        }
    }
}
u93[v664] = v665
local v666 = u57.TASER
local v667 = {
    ["displayName"] = "Taser",
    ["image"] = "rbxassetid://7911162966",
    ["sword"] = {
        ["damage"] = 1,
        ["attackSpeed"] = 6,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0,
            ["vertical"] = 0
        },
        ["swingSounds"] = {},
        ["swingAnimations"] = { u7.PUNCH }
    }
}
u93[v666] = v667
local v668 = u57.BIG_WOOD_SWORD
local v669 = {
    ["displayName"] = "Big Wood Sword",
    ["image"] = "rbxassetid://6875480974",
    ["sword"] = {
        ["damage"] = 20,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
        ["knockbackMultiplier"] = {
            ["vertical"] = 2
        }
    },
    ["firstPerson"] = {}
}
u93[v668] = v669
local v670 = u57.BLACKHOLE_BOMB
local v671 = {
    ["displayName"] = "Blackhole",
    ["image"] = "rbxassetid://7976208473",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4483 ]]
            return "blackhole_bomb"
        end,
        ["ammoItemTypes"] = { u57.BLACKHOLE_BOMB },
        ["launchSound"] = { u47.SWORD_SWING_1 }
    }
}
u93[v670] = v671
local v672 = u57.POPUP_CUBE
local v673 = {
    ["image"] = "rbxassetid://7976208116",
    ["displayName"] = "Popup Tower",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4497 ]]
            return "popup_cube"
        end,
        ["ammoItemTypes"] = { u57.POPUP_CUBE },
        ["launchSound"] = { u47.SWORD_SWING_1 }
    }
}
u93[v672] = v673
local v674 = u57.ROBBERY_BALL
local v675 = {
    ["displayName"] = "Robbery Ball",
    ["image"] = "rbxassetid://7977038485"
}
local v676 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 4511 ]]
        return "robbery_ball"
    end,
    ["ammoItemTypes"] = { u57.ROBBERY_BALL },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v675.projectileSource = v676
u93[v674] = v675
local v677 = u57.GUIDED_MISSILE
local v678 = {
    ["displayName"] = "Guided Missile",
    ["image"] = "rbxassetid://8042313266",
    ["guidedProjectileSource"] = {
        ["guidedProjectile"] = "guided_missile",
        ["consumeItem"] = u57.GUIDED_MISSILE
    },
    ["firstPerson"] = {
        ["scale"] = 0.7
    }
}
u93[v677] = v678
local v679 = u57.CHEST
local v680 = {
    ["displayName"] = "Chest",
    ["image"] = "rbxassetid://8562772907",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 30,
        ["seeThrough"] = true,
        ["breakType"] = v2.WOOD,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 54
            },
            {
                ["blockId"] = 146
            }
        },
        ["collectionServiceTags"] = { "chest" }
    }
}
u93[v679] = v680
local v681 = u57.PERSONAL_CHEST
local v682 = {
    ["displayName"] = "Personal Chest",
    ["image"] = "rbxassetid://8164577594",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 30,
        ["seeThrough"] = true,
        ["breakType"] = v2.WOOD,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 130
            }
        },
        ["collectionServiceTags"] = { "chest", "personal-chest" }
    }
}
u93[v681] = v682
local v683 = u57.OG_PERSONAL_CHEST
local v684 = {
    ["displayName"] = "Personal Chest",
    ["image"] = "rbxassetid://8164577594",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 30,
        ["seeThrough"] = true,
        ["breakType"] = v2.WOOD,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 130
            }
        },
        ["collectionServiceTags"] = { "chest", "personal-chest" }
    }
}
u93[v683] = v684
local v685 = u57.LUCKY_BLOCK_ITEM_SMELTER
local v686 = {
    ["displayName"] = "Smelter",
    ["image"] = "rbxassetid://8562772907",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 30,
        ["seeThrough"] = true,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "chest" }
    }
}
u93[v685] = v686
local v687 = u57.SQUAD_LAUNCHER
local v688 = {
    ["displayName"] = "Squad Launcher",
    ["image"] = "",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 30,
        ["seeThrough"] = true,
        ["noSuffocation"] = true,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "squad-launcher" }
    }
}
u93[v687] = v688
u93[u57.HANG_GLIDER] = {
    ["displayName"] = "Hang Glider",
    ["image"] = "rbxassetid://8216181054",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["firstPerson"] = {
        ["scale"] = 0.7
    }
}
local v689 = u57.ENCHANT_TABLE_GLITCHED
local v690 = {
    ["displayName"] = "Glitched Enchant Table",
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "enchant-table" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8004,
                ["blockData"] = 2
            }
        }
    }
}
u93[v689] = v690
local v691 = u57.ENCHANT_TABLE
local v692 = {
    ["displayName"] = "Enchant Table",
    ["image"] = v35.ENCHANTING_TABLE,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "enchant-table" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8004
            }
        }
    }
}
u93[v691] = v692
local v693 = u57.SNAKE_FOUNTAIN
local v694 = {
    ["displayName"] = "Snake Shrine",
    ["block"] = {
        ["isImportantBlock"] = true,
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "SnakeShrine" }
    }
}
u93[v693] = v694
local v695 = u57.BROKEN_ENCHANT_TABLE
local v696 = {
    ["displayName"] = "Broken Enchant Table",
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "broken-enchant-table" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8004,
                ["blockData"] = 1
            }
        }
    }
}
u93[v695] = v696
local v697 = u57.GUMDROP_BOUNCE_PAD
local v698 = {
    ["displayName"] = "Gumdrop Bounce Pad",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://8270466544",
    ["block"] = {
        ["health"] = 2,
        ["seeThrough"] = true,
        ["disableEnemyInventoryPickup"] = true,
        ["breakType"] = v2.WOOL,
        ["collectionServiceTags"] = { "launch-pad" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8005
            }
        }
    }
}
u93[v697] = v698
local v699 = u57.JUMP_PAD
local v700 = {
    ["displayName"] = "Jump Pad",
    ["image"] = "rbxassetid://9414655737",
    ["block"] = {
        ["health"] = 2,
        ["seeThrough"] = true,
        ["disableEnemyInventoryPickup"] = true,
        ["breakType"] = v2.WOOL,
        ["collectionServiceTags"] = { "launch-pad" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 100005
            }
        }
    }
}
u93[v699] = v700
local v701 = u57.SANTA_BOMB
local v702 = {
    ["displayName"] = "Santa Strafe",
    ["description"] = "Throw to mark a location to drop 3 TNT bombs.",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://8273495195",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.2,
        ["maxStrengthChargeSec"] = 1,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["walkSpeedMultiplier"] = 0.4,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4699 ]]
            return "santa_bomb"
        end,
        ["ammoItemTypes"] = { u57.SANTA_BOMB },
        ["launchSound"] = { u47.TELEPEARL_THROW }
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
u93[v701] = v702
local v703 = u57.SANTA_BOMB_SIEGE
local v704 = {
    ["displayName"] = "Santa Siege",
    ["description"] = "Throw to mark a location to drop a Siege TNT bomb.",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://8273495195",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.2,
        ["maxStrengthChargeSec"] = 1,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["walkSpeedMultiplier"] = 0.4,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4719 ]]
            return "santa_bomb_siege"
        end,
        ["ammoItemTypes"] = { u57.SANTA_BOMB_SIEGE },
        ["launchSound"] = { u47.TELEPEARL_THROW }
    },
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[v703] = v704
local v705 = u57.FROSTED_SNOWBALL
local v706 = {
    ["displayName"] = "Frosted Snowball",
    ["image"] = "rbxassetid://7911163294",
    ["sharingDisabled"] = true,
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.3,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4740 ]]
            return "frosted_snowball"
        end,
        ["ammoItemTypes"] = { u57.FROSTED_SNOWBALL },
        ["launchSound"] = { u47.SNOWBALL_THROW }
    }
}
u93[v705] = v706
u93[u57.VOID_AXE] = {
    ["displayName"] = "Void Axe",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://8322058718",
    ["firstPerson"] = {
        ["verticalOffset"] = -1.2
    }
}
local v707 = u57.GOLDEN_BOW
local v709 = {
    ["displayName"] = "Golden Bow",
    ["image"] = "rbxassetid://8479270340",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.3,
        ["maxStrengthChargeSec"] = 0.5,
        ["minStrengthScalar"] = 0.25,
        ["walkSpeedMultiplier"] = 0.25,
        ["projectileType"] = function(p708) --[[ Name: projectileType, Line 4761 ]]
            --[[
            Upvalues:
                [1] = u57
            --]]
            if p708 == u57.IRON_ARROW then
                return "golden_arrow_iron"
            end
            local _ = p708 == u57.ARROW
            return "golden_arrow"
        end,
        ["ammoItemTypes"] = { u57.ARROW, u57.IRON_ARROW },
        ["launchSound"] = { u47.NEW_BOW_FIRE },
        ["chargeBeginSound"] = { u47.BOW_DRAW }
    }
}
u93[v707] = v709
local v710 = u57.THROWING_KNIFE
local v711 = {
    ["displayName"] = "Throwing Knife",
    ["image"] = "rbxassetid://8479269961",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.8,
        ["maxStrengthChargeSec"] = 0.4,
        ["multiShot"] = true,
        ["multiShotCount"] = 3,
        ["multiShotDelay"] = 0.2,
        ["projectileType"] = function() --[[ Name: projectileType, Line 4786 ]]
            return "throwing_knife"
        end,
        ["ammoItemTypes"] = { u57.THROWING_KNIFE },
        ["launchSound"] = { u47.NEW_BOW_FIRE }
    }
}
u93[v710] = v711
local v712 = u57.SCYTHE
local v713 = {
    ["displayName"] = "Scythe",
    ["image"] = "rbxassetid://8479270510",
    ["sword"] = {
        ["damage"] = 70,
        ["attackSpeed"] = 1,
        ["swingAnimations"] = { u7.SCYTHE_SWING },
        ["idleAnimation"] = u7.SCYTHE_IDLE,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.3,
            ["vertical"] = 2
        }
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v712] = v713
u93[u57.SMOKE_BOMB] = {
    ["displayName"] = "Smoke Bomb",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://8532898334",
    ["consumable"] = {
        ["consumeTime"] = 0.5,
        ["cancelOnDamage"] = true
    },
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
local v714 = u57.SMOKE_BLOCK
local v715 = {
    ["displayName"] = "Smoke Block",
    ["sharingDisabled"] = true,
    ["footstepSound"] = v46.GRASS
}
local v716 = {
    ["seeThrough"] = true,
    ["health"] = 6,
    ["maxPlaced"] = 20,
    ["breakType"] = v2.DIRT,
    ["placeSound"] = function() --[[ Name: placeSound, Line 4834 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["greedyMesh"] = {
        ["textures"] = { "rbxassetid://8536406963" }
    },
    ["collectionServiceTags"] = { "smoke_block" },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 8006
        }
    }
}
v715.block = v716
u93[v714] = v715
u93[u57.DUCK_SPAWN_EGG] = {
    ["displayName"] = "Duck Egg",
    ["image"] = "rbxassetid://8732031366",
    ["consumable"] = {
        ["consumeTime"] = 3.5,
        ["cancelOnDamage"] = true,
        ["disableAnimation"] = true,
        ["soundOverride"] = "None"
    }
}
local v717 = u57.JUGGERNAUT_CRATE
local v718 = {
    ["displayName"] = "Juggernaut Crate",
    ["block"] = {
        ["health"] = 20,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "juggernaut-crate" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8007
            }
        }
    }
}
u93[v717] = v718
local v719 = u57.HEAT_SEEKING_ROCK
local v720 = {
    ["displayName"] = "Heat Seeking Rock",
    ["image"] = "rbxassetid://7681398025",
    ["guidedProjectileSource"] = {
        ["guidedProjectile"] = "heat_seeking_rock",
        ["consumeItem"] = u57.HEAT_SEEKING_ROCK
    },
    ["firstPerson"] = {
        ["scale"] = 0.7
    }
}
u93[v719] = v720
local v721 = u57.BATTLE_AXE
local v722 = {
    ["displayName"] = "Battle Axe",
    ["image"] = "rbxassetid://8795403259"
}
local v723 = {
    ["damage"] = 50,
    ["respectAttackSpeedForEffects"] = true,
    ["applyCooldownOnMiss"] = true,
    ["attackSpeed"] = 2,
    ["knockbackMultiplier"] = {
        ["horizontal"] = 2
    },
    ["attackRange"] = 7 * u17
}
local v724 = {
    ["cooldownBar"] = {
        ["color"] = Color3.fromRGB(242, 207, 10)
    }
}
v723.cooldown = v724
v723.swingSounds = {}
v722.sword = v723
u93[v721] = v722
local v725 = u57.MASS_HAMMER
local v726 = {
    ["displayName"] = "Mass Hammer",
    ["image"] = "rbxassetid://8938480294"
}
local v727 = {
    ["damage"] = 35,
    ["respectAttackSpeedForEffects"] = true,
    ["applyCooldownOnMiss"] = true,
    ["attackSpeed"] = 1.5,
    ["knockbackMultiplier"] = {
        ["horizontal"] = 1.2,
        ["vertical"] = 1.2
    },
    ["attackRange"] = 5 * u17
}
local v728 = {
    ["cooldownBar"] = {
        ["color"] = Color3.fromRGB(161, 97, 15)
    }
}
v727.cooldown = v728
v727.swingSounds = {}
v726.sword = v727
u93[v725] = v726
local v729 = u57.TWIRLBLADE
local v730 = {
    ["displayName"] = "Twirlblade",
    ["image"] = "rbxassetid://8795403035"
}
local v731 = {
    ["damage"] = 50,
    ["respectAttackSpeedForEffects"] = true,
    ["applyCooldownOnMiss"] = true,
    ["attackSpeed"] = 1,
    ["knockbackMultiplier"] = {
        ["horizontal"] = 1.1
    },
    ["attackRange"] = 6 * u17
}
local v732 = {
    ["cooldownBar"] = {
        ["color"] = Color3.fromRGB(179, 5, 5)
    }
}
v731.cooldown = v732
v731.swingAnimations = { u7.TWIRLBLADE_ATTACK_1, u7.TWIRLBLADE_ATTACK_2 }
v731.firstPersonSwingAnimations = { u7.FP_TWIRLBLADE_ATTACK_1, u7.FP_TWIRLBLADE_ATTACK_2 }
v731.swingSounds = {}
v730.sword = v731
u93[v729] = v730
u93[u57.FORCEFIELD_POTION] = {
    ["displayName"] = "Forcefield Potion",
    ["image"] = "rbxassetid://8795406077",
    ["consumable"] = {
        ["consumeTime"] = 1.5,
        ["cancelOnDamage"] = true
    }
}
local v733 = u57.TIME_BOMB_POTION
local v734 = {
    ["displayName"] = "Time Bomb Potion",
    ["image"] = "rbxassetid://9135921093",
    ["consumable"] = {
        ["consumeTime"] = 0.6,
        ["potion"] = true
    },
    ["crafting"] = {
        ["recipe"] = v45[u57.TIME_BOMB_POTION]
    }
}
u93[v733] = v734
local v735 = u57.STONE_PLAYER_BLOCK
local v736 = {
    ["displayName"] = "Stone Player Block",
    ["footstepSound"] = v46.GRASS
}
local v737 = {
    ["disableInventoryPickup"] = true,
    ["seeThrough"] = true,
    ["health"] = 6,
    ["breakType"] = v2.DIRT,
    ["placeSound"] = function() --[[ Name: placeSound, Line 4974 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["greedyMesh"] = {
        ["textures"] = { "rbxassetid://8536406963" }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 8008
        }
    }
}
v736.block = v737
u93[v735] = v736
local v738 = u57.MINER_PICKAXE
local v739 = {
    ["displayName"] = "Miner Pickaxe",
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.STONE] = 30
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[v738] = v739
local v740 = u57.PAINT_SHOTGUN
local v741 = {
    ["displayName"] = "Paint Blaster",
    ["image"] = "rbxassetid://9135902677",
    ["firstPerson"] = {
        ["holdAnimation"] = u7.FP_PAINT_SHOTGUN_IDLE
    }
}
u93[v740] = v741
local v742 = u57.CARROT_CANNON
local v743 = {
    ["displayName"] = "Carrot Cannon",
    ["image"] = "rbxassetid://9134613651",
    ["firstPerson"] = {
        ["holdAnimation"] = u7.FP_CARROT_CANNON_IDLE
    },
    ["thirdPerson"] = {
        ["holdAnimation"] = u7.CARROT_CANNON_IDLE
    }
}
local v744 = {
    ["activeReload"] = true,
    ["multiShot"] = true,
    ["multiShotCount"] = 4,
    ["multiShotDelay"] = 0.1,
    ["walkSpeedMultiplier"] = 0.6,
    ["projectileType"] = function(_) --[[ Name: projectileType, Line 5014 ]]
        return "carrot_rocket"
    end,
    ["ammoItemTypes"] = { u57.CARROT_ROCKET },
    ["fireDelaySec"] = v21.COOLDOWN,
    ["launchSound"] = { u47.CARROT_LAUNCHER_FIRE },
    ["launchSoundConfig"] = {
        ["pitch"] = NumberRange.new(0.95, 1.05)
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_CARROT_CANNON_SHOOT
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.CARROT_CANNON_SHOOT
    },
    ["launchScreenShake"] = {
        ["config"] = {
            ["magnitude"] = 0.07,
            ["duration"] = 0.15,
            ["cycles"] = 2
        }
    }
}
v743.projectileSource = v744
u93[v742] = v743
u93[u57.CARROT_ROCKET] = {
    ["displayName"] = "Carrot Rocket",
    ["hotbarFillRight"] = true,
    ["image"] = "rbxassetid://9133691017"
}
local v745 = u57.BOBA_BLASTER
local v746 = {
    ["displayName"] = "Boba Blaster",
    ["image"] = "rbxassetid://9188763408"
}
local v747 = {
    ["fireDelaySec"] = 0.3,
    ["activeReload"] = true,
    ["walkSpeedMultiplier"] = 0.4,
    ["maxStrengthChargeSec"] = 0.6,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function(_) --[[ Name: projectileType, Line 5052 ]]
        return "boba_pearl"
    end,
    ["ammoItemTypes"] = { u57.BOBA_PEARL },
    ["launchSound"] = { u47.BOBA_SHOOT },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.BOBA_BLASTER_FIRE
    }
}
v746.projectileSource = v747
v746.thirdPerson = {
    ["holdAnimation"] = u7.BOBA_BLASTER_IDLE
}
u93[v745] = v746
u93[u57.BOBA_PEARL] = {
    ["displayName"] = "Boba Pearl",
    ["description"] = "Ammo for the Boba Blaster.",
    ["hotbarFillRight"] = true,
    ["image"] = "rbxassetid://9194313932"
}
local v748 = u57.DETONATED_BOMB
local v749 = {
    ["displayName"] = "Remote Explosive",
    ["description"] = "it explodes",
    ["hotbarFillRight"] = true,
    ["image"] = "rbxassetid://10648647141",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.15,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 5081 ]]
            return "detonated_bomb"
        end,
        ["ammoItemTypes"] = { u57.DETONATED_BOMB },
        ["launchSound"] = { u47.SNOWBALL_THROW }
    }
}
u93[v748] = v749
u93[u57.BOMB_CONTROLLER] = {
    ["displayName"] = "bomb controller",
    ["description"] = "don\'t press the red button",
    ["image"] = "rbxassetid://10648652428"
}
local v750 = u57.VENDING_MACHINE
local v751 = {
    ["displayName"] = "Vending Machine",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 20,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 5101 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "VendingMachine" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8009
            }
        }
    }
}
u93[v750] = v751
u93[u57.CROOK] = {
    ["displayName"] = "Crook"
}
u93[u57.TURTLE_SHELL] = {
    ["displayName"] = "Turtle Shell",
    ["image"] = "rbxassetid://9006935204",
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[u57.WILD_FLOWER] = {
    ["displayName"] = "Flower",
    ["description"] = "Alchemist crafting material.",
    ["image"] = "rbxassetid://9134545166"
}
u93[u57.THORNS] = {
    ["displayName"] = "Thorns",
    ["description"] = "Alchemist crafting material.",
    ["image"] = "rbxassetid://9134549615"
}
u93[u57.MUSHROOMS] = {
    ["displayName"] = "Mushrooms",
    ["description"] = "Alchemist crafting material.",
    ["image"] = "rbxassetid://9134534696"
}
local v752 = u57.FRYING_PAN
local v753 = {
    ["displayName"] = "Frying Pan",
    ["description"] = "Charge weapon to increase damage and knockback.",
    ["image"] = "rbxassetid://9253246741"
}
local v754 = {
    ["damage"] = 18,
    ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
    ["knockbackMultiplier"] = {
        ["horizontal"] = 1
    },
    ["chargedAttack"] = {
        ["maxChargeTimeSec"] = 1,
        ["bonusDamage"] = 4,
        ["bonusKnockback"] = {
            ["horizontal"] = 0.5,
            ["vertical"] = 0.5
        }
    }
}
v753.sword = v754
v753.firstPerson = {
    ["scale"] = 0.8
}
u93[v752] = v753
local v755 = u57.JUGGERNAUT_RAGE_BLADE
local v756 = {
    ["displayName"] = "Jugg Rage Blade",
    ["description"] = "Only the worthy shall wield this blade.",
    ["image"] = "rbxassetid://7051149237",
    ["sword"] = {
        ["damage"] = 35,
        ["applyCooldownOnMiss"] = true,
        ["attackSpeed"] = v14.JUGGERNAUT_SWORD_COOLDOWN,
        ["swingAnimations"] = {},
        ["attackRange"] = 5 * u17,
        ["knockbackMultiplier"] = {
            ["vertical"] = 1.2,
            ["horizontal"] = 1.4
        }
    }
}
u93[v755] = v756
local v757 = u57.HEAVENLY_SWORD
local v758 = {
    ["displayName"] = "Light Sword",
    ["image"] = "rbxassetid://9620517732",
    ["sharingDisabled"] = true
}
local v759 = {
    ["damage"] = 47,
    ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
    ["knockbackMultiplier"] = {
        ["horizontal"] = 1
    },
    ["chargedAttack"] = {
        ["maxChargeTimeSec"] = v28.MAX_CHARGE_TIME,
        ["walkSpeedModifier"] = {
            ["multiplier"] = 0.85,
            ["delay"] = 0.25
        },
        ["minChargeTimeSec"] = v28.MIN_CHARGE_TIME,
        ["chargedSwingAnimations"] = { u7.HEAVENLY_SWORD_SWING },
        ["firstPersonChargedSwingAnimations"] = { u7.FP_HEAVENLY_SWORD_SWING }
    }
}
v758.sword = v759
v758.projectileSource = {
    ["fireDelaySec"] = 0.3,
    ["projectileType"] = function(p760) --[[ Name: projectileType, Line 5198 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        return p760 == u57.HEAVENLY_SWORD and "sword_wave1" or (p760 == u57.FESTIVE_SWORD_WAVE and "festive_sword_wave" or (p760 == u57.FESTIVE_SWORD_WAVE1 and "festive_sword_wave1" or "sword_wave"))
    end
}
v758.firstPerson = {
    ["scale"] = 0.8
}
u93[v757] = v758
u93[u57.FESTIVE_SWORD_WAVE] = {
    ["displayName"] = "Festive Sword Wave"
}
u93[u57.FESTIVE_SWORD_WAVE1] = {
    ["displayName"] = "Festive Sword Wave1"
}
local v761 = u57.INFERNAL_SABER
local v762 = {
    ["displayName"] = "Infernal Saber",
    ["image"] = "rbxassetid://9620506030",
    ["sharingDisabled"] = true
}
local v763 = {
    ["damage"] = 40,
    ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
    ["chargedAttack"] = {
        ["maxChargeTimeSec"] = 1,
        ["minChargeTimeSec"] = 1,
        ["attackCooldown"] = 0.5,
        ["walkSpeedModifier"] = {
            ["multiplier"] = 1
        }
    },
    ["knockbackMultiplier"] = {
        ["horizontal"] = 0.5
    }
}
v762.sword = v763
v762.firstPerson = {
    ["scale"] = 0.8,
    ["verticalOffset"] = -1.2
}
u93[v761] = v762
local v764 = u57.BEAR_CLAWS
local v765 = {
    ["displayName"] = "Bear Claw",
    ["image"] = "rbxassetid://9434318163"
}
local v766 = {
    ["damage"] = 45,
    ["attackSpeed"] = 0.8,
    ["respectAttackSpeedForEffects"] = true,
    ["applyCooldownOnMiss"] = true,
    ["swingSounds"] = { u47.BEAR_CLAWS_SWIPE },
    ["swingAnimations"] = { u7.BEAR_CLAWS_SWIPE },
    ["firstPersonSwingAnimations"] = { u7.BEAR_CLAWS_SWIPE },
    ["knockbackMultiplier"] = {
        ["horizontal"] = 0.1
    },
    ["chargedAttack"] = {
        ["maxChargeTimeSec"] = 1,
        ["bonusDamage"] = 15,
        ["ignoreEffectsOnFullyCharged"] = true,
        ["bonusKnockback"] = {
            ["horizontal"] = 0.1,
            ["vertical"] = 0.1
        }
    }
}
v765.sword = v766
v765.firstPerson = {
    ["scale"] = 0.8
}
u93[v764] = v765
u93[u57.BIG_HEAD_POTION] = {
    ["displayName"] = "Big Head Potion",
    ["description"] = "Consume potion to grow yourself a bigger head.",
    ["image"] = "rbxassetid://9192325186",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["potion"] = true
    }
}
local v767 = u57.BEDROCK
local v768 = {
    ["displayName"] = "Bedrock",
    ["footstepSound"] = v46.STONE
}
local v769 = {
    ["health"] = 10,
    ["blastProof"] = true,
    ["breakableOnlyByHosts"] = true,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 7
        }
    }
}
v768.block = v769
u93[v767] = v768
local v770 = u57.BARRIER
local v771 = {
    ["displayName"] = "Barrier",
    ["footstepSound"] = v46.STONE,
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 1,
        ["blastProof"] = true,
        ["breakableOnlyByHosts"] = true,
        ["collectionServiceTags"] = { "BARRIER_BLOCK" },
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 166
            }
        }
    }
}
u93[v770] = v771
local v772 = u57.INVISIBLE_LANDMINE
local v773 = {
    ["displayName"] = "Invisible Landmine",
    ["image"] = "rbxassetid://9434319010",
    ["block"] = {
        ["health"] = 25,
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["unbreakableByTeammates"] = true,
        ["maxPlaced"] = 6,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 5321 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "invisible-landmine" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8011
            }
        }
    }
}
u93[v772] = v773
u93[u57.INFERNAL_SHIELD] = {
    ["displayName"] = "Infernal Shield",
    ["description"] = "Deflect incoming projectiles while shield is raised.",
    ["image"] = "rbxassetid://7051149149",
    ["sharingDisabled"] = true,
    ["firstPerson"] = {
        ["scale"] = 0.8
    }
}
u93[u57.ROCKET_BELT] = {
    ["displayName"] = "Rocket Belt",
    ["description"] = "The moment you doubt whether you can fly, you cease forever to be able to do it.",
    ["image"] = "rbxassetid://10480113919",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["backpack"] = {
        ["cooldown"] = 10
    }
}
u93[u57.TURTLE_BACKPACK] = {
    ["displayName"] = "Turtle Shell",
    ["image"] = "rbxassetid://9006935204",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["backpack"] = {
        ["activeAbility"] = false
    }
}
u93[u57.SPIKE_SHELL_BACKPACK] = {
    ["displayName"] = "Spike Shell",
    ["image"] = "rbxassetid://11272107426",
    ["description"] = "Take reduced damage based on the direction of the attack and reflect that damage back to the enemy.",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["backpack"] = {
        ["activeAbility"] = false
    }
}
u93[u57.PORTABLE_VENDING_MACHINE] = {
    ["displayName"] = "Portable Vending Machine",
    ["image"] = "rbxassetid://11272093702",
    ["description"] = "Visit the Shop anywhere and unlock the Blind-Box in the Shop. Purchasing an item will put the vending machine on cooldown.",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["backpack"] = {
        ["activeAbility"] = true
    }
}
u93[u57.HEALING_BACKPACK] = {
    ["displayName"] = "First Aid Kit",
    ["image"] = "rbxassetid://10562874983",
    ["description"] = "Gradually heal you and nearby teammates over 10 seconds.",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["backpack"] = {
        ["activeAbility"] = false
    }
}
u93[u57.METAL_DETECTOR] = {
    ["displayName"] = "Metal Detector",
    ["image"] = "rbxassetid://9378643217",
    ["sharingDisabled"] = true
}
local v774 = u57.MAGMA_BLOCK
local v775 = {
    ["displayName"] = "Magma Block",
    ["footstepSound"] = v46.STONE
}
local v776 = {
    ["health"] = 10,
    ["blastProof"] = true,
    ["breakableOnlyByHosts"] = true,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 213
        }
    },
    ["pointLight"] = {
        ["Brightness"] = 4,
        ["Shadows"] = true,
        ["Range"] = 8,
        ["Color"] = Color3.fromRGB(255, 130, 130)
    },
    ["collectionServiceTags"] = { "MagmaBlock" }
}
v775.block = v776
u93[v774] = v775
u93[u57.DRONE] = {
    ["displayName"] = "Drone",
    ["sharingDisabled"] = true,
    ["image"] = v35.CYBER_DRONE_RENDER,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["guidedProjectileSource"] = {
        ["guidedProjectile"] = "drone"
    }
}
local v777 = u57.GRAPPLING_HOOK
local v778 = {
    ["displayName"] = "Grapple Hook",
    ["description"] = "Launch, grapple, and pull yourself along for fast travel.",
    ["image"] = "rbxassetid://9499344892"
}
local v779 = {
    ["fireDelaySec"] = 1,
    ["waitForHit"] = true,
    ["projectileType"] = function(_) --[[ Name: projectileType, Line 5442 ]]
        return "grappling_hook_projectile"
    end,
    ["launchSound"] = { u47.GRAPPLING_HOOK_FIRE },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.TORNADO_LAUNCHER_SHOOT,
        ["aimAnimation"] = u7.TORNADO_LAUNCHER_HOLD
    },
    ["blockingStatusEffects"] = { v48.GROUNDED }
}
v778.projectileSource = v779
u93[v777] = v778
u93[u57.HELICOPTER_DEPLOY] = {
    ["displayName"] = "Minicopter",
    ["image"] = "rbxassetid://9559559860",
    ["consumable"] = {
        ["consumeTime"] = 3,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
u93[u57.UFO_DEPLOY] = {
    ["displayName"] = "UFO",
    ["image"] = "rbxassetid://11977366776",
    ["consumable"] = {
        ["consumeTime"] = 3,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
u93[u57.ATTACK_HELICOPTER_DEPLOY] = {
    ["displayName"] = "Attack Minicopter",
    ["image"] = "rbxassetid://10236878231",
    ["description"] = "Weaponized flying death machine.",
    ["consumable"] = {
        ["consumeTime"] = 3,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
u93[u57.SLEIGH_DEPLOY] = {
    ["displayName"] = "Sleigh",
    ["image"] = "rbxassetid://99857605333058",
    ["consumable"] = {
        ["consumeTime"] = 3,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
u93[u57.PLAYER_VACUUM] = {
    ["displayName"] = "Vacuum",
    ["image"] = "rbxassetid://9679750852"
}
u93[u57.DINO_DEPLOY] = {
    ["displayName"] = "Dino",
    ["image"] = "rbxassetid://9855535867",
    ["sharingDisabled"] = true,
    ["consumable"] = {
        ["consumeTime"] = 2,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true,
        ["keepOnConsume"] = true
    },
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
local v780 = u57.VITALITY_STAR
local v781 = {
    ["displayName"] = "Vitality Star",
    ["description"] = "Consume to gain a health buff for yourself and nearby teammates!",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://9866757969",
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["soundOverride"] = "None",
        ["animationOverride"] = u7.STAR_ITEM_CONSUME
    }
}
u93[v780] = v781
local v782 = u57.CRIT_STAR
local v783 = {
    ["displayName"] = "Crit Star",
    ["description"] = "Consume to gain a crit rate buff for yourself and nearby teammates!",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://9866757805",
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["soundOverride"] = "None",
        ["animationOverride"] = u7.STAR_ITEM_CONSUME
    }
}
u93[v782] = v783
local v784 = u57.VOID_PORTAL
local v785 = {
    ["displayName"] = "Void Portal",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 20,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 5536 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "VoidPortal" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8010
            }
        }
    }
}
u93[v784] = v785
local v786 = u57.TEAM_DOOR
local v787 = {
    ["displayName"] = "Team Door",
    ["image"] = "rbxassetid://10322205747",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 20,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 5552 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "CanNoclip", "TeamDoor" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12004
            }
        }
    }
}
u93[v786] = v787
local v788 = u57.VOID_TURRET
local v789 = {
    ["displayName"] = "Void Turret",
    ["image"] = "rbxassetid://9942058258",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 25,
        ["blastResistance"] = 4,
        ["disableInventoryPickup"] = true,
        ["unbreakableByTeammates"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 5568 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "Turret", v18.VOID_TURRET },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8011
            }
        }
    }
}
u93[v788] = v789
local v790 = u57.SPIKE_TRAP
local v791 = {
    ["displayName"] = "Spike Trap",
    ["image"] = "rbxassetid://10322206238",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 20,
        ["maxPlaced"] = 14,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 5587 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "spike_trap" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12003
            }
        }
    }
}
u93[v790] = v791
local v792 = u57.AUTO_TURRET
local v793 = {
    ["displayName"] = "Auto Turret",
    ["image"] = "rbxassetid://7290567966"
}
local v794 = {
    ["maxPlaced"] = 10,
    ["seeThrough"] = true,
    ["health"] = 25,
    ["disableInventoryPickup"] = true,
    ["unbreakableByTeammates"] = true,
    ["blastResistance"] = 4,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 5605 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_HIT)
    end,
    ["collectionServiceTags"] = { "Turret", v18.VOID_TURRET, v18.AUTO_TURRET },
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.3,
        ["projectileType"] = function() --[[ Name: projectileType, Line 5615 ]]
            return "autoTurretBullet"
        end,
        ["launchSound"] = { u47.NEW_BOW_FIRE },
        ["relativeOverride"] = {
            ["relX"] = 0,
            ["relY"] = 0,
            ["relZ"] = 0
        }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 12002
        }
    }
}
v793.block = v794
u93[v792] = v793
local v795 = u57.SHOCK_WAVE_TURRET
local v796 = {
    ["displayName"] = "Shock Wave Turret",
    ["image"] = "rbxassetid://10322206511",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 18,
        ["disableInventoryPickup"] = true,
        ["maxPlaced"] = 2,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 5636 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "shock-wave-turret" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12001
            }
        }
    }
}
u93[v795] = v796
u93[u57.VOID_TURRET_TABLET] = {
    ["displayName"] = "Void Turret Tablet",
    ["image"] = "rbxassetid://9942058467",
    ["hotbarFillRight"] = true,
    ["keepOnDeath"] = true
}
local v797 = u57.HUGE_LUCKY_BLOCK
local v798 = {
    ["displayName"] = "Huge Lucky Block"
}
local v799 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 150,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 5659 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.LUCKY_BLOCK_BREAK)
    end,
    ["luckyBlock"] = {
        ["timeBetweenDropsSec"] = 0.5,
        ["drops"] = {
            {
                ["luckMultiplier"] = 1
            },
            {
                ["luckMultiplier"] = 1
            },
            {
                ["luckMultiplier"] = 2
            },
            {
                ["luckMultiplier"] = 2
            },
            {
                ["luckMultiplier"] = 4
            }
        },
        ["allowedRarity"] = {
            v42.UNCOMMON,
            v42.RARE,
            v42.EPIC,
            v42.LEGENDARY
        },
        ["allowedPolarity"] = { v41.NEUTRAL, v41.POSITIVE }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 9010
        }
    }
}
v798.block = v799
u93[v797] = v798
local v800 = u57.STICKY_FIREWORK
local v801 = {
    ["displayName"] = "Sticky Firework",
    ["image"] = "rbxassetid://10086863934",
    ["description"] = "Throw at players to launch them into the sky"
}
local v802 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 5691 ]]
        return "sticky_firework"
    end,
    ["ammoItemTypes"] = { u57.STICKY_FIREWORK },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v801.projectileSource = v802
u93[v800] = v801
local v803 = u57.DIZZY_TOAD
local v804 = {
    ["displayName"] = "Dizzy Toad",
    ["description"] = "Throw at players to make them dizzy",
    ["image"] = "rbxassetid://10086864455"
}
local v805 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 5709 ]]
        return "dizzy_toad"
    end,
    ["ammoItemTypes"] = { u57.DIZZY_TOAD },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v804.projectileSource = v805
u93[v803] = v804
local v806 = u57.TOY_HAMMER
local v807 = {
    ["displayName"] = "Toy Hammer",
    ["description"] = "Hit players for huge knockback",
    ["image"] = "rbxassetid://10086863582",
    ["sword"] = {
        ["damage"] = 10,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.5
        },
        ["hitSound"] = u47.TOY_HAMMER_HIT
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v806] = v807
local v808 = u57.SMALL_BUSH
local v809 = {
    ["displayName"] = "Small Bush",
    ["block"] = {
        ["unbreakable"] = true,
        ["seeThrough"] = true,
        ["canReplace"] = true,
        ["dontPlaceInPublicMatch"] = true,
        ["ignoreProjectileCollision"] = true,
        ["ignoreSwordRaycast"] = true,
        ["ignoreAbilityRaycast"] = true,
        ["ignorePathfind"] = true,
        ["breakType"] = v2.DIRT,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 175,
                ["blockData"] = 2
            }
        }
    }
}
u93[v808] = v809
local v810 = u57.LARGE_BUSH
local v811 = {
    ["displayName"] = "Large Bush",
    ["block"] = {
        ["unbreakable"] = true,
        ["seeThrough"] = true,
        ["canReplace"] = true,
        ["dontPlaceInPublicMatch"] = true,
        ["ignoreProjectileCollision"] = true,
        ["ignoreSwordRaycast"] = true,
        ["ignoreAbilityRaycast"] = true,
        ["ignorePathfind"] = true,
        ["breakType"] = v2.DIRT,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12000,
                ["blockData"] = 2
            }
        }
    }
}
u93[v810] = v811
local v812 = u57.FLOWER_PURPLE
local v813 = {
    ["displayName"] = "Purple Flower",
    ["block"] = {
        ["unbreakable"] = true,
        ["seeThrough"] = true,
        ["canReplace"] = true,
        ["dontPlaceInPublicMatch"] = true,
        ["ignoreProjectileCollision"] = true,
        ["ignoreSwordRaycast"] = true,
        ["ignoreAbilityRaycast"] = true,
        ["ignorePathfind"] = true,
        ["breakType"] = v2.DIRT,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 31,
                ["blockData"] = 1
            },
            {
                ["blockId"] = 37
            }
        }
    }
}
u93[v812] = v813
local v814 = u57.BROKEN_SNOW_CONE_MACHINE
local v815 = {
    ["displayName"] = "Broken Snow Cone Machine",
    ["block"] = {
        ["seeThrough"] = true,
        ["noSuffocation"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12010
            }
        },
        ["collectionServiceTags"] = { "BrokenSnowConeMachine" }
    }
}
u93[v814] = v815
local v816 = u57.SNOW_CONE_MACHINE
local v817 = {
    ["displayName"] = "Snow Cone Machine",
    ["block"] = {
        ["seeThrough"] = true,
        ["noSuffocation"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12010,
                ["blockData"] = 2
            }
        },
        ["collectionServiceTags"] = { "SnowConeMachine" }
    }
}
u93[v816] = v817
local v818 = u57.SNOW_CONE
local v819 = {
    ["displayName"] = "Snow Cone",
    ["description"] = "Consume for 1 Snow Cone stack!",
    ["image"] = "rbxassetid://10489888403"
}
local v820 = {
    ["consumeTime"] = 0.5,
    ["statusEffect"] = {
        ["incrementStacks"] = 1,
        ["statusEffectType"] = v48.SNOW_CONE
    }
}
v819.consumable = v820
u93[v818] = v819
local v821 = u57.LUCKY_SNOW_CONE
local v822 = {
    ["displayName"] = "Lucky Snow Cone",
    ["description"] = "Worth five Snow Cone stacks!",
    ["image"] = "rbxassetid://10489888627"
}
local v823 = {
    ["consumeTime"] = 0.5,
    ["statusEffect"] = {
        ["incrementStacks"] = 5,
        ["statusEffectType"] = v48.SNOW_CONE
    }
}
v822.consumable = v823
u93[v821] = v822
local v824 = u57.TENNIS_RACKET
local v825 = {
    ["displayName"] = "Tennis Racket",
    ["image"] = "rbxassetid://10392204924",
    ["description"] = "Used to hit explosive tennis balls.",
    ["sharingDisabled"] = true
}
local v826 = {
    ["fireDelaySec"] = 0.4,
    ["activeReload"] = true,
    ["walkSpeedMultiplier"] = 0.4,
    ["maxStrengthChargeSec"] = 0.65,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function(_) --[[ Name: projectileType, Line 5849 ]]
        return "tennis_ball"
    end,
    ["ammoItemTypes"] = { u57.TENNIS_BALL },
    ["launchSound"] = { u47.TENNIS_BALL_HIT_1, u47.TENNIS_BALL_HIT_2 },
    ["launchScreenShake"] = {
        ["config"] = {
            ["magnitude"] = 0.04,
            ["duration"] = 0.11,
            ["cycles"] = 1
        }
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.TENNIS_RACKET_HIT
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.TENNIS_RACKET_HIT
    }
}
v825.projectileSource = v826
v825.firstPerson = {
    ["scale"] = 0.8,
    ["verticalOffset"] = -2,
    ["holdAnimation"] = u7.TENNIS_RACKET_IDLE
}
v825.thirdPerson = {
    ["holdAnimation"] = u7.TENNIS_RACKET_IDLE
}
v825.maxStackSize = {
    ["amount"] = 10
}
u93[v824] = v825
u93[u57.TENNIS_BALL] = {
    ["displayName"] = "Exploding Tennis Ball",
    ["description"] = "Explosive ammo for the tennis racket.",
    ["hotbarFillRight"] = true,
    ["image"] = "rbxassetid://10392205271",
    ["sharingDisabled"] = true
}
u93[u57.VOLLEY_ARROW] = {
    ["displayName"] = "Volley Arrow",
    ["image"] = "rbxassetid://6869295400"
}
u93[u57.CANNON_BALL] = {
    ["displayName"] = "Cannon Ball",
    ["maxStackSize"] = {
        ["amount"] = 2
    }
}
local v827 = u57.BLUNDERBUSS
local v828 = {
    ["displayName"] = "Blunderbuss",
    ["image"] = "rbxassetid://10722841562",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.7,
        ["projectileType"] = function() --[[ Name: projectileType, Line 5908 ]]
            return "blunderbuss_bullet"
        end,
        ["launchSound"] = { u47.BLUNDERBUSS_SHOOT }
    }
}
u93[v827] = v828
u93[u57.BLUNDERBUSS_BULLET] = {
    ["displayName"] = "Blunderbuss Bullet",
    ["removeFromCustoms"] = true
}
local v829 = u57.GLITCH_SNOWBALL
local v830 = {
    ["displayName"] = "Snowball?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://7911163294",
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY,
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.15,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 5924 ]]
            return "glitch_snowball"
        end,
        ["ammoItemTypes"] = { u57.GLITCH_SNOWBALL },
        ["launchSound"] = { u47.SNOWBALL_THROW }
    }
}
u93[v829] = v830
local v831 = u57.GLITCH_WOOD_BOW
local v832 = {
    ["displayName"] = "Bow?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://6869295332",
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY
}
local v833 = {
    ["fireDelaySec"] = 1.1,
    ["maxStrengthChargeSec"] = 0.65,
    ["minStrengthScalar"] = 0.3333333333333333,
    ["walkSpeedMultiplier"] = 0.35,
    ["projectileType"] = function(_) --[[ Name: projectileType, Line 5939 ]]
        return "glitch_arrow"
    end,
    ["ammoItemTypes"] = {
        u57.FIREWORK_ARROW,
        u57.ARROW,
        u57.VOLLEY_ARROW,
        u57.TNT
    },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["chargeBeginSound"] = { u47.BOW_DRAW },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.BOW_AIM,
        ["fireAnimation"] = u7.BOW_FIRE,
        ["drawAnimation"] = u7.BOW_DRAW
    }
}
v832.projectileSource = v833
u93[v831] = v832
local v834 = u57.GLITCH_POPUP_CUBE
local v835 = {
    ["image"] = "rbxassetid://7976208116",
    ["displayName"] = "Popup Tower?",
    ["glitched"] = true,
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY,
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 5963 ]]
            return "glitch_popup_cube"
        end,
        ["ammoItemTypes"] = { u57.GLITCH_POPUP_CUBE },
        ["launchSound"] = { u47.SWORD_SWING_1 }
    }
}
u93[v834] = v835
local v836 = u57.GLITCH_ROBBERY_BALL
local v837 = {
    ["displayName"] = "Robbery Ball?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://7977038485",
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY
}
local v838 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 5979 ]]
        return "glitch_robbery_ball"
    end,
    ["ammoItemTypes"] = { u57.GLITCH_ROBBERY_BALL },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v837.projectileSource = v838
u93[v836] = v837
local v839 = u57.GLITCH_THROWABLE_BRIDGE
local v840 = {
    ["displayName"] = "Portable Bridge?",
    ["image"] = "rbxassetid://10866146253",
    ["glitched"] = true,
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY
}
local v841 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 5998 ]]
        return "glitch_throwable_bridge"
    end,
    ["ammoItemTypes"] = { u57.GLITCH_THROWABLE_BRIDGE },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v840.projectileSource = v841
u93[v839] = v840
u93[u57.GLITCH_APPLE] = {
    ["displayName"] = "Apple?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://6985765179",
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY,
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["potion"] = true
    },
    ["maxStackSize"] = {
        ["amount"] = 4
    }
}
u93[u57.GLITCH_BIG_SHIELD] = {
    ["displayName"] = "Big Shield?",
    ["image"] = "rbxassetid://7863380423",
    ["glitched"] = true,
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY,
    ["consumable"] = {
        ["consumeTime"] = 1.8
    }
}
local v842 = u57.GLITCH_TASER
local v843 = {
    ["displayName"] = "Taser?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://7911162966",
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY,
    ["sword"] = {
        ["damage"] = 1,
        ["attackSpeed"] = 6,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0,
            ["vertical"] = 0
        },
        ["swingSounds"] = {},
        ["swingAnimations"] = { u7.PUNCH }
    }
}
u93[v842] = v843
local v844 = u57.GLITCH_GRENADE_LAUNCHER
local v845 = {
    ["displayName"] = "Rocket Launcher?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://10086864148",
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY
}
local v846 = {
    ["fireDelaySec"] = 2.2,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["activeReload"] = true,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6055 ]]
        return "glitch_stun_grenade"
    end,
    ["ammoItemTypes"] = { u57.GLITCH_STUN_GRENADE },
    ["launchSound"] = { u47.CARROT_LAUNCHER_FIRE },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.ROCKET_LAUNCHER_SHOT,
        ["aimAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    }
}
v845.projectileSource = v846
u93[v844] = v845
u93[u57.GLITCH_STUN_GRENADE] = {
    ["displayName"] = "Stun Grenade?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://10086863810",
    ["hotbarFillRight"] = true,
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY
}
u93[u57.GLITCH_GUITAR] = {
    ["displayName"] = "Guitar?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://12509567989",
    ["cooldownId"] = v19.MELODY,
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY
}
u93[u57.GLITCH_INFERNAL_SHIELD] = {
    ["displayName"] = "Infernal Shield?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://7051149149",
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY,
    ["firstPerson"] = {
        ["scale"] = 0.8
    }
}
local v847 = u57.GLITCHED_LUCKY_BLOCK
local v848 = {
    ["displayName"] = "Glitched Lucky Block",
    ["glitched"] = true,
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY
}
local v849 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 17,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 6099 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.LUCKY_BLOCK_BREAK)
    end,
    ["collectionServiceTags"] = { "GlitchedLuckyBlock" },
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.GLITCH }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 12014
        }
    }
}
v848.block = v849
u93[v847] = v848
local v850 = u57.GLITCH_WOOD_SWORD
local v851 = {
    ["displayName"] = "Wood Sword?",
    ["image"] = "rbxassetid://6875480974",
    ["glitched"] = true,
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY,
    ["sword"] = {
        ["damage"] = 42,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v850] = v851
local v852 = u57.TRUMPET
local v853 = {
    ["displayName"] = "Trumpet",
    ["description"] = "Make some noise!",
    ["image"] = "rbxassetid://10857089714",
    ["thirdPerson"] = {
        ["holdAnimation"] = u7.BOBA_BLASTER_IDLE
    }
}
u93[v852] = v853
local v854 = u57.GLITCH_TRUMPET
local v855 = {
    ["displayName"] = "Trumpet?",
    ["description"] = "Make some noise!",
    ["image"] = "rbxassetid://10857089714",
    ["glitched"] = true,
    ["pickUpOverlaySound"] = u47.GLITCH_OVERLAY,
    ["thirdPerson"] = {
        ["holdAnimation"] = u7.BOBA_BLASTER_IDLE
    }
}
u93[v854] = v855
local v856 = u57.PARTY_POPPER
local v857 = {
    ["displayName"] = "Party Popper",
    ["description"] = "Time to party!",
    ["image"] = "rbxassetid://11967427626",
    ["thirdPerson"] = {
        ["holdAnimation"] = u7.PARTY_POPPER_HOLD
    }
}
u93[v856] = v857
local v858 = u57.GLITCH_TACTICAL_CROSSBOW
local v859 = {
    ["displayName"] = "Tactical Crossbow?",
    ["sharingDisabled"] = true,
    ["glitched"] = true,
    ["image"] = "rbxassetid://7051149016"
}
local v860 = {
    ["walkSpeedMultiplier"] = 0.35,
    ["multiShot"] = true,
    ["multiShotCount"] = 3,
    ["projectileType"] = function(_) --[[ Name: projectileType, Line 6164 ]]
        return "glitch_tactical_arrow"
    end,
    ["ammoItemTypes"] = { u57.FIREWORK_ARROW, u57.ARROW },
    ["fireDelaySec"] = u53.CROSSBOW_FIRE_DELAY,
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.CROSSBOW_AIM,
        ["fireAnimation"] = u7.CROSSBOW_FIRE
    }
}
v859.projectileSource = v860
u93[v858] = v859
local v861 = u57.GLITCH_VOID_SWORD
local v862 = {
    ["displayName"] = "Void Sword?",
    ["glitched"] = true,
    ["image"] = "rbxassetid://9873021357",
    ["sword"] = {
        ["damage"] = 25,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v861] = v862
local v863 = u57.MAGE_SPELLBOOK
local v864 = {
    ["displayName"] = "Mage Spellbook",
    ["description"] = "Cast powerful spells at your enemies!",
    ["image"] = "rbxassetid://11003634601",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true
}
local v865 = {}
local v866 = {
    ["fireDelaySec"] = 0.7,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6209 ]]
        return "mage_spell_base"
    end,
    ["launchSound"] = { u47.WHIM_CAST_BASE_1, u47.WHIM_CAST_BASE_2, u47.WHIM_CAST_BASE_3 },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v865.mage_spell_base = v866
local v867 = {
    ["fireDelaySec"] = 0.7,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6219 ]]
        return "mage_spell_fire"
    end,
    ["launchSound"] = { u47.WHIM_CAST_FIRE_1, u47.WHIM_CAST_FIRE_2, u47.WHIM_CAST_FIRE_3 },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v865.mage_spell_fire = v867
local v868 = {
    ["fireDelaySec"] = 0.7,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6229 ]]
        return "mage_spell_ice"
    end,
    ["launchSound"] = { u47.WHIM_CAST_ICE_1, u47.WHIM_CAST_ICE_2, u47.WHIM_CAST_ICE_3 },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v865.mage_spell_ice = v868
local v869 = {
    ["fireDelaySec"] = 0.7,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6239 ]]
        return "mage_spell_nature"
    end,
    ["launchSound"] = { u47.WHIM_CAST_NATURE_1, u47.WHIM_CAST_NATURE_2, u47.WHIM_CAST_NATURE_3 },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v865.mage_spell_nature = v869
v864.multiProjectileSource = v865
u93[v863] = v864
u93[u57.NATURES_ESSENCE_1] = {
    ["displayName"] = "Nature\'s Essence I",
    ["removeFromCustoms"] = true,
    ["image"] = v35.NATURES_ESSENCE
}
u93[u57.NATURES_ESSENCE_2] = {
    ["displayName"] = "Nature\'s Essence II",
    ["removeFromCustoms"] = true,
    ["image"] = v35.NATURES_ESSENCE
}
u93[u57.NATURES_ESSENCE_3] = {
    ["displayName"] = "Nature\'s Essence III",
    ["removeFromCustoms"] = true,
    ["image"] = v35.NATURES_ESSENCE
}
u93[u57.NATURES_ESSENCE_4] = {
    ["displayName"] = "Nature\'s Essence IV",
    ["removeFromCustoms"] = true,
    ["image"] = v35.NATURES_ESSENCE
}
u93[u57.DAMAGE_ORB_EMERALD] = {
    ["displayName"] = "Damage Orb",
    ["description"] = "Grants +2% damage.",
    ["removeFromCustoms"] = true,
    ["image"] = v35.ALCHEMIZE_ORB_EMERALD
}
u93[u57.DAMAGE_ORB_DIAMOND] = {
    ["displayName"] = "Damage Orb",
    ["description"] = "Grants +2% damage.",
    ["removeFromCustoms"] = true,
    ["image"] = v35.ALCHEMIZE_ORB_DIAMOND
}
local v870 = u57.DRAGON_EGG
local v871 = {
    ["displayName"] = "Dragon Egg",
    ["block"] = {
        ["health"] = 500,
        ["unbreakable"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 6286 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.LUCKY_BLOCK_BREAK)
        end
    }
}
u93[v870] = v871
local v872 = u57.WORMHOLE
local v873 = {
    ["displayName"] = "Wormhole",
    ["image"] = "rbxassetid://11192696778",
    ["description"] = "Teleport to base while standing still.",
    ["consumable"] = {
        ["consumeTime"] = 0.5,
        ["cancelOnDamage"] = true,
        ["walkSpeedMultiplier"] = 0,
        ["soundOverride"] = u47.WORMHOLE_USE,
        ["animationOverride"] = u7.RAVEN_HOLD
    },
    ["maxStackSize"] = {
        ["amount"] = 5
    },
    ["cooldownId"] = v19.WORMHOLE
}
u93[v872] = v873
local v874 = u57.PUMPKIN_SEEDS
local v875 = {
    ["displayName"] = "Pumpkin Seeds",
    ["description"] = "Can be harvested into a throwable explosive!",
    ["image"] = "rbxassetid://11164828140",
    ["sharingDisabled"] = true,
    ["placesBlock"] = {
        ["blockType"] = u57.PUMPKIN
    }
}
u93[v874] = v875
local v876 = u57.PUMPKIN
local v877 = {
    ["displayName"] = "Pumpkin",
    ["image"] = v35.PUMPKIN_BOMB
}
local v878 = {
    ["health"] = 5,
    ["denyPlaceOn"] = true,
    ["seeThrough"] = true,
    ["disableInventoryPickup"] = true,
    ["hideDamageTextures"] = true,
    ["flammable"] = true,
    ["flameSpreadStopChance"] = 0.4,
    ["disableFlamableByTeammates"] = true,
    ["breakType"] = v2.WOOD,
    ["placedBy"] = {
        ["itemType"] = u57.PUMPKIN_SEEDS
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 6329 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.CROP_PLANT_1, u47.CROP_PLANT_2, u47.CROP_PLANT_3)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 8015
        }
    }
}
v877.block = v878
u93[v876] = v877
local v879 = u57.PUMPKIN_BOMB_1
local v880 = {
    ["displayName"] = "Jack o\'Boom",
    ["sharingDisabled"] = true,
    ["image"] = v35.PUMPKIN_BOMB
}
local v881 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6346 ]]
        return "pumpkin_bomb_1"
    end,
    ["ammoItemTypes"] = { u57.PUMPKIN_BOMB_1 },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v880.projectileSource = v881
u93[v879] = v880
local v882 = u57.PUMPKIN_BOMB_2
local v883 = {
    ["displayName"] = "Jack o\'Boom (Large)",
    ["sharingDisabled"] = true,
    ["image"] = v35.PUMPKIN_BOMB
}
local v884 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6364 ]]
        return "pumpkin_bomb_2"
    end,
    ["ammoItemTypes"] = { u57.PUMPKIN_BOMB_2 },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v883.projectileSource = v884
u93[v882] = v883
local v885 = u57.PUMPKIN_BOMB_3
local v886 = {
    ["displayName"] = "Jack o\'Boom (Huge)",
    ["sharingDisabled"] = true,
    ["image"] = v35.PUMPKIN_BOMB
}
local v887 = {
    ["fireDelaySec"] = 0.15,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6382 ]]
        return "pumpkin_bomb_3"
    end,
    ["ammoItemTypes"] = { u57.PUMPKIN_BOMB_3 },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v886.projectileSource = v887
u93[v885] = v886
local v888 = u57.SCEPTER
local v889 = {
    ["displayName"] = "Scepter of Light",
    ["sharingDisabled"] = true,
    ["image"] = v35.SCEPTER,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["cancelOnDamage"] = true,
        ["soundOverride"] = "None",
        ["animationOverride"] = u7.USE_CROSS,
        ["blockingStatusEffects"] = { v48.GROUNDED }
    }
}
u93[v888] = v889
u93[u57.BLIND_BOX] = {
    ["displayName"] = "Blind Box",
    ["image"] = "rbxassetid://8273441274",
    ["description"] = "Contains a random item, no refunds",
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[u57.CHICKEN_SHOP_ITEM] = {
    ["displayName"] = "Egg",
    ["image"] = "rbxassetid://13990235477"
}
u93[u57.CHICKEN_LEATHER] = {
    ["displayName"] = "Leather Chicken",
    ["image"] = "rbxassetid://13980233415"
}
u93[u57.CHICKEN_IRON] = {
    ["displayName"] = "Iron Chicken",
    ["image"] = "rbxassetid://13980233520"
}
u93[u57.CHICKEN_DIAMOND] = {
    ["displayName"] = "Diamond Chicken",
    ["image"] = "rbxassetid://13980233777"
}
u93[u57.CHICKEN_EMERALD] = {
    ["displayName"] = "Emerald Chicken",
    ["image"] = "rbxassetid://13980233671"
}
u93[u57.CHICKEN_VOID] = {
    ["displayName"] = "Void Chicken",
    ["image"] = "rbxassetid://13980233120"
}
local v890 = u57.NECROMANCER_STAFF
local v891 = {
    ["displayName"] = "Necromancer Staff",
    ["image"] = "rbxassetid://11350214469",
    ["sharingDisabled"] = true,
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.6,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 6448 ]]
            return "deploy_skeleton"
        end,
        ["launchSound"] = { u47.SPIRITORB_PULL_1 }
    }
}
u93[v890] = v891
u93[u57.ZENITH_SATELLITE_UPGRADE_2] = {
    ["displayName"] = "Satellite Upgrade 2",
    ["image"] = "rbxassetid://108335485693754",
    ["description"] = "Upgrade Level 2"
}
u93[u57.ZENITH_SATELLITE_UPGRADE_3] = {
    ["displayName"] = "Satellite Upgrade 3",
    ["image"] = "rbxassetid://132702848414950",
    ["description"] = "Upgrade Level 3"
}
local v892 = u57.SATELLITE_DISH
local v893 = {
    ["displayName"] = "Satellite Dish",
    ["description"] = "Send signals to disrupt your foes, earning resources on their shop purchases.",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://11585161152",
    ["footstepSound"] = v46.STONE,
    ["block"] = {
        ["health"] = 20,
        ["maxPlaced"] = 1,
        ["blastProof"] = true,
        ["unbreakableByTeammates"] = true,
        ["disableEnemyInventoryPickup"] = true,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "satellite-dish" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12016
            }
        }
    }
}
u93[v892] = v893
local v894 = u57.GLUE_PROJECTILE
local v895 = {
    ["displayName"] = "Gloop",
    ["description"] = "A throwable glue trap! Hit players will be grounded and slowed.",
    ["image"] = "rbxassetid://11467634330",
    ["sharingDisabled"] = true
}
local v896 = {
    ["fireDelaySec"] = 1,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6490 ]]
        return "glue_trap"
    end,
    ["ammoItemTypes"] = { u57.GLUE_PROJECTILE },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.PUNCH
    }
}
v895.projectileSource = v896
v895.maxStackSize = {
    ["amount"] = 3
}
u93[v894] = v895
u93[u57.GLUE_TRAP] = {
    ["displayName"] = "Glue Trap",
    ["description"] = "Glue enemy to the ground",
    ["image"] = "rbxassetid://7192711008",
    ["removeFromCustoms"] = true
}
local v897 = u57.GLUE_PROJECTILE_CHARGING
local v898 = {
    ["displayName"] = "Charging Gloop",
    ["description"] = "A throwable glue trap! Hit players will be grounded and slowed.",
    ["image"] = "rbxassetid://15579506278",
    ["sharingDisabled"] = true
}
local v899 = {
    ["fireDelaySec"] = 1,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6521 ]]
        return "glue_trap_charging"
    end,
    ["ammoItemTypes"] = { u57.GLUE_PROJECTILE_CHARGING },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.PUNCH
    }
}
v898.projectileSource = v899
v898.maxStackSize = {
    ["amount"] = 3
}
u93[v897] = v898
u93[u57.GLUE_TRAP_CHARGING] = {
    ["displayName"] = "Glue Trap",
    ["description"] = "Glue enemy to the ground",
    ["image"] = "rbxassetid://7192711008",
    ["removeFromCustoms"] = true
}
u93[u57.NOXIOUS_SLEDGEHAMMER] = {
    ["displayName"] = "Noxious Sledgehammer",
    ["description"] = "An infected Sledgehammer that poisons enemies & breaks map blocks.",
    ["image"] = "rbxassetid://11533278150",
    ["disableDroppingInQueues"] = { v20.INFECTED }
}
local v900 = u57.REPAIR_TOOL
local v901 = {
    ["displayName"] = "Map Repair",
    ["description"] = "Throw to repair the map from Sledgehammer strikes",
    ["image"] = "rbxassetid://11533277908"
}
local v902 = {
    ["fireDelaySec"] = 0.3,
    ["maxStrengthChargeSec"] = 0.15,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6559 ]]
        return "repair_tool"
    end,
    ["ammoItemTypes"] = { u57.REPAIR_TOOL },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.PUNCH
    }
}
v901.projectileSource = v902
u93[v900] = v901
local v903 = u57.FROSTY_HAMMER
local v904 = {
    ["displayName"] = "Frosty Hammer",
    ["description"] = "",
    ["image"] = "rbxassetid://11831565831",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 24,
        ["respectAttackSpeedForEffects"] = false,
        ["applyCooldownOnMiss"] = false,
        ["noApplyDamageCooldown"] = false,
        ["ignoreDamageCooldown"] = false,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
        ["hitSound"] = u47.JUGGERNAUT_ATTACK_IMPACT_1,
        ["swingAnimations"] = { u7.FROSTY_HAMMER_1, u7.FROSTY_HAMMER_2, u7.FROSTY_HAMMER_3 },
        ["firstPersonSwingAnimations"] = { u7.FP_SWING_SWORD }
    }
}
u93[v903] = v904
u93[u57.ICE_FISHING_ROD] = {
    ["displayName"] = "Fishing Rod",
    ["image"] = "rbxassetid://7807308581",
    ["firstPerson"] = {
        ["verticalOffset"] = -1
    }
}
local v905 = u57.LASER_SWORD
local v906 = {
    ["displayName"] = "Laser Sword",
    ["image"] = "rbxassetid://11775182286",
    ["sword"] = {
        ["damage"] = 42,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN + 0.1,
        ["swingSounds"] = { u47.LASER_SWORD_SWING_1, u47.LASER_SWORD_SWING_2, u47.LASER_SWORD_SWING_3 },
        ["hitSound"] = u47.LASER_SWORD_HIT,
        ["swingAnimations"] = { u7.LASER_SWORD_SWING_2, u7.LASER_SWORD_SWING_1 }
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v905] = v906
local v907 = u57.SOLAR_PANEL
local v908 = {
    ["displayName"] = "Solar Panel",
    ["image"] = "rbxassetid://11775182157",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 30,
        ["noSuffocation"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 6621 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "SolarPanel" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12017
            }
        }
    }
}
u93[v907] = v908
u93[u57.ORBITAL_SATELLITE_TABLET] = {
    ["displayName"] = "Orbital Satellite Tablet",
    ["description"] = "Controls the Orbital Satellite Laser",
    ["image"] = "rbxassetid://11776141709",
    ["consumable"] = {
        ["consumeTime"] = 0
    }
}
local v909 = u57.COSMIC_LUCKY_BLOCK
local v910 = {
    ["displayName"] = "Cosmic Lucky Block"
}
local v911 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 6645 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.COSMIC_LUCKY_BLOCK_HIT)
    end,
    ["breakSound"] = function() --[[ Name: breakSound, Line 6648 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.COSMIC_LUCKY_BLOCK_BREAK)
    end,
    ["collectionServiceTags"] = { "LuckyBlock" },
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.COSMIC }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 12015
        }
    }
}
v910.block = v911
u93[v909] = v910
local v912 = u57.METEOR_SHOWER
local v913 = {
    ["displayName"] = "Meteor Shower",
    ["description"] = "Summon a barrage of meteors!",
    ["image"] = "rbxassetid://11774788978",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 6674 ]]
            return "meteor_shower"
        end,
        ["ammoItemTypes"] = { u57.METEOR_SHOWER },
        ["launchSound"] = { u47.SWORD_SWING_1 }
    }
}
u93[v912] = v913
local v914 = u57.ORIONS_BELT_BOW
local v915 = {
    ["displayName"] = "Constellation Bow",
    ["description"] = "Shoots a constellation of explosive stars.",
    ["image"] = "rbxassetid://11774789128"
}
local v916 = {
    ["fireDelaySec"] = 0.3,
    ["maxStrengthChargeSec"] = 0.5,
    ["minStrengthScalar"] = 0.25,
    ["walkSpeedMultiplier"] = 0.25,
    ["multiShot"] = true,
    ["multiShotCount"] = 3,
    ["multiShotDelay"] = 0.1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6689 ]]
        return "star_projectile"
    end,
    ["ammoItemTypes"] = { u57.STAR },
    ["launchSound"] = { u47.STAR_FIRE },
    ["chargeBeginSound"] = { u47.CHARGE_TRIPLE_SHOT },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.BOW_AIM,
        ["fireAnimation"] = u7.BOW_FIRE,
        ["drawAnimation"] = u7.BOW_DRAW
    }
}
v915.projectileSource = v916
u93[v914] = v915
u93[u57.STAR] = {
    ["displayName"] = "Star",
    ["description"] = "Ammo for the Constellation Bow.",
    ["image"] = "rbxassetid://11774788771",
    ["hotbarFillRight"] = true
}
local v917 = u57.SPARKLER
local v918 = {
    ["displayName"] = "Sparkler Sword",
    ["image"] = "rbxassetid://11967707388",
    ["sword"] = {
        ["damage"] = 38,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v917] = v918
local v919 = u57.NEW_YEARS_LUCKY_BLOCK
local v920 = {
    ["displayName"] = "New Years Lucky Block"
}
local v921 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 6731 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.LUCKY_BLOCK_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 12016
        }
    },
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.NEW_YEARS }
    }
}
v920.block = v921
u93[v919] = v920
u93[u57.SPARKLING_APPLE_JUICE] = {
    ["displayName"] = "Sparkling Apple Juice",
    ["description"] = "Drink to gain a one minute speed and jump boost!",
    ["image"] = "rbxassetid://11967427500",
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["potion"] = true
    }
}
local v922 = u57.TELEPORT_HAT
local v923 = {
    ["displayName"] = "Teleport Hat",
    ["description"] = "Throw onto target players to gain the a teleport and peek ability.",
    ["image"] = "rbxassetid://12510119944",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
local v924 = {
    ["fireDelaySec"] = 10,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6769 ]]
        return "teleport_hat"
    end,
    ["ammoItemTypes"] = { u57.TELEPORT_HAT },
    ["launchSound"] = { u47.SNOWBALL_THROW },
    ["cooldownId"] = v19.HAT_TOSS,
    ["cooldownBar"] = {
        ["colorGradient"] = ColorSequence.new(Color3.fromRGB(235, 95, 180))
    }
}
v923.projectileSource = v924
u93[v922] = v923
u93[u57.OWL_ORB] = {
    ["displayName"] = "OWL",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://12509662844",
    ["keepOnDeath"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
local v925 = u57.OWL_SHOOTER
local v926 = {
    ["displayName"] = "OWL",
    ["sharingDisabled"] = true,
    ["image"] = v35.SCEPTER,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.2,
        ["projectileType"] = function() --[[ Name: projectileType, Line 6800 ]]
            return "owl_projectile"
        end,
        ["launchSound"] = { u47.TURRET_SHOOT },
        ["relativeOverride"] = {
            ["relX"] = 0.01,
            ["relY"] = 0.01,
            ["relZ"] = 0.01
        }
    }
}
u93[v925] = v926
local v927 = u57.FIRE_SHEEP_STATUE
local v928 = {
    ["displayName"] = "Fire Sheep Statue",
    ["image"] = "rbxassetid://12291381909",
    ["block"] = {
        ["seeThrough"] = true,
        ["unbreakableByTeammates"] = true,
        ["disableInventoryPickup"] = true,
        ["maxPlaced"] = 1,
        ["noSuffocation"] = true,
        ["health"] = 100000,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 6817 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = {},
        ["minecraftConversions"] = {
            {
                ["blockId"] = 656
            }
        }
    }
}
u93[v927] = v928
u93[u57.PURPLE_HAY_BALE] = {
    ["displayName"] = "Purple Hay Bale",
    ["description"] = "Used to feed Fire Sheep",
    ["image"] = "rbxassetid://12291381738"
}
u93[u57.TELEPORTING_HATTER] = {
    ["displayName"] = "Teleporting Hatter",
    ["description"] = "N/A",
    ["image"] = "rbxassetid://12291381738"
}
u93[u57.GOLDEN_APPLE] = {
    ["displayName"] = "Golden Apple",
    ["image"] = "rbxassetid://12444096542",
    ["description"] = "Instantly heal, then heal over time and gain a damage reduction buff",
    ["consumable"] = {
        ["consumeTime"] = 1
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
local v929 = u57.RAINBOW_BOW
local v930 = {
    ["displayName"] = "Spectrum Bow",
    ["description"] = "Shoot rainbow arrows that split into many different explosions.",
    ["image"] = "rbxassetid://12811607153"
}
local v931 = {
    ["fireDelaySec"] = 0.3,
    ["maxStrengthChargeSec"] = 0.5,
    ["minStrengthScalar"] = 0.25,
    ["walkSpeedMultiplier"] = 0.25,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6858 ]]
        return "rainbow_arrow"
    end,
    ["ammoItemTypes"] = { u57.RAINBOW_ARROW },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["chargeBeginSound"] = { u47.BOW_DRAW },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.BOW_AIM,
        ["fireAnimation"] = u7.BOW_FIRE,
        ["drawAnimation"] = u7.BOW_DRAW
    }
}
v930.projectileSource = v931
u93[v929] = v930
u93[u57.RAINBOW_ARROW] = {
    ["displayName"] = "Spectrum Arrow",
    ["description"] = "Ammo for the Spectrum Bow.",
    ["image"] = "rbxassetid://12813670017",
    ["hotbarFillRight"] = true
}
local v932 = u57.RAINBOW_AXE
local v933 = {
    ["displayName"] = "Radiant Axe",
    ["image"] = "rbxassetid://12811586114",
    ["description"] = "Impale enemies with fragments of light.",
    ["sword"] = {
        ["damage"] = 35,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["attackSpeed"] = 0.75,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5,
            ["vertical"] = 0.8
        },
        ["swingSounds"] = { u47.JUGGERNAUT_ATTACK_SWING_1, u47.JUGGERNAUT_ATTACK_SWING_2 }
    }
}
u93[v932] = v933
local v934 = u57.DOUBLE_RAINBOW_BOOTS
local v935 = {
    ["displayName"] = "Double Rainbow Boots",
    ["image"] = "rbxassetid://12813706493",
    ["description"] = "Jump through seven colors of the rainbow!",
    ["armor"] = {
        ["damageReductionMultiplier"] = 0.24,
        ["slot"] = v36.BOOTS
    }
}
u93[v934] = v935
local v936 = u57.RAINBOW_STAFF
local v937 = {
    ["displayName"] = "Mirage Staff",
    ["description"] = "Create rainbow bridges that give a speed boost for you and your team!",
    ["image"] = "rbxassetid://12813669578"
}
local v938 = {}
local v939 = {
    ["fireDelaySec"] = 8,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6912 ]]
        return "rainbow_bridge"
    end,
    ["launchSound"] = { u47.WHIM_CAST_BASE_1, u47.WHIM_CAST_BASE_2, u47.WHIM_CAST_BASE_3 },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.WIZARD_LIGHTNING_CAST
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["cooldownId"] = v19.RAINBOW_STAFF
}
v938.rainbow_bridge = v939
local v940 = {
    ["fireDelaySec"] = 8,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6928 ]]
        return "rainbow_bridge_gadget"
    end,
    ["launchSound"] = { u47.WHIM_CAST_BASE_1, u47.WHIM_CAST_BASE_2, u47.WHIM_CAST_BASE_3 },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.WIZARD_LIGHTNING_CAST
    },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["cooldownId"] = v19.RAINBOW_STAFF
}
v938.rainbow_bridge_gadget = v940
v937.multiProjectileSource = v938
u93[v936] = v937
u93[u57.RAINBOW_BACKPACK] = {
    ["displayName"] = "Prismatic Backpack",
    ["description"] = "Summon prisms that attack nearby enemies.",
    ["image"] = "rbxassetid://12813669743",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["backpack"] = {
        ["activeAbility"] = false
    }
}
u93[u57.MURDERER_DAGGER] = {
    ["displayName"] = "Murderer Dagger",
    ["image"] = "rbxassetid://10993361352",
    ["sharingDisabled"] = true
}
local v941 = u57.SHERIFF_CROSSBOW
local v942 = {
    ["displayName"] = "Sheriff Crossbow",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7051149016"
}
local v943 = {
    ["walkSpeedMultiplier"] = 0.35,
    ["projectileType"] = function() --[[ Name: projectileType, Line 6965 ]]
        return "sheriff_crossbow_arrow"
    end,
    ["fireDelaySec"] = u53.CROSSBOW_FIRE_DELAY,
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.CROSSBOW_AIM,
        ["fireAnimation"] = u7.CROSSBOW_FIRE
    }
}
v942.projectileSource = v943
u93[v941] = v942
local v944 = {
    ["displayName"] = "Throwing Knife",
    ["description"] = "Deadly.",
    ["image"] = "rbxassetid://8479269961",
    ["sharingDisabled"] = true,
    ["projectileSource"] = {
        ["fireDelaySec"] = 7,
        ["projectileType"] = function() --[[ Name: projectileType, Line 6990 ]]
            return "murderer_throwing_knife"
        end
    }
}
u93[u57.MURDERER_THROWING_KNIFE] = v944
local v945 = u57.BEEHIVE_GRENADE
local v946 = {
    ["displayName"] = "Beehive Grenade",
    ["description"] = "Explosive beehive that comes with a large kick! Hitting yourself will reset glide cooldown.",
    ["image"] = "rbxassetid://12671499151",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = v30.MAX_BEEHIVE_GRENADES
    }
}
local v947 = {
    ["fireDelaySec"] = 0.3,
    ["projectileType"] = function() --[[ Name: projectileType, Line 7006 ]]
        return "beehive_grenade"
    end,
    ["ammoItemTypes"] = { u57.BEEHIVE_GRENADE },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.GRENADE_THROW
    }
}
v946.projectileSource = v947
u93[v945] = v946
local v948 = u57.RAINBOW_LUCKY_BLOCK
local v949 = {
    ["displayName"] = "Rainbow Lucky Block"
}
local v950 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 30,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 7021 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u6
            [3] = u47
        --]]
        return u54(u6.fromList(u47.RAINBOW_LB_HIT_1, u47.RAINBOW_LB_HIT_2, u47.RAINBOW_LB_HIT_3))
    end,
    ["collectionServiceTags"] = { "LuckyBlock" },
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.RAINBOW },
        ["allowedPolarity"] = { v41.NEGATIVE }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 657
        }
    }
}
v949.block = v950
u93[v948] = v949
local v951 = u57.RAINBOW_POT_OF_GOLD
local v952 = {
    ["displayName"] = "Rainbow Pot of Gold"
}
local v953 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 1000,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 7044 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.RAINBOW_OPEN_POT_OF_GOLD)
    end,
    ["collectionServiceTags"] = { "LuckyBlock" },
    ["luckyBlock"] = {
        ["timeBetweenDropsSec"] = 0.2,
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            },
            {
                ["luckMultiplier"] = 2
            },
            {
                ["luckMultiplier"] = 4
            }
        },
        ["categories"] = { v40.RAINBOW },
        ["allowedPolarity"] = { v41.POSITIVE }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 658
        }
    }
}
v952.block = v953
u93[v951] = v952
u93[u57.RAINBOW_KEY] = {
    ["displayName"] = "Rainbow Key",
    ["image"] = "rbxassetid://12811672398",
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[u57.DRILL] = {
    ["displayName"] = "Drill",
    ["sharingDisabled"] = true,
    ["image"] = v35.Drill_RENDER
}
u93[u57.DRILL_CONTROLLER] = {
    ["displayName"] = "Tablet",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://7290617886",
    ["keepOnDeath"] = true
}
local v954 = u57.LANTERN_BLOCK
local v955 = {
    ["displayName"] = "Lantern Block",
    ["footstepSound"] = v46.STONE
}
local v956 = {
    ["health"] = 10,
    ["breakType"] = v2.DIRT,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 7094 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 123
        }
    },
    ["pointLight"] = {
        ["Brightness"] = 0.7,
        ["Shadows"] = true,
        ["Range"] = 27,
        ["Color"] = Color3.fromRGB(255, 194, 166)
    }
}
v955.block = v956
u93[v954] = v955
local v957 = u57.AQUAMARINE_LANTERN
local v958 = {
    ["displayName"] = "Aquamarine Lantern",
    ["footstepSound"] = v46.STONE
}
local v959 = {
    ["health"] = 10,
    ["breakType"] = v2.DIRT,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 7117 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 169
        }
    },
    ["pointLight"] = {
        ["Brightness"] = 0.7,
        ["Shadows"] = true,
        ["Range"] = 27,
        ["Color"] = Color3.fromRGB(219, 255, 255)
    }
}
v958.block = v959
u93[v957] = v958
local v960 = u57.GLOWSTONE
local v961 = {
    ["displayName"] = "Glowstone",
    ["footstepSound"] = v46.STONE
}
local v962 = {
    ["health"] = 10,
    ["breakType"] = v2.DIRT,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 7140 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["minecraftConversions"] = {
        {
            ["blockId"] = 89
        }
    },
    ["pointLight"] = {
        ["Brightness"] = 0.7,
        ["Shadows"] = true,
        ["Range"] = 27,
        ["Color"] = Color3.fromRGB(255, 247, 214)
    }
}
v961.block = v962
u93[v960] = v961
local v963 = u57.SAND_SPEAR
local v964 = {
    ["displayName"] = "Skorp Stinger",
    ["description"] = "Damages enemies and can be stuck to surfaces to bounce players into the air.",
    ["image"] = "rbxassetid://13034426218",
    ["maxStackSize"] = {
        ["amount"] = 99
    }
}
local v965 = {
    ["fireDelaySec"] = 0.7,
    ["maxStrengthChargeSec"] = 0.25,
    ["walkSpeedMultiplier"] = 0.7,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 7163 ]]
        return "sand_spear"
    end,
    ["ammoItemTypes"] = { u57.SAND_SPEAR },
    ["launchSound"] = { u47.SAND_SPEAR_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.SPEAR_THROW
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.SPEAR_THROW
    }
}
v964.projectileSource = v965
u93[v963] = v964
local v966 = u57.EGG_LAUNCHER
local v967 = {
    ["displayName"] = "Egg Launcher",
    ["image"] = "rbxassetid://13033176844",
    ["removeFromCustoms"] = true
}
local v968 = {
    ["fireDelaySec"] = 2.2,
    ["activeReload"] = true,
    ["projectileType"] = function() --[[ Name: projectileType, Line 7184 ]]
        return "easter_egg"
    end,
    ["ammoItemTypes"] = { u57.EASTER_EGG_PROJECTILE },
    ["launchSound"] = { u47.EGG_LAUNCH },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.ROCKET_LAUNCHER_SHOT,
        ["aimAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    }
}
v967.projectileSource = v968
u93[v966] = v967
u93[u57.EASTER_EGG_PROJECTILE] = {
    ["displayName"] = "EGG",
    ["image"] = "rbxassetid://13031413739",
    ["hotbarFillRight"] = true
}
local v969 = u57.FLOWER_BOW
local v970 = {
    ["displayName"] = "Floral Bow",
    ["sharingDisabled"] = true
}
local v972 = {
    ["fireDelaySec"] = 0.6,
    ["maxStrengthChargeSec"] = 0.65,
    ["minStrengthScalar"] = 0.3333333333333333,
    ["walkSpeedMultiplier"] = 0.35,
    ["multiShotChargeTime"] = 0.8,
    ["projectileType"] = function(p971) --[[ Name: projectileType, Line 7206 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p971 == u57.IRON_ARROW then
            return "flower_arrow_iron"
        end
        local _ = p971 == u57.ARROW
        return "flower_arrow"
    end,
    ["ammoItemTypes"] = { u57.ARROW, u57.IRON_ARROW },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["chargeBeginSound"] = { u47.BOW_DRAW },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.BOW_AIM,
        ["fireAnimation"] = u7.BOW_FIRE,
        ["drawAnimation"] = u7.BOW_DRAW
    }
}
v970.projectileSource = v972
v970.firstPerson = {
    ["verticalOffset"] = 0
}
v970.image = v35.FLOWER_BOW
u93[v969] = v970
local v973 = u57.FLOWER_CROSSBOW
local v974 = {
    ["displayName"] = "Floral Crossbow",
    ["sharingDisabled"] = true
}
local v976 = {
    ["walkSpeedMultiplier"] = 0.35,
    ["multiShotChargeTime"] = 1.3,
    ["projectileType"] = function(p975) --[[ Name: projectileType, Line 7240 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p975 == u57.IRON_ARROW then
            return "flower_crossbow_arrow_iron"
        end
        local _ = p975 == u57.ARROW
        return "flower_crossbow_arrow"
    end,
    ["ammoItemTypes"] = { u57.ARROW, u57.IRON_ARROW },
    ["fireDelaySec"] = u53.CROSSBOW_FIRE_DELAY,
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.CROSSBOW_AIM,
        ["fireAnimation"] = u7.CROSSBOW_FIRE
    }
}
v974.projectileSource = v976
v974.image = v35.FLOWER_CROSSBOW
u93[v973] = v974
local v977 = u57.FLOWER_HEADHUNTER
local v978 = {
    ["displayName"] = "Floral Headhunter",
    ["description"] = "Nature\'s adaptation of the legendary Headhunter. Attracts a swarm of bees!",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://13887697290"
}
local v980 = {
    ["walkSpeedMultiplier"] = 0.35,
    ["projectileType"] = function(p979) --[[ Name: projectileType, Line 7275 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p979 == u57.FIREWORK_ARROW then
            return "headhunter_firework_arrow"
        end
        if p979 == u57.IRON_ARROW then
            return "flower_headhunter_arrow_iron"
        end
        local _ = p979 == u57.ARROW
        return "flower_headhunter_arrow"
    end,
    ["ammoItemTypes"] = { u57.FIREWORK_ARROW, u57.ARROW, u57.IRON_ARROW },
    ["fireDelaySec"] = u53.HEADHUNTER_FIRE_DELAY,
    ["launchSound"] = {
        u47.HEADHUNTER_SHOOT_1,
        u47.HEADHUNTER_SHOOT_2,
        u47.HEADHUNTER_SHOOT_3,
        u47.HEADHUNTER_SHOOT_4
    },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM_FP,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT_FP
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT
    }
}
v978.projectileSource = v980
u93[v977] = v978
local v981 = u57.DESERT_POT
local v982 = {
    ["displayName"] = "Pot",
    ["footstepSound"] = v46.STONE,
    ["block"] = {
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8023
            }
        }
    }
}
u93[v981] = v982
local v983 = u57.PIRATE_GUNPOWDER_BARREL
local v984 = {
    ["displayName"] = "Gunpowder Barrel",
    ["image"] = "rbxassetid://13465460559",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["health"] = 1,
        ["disableInventoryPickup"] = true,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "ExplosiveBarrel" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8024
            }
        }
    },
    ["maxStackSize"] = {
        ["amount"] = 10
    }
}
u93[v983] = v984
u93[u57.ORANGE] = {
    ["displayName"] = "Health Orange",
    ["image"] = "rbxassetid://13465460651",
    ["description"] = "Consume to heal a small amount",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["requiresMissingHealth"] = true,
        ["consumeCooldown"] = 0.5
    },
    ["maxStackSize"] = {
        ["amount"] = 4
    }
}
local v985 = u57.TREASURE_CHEST
local v986 = {
    ["displayName"] = "Treasure Chest",
    ["image"] = "rbxassetid://13547810867",
    ["description"] = "Open for a chance at pirate\'s treasure",
    ["consumable"] = {
        ["consumeTime"] = 0.6,
        ["consumeCooldown"] = 0.5,
        ["soundOverride"] = "",
        ["walkSpeedMultiplier"] = 0,
        ["animationOverride"] = u7.USE_CROSS
    }
}
u93[v985] = v986
u93[u57.HEADHUNT_SKULL] = {
    ["displayName"] = "Skull",
    ["sharingDisabled"] = true,
    ["hotbarFillRight"] = true,
    ["description"] = "The skull of an enemy. Turn in at drop points to earn points",
    ["disableDroppedItemMerge"] = true,
    ["image"] = v35.CRYPT_SKULL_RENDER
}
local v987 = u57.MYSTERIOUS_BOX
local v988 = {
    ["displayName"] = "Mysterious Box",
    ["image"] = "rbxassetid://8273441274",
    ["sharingDisabled"] = true,
    ["consumable"] = {
        ["consumeTime"] = 0.5,
        ["soundOverride"] = "None",
        ["animationOverride"] = u7.OPEN_CRATE
    }
}
u93[v987] = v988
local v989 = u57.WIZARD_STICK
local v990 = {
    ["displayName"] = "Magic Wand",
    ["description"] = "Actually just an ordinary twig that can be found anywhere",
    ["image"] = "rbxassetid://13420388305",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true,
    ["sword"] = {
        ["damage"] = 13,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v989] = v990
local v991 = u57.MERCHANT_REGION
local v992 = {
    ["displayName"] = "Merchant Region Block",
    ["block"] = {
        ["breakType"] = v2.STONE
    }
}
u93[v991] = v992
u93[u57.MERCHANT_DAMAGE_BUFF] = {
    ["displayName"] = "Damage Buff",
    ["removeFromCustoms"] = true
}
u93[u57.MERCHANT_HEAL_BUFF] = {
    ["displayName"] = "Healing Buff",
    ["removeFromCustoms"] = true
}
local v993 = u57.HEADHUNTER
local v994 = {
    ["displayName"] = "Headhunter",
    ["description"] = "A legendary weapon of unmatched precision and deadly force, the Headhunter was crafted for the expert hunter. Hit headshots for massive damage!",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://13421692306"
}
local v996 = {
    ["walkSpeedMultiplier"] = 0.35,
    ["multiShotChargeTime"] = 2,
    ["projectileType"] = function(p995) --[[ Name: projectileType, Line 7411 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p995 == u57.FIREWORK_ARROW then
            return "headhunter_firework_arrow"
        end
        if p995 == u57.IRON_ARROW then
            return "headhunter_arrow_iron"
        end
        local _ = p995 == u57.ARROW
        return "headhunter_arrow"
    end,
    ["ammoItemTypes"] = { u57.FIREWORK_ARROW, u57.ARROW, u57.IRON_ARROW },
    ["fireDelaySec"] = u53.HEADHUNTER_FIRE_DELAY,
    ["launchSound"] = {
        u47.HEADHUNTER_SHOOT_1,
        u47.HEADHUNTER_SHOOT_2,
        u47.HEADHUNTER_SHOOT_3,
        u47.HEADHUNTER_SHOOT_4
    },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM_FP,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT_FP
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT
    }
}
v994.projectileSource = v996
v994.replaces = { u57.WOOD_CROSSBOW }
u93[v993] = v994
local v997 = u57.FORGE
local v998 = {
    ["displayName"] = "Forge",
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "forge-block" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8025
            }
        }
    }
}
u93[v997] = v998
local v999 = u57.CAKE_ONE
local v1000 = {
    ["displayName"] = "Cake",
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "cake" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8025
            }
        }
    }
}
u93[v999] = v1000
local v1001 = u57.CAKE_THREE
local v1002 = {
    ["displayName"] = "Cake",
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "cake" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8025
            }
        }
    }
}
u93[v1001] = v1002
local v1003 = u57.FLYING_LUCKY_BLOCK
local v1004 = {
    ["displayName"] = "Flying Lucky Block",
    ["image"] = "rbxassetid://17182946276"
}
local v1005 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 7487 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.LUCKY_BLOCK_BREAK)
    end,
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.FLYING }
    }
}
v1004.block = v1005
u93[v1003] = v1004
u93[u57.FLYING_CLOUD_DEPLOY] = {
    ["displayName"] = "Flying Cloud",
    ["image"] = "rbxassetid://13619831247",
    ["description"] = "Weaponized floating cloud of destruction",
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
local v1006 = u57.SKY_SCYTHE
local v1007 = {
    ["displayName"] = "Sky Scythe",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://13629036006",
    ["sword"] = {
        ["damage"] = 50,
        ["attackSpeed"] = 1,
        ["applyCooldownOnMiss"] = true,
        ["respectAttackSpeedForEffects"] = true,
        ["swingAnimations"] = { u7.INFERNO_SWORD_SPIN },
        ["firstPersonSwingAnimations"] = { u7.FP_INFERNO_SWORD_SPIN },
        ["swingSounds"] = { u47.SKY_SCYTHE_1, u47.SKY_SCYTHE_2, u47.SKY_SCYTHE_3 }
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1006] = v1007
u93[u57.FLYING_BACKPACK] = {
    ["displayName"] = "Flying Backpack",
    ["description"] = "It\'s got wings!",
    ["image"] = "rbxassetid://13630754419",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["backpack"] = {
        ["cooldown"] = 1,
        ["activeAbility"] = true
    }
}
local v1008 = u57.IMPULSE_GUN
local v1009 = {
    ["displayName"] = "Impulse Gun",
    ["description"] = "Use with caution.",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["thirdPerson"] = {
        ["holdAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    },
    ["image"] = v35.IMPULSE_GUN_RENDER
}
u93[v1008] = v1009
u93[u57.WOOD_DAGGER] = v65({
    ["displayName"] = "Wood Dagger",
    ["description"] = "Dash behind your enemy and strike them in the back for bonus damage.",
    ["damage"] = 8,
    ["image"] = v35.WOOD_DAGGER
})
u93[u57.STONE_DAGGER] = v65({
    ["displayName"] = "Stone Dagger",
    ["description"] = "Dash behind your enemy and strike them in the back for bonus damage. Downgrades to Wood Dagger on death.",
    ["damage"] = 11,
    ["image"] = v35.STONE_DAGGER,
    ["replaces"] = { u57.WOOD_DAGGER }
})
u93[u57.IRON_DAGGER] = v65({
    ["displayName"] = "Iron Dagger",
    ["description"] = "Dash behind your enemy and strike them in the back for bonus damage. Downgrades to Stone Dagger on death.",
    ["damage"] = 15,
    ["image"] = v35.IRON_DAGGER,
    ["replaces"] = { u57.WOOD_DAGGER, u57.STONE_DAGGER }
})
u93[u57.DIAMOND_DAGGER] = v65({
    ["displayName"] = "Diamond Dagger",
    ["description"] = "Dash behind your enemy and strike them in the back for bonus damage. Downgrades to Iron Dagger on death.",
    ["damage"] = 21,
    ["image"] = v35.DIAMOND_DAGGER,
    ["replaces"] = { u57.WOOD_DAGGER, u57.STONE_DAGGER, u57.IRON_DAGGER }
})
local v1010 = u57.MYTHIC_DAGGER
local v1011 = {
    ["displayName"] = "Deathbloom",
    ["damage"] = 28,
    ["image"] = v35.MYTHIC_DAGGER,
    ["replaces"] = {
        u57.WOOD_DAGGER,
        u57.STONE_DAGGER,
        u57.IRON_DAGGER,
        u57.DIAMOND_DAGGER
    }
}
local v1012 = {
    ["collection"] = v37.MYTHIC_WEAPON
}
local v1013 = v13[u57.MYTHIC_DAGGER].poisonDurationSec
v1012.summary = "Dagger that applies " .. tostring(v1013) .. "s of poison on hit. Downgrades to Diamond Dagger on death."
v1011.itemCatalog = v1012
u93[v1010] = v65(v1011)
u93[u57.WOOD_SCYTHE] = v84({
    ["displayName"] = "Wood Scythe",
    ["description"] = "Attack enemies from farther away and pull them toward you.",
    ["damage"] = 20,
    ["image"] = v35.WOOD_SCYTHE
})
u93[u57.STONE_SCYTHE] = v84({
    ["displayName"] = "Stone Scythe",
    ["description"] = "Attack enemies from farther away and pull them toward you. Downgrades to Wood Scythe on death.",
    ["damage"] = 25,
    ["image"] = v35.STONE_SCYTHE,
    ["replaces"] = { u57.STONE_SCYTHE }
})
u93[u57.IRON_SCYTHE] = v84({
    ["displayName"] = "Iron Scythe",
    ["description"] = "Attack enemies from farther away and pull them toward you. Downgrades to Stone Scythe on death.",
    ["damage"] = 30,
    ["image"] = v35.IRON_SCYTHE,
    ["replaces"] = { u57.STONE_SCYTHE, u57.STONE_SCYTHE }
})
u93[u57.DIAMOND_SCYTHE] = v84({
    ["displayName"] = "Diamond Scythe",
    ["description"] = "Attack enemies from farther away and pull them toward you. Downgrades to Iron Scythe on death.",
    ["damage"] = 42,
    ["image"] = v35.DIAMOND_SCYTHE,
    ["replaces"] = { u57.STONE_SCYTHE, u57.STONE_SCYTHE, u57.IRON_SCYTHE }
})
local v1014 = u57.MYTHIC_SCYTHE
local v1015 = {
    ["displayName"] = "Nocturne",
    ["damage"] = 54,
    ["description"] = "The Nocturne\'s charged attack ignores a large amount of the enemy\'s armor. Downgrades to Diamond Scythe on death.",
    ["image"] = v35.MYTHIC_SCYTHE,
    ["replaces"] = {
        u57.STONE_SCYTHE,
        u57.STONE_SCYTHE,
        u57.IRON_SCYTHE,
        u57.DIAMOND_SCYTHE
    },
    ["itemCatalog"] = {
        ["collection"] = v37.MYTHIC_WEAPON
    }
}
u93[v1014] = v84(v1015)
u93[u57.HOT_AIR_BALLOON_DEPLOY] = {
    ["displayName"] = "Hot Air Balloon",
    ["image"] = "rbxassetid://13701861348",
    ["description"] = "Take your whole team to the skies!",
    ["consumable"] = {
        ["consumeTime"] = 2,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
local v1016 = u57.SPIRIT_BRIDGE
local v1017 = {
    ["displayName"] = "Spirit Bridge",
    ["description"] = "",
    ["image"] = "rbxassetid://13835255693",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 2
    },
    ["projectileSource"] = {
        ["fireDelaySec"] = 1,
        ["maxStrengthChargeSec"] = 1,
        ["minStrengthScalar"] = 0.5,
        ["walkSpeedMultiplier"] = 0.6,
        ["projectileType"] = function() --[[ Name: projectileType, Line 7645 ]]
            return "spirit_bridge"
        end,
        ["ammoItemTypes"] = { u57.SPIRIT_BRIDGE },
        ["launchSound"] = { u47.NEW_BOW_FIRE }
    }
}
u93[v1016] = v1017
local v1018 = u57.TEAM_CRATE
local v1019 = {
    ["displayName"] = "Team Crate",
    ["image"] = "rbxassetid://14146743816",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 30,
        ["seeThrough"] = true,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "chest", "team-crate" }
    }
}
u93[v1018] = v1019
local v1020 = u57.OG_WOOD_CROSSBOW
local v1021 = {
    ["displayName"] = "Crossbow",
    ["image"] = "rbxassetid://6869295265",
    ["sharingDisabled"] = true
}
local v1023 = {
    ["walkSpeedMultiplier"] = 0.35,
    ["multiShotChargeTime"] = 1.6,
    ["projectileType"] = function(p1022) --[[ Name: projectileType, Line 7671 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p1022 == u57.FIREWORK_ARROW then
            return "crossbow_firework_arrow"
        end
        if p1022 == u57.VOLLEY_ARROW then
            return "volley_arrow"
        end
        if p1022 == u57.IRON_ARROW then
            return "crossbow_arrow_iron"
        end
        local _ = p1022 == u57.ARROW
        return "crossbow_arrow"
    end,
    ["ammoItemTypes"] = { u57.ARROW },
    ["fireDelaySec"] = u53.CROSSBOW_FIRE_DELAY,
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.CROSSBOW_AIM,
        ["fireAnimation"] = u7.CROSSBOW_FIRE
    }
}
v1021.projectileSource = v1023
u93[v1020] = v1021
local v1024 = u57.OG_DIAMOND_SWORD
local v1025 = {
    ["displayName"] = "Diamond Sword",
    ["image"] = "rbxassetid://6875481413",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 35,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1024] = v1025
local v1026 = u57.OG_EMERALD_SWORD
local v1027 = {
    ["displayName"] = "Emerald Sword",
    ["image"] = "rbxassetid://6931677551",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 47,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1026] = v1027
u93[u57.CAN_OF_BEANS] = {
    ["displayName"] = "Can of beans",
    ["description"] = "Explosive!",
    ["image"] = v35.CAN_OF_BEANS,
    ["consumable"] = {
        ["consumeTime"] = 0.5
    }
}
local v1028 = u57.CONDIMENT_GUN
local v1029 = {
    ["displayName"] = "Condiment Gun",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://14191270899",
    ["firstPerson"] = {
        ["holdAnimation"] = u7.CONDIMENT_GUN_FP
    }
}
u93[v1028] = v1029
local v1030 = u57.HOTDOG_BAT
local v1031 = {
    ["displayName"] = "Hotdog Bat",
    ["description"] = "The time has come to play with your food",
    ["image"] = "rbxassetid://14191270696"
}
local v1032 = {
    ["respectAttackSpeedForEffects"] = true,
    ["applyCooldownOnMiss"] = true,
    ["damage"] = v12.ATTACK_DAMAGE,
    ["attackSpeed"] = v12.ATTACK_SPEED,
    ["attackRange"] = v12.ATTACK_RANGE,
    ["swingSounds"] = {},
    ["swingAnimations"] = { u7.INFERNO_SWORD_SPIN },
    ["firstPersonSwingAnimations"] = { u7.FP_INFERNO_SWORD_SPIN },
    ["knockbackMultiplier"] = {
        ["horizontal"] = v12.HORIZONTAL_KNOCKBACK,
        ["vertical"] = v12.VERTICAL_KNOCKBACK
    }
}
local v1033 = {
    ["maxChargeTimeSec"] = v12.MAX_CHARGE_TIME,
    ["minChargeTimeSec"] = v12.MIN_CHARGE_TIME,
    ["attackCooldown"] = v12.CHARGED_ATTACK_COOLDOWN,
    ["bonusKnockback"] = {
        ["horizontal"] = v12.HORIZONTAL_KNOCKBACK,
        ["vertical"] = v12.VERTICAL_KNOCKBACK
    },
    ["walkSpeedModifier"] = {
        ["multiplier"] = v12.CHARGED_WALK_SPEED_MULTIPLIER
    },
    ["chargingEffects"] = {
        ["thirdPersonAnim"] = u7.INFERNO_SWORD_CHARGE,
        ["firstPersonAnim"] = u7.FP_INFERNO_SWORD_CHARGE,
        ["sound"] = u47.FRYING_PAN_CHARGE
    },
    ["chargedSwingAnimations"] = { u7.INFERNO_SWORD_SPIN },
    ["firstPersonChargedSwingAnimations"] = { u7.FP_INFERNO_SWORD_SPIN },
    ["chargedSwingSounds"] = {}
}
v1032.chargedAttack = v1033
v1031.sword = v1032
v1031.firstPerson = {
    ["scale"] = 0.8,
    ["verticalOffset"] = -1.2
}
u93[v1030] = v1031
local v1034 = u57.BACON_BLADE
local v1035 = {
    ["displayName"] = "Bacon Blade",
    ["image"] = "rbxassetid://14839882835",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = v9.ATTACK_DAMAGE,
        ["attackSpeed"] = v9.SWING_COOLDOWN,
        ["swingSounds"] = {
            u47.BACON_BLADE_SWING_1,
            u47.BACON_BLADE_SWING_2,
            u47.BACON_BLADE_SWING_3,
            u47.BACON_BLADE_SWING_4
        },
        ["hitSound"] = u47.BACON_BLADE_HIT_2
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1034] = v1035
local v1036 = u57.FOOD_LUCKY_BLOCK
local v1037 = {
    ["displayName"] = "Food Lucky Block"
}
local v1038 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 7812 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.LUCKY_BLOCK_BREAK)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.FOOD }
    }
}
v1037.block = v1038
u93[v1036] = v1037
local v1039 = u57.FORK_TRIDENT
local v1040 = {
    ["displayName"] = "Fork Trident",
    ["description"] = "A trident worthy of a feast",
    ["image"] = "rbxassetid://14315230530",
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
local v1041 = {
    ["respectAttackSpeedForEffects"] = true,
    ["applyCooldownOnMiss"] = true,
    ["damage"] = v38.BASE_ATTACK_DAMAGE,
    ["knockbackMultiplier"] = {
        ["horizontal"] = v38.KNOCKBACK_HORIZONTAL_MULTIPLIER
    },
    ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN,
    ["attackRange"] = v38.ATTACK_RANGE,
    ["swingAnimations"] = { u7.TWIRLBLADE_ATTACK_1, u7.TWIRLBLADE_ATTACK_2 },
    ["firstPersonSwingAnimations"] = { u7.FP_TWIRLBLADE_ATTACK_1, u7.FP_TWIRLBLADE_ATTACK_2 },
    ["swingSounds"] = {}
}
local v1042 = {
    ["minChargeTimeSec"] = v38.MIN_CHARGE_TIME,
    ["maxChargeTimeSec"] = v38.MAX_CHARGE_TIME,
    ["attackCooldown"] = v38.CHARGED_ATTACK_COOLDOWN,
    ["walkSpeedModifier"] = {
        ["multiplier"] = v38.CHARGING_WALK_SPEED_MULTIPLIER
    },
    ["chargedSwingAnimations"] = { u7.SPEAR_THROW },
    ["firstPersonChargedSwingAnimations"] = { u7.FP_DAGGER_SLASH },
    ["chargedSwingSounds"] = { u47.FORK_TRIDENT_THROW },
    ["chargingEffects"] = {
        ["firstPersonAnim"] = u7.FP_DAGGER_CHARGE,
        ["thirdPersonAnim"] = u7.SPEAR_STARTUP
    }
}
v1041.chargedAttack = v1042
v1040.sword = v1041
v1040.projectileSource = {
    ["fireDelaySec"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 7865 ]]
        return "fork_trident_projectile"
    end,
    ["ammoItemTypes"] = { u57.FORK_TRIDENT }
}
v1040.firstPerson = {
    ["scale"] = 0.8
}
u93[v1039] = v1040
u93[u57.FORK_TRIDENT_PROJECTILE] = {
    ["displayName"] = "Fork Trident Projectile"
}
local v1043 = u57.GUMBALL_LAUNCHER
local v1044 = {
    ["displayName"] = "Gumball Launcher",
    ["image"] = "rbxassetid://14193833399",
    ["projectileSource"] = {
        ["fireDelaySec"] = 1.5,
        ["walkSpeedMultiplier"] = 0.35,
        ["multiShotChargeTime"] = 1,
        ["projectileType"] = function() --[[ Name: projectileType, Line 7881 ]]
            return "gumball"
        end,
        ["launchSound"] = { u47.GUMBALL_LAUNCHER_SHOT_1, u47.GUMBALL_LAUNCHER_SHOT_2, u47.GUMBALL_LAUNCHER_SHOT_3 }
    },
    ["thirdPerson"] = {
        ["holdAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    },
    ["firstPerson"] = {
        ["verticalOffset"] = 0
    }
}
u93[v1043] = v1044
local v1045 = u57.GUM_BLOCK
local v1046 = {
    ["displayName"] = "Gum Block",
    ["footstepSound"] = v46.GUM,
    ["block"] = {
        ["disableInventoryPickup"] = true,
        ["disableEnemyInventoryPickup"] = true,
        ["health"] = 4,
        ["breakType"] = v2.WOOL,
        ["hitSound"] = function() --[[ Name: hitSound, Line 7902 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GUMBALL_LAUNCHER_SPLATTER_1)
        end,
        ["collectionServiceTags"] = { "GumBlock" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8026
            }
        }
    }
}
u93[v1045] = v1046
local v1047 = u57.RADIOACTIVE_PLANT
local v1048 = {
    ["displayName"] = "Radioactive Plant",
    ["image"] = "rbxassetid://14399105222",
    ["description"] = "Consumes Iron and Diamonds to deal radiation damage to nearby enemy players and blocks.",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 18,
        ["disableInventoryPickup"] = true,
        ["maxPlaced"] = 2,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 7920 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "radioactive-plant" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8027
            }
        }
    }
}
u93[v1047] = v1048
local v1049 = u57.BARBARIAN_HELMET
local v1050 = {
    ["displayName"] = "Barbarian Helmet",
    ["image"] = "rbxassetid://14559460074",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 1,
        ["slot"] = v36.HELMET
    }
}
u93[v1049] = v1050
local v1051 = u57.NEST
local v1052 = {
    ["displayName"] = "Nest",
    ["block"] = {
        ["breakType"] = v2.WOOL
    }
}
u93[v1051] = v1052
local v1053 = u57.BROKEN_ARROW_BOARD
local v1054 = {
    ["displayName"] = "Broken Arrow Board",
    ["block"] = {
        ["breakType"] = v2.WOOL,
        ["collectionServiceTags"] = { "ArrowBoard" }
    }
}
u93[v1053] = v1054
local v1055 = u57.ARROW_BOARD
local v1056 = {
    ["displayName"] = "Arrow Board",
    ["block"] = {
        ["breakType"] = v2.WOOL,
        ["collectionServiceTags"] = { "ArrowBoard" }
    }
}
u93[v1055] = v1056
u93[u57.WOOD_GAUNTLETS] = v92({
    ["displayName"] = "Wood Gauntlets",
    ["description"] = "Punch rapidly to deal more damage with combos.",
    ["image"] = "rbxassetid://14839095983",
    ["damage"] = 16
})
u93[u57.STONE_GAUNTLETS] = v92({
    ["displayName"] = "Stone Gauntlets",
    ["description"] = "Punch rapidly to deal more damage with combos. Downgrades to Wood Gauntlets upon death.",
    ["image"] = "rbxassetid://14839096152",
    ["damage"] = 20,
    ["replaces"] = { u57.WOOD_GAUNTLETS }
})
u93[u57.IRON_GAUNTLETS] = v92({
    ["displayName"] = "Iron Gauntlets",
    ["description"] = "Punch rapidly to deal more damage with combos. Downgrades to Stone Gauntlets upon death.",
    ["image"] = "rbxassetid://14839144410",
    ["damage"] = 24,
    ["replaces"] = { u57.WOOD_GAUNTLETS, u57.STONE_GAUNTLETS }
})
u93[u57.DIAMOND_GAUNTLETS] = v92({
    ["displayName"] = "Diamond Gauntlets",
    ["description"] = "Punch rapidly to deal more damage with combos. Downgrades to Iron Gauntlets upon death.",
    ["image"] = "rbxassetid://14839096364",
    ["damage"] = 34,
    ["replaces"] = { u57.WOOD_GAUNTLETS, u57.STONE_GAUNTLETS, u57.IRON_GAUNTLETS }
})
local v1057 = u57.MYTHIC_GAUNTLETS_PLAIN
local v1058 = {
    ["displayName"] = "Warfist",
    ["image"] = "rbxassetid://14839096268",
    ["damage"] = 45,
    ["description"] = "The Warfists have a charged attack that breaks blocks and damages enemies in front of you. Downgrades to Diamond Gauntlets upon death.",
    ["replaces"] = {
        u57.WOOD_GAUNTLETS,
        u57.STONE_GAUNTLETS,
        u57.IRON_GAUNTLETS,
        u57.DIAMOND_GAUNTLETS
    },
    ["itemCatalog"] = {
        ["collection"] = v37.MYTHIC_WEAPON
    }
}
u93[v1057] = v92(v1058)
local v1059 = u57.MYTHIC_GAUNTLETS
local v1060 = {
    ["displayName"] = "Warfists",
    ["image"] = "rbxassetid://14839096268",
    ["damage"] = 45,
    ["description"] = "The Warfists have a charged attack that breaks blocks and damages enemies in front of you. Downgrades to Diamond Gauntlets upon death.",
    ["replaces"] = {
        u57.WOOD_GAUNTLETS,
        u57.STONE_GAUNTLETS,
        u57.IRON_GAUNTLETS,
        u57.DIAMOND_GAUNTLETS
    },
    ["itemCatalog"] = {
        ["collection"] = v37.MYTHIC_WEAPON
    }
}
u93[v1059] = v92(v1060)
local v1061 = u57.SPIDER_WEB
local v1062 = {
    ["displayName"] = "Spider Web",
    ["description"] = "When an enemy steps on the Spider Web trap they will be stunned and attacked by a spider.",
    ["image"] = "rbxassetid://15056224013",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 1,
        ["maxPlaced"] = 7,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 8016 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "spider_web" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8003
            }
        }
    },
    ["maxStackSize"] = {
        ["amount"] = 7
    }
}
u93[v1061] = v1062
u93[u57.BLOCK_RADAR] = {
    ["displayName"] = "Block Radar",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://14985503526"
}
u93[u57.BLOCK_HUNT_COIN] = {
    ["displayName"] = "Coin",
    ["image"] = "rbxassetid://14978481303",
    ["hotbarFillRight"] = true,
    ["keepOnDeath"] = true,
    ["sharingDisabled"] = true,
    ["displayNameColor"] = Color3.fromRGB(255, 209, 0),
    ["disableDroppingInQueues"] = { v20.BLOCK_HUNT }
}
local v1063 = u57.BARREL
local v1064 = {
    ["displayName"] = "Barrel",
    ["footstepSound"] = v46.WOOD
}
local v1065 = {
    ["breakType"] = v2.WOOD,
    ["placeSound"] = function() --[[ Name: placeSound, Line 8050 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 84
        }
    }
}
v1064.block = v1065
u93[v1063] = v1064
local v1066 = u57.HAYBALE
local v1067 = {
    ["displayName"] = "Haybale",
    ["footstepSound"] = v46.GRASS
}
local v1068 = {
    ["breakType"] = v2.DIRT,
    ["placeSound"] = function() --[[ Name: placeSound, Line 8066 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 170
        }
    }
}
v1067.block = v1068
u93[v1066] = v1067
local v1069 = u57.PUMPKIN_BLOCK
local v1070 = {
    ["displayName"] = "Pumpkin Block",
    ["footstepSound"] = v46.WOOD
}
local v1071 = {
    ["breakType"] = v2.WOOD,
    ["placeSound"] = function() --[[ Name: placeSound, Line 8082 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 86
        }
    }
}
v1070.block = v1071
u93[v1069] = v1070
u93[u57.BLOCK_HUNT_CHAMELEON_FRUIT] = {
    ["displayName"] = "Chameleon Fruit",
    ["image"] = "rbxassetid://14983595388",
    ["removeFromCustoms"] = true,
    ["consumable"] = {
        ["consumeTime"] = 1
    },
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
local v1072 = u57.HUNTERS_ECHO
local v1073 = {
    ["displayName"] = "Hunter\'s Echo",
    ["description"] = "Emit a global echo that will briefly reveal all hiders",
    ["image"] = "rbxassetid://14978481226",
    ["consumable"] = {
        ["consumeTime"] = 2,
        ["cancelOnDamage"] = true,
        ["disableSoundRepeat"] = true,
        ["closeOnComplete"] = true,
        ["animationOverride"] = u7.ZEN_HOVER,
        ["soundOverride"] = u47.SPIRIT_EFFECT
    }
}
u93[v1072] = v1073
u93[u57.WARLOCK_STAFF] = {
    ["displayName"] = "Warlock Staff",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://15186577197",
    ["keepOnDeath"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["firstPerson"] = {
        ["scale"] = 0.7,
        ["verticalOffset"] = 0.6
    }
}
local v1074 = u57.CURSED_COFFIN
local v1075 = {
    ["displayName"] = "Cursed Coffin",
    ["image"] = "rbxassetid://15105666015",
    ["description"] = "A chilling chest. Place it down to embrace the night...and become a vampire.",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["blastResistance"] = 10000000,
        ["health"] = 25,
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["unbreakableByTeammates"] = true,
        ["maxPlaced"] = 1,
        ["breakType"] = v2.WOOD,
        ["placeSound"] = function() --[[ Name: placeSound, Line 8137 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.CURSED_COFFIN_PLACE)
        end,
        ["hitSound"] = function() --[[ Name: hitSound, Line 8140 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "cursed-coffin" }
    },
    ["itemCatalog"] = {
        ["collection"] = v37.HALLOWEEN_LUCKY_BLOCK
    }
}
u93[v1074] = v1075
local v1076 = u57.GRIMOIRE
local v1077 = {
    ["displayName"] = "Grimoire",
    ["image"] = "rbxassetid://15107951466",
    ["description"] = "An ancient tome of dark magic. Gain a long-term power and a temporary curse.",
    ["consumable"] = {
        ["consumeTime"] = 1.5,
        ["animationOverride"] = u7.BOOK_READ,
        ["soundOverride"] = u47.GRIMOIRE_CASTING
    },
    ["itemCatalog"] = {
        ["collection"] = v37.HALLOWEEN_LUCKY_BLOCK
    }
}
u93[v1076] = v1077
local v1078 = u57.GROWING_HALLOWEEN_LUCKY_BLOCK
local v1079 = {
    ["displayName"] = "Growing Halloween Lucky Block",
    ["block"] = {
        ["unbreakable"] = true,
        ["denyPlaceOn"] = true,
        ["seeThrough"] = true,
        ["collectionServiceTags"] = { "GrowingHalloweenLuckyBlock" },
        ["breakType"] = v2.DIRT
    }
}
u93[v1078] = v1079
local v1080 = u57.HALLOWEEN_LUCKY_BLOCK
local v1081 = {
    ["displayName"] = "Halloween Lucky Block",
    ["image"] = "rbxassetid://15093670805"
}
local v1082 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 8184 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u6
            [3] = u47
        --]]
        return u54(u6.fromList(u47.HALLOWEEN_LUCKY_BLOCK_HIT_1, u47.HALLOWEEN_LUCKY_BLOCK_HIT_2, u47.HALLOWEEN_LUCKY_BLOCK_HIT_3))
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.HALLOWEEN }
    },
    ["collectionServiceTags"] = { "HalloweenLuckyBlock" }
}
v1081.block = v1082
u93[v1080] = v1081
local v1083 = u57.FLYING_BROOM_DEPLOY
local v1084 = {
    ["displayName"] = "Flying Broom",
    ["image"] = "rbxassetid://15115405598",
    ["description"] = "Clean up the skies with a flying broom!",
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    },
    ["itemCatalog"] = {
        ["collection"] = v37.HALLOWEEN_LUCKY_BLOCK
    }
}
u93[v1083] = v1084
local v1085 = u57.GHOST_ORB
local v1086 = {
    ["displayName"] = "Ghost Orb",
    ["image"] = "rbxassetid://15122215131",
    ["description"] = "A spectral orb that when hurled, turns players ghostly, making them float!",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 1,
        ["minStrengthScalar"] = 0.3333333333333333,
        ["walkSpeedMultiplier"] = 0.4,
        ["projectileType"] = function() --[[ Name: projectileType, Line 8220 ]]
            return "ghost_orb"
        end,
        ["ammoItemTypes"] = { u57.GHOST_ORB },
        ["launchSound"] = { u47.SWORD_SWING_1 }
    },
    ["itemCatalog"] = {
        ["collection"] = v37.HALLOWEEN_LUCKY_BLOCK
    }
}
u93[v1085] = v1086
local v1087 = u57.LIGHTNING_COIL
local v1088 = {
    ["displayName"] = "Frankenstein Lightning Coil",
    ["image"] = "rbxassetid://15122132404",
    ["description"] = "Shocking for all players!",
    ["block"] = {
        ["blastProof"] = true,
        ["disableInventoryPickup"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 8240 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["health"] = v11.LIGHTNING_COIL_HEALTH,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8028
            }
        }
    },
    ["itemCatalog"] = {
        ["collection"] = v37.HALLOWEEN_LUCKY_BLOCK
    }
}
u93[v1087] = v1088
local v1089 = u57.BLOCK_KICKER_BOOT
local v1090 = {
    ["displayName"] = "Boot",
    ["image"] = "rbxassetid://6874272718",
    ["sharingDisabled"] = true
}
local v1091 = {
    ["fireDelaySec"] = 0.5,
    ["minStrengthScalar"] = 0.5,
    ["walkSpeedMultiplier"] = 0.01,
    ["projectileType"] = function(_) --[[ Name: projectileType, Line 8257 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        return u57.BLOCK_KICKER_BLOCK
    end,
    ["maxStrengthChargeSec"] = v27.KICK_BLOCK_CHARGE_TIME,
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["chargeBeginSound"] = { u47.BOW_DRAW },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.BOW_AIM,
        ["fireAnimation"] = u7.BOW_FIRE,
        ["drawAnimation"] = u7.BOW_DRAW
    }
}
v1090.projectileSource = v1091
v1090.firstPerson = {
    ["verticalOffset"] = 0
}
u93[v1089] = v1090
u93[u57.BLOCK_KICKER_BLOCK] = {
    ["displayName"] = "Block Kicker Block",
    ["image"] = "rbxassetid://6869295400",
    ["hotbarFillRight"] = true,
    ["sharingDisabled"] = true
}
local v1092 = u57.GATHER_BOT_BASIC
local v1093 = {
    ["displayName"] = "Dimmy-X1",
    ["image"] = "rbxassetid://15359021293",
    ["description"] = "A robot that locates diamonds and returns them to the team crate",
    ["sharingDisabled"] = true,
    ["enablePersonalChest"] = true,
    ["consumable"] = {
        ["consumeTime"] = 1.8,
        ["walkSpeedMultiplier"] = 0,
        ["disableSoundRepeat"] = true,
        ["disableJump"] = true,
        ["animationOverride"] = u7.GATHER_BOT_CONSTRUCTION,
        ["soundOverride"] = u47.GATHER_BOT_CONSTRUCTION
    }
}
u93[v1092] = v1093
local v1094 = u57.GATHER_BOT_PRO
local v1095 = {
    ["displayName"] = "Emmy-Z2",
    ["image"] = "rbxassetid://15359021160",
    ["description"] = "A robot that locates emeralds and returns them to the personal crate",
    ["sharingDisabled"] = true,
    ["enablePersonalChest"] = true,
    ["consumable"] = {
        ["consumeTime"] = 1.8,
        ["walkSpeedMultiplier"] = 0,
        ["disableSoundRepeat"] = true,
        ["disableJump"] = true,
        ["animationOverride"] = u7.GATHER_BOT_CONSTRUCTION,
        ["soundOverride"] = u47.GATHER_BOT_CONSTRUCTION
    }
}
u93[v1094] = v1095
u93[u57.HEALING_SLIME] = {
    ["displayName"] = "Blessed Slime",
    ["description"] = "Restores teammate\'s missing health.",
    ["image"] = "rbxassetid://15295059428",
    ["removeFromCustoms"] = true
}
u93[u57.VOID_SLIME] = {
    ["displayName"] = "Void Slime",
    ["description"] = "Boosts damage of teammate.",
    ["image"] = "rbxassetid://15295057154",
    ["removeFromCustoms"] = true
}
u93[u57.STICKY_SLIME] = {
    ["displayName"] = "Sticky Slime",
    ["description"] = "Attracts nearby resources with a chance to duplicate them.",
    ["image"] = "rbxassetid://15295064061",
    ["removeFromCustoms"] = true
}
u93[u57.FROSTY_SLIME] = {
    ["displayName"] = "Frosty Slime",
    ["description"] = "Slows the movement speed of enemies hit by this teammate.",
    ["image"] = "rbxassetid://15295050177",
    ["removeFromCustoms"] = true
}
u93[u57.SLIME_TAMER_FLUTE] = {
    ["displayName"] = "Slime Tamer\'s Flute",
    ["description"] = "Used to direct slimes around.",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://15295083414"
}
local v1096 = u57.DIAMOND_CAPTURE_BLOCK
local v1097 = {
    ["displayName"] = "Diamond Capture Block",
    ["removeFromCustoms"] = true,
    ["block"] = {
        ["breakType"] = v2.STONE
    }
}
u93[v1096] = v1097
local v1098 = u57.FROZEN_FORTRESS
local v1099 = {
    ["image"] = "rbxassetid://15625717321",
    ["displayName"] = "Frozen Fortress",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 8355 ]]
            return "frozen_fortress"
        end,
        ["ammoItemTypes"] = { u57.FROZEN_FORTRESS },
        ["launchSound"] = { u47.SWORD_SWING_1 }
    }
}
u93[v1098] = v1099
local v1100 = u57.HOT_CHOCOLATE
local v1101 = {
    ["displayName"] = "Hot Chocolate",
    ["description"] = "Drink to gain protection from the snow!",
    ["image"] = "rbxassetid://15625715830",
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["potion"] = true,
        ["soundOverride"] = u6.fromList(u47.HOT_CHOCOLATE_SIP_1, u47.HOT_CHOCOLATE_SIP_2, u47.HOT_CHOCOLATE_SIP_3)
    }
}
u93[v1100] = v1101
local v1102 = u57.NINJA_CHAKRAM_1
local v1103 = {
    ["displayName"] = "Stone Chakram",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://15515026452"
}
local v1104 = {
    ["fireDelaySec"] = 0.4,
    ["walkSpeedMultiplier"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 8380 ]]
        return "ninja_chakram_1"
    end,
    ["maxStrengthChargeSec"] = v29.CHAKRAM_TIME_TO_FULL_CHARGE,
    ["minStrengthScalar"] = v29.CHAKRAM_VELOCITY_MIN / v29.CHAKRAM_VELOCITY_MAX,
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_LASSO_CHARGE,
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v1103.projectileSource = v1104
u93[v1102] = v1103
local v1105 = u57.NINJA_CHAKRAM_2
local v1106 = {
    ["displayName"] = "Iron Chakram",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://15515025342"
}
local v1107 = {
    ["fireDelaySec"] = 0.4,
    ["walkSpeedMultiplier"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 8398 ]]
        return "ninja_chakram_2"
    end,
    ["maxStrengthChargeSec"] = v29.CHAKRAM_TIME_TO_FULL_CHARGE,
    ["minStrengthScalar"] = v29.CHAKRAM_VELOCITY_MIN / v29.CHAKRAM_VELOCITY_MAX,
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_LASSO_CHARGE,
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v1106.projectileSource = v1107
u93[v1105] = v1106
local v1108 = u57.NINJA_CHAKRAM_3
local v1109 = {
    ["displayName"] = "Diamond Chakram",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://15515023612"
}
local v1110 = {
    ["fireDelaySec"] = 0.4,
    ["walkSpeedMultiplier"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 8416 ]]
        return "ninja_chakram_3"
    end,
    ["maxStrengthChargeSec"] = v29.CHAKRAM_TIME_TO_FULL_CHARGE,
    ["minStrengthScalar"] = v29.CHAKRAM_VELOCITY_MIN / v29.CHAKRAM_VELOCITY_MAX,
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_LASSO_CHARGE,
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v1109.projectileSource = v1110
u93[v1108] = v1109
local v1111 = u57.NINJA_CHAKRAM_4
local v1112 = {
    ["displayName"] = "Emerald Chakram",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://15515027427"
}
local v1113 = {
    ["fireDelaySec"] = 0.4,
    ["walkSpeedMultiplier"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 8434 ]]
        return "ninja_chakram_4"
    end,
    ["maxStrengthChargeSec"] = v29.CHAKRAM_TIME_TO_FULL_CHARGE,
    ["minStrengthScalar"] = v29.CHAKRAM_VELOCITY_MIN / v29.CHAKRAM_VELOCITY_MAX,
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_LASSO_CHARGE,
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v1112.projectileSource = v1113
u93[v1111] = v1112
local v1114 = u57.BANANARANG
local v1115 = {
    ["displayName"] = "Bananarang",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://115717861330143",
    ["description"] = "Go bananas with this bundle of boomerangs!"
}
local v1116 = {
    ["fireDelaySec"] = 0.3,
    ["maxStrengthChargeSec"] = 1,
    ["minStrengthScalar"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 8453 ]]
        return "bananarang"
    end,
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_LASSO_CHARGE,
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v1115.projectileSource = v1116
local v1117 = {
    {
        ["tierDescription"] = { "Increased damage" }
    },
    {
        ["tierDescription"] = { "Can now throw 2 bananarangs at a time" }
    },
    {
        ["tierDescription"] = { "Increased damage", "Increased knockback" }
    }
}
v1115.tierUpgradeElements = v1117
u93[v1114] = v1115
local v1118 = u57.BED_GADGET
local v1119 = {
    ["displayName"] = "Bed Gadget",
    ["description"] = "Used to create a bed at its position.",
    ["image"] = "rbxassetid://15579417392",
    ["gadget"] = true,
    ["block"] = {
        ["breakableOnlyByHosts"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 9003
            }
        },
        ["collectionServiceTags"] = { "CreativeGadget" }
    }
}
u93[v1118] = v1119
local v1120 = u57.SPAWN_GADGET
local v1121 = {
    ["displayName"] = "Team Spawn Gadget",
    ["description"] = "Used to set a team spawn location at its position.",
    ["image"] = "rbxassetid://15579417392",
    ["gadget"] = true,
    ["block"] = {
        ["breakableOnlyByHosts"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 9004
            }
        },
        ["collectionServiceTags"] = { "CreativeGadget" }
    }
}
u93[v1120] = v1121
local v1122 = u57.GLOBAL_GENERATOR_GADGET
local v1123 = {
    ["displayName"] = "Global Generator Gadget",
    ["description"] = "Used to create a global generator above its position.",
    ["image"] = "rbxassetid://15579417392",
    ["gadget"] = true,
    ["block"] = {
        ["breakableOnlyByHosts"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 9005
            }
        },
        ["collectionServiceTags"] = { "CreativeGadget" }
    }
}
u93[v1122] = v1123
local v1124 = u57.TEAM_GENERATOR_GADGET
local v1125 = {
    ["displayName"] = "Team Generator Gadget",
    ["description"] = "Used to create a team generator above its position.",
    ["image"] = "rbxassetid://15579417392",
    ["gadget"] = true,
    ["block"] = {
        ["breakableOnlyByHosts"] = true,
        ["breakType"] = v2.STONE,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 9006
            }
        },
        ["collectionServiceTags"] = { "CreativeGadget" }
    }
}
u93[v1124] = v1125
local v1126 = u57.HEALING_FOUNTAIN
local v1127 = {
    ["displayName"] = "Healing Fountain",
    ["block"] = {
        ["noSuffocation"] = true,
        ["unbreakable"] = true,
        ["health"] = 9999,
        ["blastProof"] = true,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "HealingFountain" }
    }
}
u93[v1126] = v1127
local v1128 = u57.HEALING_TURRET
local v1129 = {
    ["displayName"] = "Healing Fountain",
    ["image"] = "rbxassetid://9557924389",
    ["block"] = {
        ["noSuffocation"] = true,
        ["health"] = 100,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "HealingTurret" }
    }
}
u93[v1128] = v1129
local v1130 = u57.TARGET_DUMMY_TIER_1
local v1131 = {
    ["displayName"] = "Iron Defender",
    ["image"] = "rbxassetid://15635687324",
    ["description"] = "",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["block"] = {
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 100,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 8563 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "target-dummy-block" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8029
            }
        }
    }
}
u93[v1130] = v1131
local v1132 = u57.TARGET_DUMMY_TIER_2
local v1133 = {
    ["displayName"] = "Diamond Defender",
    ["image"] = "rbxassetid://15635689543",
    ["description"] = "",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["block"] = {
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 250,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 8585 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "target-dummy-block" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8030
            }
        }
    }
}
u93[v1132] = v1133
local v1134 = u57.TARGET_DUMMY_TIER_3
local v1135 = {
    ["displayName"] = "Emerald Defender",
    ["image"] = "rbxassetid://15635691654",
    ["description"] = "",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["block"] = {
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 300,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 8607 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "target-dummy-block" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8031
            }
        }
    }
}
u93[v1134] = v1135
local v1136 = u57.TARGET_DUMMY_TIER_4
local v1137 = {
    ["displayName"] = "Enlightened Defender",
    ["image"] = "rbxassetid://15635693582",
    ["description"] = "",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["block"] = {
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 350,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 8629 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_HIT)
        end,
        ["collectionServiceTags"] = { "target-dummy-block" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8032
            }
        }
    }
}
u93[v1136] = v1137
local v1138 = u57.SNOWBALL_LAUNCHER
local v1139 = {
    ["displayName"] = "Snowball Launcher",
    ["description"] = "Launch snowballs that can slow or freeze enemies!",
    ["image"] = "rbxassetid://15628201582",
    ["multiProjectileSource"] = {
        ["frozen_snowball"] = v25.SnowballLauncherProjectile[v24.BASE],
        ["mega_frozen_snowball"] = v25.SnowballLauncherProjectile[v24.POWER],
        ["spread_frozen_snowball"] = v25.SnowballLauncherProjectile[v24.SPREAD],
        ["rapid_frozen_snowball"] = v25.SnowballLauncherProjectile[v24.RAPID]
    },
    ["thirdPerson"] = {
        ["holdAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    },
    ["firstPerson"] = {
        ["verticalOffset"] = 0
    },
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[v1138] = v1139
local v1140 = u57.FORGE_LUCKY_BLOCK
local v1141 = {
    ["displayName"] = "Forge Lucky Block"
}
local v1142 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 8666 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u6
            [3] = u47
        --]]
        return u54(u6.fromList(u47.FORGE_HAMMER_1, u47.FORGE_HAMMER_2))
    end,
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.FORGE }
    },
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["collectionServiceTags"] = { "ForgeLuckyBlock" }
}
v1141.block = v1142
u93[v1140] = v1141
local v1143 = u57.HERO_MAGICAL_GIRL_SCEPTER
local v1144 = {
    ["displayName"] = "Hero\'s Magical Scepter",
    ["description"] = "Harness the power of the sun to deal explosive damage to foes!",
    ["image"] = "rbxassetid://16101841584"
}
local v1145 = {
    ["hero_magical_girl_scepter_projectile"] = {
        ["fireDelaySec"] = 1,
        ["minStrengthScalar"] = 1,
        ["multiShot"] = true,
        ["multiShotCount"] = 3,
        ["multiShotDelay"] = 0.1,
        ["multiShotChargeTime"] = 0.5,
        ["projectileType"] = function() --[[ Name: projectileType, Line 8689 ]]
            return "hero_magical_girl_scepter_projectile"
        end,
        ["launchSound"] = {
            u47.HERO_SCEPTER_SHOT_1,
            u47.HERO_SCEPTER_SHOT_2,
            u47.HERO_SCEPTER_SHOT_3,
            u47.HERO_SCEPTER_SHOT_4
        }
    },
    ["hero_magical_girl_scepter_multi_projectile"] = {
        ["fireDelaySec"] = 1,
        ["minStrengthScalar"] = 1,
        ["multiShot"] = true,
        ["multiShotCount"] = 3,
        ["multiShotDelay"] = 0.1,
        ["multiShotChargeTime"] = 0.5,
        ["projectileType"] = function() --[[ Name: projectileType, Line 8701 ]]
            return "hero_magical_girl_scepter_multi_projectile"
        end,
        ["launchSound"] = {
            u47.HERO_SCEPTER_SHOT_1,
            u47.HERO_SCEPTER_SHOT_2,
            u47.HERO_SCEPTER_SHOT_3,
            u47.HERO_SCEPTER_SHOT_4
        }
    }
}
v1144.multiProjectileSource = v1145
v1144.firstPerson = {
    ["verticalOffset"] = 0
}
v1144.itemCatalog = {
    ["collection"] = v37.MAGICAL_HERO_LUCKY_BLOCK
}
local v1146 = {
    {
        ["tierDescription"] = { "+1 Projectile On Charged Attack (3 Total)" }
    },
    {
        ["tierDescription"] = { "Status Effects Can Now Stack", "3rd Stack Of Solar Flare Consumes Stacks", "Every 3rd Stack Causes An Explosion" }
    },
    {
        ["tierDescription"] = { "+2 Projectiles On Charged Attack (5 Total)" }
    }
}
v1144.tierUpgradeElements = v1146
u93[v1143] = v1144
local v1147 = u57.VILLAIN_MAGICAL_GIRL_SCEPTER
local v1148 = {
    ["displayName"] = "Villain\'s Magical Scepter",
    ["description"] = "Command the darkness of the moon and poison your enemies!",
    ["image"] = "rbxassetid://16101848037"
}
local v1149 = {
    ["villain_magical_girl_scepter_projectile"] = {
        ["fireDelaySec"] = 1,
        ["minStrengthScalar"] = 1,
        ["multiShot"] = true,
        ["multiShotCount"] = 3,
        ["multiShotDelay"] = 0.1,
        ["multiShotChargeTime"] = 0.5,
        ["projectileType"] = function() --[[ Name: projectileType, Line 8737 ]]
            return "villain_magical_girl_scepter_projectile"
        end,
        ["launchSound"] = {
            u47.VILLAIN_SCEPTER_SHOT_1,
            u47.VILLAIN_SCEPTER_SHOT_2,
            u47.VILLAIN_SCEPTER_SHOT_3,
            u47.VILLAIN_SCEPTER_SHOT_4
        }
    },
    ["villain_magical_girl_scepter_multi_projectile"] = {
        ["fireDelaySec"] = 1,
        ["minStrengthScalar"] = 1,
        ["multiShot"] = true,
        ["multiShotCount"] = 3,
        ["multiShotDelay"] = 0.1,
        ["multiShotChargeTime"] = 0.5,
        ["projectileType"] = function() --[[ Name: projectileType, Line 8749 ]]
            return "villain_magical_girl_scepter_multi_projectile"
        end,
        ["launchSound"] = {
            u47.VILLAIN_SCEPTER_SHOT_1,
            u47.VILLAIN_SCEPTER_SHOT_2,
            u47.VILLAIN_SCEPTER_SHOT_3,
            u47.VILLAIN_SCEPTER_SHOT_4
        }
    }
}
v1148.multiProjectileSource = v1149
v1148.firstPerson = {
    ["verticalOffset"] = 0
}
v1148.itemCatalog = {
    ["collection"] = v37.MAGICAL_HERO_LUCKY_BLOCK
}
local v1150 = {
    {
        ["tierDescription"] = { "+1 Projectile On Charged Attack (3 Total)" }
    },
    {
        ["tierDescription"] = { "Status Effects Can Now Stack", "3rd Stack Of Lunar Venom Consumes Stacks", "Consumed Stacks Deal Damage & Infect All Nearby Players" }
    },
    {
        ["tierDescription"] = { "+2 Projectiles On Charged Attack (5 Total)" }
    }
}
v1148.tierUpgradeElements = v1150
u93[v1147] = v1148
local v1151 = u57.DISCO_GRENADE
local v1152 = {
    ["displayName"] = "Disco Grenade",
    ["description"] = "Dance Dance Dance",
    ["image"] = "rbxassetid://15798166322",
    ["maxStackSize"] = {
        ["amount"] = 5
    }
}
local v1153 = {
    ["fireDelaySec"] = 0.3,
    ["projectileType"] = function() --[[ Name: projectileType, Line 8787 ]]
        return "disco_grenade"
    end,
    ["ammoItemTypes"] = { u57.DISCO_GRENADE },
    ["launchSound"] = { u47.NEW_BOW_FIRE },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.GRENADE_THROW
    }
}
v1152.projectileSource = v1153
u93[v1151] = v1152
local v1154 = u57.FIREWORK_CRATE
local v1155 = {
    ["displayName"] = "Firework Crate",
    ["image"] = "rbxassetid://15798166084",
    ["description"] = "Rain down fire on your enemies!",
    ["footstepSound"] = v46.SAND,
    ["block"] = {
        ["health"] = 1,
        ["disableInventoryPickup"] = true,
        ["breakType"] = v2.WOOL,
        ["hitSound"] = function() --[[ Name: hitSound, Line 8805 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.WOOL_BREAK)
        end,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8005
            }
        }
    }
}
u93[v1154] = v1155
local v1156 = u57.FIREWORK_ROCKET_LAUNCHER
local v1157 = {
    ["displayName"] = "Firework Rocket Launcher",
    ["image"] = "rbxassetid://15798141956",
    ["description"] = "",
    ["projectileSource"] = {
        ["fireDelaySec"] = 2.2,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["activeReload"] = true,
        ["projectileType"] = function() --[[ Name: projectileType, Line 8820 ]]
            return "firework_rocket_missile"
        end,
        ["ammoItemTypes"] = { u57.FIREWORK_ROCKET_MISSILE },
        ["launchSound"] = { u47.FIREWORK_LAUNCH }
    }
}
u93[v1156] = v1157
u93[u57.FIREWORK_ROCKET_MISSILE] = {
    ["displayName"] = "Firework Rocket",
    ["image"] = "rbxassetid://15798141772",
    ["hotbarFillRight"] = true
}
local v1158 = u57.NEW_YEARS_LUCKY_BLOCK_2024
local v1159 = {
    ["displayName"] = "New Years Lucky Block"
}
local v1160 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 8840 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.LUCKY_BLOCK_BREAK)
    end,
    ["collectionServiceTags"] = { "NewYearsLuckyBlock" },
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.NEW_YEARS }
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 12116
        }
    }
}
v1159.block = v1160
u93[v1158] = v1159
u93[u57.WORLD_GUARD_WAND] = {
    ["displayName"] = "World Guard Wand",
    ["image"] = "rbxassetid://16009857460",
    ["sharingDisabled"] = true,
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
u93[u57.WORLD_EDIT_WAND] = {
    ["displayName"] = "World Edit Wand",
    ["image"] = "rbxassetid://16009857584",
    ["sharingDisabled"] = true,
    ["firstPerson"] = {
        ["verticalOffset"] = -0.8
    }
}
local v1161 = u57.MAGICAL_HERO_LUCKY_BLOCK
local v1162 = {
    ["displayName"] = "Magical Hero Lucky Block"
}
local v1163 = {
    ["blastProof"] = true,
    ["disableInventoryPickup"] = true,
    ["health"] = 15,
    ["breakType"] = v2.STONE,
    ["hitSound"] = function() --[[ Name: hitSound, Line 8882 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u6
            [3] = u47
        --]]
        return u54(u6.fromList(u47.MAGICAL_HERO_LB_HIT_1, u47.MAGICAL_HERO_LB_HIT_2, u47.MAGICAL_HERO_LB_HIT_3))
    end,
    ["luckyBlock"] = {
        ["drops"] = {
            {
                ["luckMultiplier"] = 2
            }
        },
        ["categories"] = { v40.MAGICAL_HERO, v40.MAGICAL_VILLAIN }
    },
    ["collectionServiceTags"] = { "MagicalHeroLuckyBlock" },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 12117
        }
    }
}
v1162.block = v1163
u93[v1161] = v1162
local v1164 = u57.HERO_PROTECTOR_WAND
local v1165 = {
    ["displayName"] = "Hero\'s Protector Wand",
    ["image"] = "rbxassetid://16031906827",
    ["description"] = "Grants you the power to cast heals and bubble barriers on your teammates!",
    ["itemCatalog"] = {
        ["collection"] = v37.MAGICAL_HERO_LUCKY_BLOCK
    }
}
local v1166 = {
    {
        ["tierDescription"] = { "Added Bubble Cast Ability", "Bubble Applies Knockback/Damage When Popped", "No Fall Damage Inside Bubble" }
    },
    {
        ["tierDescription"] = { "Heal Duration Increased", "Bubble Destroys Projectiles", "Pop Knockback/Damage Increased" }
    },
    {
        ["tierDescription"] = { "Heal Affects Nearby Teammates", "Bubble Deflects Projectiles", "Pop Knockback/Damage Increased" }
    }
}
v1165.tierUpgradeElements = v1166
u93[v1164] = v1165
local v1167 = u57.VILLAIN_PROTECTOR_WAND
local v1168 = {
    ["displayName"] = "Villain\'s Protector Wand",
    ["image"] = "rbxassetid://16031908526",
    ["description"] = "Grants you the power to cast heals and bubble barriers on yourself!",
    ["itemCatalog"] = {
        ["collection"] = v37.MAGICAL_HERO_LUCKY_BLOCK
    }
}
local v1169 = {
    {
        ["tierDescription"] = { "Added Bubble Cast Ability", "Bubble Applies Knockback/Damage When Popped", "No Fall Damage Inside Bubble" }
    },
    {
        ["tierDescription"] = { "Heal Duration Increased", "Bubble Destroys Projectiles", "Pop Knockback/Damage Increased" }
    },
    {
        ["tierDescription"] = { "Heal Affects Nearby Teammates", "Bubble Deflects Projectiles", "Pop Knockback/Damage Increased" }
    }
}
v1168.tierUpgradeElements = v1169
u93[v1167] = v1168
local v1170 = u57.HERO_MAGICAL_GIRL_RAPIER
local v1171 = {
    ["displayName"] = "Hero\'s Magical Rapier",
    ["description"] = "Forged with a courageous heart. Deal critical damage to high health enemies. \'Give me the strength to face my fears!\'",
    ["image"] = "rbxassetid://16101841796",
    ["sword"] = {
        ["damage"] = 44,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["attackRange"] = 12,
        ["attackSpeed"] = v15.RAPIER_ATTACK_COOLDOWN,
        ["swingSounds"] = {}
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["itemCatalog"] = {
        ["collection"] = v37.MAGICAL_HERO_LUCKY_BLOCK
    }
}
local v1172 = {
    {
        ["tierDescription"] = { "+2 Projectiles On Enhanced Attack" }
    },
    {
        ["tierDescription"] = { "Projectiles Can Now Critically Strike" }
    },
    {
        ["tierDescription"] = { "+2 Projectiles On Enhanced Attack" }
    }
}
v1171.tierUpgradeElements = v1172
u93[v1170] = v1171
local v1173 = u57.VILLAIN_MAGICAL_GIRL_RAPIER
local v1174 = {
    ["displayName"] = "Villain\'s Magical Rapier",
    ["description"] = "A twisted blade borne of wrath and misery. Deal critical damage to low health enemies. \'They will see as much mercy as I once received...\'",
    ["image"] = "rbxassetid://16101848170",
    ["sword"] = {
        ["damage"] = 44,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["attackRange"] = 12,
        ["attackSpeed"] = v15.RAPIER_ATTACK_COOLDOWN,
        ["swingSounds"] = {}
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["itemCatalog"] = {
        ["collection"] = v37.MAGICAL_HERO_LUCKY_BLOCK
    }
}
local v1175 = {
    {
        ["tierDescription"] = { "+2 Projectiles On Enhanced Attack" }
    },
    {
        ["tierDescription"] = { "Projectiles Can Now Critically Strike" }
    },
    {
        ["tierDescription"] = { "+2 Projectiles On Enhanced Attack" }
    }
}
v1174.tierUpgradeElements = v1175
u93[v1173] = v1174
local v1176 = u57.HERO_COMET_VOLLEY
local v1177 = {
    ["displayName"] = "Hero\'s Comet Volley",
    ["image"] = "rbxassetid://16040496465",
    ["description"] = "Ascend to celestial heights before unleashing a volley of comets on the world below! Slain foes are converted into Diamond ore deposits.",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["walkSpeedMultiplier"] = 0.5,
        ["soundOverride"] = "None"
    },
    ["itemCatalog"] = {
        ["collection"] = v37.MAGICAL_HERO_LUCKY_BLOCK
    }
}
local v1178 = {}
local v1179 = {}
local v1180 = {}
local v1181 = v22.COMET_VOLLEY_TIER_1_COMET_COUNT
local v1182 = tostring(v1181) .. " Total Comets"
local v1183 = v22.COMET_VOLLEY_TIER_1_DAMAGE
__set_list(v1180, 1, {v1182, tostring(v1183) .. " Damage Per Comet", "Low Yield Diamond Ore"})
v1179.tierDescription = v1180
v1178[1] = v1179
local v1184 = {}
local v1185 = {}
local v1186 = v22.COMET_VOLLEY_TIER_2_COMET_COUNT
local v1187 = tostring(v1186) .. " Total Comets"
local v1188 = v22.COMET_VOLLEY_TIER_2_DAMAGE
__set_list(v1185, 1, {v1187, tostring(v1188) .. " Damage Per Comet", "Medium Yield Diamond Ore"})
v1184.tierDescription = v1185
v1178[2] = v1184
local v1189 = {}
local v1190 = {}
local v1191 = v22.COMET_VOLLEY_TIER_3_COMET_COUNT
local v1192 = tostring(v1191) .. " Total Comets"
local v1193 = v22.COMET_VOLLEY_TIER_3_DAMAGE
__set_list(v1190, 1, {v1192, tostring(v1193) .. " Damage Per Comet", "High Yield Diamond Ore"})
v1189.tierDescription = v1190
v1178[3] = v1189
v1177.tierUpgradeElements = v1178
u93[v1176] = v1177
local v1194 = u57.VILLAIN_COMET_VOLLEY
local v1195 = {
    ["displayName"] = "Villain\'s Comet Volley",
    ["image"] = "rbxassetid://16040490553",
    ["description"] = "Ascend to celestial heights before unleashing a volley of comets on the world below! Slain foes are converted into Emerald ore deposits.",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["walkSpeedMultiplier"] = 0.5,
        ["soundOverride"] = "None"
    },
    ["itemCatalog"] = {
        ["collection"] = v37.MAGICAL_HERO_LUCKY_BLOCK
    }
}
local v1196 = {}
local v1197 = {}
local v1198 = {}
local v1199 = v22.COMET_VOLLEY_TIER_1_COMET_COUNT
local v1200 = tostring(v1199) .. " Total Comets"
local v1201 = v22.COMET_VOLLEY_TIER_1_DAMAGE
__set_list(v1198, 1, {v1200, tostring(v1201) .. " Damage Per Comet", "Low Yield Emerald Ore"})
v1197.tierDescription = v1198
v1196[1] = v1197
local v1202 = {}
local v1203 = {}
local v1204 = v22.COMET_VOLLEY_TIER_2_COMET_COUNT
local v1205 = tostring(v1204) .. " Total Comets"
local v1206 = v22.COMET_VOLLEY_TIER_2_DAMAGE
__set_list(v1203, 1, {v1205, tostring(v1206) .. " Damage Per Comet", "Medium Yield Emerald Ore"})
v1202.tierDescription = v1203
v1196[2] = v1202
local v1207 = {}
local v1208 = {}
local v1209 = v22.COMET_VOLLEY_TIER_3_COMET_COUNT
local v1210 = tostring(v1209) .. " Total Comets"
local v1211 = v22.COMET_VOLLEY_TIER_3_DAMAGE
__set_list(v1208, 1, {v1210, tostring(v1211) .. " Damage Per Comet", "High Yield Emerald Ore"})
v1207.tierDescription = v1208
v1196[3] = v1207
v1195.tierUpgradeElements = v1196
u93[v1194] = v1195
local v1212 = u57.HERO_SCISSOR_SWORD
local v1213 = {
    ["displayName"] = "Hero\'s Scissor Sword",
    ["image"] = "rbxassetid://16122815522",
    ["description"] = "Swords, like heroes, can be forged from anything! Land combo hits to increase your attack speed."
}
local v1214 = {
    ["skipSwingEffects"] = true,
    ["damage"] = v16.ATTACK_DAMAGE,
    ["attackSpeed"] = v16.BASE_ATTACK_SPEED_SEC
}
local v1217 = {
    ["showHoldProgressAfterSec"] = 0.25,
    ["fireAtFullCharge"] = true,
    ["ignoreEffectsOnFullyCharged"] = true,
    ["maxChargeTimeSec"] = v16.COMBO_STRIKE_CHARGE_TIME,
    ["minChargeTimeSec"] = v16.COMBO_STRIKE_CHARGE_TIME,
    ["attackCooldown"] = v16.COMBO_STRIKE_COOLDOWN_SEC,
    ["walkSpeedModifier"] = {
        ["delay"] = 0.25,
        ["multiplier"] = v16.COMBO_STRIKE_WALKSPEED_MULTIPLIER
    },
    ["chargingEffects"] = {
        ["sound"] = u47.SCISSOR_SWORD_CHARGE_UP
    },
    ["chargedSwingAnimations"] = { u7.SCISSOR_SWORD_COMBO_STRIKE },
    ["chargedSwingSounds"] = { u47.SCISSOR_SWORD_SLASH_FAST_HERO, u47.SCISSOR_SWORD_SLASH_FAST_HERO, u47.SCISSOR_SWORD_SLASH_SLOW_HERO },
    ["enableCondition"] = function(p1215) --[[ Name: enableCondition, Line 9071 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u8
        --]]
        local v1216 = u51(p1215.tool, u8)
        return (v1216 == nil and 0 or v1216) > 1
    end
}
v1214.chargedAttack = v1217
v1213.sword = v1214
v1213.firstPerson = {
    ["scale"] = 0.8,
    ["verticalOffset"] = -1.2
}
v1213.itemCatalog = {
    ["collection"] = v37.MAGICAL_HERO_LUCKY_BLOCK
}
local v1218 = {
    {
        ["tierDescription"] = { "Gain a sharpened status on successful hits." }
    },
    {
        ["tierDescription"] = { "Unlock charged attack, performing a 3-strike combo." }
    },
    {
        ["tierDescription"] = { "A well-time sword swing can now cut projectiles." }
    }
}
v1213.tierUpgradeElements = v1218
u93[v1212] = v1213
local v1219 = u57.VILLAIN_SCISSOR_SWORD
local v1220 = {
    ["displayName"] = "Villain\'s Scissor Sword",
    ["image"] = "rbxassetid://16122815086",
    ["description"] = "Swords, like villains, can come from anywhere! Land combo hits to increase your attack speed."
}
local v1221 = {
    ["skipSwingEffects"] = true,
    ["damage"] = v16.ATTACK_DAMAGE,
    ["attackSpeed"] = v16.BASE_ATTACK_SPEED_SEC
}
local v1224 = {
    ["showHoldProgressAfterSec"] = 0.25,
    ["fireAtFullCharge"] = true,
    ["maxChargeTimeSec"] = v16.COMBO_STRIKE_CHARGE_TIME,
    ["minChargeTimeSec"] = v16.COMBO_STRIKE_CHARGE_TIME,
    ["attackCooldown"] = v16.COMBO_STRIKE_COOLDOWN_SEC,
    ["walkSpeedModifier"] = {
        ["delay"] = 0.25,
        ["multiplier"] = v16.COMBO_STRIKE_WALKSPEED_MULTIPLIER
    },
    ["chargingEffects"] = {
        ["sound"] = u47.SCISSOR_SWORD_CHARGE_UP
    },
    ["chargedSwingAnimations"] = { u7.SCISSOR_SWORD_COMBO_STRIKE },
    ["chargedSwingSounds"] = { u47.SCISSOR_SWORD_SLASH_FAST_VILLAIN, u47.SCISSOR_SWORD_SLASH_FAST_VILLAIN, u47.SCISSOR_SWORD_SLASH_SLOW_VILLAIN },
    ["enableCondition"] = function(p1222) --[[ Name: enableCondition, Line 9122 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u8
        --]]
        local v1223 = u51(p1222.tool, u8)
        return (v1223 == nil and 0 or v1223) > 1
    end
}
v1221.chargedAttack = v1224
v1220.sword = v1221
v1220.firstPerson = {
    ["scale"] = 0.8,
    ["verticalOffset"] = -1.2
}
local v1225 = {
    {
        ["tierDescription"] = { "Apply the decay status on successful hits." }
    },
    {
        ["tierDescription"] = { "Unlock charged attack, performing a 3-strike combo." }
    },
    {
        ["tierDescription"] = { "The decay status now stacks, decreasing max health further." }
    }
}
v1220.tierUpgradeElements = v1225
u93[v1219] = v1220
local v1226 = u57.FIRECRACKERS
local v1227 = {
    ["displayName"] = "Firecrackers",
    ["description"] = "Celebrate the lunar new year with some firecrackers!",
    ["image"] = "rbxassetid://16211743648",
    ["projectileSource"] = {
        ["fireDelaySec"] = 1,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 9152 ]]
            return "firecrackers"
        end,
        ["ammoItemTypes"] = { u57.FIRECRACKERS },
        ["launchSound"] = { u47.FIREWORK_LAUNCH }
    },
    ["maxStackSize"] = {
        ["amount"] = 3
    }
}
u93[v1226] = v1227
u93[u57.DRAGON_MORTAR] = {
    ["displayName"] = "Dragon Mortar",
    ["image"] = "rbxassetid://16212332887",
    ["description"] = "Launch a festive dragon rocket to deal damage in an area!"
}
local v1228 = u57.BLUE_TILE
local v1229 = {
    ["displayName"] = "Blue Tile",
    ["footstepSound"] = v46.STONE
}
local v1230 = {
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 22,
            ["blockData"] = 0
        }
    }
}
v1229.block = v1230
u93[v1228] = v1229
u93[u57.HEALTH_DROP] = {
    ["displayName"] = "Health Drop"
}
u93[u57.MENDING_CANOPY_STAFF_TIER_1] = {
    ["displayName"] = "Mending Canopy I",
    ["image"] = "rbxassetid://17007883118",
    ["description"] = "When the sun shine, we shine together!",
    ["sharingDisabled"] = true,
    ["firstPerson"] = {
        ["scale"] = 0.5
    }
}
u93[u57.MENDING_CANOPY_STAFF_TIER_2] = {
    ["displayName"] = "Mending Canopy II",
    ["image"] = "rbxassetid://17007888794",
    ["description"] = "When the sun shine, we shine together! Now with knockback!",
    ["sharingDisabled"] = true,
    ["firstPerson"] = {
        ["scale"] = 0.5
    },
    ["replaces"] = { u57.MENDING_CANOPY_STAFF_TIER_1 }
}
u93[u57.MENDING_CANOPY_STAFF_TIER_3] = {
    ["displayName"] = "Mending Canopy III",
    ["image"] = "rbxassetid://17007892915",
    ["description"] = "When the sun shine, we shine together! Now with Overcharge!",
    ["sharingDisabled"] = true,
    ["firstPerson"] = {
        ["scale"] = 0.5
    },
    ["replaces"] = { u57.MENDING_CANOPY_STAFF_TIER_2 }
}
local v1231 = u57.TINKER_WOOD_CHAINSAW
local v1232 = {
    ["displayName"] = "Wood Chainsaw",
    ["sharingDisabled"] = true,
    ["image"] = v35.WOOD_CHAINSAW,
    ["sword"] = {
        ["damage"] = 10,
        ["attackSpeed"] = 0.35,
        ["respectAttackSpeedForEffects"] = true,
        ["attackRange"] = 5 * u17 + 2
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1231] = v1232
local v1233 = u57.TINKER_IRON_CHAINSAW
local v1234 = {
    ["displayName"] = "Iron Chainsaw",
    ["sharingDisabled"] = true,
    ["image"] = v35.IRON_CHAINSAW,
    ["sword"] = {
        ["damage"] = 20,
        ["attackSpeed"] = 0.35,
        ["attackRange"] = 5 * u17 + 2
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["replaces"] = { u57.TINKER_WOOD_CHAINSAW }
}
u93[v1233] = v1234
local v1235 = u57.TINKER_DIAMOND_CHAINSAW
local v1236 = {
    ["displayName"] = "Diamond Chainsaw",
    ["sharingDisabled"] = true,
    ["image"] = v35.DIAMOND_CHAINSAW,
    ["sword"] = {
        ["damage"] = 20,
        ["attackSpeed"] = 0.35,
        ["attackRange"] = 5 * u17 + 2
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["replaces"] = { u57.TINKER_IRON_CHAINSAW }
}
u93[v1235] = v1236
local v1237 = u57.TINKER_EMERALD_CHAINSAW
local v1238 = {
    ["displayName"] = "Emerald Chainsaw",
    ["sharingDisabled"] = true,
    ["image"] = v35.EMERALD_CHAINSAW,
    ["sword"] = {
        ["damage"] = 20,
        ["attackSpeed"] = 0.35,
        ["attackRange"] = 5 * u17 + 2
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["replaces"] = { u57.TINKER_DIAMOND_CHAINSAW }
}
u93[v1237] = v1238
local v1239 = u57.TINKER_VOID_CHAINSAW
local v1240 = {
    ["displayName"] = "Void Chainsaw",
    ["sharingDisabled"] = true,
    ["image"] = v35.VOID_CHAINSAW,
    ["sword"] = {
        ["damage"] = 20,
        ["attackSpeed"] = 0.35,
        ["attackRange"] = 5 * u17 + 2
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["replaces"] = { u57.TINKER_EMERALD_CHAINSAW }
}
u93[v1239] = v1240
u93[u57.TINKER_IRON_MECH_UPGRADE] = {
    ["displayName"] = "Iron Mech Upgrade",
    ["sharingDisabled"] = true,
    ["image"] = v35.IRON_TINKER_MECH
}
u93[u57.TINKER_DIAMOND_MECH_UPGRADE] = {
    ["displayName"] = "Diamond Mech Upgrade",
    ["description"] = "Unlocks Self-Destruct ability",
    ["sharingDisabled"] = true,
    ["image"] = v35.DIAMOND_TINKER_MECH
}
u93[u57.TINKER_EMERALD_MECH_UPGRADE] = {
    ["displayName"] = "Emerald Mech Upgrade",
    ["description"] = "Increases strength of Self-Destruct",
    ["sharingDisabled"] = true,
    ["image"] = v35.EMERALD_TINKER_MECH
}
u93[u57.TINKER_VOID_MECH_UPGRADE] = {
    ["displayName"] = "Void Mech Upgrade",
    ["description"] = "Reduces incoming projectile damage and knockback",
    ["sharingDisabled"] = true,
    ["image"] = v35.VOID_TINKER_MECH
}
u93[u57.SPEED_BOOST] = {
    ["displayName"] = "Speed Boost"
}
local v1241 = u57.EGG_BLOCK
local v1242 = {
    ["displayName"] = "Collectable Egg",
    ["image"] = "rbxassetid://3677675280",
    ["block"] = {
        ["disableInventoryPickup"] = true,
        ["unbreakable"] = true,
        ["denyPlaceOn"] = true,
        ["seeThrough"] = true,
        ["flammable"] = true,
        ["flameSpreadStopChance"] = 0.4,
        ["disableFlamableByTeammates"] = true,
        ["breakType"] = v2.WOOD,
        ["placeSound"] = function() --[[ Name: placeSound, Line 9326 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.CHICKEN_EGG_CRACK)
        end,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8424
            }
        },
        ["collectionServiceTags"] = { "egg-block" }
    }
}
u93[v1241] = v1242
u93[u57.COLLECTED_EGG] = {
    ["displayName"] = "Egg",
    ["image"] = "rbxassetid://13988247733",
    ["description"] = "Bring back to your base!",
    ["sharingDisabled"] = true
}
local v1243 = u57.NEST_DEPOSIT_BLOCK
local v1244 = {
    ["displayName"] = "Nest Deposit Zone",
    ["block"] = {
        ["breakType"] = v2.WOOL,
        ["collectionServiceTags"] = { "NestDepositBlock" }
    }
}
u93[v1243] = v1244
local v1245 = u57.CLUSTER_BOMB
local v1246 = {
    ["displayName"] = "Cluster Bomb",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://17009910977",
    ["projectileSource"] = {
        ["fireDelaySec"] = 0.4,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["projectileType"] = function() --[[ Name: projectileType, Line 9356 ]]
            return "cluster_bomb"
        end,
        ["ammoItemTypes"] = { u57.CLUSTER_BOMB },
        ["launchSound"] = { u47.SWORD_SWING_1 }
    },
    ["maxStackSize"] = {
        ["amount"] = v26.MAX_CLUSTER_NADE_SIZE
    }
}
u93[v1245] = v1246
u93[u57.IRON_CHICKEN_NEST] = {
    ["displayName"] = "Iron Nest",
    ["image"] = "rbxassetid://17018554326"
}
u93[u57.DIAMOND_CHICKEN_NEST] = {
    ["displayName"] = "Diamond Nest",
    ["image"] = "rbxassetid://17018554494"
}
u93[u57.EMERALD_CHICKEN_NEST] = {
    ["displayName"] = "Emerald Nest",
    ["image"] = "rbxassetid://17018554648"
}
u93[u57.VOID_CHICKEN_INCUBATOR] = {
    ["displayName"] = "Void Nest",
    ["image"] = "rbxassetid://17018554829"
}
local v1247 = u57.STYX_ENTRANCE_PORTAL
local v1248 = {
    ["displayName"] = "Confluence Portal",
    ["image"] = "rbxassetid://17009847852",
    ["keepOnDeath"] = true,
    ["sharingDisabled"] = true,
    ["block"] = {
        ["unbreakableByTeammates"] = true,
        ["seeThrough"] = true,
        ["health"] = 30,
        ["maxPlaced"] = 1,
        ["disableEnemyInventoryPickup"] = true,
        ["instantBreakByOwner"] = true,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "styx-entrance-portal" }
    }
}
u93[v1247] = v1248
local v1249 = u57.STYX_EXIT_PORTAL
local v1250 = {
    ["displayName"] = "Confluence Portal",
    ["image"] = "rbxassetid://17009847852",
    ["sharingDisabled"] = true,
    ["block"] = {
        ["unbreakableByTeammates"] = true,
        ["seeThrough"] = true,
        ["health"] = 30,
        ["disableEnemyInventoryPickup"] = true,
        ["disableInventoryPickup"] = true,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "styx-exit-portal" }
    }
}
u93[v1249] = v1250
local v1251 = u57.NOCTIUM_BLADE
local v1252 = {
    ["displayName"] = "Noctium Blade I",
    ["description"] = "A blade forged from the powerful void metal, Noctium.",
    ["image"] = "rbxassetid://87316819930592",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 22,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN + 0.05
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1251] = v1252
local v1253 = u57.NOCTIUM_BLADE_2
local v1254 = {
    ["displayName"] = "Noctium Blade II",
    ["description"] = "A blade forged from the powerful void metal, Noctium.",
    ["image"] = "rbxassetid://85834734397116",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 27,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN + 0.05
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1253] = v1254
local v1255 = u57.NOCTIUM_BLADE_3
local v1256 = {
    ["displayName"] = "Noctium Blade III",
    ["description"] = "A blade forged from the powerful void metal, Noctium.",
    ["image"] = "rbxassetid://101450000021943",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 33,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN + 0.05
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1255] = v1256
local v1257 = u57.NOCTIUM_BLADE_4
local v1258 = {
    ["displayName"] = "Noctium Blade IV",
    ["description"] = "A blade forged from the powerful void metal, Noctium.",
    ["image"] = "rbxassetid://100238229901987",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 47,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN + 0.05
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1257] = v1258
u93[u57.WOOD_CHAINSAW] = {
    ["displayName"] = "FP Wood Chainsaw"
}
u93[u57.IRON_CHAINSAW] = {
    ["displayName"] = "FP Iron Chainsaw"
}
u93[u57.DIAMOND_CHAINSAW] = {
    ["displayName"] = "FP Diamond Chainsaw"
}
u93[u57.EMERALD_CHAINSAW] = {
    ["displayName"] = "FP Emerald Chainsaw"
}
u93[u57.VOID_CHAINSAW] = {
    ["displayName"] = "FP Void Chainsaw"
}
u93[u57.TINKERS_WRENCH] = {
    ["displayName"] = "Tinker\'s Wrench",
    ["description"] = "Deals a small amount of damage",
    ["image"] = "rbxassetid://11533277908",
    ["sharingDisabled"] = true,
    ["sword"] = {
        ["damage"] = 20,
        ["attackSpeed"] = 0.35
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
local v1259 = u57.BROKEN_ALTAR_BLOCK
local v1260 = {
    ["displayName"] = "Broken Altar",
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "broken-altar-block" }
    }
}
u93[v1259] = v1260
local v1261 = u57.ALTAR_BLOCK_ONE
local v1262 = {
    ["displayName"] = "Altar",
    ["image"] = v35.ENCHANTING_TABLE,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "altar-block" }
    }
}
u93[v1261] = v1262
local v1263 = u57.ALTAR_BLOCK_TWO
local v1264 = {
    ["displayName"] = "Altar",
    ["image"] = v35.ENCHANTING_TABLE,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "altar-block" }
    }
}
u93[v1263] = v1264
local v1265 = u57.ALTAR_BLOCK_THREE
local v1266 = {
    ["displayName"] = "Altar",
    ["image"] = v35.ENCHANTING_TABLE,
    ["block"] = {
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "altar-block" }
    }
}
u93[v1265] = v1266
u93[u57.ANGEL_WINGS] = {
    ["displayName"] = "Angel Wings",
    ["description"] = "Magical pair of wings.",
    ["image"] = "rbxassetid://17193022208",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["backpack"] = {}
}
local v1267 = u57.VOID_TELEPORT_PORTAL
local v1268 = {
    ["displayName"] = "Teleport Block",
    ["image"] = v35.VOID_TELEPORT_PORTAL,
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 8,
        ["denyPlaceOn"] = true,
        ["maxPlaced"] = 2,
        ["disableInventoryPickup"] = true,
        ["breakType"] = v2.STONE,
        ["placeSound"] = function() --[[ Name: placeSound, Line 9552 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "void_teleport_portal" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8002
            }
        }
    }
}
u93[v1267] = v1268
local v1269 = u57.LASSO_HOOK
local v1270 = {
    ["displayName"] = "Lasso Hook",
    ["image"] = "rbxassetid://17009847852",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 50,
        ["disableEnemyInventoryPickup"] = true,
        ["unbreakable"] = true,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "lasso-hook-block" }
    }
}
u93[v1269] = v1270
u93[u57.LASSO_COIN] = {
    ["displayName"] = "Coin",
    ["image"] = "rbxassetid://14978481303",
    ["hotbarFillRight"] = true,
    ["keepOnDeath"] = true,
    ["sharingDisabled"] = true,
    ["displayNameColor"] = Color3.fromRGB(255, 209, 0),
    ["disableDroppingInQueues"] = { v20.LASSO_WARS }
}
local v1271 = u57.PARTY_HAT_LAUNCHER
local v1272 = {
    ["displayName"] = "Party Hat Launcher",
    ["description"] = "",
    ["image"] = v35.PARTY_HAT_LAUNCHER,
    ["projectileSource"] = {
        ["fireDelaySec"] = 2.2,
        ["maxStrengthChargeSec"] = 0.25,
        ["minStrengthScalar"] = 0.7692307692307692,
        ["activeReload"] = true,
        ["projectileType"] = function() --[[ Name: projectileType, Line 9592 ]]
            return "party_hat_missile"
        end,
        ["ammoItemTypes"] = { u57.PARTY_HAT_MISSILE },
        ["launchSound"] = { u47.FIREWORK_LAUNCH }
    }
}
u93[v1271] = v1272
u93[u57.PARTY_HAT_MISSILE] = {
    ["displayName"] = "Hat Missile",
    ["hotbarFillRight"] = true,
    ["image"] = v35.PARTY_HAT_MISSILE
}
local v1273 = u57.SURVIVAL_CRATE
local v1274 = {
    ["displayName"] = "Crate",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["breakType"] = v2.WOOD
    }
}
u93[v1273] = v1274
local v1275 = u57.TITAN_HEAL_TOTEM
local v1276 = {
    ["displayName"] = "Heal Totem",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["breakType"] = v2.WOOD
    }
}
u93[v1275] = v1276
local v1277 = u57.MULTI_BREAK_TOOL
local v1278 = {
    ["displayName"] = "Handheld Drill",
    ["description"] = "An all-purpose break tool",
    ["image"] = "rbxassetid://17580233223",
    ["disableFirstPersonWalkAnimation"] = true,
    ["sharingDisabled"] = true,
    ["breakBlock"] = {
        [v2.STONE] = 20,
        [v2.WOOL] = 5,
        [v2.WOOD] = 2
    },
    ["breakBlockSwingAnimationOverride"] = u7.FLAMETHROWER_USE,
    ["breakBlockSoundOverride"] = {
        [v2.STONE] = {
            u47.MULTI_BREAK_TOOL_STONE_BREAK_1,
            u47.MULTI_BREAK_TOOL_STONE_BREAK_2,
            u47.MULTI_BREAK_TOOL_STONE_BREAK_3,
            u47.MULTI_BREAK_TOOL_STONE_BREAK_4
        },
        [v2.WOOL] = {
            u47.MULTI_BREAK_TOOL_WOOL_BREAK_1,
            u47.MULTI_BREAK_TOOL_WOOL_BREAK_2,
            u47.MULTI_BREAK_TOOL_WOOL_BREAK_3,
            u47.MULTI_BREAK_TOOL_WOOL_BREAK_4
        },
        [v2.WOOD] = {
            u47.MULTI_BREAK_TOOL_WOOD_BREAK_1,
            u47.MULTI_BREAK_TOOL_WOOD_BREAK_2,
            u47.MULTI_BREAK_TOOL_WOOD_BREAK_3,
            u47.MULTI_BREAK_TOOL_WOOD_BREAK_4
        }
    },
    ["firstPerson"] = {
        ["verticalOffset"] = 1,
        ["holdAnimation"] = u7.FLAMETHROWER_IDLE
    }
}
u93[v1277] = v1278
u93[u57.FIRE_3_ENCHANT] = {
    ["displayName"] = "Element of Fire",
    ["description"] = "Give you the fire enchant, lasts 180 seconds",
    ["image"] = v35.FIRE_ENCHANT,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[u57.BERSERKER_3_ENCHANT] = {
    ["displayName"] = "Heart of Berserker",
    ["description"] = "Give you the berserker enchant, lasts 180 seconds",
    ["image"] = v35.BERSERKER_ENCHANT,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[u57.STATIC_3_ENCHANT] = {
    ["displayName"] = "Element of Static",
    ["description"] = "Give you the static enchant, lasts 180 seconds",
    ["image"] = v35.STATIC_ENCHANT,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[u57.CRITICAL_STRIKE_3_ENCHANT] = {
    ["displayName"] = "Criticle Strike",
    ["description"] = "Give you the Critical Strike enchant, lasts 180 seconds",
    ["image"] = v35.CRITICAL_STRIKE_ENCHANT,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
local v1279 = u57.HARPOON
local v1280 = {
    ["displayName"] = "Trident",
    ["description"] = "Throw at your target and quickly leap to them.",
    ["image"] = "rbxassetid://18249733341",
    ["sharingDisabled"] = true
}
local v1281 = {
    ["fireDelaySec"] = 8,
    ["projectileType"] = function(_) --[[ Name: projectileType, Line 9682 ]]
        return "harpoon_projectile"
    end,
    ["blockingStatusEffects"] = { v48.GROUNDED },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v1280.projectileSource = v1281
u93[v1279] = v1280
local v1282 = u57.JELLYFISH
local v1283 = {
    ["displayName"] = "Jellyfish",
    ["image"] = "rbxassetid://18129975091",
    ["sharingDisabled"] = true,
    ["placesBlock"] = {
        ["blockType"] = u57.JELLYFISH_BLOCK_SNAPPING
    }
}
u93[v1282] = v1283
local v1284 = u57.JELLYFISH_BLOCK_SNAPPING
local v1285 = {
    ["displayName"] = "Jellyfish Block Snapper",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["block"] = {
        ["breakType"] = v2.STONE
    }
}
u93[v1284] = v1285
u93[u57.JELLYFISH_MOUNT_DEPLOY] = {
    ["displayName"] = "Jellyfish Mount",
    ["image"] = "rbxassetid://18129974979",
    ["description"] = "Fly around on this wild jellyfish!",
    ["sharingDisabled"] = true,
    ["consumable"] = {
        ["consumeTime"] = 0.5,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
u93[u57.OASIS_VESSEL] = {
    ["displayName"] = "Oasis Vessel I",
    ["image"] = "rbxassetid://77023773100688",
    ["description"] = "Used to channel water",
    ["sharingDisabled"] = true,
    ["firstPerson"] = {
        ["verticalOffset"] = 0.5
    }
}
u93[u57.OASIS_VESSEL_2] = {
    ["displayName"] = "Oasis Vessel II",
    ["image"] = "rbxassetid://117617127234910",
    ["description"] = "Used to channel water",
    ["sharingDisabled"] = true,
    ["firstPerson"] = {
        ["verticalOffset"] = 0.5
    },
    ["replaces"] = { u57.OASIS_VESSEL }
}
u93[u57.OASIS_VESSEL_3] = {
    ["displayName"] = "Oasis Vessel III",
    ["image"] = "rbxassetid://107817301914072",
    ["description"] = "Used to channel water",
    ["sharingDisabled"] = true,
    ["firstPerson"] = {
        ["verticalOffset"] = 0.5
    },
    ["replaces"] = { u57.OASIS_VESSEL_2 }
}
u93[u57.BEACHBALL] = {
    ["displayName"] = "Beach Ball",
    ["image"] = "rbxassetid://18149456734",
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
local v1286 = u57.REAPER_SCYTHE
local v1287 = {
    ["displayName"] = "Grim Reaper\'s Scythe",
    ["sharingDisabled"] = true,
    ["image"] = v35.REAPER_SCYTHE,
    ["sword"] = {
        ["damage"] = 0,
        ["attackSpeed"] = 1.5,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["swingAnimations"] = { u7.SCYTHE_SLASH_1, u7.SCYTHE_SLASH_2 },
        ["firstPersonSwingAnimations"] = { u7.SCYTHE_SLASH_1_FP, u7.SCYTHE_SLASH_2_FP },
        ["idleAnimation"] = u7.SCYTHE_HOLD
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1286] = v1287
local v1288 = u57.LOBBY_SPRING_PUNCH
local v1289 = {
    ["displayName"] = "Punch Gun",
    ["description"] = "Yeet your enemies with a spring loaded punch!",
    ["image"] = "rbxassetid://89187423732739",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["thirdPerson"] = {
        ["holdAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    },
    ["firstPerson"] = {
        ["scale"] = 0.8
    }
}
u93[v1288] = v1289
u93[u57.CLOAK] = {
    ["displayName"] = "Cloak",
    ["description"] = "Move in shadow!",
    ["image"] = "",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["backpack"] = {}
}
u93[u57.SHADOW_COIN] = {
    ["displayName"] = "Shadow Coin",
    ["image"] = "rbxassetid://18938976671",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true
}
local v1290 = u57.BLACK_MARKET_SHOP
local v1291 = {
    ["displayName"] = "BLACK_MARKET_SHOP",
    ["sharingDisabled"] = true,
    ["block"] = {
        ["disableInventoryPickup"] = true,
        ["maxPlaced"] = 1,
        ["noSuffocation"] = true,
        ["unbreakableByTeammates"] = true,
        ["breakType"] = v2.STONE,
        ["collectionServiceTags"] = { "single-space-block" }
    }
}
u93[v1290] = v1291
u93[u57.BLACK_MARKET_REROLL_ITEMS] = {
    ["displayName"] = "Reroll Discounted Items",
    ["description"] = "Rerolls all of the below discounted items",
    ["sharingDisabled"] = true,
    ["image"] = v35.WORLD_EDIT_ROTATE,
    ["consumable"] = {
        ["consumeTime"] = 0.5,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
u93[u57.BLACK_MARKET_UPGRADE_1] = {
    ["displayName"] = "Black Market Upgrade 1",
    ["description"] = "Unlocks: (Serpent\'s Touch Potion), (Fury Potion)\nRandom Pool: +1 Items\nItem Discounts: 15%->20%",
    ["image"] = "rbxassetid://95888205553099",
    ["sharingDisabled"] = true,
    ["consumable"] = {
        ["consumeTime"] = 0.5,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
u93[u57.BLACK_MARKET_UPGRADE_2] = {
    ["displayName"] = "Black Market Upgrade 2",
    ["description"] = "Unlocks: (Mini Shield Potion)\nRandom Pool: +1 Items",
    ["image"] = "rbxassetid://95888205553099",
    ["sharingDisabled"] = true,
    ["consumable"] = {
        ["consumeTime"] = 0.5,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
u93[u57.BLACK_MARKET_UPGRADE_3] = {
    ["displayName"] = "Black Market Upgrade 3",
    ["description"] = "Unlocks: (Invis Potion)\nRandom Pool: +1 Items\nItem Discounts: 15%->20%",
    ["image"] = "rbxassetid://95888205553099",
    ["sharingDisabled"] = true,
    ["consumable"] = {
        ["consumeTime"] = 0.5,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
local v1292 = u57.LIMESTONE
local v1293 = {
    ["displayName"] = "Limestone",
    ["footstepSound"] = v46.STONE
}
local v1294 = {
    ["breakType"] = v2.STONE,
    ["placeSound"] = function() --[[ Name: placeSound, Line 9866 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.GENERIC_BLOCK_PLACE)
    end,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["minecraftConversions"] = {
        {
            ["blockId"] = 121
        }
    }
}
v1293.block = v1294
u93[v1292] = v1293
local v1295 = u57.LIFE_BOW
local v1296 = {
    ["displayName"] = "Life Bow",
    ["description"] = "Does not use arrows, instead consuming health when fired. Gain life force on successful hits.",
    ["image"] = "rbxassetid://115560591356432",
    ["sharingDisabled"] = true
}
local v1297 = {
    ["ammoItemTypes"] = nil,
    ["fireDelaySec"] = 0.6,
    ["maxStrengthChargeSec"] = 0.65,
    ["minStrengthScalar"] = 0.3333333333333333,
    ["walkSpeedMultiplier"] = 0.35,
    ["projectileType"] = function() --[[ Name: projectileType, Line 9881 ]]
        return "life_arrow"
    end,
    ["launchSound"] = { u47.LIFE_BOW_SHOT },
    ["chargeBeginSound"] = { u47.BOW_DRAW },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.BOW_AIM,
        ["fireAnimation"] = u7.BOW_FIRE,
        ["drawAnimation"] = u7.BOW_DRAW
    }
}
v1296.projectileSource = v1297
v1296.firstPerson = {
    ["verticalOffset"] = 0
}
u93[v1295] = v1296
local v1298 = u57.LIFE_CROSSBOW
local v1299 = {
    ["displayName"] = "Life Crossbow",
    ["description"] = "Does not use arrows, instead consuming health when fired. Gain life force on successful hits.",
    ["image"] = "rbxassetid://70683200838838",
    ["sharingDisabled"] = true
}
local v1300 = {
    ["ammoItemTypes"] = nil,
    ["walkSpeedMultiplier"] = 0.35,
    ["projectileType"] = function() --[[ Name: projectileType, Line 9907 ]]
        return "life_crossbow_arrow"
    end,
    ["fireDelaySec"] = u53.CROSSBOW_FIRE_DELAY,
    ["launchSound"] = { u47.LIFE_BOW_SHOT },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.CROSSBOW_AIM,
        ["fireAnimation"] = u7.CROSSBOW_FIRE
    }
}
v1299.projectileSource = v1300
v1299.replaces = { u57.LIFE_BOW }
u93[v1298] = v1299
local v1301 = u57.LIFE_HEADHUNTER
local v1302 = {
    ["displayName"] = "Life Headhunter",
    ["description"] = "Does not use arrows, instead consuming health when fired. Gain life force on successful hits.",
    ["image"] = "rbxassetid://96063940465952",
    ["sharingDisabled"] = true
}
local v1303 = {
    ["ammoItemTypes"] = nil,
    ["walkSpeedMultiplier"] = 0.35,
    ["projectileType"] = function() --[[ Name: projectileType, Line 9934 ]]
        return "life_headhunter_arrow"
    end,
    ["fireDelaySec"] = u53.HEADHUNTER_FIRE_DELAY,
    ["launchSound"] = { u47.LIFE_HEADHUNTER_SHOT },
    ["reload"] = {
        ["reloadSound"] = { u47.CROSSBOW_RELOAD }
    },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM_FP,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT_FP
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT
    }
}
v1302.projectileSource = v1303
v1302.replaces = { u57.LIFE_CROSSBOW }
u93[v1301] = v1302
u93[u57.SUMMONER_CLAW_1] = {
    ["displayName"] = "Summoner Claw I",
    ["image"] = "rbxassetid://18974199292",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true,
    ["actsAsSwordGroup"] = true,
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["cooldownId"] = v19.SUMMONER_CLAW_ATTACK,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[u57.SUMMONER_CLAW_2] = {
    ["displayName"] = "Summoner Claw II",
    ["image"] = "rbxassetid://18974200883",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true,
    ["actsAsSwordGroup"] = true,
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["cooldownId"] = v19.SUMMONER_CLAW_ATTACK,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["replaces"] = { u57.SUMMONER_CLAW_1 }
}
u93[u57.SUMMONER_CLAW_3] = {
    ["displayName"] = "Summoner Claw III",
    ["image"] = "rbxassetid://18974198162",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true,
    ["actsAsSwordGroup"] = true,
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["cooldownId"] = v19.SUMMONER_CLAW_ATTACK,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["replaces"] = { u57.SUMMONER_CLAW_2 }
}
u93[u57.SUMMONER_CLAW_4] = {
    ["displayName"] = "Summoner Claw IV",
    ["image"] = "rbxassetid://18974202582",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true,
    ["actsAsSwordGroup"] = true,
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["cooldownId"] = v19.SUMMONER_CLAW_ATTACK,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["replaces"] = { u57.SUMMONER_CLAW_3 }
}
local v1304 = u57.PIT
local v1305 = {
    ["displayName"] = "Construction Pit",
    ["image"] = "rbxassetid://101095778694841",
    ["description"] = "Throw this item to create a pit at its location. Try make enemies fall into the void!"
}
local v1306 = {
    ["fireDelaySec"] = 1,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 10025 ]]
        return "pit"
    end,
    ["ammoItemTypes"] = { u57.PIT },
    ["launchSound"] = { u47.TELEPEARL_THROW },
    ["firstPerson"] = {
        ["fireAnimation"] = u7.FP_USE_ITEM
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.PUNCH
    }
}
v1305.projectileSource = v1306
u93[v1304] = v1305
local v1307 = u57.GUARDS_SPEAR
local v1308 = {
    ["displayName"] = "Spear",
    ["image"] = "rbxassetid://127232846136294",
    ["sharingDisabled"] = true
}
local v1309 = {
    ["damage"] = 30,
    ["attackSpeed"] = 0.5,
    ["attackRange"] = 17.5,
    ["respectAttackSpeedForEffects"] = true,
    ["swingAnimations"] = {},
    ["idleAnimation"] = u7.SCYTHE_HOLD,
    ["chargedAttack"] = {
        ["minChargeTimeSec"] = 0.2,
        ["maxChargeTimeSec"] = 1,
        ["walkSpeedModifier"] = {
            ["multiplier"] = 1,
            ["delay"] = 0.2
        },
        ["chargedSwingAnimations"] = {},
        ["firstPersonChargedSwingAnimations"] = { u7.FP_TWIRLBLADE_ATTACK_2 }
    }
}
v1308.sword = v1309
v1308.firstPerson = {
    ["scale"] = 0.8,
    ["verticalOffset"] = -1.2
}
local v1310 = {
    {
        ["tierDescription"] = { "Applies poison on hit" }
    },
    {
        ["tierDescription"] = { "Increased damage" }
    }
}
v1308.tierUpgradeElements = v1310
u93[v1307] = v1308
local v1311 = u57.INVISIBLE_CLOAK
local v1312 = {
    ["displayName"] = "Cloak",
    ["description"] = "become invisible after staying still",
    ["image"] = "rbxassetid://18952530979",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["backpack"] = {
        ["cooldown"] = 10
    }
}
local v1313 = {
    {
        ["tierDescription"] = { "Gain critical strike for a short period after leaving invisibility" }
    },
    {
        ["tierDescription"] = { "Landing a critical strike grants a temporary speed boost" }
    },
    {
        ["tierDescription"] = { "Gain critical strike for longer after leaving invisibility" }
    }
}
v1312.tierUpgradeElements = v1313
u93[v1311] = v1312
local v1314 = u57.UNSTABLE_PORTAL
local v1315 = {
    ["displayName"] = "Unstable Portal",
    ["image"] = "rbxassetid://100881763858968",
    ["description"] = "Teleport you to a random location",
    ["sharingDisabled"] = true,
    ["consumable"] = {
        ["consumeTime"] = 0.5,
        ["blockingStatusEffects"] = { v48.GROUNDED }
    },
    ["maxStackSize"] = {
        ["amount"] = 2
    }
}
u93[v1314] = v1315
u93[u57.POGO_STICK] = {
    ["displayName"] = "Pogo Stick",
    ["image"] = "rbxassetid://105174521741104",
    ["description"] = ""
}
local v1316 = u57.SPRING_PUNCH
local v1317 = {
    ["displayName"] = "Punch Gun",
    ["description"] = "Yeet your enemies with a spring loaded punch!",
    ["image"] = "rbxassetid://89187423732739",
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["thirdPerson"] = {
        ["holdAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    },
    ["firstPerson"] = {
        ["scale"] = 0.8
    }
}
u93[v1316] = v1317
local v1318 = u57.ROYALE_BED
local v1319 = {
    ["displayName"] = "Bed",
    ["footstepSound"] = v46.WOOD,
    ["block"] = {
        ["blastProof"] = true,
        ["blastResistance"] = 10000000,
        ["seeThrough"] = true,
        ["disableInventoryPickup"] = true,
        ["health"] = 18,
        ["healthType"] = v3.GLOBAL,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "royale-bed" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 12005
            }
        }
    }
}
u93[v1318] = v1319
local v1320 = u57.GRAVE_TRAP
local v1321 = {
    ["displayName"] = "Grave Trap",
    ["image"] = "rbxassetid://7498163110",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 18,
        ["disableInventoryPickup"] = true,
        ["maxPlaced"] = 1,
        ["breakType"] = v2.STONE,
        ["breakSound"] = function() --[[ Name: breakSound, Line 10153 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "GraveTrap" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8022
            }
        }
    }
}
u93[v1320] = v1321
local v1322 = u57.IRON_PICKAXE_SWORD
local v1323 = {
    ["displayName"] = "Iron PickAxe",
    ["image"] = "rbxassetid://6875481325",
    ["description"] = "Handy tool for mining crystals",
    ["sword"] = {
        ["damage"] = 1,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["attackSpeed"] = 1,
        ["knockbackMultiplier"] = {
            ["disabled"] = true
        },
        ["swingSounds"] = { u47.JUGGERNAUT_ATTACK_SWING_1 },
        ["swingAnimations"] = {}
    }
}
u93[v1322] = v1323
local v1324 = u57.DIAMOND_PICKAXE_SWORD
local v1325 = {
    ["displayName"] = "Iron PickAxe",
    ["image"] = "rbxassetid://6875481325",
    ["description"] = "Handy tool for mining crystals",
    ["sword"] = {
        ["damage"] = 1,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["attackSpeed"] = 1,
        ["knockbackMultiplier"] = {
            ["disabled"] = true
        },
        ["swingSounds"] = { u47.JUGGERNAUT_ATTACK_SWING_1 },
        ["swingAnimations"] = {}
    }
}
u93[v1324] = v1325
local v1326 = u57.SPIDER_QUEEN_WEB
local v1327 = {
    ["displayName"] = "Spider Queen\'s Web",
    ["description"] = "",
    ["image"] = "rbxassetid://15056224013",
    ["block"] = {
        ["cannotPathfindOn"] = true,
        ["seeThrough"] = true,
        ["noSuffocation"] = true,
        ["health"] = 1,
        ["disableInventoryPickup"] = true,
        ["disableInCreative"] = true,
        ["flammable"] = true,
        ["flameSpreadStopChance"] = 0.1,
        ["blastResistance"] = 0.3,
        ["breakType"] = v2.WOOL,
        ["hitSound"] = function() --[[ Name: hitSound, Line 10204 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.SPIDER_WEB_BLOCK_BROKEN)
        end,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8033
            }
        }
    }
}
u93[v1326] = v1327
u93[u57.CRYSTAL_ORE] = {
    ["displayName"] = "Mysterious Crystal",
    ["image"] = "rbxassetid://9866758117",
    ["hotbarFillRight"] = true,
    ["displayNameColor"] = v49.mcPink
}
local v1328 = u57.KNIGHT_SHIELD
local v1329 = {
    ["displayName"] = "Guard\'s Shield",
    ["description"] = "Reduces incoming damage and knockback when held and can be used to bash enemies when in a defensive stance.",
    ["sharingDisabled"] = true,
    ["image"] = v35.KNIGHT_SHIELD_RENDER,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["durability"] = {
        ["itemHealth"] = 100
    },
    ["firstPerson"] = {
        ["verticalOffset"] = -0.9
    },
    ["sword"] = {
        ["damage"] = 30,
        ["respectAttackSpeedForEffects"] = true,
        ["applyCooldownOnMiss"] = true,
        ["attackSpeed"] = 0.8,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5
        },
        ["attackRange"] = 3.5 * u17,
        ["swingSounds"] = { u47.JUGGERNAUT_ATTACK_SWING_1, u47.JUGGERNAUT_ATTACK_SWING_2 },
        ["swingAnimations"] = { u7.KNIGHT_SHIELD_THIRD_PERSON_BASH }
    }
}
u93[v1328] = v1329
u93[u57.BLOCK_REPAIR_TOOL] = {
    ["displayName"] = "Repair Tool",
    ["description"] = "Use to repair blocks",
    ["image"] = "rbxassetid://130181835534959",
    ["sharingDisabled"] = true,
    ["blockRepair"] = {}
}
u93[u57.CHRISTMAS_TREE_DEPLOY] = {
    ["displayName"] = "Christmas Tree",
    ["image"] = "rbxassetid://73183813669277",
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
u93[u57.LOVE_CHAIR_DEPLOY] = {
    ["displayName"] = "Love Chair",
    ["image"] = "rbxassetid://83532327016287",
    ["consumable"] = {
        ["consumeTime"] = 1,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
local v1330 = u57.SUMMON_STONE
local v1331 = {
    ["displayName"] = "Summon Stone",
    ["sharingDisabled"] = true,
    ["image"] = v35.SUMMON_STONE,
    ["maxStackSize"] = {
        ["amount"] = v32.MAX_SPIRITS
    }
}
u93[v1330] = v1331
local v1332 = u57.SPIRIT_STAFF
local v1333 = {
    ["displayName"] = "Spirit Staff",
    ["sharingDisabled"] = true,
    ["image"] = v35.SPIRIT_STAFF,
    ["multiProjectileSource"] = {
        ["attack_spirit"] = v33[v34.ATTACK],
        ["heal_spirit"] = v33[v34.HEAL]
    }
}
u93[v1332] = v1333
u93[u57.SPIRIT_TIER_1] = {
    ["displayName"] = "Spirit Tier I",
    ["description"] = "Upgrades your current spirit tier, making your spirits stronger.",
    ["image"] = v35.SPIRIT_SUMMONER_TIER_1_LARGE
}
u93[u57.SPIRIT_TIER_2] = {
    ["displayName"] = "Spirit Tier II",
    ["description"] = "Upgrades your current spirit tier, making your spirits stronger.",
    ["image"] = v35.SPIRIT_SUMMONER_TIER_2_LARGE
}
u93[u57.SPIRIT_TIER_3] = {
    ["displayName"] = "Spirit Tier III",
    ["description"] = "Upgrades your current spirit tier, making your spirits stronger.",
    ["image"] = v35.SPIRIT_SUMMONER_TIER_3_LARGE
}
local v1334 = u57.LOBBY_BOOMERANG
local v1335 = {
    ["displayName"] = "Bananarang",
    ["sharingDisabled"] = true,
    ["image"] = "rbxassetid://115717861330143",
    ["description"] = "Go bananas with this bundle of boomerangs!"
}
local v1336 = {
    ["fireDelaySec"] = 0.3,
    ["maxStrengthChargeSec"] = 1,
    ["minStrengthScalar"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 10317 ]]
        return "bananarang"
    end,
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_LASSO_CHARGE,
        ["fireAnimation"] = u7.FP_USE_ITEM
    }
}
v1335.projectileSource = v1336
u93[v1334] = v1335
u93[u57.LOBBY_KAIDA_CLAW] = {
    ["displayName"] = "Kaida Claw",
    ["image"] = "rbxassetid://18974202582",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true,
    ["actsAsSwordGroup"] = true,
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    },
    ["cooldownId"] = v19.SUMMONER_CLAW_ATTACK,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[u57.LOBBY_POGO_STICK] = {
    ["displayName"] = "Pogo Stick",
    ["image"] = "rbxassetid://105174521741104",
    ["description"] = ""
}
u93[u57.LOBBY_VIP_HOVERBOARD] = {
    ["displayName"] = "Hover T-300",
    ["description"] = "Newest generation of hoverboard developed by Heppy Tech Inc.",
    ["image"] = v35.VIP_HOVER_BOARD
}
u93[u57.LOBBY_SHRINK_POTION] = {
    ["displayName"] = "Shrink Potion",
    ["description"] = "Consume potion to grow yourself a bigger head.",
    ["image"] = "rbxassetid://7911163448",
    ["consumable"] = {
        ["consumeTime"] = 0.8,
        ["potion"] = true
    }
}
u93[u57.LOBBY_DRAGON_MORTAR] = {
    ["displayName"] = "Dragon Mortar",
    ["image"] = "rbxassetid://16212332887",
    ["description"] = "Launch a festive dragon rocket to deal damage in an area!"
}
local v1337 = u57.TEARBLOOM_SEED
local v1338 = {
    ["displayName"] = "Tearbloom Seed",
    ["sharingDisabled"] = true,
    ["image"] = v35.TEARBLOOM_SEED
}
local v1339 = v31.TEARBLOOM_BUFF_HEAL_PER_STACK
v1338.description = "Heals nearby allies for " .. tostring(v1339) .. " health per second when fully grown"
v1338.placesBlock = {
    ["blockType"] = u57.TEARBLOOM_FLOWER
}
u93[v1337] = v1338
local v1340 = u57.TEARBLOOM_FLOWER
local v1341 = {
    ["displayName"] = "Tearbloom Flower"
}
local v1342 = {
    ["denyPlaceOn"] = true,
    ["seeThrough"] = true,
    ["disableInventoryPickup"] = true,
    ["unbreakableByTeammates"] = true,
    ["noRegen"] = true,
    ["hideDamageTextures"] = true,
    ["noSuffocation"] = true,
    ["flammable"] = true,
    ["flameSpreadStopChance"] = 0.4,
    ["disableFlamableByTeammates"] = true,
    ["healthType"] = v3.GLOBAL,
    ["breakType"] = v2.WOOD,
    ["health"] = v31.FLOWER_HEALTH,
    ["placedBy"] = {
        ["itemType"] = u57.TEARBLOOM_SEED
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 10388 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.CROP_PLANT_1, u47.CROP_PLANT_2, u47.CROP_PLANT_3)
    end,
    ["collectionServiceTags"] = { "SpiritGardenerFlower" }
}
v1341.block = v1342
v1341.image = v35.TEARBLOOM_FLOWER
u93[v1340] = v1341
local v1343 = u57.SOULVINE_SEED
local v1344 = {
    ["displayName"] = "Soulvine Seed",
    ["sharingDisabled"] = true
}
local v1345 = v31.SOULVINE_BUFF_DAMAGE_PERCENT_PER_STACK
v1344.description = "Grants nearby allies a " .. tostring(v1345) .. "% damage buff when fully grown"
v1344.image = v35.SOULVINE_SEED
v1344.placesBlock = {
    ["blockType"] = u57.SOULVINE_FLOWER
}
u93[v1343] = v1344
local v1346 = u57.SOULVINE_FLOWER
local v1347 = {
    ["displayName"] = "Soulvine Flower"
}
local v1348 = {
    ["denyPlaceOn"] = true,
    ["seeThrough"] = true,
    ["disableInventoryPickup"] = true,
    ["unbreakableByTeammates"] = true,
    ["noRegen"] = true,
    ["hideDamageTextures"] = true,
    ["noSuffocation"] = true,
    ["flammable"] = true,
    ["flameSpreadStopChance"] = 0.4,
    ["disableFlamableByTeammates"] = true,
    ["healthType"] = v3.GLOBAL,
    ["breakType"] = v2.DIRT,
    ["health"] = v31.FLOWER_HEALTH,
    ["placedBy"] = {
        ["itemType"] = u57.SOULVINE_SEED
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 10423 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.CROP_PLANT_1, u47.CROP_PLANT_2, u47.CROP_PLANT_3)
    end,
    ["collectionServiceTags"] = { "SpiritGardenerFlower" }
}
v1347.block = v1348
v1347.image = v35.SOULVINE_FLOWER
u93[v1346] = v1347
local v1349 = u57.CRYSTALHEART_SEED
local v1350 = {
    ["displayName"] = "Crystalheart Seed",
    ["sharingDisabled"] = true
}
local v1351 = (v31.FLOWER_TEAM_GENERATOR_SPEED_MULTIPLIER - 1) * 100
local v1352 = math.round(v1351)
local v1353 = tostring(v1352)
local v1354 = (v31.FLOWER_GLOBAL_GENERATOR_SPEED_MULTIPLIER - 1) * 100
local v1355 = math.round(v1354)
v1350.description = "Plant near a team generator for a " .. v1353 .. "% speed increase or a global generator for a " .. tostring(v1355) .. "% speed increase when fully grown"
v1350.image = v35.CRYSTALHEART_SEED
v1350.placesBlock = {
    ["blockType"] = u57.CRYSTALHEART_FLOWER
}
u93[v1349] = v1350
local v1356 = u57.CRYSTALHEART_FLOWER
local v1357 = {
    ["displayName"] = "Crystalheart Flower"
}
local v1358 = {
    ["denyPlaceOn"] = true,
    ["seeThrough"] = true,
    ["disableInventoryPickup"] = true,
    ["unbreakableByTeammates"] = true,
    ["noRegen"] = true,
    ["hideDamageTextures"] = true,
    ["noSuffocation"] = true,
    ["flammable"] = true,
    ["flameSpreadStopChance"] = 0.4,
    ["disableFlamableByTeammates"] = true,
    ["healthType"] = v3.GLOBAL,
    ["breakType"] = v2.DIRT,
    ["health"] = v31.FLOWER_HEALTH,
    ["placedBy"] = {
        ["itemType"] = u57.CRYSTALHEART_SEED
    },
    ["placeSound"] = function() --[[ Name: placeSound, Line 10458 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.CROP_PLANT_1, u47.CROP_PLANT_2, u47.CROP_PLANT_3)
    end,
    ["collectionServiceTags"] = { "SpiritGardenerFlower" }
}
v1357.block = v1358
u93[v1356] = v1357
local v1359 = u57.VOID_BAIT
local v1360 = {
    ["displayName"] = "Void Rock",
    ["footstepSound"] = v46.VOID,
    ["block"] = {
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 10477 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "void_bait" }
    }
}
u93[v1359] = v1360
local v1361 = u57.SCARAB_PORTAL
local v1362 = {
    ["displayName"] = "Scarab Portal",
    ["footstepSound"] = v46.VOID,
    ["block"] = {
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 10488 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "scarab_portal" }
    }
}
u93[v1361] = v1362
local v1363 = u57.CHRISTMAS_SCAFFOLD
local v1364 = {
    ["displayName"] = "Scaffold",
    ["sharingDisabled"] = true,
    ["footstepSound"] = v46.WOOD
}
local v1365 = {
    ["blastResistance"] = 1.4,
    ["health"] = 1,
    ["disableInventoryPickup"] = true,
    ["flammable"] = true,
    ["breakType"] = v2.WOOD,
    ["greedyMesh"] = {
        ["textures"] = {},
        ["rotation"] = {}
    },
    ["collectionServiceTags"] = { "scaffold" }
}
v1364.block = v1365
u93[v1363] = v1364
local v1366 = u57.CHRISTMAS_DRAWBRIDGE
local v1367 = {
    ["displayName"] = "Bridge Printer",
    ["description"] = "Hit with your hammer to toggle a scaffold bridge!",
    ["sharingDisabled"] = true,
    ["footstepSound"] = v46.STONE
}
local v1368 = {
    ["blastResistance"] = 1.4,
    ["health"] = 10,
    ["disableInventoryPickup"] = true,
    ["maxPlaced"] = 24,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {},
        ["rotation"] = {}
    }
}
v1367.block = v1368
v1367.drawBridgeSource = {}
u93[v1366] = v1367
local v1369 = u57.SNAKE_SHRINE
local v1370 = {
    ["displayName"] = "Snake Shrine",
    ["block"] = {
        ["isImportantBlock"] = true,
        ["blastProof"] = true,
        ["health"] = 20,
        ["breakType"] = v2.WOOD,
        ["collectionServiceTags"] = { "SnakeShrine" }
    }
}
u93[v1369] = v1370
local v1371 = u57.LADDER
local v1372 = {
    ["displayName"] = "Ladder",
    ["image"] = "rbxassetid://85312425413460",
    ["block"] = {
        ["health"] = 10,
        ["hideDamageTextures"] = true,
        ["noSuffocation"] = true,
        ["breakType"] = v2.WOOD,
        ["placeSound"] = function() --[[ Name: placeSound, Line 10544 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_PLACE)
        end,
        ["denyPlaceOnBlockTypes"] = { u57.LADDER, u57.VINE_LADDER },
        ["placementFaces"] = {
            Enum.NormalId.Front,
            Enum.NormalId.Back,
            Enum.NormalId.Left,
            Enum.NormalId.Right
        },
        ["attachmentFace"] = Enum.NormalId.Back,
        ["minecraftConversions"] = {
            {
                ["blockId"] = 65
            }
        }
    }
}
u93[v1371] = v1372
local v1373 = u57.VINE_LADDER
local v1374 = {
    ["displayName"] = "Vine Ladder",
    ["image"] = v35.VINE_TEXTURE,
    ["block"] = {
        ["health"] = 5,
        ["hideDamageTextures"] = true,
        ["noSuffocation"] = true,
        ["breakType"] = v2.WOOD,
        ["placeSound"] = function() --[[ Name: placeSound, Line 10563 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GENERIC_BLOCK_PLACE)
        end
    }
}
u93[v1373] = v1374
u93[u57.FLASK] = {
    ["displayName"] = "Flask",
    ["removeFromCustoms"] = true
}
u93[u57.FLYING_CARPET_DEPLOY] = {
    ["displayName"] = "Flying Carpet",
    ["image"] = "rbxassetid://140415462671020",
    ["description"] = "Your very own flying carpet!",
    ["sharingDisabled"] = true,
    ["consumable"] = {
        ["consumeTime"] = 0,
        ["soundOverride"] = "None",
        ["disableAnimation"] = true
    }
}
local v1375 = u57.SACROPHAGUS
local v1376 = {
    ["displayName"] = "Sacrophagus",
    ["image"] = "rbxassetid://9369048721",
    ["block"] = {
        ["seeThrough"] = true,
        ["health"] = 100,
        ["breakType"] = v2.STONE,
        ["placeSound"] = function() --[[ Name: placeSound, Line 10591 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "sacrophagus" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8010
            }
        }
    }
}
u93[v1375] = v1376
u93[u57.SUMMER_2025_TREASURE_MAP] = {
    ["displayName"] = "Enchanted Map",
    ["description"] = "Follow this map to find a treasure!",
    ["keepOnDeath"] = true,
    ["image"] = v35.SUMMER_2025_TREASURE_MAP,
    ["maxStackSize"] = {
        ["amount"] = 1
    }
}
u93[u57.WATERMELON] = {
    ["displayName"] = "Watermelon",
    ["description"] = "A refreshing summer treat! Just make sure you spit out those seeds!",
    ["image"] = "rbxassetid://129609229617486",
    ["consumable"] = {
        ["consumeTime"] = 1
    }
}
local v1377 = u57.WATER_GUN
local v1378 = {
    ["displayName"] = "Water Gun",
    ["description"] = "Soak enemies and put out fires!",
    ["image"] = "rbxassetid://102523795493590",
    ["sharingDisabled"] = true
}
local v1379 = {
    ["fireDelaySec"] = 0.3,
    ["projectileType"] = function() --[[ Name: projectileType, Line 10624 ]]
        return "water"
    end,
    ["launchSound"] = {
        u47.WATER_SHOT_1,
        u47.WATER_SHOT_2,
        u47.WATER_SHOT_3,
        u47.WATER_SHOT_4
    },
    ["thirdPerson"] = {
        ["aimAnimation"] = u7.HEADHUNTER_AIM,
        ["fireAnimation"] = u7.HEADHUNTER_SHOOT
    }
}
v1378.projectileSource = v1379
v1378.firstPerson = {
    ["verticalOffset"] = -1,
    ["horizontalOffset"] = 1
}
u93[v1377] = v1378
u93[u57.HIVE_UPGRADE_1] = {
    ["displayName"] = "Hive Upgrade 1",
    ["description"] = "Increase Duration of hive",
    ["image"] = v35.SCARAB_SPAWNER_1
}
u93[u57.HIVE_UPGRADE_2] = {
    ["displayName"] = "Hive Upgrade 2",
    ["description"] = "Spawn a exploding scarab once a while",
    ["image"] = v35.SCARAB_SPAWNER_2
}
u93[u57.HIVE_UPGRADE_3] = {
    ["displayName"] = "Hive Upgrade 3",
    ["description"] = "Have a chance to spawn an extra scarab",
    ["image"] = v35.SCARAB_SPAWNER_3
}
u93[u57.SCARAB_UPGRADE_1] = {
    ["displayName"] = "Scarab Upgrade 1",
    ["description"] = "Increase Scarab\'s health and damage and let them fly",
    ["image"] = v35.SCARAB_1
}
u93[u57.SCARAB_UPGRADE_2] = {
    ["displayName"] = "Scarab Upgrade 2",
    ["description"] = "Increase Scarab\'s health,damage and movement speed",
    ["image"] = v35.SCARAB_2
}
u93[u57.SCARAB_UPGRADE_3] = {
    ["displayName"] = "Scarab Upgrade 3",
    ["description"] = "Increase Scarab\'s health and damage. Heal owner for 1 hp whenever they damage a player",
    ["image"] = v35.SCARAB_2
}
local v1380 = u57.SCARAB_SPAWNER
local v1381 = {
    ["displayName"] = "Hive",
    ["sharingDisabled"] = true,
    ["keepOnDeath"] = true,
    ["footstepSound"] = v46.VOID,
    ["block"] = {
        ["disableInventoryPickup"] = true,
        ["health"] = 25,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 10675 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end,
        ["collectionServiceTags"] = { "scarab_spawner" }
    },
    ["image"] = v35.SCARAB_SPAWNER_1
}
u93[v1380] = v1381
local v1382 = u57.WOOD_GUN_BLADE
local v1383 = {
    ["displayName"] = "Wood Cutlass and Blunderbuss",
    ["image"] = "rbxassetid://79195284970214",
    ["sword"] = {
        ["damage"] = 20,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1382] = v1383
local v1384 = u57.STONE_GUN_BLADE
local v1385 = {
    ["displayName"] = "Stone Cutlass and Blunderbuss",
    ["image"] = "rbxassetid://125306754061543",
    ["sword"] = {
        ["damage"] = 25,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1384] = v1385
local v1386 = u57.IRON_GUN_BLADE
local v1387 = {
    ["displayName"] = "Iron Cutlass and Blunderbuss",
    ["image"] = "rbxassetid://111154025975229",
    ["sword"] = {
        ["damage"] = 30,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1386] = v1387
local v1388 = u57.DIAMOND_GUN_BLADE
local v1389 = {
    ["displayName"] = "Diamond Cutlass and Blunderbuss",
    ["image"] = "rbxassetid://95595318707967",
    ["sword"] = {
        ["damage"] = 42,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1388] = v1389
local v1390 = u57.EMERALD_GUN_BLADE
local v1391 = {
    ["displayName"] = "Emerald Cutlass and Blunderbuss",
    ["image"] = "rbxassetid://135393616103486",
    ["sword"] = {
        ["damage"] = 55,
        ["attackSpeed"] = u53.SWORD_SWING_COOLDOWN
    },
    ["firstPerson"] = {
        ["scale"] = 0.8,
        ["verticalOffset"] = -1.2
    }
}
u93[v1390] = v1391
local v1392 = u57.PILLOW
local v1393 = {
    ["displayName"] = "Pillow",
    ["description"] = "Usage: Place under your head when sleeping to achieve maximum comfort.",
    ["image"] = "rbxassetid://77581289137921"
}
local v1394 = {
    ["damage"] = 1,
    ["respectAttackSpeedForEffects"] = true,
    ["applyCooldownOnMiss"] = true,
    ["multiHitCheckDurationSec"] = 0.25,
    ["attackSpeed"] = u53.HAMMER_SWING_COOLDOWN,
    ["attackRange"] = 5 * u17,
    ["swingSounds"] = { u47.GAUNTLETS_JAB_SWING_1, u47.GAUNTLETS_JAB_SWING_2 },
    ["swingAnimations"] = { u7.GREAT_HAMMER_SWING_1, u7.GREAT_HAMMER_SWING_2 },
    ["firstPersonSwingAnimations"] = { u7.GREAT_HAMMER_SWING_1_FP, u7.GREAT_HAMMER_SWING_2_FP },
    ["knockbackMultiplier"] = {
        ["horizontal"] = 1.2,
        ["vertical"] = 1.1
    }
}
local v1395 = {
    ["showHoldProgressAfterSec"] = 0.25,
    ["attackCooldown"] = 0.65,
    ["bonusDamage"] = 1,
    ["maxChargeTimeSec"] = u53.HAMMER_CHARGE_TIME,
    ["minChargeTimeSec"] = u53.HAMMER_CHARGE_TIME,
    ["bonusKnockback"] = {
        ["horizontal"] = 0.2,
        ["vertical"] = 0.1
    },
    ["walkSpeedModifier"] = {
        ["multiplier"] = 0.9
    },
    ["chargingEffects"] = {
        ["thirdPersonAnim"] = u7.GREAT_HAMMER_CHARGE,
        ["firstPersonAnim"] = u7.GREAT_HAMMER_CHARGE_FP
    },
    ["chargedSwingAnimations"] = { u7.JUGGERNAUT_ATTACK_3 },
    ["firstPersonChargedSwingAnimations"] = { u7.JUGGERNAUT_ATTACK_3_FP },
    ["chargedSwingSounds"] = { u47.GAUNTLETS_JAB_SWING_2 }
}
v1394.chargedAttack = v1395
v1393.sword = v1394
v1393.firstPerson = {
    ["scale"] = 0.8
}
u93[v1392] = v1393
local v1396 = u57.EXPLODING_TANK_BLOCK
local v1397 = {
    ["displayName"] = "Explosive Tank",
    ["description"] = "Placeable explosive. Hitting it triggers a 1-second countdown before detonation",
    ["image"] = v35.EXPLODING_TANK_BLOCK_RENDER,
    ["maxStackSize"] = {
        ["amount"] = 8
    },
    ["block"] = {
        ["health"] = 50,
        ["blastProof"] = true,
        ["breakType"] = v2.STONE,
        ["hitSound"] = function() --[[ Name: hitSound, Line 10799 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.STONE_BREAK)
        end
    }
}
u93[v1396] = v1397
u93[u57.FIREWORK_BACKPACK] = {
    ["displayName"] = "Firework Backpack",
    ["image"] = "rbxassetid://109643817350168",
    ["description"] = "Launch yourself into the sky with a firework burst! Spawns 2 balloons to float safely back down.",
    ["sharingDisabled"] = true,
    ["maxStackSize"] = {
        ["amount"] = 1
    },
    ["backpack"] = {
        ["activeAbility"] = true
    }
}
local v1398 = u57.AERY_CROWN
local v1399 = {
    ["displayName"] = "Aery Crown",
    ["image"] = "rbxassetid://79496296282171",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 1,
        ["slot"] = v36.HELMET
    }
}
u93[v1398] = v1399
local v1400 = u57.ADETUNDE_CROWN
local v1401 = {
    ["displayName"] = "Adetunde Crown",
    ["image"] = "rbxassetid://112048114059558",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 1,
        ["slot"] = v36.HELMET
    }
}
u93[v1400] = v1401
local v1402 = u57.ELEKTRA_CROWN
local v1403 = {
    ["displayName"] = "Elektra Crown",
    ["image"] = "rbxassetid://93794091382469",
    ["sharingDisabled"] = true,
    ["removeFromCustoms"] = true,
    ["armor"] = {
        ["damageReductionMultiplier"] = 1,
        ["slot"] = v36.HELMET
    }
}
u93[v1402] = v1403
u93[u57.BRB_SIGN] = {
    ["displayName"] = "Brb sign",
    ["image"] = "rbxassetid://75760243397525"
}
local v1404 = u57.GRAVE_TRAP_BLOCK
local v1405 = {
    ["displayName"] = "Grave Trap Block",
    ["footstepSound"] = v46.GUM,
    ["block"] = {
        ["disableInventoryPickup"] = true,
        ["disableEnemyInventoryPickup"] = true,
        ["unbreakable"] = true,
        ["breakType"] = v2.STONE,
        ["breakSound"] = function() --[[ Name: breakSound, Line 10857 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.GUMBALL_LAUNCHER_SPLATTER_1)
        end,
        ["collectionServiceTags"] = { "GraveTrapFloor" },
        ["minecraftConversions"] = {
            {
                ["blockId"] = 8026
            }
        }
    }
}
u93[v1404] = v1405
u93[u57.METEOR_CALLER] = {
    ["displayName"] = "Meteor Caller",
    ["description"] = "Summon a Meteor",
    ["image"] = v35.METEOR_STAFF
}
local v1406 = u57.FROST_STAFF_3
local v1407 = {
    ["displayName"] = "Frost Staff 3",
    ["image"] = "rbxassetid://84295967516516",
    ["description"] = "Switch between frost mist and icicle shots. Both deal damage and apply Cold. Build enough stacks to Freeze enemies.",
    ["sharingDisabled"] = true
}
local v1408 = {
    ["maxStrengthChargeSec"] = 0.75,
    ["fireDelaySec"] = 0.8,
    ["walkSpeedMultiplier"] = 0.35,
    ["projectileType"] = function() --[[ Name: projectileType, Line 10880 ]]
        return "frosty_snowball_3"
    end,
    ["chargeBeginSound"] = { u47.FROST_STAFF_CHARGE },
    ["launchSound"] = { u47.FROST_STAFF_SHOOT },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.SPEAR_STAB_1,
        ["aimAnimation"] = u7.ICE_MAGE_CHARGE
    },
    ["cooldownId"] = v19.FROSTY_GUN_PROJECTILE,
    ["cooldownBar"] = {
        ["colorGradient"] = ColorSequence.new(Color3.fromRGB(4, 255, 255))
    }
}
v1407.projectileSource = v1408
u93[v1406] = v1407
local v1409 = u57.FROST_STAFF_2
local v1410 = {
    ["displayName"] = "Frost Staff 2",
    ["image"] = "rbxassetid://100810918301998",
    ["description"] = "Switch between frost mist and icicle shots. Both deal damage and apply Cold. Build enough stacks to Freeze enemies.",
    ["sharingDisabled"] = true
}
local v1411 = {
    ["maxStrengthChargeSec"] = 0.8,
    ["fireDelaySec"] = 0.9,
    ["walkSpeedMultiplier"] = 0.35,
    ["projectileType"] = function() --[[ Name: projectileType, Line 10908 ]]
        return "frosty_snowball_2"
    end,
    ["chargeBeginSound"] = { u47.FROST_STAFF_CHARGE },
    ["launchSound"] = { u47.FROST_STAFF_SHOOT },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.SPEAR_STAB_1,
        ["aimAnimation"] = u7.ICE_MAGE_CHARGE
    },
    ["cooldownId"] = v19.FROSTY_GUN_PROJECTILE,
    ["cooldownBar"] = {
        ["colorGradient"] = ColorSequence.new(Color3.fromRGB(4, 255, 255))
    }
}
v1410.projectileSource = v1411
u93[v1409] = v1410
local v1412 = u57.FROST_STAFF_1
local v1413 = {
    ["displayName"] = "Frost Staff 1",
    ["description"] = "Switch between frost mist and icicle shots. Both deal damage and apply Cold. Build enough stacks to Freeze enemies.",
    ["image"] = "rbxassetid://85786529113896",
    ["sharingDisabled"] = true
}
local v1414 = {
    ["maxStrengthChargeSec"] = 0.85,
    ["fireDelaySec"] = 1,
    ["walkSpeedMultiplier"] = 0.35,
    ["projectileType"] = function() --[[ Name: projectileType, Line 10936 ]]
        return "frosty_snowball_1"
    end,
    ["chargeBeginSound"] = { u47.FROST_STAFF_CHARGE },
    ["launchSound"] = { u47.FROST_STAFF_SHOOT },
    ["firstPerson"] = {
        ["aimAnimation"] = u7.FP_CROSSBOW_AIM,
        ["fireAnimation"] = u7.FP_CROSSBOW_FIRE
    },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.SPEAR_STAB_1,
        ["aimAnimation"] = u7.ICE_MAGE_CHARGE
    },
    ["cooldownId"] = v19.FROSTY_GUN_PROJECTILE,
    ["cooldownBar"] = {
        ["colorGradient"] = ColorSequence.new(Color3.fromRGB(4, 255, 255))
    }
}
v1413.projectileSource = v1414
u93[v1412] = v1413
local v1415 = u57.IRON_ORE
local v1416 = {
    ["displayName"] = "Iron Ore",
    ["footstepSound"] = v46.STONE
}
local v1417 = {
    ["blastResistance"] = 0.5,
    ["health"] = 100,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 10968 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.ORE_HIT_1, u47.ORE_HIT_2, u47.ORE_HIT_3)
    end
}
v1416.block = v1417
u93[v1415] = v1416
local v1418 = u57.DIAMOND_ORE
local v1419 = {
    ["displayName"] = "Diamond Ore",
    ["footstepSound"] = v46.STONE
}
local v1420 = {
    ["blastResistance"] = 0.5,
    ["health"] = 100,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 10983 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.ORE_HIT_1, u47.ORE_HIT_2, u47.ORE_HIT_3)
    end
}
v1419.block = v1420
u93[v1418] = v1419
local v1421 = u57.EMERALD_ORE
local v1422 = {
    ["displayName"] = "Emerald Ore",
    ["footstepSound"] = v46.STONE
}
local v1423 = {
    ["blastResistance"] = 0.5,
    ["health"] = 100,
    ["breakType"] = v2.STONE,
    ["greedyMesh"] = {
        ["textures"] = {}
    },
    ["hitSound"] = function() --[[ Name: hitSound, Line 10998 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u47
        --]]
        return u54(u47.ORE_HIT_1, u47.ORE_HIT_2, u47.ORE_HIT_3)
    end
}
v1422.block = v1423
u93[v1421] = v1422
u93[u57.LOBBY_SNOWBOARD] = {
    ["displayName"] = "Snowboard",
    ["description"] = "Spawn one of three different snowboards. No snow or slopes required!",
    ["image"] = v35.SNOWBOARD
}
u93[u57.LOBBY_SNOWBOARD_SPECIAL] = {
    ["displayName"] = "Gift-Wrapped Snowboard",
    ["description"] = "Spawn a special, gift-wrapped snowboard. No snow or slopes required!",
    ["image"] = v35.SNOWBOARD_SPECIAL
}
local v1424 = u57.SNOW_PILE
local v1425 = {
    ["displayName"] = "Snow Pile",
    ["footstepSound"] = v46.SNOW,
    ["block"] = {
        ["disableInventoryPickup"] = true,
        ["disableEnemyInventoryPickup"] = true,
        ["health"] = 1,
        ["seeThrough"] = true,
        ["canReplace"] = true,
        ["ignoreProjectileCollision"] = true,
        ["ignoreSwordRaycast"] = true,
        ["ignoreAbilityRaycast"] = true,
        ["ignorePathfind"] = true,
        ["requiresSupportingBlock"] = true,
        ["denyPlacingOnPrefabBlocks"] = true,
        ["breakType"] = v2.WOOL,
        ["hitSound"] = function() --[[ Name: hitSound, Line 11018 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.SNOW_FOOTSTEP_1, u47.SNOW_FOOTSTEP_2, u47.SNOW_FOOTSTEP_3, u47.SNOW_FOOTSTEP_4)
        end,
        ["placeSound"] = function() --[[ Name: placeSound, Line 11021 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u47
            --]]
            return u54(u47.SNOW_FOOTSTEP_1, u47.SNOW_FOOTSTEP_2, u47.SNOW_FOOTSTEP_3, u47.SNOW_FOOTSTEP_4)
        end,
        ["collectionServiceTags"] = { "SnowBlock" },
        ["minecraftConversions"] = {}
    }
}
u93[v1424] = v1425
u93[u57.BABY_PENGUIN] = {
    ["displayName"] = "Baby Penguin",
    ["image"] = "rbxassetid://101321886221022",
    ["description"] = "Cute Baby Penguin, return them to Taliyah for reward"
}
local v1426 = u57.WEB_LAUNCHER
local v1427 = {
    ["displayName"] = "Web Launcher",
    ["image"] = "rbxassetid://84336567156604",
    ["description"] = "Maybe this can catch the naughty penguins",
    ["removeFromCustoms"] = true,
    ["cooldownId"] = v19.WEB_LAUNCHER
}
local v1428 = {
    ["fireDelaySec"] = 1,
    ["activeReload"] = true,
    ["projectileType"] = function() --[[ Name: projectileType, Line 11050 ]]
        return "penguin_web"
    end,
    ["launchSound"] = { u47.WEB_LAUNCH },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.ROCKET_LAUNCHER_SHOT,
        ["aimAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    }
}
v1427.projectileSource = v1428
u93[v1426] = v1427
local v1429 = u57.BIG_WEB_LAUNCHER
local v1430 = {
    ["displayName"] = "Web Launcher",
    ["image"] = "rbxassetid://84336567156604",
    ["removeFromCustoms"] = true,
    ["cooldownId"] = v19.BIG_WEB_LAUNCHER
}
local v1431 = {
    ["fireDelaySec"] = 2.2,
    ["activeReload"] = true,
    ["projectileType"] = function() --[[ Name: projectileType, Line 11068 ]]
        return "big_web"
    end,
    ["launchSound"] = { u47.WEB_LAUNCH },
    ["thirdPerson"] = {
        ["fireAnimation"] = u7.ROCKET_LAUNCHER_SHOT,
        ["aimAnimation"] = u7.ROCKET_LAUNCHER_IDLE
    },
    ["beamModifier"] = {
        ["color"] = ColorSequence.new(Color3.fromRGB(255, 0, 0))
    }
}
v1430.projectileSource = v1431
u93[v1429] = v1430
v55(u93)
v56(u93)
return {
    ["ARMOR_SCALE"] = 0.04,
    ["getItemMeta"] = function(p1432) --[[ Name: getItemMeta, Line 11087 ]]
        --[[
        Upvalues:
            [1] = u93
        --]]
        return u93[p1432]
    end,
    ["items"] = u93
}