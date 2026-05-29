local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct
local v9 = {
    v8.DAILY_STORE_ITEM_69,
    v8.DAILY_STORE_ITEM_99,
    v8.DAILY_STORE_ITEM_149,
    v8.DAILY_STORE_ITEM_199,
    v8.DAILY_STORE_ITEM_249,
    v8.DAILY_STORE_ITEM_299,
    v8.DAILY_STORE_ITEM_399,
    v8.DAILY_STORE_ITEM_549
}
local v10 = {}
local v11 = setmetatable({}, {
    ["__index"] = v10
})
local v12 = v8.DAILY_STORE_ITEM_69
v11.DAILY_STORE_ITEM_69 = v12
v10[v12] = "DAILY_STORE_ITEM_69"
local v13 = v8.DAILY_STORE_ITEM_99
v11.DAILY_STORE_ITEM_99 = v13
v10[v13] = "DAILY_STORE_ITEM_99"
local v14 = v8.DAILY_STORE_ITEM_149
v11.DAILY_STORE_ITEM_149 = v14
v10[v14] = "DAILY_STORE_ITEM_149"
local v15 = v8.DAILY_STORE_ITEM_199
v11.DAILY_STORE_ITEM_199 = v15
v10[v15] = "DAILY_STORE_ITEM_199"
local v16 = v8.DAILY_STORE_ITEM_249
v11.DAILY_STORE_ITEM_249 = v16
v10[v16] = "DAILY_STORE_ITEM_249"
local v17 = v8.DAILY_STORE_ITEM_299
v11.DAILY_STORE_ITEM_299 = v17
v10[v17] = "DAILY_STORE_ITEM_299"
local v18 = v8.DAILY_STORE_ITEM_399
v11.DAILY_STORE_ITEM_399 = v18
v10[v18] = "DAILY_STORE_ITEM_399"
local v19 = v8.DAILY_STORE_ITEM_549
v11.DAILY_STORE_ITEM_549 = v19
v10[v19] = "DAILY_STORE_ITEM_549"
local v20 = {}
local v21 = setmetatable({}, {
    ["__index"] = v20
})
v21.BEDCOIN_100 = "BEDCOIN_100"
v20.BEDCOIN_100 = "BEDCOIN_100"
v21.BEDBREAK_CONNFETTI = "BEDBREAK_CONNFETTI"
v20.BEDBREAK_CONNFETTI = "BEDBREAK_CONNFETTI"
v21.BEDBREAK_GHOSTFIY = "BEDBREAK_GHOSTFIY"
v20.BEDBREAK_GHOSTFIY = "BEDBREAK_GHOSTFIY"
v21.ANIMEMOTE_BEACHBALL = "ANIMEMOTE_BEACHBALL"
v20.ANIMEMOTE_BEACHBALL = "ANIMEMOTE_BEACHBALL"
v21.ANIMEMOTE_PIRATETREASURE = "ANIMEMOTE_PIRATETREASURE"
v20.ANIMEMOTE_PIRATETREASURE = "ANIMEMOTE_PIRATETREASURE"
v21.ANIMEMOTE_ICYDELIGHT = "ANIMEMOTE_ICYDELIGHT"
v20.ANIMEMOTE_ICYDELIGHT = "ANIMEMOTE_ICYDELIGHT"
v21.ANIMEMOTE_CRABDANCE = "ANIMEMOTE_CRABDANCE"
v20.ANIMEMOTE_CRABDANCE = "ANIMEMOTE_CRABDANCE"
v21.ANIMEMOTE_COINFOUNTAIN = "ANIMEMOTE_COINFOUNTAIN"
v20.ANIMEMOTE_COINFOUNTAIN = "ANIMEMOTE_COINFOUNTAIN"
v21.KILLEFFECT_SHARKBITE = "KILLEFFECT_SHARKBITE"
v20.KILLEFFECT_SHARKBITE = "KILLEFFECT_SHARKBITE"
v21.KILLEFFECT_FLOATAWAY = "KILLEFFECT_FLOATAWAY"
v20.KILLEFFECT_FLOATAWAY = "KILLEFFECT_FLOATAWAY"
v21.KILLEFFECT_LUNARDRAGON = "KILLEFFECT_LUNARDRAGON"
v20.KILLEFFECT_LUNARDRAGON = "KILLEFFECT_LUNARDRAGON"
v21.KILLEFFECT_PENGUINCRUSH = "KILLEFFECT_PENGUINCRUSH"
v20.KILLEFFECT_PENGUINCRUSH = "KILLEFFECT_PENGUINCRUSH"
v21.KILLEFFECT_SOULLEAVE = "KILLEFFECT_SOULLEAVE"
v20.KILLEFFECT_SOULLEAVE = "KILLEFFECT_SOULLEAVE"
v21.KILLEFFECT_SKELETON = "KILLEFFECT_SKELETON"
v20.KILLEFFECT_SKELETON = "KILLEFFECT_SKELETON"
v21.KILLEFFECT_WEBBEDUP = "KILLEFFECT_WEBBEDUP"
v20.KILLEFFECT_WEBBEDUP = "KILLEFFECT_WEBBEDUP"
v21.KILLEFFECT_SNOWBALL = "KILLEFFECT_SNOWBALL"
v20.KILLEFFECT_SNOWBALL = "KILLEFFECT_SNOWBALL"
v21.KILLEFFECT_GRAVESTONE = "KILLEFFECT_GRAVESTONE"
v20.KILLEFFECT_GRAVESTONE = "KILLEFFECT_GRAVESTONE"
v21.KILLEFFECT_PIRATEGHOST = "KILLEFFECT_PIRATEGHOST"
v20.KILLEFFECT_PIRATEGHOST = "KILLEFFECT_PIRATEGHOST"
v21.KILLEFFECT_PIRATEATTACK = "KILLEFFECT_PIRATEATTACK"
v20.KILLEFFECT_PIRATEATTACK = "KILLEFFECT_PIRATEATTACK"
v21.LOBBYGADGET_WATERGUN = "LOBBYGADGET_WATERGUN"
v20.LOBBYGADGET_WATERGUN = "LOBBYGADGET_WATERGUN"
v21.LOBBYGADGET_GOLDENSNAKEPET = "LOBBYGADGET_GOLDENSNAKEPET"
v20.LOBBYGADGET_GOLDENSNAKEPET = "LOBBYGADGET_GOLDENSNAKEPET"
v21.LOBBYGADGET_BEACHBALL = "LOBBYGADGET_BEACHBALL"
v20.LOBBYGADGET_BEACHBALL = "LOBBYGADGET_BEACHBALL"
v21.LOBBYGADGET_PARTYHATLAUNCHER = "LOBBYGADGET_PARTYHATLAUNCHER"
v20.LOBBYGADGET_PARTYHATLAUNCHER = "LOBBYGADGET_PARTYHATLAUNCHER"
v21.LOBBYGADGET_PARTYBALLOONS = "LOBBYGADGET_PARTYBALLOONS"
v20.LOBBYGADGET_PARTYBALLOONS = "LOBBYGADGET_PARTYBALLOONS"
v21.LOBBYGADGET_SNOWBALLLAUNCHER = "LOBBYGADGET_SNOWBALLLAUNCHER"
v20.LOBBYGADGET_SNOWBALLLAUNCHER = "LOBBYGADGET_SNOWBALLLAUNCHER"
v21.LOBBYGADGET_SPIDERQUEENPET = "LOBBYGADGET_SPIDERQUEENPET"
v20.LOBBYGADGET_SPIDERQUEENPET = "LOBBYGADGET_SPIDERQUEENPET"
v21.LOBBYGADGET_FROSTYHAMMER = "LOBBYGADGET_FROSTYHAMMER"
v20.LOBBYGADGET_FROSTYHAMMER = "LOBBYGADGET_FROSTYHAMMER"
v21.LOBBYGADGET_CRYPTSTAFF = "LOBBYGADGET_CRYPTSTAFF"
v20.LOBBYGADGET_CRYPTSTAFF = "LOBBYGADGET_CRYPTSTAFF"
v21.LOBBYGADGET_BLUNDERBUSS = "LOBBYGADGET_BLUNDERBUSS"
v20.LOBBYGADGET_BLUNDERBUSS = "LOBBYGADGET_BLUNDERBUSS"
v21.LOBBYGADGET_CHICKEN_PET = "LOBBYGADGET_CHICKEN_PET"
v20.LOBBYGADGET_CHICKEN_PET = "LOBBYGADGET_CHICKEN_PET"
v21.EMOTE_ALCHEMIST_YAP = "emote_alchemist_yap"
v20.emote_alchemist_yap = "EMOTE_ALCHEMIST_YAP"
v21.EMOTE_ARACHNE_OHMY = "emote_arachne_ohmy"
v20.emote_arachne_ohmy = "EMOTE_ARACHNE_OHMY"
v21.EMOTE_ARCHER_GLARE = "emote_archer_glare"
v20.emote_archer_glare = "EMOTE_ARCHER_GLARE"
v21.EMOTE_BAKER_SLY = "emote_baker_sly"
v20.emote_baker_sly = "EMOTE_BAKER_SLY"
v21.EMOTE_BAKER_SUS_STEW = "emote_baker_sus_stew"
v20.emote_baker_sus_stew = "EMOTE_BAKER_SUS_STEW"
v21.EMOTE_BOT_SCARED = "emote_bot_scared"
v20.emote_bot_scared = "EMOTE_BOT_SCARED"
v21.EMOTE_BUILDER_BLEH = "emote_builder_bleh"
v20.emote_builder_bleh = "EMOTE_BUILDER_BLEH"
v21.EMOTE_CHICKEN_ATTACK = "emote_chicken_attack"
v20.emote_chicken_attack = "EMOTE_CHICKEN_ATTACK"
v21.EMOTE_COGSWORTH_IGNORED = "emote_cogsworth_ignored"
v20.emote_cogsworth_ignored = "EMOTE_COGSWORTH_IGNORED"
v21.EMOTE_CONQUEROR_SMIRK = "emote_conqueror_smirk"
v20.emote_conqueror_smirk = "EMOTE_CONQUEROR_SMIRK"
v21.EMOTE_DRAGON_ANGRY = "emote_dragon_angry"
v20.emote_dragon_angry = "EMOTE_DRAGON_ANGRY"
v21.EMOTE_FARMER_CLEAN = "emote_farmer_clean"
v20.emote_farmer_clean = "EMOTE_FARMER_CLEAN"
v21.EMOTE_FARMER_PUSHED = "emote_farmer_pushed"
v20.emote_farmer_pushed = "EMOTE_FARMER_PUSHED"
v21.EMOTE_FARMER_SILENCED = "emote_farmer_silenced"
v20.emote_farmer_silenced = "EMOTE_FARMER_SILENCED"
v21.EMOTE_FISHERMAN_DOZE = "emote_fisherman_doze"
v20.emote_fisherman_doze = "EMOTE_FISHERMAN_DOZE"
v21.EMOTE_FISHERMAN_SMILE = "emote_fisherman_smile"
v20.emote_fisherman_smile = "EMOTE_FISHERMAN_SMILE"
v21.EMOTE_FROSTY_SILLY = "emote_frosty_silly"
v20.emote_frosty_silly = "EMOTE_FROSTY_SILLY"
v21.EMOTE_ISABEL_STUNNED = "emote_isabel_stunned"
v20.emote_isabel_stunned = "EMOTE_ISABEL_STUNNED"
v21.EMOTE_JADE_LAUGH = "emote_jade_laugh"
v20.emote_jade_laugh = "EMOTE_JADE_LAUGH"
v21.EMOTE_KAIDA_GLARE = "emote_kaida_glare"
v20.emote_kaida_glare = "EMOTE_KAIDA_GLARE"
v21.EMOTE_KAIDA_MOCK = "emote_kaida_mock"
v20.emote_kaida_mock = "EMOTE_KAIDA_MOCK"
v21.EMOTE_LASSY_APPROVE = "emote_lassy_approve"
v20.emote_lassy_approve = "EMOTE_LASSY_APPROVE"
v21.EMOTE_LASSY_CRY = "emote_lassy_cry"
v20.emote_lassy_cry = "EMOTE_LASSY_CRY"
v21.EMOTE_LASSY_STOP = "emote_lassy_stop"
v20.emote_lassy_stop = "EMOTE_LASSY_STOP"
v21.EMOTE_LUCIA_THROW = "emote_lucia_throw"
v20.emote_lucia_throw = "EMOTE_LUCIA_THROW"
v21.EMOTE_LYLA_FLOWERS = "emote_lyla_flowers"
v20.emote_lyla_flowers = "EMOTE_LYLA_FLOWERS"
v21.EMOTE_LYLA_LETTER_READ = "emote_lyla_letter_read"
v20.emote_lyla_letter_read = "EMOTE_LYLA_LETTER_READ"
v21.EMOTE_LYLA_SAD = "emote_lyla_sad"
v20.emote_lyla_sad = "EMOTE_LYLA_SAD"
v21.EMOTE_LYLA_SUS = "emote_lyla_sus"
v20.emote_lyla_sus = "EMOTE_LYLA_SUS"
v21.EMOTE_MARCEL_TIME = "emote_marcel_time"
v20.emote_marcel_time = "EMOTE_MARCEL_TIME"
v21.EMOTE_MARINA_ANGRY = "emote_marina_angry"
v20.emote_marina_angry = "EMOTE_MARINA_ANGRY"
v21.EMOTE_MARINA_HUH = "emote_marina_huh"
v20.emote_marina_huh = "EMOTE_MARINA_HUH"
v21.EMOTE_MARINA_ICECREAM = "emote_marina_icecream"
v20.emote_marina_icecream = "EMOTE_MARINA_ICECREAM"
v21.EMOTE_MARINA_SURPRISED = "emote_marina_surprised"
v20.emote_marina_surprised = "EMOTE_MARINA_SURPRISED"
v21.EMOTE_MARTIN_PLUSH = "emote_martin_plush"
v20.emote_martin_plush = "EMOTE_MARTIN_PLUSH"
v21.EMOTE_MELODY_CHEER = "emote_melody_cheer"
v20.emote_melody_cheer = "EMOTE_MELODY_CHEER"
v21.EMOTE_MELODY_STOP = "emote_melody_stop"
v20.emote_melody_stop = "EMOTE_MELODY_STOP"
v21.EMOTE_MILO_ICE_CREAM = "emote_milo_ice_cream"
v20.emote_milo_ice_cream = "EMOTE_MILO_ICE_CREAM"
v21.EMOTE_MINER_SNORE = "emote_miner_snore"
v20.emote_miner_snore = "EMOTE_MINER_SNORE"
v21.EMOTE_NOELLE_DOLL = "emote_noelle_doll"
v20.emote_noelle_doll = "EMOTE_NOELLE_DOLL"
v21.EMOTE_NOELLE_SURRENDER = "emote_noelle_surrender"
v20.emote_noelle_surrender = "EMOTE_NOELLE_SURRENDER"
v21.EMOTE_PYRO_EXHAUSTED = "emote_pyro_exhausted"
v20.emote_pyro_exhausted = "EMOTE_PYRO_EXHAUSTED"
v21.EMOTE_RAMIL_PALM_OF_MY_HAND = "emote_ramil_palm_of_my_hand"
v20.emote_ramil_palm_of_my_hand = "EMOTE_RAMIL_PALM_OF_MY_HAND"
v21.EMOTE_RAVEN_PLAN = "emote_raven_plan"
v20.emote_raven_plan = "EMOTE_RAVEN_PLAN"
v21.EMOTE_RISE_UP = "emote_rise_up"
v20.emote_rise_up = "EMOTE_RISE_UP"
v21.EMOTE_SILENCE = "emote_silence"
v20.emote_silence = "EMOTE_SILENCE"
v21.EMOTE_SKELETON_OMG = "emote_skeleton_omg"
v20.emote_skeleton_omg = "EMOTE_SKELETON_OMG"
v21.EMOTE_SMOKE_DISSAPOINTED = "emote_smoke_dissapointed"
v20.emote_smoke_dissapointed = "EMOTE_SMOKE_DISSAPOINTED"
v21.EMOTE_SMOKE_VANISH = "emote_smoke_vanish"
v20.emote_smoke_vanish = "EMOTE_SMOKE_VANISH"
v21.EMOTE_STELLA_STAR_FOR_YOU = "emote_stella_star_for_you"
v20.emote_stella_star_for_you = "EMOTE_STELLA_STAR_FOR_YOU"
v21.EMOTE_TALIYAH_FLUSHED = "emote_taliyah_flushed"
v20.emote_taliyah_flushed = "EMOTE_TALIYAH_FLUSHED"
v21.EMOTE_TALIYAH_RAINBOW = "emote_taliyah_rainbow"
v20.emote_taliyah_rainbow = "EMOTE_TALIYAH_RAINBOW"
v21.EMOTE_TERRA_POWERUP = "emote_terra_powerup"
v20.emote_terra_powerup = "EMOTE_TERRA_POWERUP"
v21.EMOTE_TRIXIE_MOCK = "emote_trixie_mock"
v20.emote_trixie_mock = "EMOTE_TRIXIE_MOCK"
v21.EMOTE_WHIM_READING = "emote_whim_reading"
v20.emote_whim_reading = "EMOTE_WHIM_READING"
v21.EMOTE_XUROT_DISSAPOINTED = "emote_xurot_dissapointed"
v20.emote_xurot_dissapointed = "EMOTE_XUROT_DISSAPOINTED"
v21.EMOTE_YAMINI_SLY = "emote_yamini_sly"
v20.emote_yamini_sly = "EMOTE_YAMINI_SLY"
v21.EMOTE_ZARRAH_LOVE = "emote_zarrah_love"
v20.emote_zarrah_love = "EMOTE_ZARRAH_LOVE"
v21.BEDSKIN_RACECAR = "bedskin_racecar"
v20.bedskin_racecar = "BEDSKIN_RACECAR"
v21.BEDSKIN_GOTHIC = "bedskin_gothic"
v20.bedskin_gothic = "BEDSKIN_GOTHIC"
v21.BEDSKIN_SKETCH = "bedskin_sketch"
v20.bedskin_sketch = "BEDSKIN_SKETCH"
v21.BEDSKIN_COFFIN = "bedskin_coffin"
v20.bedskin_coffin = "BEDSKIN_COFFIN"
v21.BEDSKIN_BALLOON = "bedskin_balloon"
v20.bedskin_balloon = "BEDSKIN_BALLOON"
v21.BEDSKIN_CRACKED_EGG = "bedskin_cracked_egg"
v20.bedskin_cracked_egg = "BEDSKIN_CRACKED_EGG"
v21.BED_OVERGROWN = "bedskin_overgrown"
v20.bedskin_overgrown = "BED_OVERGROWN"
v21.BED_PIRATE = "bedskin_pirate"
v20.bedskin_pirate = "BED_PIRATE"
v21.BED_SPIRIT = "bedskin_spirit"
v20.bedskin_spirit = "BED_SPIRIT"
v21.BED_WIZARD = "bedskin_wizard"
v20.bedskin_wizard = "BED_WIZARD"
v21.BED_VOID = "bedskin_void"
v20.bedskin_void = "BED_VOID"
v21.BED_SNOWMAN = "bedskin_snowman"
v20.bedskin_snowman = "BED_SNOWMAN"
v21.WINEFFECT_SNOWBALL_RIDER = "wineffect_snowball_rider"
v20.wineffect_snowball_rider = "WINEFFECT_SNOWBALL_RIDER"
local u22 = {
    [v21.BEDCOIN_100] = {
        ["freeItem"] = true,
        ["reward"] = {
            ["bedCoins"] = 100
        }
    }
}
local v23 = v21.BEDBREAK_CONNFETTI
local v24 = {
    ["reward"] = {
        ["bedBreakEffect"] = v3.CONFETTI
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_299
    }
}
u22[v23] = v24
local v25 = v21.BEDBREAK_GHOSTFIY
local v26 = {
    ["reward"] = {
        ["bedBreakEffect"] = v3.GHOSTIFY
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_199
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 62
    }
}
u22[v25] = v26
local v27 = v21.KILLEFFECT_SHARKBITE
local v28 = {
    ["reward"] = {
        ["killEffect"] = v5.SHARK
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_399
    }
}
u22[v27] = v28
local v29 = v21.KILLEFFECT_FLOATAWAY
local v30 = {
    ["reward"] = {
        ["killEffect"] = v5.FLOAT_AWAY
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_249
    }
}
u22[v29] = v30
local v31 = v21.KILLEFFECT_LUNARDRAGON
local v32 = {
    ["reward"] = {
        ["killEffect"] = v5.LUNAR_DRAGON
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_399
    }
}
u22[v31] = v32
local v33 = v21.KILLEFFECT_PENGUINCRUSH
local v34 = {
    ["reward"] = {
        ["killEffect"] = v5.PENGUIN_CRUSH
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_199
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 63
    }
}
u22[v33] = v34
local v35 = v21.KILLEFFECT_SOULLEAVE
local v36 = {
    ["reward"] = {
        ["killEffect"] = v5.SOUL_LEAVE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_199
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 63
    }
}
u22[v35] = v36
local v37 = v21.KILLEFFECT_SKELETON
local v38 = {
    ["reward"] = {
        ["killEffect"] = v5.SKELETON
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_199
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 63
    }
}
u22[v37] = v38
local v39 = v21.KILLEFFECT_WEBBEDUP
local v40 = {
    ["reward"] = {
        ["killEffect"] = v5.WEBBED_UP
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_199
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 63
    }
}
u22[v39] = v40
local v41 = v21.KILLEFFECT_SNOWBALL
local v42 = {
    ["reward"] = {
        ["killEffect"] = v5.SNOWBALL
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_249
    }
}
u22[v41] = v42
local v43 = v21.KILLEFFECT_GRAVESTONE
local v44 = {
    ["reward"] = {
        ["killEffect"] = v5.GRAVESTONE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_199
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 63
    }
}
u22[v43] = v44
local v45 = v21.KILLEFFECT_PIRATEGHOST
local v46 = {
    ["reward"] = {
        ["killEffect"] = v5.GHOST
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_199
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 63
    }
}
u22[v45] = v46
local v47 = v21.KILLEFFECT_PIRATEATTACK
local v48 = {
    ["reward"] = {
        ["killEffect"] = v5.PIRATE_SHIP_ATTACK
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_399
    }
}
u22[v47] = v48
local v49 = v21.ANIMEMOTE_BEACHBALL
local v50 = {
    ["reward"] = {
        ["emote"] = v4.BEACH_VOLLEY_BALL
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_149
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 61
    }
}
u22[v49] = v50
local v51 = v21.ANIMEMOTE_PIRATETREASURE
local v52 = {
    ["reward"] = {
        ["emote"] = v4.PIRATE_TREASURE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_249
    }
}
u22[v51] = v52
local v53 = v21.ANIMEMOTE_ICYDELIGHT
local v54 = {
    ["reward"] = {
        ["emote"] = v4.ICY_DELIGHT
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_149
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 61
    }
}
u22[v53] = v54
local v55 = v21.ANIMEMOTE_CRABDANCE
local v56 = {
    ["reward"] = {
        ["emote"] = v4.CRAB_DANCE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_249
    }
}
u22[v55] = v56
local v57 = v21.ANIMEMOTE_COINFOUNTAIN
local v58 = {
    ["reward"] = {
        ["emote"] = v4.COIN_FOUNTAIN
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_249
    }
}
u22[v57] = v58
local v59 = v21.LOBBYGADGET_WATERGUN
local v60 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.WATER_GUN
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_99
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 60
    }
}
u22[v59] = v60
local v61 = v21.LOBBYGADGET_GOLDENSNAKEPET
local v62 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.LNY_2025_GOLDEN_SNAKE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_149
    }
}
u22[v61] = v62
local v63 = v21.LOBBYGADGET_BEACHBALL
local v64 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.BEACHBALL
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_99
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 60
    }
}
u22[v63] = v64
local v65 = v21.LOBBYGADGET_PARTYHATLAUNCHER
local v66 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.PARTY_HAT_LAUNCHER
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_149
    }
}
u22[v65] = v66
local v67 = v21.LOBBYGADGET_PARTYBALLOONS
local v68 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.ANNIVERSARY_BALLOONS
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_99
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 60
    }
}
u22[v67] = v68
local v69 = v21.LOBBYGADGET_SNOWBALLLAUNCHER
local v70 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.SNOWBALL_LAUNCHER
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_99
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 60
    }
}
u22[v69] = v70
local v71 = v21.LOBBYGADGET_SPIDERQUEENPET
local v72 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.HALLOWEEN_2024_SPIDER
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_249
    }
}
u22[v71] = v72
local v73 = v21.LOBBYGADGET_FROSTYHAMMER
local v74 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.FROSTY_HAMMER
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_99
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 60
    }
}
u22[v73] = v74
local v75 = v21.LOBBYGADGET_CRYPTSTAFF
local v76 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.NECROMANCER_STAFF
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_99
    }
}
u22[v75] = v76
local v77 = v21.LOBBYGADGET_BLUNDERBUSS
local v78 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.BLUNDERBUSS
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_99
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 60
    }
}
u22[v77] = v78
local v79 = v21.LOBBYGADGET_CHICKEN_PET
local v80 = {
    ["reward"] = {
        ["lobbyGadget"] = v6.CHICKEN
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_249
    }
}
u22[v79] = v80
local v81 = v21.EMOTE_ALCHEMIST_YAP
local v82 = {
    ["reward"] = {
        ["emote"] = v4.ALCHEMIST_YAP
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v81] = v82
local v83 = v21.EMOTE_MARINA_ANGRY
local v84 = {
    ["reward"] = {
        ["emote"] = v4.MARINA_ANGRY
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v83] = v84
local v85 = v21.EMOTE_ARACHNE_OHMY
local v86 = {
    ["reward"] = {
        ["emote"] = v4.ARACHNE_OHMY
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v85] = v86
local v87 = v21.EMOTE_ARCHER_GLARE
local v88 = {
    ["reward"] = {
        ["emote"] = v4.ARCHER_GLARE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v87] = v88
local v89 = v21.EMOTE_BAKER_SLY
local v90 = {
    ["reward"] = {
        ["emote"] = v4.BAKER_SLY
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v89] = v90
local v91 = v21.EMOTE_BAKER_SUS_STEW
local v92 = {
    ["reward"] = {
        ["emote"] = v4.BAKER_SUS_STEW
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v91] = v92
local v93 = v21.EMOTE_BOT_SCARED
local v94 = {
    ["reward"] = {
        ["emote"] = v4.BOT_SCARED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v93] = v94
local v95 = v21.EMOTE_BUILDER_BLEH
local v96 = {
    ["reward"] = {
        ["emote"] = v4.BUILDER_BLEH
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v95] = v96
local v97 = v21.EMOTE_CHICKEN_ATTACK
local v98 = {
    ["reward"] = {
        ["emote"] = v4.CHICKEN_ATTACK
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v97] = v98
local v99 = v21.EMOTE_COGSWORTH_IGNORED
local v100 = {
    ["reward"] = {
        ["emote"] = v4.COGSWORTH_IGNORED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v99] = v100
local v101 = v21.EMOTE_CONQUEROR_SMIRK
local v102 = {
    ["reward"] = {
        ["emote"] = v4.CONQUEROR_SMIRK
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v101] = v102
local v103 = v21.EMOTE_DRAGON_ANGRY
local v104 = {
    ["reward"] = {
        ["emote"] = v4.DRAGON_ANGRY
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v103] = v104
local v105 = v21.EMOTE_FARMER_CLEAN
local v106 = {
    ["reward"] = {
        ["emote"] = v4.FARMER_CLEAN
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v105] = v106
local v107 = v21.EMOTE_FARMER_PUSHED
local v108 = {
    ["reward"] = {
        ["emote"] = v4.FARMER_PUSHED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v107] = v108
local v109 = v21.EMOTE_FARMER_SILENCED
local v110 = {
    ["reward"] = {
        ["emote"] = v4.FARMER_SILENCED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v109] = v110
local v111 = v21.EMOTE_FISHERMAN_SMILE
local v112 = {
    ["reward"] = {
        ["emote"] = v4.FISHERMAN_SMILE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v111] = v112
local v113 = v21.EMOTE_FISHERMAN_DOZE
local v114 = {
    ["reward"] = {
        ["emote"] = v4.FISHERMAN_DOZE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v113] = v114
local v115 = v21.EMOTE_FROSTY_SILLY
local v116 = {
    ["reward"] = {
        ["emote"] = v4.FROSTY_SILLY
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v115] = v116
local v117 = v21.EMOTE_ISABEL_STUNNED
local v118 = {
    ["reward"] = {
        ["emote"] = v4.ISABEL_STUNNED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v117] = v118
local v119 = v21.EMOTE_JADE_LAUGH
local v120 = {
    ["reward"] = {
        ["emote"] = v4.JADE_LAUGH
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v119] = v120
local v121 = v21.EMOTE_KAIDA_GLARE
local v122 = {
    ["reward"] = {
        ["emote"] = v4.KAIDA_GLARE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v121] = v122
local v123 = v21.EMOTE_KAIDA_MOCK
local v124 = {
    ["reward"] = {
        ["emote"] = v4.KAIDA_MOCK
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v123] = v124
local v125 = v21.EMOTE_LASSY_APPROVE
local v126 = {
    ["reward"] = {
        ["emote"] = v4.LASSY_APPROVE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v125] = v126
local v127 = v21.EMOTE_LASSY_CRY
local v128 = {
    ["reward"] = {
        ["emote"] = v4.LASSY_CRY
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v127] = v128
local v129 = v21.EMOTE_LASSY_STOP
local v130 = {
    ["reward"] = {
        ["emote"] = v4.LASSY_STOP
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v129] = v130
local v131 = v21.EMOTE_LUCIA_THROW
local v132 = {
    ["reward"] = {
        ["emote"] = v4.LUCIA_THROW
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v131] = v132
local v133 = v21.EMOTE_LYLA_FLOWERS
local v134 = {
    ["reward"] = {
        ["emote"] = v4.LYLA_FLOWERS
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v133] = v134
local v135 = v21.EMOTE_LYLA_LETTER_READ
local v136 = {
    ["reward"] = {
        ["emote"] = v4.LYLA_LETTER_READ
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v135] = v136
local v137 = v21.EMOTE_LYLA_SAD
local v138 = {
    ["reward"] = {
        ["emote"] = v4.LYLA_SAD
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v137] = v138
local v139 = v21.EMOTE_LYLA_SUS
local v140 = {
    ["reward"] = {
        ["emote"] = v4.LYLA_SUS
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v139] = v140
local v141 = v21.EMOTE_MARCEL_TIME
local v142 = {
    ["reward"] = {
        ["emote"] = v4.MARCEL_TIME
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v141] = v142
local v143 = v21.EMOTE_MARINA_HUH
local v144 = {
    ["reward"] = {
        ["emote"] = v4.MARINA_HUH
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v143] = v144
local v145 = v21.EMOTE_MARINA_ICECREAM
local v146 = {
    ["reward"] = {
        ["emote"] = v4.MARINA_ICECREAM
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v145] = v146
local v147 = v21.EMOTE_MARINA_SURPRISED
local v148 = {
    ["reward"] = {
        ["emote"] = v4.MARINA_SURPRISED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v147] = v148
local v149 = v21.EMOTE_MARTIN_PLUSH
local v150 = {
    ["reward"] = {
        ["emote"] = v4.MARTIN_PLUSH
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v149] = v150
local v151 = v21.EMOTE_MELODY_CHEER
local v152 = {
    ["reward"] = {
        ["emote"] = v4.MELODY_CHEER
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v151] = v152
local v153 = v21.EMOTE_MELODY_STOP
local v154 = {
    ["reward"] = {
        ["emote"] = v4.MELODY_STOP
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v153] = v154
local v155 = v21.EMOTE_MILO_ICE_CREAM
local v156 = {
    ["reward"] = {
        ["emote"] = v4.MILO_ICE_CREAM
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v155] = v156
local v157 = v21.EMOTE_MINER_SNORE
local v158 = {
    ["reward"] = {
        ["emote"] = v4.MINER_SNORE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v157] = v158
local v159 = v21.EMOTE_NOELLE_DOLL
local v160 = {
    ["reward"] = {
        ["emote"] = v4.NOELLE_DOLL
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v159] = v160
local v161 = v21.EMOTE_NOELLE_SURRENDER
local v162 = {
    ["reward"] = {
        ["emote"] = v4.NOELLE_SURRENDER
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v161] = v162
local v163 = v21.EMOTE_PYRO_EXHAUSTED
local v164 = {
    ["reward"] = {
        ["emote"] = v4.PYRO_EXHAUSTED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v163] = v164
local v165 = v21.EMOTE_RAMIL_PALM_OF_MY_HAND
local v166 = {
    ["reward"] = {
        ["emote"] = v4.RAMIL_PALM_OF_MY_HAND
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v165] = v166
local v167 = v21.EMOTE_RAVEN_PLAN
local v168 = {
    ["reward"] = {
        ["emote"] = v4.RAVEN_PLAN
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v167] = v168
local v169 = v21.EMOTE_RISE_UP
local v170 = {
    ["reward"] = {
        ["emote"] = v4.RISE_UP
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v169] = v170
local v171 = v21.EMOTE_SILENCE
local v172 = {
    ["reward"] = {
        ["emote"] = v4.SILENCE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v171] = v172
local v173 = v21.EMOTE_SKELETON_OMG
local v174 = {
    ["reward"] = {
        ["emote"] = v4.SKELETON_OMG
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v173] = v174
local v175 = v21.EMOTE_SMOKE_DISSAPOINTED
local v176 = {
    ["reward"] = {
        ["emote"] = v4.SMOKE_DISSAPOINTED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v175] = v176
local v177 = v21.EMOTE_SMOKE_VANISH
local v178 = {
    ["reward"] = {
        ["emote"] = v4.SMOKE_VANISH
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v177] = v178
local v179 = v21.EMOTE_STELLA_STAR_FOR_YOU
local v180 = {
    ["reward"] = {
        ["emote"] = v4.STELLA_STAR_FOR_YOU
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v179] = v180
local v181 = v21.EMOTE_TALIYAH_FLUSHED
local v182 = {
    ["reward"] = {
        ["emote"] = v4.TALIYAH_FLUSHED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v181] = v182
local v183 = v21.EMOTE_TALIYAH_RAINBOW
local v184 = {
    ["reward"] = {
        ["emote"] = v4.TALIYAH_RAINBOW
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v183] = v184
local v185 = v21.EMOTE_TERRA_POWERUP
local v186 = {
    ["reward"] = {
        ["emote"] = v4.TERRA_POWERUP
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v185] = v186
local v187 = v21.EMOTE_TRIXIE_MOCK
local v188 = {
    ["reward"] = {
        ["emote"] = v4.TRIXIE_MOCK
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v187] = v188
local v189 = v21.EMOTE_WHIM_READING
local v190 = {
    ["reward"] = {
        ["emote"] = v4.WHIM_READING
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v189] = v190
local v191 = v21.EMOTE_XUROT_DISSAPOINTED
local v192 = {
    ["reward"] = {
        ["emote"] = v4.XUROT_DISSAPOINTED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v191] = v192
local v193 = v21.EMOTE_YAMINI_SLY
local v194 = {
    ["reward"] = {
        ["emote"] = v4.YAMINI_SLY
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v193] = v194
local v195 = v21.EMOTE_ZARRAH_LOVE
local v196 = {
    ["reward"] = {
        ["emote"] = v4.ZARRAH_LOVE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_69
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 59
    }
}
u22[v195] = v196
local v197 = v21.BEDSKIN_BALLOON
local v198 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_BALLOON
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_199
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 65
    }
}
u22[v197] = v198
local v199 = v21.BEDSKIN_CRACKED_EGG
local v200 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_CRACKED_EGG
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_299
    }
}
u22[v199] = v200
local v201 = v21.BEDSKIN_SKETCH
local v202 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_SKETCH
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_199
    },
    ["bedcoinProduct"] = {
        ["bedcoinProductId"] = 65
    }
}
u22[v201] = v202
local v203 = v21.BEDSKIN_RACECAR
local v204 = {
    ["reward"] = {
        ["bedSkin"] = v2.RACECAR_BED
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_299
    }
}
u22[v203] = v204
local v205 = v21.BEDSKIN_GOTHIC
local v206 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_GOTHIC
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_299
    }
}
u22[v205] = v206
local v207 = v21.BEDSKIN_COFFIN
local v208 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_COFFIN
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_299
    }
}
u22[v207] = v208
local v209 = v21.BED_OVERGROWN
local v210 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_OVERGROWN
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_299
    }
}
u22[v209] = v210
local v211 = v21.BED_PIRATE
local v212 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_PIRATE
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_399
    }
}
u22[v211] = v212
local v213 = v21.BED_SPIRIT
local v214 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_SPIRIT
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_299
    }
}
u22[v213] = v214
local v215 = v21.BED_WIZARD
local v216 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_WIZARD
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_399
    }
}
u22[v215] = v216
local v217 = v21.BED_SNOWMAN
local v218 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_SNOWMAN
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_299
    }
}
u22[v217] = v218
local v219 = v21.BED_VOID
local v220 = {
    ["reward"] = {
        ["bedSkin"] = v2.BED_VOID
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_299
    }
}
u22[v219] = v220
local v221 = v21.WINEFFECT_SNOWBALL_RIDER
local v222 = {
    ["reward"] = {
        ["winEffect"] = v7.SNOW_BALL_RIDER
    },
    ["robuxProduct"] = {
        ["productId"] = v11.DAILY_STORE_ITEM_399
    }
}
u22[v221] = v222
return {
    ["RobuxDailyStoreDevProducts"] = v9,
    ["RobuxDailyStoreDevProduct"] = v11,
    ["DailyStoreItem"] = v21,
    ["DailyStoreItemMeta"] = u22,
    ["getDailyStoreItemMetadata"] = function(p223) --[[ Line: 1284 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        return u22[p223]
    end
}