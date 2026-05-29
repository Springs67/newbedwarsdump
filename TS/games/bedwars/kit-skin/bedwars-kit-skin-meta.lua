local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-skin-type").ProjectileSkin
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").getRankColor
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-monster-definitions").SurvivalMonsterDefinitions
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v21 = {}
local v22 = setmetatable({}, {
    ["__index"] = v21
})
v22.RankedGold = 1
v21[1] = "RankedGold"
v22.RankedPlatinum = 2
v21[2] = "RankedPlatinum"
v22.RankedDiamond = 3
v21[3] = "RankedDiamond"
v22.RankedEmerald = 4
v21[4] = "RankedEmerald"
v22.RankedNightmare = 5
v21[5] = "RankedNightmare"
local u23 = {
    [v20.DEFAULT] = {
        ["name"] = "",
        ["kit"] = nil,
        ["renderImage"] = ""
    },
    [v20.BARBARIAN_DEEP_VOID] = {
        ["name"] = "Deep Void Barbarian",
        ["renderImage"] = "rbxassetid://9166325225",
        ["kit"] = v19.BARBARIAN,
        ["itemSkins"] = { v18.RAGEBLADE_DEEP_VOID }
    },
    [v20.BARBARIAN_VICTORIOUS] = {
        ["name"] = "Victorious Barbarian",
        ["renderImage"] = "rbxassetid://9192775228",
        ["kit"] = v19.BARBARIAN,
        ["itemSkins"] = { v18.RAGEBLADE_VICTORIOUS }
    },
    [v20.AXOLOTL_REINDEER] = {
        ["name"] = "Reindeer Trainer Amy",
        ["renderImage"] = "rbxassetid://9224797101",
        ["kit"] = v19.AXOLOTL
    }
}
local v24 = v20.TRIPLE_SHOT_DEMON_EMPRESS
local v25 = {
    ["name"] = "Demon Empress Vanessa",
    ["renderImage"] = "rbxassetid://9166325649",
    ["kit"] = v19.TRIPLE_SHOT,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.TRIPLE_SHOT_DEMON_EMPRESS
    },
    ["itemSkins"] = {
        v18.FEATHER_BOW_DEMON_EMPRESS_VANESSA,
        v18.WOOD_BOW_DEMON_EMPRESS_VANESSA,
        v18.WOOD_CROSSBOW_DEMON_EMPRESS_VANESSA,
        v18.HEADHUNTER_DEMON_EMPRESS
    }
}
u23[v24] = v25
local v26 = v20.TRIPLE_SHOT_VALENTINE
local v27 = {
    ["name"] = "Valentine Vanessa",
    ["renderImage"] = "rbxassetid://16301432989",
    ["kit"] = v19.TRIPLE_SHOT,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.VALENTINE_VANESSA_KITSKIN
    },
    ["itemSkins"] = { v18.WOOD_BOW_VALENTINE_VANESSA, v18.WOOD_CROSSBOW_VALENTINE_VANESSA, v18.HEADHUNTER_VALENTINE_VANESSA },
    ["multishot"] = {
        ["progressBarColor"] = Color3.fromRGB(255, 117, 179)
    }
}
u23[v26] = v27
u23[v20.VULCAN_LUNAR] = {
    ["name"] = "Lunar Vulcan",
    ["renderImage"] = "rbxassetid://9166325906",
    ["kit"] = v19.VULCAN,
    ["itemSkins"] = { v18.TABLET_LUNAR, v18.CAMERA_TURRET_LUNAR }
}
u23[v20.FREIYA_TIGER_BRAWLER] = {
    ["name"] = "Tiger Brawler Freiya",
    ["renderImage"] = "rbxassetid://9166325781",
    ["kit"] = v19.ICE_QUEEN,
    ["itemSkins"] = { v18.ICE_SWORD_TIGER_BRAWLER }
}
u23[v20.DASHER_TIGER] = {
    ["name"] = "Year of the Tiger Yuzi",
    ["renderImage"] = "rbxassetid://9166335120",
    ["kit"] = v19.DASHER,
    ["itemSkins"] = {
        v18.WOOD_DAO_TIGER,
        v18.STONE_DAO_TIGER,
        v18.IRON_DAO_TIGER,
        v18.DIAMOND_DAO_TIGER,
        v18.EMERALD_DAO_TIGER
    }
}
u23[v20.MINER_SPACE] = {
    ["name"] = "Space Miner",
    ["renderImage"] = "rbxassetid://9166325362",
    ["kit"] = v19.MINER,
    ["itemSkins"] = { v18.MINER_PICKAXE_SPACE },
    ["miner"] = {
        ["pickaxeSkinName"] = "MinerPickaxeSpace"
    }
}
local v28 = v20.AERY_ACADEMY
local v29 = {
    ["name"] = "Academy Aery",
    ["renderImage"] = "rbxassetid://9166325448",
    ["kit"] = v19.AERY,
    ["aery"] = {
        ["butterflyEffect"] = v5.Assets.Effects.AeryButterflyPurple:Clone()
    }
}
u23[v28] = v29
local v30 = v20.MELODY_ROCKSTAR
local v31 = {
    ["name"] = "Rockstar Melody",
    ["renderImage"] = "rbxassetid://9252528354",
    ["kit"] = v19.MELODY,
    ["itemSkins"] = { v18.GUITAR_ROCKSTAR },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.ROCKSTAR_MELODY
    },
    ["melody"] = {
        ["guitarLoopSound"] = v14.GUITAR_LOOP_ROCKSTAR,
        ["guitarHealSound"] = v14.GUITAR_HEAL_1_ROCKSTAR
    }
}
u23[v30] = v31
u23[v20.BAKER_SPIRIT] = {
    ["name"] = "Spirit Baker",
    ["renderImage"] = "rbxassetid://9312838776",
    ["kit"] = v19.BAKER,
    ["itemSkins"] = { v18.APPLE_SPIRIT, v18.PIE_SPIRIT }
}
local v32 = v20.BAKER_VALENTINE
local v33 = {
    ["name"] = "Loveseeker Baker",
    ["renderImage"] = "rbxassetid://124785292617004",
    ["kit"] = v19.BAKER,
    ["itemSkins"] = { v18.APPLE_VALENTINE, v18.PIE_VALENTINE, v18.GOLDEN_APPLE_VALENTINE },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.LOVESEEKER_BAKER
    }
}
u23[v32] = v33
local v34 = v20.FARMER_CLETUS_VALENTINE
local v35 = {
    ["name"] = "Loveseeker Cletus",
    ["renderImage"] = "rbxassetid://129079656947989",
    ["kit"] = v19.FARMER_CLETUS,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.LOVESEEKER_CLETUS
    }
}
u23[v34] = v35
local v36 = v20.AXOLOTL_EASTER_BUNNY
local v37 = {
    ["name"] = "Easter Bunny Amy",
    ["renderImage"] = "rbxassetid://9378298315",
    ["kit"] = v19.AXOLOTL,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.EASTER_BUNNY_AMY
    }
}
u23[v36] = v37
local v38 = v20.FARMER_CLETUS_SPIRIT
local v39 = {
    ["name"] = "Spirit Farmer Cletus",
    ["renderImage"] = "rbxassetid://9439139472",
    ["kit"] = v19.FARMER_CLETUS,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.FARMER_CLETUS_SPIRIT_SKIN
    }
}
u23[v38] = v39
local v40 = v20.CYBER_DJ
local v41 = {
    ["name"] = "DJ Cyber",
    ["renderImage"] = "rbxassetid://9742654484",
    ["kit"] = v19.CYBER,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.CYBER_DJ
    }
}
u23[v40] = v41
u23[v20.YUZI_VICTORIOUS] = {
    ["name"] = "Victorious Yuzi",
    ["renderImage"] = "rbxassetid://9966080881",
    ["kit"] = v19.DASHER,
    ["itemSkins"] = {
        v18.WOOD_DAO_VICTORIOUS,
        v18.STONE_DAO_VICTORIOUS,
        v18.IRON_DAO_VICTORIOUS,
        v18.DIAMOND_DAO_VICTORIOUS,
        v18.EMERALD_DAO_VICTORIOUS
    }
}
u23[v20.SPIRIT_ASSASSIN_PRISMATIC] = {
    ["name"] = "Prismatic Evelynn",
    ["renderImage"] = "rbxassetid://10406965612",
    ["kit"] = v19.SPIRIT_ASSASSIN
}
u23[v20.HANNAH_GHOST] = {
    ["name"] = "Ghost Hannah",
    ["renderImage"] = "rbxassetid://10726577552",
    ["kit"] = v19.HANNAH
}
local v42 = v20.BIGMAN_SPIRIT
local v43 = {
    ["name"] = "Spirit Eldertree",
    ["renderImage"] = "rbxassetid://10726576554",
    ["kit"] = v19.BIGMAN,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.SPIRIT_ELDER_TREE
    }
}
u23[v42] = v43
u23[v20.DAVEY_GHOST] = {
    ["name"] = "Ghost Davey",
    ["renderImage"] = "rbxassetid://10736244575",
    ["kit"] = v19.DAVEY,
    ["itemSkins"] = { v18.CANNON_GHOST }
}
local v44 = v20.DAVEY_DEEPSEA
local v45 = {
    ["name"] = "Deep Sea Davey",
    ["renderImage"] = "rbxassetid://18249740226",
    ["kit"] = v19.DAVEY,
    ["itemSkins"] = { v18.CANNON_DEEPSEA },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.DEEP_SEA_PIRATE_DAVEY_KIT_SKIN
    }
}
u23[v44] = v45
u23[v20.HANNAH_VICTORIOUS] = {
    ["name"] = "Victorious Hannah",
    ["kit"] = v19.HANNAH,
    ["renderImage"] = v6.HANNAH_VICTORIOUS_RENDER
}
local v46 = v20.COWGIRL_MUMMY
local v47 = {
    ["name"] = "Mummy Lassy",
    ["renderImage"] = "rbxassetid://11403417699",
    ["kit"] = v19.COWGIRL,
    ["itemSkins"] = { v18.LASSO_MUMMY },
    ["projectileSkins"] = { v11.MUMMY_LASSO },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.MUMMY_LASSY_SKIN
    }
}
u23[v46] = v47
local v48 = v20.VULCAN_VAMPIRE
local v49 = {
    ["name"] = "Vampire Vulcan",
    ["renderImage"] = "rbxassetid://11466824038",
    ["kit"] = v19.VULCAN,
    ["itemSkins"] = { v18.TABLET_VAMPIRE, v18.CAMERA_TURRET_VAMPIRE },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.VAMPIRE_VULCAN_SKIN
    }
}
u23[v48] = v49
local v50 = v20.VULCAN_CREAM_SODA
local v51 = {
    ["name"] = "Cream Soda Vulcan",
    ["renderImage"] = "rbxassetid://18138007694",
    ["kit"] = v19.VULCAN,
    ["itemSkins"] = { v18.TABLET_CREAM_SODA, v18.CAMERA_TURRET_CREAM_SODA },
    ["vulcan"] = {
        ["projectileColor"] = Color3.new(0.45, 0.94, 0.38)
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.CREAM_SODA_VULCAN_KIT_SKIN
    }
}
u23[v50] = v51
local v52 = v20.GRIM_REAPER_BLOOD_HARVEST
local v53 = {
    ["name"] = "Blood Harvest Grim Reaper",
    ["renderImage"] = "rbxassetid://11531463279",
    ["kit"] = v19.GRIM_REAPER,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.BLOOD_HARVEST_GRIM_REAPER
    },
    ["grimReaper"] = {
        ["soulModelName"] = "GrimReaperBloodHarvestSoul",
        ["consumeSound"] = v14.BLOOD_HARVEST_GRIM_REAPER_CONSUME,
        ["channelSound"] = v14.BLOOD_HARVEST_GRIM_REAPER_CHANNEL,
        ["beamColor"] = ColorSequence.new(v17.mcRed)
    }
}
u23[v52] = v53
local v54 = v20.GRIM_REAPER_EASTER
local v55 = {
    ["name"] = "Easter Rabbit Grim Reaper",
    ["renderImage"] = "rbxassetid://133026429697896",
    ["kit"] = v19.GRIM_REAPER,
    ["grimReaper"] = {
        ["soulModelName"] = "GrimBunny_Egg",
        ["consumeSound"] = v14.EASTER_GRIM_REAPER_CONSUME,
        ["channelSound"] = v14.EASTER_GRIM_REAPER_CHANNEL,
        ["beamColor"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(227, 97, 209)), ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 176, 235)) })
    }
}
u23[v54] = v55
local v56 = v20.NECROMANCER_CHRISTMAS
local v57 = {
    ["name"] = "Cryptmas",
    ["renderImage"] = "rbxassetid://11840556839",
    ["kit"] = v19.NECROMANCER,
    ["itemSkins"] = { v18.NECROMANCER_STAFF_CHRISTMAS },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.CRYPTMAS_KITSKIN
    }
}
u23[v56] = v57
local v58 = v20.CRYPTWRECKED
local v59 = {
    ["name"] = "Crypt-Wrecked",
    ["renderImage"] = "rbxassetid://140079180234676",
    ["kit"] = v19.NECROMANCER,
    ["itemSkins"] = { v18.NECROMANCER_STAFF_WRECKED },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.CRYPT_WRECKED_KITSKIN
    }
}
u23[v58] = v59
local v60 = v20.SILENT_NIGHT_SPIRIT_ASSASSIN
local v61 = {
    ["name"] = "Silent Night Evelynn",
    ["renderImage"] = "rbxassetid://11977367015",
    ["kit"] = v19.SPIRIT_ASSASSIN,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.SILENT_NIGHT_EVELYNN_KIT_SKIN
    },
    ["spiritAssassin"] = {
        ["spinEffect"] = "silentnight_DaggerSpin",
        ["orbModelName"] = "silentnight_SpiritOrb",
        ["spiritDaggerIndicator"] = "silentnight_SpiritDagger",
        ["dagger"] = v18.SILENTNIGHT_SPIRIT_DAGGER,
        ["daggerLeft"] = v18.SILENTNIGHT_SPIRIT_DAGGER_LEFT,
        ["daggerSlashSound"] = v14.SILENTNIGHT_DAGGER_SLASH,
        ["daggerChargeSound"] = v14.SILENTNIGHT_DAGGER_CHARGE,
        ["arcColor"] = v3.hexColor(13759999)
    }
}
u23[v60] = v61
u23[v20.BIGMAN_CHRISTMAS] = {
    ["name"] = "Christmas Eldertree",
    ["renderImage"] = "rbxassetid://11901179543",
    ["kit"] = v19.BIGMAN
}
local v62 = v20.MINER_WINTER
local v63 = {
    ["name"] = "Winter Miner",
    ["renderImage"] = "rbxassetid://11895535823",
    ["kit"] = v19.MINER,
    ["itemSkins"] = { v18.MINER_PICKAXE_WINTER },
    ["miner"] = {
        ["pickaxeSkinName"] = "MinerPickaxeWinter",
        ["petrifyStatueColor"] = Color3.fromRGB(33, 245, 255),
        ["petrifyStatueMaterial"] = Enum.Material.Ice,
        ["pickaxeHitSounds"] = { v14.MINER_STONE_HIT_1, v14.MINER_STONE_HIT_2, v14.MINER_STONE_HIT_3 },
        ["statueBreakSound"] = v14.MINER_STONE_BREAK,
        ["hitParticleColor"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(3, 232, 253)), ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 199, 252)) })
    }
}
u23[v62] = v63
local v64 = v20.GOLD_VICTORIOUS_SPIRIT_ASSASSIN
local v65 = {
    ["name"] = "Victorious Evelynn",
    ["renderImage"] = "rbxassetid://12739721903",
    ["kit"] = v19.SPIRIT_ASSASSIN,
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_SPIRIT_ASSASSIN,
        ["variantIconColor"] = v3.hexColor(16753692),
        ["variantValue"] = v22.RankedGold
    },
    ["spiritAssassin"] = {
        ["spinEffect"] = "gold_victorious_DaggerSpin",
        ["orbModelName"] = "gold_victorious_SpiritOrb",
        ["spiritDaggerIndicator"] = "gold_victorious_SpiritDagger",
        ["dagger"] = v18.GOLD_VICTORIOUS_SPIRIT_DAGGER,
        ["daggerLeft"] = v18.GOLD_VICTORIOUS_SPIRIT_DAGGER_LEFT,
        ["daggerSlashSound"] = v14.GOLD_SPIRIT_DAGGER_SLASH,
        ["daggerChargeSound"] = v14.GOLD_SPIRIT_DAGGER_CHARGE,
        ["arcColor"] = v3.hexColor(16753692)
    }
}
u23[v64] = v65
local v66 = v20.PLATINUM_VICTORIOUS_SPIRIT_ASSASSIN
local v67 = {
    ["name"] = "Victorious Evelynn",
    ["renderImage"] = "rbxassetid://12739721040",
    ["kit"] = v19.SPIRIT_ASSASSIN,
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_SPIRIT_ASSASSIN,
        ["variantIconColor"] = v3.hexColor(63208),
        ["variantValue"] = v22.RankedPlatinum
    },
    ["spiritAssassin"] = {
        ["spinEffect"] = "platinum_victorious_DaggerSpin",
        ["orbModelName"] = "platinum_victorious_SpiritOrb",
        ["spiritDaggerIndicator"] = "platinum_victorious_SpiritDagger",
        ["dagger"] = v18.PLATINUM_VICTORIOUS_SPIRIT_DAGGER,
        ["daggerLeft"] = v18.PLATINUM_VICTORIOUS_SPIRIT_DAGGER_LEFT,
        ["daggerSlashSound"] = v14.PLAT_SPIRIT_DAGGER_SLASH,
        ["daggerChargeSound"] = v14.PLAT_SPIRIT_DAGGER_CHARGE,
        ["arcColor"] = v3.hexColor(63208)
    }
}
u23[v66] = v67
local v68 = v20.DIAMOND_VICTORIOUS_SPIRIT_ASSASSIN
local v69 = {
    ["name"] = "Victorious Evelynn",
    ["renderImage"] = "rbxassetid://12739722035",
    ["kit"] = v19.SPIRIT_ASSASSIN,
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_SPIRIT_ASSASSIN,
        ["variantIconColor"] = v3.hexColor(1391357),
        ["variantValue"] = v22.RankedDiamond
    },
    ["spiritAssassin"] = {
        ["spinEffect"] = "diamond_victorious_DaggerSpin",
        ["orbModelName"] = "diamond_victorious_SpiritOrb",
        ["spiritDaggerIndicator"] = "diamond_victorious_SpiritDagger",
        ["dagger"] = v18.DIAMOND_VICTORIOUS_SPIRIT_DAGGER,
        ["daggerLeft"] = v18.DIAMOND_VICTORIOUS_SPIRIT_DAGGER_LEFT,
        ["daggerSlashSound"] = v14.DIAMOND_SPIRIT_DAGGER_SLASH,
        ["daggerChargeSound"] = v14.DIAMOND_SPIRIT_DAGGER_CHARGE,
        ["arcColor"] = v3.hexColor(1391357)
    }
}
u23[v68] = v69
local v70 = v20.NIGHTMARE_VICTORIOUS_SPIRIT_ASSASSIN
local v71 = {
    ["name"] = "Victorious Evelynn",
    ["renderImage"] = "rbxassetid://12739721381",
    ["kit"] = v19.SPIRIT_ASSASSIN,
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_SPIRIT_ASSASSIN,
        ["variantIconColor"] = v3.hexColor(14890495),
        ["variantValue"] = v22.RankedNightmare
    },
    ["spiritAssassin"] = {
        ["spinEffect"] = "nightmare_victorious_DaggerSpin",
        ["orbModelName"] = "nightmare_victorious_SpiritOrb",
        ["spiritDaggerIndicator"] = "nightmare_victorious_SpiritDagger",
        ["dagger"] = v18.NIGHTMARE_VICTORIOUS_SPIRIT_DAGGER,
        ["daggerLeft"] = v18.NIGHTMARE_VICTORIOUS_SPIRIT_DAGGER_LEFT,
        ["daggerSlashSound"] = v14.NIGHTMARE_SPIRIT_DAGGER_SLASH,
        ["daggerChargeSound"] = v14.NIGHTMARE_SPIRIT_DAGGER_CHARGE,
        ["arcColor"] = v3.hexColor(14890495)
    }
}
u23[v70] = v71
local v72 = v20.HANNAH_BUNNY
local v73 = {
    ["name"] = "Exeggutor Hannah",
    ["renderImage"] = "rbxassetid://13034479411",
    ["kit"] = v19.HANNAH,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.EXEGGCUTOR_HANNAH_KITSKIN
    }
}
u23[v72] = v73
local v74 = v20.BARBARIAN_BUNNY
local v75 = {
    ["name"] = "Barbunny",
    ["renderImage"] = "rbxassetid://13034479626",
    ["kit"] = v19.BARBARIAN,
    ["itemSkins"] = { v18.RAGEBLADE_BUNNY },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.BARBUNNY_KITSKIN
    }
}
u23[v74] = v75
local v76 = v20.GOLD_VICTORIOUS_DAVEY
local v77 = {
    ["name"] = "Victorious Davey",
    ["renderImage"] = "rbxassetid://13905369802",
    ["kit"] = v19.DAVEY,
    ["itemSkins"] = { v18.GOLD_VICTORIOUS_CANNON },
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_DAVEY,
        ["variantIconColor"] = v3.hexColor(16753692),
        ["variantValue"] = v22.RankedGold
    }
}
u23[v76] = v77
local v78 = v20.PLATINUM_VICTORIOUS_DAVEY
local v79 = {
    ["name"] = "Victorious Davey",
    ["renderImage"] = "rbxassetid://13905369482",
    ["kit"] = v19.DAVEY,
    ["itemSkins"] = { v18.PLATINUM_VICTORIOUS_CANNON },
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_DAVEY,
        ["variantIconColor"] = v3.hexColor(63208),
        ["variantValue"] = v22.RankedPlatinum
    }
}
u23[v78] = v79
local v80 = v20.DIAMOND_VICTORIOUS_DAVEY
local v81 = {
    ["name"] = "Victorious Davey",
    ["renderImage"] = "rbxassetid://13905370072",
    ["kit"] = v19.DAVEY,
    ["itemSkins"] = { v18.DIAMOND_VICTORIOUS_CANNON },
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_DAVEY,
        ["variantIconColor"] = v3.hexColor(1391357),
        ["variantValue"] = v22.RankedDiamond
    }
}
u23[v80] = v81
local v82 = v20.EMERALD_VICTORIOUS_DAVEY
local v83 = {
    ["name"] = "Victorious Davey",
    ["renderImage"] = "rbxassetid://13915136377",
    ["kit"] = v19.DAVEY,
    ["itemSkins"] = { v18.EMERALD_VICTORIOUS_CANNON },
    ["variantOfSkin"] = {
        ["variantName"] = "Emerald",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_DAVEY,
        ["variantIconColor"] = v12(v13.EMERALD),
        ["variantValue"] = v22.RankedEmerald
    }
}
u23[v82] = v83
local v84 = v20.NIGHTMARE_VICTORIOUS_DAVEY
local v85 = {
    ["name"] = "Victorious Davey",
    ["renderImage"] = "rbxassetid://13915135860",
    ["kit"] = v19.DAVEY,
    ["itemSkins"] = { v18.NIGHTMARE_VICTORIOUS_CANNON },
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_DAVEY,
        ["variantIconColor"] = v3.hexColor(14890495),
        ["variantValue"] = v22.RankedNightmare
    }
}
u23[v84] = v85
u23[v20.BARBARIAN_CORRUPTED] = {
    ["name"] = "Corrupted Barbarian",
    ["renderImage"] = "rbxassetid://14968427950",
    ["kit"] = v19.BARBARIAN,
    ["itemSkins"] = { v18.RAGEBLADE_CORRUPTED }
}
local v86 = v20.DASHER_CURSED
local v87 = {
    ["name"] = "Hexed Yuzi",
    ["renderImage"] = "rbxassetid://15120946120",
    ["kit"] = v19.DASHER,
    ["itemSkins"] = {
        v18.WOOD_DAO_CURSED,
        v18.STONE_DAO_CURSED,
        v18.IRON_DAO_CURSED,
        v18.DIAMOND_DAO_CURSED,
        v18.EMERALD_DAO_CURSED
    },
    ["yuzi"] = {
        ["cursedYuziSkin"] = true,
        ["dashChargingSound"] = v14.DAO_CURSED_CHARGING,
        ["dashSound"] = { v14.DAO_CURSED_DASH_1, v14.DAO_CURSED_DASH_2, v14.DAO_CURSED_DASH_3 }
    }
}
u23[v86] = v87
local v88 = v20.GRIM_REAPER_VICTORIOUS_GOLD
local v89 = {
    ["name"] = "Victorious Grim Reaper",
    ["renderImage"] = "rbxassetid://15515911104",
    ["kit"] = v19.GRIM_REAPER,
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.GRIM_REAPER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v3.hexColor(16753692),
        ["variantValue"] = v22.RankedGold
    },
    ["grimReaper"] = {
        ["soulModelName"] = "GrimReaperSoulGold",
        ["consumeSound"] = v14.GRIM_REAPER_VICTORIOUS_GOLD_START,
        ["channelSound"] = v14.GRIM_REAPER_VICTORIOUS_GOLD_LOOP,
        ["beamColor"] = ColorSequence.new(v3.hexColor(16753692))
    }
}
u23[v88] = v89
local v90 = v20.GRIM_REAPER_VICTORIOUS_PLATINUM
local v91 = {
    ["name"] = "Victorious Grim Reaper",
    ["renderImage"] = "rbxassetid://17207560726",
    ["kit"] = v19.GRIM_REAPER,
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.GRIM_REAPER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v3.hexColor(63208),
        ["variantValue"] = v22.RankedPlatinum
    },
    ["grimReaper"] = {
        ["soulModelName"] = "GrimReaperSoulPlatinum",
        ["consumeSound"] = v14.GRIM_REAPER_VICTORIOUS_PLAT_START,
        ["channelSound"] = v14.GRIM_REAPER_VICTORIOUS_PLAT_LOOP,
        ["beamColor"] = ColorSequence.new(v3.hexColor(63208))
    }
}
u23[v90] = v91
local v92 = v20.GRIM_REAPER_VICTORIOUS_DIAMOND
local v93 = {
    ["name"] = "Victorious Grim Reaper",
    ["renderImage"] = "rbxassetid://15515911809",
    ["kit"] = v19.GRIM_REAPER,
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.GRIM_REAPER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v3.hexColor(1391357),
        ["variantValue"] = v22.RankedDiamond
    },
    ["grimReaper"] = {
        ["soulModelName"] = "GrimReaperSoulDiamond",
        ["consumeSound"] = v14.GRIM_REAPER_VICTORIOUS_DIAMOND_START,
        ["channelSound"] = v14.GRIM_REAPER_VICTORIOUS_DIAMOND_LOOP,
        ["beamColor"] = ColorSequence.new(v3.hexColor(1391357))
    }
}
u23[v92] = v93
local v94 = v20.GRIM_REAPER_VICTORIOUS_EMERALD
local v95 = {
    ["name"] = "Victorious Grim Reaper",
    ["renderImage"] = "rbxassetid://15515911418",
    ["kit"] = v19.GRIM_REAPER,
    ["variantOfSkin"] = {
        ["variantName"] = "Emerald",
        ["parentSkin"] = v20.GRIM_REAPER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.EMERALD),
        ["variantValue"] = v22.RankedEmerald
    },
    ["grimReaper"] = {
        ["soulModelName"] = "GrimReaperSoulEmerald",
        ["consumeSound"] = v14.GRIM_REAPER_VICTORIOUS_EMERALD_START,
        ["channelSound"] = v14.GRIM_REAPER_VICTORIOUS_EMERALD_LOOP,
        ["beamColor"] = ColorSequence.new(v12(v13.EMERALD))
    }
}
u23[v94] = v95
local v96 = v20.GRIM_REAPER_VICTORIOUS_NIGHTMARE
local v97 = {
    ["name"] = "Victorious Grim Reaper",
    ["renderImage"] = "rbxassetid://15515912152",
    ["kit"] = v19.GRIM_REAPER,
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.GRIM_REAPER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v3.hexColor(14890495),
        ["variantValue"] = v22.RankedNightmare
    },
    ["grimReaper"] = {
        ["soulModelName"] = "GrimReaperSoulNightmare",
        ["consumeSound"] = v14.GRIM_REAPER_VICTORIOUS_NIGHTMARE_START,
        ["channelSound"] = v14.GRIM_REAPER_VICTORIOUS_NIGHTMARE_LOOP,
        ["beamColor"] = ColorSequence.new(v3.hexColor(14890495))
    }
}
u23[v96] = v97
local v98 = v20.WARLOCK_CHRISTMAS_SPIRIT
local v99 = {
    ["name"] = "Christmas Spirit Warlock",
    ["renderImage"] = "rbxassetid://15643553517",
    ["kit"] = v19.WARLOCK,
    ["itemSkins"] = { v18.WARLOCK_STAFF_CHRISTMAS_SPIRIT },
    ["eldric"] = {
        ["staffIcon"] = "rbxassetid://15643992617",
        ["drainCastSound"] = v14.ELDRIC_CHRISTMAS_DRAIN_CAST,
        ["drainLoopSound"] = v14.ELDRIC_CHRISTMAS_DRAIN_LOOP
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.CHRISTMAS_SPIRIT_WARLOCK
    }
}
u23[v98] = v99
local v100 = v20.MILO_GRINCH
local v101 = {
    ["name"] = "Grinch Milo",
    ["renderImage"] = "rbxassetid://15643552967",
    ["kit"] = v19.MIMIC,
    ["milo"] = {
        ["revealSound"] = v14.GRINCH_MILO_REVEAL,
        ["disguiseSound"] = v14.GRINCH_MILO_DISGUISE
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.GRINCH_MILO_KIT_SKIN
    }
}
u23[v100] = v101
local v102 = v20.MELODY_HOLIDAY_COZY
local v103 = {
    ["name"] = "Holiday Cozy Melody",
    ["renderImage"] = "rbxassetid://15699924626",
    ["kit"] = v19.MELODY,
    ["itemSkins"] = { v18.GUITAR_HOLIDAY_COZY },
    ["melody"] = {
        ["guitarLoopSound"] = v14.GUITAR_LOOP_HOLIDAY_COZY,
        ["guitarHealSound"] = v14.GUITAR_HEAL_1_HOLIDAY_COZY,
        ["particleColor"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 20, 60)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(34, 139, 34)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 215, 0))
        })
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.HOLIDAY_COZY_MELODY_KIT_SKIN
    }
}
u23[v102] = v103
local v104 = v20.MELODY_SIREN
local v105 = {
    ["name"] = "Siren Melody",
    ["renderImage"] = "rbxassetid://18250548561",
    ["kit"] = v19.MELODY,
    ["itemSkins"] = { v18.GUITAR_SIREN },
    ["melody"] = {
        ["guitarLoopSound"] = v14.GUITAR_LOOP_SIREN,
        ["guitarHealSound"] = v14.GUITAR_HEAL_1_SIREN,
        ["particleColor"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(227, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(33, 255, 237)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(28, 148, 168)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 33, 46))
        })
    }
}
u23[v104] = v105
local v106 = v20.EMBER_KRAMPUS
local v107 = {
    ["name"] = "Krampus Ember",
    ["renderImage"] = "rbxassetid://15714731006",
    ["kit"] = v19.EMBER,
    ["itemSkins"] = { v18.INFERNAL_SABER_KRAMPUS }
}
local v108 = {
    ["swordChargeSound"] = v14.KRAMPUS_EMBER_SWORD_CHARGE,
    ["swordAttackSound"] = v14.KRAMPUS_EMBER_SWORD_ATTACK,
    ["spinEffectColors"] = {
        ["ring1"] = Color3.fromRGB(255, 89, 89),
        ["ring2"] = Color3.fromRGB(124, 156, 107),
        ["ring3"] = Color3.fromRGB(253, 234, 141)
    }
}
v107.ember = v108
v107.product = {
    ["priceRobux"] = 799,
    ["devProductId"] = v10.EMBER_CHRISTMAS_KIT_SKIN
}
u23[v106] = v107
local v109 = v20.LYLA_FROST_QUEEN
local v110 = {
    ["name"] = "Frost Queen Lyla",
    ["renderImage"] = "rbxassetid://15699921585",
    ["kit"] = v19.LYLA,
    ["itemSkins"] = { v18.FLOWER_BOW_FROST_QUEEN, v18.FLOWER_CROSSBOW_FROST_QUEEN, v18.FLOWER_HEADHUNTER_FROST_QUEEN },
    ["lyla"] = {
        ["customFlowerName"] = "Flower_Frost_Queen",
        ["angryBeesSound"] = v14.FROSTQUEEN_LYLA_ANGRYBEES,
        ["flowerPlantSounds"] = { v14.FROSTQUEEN_LYLA_FLOWERPLANT_1, v14.FROSTQUEEN_LYLA_FLOWERPLANT_2, v14.FROSTQUEEN_LYLA_FLOWERPLANT_3 },
        ["flowerBloomSound"] = v14.FLOWER_BLOOM
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.FROST_QUEEN_LYLA
    }
}
u23[v109] = v110
local v111 = v20.DRAGON_SWORD_LUNAR
local v112 = {
    ["name"] = "Dragon Sword Lian",
    ["renderImage"] = "rbxassetid://16213792383",
    ["kit"] = v19.DRAGON_SWORD,
    ["dragon_sword"] = {
        ["swordModel"] = v5.Assets.Effects.DragonSwordLunar,
        ["swordDragonTransparentModel"] = v5.Assets.Effects.DragonSwordLunarDragonTransparent,
        ["swordIcon"] = v6.CROSSED_SWORDS
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.DRAGON_SWORD_LIAN_KITSKIN
    }
}
u23[v111] = v112
local v113 = v20.ARCHER_LUNAR_DRAGON
local v114 = {
    ["name"] = "Lunar Dragon Archer",
    ["renderImage"] = "rbxassetid://16192555450",
    ["kit"] = v19.ARCHER,
    ["itemSkins"] = { v18.WOOD_BOW_LUNAR_DRAGON, v18.TACTICAL_CROSSBOW_LUNAR_DRAGON, v18.TACTICAL_HEADHUNTER_LUNAR_DRAGON },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.LUNAR_DRAGON_ARCHER_KITSKIN
    }
}
u23[v113] = v114
local v115 = v20.BLOCK_KICKER_VOID
local v116 = {
    ["name"] = "Void Terra",
    ["renderImage"] = "rbxassetid://16831223951",
    ["kit"] = v19.BLOCK_KICKER,
    ["terra"] = {
        ["blockTransparency"] = 0.5,
        ["customBlock"] = v5.Assets.Effects.Terra.VoidBlock,
        ["customBlockImpactEffect"] = v5.Assets.Effects.Terra.VoidBlockImpactExplosion,
        ["blockKickSounds"] = {
            v14.TERRA_VOID_BLOCK_KICK,
            v14.TERRA_VOID_BLOCK_KICK_2,
            v14.TERRA_VOID_BLOCK_KICK_3,
            v14.TERRA_VOID_BLOCK_KICK_4
        },
        ["stompSound"] = v14.TERRA_VOID_STOMP
    }
}
u23[v115] = v116
local v117 = v20.OWL_FIRE
local v118 = {
    ["name"] = "Infernal Whisper",
    ["renderImage"] = "rbxassetid://17191679458",
    ["kit"] = v19.OWL,
    ["itemSkins"] = { v18.OWL_ORB_FIRE },
    ["owl"] = {
        ["owlModel"] = v5.Assets.Effects.FireOwlShooter,
        ["projectileModel"] = v5.Assets.Projectiles.fire_owl_projectile,
        ["owlCuteSound"] = { v14.FIRE_OWL_CUTE_1, v14.FIRE_OWL_CUTE_2 },
        ["owlFlySound"] = v14.FIRE_OWL_FLY,
        ["owlShootSound"] = { v14.FIRE_OWL_SHOOT_1, v14.FIRE_OWL_SHOOT_2, v14.FIRE_OWL_SHOOT_3 },
        ["owlHootSound"] = {
            v14.FIRE_OWL_HOOT_1,
            v14.FIRE_OWL_HOOT_2,
            v14.FIRE_OWL_HOOT_3,
            v14.FIRE_OWL_HOOT_4
        }
    }
}
u23[v117] = v118
local v119 = v20.TALIYAH_EASTER
local v120 = {
    ["name"] = "Easter Taliyah",
    ["renderImage"] = "rbxassetid://16828937833",
    ["kit"] = v19.TALIYAH
}
local v121 = {}
local v122 = {
    ["helmetSkins"] = {
        [v7.LEATHER_HELMET] = "leather_bunny_helmet",
        [v7.IRON_HELMET] = "iron_bunny_helmet",
        [v7.DIAMOND_HELMET] = "diamond_bunny_helmet",
        [v7.EMERALD_HELMET] = "emerald_bunny_helmet",
        [v7.VOID_HELMET] = "void_bunny_helmet"
    }
}
v121.entity = v122
v120.taliyah = v121
u23[v119] = v120
local v123 = v20.FREIYA_BUNNY
local v124 = {
    ["name"] = "Bunny Freiya",
    ["renderImage"] = "rbxassetid://16926153814",
    ["kit"] = v19.ICE_QUEEN,
    ["itemSkins"] = { v18.ICE_SWORD_BUNNY },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.BUNNY_FREIYA_KITSKIN
    }
}
local v125 = {
    ["iceShardGradient"] = ColorSequence.new(Color3.fromRGB(166, 0, 201), Color3.fromRGB(247, 186, 255)),
    ["stackIndicatorColor"] = Color3.fromRGB(247, 186, 255),
    ["explodeSound"] = v14.BUNNY_FREIYA_EXPLODE,
    ["stackSound"] = v14.BUNNY_FREIYA_STACK,
    ["shardImages"] = {
        ["shard1"] = v16("ShardCarrot_1"),
        ["shard2"] = v16("ShardCarrot_2"),
        ["shard3"] = v16("ShardCarrot_3"),
        ["shard4"] = v16("ShardCarrot_4"),
        ["shardsOutline"] = v16("ShardCarrotOutline")
    },
    ["effects"] = {
        ["idle"] = v5.Assets.Effects.Freiya.BunnyKitSkin.FrostBiteIdle,
        ["explode"] = v5.Assets.Effects.Freiya.BunnyKitSkin.FrostBiteExplode,
        ["maxStacks"] = v5.Assets.Effects.Freiya.BunnyKitSkin.FrostBiteMaxStacks
    }
}
v124.freiya = v125
u23[v123] = v124
local v126 = v20.GOLD_VICTORIOUS_LYLA
local v127 = {
    ["name"] = "Victorious Lyla",
    ["renderImage"] = "rbxassetid://17202462512",
    ["kit"] = v19.LYLA,
    ["itemSkins"] = { v18.GOLD_VICTORIOUS_FLOWER_BOW, v18.GOLD_VICTORIOUS_FLOWER_CROSSBOW, v18.GOLD_VICTORIOUS_FLOWER_HEADHUNTER },
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_LYLA,
        ["variantIconColor"] = v3.hexColor(16753692),
        ["variantValue"] = v22.RankedGold
    },
    ["lyla"] = {
        ["customFlowerName"] = "Flower_Gold_Victorious",
        ["angryBeesSound"] = v14.VICTORIOUS_LYLA_GOLD_ANGRYBEES,
        ["flowerPlantSounds"] = { v14.VICTORIOUS_LYLA_GOLD_FLOWERPLANT },
        ["flowerBloomSound"] = v14.VICTORIOUS_LYLA_GOLD_FLOWERBLOOM
    }
}
u23[v126] = v127
local v128 = v20.PLATINUM_VICTORIOUS_LYLA
local v129 = {
    ["name"] = "Victorious Lyla",
    ["renderImage"] = "rbxassetid://17202460529",
    ["kit"] = v19.LYLA,
    ["itemSkins"] = { v18.PLATINUM_VICTORIOUS_FLOWER_BOW, v18.PLATINUM_VICTORIOUS_FLOWER_CROSSBOW, v18.PLATINUM_VICTORIOUS_FLOWER_HEADHUNTER },
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_LYLA,
        ["variantIconColor"] = v3.hexColor(63208),
        ["variantValue"] = v22.RankedPlatinum
    },
    ["lyla"] = {
        ["customFlowerName"] = "Flower_Platinum_Victorious",
        ["angryBeesSound"] = v14.VICTORIOUS_LYLA_PLATINUM_ANGRYBEES,
        ["flowerPlantSounds"] = { v14.VICTORIOUS_LYLA_PLATINUM_FLOWERPLANT },
        ["flowerBloomSound"] = v14.VICTORIOUS_LYLA_PLATINUM_FLOWERBLOOM
    }
}
u23[v128] = v129
local v130 = v20.DIAMOND_VICTORIOUS_LYLA
local v131 = {
    ["name"] = "Victorious Lyla",
    ["renderImage"] = "rbxassetid://17202465548",
    ["kit"] = v19.LYLA,
    ["itemSkins"] = { v18.DIAMOND_VICTORIOUS_FLOWER_BOW, v18.DIAMOND_VICTORIOUS_FLOWER_CROSSBOW, v18.DIAMOND_VICTORIOUS_FLOWER_HEADHUNTER },
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_LYLA,
        ["variantIconColor"] = v3.hexColor(1391357),
        ["variantValue"] = v22.RankedDiamond
    },
    ["lyla"] = {
        ["customFlowerName"] = "Flower_Diamond_Victorious",
        ["angryBeesSound"] = v14.VICTORIOUS_LYLA_DIAMOND_ANGRYBEES,
        ["flowerPlantSounds"] = { v14.VICTORIOUS_LYLA_DIAMOND_FLOWERPLANT },
        ["flowerBloomSound"] = v14.VICTORIOUS_LYLA_DIAMOND_FLOWERBLOOM
    }
}
u23[v130] = v131
local v132 = v20.EMERALD_VICTORIOUS_LYLA
local v133 = {
    ["name"] = "Victorious Lyla",
    ["renderImage"] = "rbxassetid://17202464799",
    ["kit"] = v19.LYLA,
    ["itemSkins"] = { v18.EMERALD_VICTORIOUS_FLOWER_BOW, v18.EMERALD_VICTORIOUS_FLOWER_CROSSBOW, v18.EMERALD_VICTORIOUS_FLOWER_HEADHUNTER },
    ["variantOfSkin"] = {
        ["variantName"] = "Emerald",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_LYLA,
        ["variantIconColor"] = v12(v13.EMERALD),
        ["variantValue"] = v22.RankedEmerald
    },
    ["lyla"] = {
        ["customFlowerName"] = "Flower_Emerald_Victorious",
        ["angryBeesSound"] = v14.VICTORIOUS_LYLA_EMERALD_ANGRYBEES,
        ["flowerPlantSounds"] = { v14.VICTORIOUS_LYLA_EMERALD_FLOWERPLANT },
        ["flowerBloomSound"] = v14.VICTORIOUS_LYLA_EMERALD_FLOWERBLOOM
    }
}
u23[v132] = v133
local v134 = v20.NIGHTMARE_VICTORIOUS_LYLA
local v135 = {
    ["name"] = "Victorious Lyla",
    ["renderImage"] = "rbxassetid://17202461542",
    ["kit"] = v19.LYLA,
    ["itemSkins"] = { v18.NIGHTMARE_VICTORIOUS_FLOWER_BOW, v18.NIGHTMARE_VICTORIOUS_FLOWER_CROSSBOW, v18.NIGHTMARE_VICTORIOUS_FLOWER_HEADHUNTER },
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_LYLA,
        ["variantIconColor"] = v3.hexColor(14890495),
        ["variantValue"] = v22.RankedNightmare
    },
    ["lyla"] = {
        ["customFlowerName"] = "Flower_Nightmare_Victorious",
        ["angryBeesSound"] = v14.VICTORIOUS_LYLA_NIGHTMARE_ANGRYBEES,
        ["flowerPlantSounds"] = { v14.VICTORIOUS_LYLA_NIGHTMARE_FLOWERPLANT },
        ["flowerBloomSound"] = v14.VICTORIOUS_LYLA_NIGHTMARE_FLOWERBLOOM
    }
}
u23[v134] = v135
local v136 = v20.WIZARD_ANNIVERSARY
local v137 = {
    ["name"] = "Anniversary Zeno",
    ["renderImage"] = "rbxassetid://17600952773",
    ["kit"] = v19.WIZARD,
    ["itemSkins"] = { v18.WIZARD_STAFF_ANNIVERSARY, v18.WIZARD_STAFF_2_ANNIVERSARY, v18.WIZARD_STAFF_3_ANNIVERSARY },
    ["wizard"] = {
        ["lightingStrikeColor"] = ColorSequence.new(Color3.fromRGB(212, 135, 212), Color3.fromRGB(172, 117, 171)),
        ["shockwaveColor"] = ColorSequence.new(Color3.fromRGB(212, 135, 212), Color3.fromRGB(172, 117, 171))
    }
}
u23[v136] = v137
local v138 = v20.SHIELDER_SUMMER
local v139 = {
    ["name"] = "Infernal Surfer",
    ["renderImage"] = "rbxassetid://18136507931",
    ["kit"] = v19.SHIELDER,
    ["itemSkins"] = { v18.INFERNAL_SHIELD_SUMMER }
}
local v140 = {
    ["bubbleColor"] = Color3.fromRGB(158, 240, 255),
    ["effectColor"] = Color3.fromRGB(26, 99, 247),
    ["sound"] = {
        ["landingSound"] = v14.INFERNAL_SURFER_LAND,
        ["leapSound"] = v14.INFERNAL_SURFER_LEAP,
        ["launchSound"] = v14.INFERNAL_SURFER_CHARGE
    },
    ["effect"] = v5.Assets.Effects.SummerShielderLanding
}
v139.shielder = v140
u23[v138] = v139
u23[v20.JELLYFISH_PRISMATIC] = {
    ["name"] = "Prismatic Marina",
    ["renderImage"] = "rbxassetid://18136570548",
    ["kit"] = v19.JELLYFISH
}
local v141 = v20.JELLYFISH_DESSERT
local v142 = {
    ["name"] = "Summertime Dessert Marina",
    ["renderImage"] = "rbxassetid://85721380066068",
    ["kit"] = v19.JELLYFISH,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.SUMMERTIME_DESSERT_MARINA
    }
}
u23[v141] = v142
local v143 = v20.MILO_AQUATIC
local v144 = {
    ["name"] = "Aquatic Milo",
    ["renderImage"] = "rbxassetid://18150178161",
    ["kit"] = v19.MIMIC,
    ["milo"] = {
        ["revealSound"] = v14.AQUATIC_MILO_REVEAL,
        ["disguiseSound"] = v14.AQUATIC_MILO_DISGUISE,
        ["blockEffect"] = v5.Assets.Effects.AquaticMimicBlockEffect
    }
}
u23[v143] = v144
local v145 = v20.SORCERER_ICE_QUEEN
local v146 = {
    ["name"] = "Frost Adder",
    ["renderImage"] = "rbxassetid://133106067760123",
    ["kit"] = v19.SORCERER
}
local v147 = {
    ["sound"] = {
        ["chargingLoop"] = v14.SORCERER_ICE_CHARGE_LOOP,
        ["chargeUpgrade1"] = v14.SORCERER_ICE_CHARGE_UPGRADE_1,
        ["chargeUpgrade2"] = v14.SORCERER_ICE_CHARGE_UPGRADE_2,
        ["chargeUpgrade3"] = v14.SORCERER_ICE_CHARGE_UPGRADE_3,
        ["projectileShot"] = v14.SORCERER_ICE_PROJECTILE_SHOT,
        ["projectileHit"] = v14.SORCERER_ICE_PROJECTILE_HIT
    }
}
v146.sorcerer = v147
u23[v145] = v146
local v148 = v20.FISH_TANK_TINKER
local v149 = {
    ["name"] = "Fish Tank Hephaestus",
    ["renderImage"] = "rbxassetid://18939851624",
    ["kit"] = v19.TINKER,
    ["itemSkins"] = {
        v18.FISH_TANK_WOOD_CHAINSAW,
        v18.FISH_TANK_IRON_CHAINSAW,
        v18.FISH_TANK_DIAMOND_CHAINSAW,
        v18.FISH_TANK_EMERALD_CHAINSAW,
        v18.FISH_TANK_VOID_CHAINSAW
    }
}
local v150 = {
    ["models"] = {
        v9.FISH_TANK_TINKER,
        v9.FISH_TANK_IRON_TINKER,
        v9.FISH_TANK_DIAMOND_TINKER,
        v9.FISH_TANK_EMERALD_TINKER,
        v9.FISH_TANK_VOID_TINKER
    },
    ["sound"] = {
        ["footsteps"] = {
            v14.FISH_TANK_TINKER_FOOTSTEP_1,
            v14.FISH_TANK_TINKER_FOOTSTEP_2,
            v14.FISH_TANK_TINKER_FOOTSTEP_3,
            v14.FISH_TANK_TINKER_FOOTSTEP_4
        },
        ["explosion"] = v14.FISH_TANK_TINKER_EXPLODE,
        ["exit"] = v14.FISH_TANK_TINKER_EXIT,
        ["spawn"] = v14.FISH_TANK_TINKER_SPAWN,
        ["attack"] = v14.FISH_TANK_TINKER_ATTACK,
        ["spin"] = v14.FISH_TANK_TINKER_SPIN
    }
}
v149.tinker = v150
u23[v148] = v149
local v151 = v20.GOLD_VICTORIOUS_WIZARD
local v152 = {
    ["name"] = "Victorious Zeno",
    ["renderImage"] = "rbxassetid://103932012875109",
    ["kit"] = v19.WIZARD,
    ["itemSkins"] = { v18.GOLD_VICTORIOUS_WIZARD_STAFF, v18.GOLD_VICTORIOUS_WIZARD_STAFF_2, v18.GOLD_VICTORIOUS_WIZARD_STAFF_3 },
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_WIZARD,
        ["variantIconColor"] = v3.hexColor(16753692),
        ["variantValue"] = v22.RankedGold
    },
    ["wizard"] = {
        ["lightingStrikeColor"] = ColorSequence.new(Color3.fromRGB(233, 191, 21)),
        ["shockwaveSound"] = v14.GOLD_VICTORIOUS_WIZARD_SHOCKWAVE,
        ["shockwaveEffect"] = v5.Assets.Effects.WizardShockwaveGold,
        ["lightningImpactEffect"] = v5.Assets.Effects.WizardImpactGold,
        ["lightningStrikeCastSound"] = v14.VICTORIOUS_WIZARD_CAST,
        ["lightningStrikeOverlay"] = v14.GOLD_VICTORIOUS_WIZARD_LIGHTNING_OVERLAY
    }
}
u23[v151] = v152
local v153 = v20.PLATINUM_VICTORIOUS_WIZARD
local v154 = {
    ["name"] = "Victorious Zeno",
    ["renderImage"] = "rbxassetid://136132786716532",
    ["kit"] = v19.WIZARD,
    ["itemSkins"] = { v18.PLATINUM_VICTORIOUS_WIZARD_STAFF, v18.PLATINUM_VICTORIOUS_WIZARD_STAFF_2, v18.PLATINUM_VICTORIOUS_WIZARD_STAFF_3 },
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_WIZARD,
        ["variantIconColor"] = v3.hexColor(63208),
        ["variantValue"] = v22.RankedPlatinum
    },
    ["wizard"] = {
        ["lightingStrikeColor"] = ColorSequence.new(Color3.fromRGB(98, 247, 230)),
        ["shockwaveSound"] = v14.PLATINUM_VICTORIOUS_WIZARD_SHOCKWAVE,
        ["shockwaveEffect"] = v5.Assets.Effects.WizardShockwavePlatinum,
        ["lightningImpactEffect"] = v5.Assets.Effects.WizardImpactPlatinum,
        ["lightningStrikeCastSound"] = v14.VICTORIOUS_WIZARD_CAST,
        ["lightningStrikeOverlay"] = v14.PLATINUM_VICTORIOUS_WIZARD_LIGHTNING_OVERLAY,
        ["lightningStrikeStaticOverlay"] = v14.PLATINUM_VICTORIOUS_WIZARD_STATIC_OVERLAY
    }
}
u23[v153] = v154
local v155 = v20.DIAMOND_VICTORIOUS_WIZARD
local v156 = {
    ["name"] = "Victorious Zeno",
    ["renderImage"] = "rbxassetid://139136336495485",
    ["kit"] = v19.WIZARD,
    ["itemSkins"] = { v18.DIAMOND_VICTORIOUS_WIZARD_STAFF, v18.DIAMOND_VICTORIOUS_WIZARD_STAFF_2, v18.DIAMOND_VICTORIOUS_WIZARD_STAFF_3 },
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_WIZARD,
        ["variantIconColor"] = v3.hexColor(1391357),
        ["variantValue"] = v22.RankedDiamond
    },
    ["wizard"] = {
        ["lightingStrikeColor"] = ColorSequence.new(Color3.fromRGB(143, 218, 239)),
        ["shockwaveSound"] = v14.DIAMOND_VICTORIOUS_WIZARD_SHOCKWAVE,
        ["shockwaveEffect"] = v5.Assets.Effects.WizardShockwaveDiamond,
        ["lightningImpactEffect"] = v5.Assets.Effects.WizardImpactDiamond,
        ["lightningStrikeCastSound"] = v14.VICTORIOUS_WIZARD_CAST,
        ["lightningStrikeOverlay"] = v14.DIAMOND_VICTORIOUS_WIZARD_LIGHTNING_OVERLAY,
        ["lightningStrikeStaticOverlay"] = v14.DIAMOND_VICTORIOUS_WIZARD_STATIC_OVERLAY
    }
}
u23[v155] = v156
local v157 = v20.EMERALD_VICTORIOUS_WIZARD
local v158 = {
    ["name"] = "Victorious Zeno",
    ["renderImage"] = "rbxassetid://123627231068649",
    ["kit"] = v19.WIZARD,
    ["itemSkins"] = { v18.EMERALD_VICTORIOUS_WIZARD_STAFF, v18.EMERALD_VICTORIOUS_WIZARD_STAFF_2, v18.EMERALD_VICTORIOUS_WIZARD_STAFF_3 },
    ["variantOfSkin"] = {
        ["variantName"] = "Emerald",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_WIZARD,
        ["variantIconColor"] = v12(v13.EMERALD),
        ["variantValue"] = v22.RankedEmerald
    },
    ["wizard"] = {
        ["lightingStrikeColor"] = ColorSequence.new(Color3.fromRGB(104, 250, 128), Color3.fromRGB(246, 246, 122)),
        ["shockwaveSound"] = v14.EMERALD_VICTORIOUS_WIZARD_SHOCKWAVE,
        ["shockwaveEffect"] = v5.Assets.Effects.WizardShockwaveEmerald,
        ["lightningImpactEffect"] = v5.Assets.Effects.WizardImpactEmerald,
        ["lightningStrikeCastSound"] = v14.VICTORIOUS_WIZARD_CAST,
        ["lightningStrikeOverlay"] = v14.EMERALD_VICTORIOUS_WIZARD_LIGHTNING_OVERLAY,
        ["lightningStrikeStaticOverlay"] = v14.EMERALD_VICTORIOUS_WIZARD_STATIC_OVERLAY
    }
}
u23[v157] = v158
local v159 = v20.NIGHTMARE_VICTORIOUS_WIZARD
local v160 = {
    ["name"] = "Victorious Zeno",
    ["renderImage"] = "rbxassetid://108195228684772",
    ["kit"] = v19.WIZARD,
    ["itemSkins"] = { v18.NIGHTMARE_VICTORIOUS_WIZARD_STAFF, v18.NIGHTMARE_VICTORIOUS_WIZARD_STAFF_2, v18.NIGHTMARE_VICTORIOUS_WIZARD_STAFF_3 },
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_WIZARD,
        ["variantIconColor"] = v3.hexColor(14890495),
        ["variantValue"] = v22.RankedNightmare
    },
    ["wizard"] = {
        ["lightingStrikeColor"] = ColorSequence.new(Color3.fromRGB(209, 123, 210), Color3.fromRGB(132, 184, 206)),
        ["shockwaveSound"] = v14.NIGHTMARE_VICTORIOUS_WIZARD_SHOCKWAVE,
        ["shockwaveEffect"] = v5.Assets.Effects.WizardShockwaveNightmare,
        ["lightningImpactEffect"] = v5.Assets.Effects.WizardImpactNightmare,
        ["lightningStrikeCastSound"] = v14.VICTORIOUS_WIZARD_CAST,
        ["lightningStrikeOverlay"] = v14.NIGHTMARE_VICTORIOUS_WIZARD_LIGHTNING_OVERLAY,
        ["lightningStrikeStaticOverlay"] = v14.NIGHTMARE_VICTORIOUS_WIZARD_STATIC_OVERLAY
    }
}
u23[v159] = v160
local v161 = v20.GREAT_WOLF_SILAS
local v162 = {
    ["name"] = "Great Wolf Silas",
    ["renderImage"] = "rbxassetid://90971964651158",
    ["kit"] = v19.REBELLION_LEADER
}
local v163 = {
    ["auraEffect"] = {
        ["damageAura"] = v5.Assets.Effects.RebellionDamageAuraHalloween,
        ["healingAura"] = v5.Assets.Effects.RebellionHealingAuraHalloween
    }
}
v162.rebellion_leader = v163
v162.product = {
    ["priceRobux"] = 799,
    ["devProductId"] = v10.WOLF_SILAS_KIT_SKIN
}
u23[v161] = v162
local v164 = v20.MUMMY_NAZAR
local v165 = {
    ["name"] = "Mummy Nazar",
    ["renderImage"] = "rbxassetid://125675541654240",
    ["kit"] = v19.NAZAR,
    ["itemSkins"] = { v18.LIFE_BOW_MUMMY, v18.LIFE_CROSSBOW_MUMMY, v18.LIFE_HEADHUNTER_MUMMY }
}
local v166 = {
    ["sound"] = {
        ["empowerEnable"] = v14.MUMMY_EMPOWER_ENABLE,
        ["empowerDisable"] = v14.MUMMY_EMPOWER_DISABLE,
        ["consume"] = v14.MUMMY_CONSUME_ACTIVATE
    }
}
v165.nazar = v166
v165.product = {
    ["priceRobux"] = 799,
    ["devProductId"] = v10.MUMMY_NAZAR_KIT_SKIN
}
u23[v164] = v165
local v167 = v20.HALLOWEEN_WREN
local v168 = {
    ["name"] = "Halloween Wren",
    ["renderImage"] = "rbxassetid://78547242956483",
    ["kit"] = v19.BLACK_MARKET_TRADER,
    ["itemSkins"] = { v18.HALLOWEEN_BLACK_MARKET_SHOP },
    ["wren"] = {
        ["summonEffect"] = v5.Assets.Effects.WrenHalloweenSummon
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.HALLOWEEN_WREN_KIT_SKIN
    }
}
u23[v167] = v168
local v169 = v20.BIGMAN_WITHERED
local v170 = {
    ["name"] = "Withered Eldertree",
    ["renderImage"] = "rbxassetid://101905734600766",
    ["kit"] = v19.BIGMAN,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.WITHERED_ELDERTREE_KIT_SKIN
    }
}
u23[v169] = v170
local v171 = v20.SNOWANGEL_KAIDA
local v172 = {
    ["name"] = "Snow Angel Kaida",
    ["renderImage"] = "rbxassetid://84466427112133",
    ["releaseTime"] = 1767049200,
    ["kit"] = v19.SUMMONER,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.SNOW_ANGEL_KAIDA_KIT_SKIN
    },
    ["kaida"] = {
        ["dragon_head"] = v5.Assets.Misc.Kaida.SnowAngel_Summoner_DragonHead,
        ["dragon_claw"] = v5.Assets.Misc.Kaida.SnowAngel_Summoner_DragonClaw,
        ["summon_circle"] = v5.Assets.Misc.Kaida.SnowAngel_Summoner_SummonCircle,
        ["clawAttackSounds"] = {
            v14.SNOWANGEL_SUMMONER_CLAW_ATTACK_1,
            v14.SNOWANGEL_SUMMONER_CLAW_ATTACK_2,
            v14.SNOWANGEL_SUMMONER_CLAW_ATTACK_3,
            v14.SNOWANGEL_SUMMONER_CLAW_ATTACK_4
        },
        ["summonChannelLoopSound"] = v14.SNOWANGEL_SUMMONER_SUMMON_CHANNEL_LOOP,
        ["summonFinishSound"] = v14.SNOWANGEL_SUMMONER_SUMMON_FINISH
    }
}
u23[v171] = v172
local v173 = v20.WITCH_KAIDA
local v174 = {
    ["name"] = "Witch Kaida",
    ["renderImage"] = "rbxassetid://140303387367924",
    ["kit"] = v19.SUMMONER,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.WITCH_KAIDA_KIT_SKIN
    },
    ["kaida"] = {
        ["dragon_head"] = v5.Assets.Misc.Kaida.Witch_Summoner_DragonHead,
        ["dragon_claw"] = v5.Assets.Misc.Kaida.Witch_Summoner_DragonClaw,
        ["summon_circle"] = v5.Assets.Misc.Kaida.Witch_Summoner_SummonCircle
    }
}
u23[v173] = v174
u23[v20.PRISMATIC_KAIDA] = {
    ["name"] = "Prismatic Kaida",
    ["renderImage"] = "rbxassetid://90141408470194",
    ["kit"] = v19.SUMMONER
}
local v175 = v20.JELLYFISH_HOLIDAY
local v176 = {
    ["name"] = "Merry Marina",
    ["renderImage"] = "rbxassetid://139411421471490",
    ["kit"] = v19.JELLYFISH,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.MERRY_MARINA_KIT_SKIN
    }
}
u23[v175] = v176
local v177 = v20.FESTIVE_LUMEN
local v178 = {
    ["name"] = "Festive Lumen",
    ["renderImage"] = "rbxassetid://103698122790962",
    ["kit"] = v19.LUMEN,
    ["itemSkins"] = { v18.HEAVENLY_SWORD_FESTIVE_LUMEN },
    ["lumen"] = {
        ["swordAttackSound"] = v14.FESTIVE_LUMEN_SWORD_ATTACK,
        ["swordChargeSound"] = v14.FESTIVE_LUMEN_SWORD_CHARGE,
        ["heavenlySwordEffect"] = v5.Assets.Effects.FestiveHeavenlySwordEffect,
        ["heavenlySwordWave"] = v7.FESTIVE_SWORD_WAVE,
        ["heavenlySwordWave1"] = v7.FESTIVE_SWORD_WAVE1
    }
}
u23[v177] = v178
local v179 = v20.WRANGLER_REINDEER_LASSY
local v180 = {
    ["name"] = "Wrangler Reindeer Lassy",
    ["renderImage"] = "rbxassetid://76548212118076",
    ["kit"] = v19.COWGIRL,
    ["itemSkins"] = { v18.LASSO_WRANGLER_REINDEER_LASSY },
    ["projectileSkins"] = { v11.WRANGLER_REINDEER_LASSO },
    ["lassy"] = {
        ["lassoSwingSound"] = v14.WRANGLER_REINDEER_LASSO_CHARGE,
        ["lassoThrowSound"] = v14.WRANGLER_REINDEER_LASSO_THROW,
        ["lassoHitSound"] = v14.WRANGLER_REINDEER_LASSO_HIT
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.REINDEER_WRANGLER_LASSY
    }
}
u23[v179] = v180
local v181 = v20.HOLIDAY_WREN
local v182 = {
    ["name"] = "Jovial Wren",
    ["renderImage"] = "rbxassetid://106143723466546",
    ["kit"] = v19.BLACK_MARKET_TRADER,
    ["itemSkins"] = { v18.HOLIDAY_BLACK_MARKET_SHOP },
    ["wren"] = {
        ["summonEffect"] = v5.Assets.Effects.WrenHolidaySummon
    }
}
u23[v181] = v182
local v183 = v20.NUTCRACKER_BUILDER
local v184 = {
    ["name"] = "Nutcracker Builder",
    ["renderImage"] = "rbxassetid://126287381454469",
    ["kit"] = v19.BUILDER,
    ["itemSkins"] = { v18.NUTCRACKER_HAMMER, v18.CHRISTMAS_DRAWBRIDGE, v18.CHRISTMAS_SCAFFOLD },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.NUTCRACKER_BUILDER
    }
}
u23[v183] = v184
local v185 = v20.DASHER_SNOW_RABBIT
local v186 = {
    ["name"] = "Snow Rabbit Yuzi",
    ["renderImage"] = "rbxassetid://128126100734341",
    ["kit"] = v19.DASHER,
    ["itemSkins"] = {
        v18.WOOD_DAO_SNOW_RABBIT,
        v18.STONE_DAO_SNOW_RABBIT,
        v18.IRON_DAO_SNOW_RABBIT,
        v18.DIAMOND_DAO_SNOW_RABBIT,
        v18.EMERALD_DAO_SNOW_RABBIT
    },
    ["yuzi"] = {
        ["soundVolume"] = 0.6,
        ["dashChargingSound"] = v14.DAO_SNOW_RABBIT_CHARGING,
        ["dashSound"] = { v14.DAO_SNOW_RABBIT_DASH_1, v14.DAO_SNOW_RABBIT_DASH_2, v14.DAO_SNOW_RABBIT_DASH_3 }
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.SNOW_RABBIT_YUZI_KIT_SKIN
    }
}
u23[v185] = v186
local v187 = v20.GOLD_VICTORIOUS_TRITON
local v188 = {
    ["name"] = "Victorious Triton",
    ["renderImage"] = "rbxassetid://90665616712516",
    ["kit"] = v19.HARPOON,
    ["itemSkins"] = { v18.GOLD_VICTORIOUS_TRITON },
    ["projectileSkins"] = { v11.GOLD_VICTORIOUS_TRITON },
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_TRITON,
        ["variantIconColor"] = v3.hexColor(16753692),
        ["variantValue"] = v22.RankedGold
    },
    ["triton"] = {
        ["leapSound"] = v14.VICTORIOUS_TRITON_GOLD_LEAP,
        ["throwSound"] = v14.VICTORIOUS_TRITON_GOLD_THROW
    }
}
u23[v187] = v188
local v189 = v20.PLATINUM_VICTORIOUS_TRITON
local v190 = {
    ["name"] = "Victorious Triton",
    ["renderImage"] = "rbxassetid://81435910175357",
    ["kit"] = v19.HARPOON,
    ["itemSkins"] = { v18.PLATINUM_VICTORIOUS_TRITON },
    ["projectileSkins"] = { v11.PLATINUM_VICTORIOUS_TRITON },
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_TRITON,
        ["variantIconColor"] = v3.hexColor(63208),
        ["variantValue"] = v22.RankedPlatinum
    },
    ["triton"] = {
        ["leapSound"] = v14.VICTORIOUS_TRITON_PLATINUM_LEAP,
        ["throwSound"] = v14.VICTORIOUS_TRITON_PLATINUM_THROW
    }
}
u23[v189] = v190
local v191 = v20.DIAMOND_VICTORIOUS_TRITON
local v192 = {
    ["name"] = "Victorious Triton",
    ["renderImage"] = "rbxassetid://94483901427524",
    ["kit"] = v19.HARPOON,
    ["itemSkins"] = { v18.DIAMOND_VICTORIOUS_TRITON },
    ["projectileSkins"] = { v11.DIAMOND_VICTORIOUS_TRITON },
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_TRITON,
        ["variantIconColor"] = v3.hexColor(1391357),
        ["variantValue"] = v22.RankedDiamond
    },
    ["triton"] = {
        ["leapSound"] = v14.VICTORIOUS_TRITON_DIAMOND_LEAP,
        ["throwSound"] = v14.VICTORIOUS_TRITON_DIAMOND_THROW
    }
}
u23[v191] = v192
local v193 = v20.EMERALD_VICTORIOUS_TRITON
local v194 = {
    ["name"] = "Victorious Triton",
    ["renderImage"] = "rbxassetid://87637655623477",
    ["kit"] = v19.HARPOON,
    ["itemSkins"] = { v18.EMERALD_VICTORIOUS_TRITON },
    ["projectileSkins"] = { v11.EMERALD_VICTORIOUS_TRITON },
    ["variantOfSkin"] = {
        ["variantName"] = "Emerald",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_TRITON,
        ["variantIconColor"] = v12(v13.EMERALD),
        ["variantValue"] = v22.RankedEmerald
    },
    ["triton"] = {
        ["leapSound"] = v14.VICTORIOUS_TRITON_EMERALD_LEAP,
        ["throwSound"] = v14.VICTORIOUS_TRITON_EMERALD_THROW
    }
}
u23[v193] = v194
local v195 = v20.NIGHTMARE_VICTORIOUS_TRITON
local v196 = {
    ["name"] = "Victorious Triton",
    ["renderImage"] = "rbxassetid://123747481840286",
    ["kit"] = v19.HARPOON,
    ["itemSkins"] = { v18.NIGHTMARE_VICTORIOUS_TRITON },
    ["projectileSkins"] = { v11.NIGHTMARE_VICTORIOUS_TRITON },
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.GOLD_VICTORIOUS_TRITON,
        ["variantIconColor"] = v3.hexColor(14890495),
        ["variantValue"] = v22.RankedNightmare
    },
    ["triton"] = {
        ["leapSound"] = v14.VICTORIOUS_TRITON_NIGHTMARE_LEAP,
        ["throwSound"] = v14.VICTORIOUS_TRITON_NIGHTMARE_THROW
    }
}
u23[v195] = v196
local v197 = v20.DEMON_TRITON
local v198 = {
    ["name"] = "Demon Triton",
    ["renderImage"] = "rbxassetid://125002865385083",
    ["releaseTime"] = 1762293445,
    ["kit"] = v19.HARPOON,
    ["itemSkins"] = { v18.DEMON_TRITON },
    ["projectileSkins"] = { v11.DEMON_TRITON },
    ["triton"] = {
        ["leapSound"] = v14.DEMON_TRITON_LEAP,
        ["throwSound"] = v14.DEMON_TRITON_THROW,
        ["hitPartSound"] = v14.DEMON_TRITON_HIT_PART,
        ["hitEnemySound"] = v14.DEMON_TRITON_HIT_ENEMY
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.DEMON_TRITON_KIT_SKIN
    }
}
u23[v197] = v198
local v199 = v20.HANNAH_LUNAR
local v200 = {
    ["name"] = "Lunar Hannah",
    ["renderImage"] = "rbxassetid://100219891366707",
    ["kit"] = v19.HANNAH,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.LUNAR_HANNAH_KIT_SKIN
    }
}
u23[v199] = v200
local v201 = v20.VOID_WALKER_HARLEQUIN
local v202 = {
    ["name"] = "Harlequin Trixie",
    ["kit"] = v19.VOID_WALKER,
    ["renderImage"] = v6.VOID_WALKER_HARLEQUIN_RENDER,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.VOID_WALKER_HARLEQUIN
    }
}
u23[v201] = v202
local v203 = v20.BONE_SKOLL
local v204 = {
    ["name"] = "NecroSoul Skoll",
    ["renderImage"] = "rbxassetid://86501858024828",
    ["kit"] = v19.VOID_HUNTER,
    ["skoll"] = {
        ["wolfModel"] = v5.Assets.Misc.Skoll.VoidHunter_BoneWolfProjectile,
        ["hitEffectColor"] = Color3.fromRGB(208, 255, 108),
        ["detonateEffectColor"] = Color3.fromRGB(208, 255, 108),
        ["markEffectColor"] = Color3.fromRGB(208, 255, 108),
        ["detonateSounds"] = { v14.VOID_HUNTER_BONE_DETONATE_1, v14.VOID_HUNTER_BONE_DETONATE_2 },
        ["projectileFireSounds"] = { v14.VOID_HUNTER_BONE_PROJECTILE_FIRE_1, v14.VOID_HUNTER_BONE_PROJECTILE_FIRE_2, v14.VOID_HUNTER_BONE_PROJECTILE_FIRE_3 },
        ["projectileHitSounds"] = { v14.VOID_HUNTER_BONE_PROJECTILE_HIT_1, v14.VOID_HUNTER_BONE_PROJECTILE_HIT_2, v14.VOID_HUNTER_BONE_PROJECTILE_HIT_3 },
        ["chasingLoopSound"] = v14.VOID_HUNTER_BONE_CHASING_LOOP
    }
}
u23[v203] = v204
local v205 = v20.VOID_KNIGHT_ICE
local v206 = {
    ["name"] = "Winterforged Void Knight",
    ["kit"] = v19.VOID_KNIGHT,
    ["renderImage"] = v6.VOID_KNIGHT_ICE_RENDER,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.VOID_KNIGHT_ICE
    },
    ["itemSkins"] = {
        v18.NOCTIUM_BLADE_ICE,
        v18.NOCTIUM_BLADE_2_ICE,
        v18.NOCTIUM_BLADE_3_ICE,
        v18.NOCTIUM_BLADE_4_ICE
    },
    ["void_knight"] = {
        ["ascendSound"] = v14.VOID_KNIGHT_ASCEND_ICE,
        ["consumeSound"] = v14.VOID_KNIGHT_CONSUME_ICE,
        ["levelUpSounds"] = {
            v14.VOID_KNIGHT_LEVEL_UP_1_ICE,
            v14.VOID_KNIGHT_LEVEL_UP_2_ICE,
            v14.VOID_KNIGHT_LEVEL_UP_3_ICE,
            v14.VOID_KNIGHT_LEVEL_UP_4_ICE
        },
        ["shieldBreakSound"] = v14.VOID_KNIGHT_SHIELD_BREAK_ICE,
        ["shieldDamageSounds"] = {
            v14.VOID_KNIGHT_SHIELD_DAMAGE_1_ICE,
            v14.VOID_KNIGHT_SHIELD_DAMAGE_2_ICE,
            v14.VOID_KNIGHT_SHIELD_DAMAGE_3_ICE,
            v14.VOID_KNIGHT_SHIELD_DAMAGE_4_ICE
        }
    }
}
u23[v205] = v206
local v207 = v20.VOID_KNIGHT_PUMPKIN
local v208 = {
    ["name"] = "Pumpkin Void Knight",
    ["releaseTime"] = 1762293445,
    ["kit"] = v19.VOID_KNIGHT,
    ["renderImage"] = v6.VOID_KNIGHT_PUMPKIN_RENDER,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.VOID_KNIGHT_PUMPKIN_KIT_SKIN
    },
    ["itemSkins"] = {
        v18.NOCTIUM_BLADE_PUMPKIN,
        v18.NOCTIUM_BLADE_2_PUMPKIN,
        v18.NOCTIUM_BLADE_3_PUMPKIN,
        v18.NOCTIUM_BLADE_4_PUMPKIN
    },
    ["void_knight"] = {
        ["ascendSound"] = v14.VOID_KNIGHT_ASCEND_PUMPKIN,
        ["consumeSound"] = v14.VOID_KNIGHT_CONSUME_PUMPKIN,
        ["levelUpSounds"] = {
            v14.VOID_KNIGHT_LEVEL_UP_1_PUMPKIN,
            v14.VOID_KNIGHT_LEVEL_UP_2_PUMPKIN,
            v14.VOID_KNIGHT_LEVEL_UP_3_PUMPKIN,
            v14.VOID_KNIGHT_LEVEL_UP_4_PUMPKIN
        },
        ["shieldBreakSound"] = v14.VOID_KNIGHT_SHIELD_BREAK_PUMPKIN,
        ["shieldDamageSounds"] = {
            v14.VOID_KNIGHT_SHIELD_DAMAGE_1_PUMPKIN,
            v14.VOID_KNIGHT_SHIELD_DAMAGE_2_PUMPKIN,
            v14.VOID_KNIGHT_SHIELD_DAMAGE_3_PUMPKIN,
            v14.VOID_KNIGHT_SHIELD_DAMAGE_4_PUMPKIN
        }
    }
}
u23[v207] = v208
local v209 = v20.UMA_EASTER_BUNNY
local v210 = {
    ["name"] = "Bunny Uma",
    ["kit"] = v19.SPIRIT_SUMMONER,
    ["renderImage"] = v6.UMA_EASTER_SKIN_RENDER,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.UMA_EASTER_KIT_SKIN
    },
    ["uma"] = {
        ["attackSpirit"] = v5.Assets.Misc.AttackSpiritEaster,
        ["healSpirit"] = v5.Assets.Misc.HealSpiritEaster,
        ["healSpiritAppearSound"] = v14.HEAL_SPIRIT_EASTER_APPEAR,
        ["attackSpiritAppearSound"] = v14.ATTACK_SPIRIT_EASTER_APPEAR,
        ["spiritSummonedSound"] = v14.SPIRIT_EASTER_SUMMON,
        ["attackSpiritThrowSound"] = v14.ATTACK_SPIRIT_EASTER_THROW,
        ["healSpiritThrowSound"] = v14.HEAL_SPIRIT_EASTER_THROW
    },
    ["itemSkins"] = { v18.SPIRIT_STAFF_EASTER },
    ["projectileSkins"] = { v11.UMA_EASTER_ATTACK_SPIRIT, v11.UMA_EASTER_HEAL_SPIRIT }
}
u23[v209] = v210
local v211 = v20.EASTER_GROVE
local v212 = {
    ["name"] = "Easter Egg Grove",
    ["renderImage"] = "rbxassetid://78994149035122",
    ["kit"] = v19.SPIRIT_GARDENER,
    ["itemSkins"] = { v18.TEARBLOOM_FLOWER_EASTER, v18.CRYSTALHEART_FLOWER_EASTER, v18.SOULVINE_FLOWER_EASTER },
    ["grove"] = {
        ["channelEffect"] = v5.Assets.Effects.SpiritGardenerChannelEffectEaster,
        ["buffEffect"] = v5.Assets.Effects.SoulvineBuffEffectEaster,
        ["buffAppliedSound"] = v14.GROVE_EASTER_BUFF,
        ["collectStartSound"] = v14.GROVE_EASTER_COLLECT_START,
        ["collectedSound"] = v14.GROVE_EASTER_COLLECTED,
        ["channelLoopSound"] = v14.GROVE_EASTER_CHANNEL_LOOP
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.GROVE_EASTER_EGG_KIT_SKIN
    }
}
u23[v211] = v212
local v213 = v20.AMY_VICTORIOUS_GOLD
local v214 = {
    ["name"] = "Victorious Amy",
    ["renderImage"] = "rbxassetid://79266898702034",
    ["kit"] = v19.AXOLOTL,
    ["amy"] = {
        ["applyVariantAxolotlTextures"] = true,
        ["buffSound"] = v14.AMY_VICTORIOUS_BUFF_GOLD,
        ["breakAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_gold,
        ["damageAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_gold,
        ["shieldAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_gold,
        ["healthRegenAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_gold
    },
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.AMY_VICTORIOUS_GOLD,
        ["variantIconColor"] = v3.hexColor(16753692),
        ["variantValue"] = v22.RankedGold
    }
}
u23[v213] = v214
local v215 = v20.AMY_VICTORIOUS_PLATINUM
local v216 = {
    ["name"] = "Victorious Amy",
    ["renderImage"] = "rbxassetid://128292565136304",
    ["kit"] = v19.AXOLOTL,
    ["amy"] = {
        ["applyVariantAxolotlTextures"] = true,
        ["buffSound"] = v14.AMY_VICTORIOUS_BUFF_PLATINUM,
        ["breakAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_platinum,
        ["damageAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_platinum,
        ["shieldAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_platinum,
        ["healthRegenAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_platinum
    },
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.AMY_VICTORIOUS_GOLD,
        ["variantIconColor"] = v3.hexColor(63208),
        ["variantValue"] = v22.RankedPlatinum
    }
}
u23[v215] = v216
local v217 = v20.AMY_VICTORIOUS_DIAMOND
local v218 = {
    ["name"] = "Victorious Amy",
    ["renderImage"] = "rbxassetid://125099158904691",
    ["kit"] = v19.AXOLOTL,
    ["amy"] = {
        ["applyVariantAxolotlTextures"] = true,
        ["buffSound"] = v14.AMY_VICTORIOUS_BUFF_DIAMOND,
        ["breakAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_diamond,
        ["damageAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_diamond,
        ["shieldAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_diamond,
        ["healthRegenAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_diamond
    },
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.AMY_VICTORIOUS_GOLD,
        ["variantIconColor"] = v3.hexColor(1391357),
        ["variantValue"] = v22.RankedDiamond
    }
}
u23[v217] = v218
local v219 = v20.AMY_VICTORIOUS_EMERALD
local v220 = {
    ["name"] = "Victorious Amy",
    ["renderImage"] = "rbxassetid://89818432236151",
    ["kit"] = v19.AXOLOTL,
    ["amy"] = {
        ["applyVariantAxolotlTextures"] = true,
        ["buffSound"] = v14.AMY_VICTORIOUS_BUFF_EMERALD,
        ["breakAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_emerald,
        ["damageAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_emerald,
        ["shieldAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_emerald,
        ["healthRegenAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_emerald
    },
    ["variantOfSkin"] = {
        ["variantName"] = "Emerald",
        ["parentSkin"] = v20.AMY_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.EMERALD),
        ["variantValue"] = v22.RankedEmerald
    }
}
u23[v219] = v220
local v221 = v20.AMY_VICTORIOUS_NIGHTMARE
local v222 = {
    ["name"] = "Victorious Amy",
    ["renderImage"] = "rbxassetid://126676550321627",
    ["kit"] = v19.AXOLOTL,
    ["amy"] = {
        ["applyVariantAxolotlTextures"] = true,
        ["buffSound"] = v14.AMY_VICTORIOUS_BUFF_NIGHTMARE,
        ["breakAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_nightmare,
        ["damageAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_nightmare,
        ["shieldAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_nightmare,
        ["healthRegenAxolotl"] = v5.Assets.Misc.VictoriousAxolotl.axolotl_nightmare
    },
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.AMY_VICTORIOUS_GOLD,
        ["variantIconColor"] = v3.hexColor(14890495),
        ["variantValue"] = v22.RankedNightmare
    }
}
u23[v221] = v222
local v223 = v20.SPIRIT_AGNI
local v224 = {
    ["name"] = "Spirit Agni",
    ["renderImage"] = "rbxassetid://100056584676266",
    ["kit"] = v19.AGNI,
    ["itemSkins"] = { v18.SPIRIT_GRENADE },
    ["agni"] = {
        ["clusterBomb"] = v5.Assets.Misc.SpiritClusterMiniBomb,
        ["clusterBombExplosionEffect"] = v5.Assets.Effects.ClusterBombPop,
        ["satchelSound"] = v14.SPIRIT_AGNI_SATCHEL,
        ["clusterExplodeSounds"] = { v14.SPIRIT_AGNI_CLUSTER_EXPLOSION_1, v14.SPIRIT_AGNI_CLUSTER_EXPLOSION_2, v14.SPIRIT_AGNI_CLUSTER_EXPLOSION_3 },
        ["clusterSpawnSounds"] = { v14.SPIRIT_AGNI_CLUSTER_SPAWN_1, v14.SPIRIT_AGNI_CLUSTER_SPAWN_2, v14.SPIRIT_AGNI_CLUSTER_SPAWN_3 }
    },
    ["projectileSkins"] = { v11.SPIRIT_AGNI_CLUSTER_BOMB }
}
u23[v223] = v224
local v225 = v20.DODO_WHISPER
local v226 = {
    ["name"] = "Dodo Whisper",
    ["kit"] = v19.OWL,
    ["renderImage"] = v6.DODO_WHISPER_KIT_RENDER,
    ["owl"] = {
        ["owlModel"] = v5.Assets.Effects.DodoOwlShooter,
        ["owlCuteSound"] = { v14.DODO_OWL_CUTE_HOOT_1, v14.DODO_OWL_CUTE_HOOT_2 },
        ["owlFlySound"] = v14.DODO_OWL_FLAPPING_LOOP,
        ["owlShootSound"] = { v14.DODO_OWL_PROJECTILE_SHOT_1, v14.DODO_OWL_PROJECTILE_SHOT_2, v14.DODO_OWL_PROJECTILE_SHOT_3 },
        ["owlHootSound"] = { v14.DODO_OWL_HOOT_1, v14.DODO_OWL_HOOT_2, v14.DODO_OWL_HOOT_3 }
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.DODO_WHISPER_KIT_SKIN
    }
}
u23[v225] = v226
local v227 = v20.DODO_EVELYNN
local v228 = {
    ["name"] = "Dodo Evelynn",
    ["kit"] = v19.SPIRIT_ASSASSIN,
    ["renderImage"] = v6.DODO_EVELYNN_KIT_RENDER,
    ["spiritAssassin"] = {
        ["orbModelName"] = "dodo_SpiritOrb",
        ["spiritDaggerIndicator"] = "dodo_SpiritDagger",
        ["dagger"] = v18.DODO_SPIRIT_DAGGER,
        ["daggerLeft"] = v18.DODO_SPIRIT_DAGGER_LEFT,
        ["daggerSlashSound"] = v14.DODO_SPIRIT_ASSASSIN_SLASH_1,
        ["daggerChargeSound"] = v14.DODO_SPIRIT_ASSASSIN_CHARGE
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.DODO_EVELYNN_KIT_SKIN
    }
}
u23[v227] = v228
local v229 = v20.TRINITY_FALLEN
local v230 = {
    ["name"] = "Fallen Angel Trinity",
    ["renderImage"] = "rbxassetid://113788409062796",
    ["kit"] = v19.ANGEL,
    ["trinity"] = {
        ["lightOrbCreateSound"] = v14.TRINITY_FALLEN_SKIN_LIGHT_ORB_CREATE,
        ["darkOrbCreateSound"] = v14.TRINITY_FALLEN_SKIN_DARK_ORB_CREATE,
        ["lightOrbHealSound"] = v14.TRINITY_FALLEN_SKIN_LIGHT_ORB_HEAL,
        ["darkOrbHealSound"] = v14.TRINITY_FALLEN_SKIN_DARK_ORB_HEAL,
        ["lightTransformSound"] = v14.TRINITY_FALLEN_SKIN_LIGHT_TRANSFORM,
        ["darkTransformSound"] = v14.TRINITY_FALLEN_SKIN_DARK_TRANSFORM
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.FALLEN_ANGEL_TRINITY_SKIN
    }
}
u23[v229] = v230
local v231 = v20.VOID_ADETUNDE
local v232 = {
    ["name"] = "Void Adetunde",
    ["kit"] = v19.FROSTY_HAMMER,
    ["renderImage"] = v6.VOID_ADETUNDE_KIT_SKIN_RENDER,
    ["itemSkins"] = { v18.VOID_ADETUNDE_CRYSTAL, v18.VOID_ADETUNDE_HAMMER },
    ["adetunde"] = {
        ["shieldSound"] = v14.VOID_ADETUNDE_SKIN_SHIELD,
        ["shieldBlastSound"] = v14.VOID_ADETUNDE_SKIN_SHIELD_BLAST,
        ["slamSound"] = v14.VOID_ADETUNDE_SKIN_SLAM,
        ["stormStartSound"] = v14.VOID_ADETUNDE_SKIN_STORM_START,
        ["stormLoopSound"] = v14.VOID_ADETUNDE_SKIN_STORM_LOOP,
        ["stormEndSound"] = v14.VOID_ADETUNDE_SKIN_STORM_END,
        ["frostArmorLeft"] = v5.Assets.Effects.FrostArmorLeft_Void,
        ["frostArmorRight"] = v5.Assets.Effects.FrostArmorRight_Void,
        ["frostVest"] = v5.Assets.Effects.FrostVest_Void,
        ["frostHelmet"] = v5.Assets.Effects.FrostHelmet_Void,
        ["frostHammerStormEffect"] = v5.Assets.Effects.FrostHammerStorm_Void,
        ["frostHammerUpgradeModel"] = v5.Assets.Effects.FrostHammerUpgrade_Void,
        ["frostHammerSlamEffect"] = v5.Assets.Effects.FrostHammerSlamEffect_Void,
        ["frostShieldBreakEffect"] = v5.Assets.Effects.FrostShieldBreak_Void,
        ["frostShieldChargingEffect"] = v5.Assets.Effects.FrostShieldCharging_Void,
        ["auraEffect"] = v5.Assets.Effects.FrostHammerAura_Void,
        ["hammerRender"] = v6.VOID_ADETUNDE_AXE_RENDER
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.VOID_ADETUNDE_KIT_SKIN
    }
}
u23[v231] = v232
local v233 = v20.TIDAL_WREN
local v234 = {
    ["name"] = "Tidal Wren",
    ["renderImage"] = "rbxassetid://125051862609822",
    ["kit"] = v19.BLACK_MARKET_TRADER,
    ["itemSkins"] = { v18.TIDAL_BLACK_MARKET_SHOP },
    ["wren"] = {
        ["summonEffect"] = v5.Assets.Effects.WrenTidalSummon
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.TIDAL_WREN_SKIN
    }
}
u23[v233] = v234
u23[v20.LIFEGUARD_LASSY] = {
    ["name"] = "Lifeguard Lassy",
    ["kit"] = v19.COWGIRL,
    ["renderImage"] = v6.LIFEGUARD_LASSY_SKIN_RENDER,
    ["itemSkins"] = { v18.LASSO_LIFEGUARD },
    ["projectileSkins"] = { v11.LIFEGUARD_LASSO }
}
local v235 = v20.BIGMAN_REEF
local v236 = {
    ["name"] = "Elder Reef",
    ["renderImage"] = "rbxassetid://97849884601523",
    ["kit"] = v19.BIGMAN,
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.ELDER_REEF_SKIN
    }
}
u23[v235] = v236
local v237 = v20.GUN_BLADE_SUMMER
local v238 = {
    ["name"] = "Riptide Zarrah",
    ["renderImage"] = "rbxassetid://129296229260713",
    ["kit"] = v19.GUN_BLADE,
    ["itemSkins"] = {
        v18.WOOD_GUN_BLADE_SUMMMER,
        v18.STONE_GUN_BLADE_SUMMMER,
        v18.IRON_GUN_BLADE_SUMMMER,
        v18.DIAMOND_GUN_BLADE_SUMMMER,
        v18.EMERALD_GUN_BLADE_SUMMMER
    }
}
local v239 = {
    ["handGunModel"] = {
        ["wood"] = v5.Assets.Effects.WoodHandGunSummer,
        ["iron"] = v5.Assets.Effects.IronHandGunSummer,
        ["stone"] = v5.Assets.Effects.StoneHandGunSummer,
        ["diamond"] = v5.Assets.Effects.DiamondHandGunSummer,
        ["emerald"] = v5.Assets.Effects.EmeraldHandGunSummer
    },
    ["gunFireEffect"] = v5.Assets.Effects.GunFireEffectSummer,
    ["gunFireSound"] = v14.GUN_BLADE_SHOT_SUMMER,
    ["markTriggerSound"] = v14.GUN_BLADE_TRIGGER_SUMMER
}
v238.gunblade = v239
v238.product = {
    ["priceRobux"] = 799,
    ["devProductId"] = v10.ZARRAH_RIPTIDE_KITSKIN
}
u23[v237] = v238
u23[v20.SHARK_RAMIL] = {
    ["name"] = "Tiger Shark Ramil",
    ["kit"] = v19.AIRBENDER,
    ["renderImage"] = v6.TIGER_SHARK_RAMIL_RENDER
}
local v240 = v20.ARCHER_VICTORIOUS_GOLD
local v241 = {
    ["name"] = "Victorious Archer",
    ["renderImage"] = "rbxassetid://97093084065842",
    ["kit"] = v19.ARCHER,
    ["itemSkins"] = { v18.WOOD_BOW_VICTORIOUS_GOLD, v18.TACTICAL_CROSSBOW_VICTORIOUS_GOLD, v18.TACTICAL_HEADHUNTER_VICTORIOUS_GOLD },
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.ARCHER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.GOLD),
        ["variantValue"] = v22.RankedGold
    }
}
u23[v240] = v241
local v242 = v20.ARCHER_VICTORIOUS_PLATINUM
local v243 = {
    ["name"] = "Victorious Archer",
    ["renderImage"] = "rbxassetid://112428833011833",
    ["kit"] = v19.ARCHER,
    ["itemSkins"] = { v18.WOOD_BOW_VICTORIOUS_PLATINUM, v18.TACTICAL_CROSSBOW_VICTORIOUS_PLATINUM, v18.TACTICAL_HEADHUNTER_VICTORIOUS_PLATINUM },
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.ARCHER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.PLATINUM),
        ["variantValue"] = v22.RankedPlatinum
    }
}
u23[v242] = v243
local v244 = v20.ARCHER_VICTORIOUS_DIAMOND
local v245 = {
    ["name"] = "Victorious Archer",
    ["renderImage"] = "rbxassetid://107180586458632",
    ["kit"] = v19.ARCHER,
    ["itemSkins"] = { v18.WOOD_BOW_VICTORIOUS_DIAMOND, v18.TACTICAL_CROSSBOW_VICTORIOUS_DIAMOND, v18.TACTICAL_HEADHUNTER_VICTORIOUS_DIAMOND },
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.ARCHER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.DIAMOND),
        ["variantValue"] = v22.RankedDiamond
    }
}
u23[v244] = v245
local v246 = v20.ARCHER_VICTORIOUS_EMERALD
local v247 = {
    ["name"] = "Victorious Archer",
    ["renderImage"] = "rbxassetid://140476661368977",
    ["kit"] = v19.ARCHER,
    ["itemSkins"] = { v18.WOOD_BOW_VICTORIOUS_EMERALD, v18.TACTICAL_CROSSBOW_VICTORIOUS_EMERALD, v18.TACTICAL_HEADHUNTER_VICTORIOUS_EMERALD },
    ["variantOfSkin"] = {
        ["variantName"] = "Emerald",
        ["parentSkin"] = v20.ARCHER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.EMERALD),
        ["variantValue"] = v22.RankedEmerald
    }
}
u23[v246] = v247
local v248 = v20.ARCHER_VICTORIOUS_NIGHTMARE
local v249 = {
    ["name"] = "Victorious Archer",
    ["renderImage"] = "rbxassetid://115330953688806",
    ["kit"] = v19.ARCHER,
    ["itemSkins"] = { v18.WOOD_BOW_VICTORIOUS_NIGHTMARE, v18.TACTICAL_CROSSBOW_VICTORIOUS_NIGHTMARE, v18.TACTICAL_HEADHUNTER_VICTORIOUS_NIGHTMARE },
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.ARCHER_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.NIGHTMARE),
        ["variantValue"] = v22.RankedNightmare
    }
}
u23[v248] = v249
local v250 = v20.DRAGON_SWORD_JIANG_SHI
local v251 = {
    ["name"] = "Jiang Shi Lian",
    ["renderImage"] = "rbxassetid://120199730011017",
    ["releaseTime"] = 1762293445,
    ["kit"] = v19.DRAGON_SWORD,
    ["dragon_sword"] = {
        ["swordModel"] = v5.Assets.Effects.DragonSwordJiangShi,
        ["swordCrackModel"] = v5.Assets.Effects.DragonSwordCrackJiangShi,
        ["swordDragonTransparentModel"] = v5.Assets.Effects.DragonSwordDragonTransparentJiangShi,
        ["swordShootSounds"] = { v14.DRAGON_SWORD_JIANG_SHI_SHOOT_1, v14.DRAGON_SWORD_JIANG_SHI_SHOOT_2, v14.DRAGON_SWORD_JIANG_SHI_SHOOT_3 },
        ["swordUltCastSound"] = v14.DRAGON_SWORD_JIANG_SHI_ULT_CAST,
        ["swordUltFallSound"] = v14.DRAGON_SWORD_JIANG_SHI_ULT_FALL,
        ["swordUltLandSound"] = v14.DRAGON_SWORD_JIANG_SHI_ULT_LAND
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.JIANG_SHI_LIAN_KIT_SKIN
    }
}
u23[v250] = v251
local v252 = v20.DAY_OF_THE_DEAD_CACTUS
local v253 = {
    ["name"] = "Day of the Dead Martin",
    ["renderImage"] = "rbxassetid://132407709066720",
    ["releaseTime"] = 1761948000,
    ["kit"] = v19.CACTUS,
    ["cactus"] = {
        ["ballMesh"] = v5.Assets.Effects.DayOfTheDeadCactusBall,
        ["cactusAttachSound"] = v14.DAY_OF_THE_DEAD_CACTUS_ATTACH,
        ["cactusLoopSound"] = v14.DAY_OF_THE_DEAD_CACTUS_LOOP,
        ["orderedCactusAbsorbSounds"] = {
            v14.DAY_OF_THE_DEAD_CACTUS_ABSORB_1,
            v14.DAY_OF_THE_DEAD_CACTUS_ABSORB_2,
            v14.DAY_OF_THE_DEAD_CACTUS_ABSORB_3,
            v14.DAY_OF_THE_DEAD_CACTUS_ABSORB_4
        }
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.DAY_OF_THE_DEAD_CACTUS_KIT_SKIN
    }
}
u23[v252] = v253
local v254 = v20.SUBZERO_MARCEL
local v255 = {
    ["name"] = "Subzero Marcel",
    ["renderImage"] = "rbxassetid://103746230015733",
    ["kit"] = v19.DEFENDER,
    ["itemSkins"] = { v18.SUBZERO_DEFENSE_SCANNER },
    ["marcel"] = {
        ["blockCreationEffect"] = v5.Assets.Effects.BlockCreationEffect,
        ["blockCreationFloorEffect"] = v5.Assets.Effects.BlockCreationFloorEffect,
        ["defenderSchematicBlock"] = v5.Assets.Effects.DefenderSchematicBlock,
        ["createBlockSound"] = {
            v14.DEFENDER_SUBZERO_UPGRADE_DEFENSE_01,
            v14.DEFENDER_SUBZERO_UPGRADE_DEFENSE_02,
            v14.DEFENDER_SUBZERO_UPGRADE_DEFENSE_03,
            v14.DEFENDER_SUBZERO_UPGRADE_DEFENSE_04
        }
    }
}
u23[v254] = v255
local v256 = v20.STARRYSOLDIER_VULCAN
local v257 = {
    ["name"] = "Starry Soldier Vulcan",
    ["renderImage"] = "rbxassetid://119063619591111",
    ["kit"] = v19.VULCAN,
    ["itemSkins"] = { v18.TABLET_STARRYSOLDIER, v18.CAMERA_TURRET_STARRYSOLDIER },
    ["vulcan"] = {
        ["rotateSound"] = v14.TURRET_STARRYSOLDIER_ROTATE,
        ["offSound"] = v14.TURRET_STARRYSOLDIER_OFF,
        ["onSound"] = v14.TURRET_CREAM_SODA_ON,
        ["shootSound"] = { v14.TURRET_STARRYSOLDIER_SHOOT_1 }
    }
}
u23[v256] = v257
local v258 = v20.SNOW_OWL_ADETUNDE
local v259 = {
    ["name"] = "Snow Owl Adetunde",
    ["renderImage"] = "rbxassetid://126338255191170",
    ["kit"] = v19.FROSTY_HAMMER,
    ["itemSkins"] = { v18.SNOW_OWL_ADETUNDE_HAMMER },
    ["adetunde"] = {
        ["shieldSound"] = v14.SNOW_OWL_SKIN_ADETUNDE_SHIELD,
        ["shieldBlastSound"] = v14.SNOW_OWL_SKIN_ADETUNDE_SHIELD_BLAST,
        ["slamSound"] = v14.SNOW_OWL_SKIN_ADETUNDE_SLAM,
        ["stormStartSound"] = v14.SNOW_OWL_SKIN_ADETUNDE_STORM_START,
        ["stormLoopSound"] = v14.SNOW_OWL_SKIN_ADETUNDE_STORM_LOOP,
        ["stormEndSound"] = v14.SNOW_OWL_SKIN_ADETUNDE_STORM_END,
        ["frostArmorLeft"] = v5.Assets.Effects.FrostArmorLeft_SnowOwl,
        ["frostArmorRight"] = v5.Assets.Effects.FrostArmorRight_SnowOwl,
        ["frostVest"] = v5.Assets.Effects.FrostVest_SnowOwl,
        ["frostHelmet"] = v5.Assets.Effects.FrostHelmet_SnowOwl,
        ["frostHammerStormEffect"] = v5.Assets.Effects.FrostHammerStorm_SnowOwl,
        ["frostHammerUpgradeModel"] = v5.Assets.Effects.FrostHammerUpgrade_SnowOwl,
        ["frostHammerSlamEffect"] = v5.Assets.Effects.FrostHammerSlamEffect_SnowOwl,
        ["frostShieldBreakEffect"] = v5.Assets.Effects.FrostShieldBreak_SnowOwl,
        ["frostShieldChargingEffect"] = v5.Assets.Effects.FrostShieldCharging_SnowOwl,
        ["auraEffect"] = v5.Assets.Effects.FrostHammerAura_SnowOwl,
        ["hammerRender"] = v6.SNOW_OWL_ADETUNDE_AXE_RENDER
    }
}
u23[v258] = v259
local v260 = v20.TALIYAH_PENGUIN_QUEEN
local v261 = {
    ["name"] = "Penguin Queen Taliyah",
    ["renderImage"] = "rbxassetid://105076670262964",
    ["kit"] = v19.TALIYAH
}
local v262 = {}
local v263 = {}
local v264 = {}
for v265, v266 in v15[v8.NORMAL_PENGUIN].animations do
    v262[v265] = v266
end
v264.animations = v262
v264.sounds = {
    ["attack"] = v15[v8.NORMAL_PENGUIN].sounds.attack,
    ["deploy"] = v14.PENGUIN_SQUAWK_1,
    ["death"] = v14.PENGUIN_DAMAGED_5,
    ["walk"] = {
        v14.CHICKEN_WALK_1,
        v14.CHICKEN_WALK_2,
        v14.CHICKEN_WALK_3,
        v14.CHICKEN_WALK_4
    }
}
v264.hipHeightOffset = 1
v264.helmetOffset = Vector3.new(0, -1.2, -0.1)
v264.helmetScale = 1.1
v264.helmetBoneName = "head"
v264.modelScale = 0.8
v263.entity = v264
v261.taliyah = v263
u23[v260] = v261
local v267 = v20.BIGMAN_VICTORIOUS_GOLD
local v268 = {
    ["name"] = "Victorious Elder Tree",
    ["renderImage"] = "rbxassetid://126539699425889",
    ["kit"] = v19.BIGMAN,
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.BIGMAN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.GOLD),
        ["variantValue"] = v22.RankedGold
    }
}
u23[v267] = v268
local v269 = v20.BIGMAN_VICTORIOUS_PLATINUM
local v270 = {
    ["name"] = "Victorious Elder Tree",
    ["renderImage"] = "rbxassetid://104921022752724",
    ["kit"] = v19.BIGMAN,
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.BIGMAN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.PLATINUM),
        ["variantValue"] = v22.RankedPlatinum
    }
}
u23[v269] = v270
local v271 = v20.BIGMAN_VICTORIOUS_DIAMOND
local v272 = {
    ["name"] = "Victorious Elder Tree",
    ["renderImage"] = "rbxassetid://85514551421778",
    ["kit"] = v19.BIGMAN,
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.BIGMAN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.DIAMOND),
        ["variantValue"] = v22.RankedDiamond
    }
}
u23[v271] = v272
local v273 = v20.BIGMAN_VICTORIOUS_EMERALD
local v274 = {
    ["name"] = "Victorious Elder Tree",
    ["renderImage"] = "rbxassetid://136943017747001",
    ["kit"] = v19.BIGMAN,
    ["variantOfSkin"] = {
        ["variantName"] = "Emerald",
        ["parentSkin"] = v20.BIGMAN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.EMERALD),
        ["variantValue"] = v22.RankedEmerald
    }
}
u23[v273] = v274
local v275 = v20.BIGMAN_VICTORIOUS_NIGHTMARE
local v276 = {
    ["name"] = "Victorious Elder Tree",
    ["renderImage"] = "rbxassetid://82296438236349",
    ["kit"] = v19.BIGMAN,
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.BIGMAN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.NIGHTMARE),
        ["variantValue"] = v22.RankedNightmare
    }
}
u23[v275] = v276
local v277 = v20.ICE_QUEEN_VICTORIOUS_GOLD
local v278 = {
    ["name"] = "Victorious Freiya",
    ["renderImage"] = "rbxassetid://139921968309435",
    ["kit"] = v19.ICE_QUEEN,
    ["itemSkins"] = { v18.GOLD_VICTORIOUS_ICE_SWORD },
    ["variantOfSkin"] = {
        ["variantName"] = "Gold",
        ["parentSkin"] = v20.ICE_QUEEN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.GOLD),
        ["variantValue"] = v22.RankedGold
    }
}
local v279 = {
    ["iceShardGradient"] = ColorSequence.new(v12(v13.GOLD), v3.brighten(v12(v13.GOLD), 0.2)),
    ["stackIndicatorColor"] = v3.brighten(v12(v13.GOLD), 0.3),
    ["explodeSound"] = v14.VICTORIOUS_GOLD_FREIYA_EXPLODE,
    ["stackSound"] = v14.VICTORIOUS_FREIYA_STACK,
    ["shardImages"] = {
        ["shard1"] = v16("ShardVictorious_1"),
        ["shard2"] = v16("ShardVictorious_2"),
        ["shard3"] = v16("ShardVictorious_3"),
        ["shard4"] = v16("ShardVictorious_4"),
        ["shardsOutline"] = v16("ShardVictoriousOutline")
    },
    ["effects"] = {
        ["idle"] = v5.Assets.Effects.Freiya.GoldKitSkin.FrostBiteIdle,
        ["explode"] = v5.Assets.Effects.Freiya.GoldKitSkin.FrostBiteExplode
    }
}
v278.freiya = v279
u23[v277] = v278
local v280 = v20.ICE_QUEEN_VICTORIOUS_PLATINUM
local v281 = {
    ["name"] = "Victorious Freiya",
    ["renderImage"] = "rbxassetid://90851094394232",
    ["kit"] = v19.ICE_QUEEN,
    ["itemSkins"] = { v18.PLATINUM_VICTORIOUS_ICE_SWORD },
    ["variantOfSkin"] = {
        ["variantName"] = "Platinum",
        ["parentSkin"] = v20.ICE_QUEEN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.PLATINUM),
        ["variantValue"] = v22.RankedPlatinum
    }
}
local v282 = {
    ["iceShardGradient"] = ColorSequence.new(v12(v13.PLATINUM), v3.brighten(v12(v13.PLATINUM), 0.2)),
    ["stackIndicatorColor"] = v3.brighten(v12(v13.PLATINUM), 0.3),
    ["explodeSound"] = v14.VICTORIOUS_PLATINUM_FREIYA_EXPLODE,
    ["stackSound"] = v14.VICTORIOUS_FREIYA_STACK,
    ["shardImages"] = {
        ["shard1"] = v16("ShardVictorious_1"),
        ["shard2"] = v16("ShardVictorious_2"),
        ["shard3"] = v16("ShardVictorious_3"),
        ["shard4"] = v16("ShardVictorious_4"),
        ["shardsOutline"] = v16("ShardVictoriousOutline")
    },
    ["effects"] = {
        ["idle"] = v5.Assets.Effects.Freiya.PlatinumKitSkin.FrostBiteIdle,
        ["explode"] = v5.Assets.Effects.Freiya.PlatinumKitSkin.FrostBiteExplode
    }
}
v281.freiya = v282
u23[v280] = v281
local v283 = v20.ICE_QUEEN_VICTORIOUS_DIAMOND
local v284 = {
    ["name"] = "Victorious Freiya",
    ["renderImage"] = "rbxassetid://93135806563581",
    ["kit"] = v19.ICE_QUEEN,
    ["itemSkins"] = { v18.DIAMOND_VICTORIOUS_ICE_SWORD },
    ["variantOfSkin"] = {
        ["variantName"] = "Diamond",
        ["parentSkin"] = v20.ICE_QUEEN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.DIAMOND),
        ["variantValue"] = v22.RankedDiamond
    }
}
local v285 = {
    ["iceShardGradient"] = ColorSequence.new(v12(v13.DIAMOND), v3.brighten(v12(v13.DIAMOND), 0.2)),
    ["stackIndicatorColor"] = v3.brighten(v12(v13.DIAMOND), 0.3),
    ["explodeSound"] = v14.VICTORIOUS_DIAMOND_FREIYA_EXPLODE,
    ["stackSound"] = v14.VICTORIOUS_FREIYA_STACK,
    ["shardImages"] = {
        ["shard1"] = v16("ShardVictorious_1"),
        ["shard2"] = v16("ShardVictorious_2"),
        ["shard3"] = v16("ShardVictorious_3"),
        ["shard4"] = v16("ShardVictorious_4"),
        ["shardsOutline"] = v16("ShardVictoriousOutline")
    },
    ["effects"] = {
        ["idle"] = v5.Assets.Effects.Freiya.DiamondKitSkin.FrostBiteIdle,
        ["explode"] = v5.Assets.Effects.Freiya.DiamondKitSkin.FrostBiteExplode
    }
}
v284.freiya = v285
u23[v283] = v284
local v286 = v20.ICE_QUEEN_VICTORIOUS_EMERALD
local v287 = {
    ["name"] = "Victorious Freiya",
    ["renderImage"] = "rbxassetid://120621375824865",
    ["kit"] = v19.ICE_QUEEN,
    ["itemSkins"] = { v18.EMERALD_VICTORIOUS_ICE_SWORD },
    ["variantOfSkin"] = {
        ["variantName"] = "Emerald",
        ["parentSkin"] = v20.ICE_QUEEN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.EMERALD),
        ["variantValue"] = v22.RankedEmerald
    }
}
local v288 = {
    ["iceShardGradient"] = ColorSequence.new(v12(v13.EMERALD), v3.brighten(v12(v13.EMERALD), 0.2)),
    ["stackIndicatorColor"] = v3.brighten(v12(v13.EMERALD), 0.3),
    ["explodeSound"] = v14.VICTORIOUS_EMERALD_FREIYA_EXPLODE,
    ["stackSound"] = v14.VICTORIOUS_FREIYA_STACK,
    ["shardImages"] = {
        ["shard1"] = v16("ShardVictorious_1"),
        ["shard2"] = v16("ShardVictorious_2"),
        ["shard3"] = v16("ShardVictorious_3"),
        ["shard4"] = v16("ShardVictorious_4"),
        ["shardsOutline"] = v16("ShardVictoriousOutline")
    },
    ["effects"] = {
        ["idle"] = v5.Assets.Effects.Freiya.EmeraldKitSkin.FrostBiteIdle,
        ["explode"] = v5.Assets.Effects.Freiya.EmeraldKitSkin.FrostBiteExplode
    }
}
v287.freiya = v288
u23[v286] = v287
local v289 = v20.ICE_QUEEN_VICTORIOUS_NIGHTMARE
local v290 = {
    ["name"] = "Victorious Freiya",
    ["renderImage"] = "rbxassetid://137100759987699",
    ["kit"] = v19.ICE_QUEEN,
    ["itemSkins"] = { v18.NIGHTMARE_VICTORIOUS_ICE_SWORD },
    ["variantOfSkin"] = {
        ["variantName"] = "Nightmare",
        ["parentSkin"] = v20.ICE_QUEEN_VICTORIOUS_GOLD,
        ["variantIconColor"] = v12(v13.NIGHTMARE),
        ["variantValue"] = v22.RankedNightmare
    }
}
local v291 = {
    ["iceShardGradient"] = ColorSequence.new(v12(v13.NIGHTMARE), v3.brighten(v12(v13.NIGHTMARE), 0.2)),
    ["stackIndicatorColor"] = v3.brighten(v12(v13.NIGHTMARE), 0.3),
    ["explodeSound"] = v14.VICTORIOUS_NIGHTMARE_FREIYA_EXPLODE,
    ["stackSound"] = v14.VICTORIOUS_FREIYA_STACK,
    ["shardImages"] = {
        ["shard1"] = v16("ShardVictorious_1"),
        ["shard2"] = v16("ShardVictorious_2"),
        ["shard3"] = v16("ShardVictorious_3"),
        ["shard4"] = v16("ShardVictorious_4"),
        ["shardsOutline"] = v16("ShardVictoriousOutline")
    },
    ["effects"] = {
        ["idle"] = v5.Assets.Effects.Freiya.NightmareKitSkin.FrostBiteIdle,
        ["explode"] = v5.Assets.Effects.Freiya.NightmareKitSkin.FrostBiteExplode
    }
}
v290.freiya = v291
u23[v289] = v290
local v292 = v20.AERY_VALENTINE
local v293 = {
    ["name"] = "Heartseeker Aery",
    ["renderImage"] = "rbxassetid://101244887373430",
    ["releaseTime"] = 1771023600,
    ["kit"] = v19.AERY,
    ["aery"] = {
        ["butterflyEffect"] = v5.Assets.Effects.AeryButterflyValentine,
        ["butterflySpawnSound"] = v14.AERY_BUTTERFLY_SPAWN_VALENTINE,
        ["butterflyConsumeSound"] = v14.AERY_BUTTERFLY_CONSUME_VALENTINE
    },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = 3536419627
    }
}
u23[v292] = v293
local v294 = v20.SPIRIT_ASSASSIN_KURO
local v295 = {
    ["name"] = "Darkheart Evelynn",
    ["renderImage"] = "rbxassetid://121748395308226",
    ["kit"] = v19.SPIRIT_ASSASSIN,
    ["spiritAssassin"] = {
        ["spinEffect"] = "kuro_DaggerSpin",
        ["orbModelName"] = "kuro_SpiritOrb",
        ["spiritDaggerIndicator"] = "kuro_SpiritDagger",
        ["dagger"] = v18.KURO_SPIRIT_DAGGER,
        ["daggerLeft"] = v18.KURO_SPIRIT_DAGGER_LEFT,
        ["daggerSlashSound"] = v14.SPIRIT_ASSASSIN_KURO_DAGGER_SLASH,
        ["daggerChargeSound"] = v14.SPIRIT_ASSASSIN_KURO_DAGGER_CHARGE,
        ["arcColor"] = Color3.fromRGB(214, 156, 255)
    }
}
u23[v294] = v295
u23[v20.BARBARIAN_DYNASTY] = {
    ["name"] = "Dynasty Barbarian",
    ["renderImage"] = "rbxassetid://110762480338360",
    ["kit"] = v19.BARBARIAN,
    ["itemSkins"] = { v18.RAGEBLADE_DYNASTY }
}
local v296 = v20.CELESTIAL_WIND_WALKER
local v297 = {
    ["name"] = "Celestial Zephyr",
    ["renderImage"] = "rbxassetid://70624251443200",
    ["kit"] = v19.WIND_WALKER
}
local v298 = {
    ["sounds"] = {
        ["orbSpawn"] = v14.CELESTIAL_WIND_WALKER_ORB_SPAWN,
        ["orbGet"] = v14.CELESTIAL_WIND_WALKER_ORB_GET,
        ["doubleJump"] = { v14.CELESTIAL_WIND_WALKER_DOUBLE_JUMP_1, v14.CELESTIAL_WIND_WALKER_DOUBLE_JUMP_2 }
    },
    ["effects"] = {
        ["hitEffect"] = v5.Assets.Effects.CelestialWindWalkerHitEffect,
        ["trail"] = v5.Assets.Effects.CelestialWindWalkerTrail
    }
}
v297.windWalker = v298
v297.product = {
    ["priceRobux"] = 799,
    ["devProductId"] = v10.CELESTIAL_WIND_WALKER_KIT_SKIN
}
u23[v296] = v297
u23[v20.WARRIOR_CHROMA] = {
    ["name"] = "OG Warrior Chroma",
    ["renderImage"] = "rbxassetid://96124785022884",
    ["kit"] = v19.WARRIOR,
    ["itemSkins"] = { v18.WARRIOR_CHROMA_HELMET, v18.WARRIOR_CHROMA_CHESTPLATE, v18.WARRIOR_CHROMA_BOOTS }
}
local v299 = v20.ICE_VIKING_WARRIOR
local v300 = {
    ["name"] = "Ice Viking Warrior",
    ["renderImage"] = "rbxassetid://105499879745977",
    ["kit"] = v19.WARRIOR,
    ["itemSkins"] = { v18.ICE_VIKING_WARRIOR_HELMET, v18.ICE_VIKING_WARRIOR_CHESTPLATE, v18.ICE_VIKING_WARRIOR_BOOTS },
    ["product"] = {
        ["priceRobux"] = 799,
        ["devProductId"] = v10.ICE_VIKING_WARRIOR
    }
}
u23[v299] = v300
local u301 = {}
for _, v302 in v4.values(v20) do
    local v303 = u23[v302].kit
    if v303 then
        local v304 = v2.getOrCreate(u301, v303, {})
        table.insert(v304, v302)
    end
end
return {
    ["MAX_NEW_SKIN_AGE"] = 2419200,
    ["getSkinsForKit"] = function(p305) --[[ Name: getSkinsForKit, Line 2147 ]]
        --[[
        Upvalues:
            [1] = u301
        --]]
        return u301[p305]
    end,
    ["getKitSkinMetadata"] = function(p306) --[[ Name: getKitSkinMetadata, Line 2152 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        return u23[p306]
    end,
    ["BedwarsKitSkinMeta"] = u23
}