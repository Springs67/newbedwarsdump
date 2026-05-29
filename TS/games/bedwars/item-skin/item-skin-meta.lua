local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BreakBlockDamageType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local function v15(p10) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    local v11 = u4.values(u2)
    local v12 = {}
    for v13 = 1, #v11 do
        local v14 = v11[v13]
        local _ = v13 - 1
        v12[v14] = p10
    end
    return v12
end
local u16 = {
    [v9.MINER_PICKAXE_SPACE] = {
        ["skinTag"] = "space",
        ["itemType"] = v6.MINER_PICKAXE
    },
    [v9.MINER_PICKAXE_WINTER] = {
        ["skinTag"] = "winter",
        ["itemType"] = v6.MINER_PICKAXE
    }
}
local v17 = v9.CAMERA_TURRET_VAMPIRE
local v18 = {
    ["skinTag"] = "vampire",
    ["itemType"] = v6.CAMERA_TURRET,
    ["projectileSourceOverrides"] = {
        ["launchSound"] = { v8.TURRET_VAMPIE_SHOOT }
    }
}
u16[v17] = v18
u16[v9.CAMERA_TURRET_LUNAR] = {
    ["skinTag"] = "lunar",
    ["itemType"] = v6.CAMERA_TURRET
}
local v19 = v9.CAMERA_TURRET_CREAM_SODA
local v20 = {
    ["skinTag"] = "cream_soda",
    ["itemType"] = v6.CAMERA_TURRET,
    ["projectileSourceOverrides"] = {
        ["launchSound"] = {
            v8.TURRET_CREAM_SODA_SHOOT_1,
            v8.TURRET_CREAM_SODA_SHOOT_2,
            v8.TURRET_CREAM_SODA_SHOOT_3,
            v8.TURRET_CREAM_SODA_SHOOT_4
        }
    }
}
u16[v19] = v20
local v21 = v9.CAMERA_TURRET_STARRYSOLDIER
local v22 = {
    ["skinTag"] = "starrysoldier",
    ["itemType"] = v6.CAMERA_TURRET,
    ["projectileSourceOverrides"] = {
        ["launchSound"] = { v8.TURRET_STARRYSOLDIER_SHOOT_1 }
    }
}
u16[v21] = v22
u16[v9.TABLET_VAMPIRE] = {
    ["skinTag"] = "vampire",
    ["itemType"] = v6.TABLET
}
u16[v9.TABLET_LUNAR] = {
    ["skinTag"] = "lunar",
    ["itemType"] = v6.TABLET
}
u16[v9.TABLET_CREAM_SODA] = {
    ["skinTag"] = "cream_soda",
    ["itemType"] = v6.TABLET
}
u16[v9.TABLET_STARRYSOLDIER] = {
    ["skinTag"] = "starrysoldier",
    ["itemType"] = v6.TABLET
}
u16[v9.LASSO_MUMMY] = {
    ["skinTag"] = "mummy",
    ["itemType"] = v6.LASSO
}
u16[v9.CANNON_GHOST] = {
    ["skinTag"] = "ghost",
    ["itemType"] = v6.CANNON
}
local v23 = v9.CANNON_DEEPSEA
local v24 = {
    ["skinTag"] = "deepsea",
    ["itemType"] = v6.CANNON,
    ["davey"] = {
        ["cannonFireSound"] = v8.DEEPSEA_CANNON_LAUNCH
    }
}
u16[v23] = v24
u16[v9.GUITAR_ROCKSTAR] = {
    ["skinTag"] = "rockstar",
    ["itemType"] = v6.GUITAR
}
u16[v9.PIE_SPIRIT] = {
    ["skinTag"] = "spirit",
    ["itemType"] = v6.PIE
}
u16[v9.APPLE_SPIRIT] = {
    ["skinTag"] = "spirit",
    ["itemType"] = v6.APPLE
}
u16[v9.PIE_VALENTINE] = {
    ["skinTag"] = "valentine",
    ["itemType"] = v6.PIE
}
u16[v9.APPLE_VALENTINE] = {
    ["skinTag"] = "valentine",
    ["itemType"] = v6.APPLE
}
u16[v9.GOLDEN_APPLE_VALENTINE] = {
    ["skinTag"] = "valentine",
    ["itemType"] = v6.GOLDEN_APPLE
}
u16[v9.FEATHER_BOW_DEMON_EMPRESS_VANESSA] = {
    ["skinTag"] = "demon_empress_vanessa",
    ["itemType"] = v6.FEATHER_BOW
}
u16[v9.WOOD_CROSSBOW_DEMON_EMPRESS_VANESSA] = {
    ["skinTag"] = "demon_empress_vanessa",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_CROSSBOW
}
u16[v9.WOOD_BOW_DEMON_EMPRESS_VANESSA] = {
    ["skinTag"] = "demon_empress_vanessa",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_BOW
}
u16[v9.EMERALD_DAO_VICTORIOUS] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.EMERALD_DAO
}
u16[v9.DIAMOND_DAO_VICTORIOUS] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.DIAMOND_DAO
}
u16[v9.IRON_DAO_VICTORIOUS] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.IRON_DAO
}
u16[v9.STONE_DAO_VICTORIOUS] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.STONE_DAO
}
u16[v9.WOOD_DAO_VICTORIOUS] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.WOOD_DAO
}
u16[v9.WOOD_DAO_SNOW_RABBIT] = {
    ["skinTag"] = "snow_rabbit",
    ["itemType"] = v6.WOOD_DAO
}
u16[v9.STONE_DAO_SNOW_RABBIT] = {
    ["skinTag"] = "snow_rabbit",
    ["itemType"] = v6.STONE_DAO
}
u16[v9.IRON_DAO_SNOW_RABBIT] = {
    ["skinTag"] = "snow_rabbit",
    ["itemType"] = v6.IRON_DAO
}
u16[v9.DIAMOND_DAO_SNOW_RABBIT] = {
    ["skinTag"] = "snow_rabbit",
    ["itemType"] = v6.DIAMOND_DAO
}
u16[v9.EMERALD_DAO_SNOW_RABBIT] = {
    ["skinTag"] = "snow_rabbit",
    ["itemType"] = v6.EMERALD_DAO
}
u16[v9.EMERALD_DAO_TIGER] = {
    ["skinTag"] = "tiger",
    ["itemType"] = v6.EMERALD_DAO
}
u16[v9.DIAMOND_DAO_TIGER] = {
    ["skinTag"] = "tiger",
    ["itemType"] = v6.DIAMOND_DAO
}
u16[v9.IRON_DAO_TIGER] = {
    ["skinTag"] = "tiger",
    ["itemType"] = v6.IRON_DAO
}
u16[v9.STONE_DAO_TIGER] = {
    ["skinTag"] = "tiger",
    ["itemType"] = v6.STONE_DAO
}
u16[v9.WOOD_DAO_TIGER] = {
    ["skinTag"] = "tiger",
    ["itemType"] = v6.WOOD_DAO
}
u16[v9.RAGEBLADE_VICTORIOUS] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.RAGEBLADE
}
u16[v9.RAGEBLADE_DEEP_VOID] = {
    ["skinTag"] = "deep_void",
    ["itemType"] = v6.RAGEBLADE
}
u16[v9.RAGEBLADE_CORRUPTED] = {
    ["skinTag"] = "corrupted",
    ["itemType"] = v6.RAGEBLADE
}
u16[v9.RAGEBLADE_DYNASTY] = {
    ["skinTag"] = "dynasty",
    ["itemType"] = v6.RAGEBLADE
}
u16[v9.ICE_SWORD_TIGER_BRAWLER] = {
    ["skinTag"] = "tiger_brawler",
    ["itemType"] = v6.ICE_SWORD
}
u16[v9.NECROMANCER_STAFF_CHRISTMAS] = {
    ["skinTag"] = "christmas",
    ["itemType"] = v6.NECROMANCER_STAFF
}
u16[v9.NECROMANCER_STAFF_WRECKED] = {
    ["skinTag"] = "cryptwrecked",
    ["itemType"] = v6.NECROMANCER_STAFF
}
u16[v9.SILENTNIGHT_SPIRIT_DAGGER] = {
    ["skinTag"] = "silentnight",
    ["itemType"] = v6.SPIRIT_DAGGER
}
u16[v9.SILENTNIGHT_SPIRIT_DAGGER_LEFT] = {
    ["skinTag"] = "silentnight",
    ["itemType"] = v6.SPIRIT_DAGGER_LEFT
}
u16[v9.GOLD_VICTORIOUS_SPIRIT_DAGGER] = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.SPIRIT_DAGGER
}
u16[v9.GOLD_VICTORIOUS_SPIRIT_DAGGER_LEFT] = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.SPIRIT_DAGGER_LEFT
}
u16[v9.PLATINUM_VICTORIOUS_SPIRIT_DAGGER] = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.SPIRIT_DAGGER
}
u16[v9.PLATINUM_VICTORIOUS_SPIRIT_DAGGER_LEFT] = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.SPIRIT_DAGGER_LEFT
}
u16[v9.DIAMOND_VICTORIOUS_SPIRIT_DAGGER] = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.SPIRIT_DAGGER
}
u16[v9.DIAMOND_VICTORIOUS_SPIRIT_DAGGER_LEFT] = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.SPIRIT_DAGGER_LEFT
}
u16[v9.NIGHTMARE_VICTORIOUS_SPIRIT_DAGGER] = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.SPIRIT_DAGGER
}
u16[v9.NIGHTMARE_VICTORIOUS_SPIRIT_DAGGER_LEFT] = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.SPIRIT_DAGGER_LEFT
}
u16[v9.DODO_SPIRIT_DAGGER] = {
    ["skinTag"] = "dodo",
    ["itemType"] = v6.SPIRIT_DAGGER
}
u16[v9.DODO_SPIRIT_DAGGER_LEFT] = {
    ["skinTag"] = "dodo",
    ["itemType"] = v6.SPIRIT_DAGGER_LEFT
}
u16[v9.RAGEBLADE_BUNNY] = {
    ["skinTag"] = "bunny",
    ["itemType"] = v6.RAGEBLADE
}
local v25 = v9.GOLD_VICTORIOUS_CANNON
local v26 = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.CANNON,
    ["davey"] = {
        ["cannonFireSound"] = v8.CANNON_FIRE_VICTORIOUS_GOLD
    }
}
u16[v25] = v26
local v27 = v9.PLATINUM_VICTORIOUS_CANNON
local v28 = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.CANNON,
    ["davey"] = {
        ["cannonFireSound"] = v8.CANNON_FIRE_VICTORIOUS_PLATINUM
    }
}
u16[v27] = v28
local v29 = v9.DIAMOND_VICTORIOUS_CANNON
local v30 = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.CANNON,
    ["davey"] = {
        ["cannonFireSound"] = v8.CANNON_FIRE_VICTORIOUS_DIAMOND
    }
}
u16[v29] = v30
local v31 = v9.EMERALD_VICTORIOUS_CANNON
local v32 = {
    ["skinTag"] = "emerald_victorious",
    ["itemType"] = v6.CANNON,
    ["davey"] = {
        ["cannonFireSound"] = v8.CANNON_FIRE_VICTORIOUS_EMERALD
    }
}
u16[v31] = v32
local v33 = v9.NIGHTMARE_VICTORIOUS_CANNON
local v34 = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.CANNON,
    ["davey"] = {
        ["cannonFireSound"] = v8.CANNON_FIRE_VICTORIOUS_NIGHTMARE
    }
}
u16[v33] = v34
u16[v9.EMERALD_DAO_CURSED] = {
    ["skinTag"] = "cursed",
    ["itemType"] = v6.EMERALD_DAO
}
u16[v9.DIAMOND_DAO_CURSED] = {
    ["skinTag"] = "cursed",
    ["itemType"] = v6.DIAMOND_DAO
}
u16[v9.IRON_DAO_CURSED] = {
    ["skinTag"] = "cursed",
    ["itemType"] = v6.IRON_DAO
}
u16[v9.STONE_DAO_CURSED] = {
    ["skinTag"] = "cursed",
    ["itemType"] = v6.STONE_DAO
}
u16[v9.WOOD_DAO_CURSED] = {
    ["skinTag"] = "cursed",
    ["itemType"] = v6.WOOD_DAO
}
u16[v9.WARLOCK_STAFF_CHRISTMAS_SPIRIT] = {
    ["skinTag"] = "christmas_spirit",
    ["itemType"] = v6.WARLOCK_STAFF
}
u16[v9.GUITAR_HOLIDAY_COZY] = {
    ["skinTag"] = "holiday_cozy",
    ["itemType"] = v6.GUITAR
}
u16[v9.FLOWER_BOW_FROST_QUEEN] = {
    ["skinTag"] = "frost_queen",
    ["itemType"] = v6.FLOWER_BOW
}
u16[v9.FLOWER_CROSSBOW_FROST_QUEEN] = {
    ["skinTag"] = "frost_queen",
    ["itemType"] = v6.FLOWER_CROSSBOW
}
u16[v9.FLOWER_HEADHUNTER_FROST_QUEEN] = {
    ["skinTag"] = "frost_queen",
    ["itemType"] = v6.FLOWER_HEADHUNTER
}
u16[v9.INFERNAL_SABER_KRAMPUS] = {
    ["skinTag"] = "krampus",
    ["itemType"] = v6.INFERNAL_SABER
}
u16[v9.WOOD_BOW_LUNAR_DRAGON] = {
    ["skinTag"] = "lunar_dragon",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_BOW
}
u16[v9.TACTICAL_CROSSBOW_LUNAR_DRAGON] = {
    ["skinTag"] = "lunar_dragon",
    ["itemType"] = v6.TACTICAL_CROSSBOW
}
u16[v9.TACTICAL_HEADHUNTER_LUNAR_DRAGON] = {
    ["skinTag"] = "lunar_dragon",
    ["itemType"] = v6.TACTICAL_HEADHUNTER
}
u16[v9.WOOD_BOW_VALENTINE_VANESSA] = {
    ["skinTag"] = "valentine",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_BOW
}
u16[v9.WOOD_CROSSBOW_VALENTINE_VANESSA] = {
    ["skinTag"] = "valentine",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_CROSSBOW
}
u16[v9.HEADHUNTER_VALENTINE_VANESSA] = {
    ["skinTag"] = "valentine",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.HEADHUNTER
}
u16[v9.OWL_ORB_FIRE] = {
    ["skinTag"] = "owl_fire",
    ["itemType"] = v6.OWL_ORB
}
u16[v9.ICE_SWORD_BUNNY] = {
    ["skinTag"] = "bunny",
    ["itemType"] = v6.ICE_SWORD
}
u16[v9.GOLD_VICTORIOUS_FLOWER_BOW] = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.FLOWER_BOW
}
u16[v9.PLATINUM_VICTORIOUS_FLOWER_BOW] = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.FLOWER_BOW
}
u16[v9.DIAMOND_VICTORIOUS_FLOWER_BOW] = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.FLOWER_BOW
}
u16[v9.EMERALD_VICTORIOUS_FLOWER_BOW] = {
    ["skinTag"] = "emerald_victorious",
    ["itemType"] = v6.FLOWER_BOW
}
u16[v9.NIGHTMARE_VICTORIOUS_FLOWER_BOW] = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.FLOWER_BOW
}
u16[v9.GOLD_VICTORIOUS_FLOWER_CROSSBOW] = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.FLOWER_CROSSBOW
}
u16[v9.PLATINUM_VICTORIOUS_FLOWER_CROSSBOW] = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.FLOWER_CROSSBOW
}
u16[v9.DIAMOND_VICTORIOUS_FLOWER_CROSSBOW] = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.FLOWER_CROSSBOW
}
u16[v9.EMERALD_VICTORIOUS_FLOWER_CROSSBOW] = {
    ["skinTag"] = "emerald_victorious",
    ["itemType"] = v6.FLOWER_CROSSBOW
}
u16[v9.NIGHTMARE_VICTORIOUS_FLOWER_CROSSBOW] = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.FLOWER_CROSSBOW
}
u16[v9.GOLD_VICTORIOUS_FLOWER_HEADHUNTER] = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.FLOWER_HEADHUNTER
}
u16[v9.PLATINUM_VICTORIOUS_FLOWER_HEADHUNTER] = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.FLOWER_HEADHUNTER
}
u16[v9.DIAMOND_VICTORIOUS_FLOWER_HEADHUNTER] = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.FLOWER_HEADHUNTER
}
u16[v9.EMERALD_VICTORIOUS_FLOWER_HEADHUNTER] = {
    ["skinTag"] = "emerald_victorious",
    ["itemType"] = v6.FLOWER_HEADHUNTER
}
u16[v9.NIGHTMARE_VICTORIOUS_FLOWER_HEADHUNTER] = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.FLOWER_HEADHUNTER
}
u16[v9.HEADHUNTER_DEMON_EMPRESS] = {
    ["skinTag"] = "demon_empress",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.HEADHUNTER
}
u16[v9.WIZARD_STAFF_ANNIVERSARY] = {
    ["skinTag"] = "anniversary",
    ["itemType"] = v6.WIZARD_STAFF
}
u16[v9.WIZARD_STAFF_2_ANNIVERSARY] = {
    ["skinTag"] = "anniversary",
    ["itemType"] = v6.WIZARD_STAFF_2
}
u16[v9.WIZARD_STAFF_3_ANNIVERSARY] = {
    ["skinTag"] = "anniversary",
    ["itemType"] = v6.WIZARD_STAFF_3
}
u16[v9.INFERNAL_SHIELD_SUMMER] = {
    ["skinTag"] = "anniversary",
    ["itemType"] = v6.INFERNAL_SHIELD
}
u16[v9.GUITAR_SIREN] = {
    ["skinTag"] = "siren",
    ["itemType"] = v6.GUITAR
}
u16[v9.FISH_TANK_WOOD_CHAINSAW] = {
    ["skinTag"] = "fish_tank",
    ["itemType"] = v6.TINKER_WOOD_CHAINSAW
}
u16[v9.FISH_TANK_IRON_CHAINSAW] = {
    ["skinTag"] = "fish_tank",
    ["itemType"] = v6.TINKER_IRON_CHAINSAW
}
u16[v9.FISH_TANK_DIAMOND_CHAINSAW] = {
    ["skinTag"] = "fish_tank",
    ["itemType"] = v6.TINKER_DIAMOND_CHAINSAW
}
u16[v9.FISH_TANK_EMERALD_CHAINSAW] = {
    ["skinTag"] = "fish_tank",
    ["itemType"] = v6.TINKER_EMERALD_CHAINSAW
}
u16[v9.FISH_TANK_VOID_CHAINSAW] = {
    ["skinTag"] = "fish_tank",
    ["itemType"] = v6.TINKER_VOID_CHAINSAW
}
u16[v9.GOLD_VICTORIOUS_WIZARD_STAFF] = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.WIZARD_STAFF
}
u16[v9.GOLD_VICTORIOUS_WIZARD_STAFF_2] = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.WIZARD_STAFF_2
}
u16[v9.GOLD_VICTORIOUS_WIZARD_STAFF_3] = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.WIZARD_STAFF_3
}
u16[v9.PLATINUM_VICTORIOUS_WIZARD_STAFF] = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.WIZARD_STAFF
}
u16[v9.PLATINUM_VICTORIOUS_WIZARD_STAFF_2] = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.WIZARD_STAFF_2
}
u16[v9.PLATINUM_VICTORIOUS_WIZARD_STAFF_3] = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.WIZARD_STAFF_3
}
u16[v9.DIAMOND_VICTORIOUS_WIZARD_STAFF] = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.WIZARD_STAFF
}
u16[v9.DIAMOND_VICTORIOUS_WIZARD_STAFF_2] = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.WIZARD_STAFF_2
}
u16[v9.DIAMOND_VICTORIOUS_WIZARD_STAFF_3] = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.WIZARD_STAFF_3
}
u16[v9.EMERALD_VICTORIOUS_WIZARD_STAFF] = {
    ["skinTag"] = "emerald_victorious",
    ["itemType"] = v6.WIZARD_STAFF
}
u16[v9.EMERALD_VICTORIOUS_WIZARD_STAFF_2] = {
    ["skinTag"] = "emerald_victorious",
    ["itemType"] = v6.WIZARD_STAFF_2
}
u16[v9.EMERALD_VICTORIOUS_WIZARD_STAFF_3] = {
    ["skinTag"] = "emerald_victorious",
    ["itemType"] = v6.WIZARD_STAFF_3
}
u16[v9.NIGHTMARE_VICTORIOUS_WIZARD_STAFF] = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.WIZARD_STAFF
}
u16[v9.NIGHTMARE_VICTORIOUS_WIZARD_STAFF_2] = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.WIZARD_STAFF_2
}
u16[v9.NIGHTMARE_VICTORIOUS_WIZARD_STAFF_3] = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.WIZARD_STAFF_3
}
local v35 = v9.LIFE_BOW_MUMMY
local v36 = {
    ["skinTag"] = "mummy",
    ["itemType"] = v6.LIFE_BOW
}
local v37 = {
    ["launchSound"] = { v8.MUMMY_LIFE_BOW_SHOT },
    ["hitSounds"] = {
        { v8.MUMMY_LIFE_ARROW_HIT_1, v8.MUMMY_LIFE_ARROW_HIT_2 }
    }
}
v36.projectileSourceOverrides = v37
u16[v35] = v36
local v38 = v9.LIFE_CROSSBOW_MUMMY
local v39 = {
    ["skinTag"] = "mummy",
    ["itemType"] = v6.LIFE_CROSSBOW
}
local v40 = {
    ["launchSound"] = { v8.MUMMY_LIFE_BOW_SHOT },
    ["hitSounds"] = {
        { v8.MUMMY_LIFE_ARROW_HIT_1, v8.MUMMY_LIFE_ARROW_HIT_2 }
    }
}
v39.projectileSourceOverrides = v40
u16[v38] = v39
local v41 = v9.LIFE_HEADHUNTER_MUMMY
local v42 = {
    ["skinTag"] = "mummy",
    ["itemType"] = v6.LIFE_HEADHUNTER
}
local v43 = {
    ["launchSound"] = { v8.MUMMY_LIFE_HEADHUNTER_SHOT },
    ["hitSounds"] = {
        { v8.MUMMY_LIFE_ARROW_HIT_1, v8.MUMMY_LIFE_ARROW_HIT_2 }
    }
}
v42.projectileSourceOverrides = v43
u16[v41] = v42
u16[v9.HOLIDAY_BLACK_MARKET_SHOP] = {
    ["skinTag"] = "holiday",
    ["itemType"] = v6.BLACK_MARKET_SHOP
}
u16[v9.HALLOWEEN_BLACK_MARKET_SHOP] = {
    ["skinTag"] = "halloween",
    ["itemType"] = v6.BLACK_MARKET_SHOP
}
u16[v9.TIDAL_BLACK_MARKET_SHOP] = {
    ["skinTag"] = "tidal",
    ["itemType"] = v6.BLACK_MARKET_SHOP
}
u16[v9.HEAVENLY_SWORD_FESTIVE_LUMEN] = {
    ["skinTag"] = "festive_lumen",
    ["itemType"] = v6.HEAVENLY_SWORD
}
u16[v9.LASSO_WRANGLER_REINDEER_LASSY] = {
    ["skinTag"] = "wrangler_reindeer_lassy",
    ["itemType"] = v6.LASSO
}
u16[v9.NUTCRACKER_HAMMER] = {
    ["skinTag"] = "nutcracker",
    ["itemType"] = v6.HAMMER
}
u16[v9.CHRISTMAS_DRAWBRIDGE] = {
    ["skinTag"] = "nutcracker",
    ["itemType"] = v6.DRAWBRIDGE
}
u16[v9.CHRISTMAS_SCAFFOLD] = {
    ["skinTag"] = "nutcracker",
    ["itemType"] = v6.SCAFFOLD
}
u16[v9.GOLD_VICTORIOUS_TRITON] = {
    ["skinTag"] = "gold_victorious",
    ["itemType"] = v6.HARPOON
}
u16[v9.PLATINUM_VICTORIOUS_TRITON] = {
    ["skinTag"] = "platinum_victorious",
    ["itemType"] = v6.HARPOON
}
u16[v9.DIAMOND_VICTORIOUS_TRITON] = {
    ["skinTag"] = "diamond_victorious",
    ["itemType"] = v6.HARPOON
}
u16[v9.EMERALD_VICTORIOUS_TRITON] = {
    ["skinTag"] = "emerald_victorious",
    ["itemType"] = v6.HARPOON
}
u16[v9.NIGHTMARE_VICTORIOUS_TRITON] = {
    ["skinTag"] = "nightmare_victorious",
    ["itemType"] = v6.HARPOON
}
u16[v9.DEMON_TRITON] = {
    ["skinTag"] = "demon_triton",
    ["itemType"] = v6.HARPOON
}
u16[v9.NOCTIUM_BLADE_ICE] = {
    ["skinTag"] = "ice_emperor",
    ["itemType"] = v6.NOCTIUM_BLADE
}
u16[v9.NOCTIUM_BLADE_2_ICE] = {
    ["skinTag"] = "ice_emperor",
    ["itemType"] = v6.NOCTIUM_BLADE_2
}
u16[v9.NOCTIUM_BLADE_3_ICE] = {
    ["skinTag"] = "ice_emperor",
    ["itemType"] = v6.NOCTIUM_BLADE_3
}
u16[v9.NOCTIUM_BLADE_4_ICE] = {
    ["skinTag"] = "ice_emperor",
    ["itemType"] = v6.NOCTIUM_BLADE_4
}
u16[v9.NOCTIUM_BLADE_PUMPKIN] = {
    ["skinTag"] = "pumpkin_emperor",
    ["itemType"] = v6.NOCTIUM_BLADE
}
u16[v9.NOCTIUM_BLADE_2_PUMPKIN] = {
    ["skinTag"] = "pumpkin_emperor",
    ["itemType"] = v6.NOCTIUM_BLADE_2
}
u16[v9.NOCTIUM_BLADE_3_PUMPKIN] = {
    ["skinTag"] = "pumpkin_emperor",
    ["itemType"] = v6.NOCTIUM_BLADE_3
}
u16[v9.NOCTIUM_BLADE_4_PUMPKIN] = {
    ["skinTag"] = "pumpkin_emperor",
    ["itemType"] = v6.NOCTIUM_BLADE_4
}
u16[v9.SPIRIT_STAFF_EASTER] = {
    ["skinTag"] = "easter",
    ["itemType"] = v6.SPIRIT_STAFF
}
u16[v9.TEARBLOOM_FLOWER_EASTER] = {
    ["skinTag"] = "easter",
    ["itemType"] = v6.TEARBLOOM_FLOWER
}
u16[v9.CRYSTALHEART_FLOWER_EASTER] = {
    ["skinTag"] = "easter",
    ["itemType"] = v6.CRYSTALHEART_FLOWER
}
u16[v9.SOULVINE_FLOWER_EASTER] = {
    ["skinTag"] = "easter",
    ["itemType"] = v6.SOULVINE_FLOWER
}
u16[v9.TEARBLOOM_SEED_EASTER] = {
    ["skinTag"] = "easter",
    ["itemType"] = v6.TEARBLOOM_SEED
}
u16[v9.CRYSTALHEART_SEED_EASTER] = {
    ["skinTag"] = "easter",
    ["itemType"] = v6.CRYSTALHEART_SEED
}
u16[v9.SOULVINE_SEED_EASTER] = {
    ["skinTag"] = "easter",
    ["itemType"] = v6.SOULVINE_SEED
}
u16[v9.SPIRIT_GRENADE] = {
    ["skinTag"] = "spirit",
    ["itemType"] = v6.CLUSTER_BOMB
}
u16[v9.VOID_ADETUNDE_HAMMER] = {
    ["skinTag"] = "void",
    ["itemType"] = v6.FROSTY_HAMMER
}
u16[v9.VOID_ADETUNDE_CRYSTAL] = {
    ["skinTag"] = "void",
    ["itemType"] = v6.FROST_CRYSTAL
}
u16[v9.LASSO_LIFEGUARD] = {
    ["skinTag"] = "lifeguard",
    ["itemType"] = v6.LASSO
}
u16[v9.WOOD_GUN_BLADE_SUMMMER] = {
    ["skinTag"] = "summer",
    ["itemType"] = v6.WOOD_GUN_BLADE
}
u16[v9.STONE_GUN_BLADE_SUMMMER] = {
    ["skinTag"] = "summer",
    ["itemType"] = v6.STONE_GUN_BLADE
}
u16[v9.IRON_GUN_BLADE_SUMMMER] = {
    ["skinTag"] = "summer",
    ["itemType"] = v6.IRON_GUN_BLADE
}
u16[v9.DIAMOND_GUN_BLADE_SUMMMER] = {
    ["skinTag"] = "summer",
    ["itemType"] = v6.DIAMOND_GUN_BLADE
}
u16[v9.EMERALD_GUN_BLADE_SUMMMER] = {
    ["skinTag"] = "summer",
    ["itemType"] = v6.EMERALD_GUN_BLADE
}
local v44 = v9.WOOD_BOW_VICTORIOUS_GOLD
local v45 = {
    ["skinTag"] = "victorious",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_BOW
}
local v46 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_GOLD,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v45.projectileSourceOverrides = v46
u16[v44] = v45
local v47 = v9.TACTICAL_CROSSBOW_VICTORIOUS_GOLD
local v48 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_CROSSBOW
}
local v49 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_GOLD,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v48.projectileSourceOverrides = v49
u16[v47] = v48
local v50 = v9.TACTICAL_HEADHUNTER_VICTORIOUS_GOLD
local v51 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_HEADHUNTER
}
local v52 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_GOLD,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v51.projectileSourceOverrides = v52
u16[v50] = v51
local v53 = v9.WOOD_BOW_VICTORIOUS_PLATINUM
local v54 = {
    ["skinTag"] = "victorious",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_BOW
}
local v55 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_PLATINUM,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v54.projectileSourceOverrides = v55
u16[v53] = v54
local v56 = v9.TACTICAL_CROSSBOW_VICTORIOUS_PLATINUM
local v57 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_CROSSBOW
}
local v58 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_PLATINUM,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v57.projectileSourceOverrides = v58
u16[v56] = v57
local v59 = v9.TACTICAL_HEADHUNTER_VICTORIOUS_PLATINUM
local v60 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_HEADHUNTER
}
local v61 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_PLATINUM,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v60.projectileSourceOverrides = v61
u16[v59] = v60
local v62 = v9.WOOD_BOW_VICTORIOUS_DIAMOND
local v63 = {
    ["skinTag"] = "victorious",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_BOW
}
local v64 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_DIAMOND,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v63.projectileSourceOverrides = v64
u16[v62] = v63
local v65 = v9.TACTICAL_CROSSBOW_VICTORIOUS_DIAMOND
local v66 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_CROSSBOW
}
local v67 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_DIAMOND,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v66.projectileSourceOverrides = v67
u16[v65] = v66
local v68 = v9.TACTICAL_HEADHUNTER_VICTORIOUS_DIAMOND
local v69 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_HEADHUNTER
}
local v70 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_DIAMOND,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v69.projectileSourceOverrides = v70
u16[v68] = v69
local v71 = v9.WOOD_BOW_VICTORIOUS_EMERALD
local v72 = {
    ["skinTag"] = "victorious",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_BOW
}
local v73 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_EMERALD,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v72.projectileSourceOverrides = v73
u16[v71] = v72
local v74 = v9.TACTICAL_CROSSBOW_VICTORIOUS_EMERALD
local v75 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_CROSSBOW
}
local v76 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_EMERALD,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v75.projectileSourceOverrides = v76
u16[v74] = v75
local v77 = v9.TACTICAL_HEADHUNTER_VICTORIOUS_EMERALD
local v78 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_HEADHUNTER
}
local v79 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_EMERALD,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v78.projectileSourceOverrides = v79
u16[v77] = v78
local v80 = v9.WOOD_BOW_VICTORIOUS_NIGHTMARE
local v81 = {
    ["skinTag"] = "victorious",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_BOW
}
local v82 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_NIGHTMARE,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v81.projectileSourceOverrides = v82
u16[v80] = v81
local v83 = v9.TACTICAL_CROSSBOW_VICTORIOUS_NIGHTMARE
local v84 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_CROSSBOW
}
local v85 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_NIGHTMARE,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v84.projectileSourceOverrides = v85
u16[v83] = v84
local v86 = v9.TACTICAL_HEADHUNTER_VICTORIOUS_NIGHTMARE
local v87 = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.TACTICAL_HEADHUNTER
}
local v88 = {
    ["launchOverlaySound"] = v8.VICTORIOUS_PROJECTILE_LAUNCHOVERLAY_NIGHTMARE,
    ["launchSoundConfig"] = {
        ["launchOverlayPitch"] = NumberRange.new(1, 1.1)
    }
}
v87.projectileSourceOverrides = v88
u16[v86] = v87
u16[v9.BED_EASTER_RABBIT] = {
    ["name"] = "Easter Rabbit Bed",
    ["skinTag"] = "easter_rabbit",
    ["renderImage"] = "rbxassetid://132622222000715",
    ["itemType"] = v6.BED
}
u16[v9.BED_CRACKED_EGG] = {
    ["name"] = "Cracked Egg Bed",
    ["skinTag"] = "cracked_egg",
    ["renderImage"] = "rbxassetid://102846695628667",
    ["itemType"] = v6.BED
}
u16[v9.RACECAR_BED] = {
    ["name"] = "Racecar Bed",
    ["skinTag"] = "racecar",
    ["renderImage"] = "rbxassetid://131633843404379",
    ["itemType"] = v6.BED
}
u16[v9.BED_GOTHIC] = {
    ["name"] = "Gothic Bed",
    ["skinTag"] = "gothic",
    ["renderImage"] = "rbxassetid://86961870510198",
    ["itemType"] = v6.BED
}
u16[v9.BED_SKETCH] = {
    ["name"] = "Sketch Bed",
    ["skinTag"] = "sketch",
    ["renderImage"] = "rbxassetid://125685046784971",
    ["itemType"] = v6.BED
}
u16[v9.BED_COFFIN] = {
    ["name"] = "Coffin Bed",
    ["skinTag"] = "coffin",
    ["renderImage"] = "rbxassetid://107532061579450",
    ["itemType"] = v6.BED
}
u16[v9.BED_BALLOON] = {
    ["name"] = "Balloon Bed",
    ["skinTag"] = "balloon",
    ["renderImage"] = "rbxassetid://122644986367688",
    ["itemType"] = v6.BED
}
u16[v9.BED_OVERGROWN] = {
    ["name"] = "Overgrown Bed",
    ["skinTag"] = "overgrown",
    ["renderImage"] = "rbxassetid://100047638242359",
    ["itemType"] = v6.BED,
    ["defaultColor"] = v5.lightBlue
}
u16[v9.BED_PIRATE] = {
    ["name"] = "Pirate Bed",
    ["skinTag"] = "pirate",
    ["renderImage"] = "rbxassetid://128206914642166",
    ["itemType"] = v6.BED
}
u16[v9.BED_SPIRIT] = {
    ["name"] = "Spirit Bed",
    ["skinTag"] = "spirit",
    ["renderImage"] = "rbxassetid://136217732427774",
    ["itemType"] = v6.BED
}
u16[v9.BED_VOID] = {
    ["name"] = "Void Bed",
    ["skinTag"] = "void",
    ["renderImage"] = "rbxassetid://108023225629204",
    ["itemType"] = v6.BED
}
u16[v9.BED_WIZARD] = {
    ["name"] = "Wizard Bed",
    ["skinTag"] = "wizard",
    ["renderImage"] = "rbxassetid://133350187931270",
    ["itemType"] = v6.BED,
    ["defaultColor"] = v5.lightBlue
}
u16[v9.SUBZERO_DEFENSE_SCANNER] = {
    ["skinTag"] = "subzero",
    ["itemType"] = v6.DEFENSE_SCANNER
}
u16[v9.BED_SNOWMAN] = {
    ["name"] = "Snowman Bed",
    ["renderImage"] = "rbxassetid://122916934594550",
    ["skinTag"] = "snowman",
    ["itemType"] = v6.BED,
    ["defaultColor"] = v5.white
}
u16[v9.BED_PRESENT] = {
    ["name"] = "Festive Bed",
    ["skinTag"] = "present",
    ["renderImage"] = "rbxassetid://124766402922720",
    ["itemType"] = v6.BED,
    ["defaultColor"] = v5.green
}
u16[v9.BED_SLEIGH] = {
    ["name"] = "Sleigh Bed",
    ["renderImage"] = "rbxassetid://117351887126109",
    ["skinTag"] = "sleigh",
    ["itemType"] = v6.BED
}
u16[v9.SNOW_OWL_ADETUNDE_HAMMER] = {
    ["skinTag"] = "snow_owl",
    ["itemType"] = v6.FROSTY_HAMMER
}
u16[v9.KURO_SPIRIT_DAGGER] = {
    ["skinTag"] = "kuro",
    ["itemType"] = v6.SPIRIT_DAGGER
}
u16[v9.KURO_SPIRIT_DAGGER_LEFT] = {
    ["skinTag"] = "kuro",
    ["itemType"] = v6.SPIRIT_DAGGER_LEFT
}
local v89 = v9.BALLOON_WOOD_SWORD
local v90 = {
    ["name"] = "Balloon Wood Sword",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.WOOD_SWORD,
    ["sword"] = {
        ["swingSounds"] = {
            v8.BALLOON_SWORD_SWING_1,
            v8.BALLOON_SWORD_SWING_2,
            v8.BALLOON_SWORD_SWING_3,
            v8.BALLOON_SWORD_SWING_4
        },
        ["hitSounds"] = {
            v8.BALLOON_SWORD_DAMAGE_1,
            v8.BALLOON_SWORD_DAMAGE_2,
            v8.BALLOON_SWORD_DAMAGE_3,
            v8.BALLOON_SWORD_DAMAGE_4
        }
    },
    ["rarity"] = v7.THREE_STAR
}
u16[v89] = v90
local v91 = v9.BALLOON_STONE_SWORD
local v92 = {
    ["name"] = "Balloon Stone Sword",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.STONE_SWORD,
    ["sword"] = {
        ["swingSounds"] = {
            v8.BALLOON_SWORD_SWING_1,
            v8.BALLOON_SWORD_SWING_2,
            v8.BALLOON_SWORD_SWING_3,
            v8.BALLOON_SWORD_SWING_4
        },
        ["hitSounds"] = {
            v8.BALLOON_SWORD_DAMAGE_1,
            v8.BALLOON_SWORD_DAMAGE_2,
            v8.BALLOON_SWORD_DAMAGE_3,
            v8.BALLOON_SWORD_DAMAGE_4
        }
    },
    ["rarity"] = v7.THREE_STAR
}
u16[v91] = v92
local v93 = v9.BALLOON_IRON_SWORD
local v94 = {
    ["name"] = "Balloon Iron Sword",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.IRON_SWORD,
    ["sword"] = {
        ["swingSounds"] = {
            v8.BALLOON_SWORD_SWING_1,
            v8.BALLOON_SWORD_SWING_2,
            v8.BALLOON_SWORD_SWING_3,
            v8.BALLOON_SWORD_SWING_4
        },
        ["hitSounds"] = {
            v8.BALLOON_SWORD_DAMAGE_1,
            v8.BALLOON_SWORD_DAMAGE_2,
            v8.BALLOON_SWORD_DAMAGE_3,
            v8.BALLOON_SWORD_DAMAGE_4
        }
    },
    ["rarity"] = v7.THREE_STAR
}
u16[v93] = v94
local v95 = v9.BALLOON_DIAMOND_SWORD
local v96 = {
    ["name"] = "Balloon Diamond Sword",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.DIAMOND_SWORD,
    ["sword"] = {
        ["swingSounds"] = {
            v8.BALLOON_SWORD_SWING_1,
            v8.BALLOON_SWORD_SWING_2,
            v8.BALLOON_SWORD_SWING_3,
            v8.BALLOON_SWORD_SWING_4
        },
        ["hitSounds"] = {
            v8.BALLOON_SWORD_DAMAGE_1,
            v8.BALLOON_SWORD_DAMAGE_2,
            v8.BALLOON_SWORD_DAMAGE_3,
            v8.BALLOON_SWORD_DAMAGE_4
        }
    },
    ["rarity"] = v7.THREE_STAR
}
u16[v95] = v96
local v97 = v9.BALLOON_EMERALD_SWORD
local v98 = {
    ["name"] = "Balloon Emerald Sword",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.EMERALD_SWORD,
    ["sword"] = {
        ["swingSounds"] = {
            v8.BALLOON_SWORD_SWING_1,
            v8.BALLOON_SWORD_SWING_2,
            v8.BALLOON_SWORD_SWING_3,
            v8.BALLOON_SWORD_SWING_4
        },
        ["hitSounds"] = {
            v8.BALLOON_SWORD_DAMAGE_1,
            v8.BALLOON_SWORD_DAMAGE_2,
            v8.BALLOON_SWORD_DAMAGE_3,
            v8.BALLOON_SWORD_DAMAGE_4
        }
    },
    ["rarity"] = v7.THREE_STAR
}
u16[v97] = v98
u16[v9.BANANA_WOOD_SWORD] = {
    ["name"] = "Banana Wood Sword",
    ["skinTag"] = "banana",
    ["itemType"] = v6.WOOD_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.BANANA_STONE_SWORD] = {
    ["name"] = "Banana Stone Sword",
    ["skinTag"] = "banana",
    ["itemType"] = v6.STONE_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.BANANA_IRON_SWORD] = {
    ["name"] = "Banana Iron Sword",
    ["skinTag"] = "banana",
    ["itemType"] = v6.IRON_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.BANANA_DIAMOND_SWORD] = {
    ["name"] = "Banana Diamond Sword",
    ["skinTag"] = "banana",
    ["itemType"] = v6.DIAMOND_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.BANANA_EMERALD_SWORD] = {
    ["name"] = "Banana Emerald Sword",
    ["skinTag"] = "banana",
    ["itemType"] = v6.EMERALD_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_WOOD_PICKAXE] = {
    ["name"] = "Heartseeker Wood Pickaxe",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.WOOD_PICKAXE,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_STONE_PICKAXE] = {
    ["name"] = "Heartseeker Stone Pickaxe",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.STONE_PICKAXE,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_IRON_PICKAXE] = {
    ["name"] = "Heartseeker Iron Pickaxe",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.IRON_PICKAXE,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_DIAMOND_PICKAXE] = {
    ["name"] = "Heartseeker Diamond Pickaxe",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.DIAMOND_PICKAXE,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_WOOD_AXE] = {
    ["name"] = "Heartseeker Wood Axe",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.WOOD_AXE,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_STONE_AXE] = {
    ["name"] = "Heartseeker Stone Axe",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.STONE_AXE,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_IRON_AXE] = {
    ["name"] = "Heartseeker Iron Axe",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.IRON_AXE,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_DIAMOND_AXE] = {
    ["name"] = "Heartseeker Diamond Axe",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.DIAMOND_AXE,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_WOOD_SWORD] = {
    ["name"] = "Heartseeker Wood Sword",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.WOOD_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_STONE_SWORD] = {
    ["name"] = "Heartseeker Stone Sword",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.STONE_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_IRON_SWORD] = {
    ["name"] = "Heartseeker Iron Sword",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.IRON_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_DIAMOND_SWORD] = {
    ["name"] = "Heartseeker Diamond Sword",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.DIAMOND_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.VALENTINE_EMERALD_SWORD] = {
    ["name"] = "Heartseeker Emerald Sword",
    ["skinTag"] = "valentine",
    ["itemType"] = v6.EMERALD_SWORD,
    ["rarity"] = v7.TWO_STAR
}
u16[v9.DARKVALENTINE_WOOD_PICKAXE] = {
    ["name"] = "Darkheart Wood Pickaxe",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.WOOD_PICKAXE,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_STONE_PICKAXE] = {
    ["name"] = "Darkheart Stone Pickaxe",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.STONE_PICKAXE,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_IRON_PICKAXE] = {
    ["name"] = "Darkheart Iron Pickaxe",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.IRON_PICKAXE,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_DIAMOND_PICKAXE] = {
    ["name"] = "Darkheart Diamond Pickaxe",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.DIAMOND_PICKAXE,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_WOOD_AXE] = {
    ["name"] = "Darkheart Wood Axe",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.WOOD_AXE,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_STONE_AXE] = {
    ["name"] = "Darkheart Stone Axe",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.STONE_AXE,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_IRON_AXE] = {
    ["name"] = "Darkheart Iron Axe",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.IRON_AXE,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_DIAMOND_AXE] = {
    ["name"] = "Darkheart Diamond Axe",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.DIAMOND_AXE,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_WOOD_SWORD] = {
    ["name"] = "Darkheart Wood Sword",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.WOOD_SWORD,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_STONE_SWORD] = {
    ["name"] = "Darkheart Stone Sword",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.STONE_SWORD,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_IRON_SWORD] = {
    ["name"] = "Darkheart Iron Sword",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.IRON_SWORD,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_DIAMOND_SWORD] = {
    ["name"] = "Darkheart Diamond Sword",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.DIAMOND_SWORD,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.DARKVALENTINE_EMERALD_SWORD] = {
    ["name"] = "Darkheart Emerald Sword",
    ["skinTag"] = "darkvalentine",
    ["itemType"] = v6.EMERALD_SWORD,
    ["rarity"] = v7.THREE_STAR
}
u16[v9.HEARTBEAM_WOOD_SWORD] = {
    ["name"] = "Heartbeam Wood Sword",
    ["skinTag"] = "heartbeam",
    ["itemType"] = v6.WOOD_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.HEARTBEAM_STONE_SWORD] = {
    ["name"] = "Heartbeam Stone Sword",
    ["skinTag"] = "heartbeam",
    ["itemType"] = v6.STONE_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.HEARTBEAM_IRON_SWORD] = {
    ["name"] = "Heartbeam Iron Sword",
    ["skinTag"] = "heartbeam",
    ["itemType"] = v6.IRON_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.HEARTBEAM_DIAMOND_SWORD] = {
    ["name"] = "Heartbeam Diamond Sword",
    ["skinTag"] = "heartbeam",
    ["itemType"] = v6.DIAMOND_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.HEARTBEAM_EMERALD_SWORD] = {
    ["name"] = "Heartbeam Emerald Sword",
    ["skinTag"] = "heartbeam",
    ["itemType"] = v6.EMERALD_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.RABBIT_BEAM_WOOD_SWORD] = {
    ["name"] = "Rabbit Beam Wood Sword",
    ["skinTag"] = "easter_rabbit",
    ["itemType"] = v6.WOOD_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.RABBIT_BEAM_STONE_SWORD] = {
    ["name"] = "Rabbit Beam Stone Sword",
    ["skinTag"] = "easter_rabbit",
    ["itemType"] = v6.STONE_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.RABBIT_BEAM_IRON_SWORD] = {
    ["name"] = "Rabbit Beam Iron Sword",
    ["skinTag"] = "easter_rabbit",
    ["itemType"] = v6.IRON_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.RABBIT_BEAM_DIAMOND_SWORD] = {
    ["name"] = "Rabbit Beam Diamond Sword",
    ["skinTag"] = "easter_rabbit",
    ["itemType"] = v6.DIAMOND_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.RABBIT_BEAM_EMERALD_SWORD] = {
    ["name"] = "Rabbit Beam Emerald Sword",
    ["skinTag"] = "easter_rabbit",
    ["itemType"] = v6.EMERALD_SWORD,
    ["rarity"] = v7.ONE_STAR
}
u16[v9.BALLOON_WOOD_PICKAXE] = {
    ["name"] = "Balloon Wood Pickaxe",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.WOOD_PICKAXE,
    ["rarity"] = v7.THREE_STAR,
    ["blockHitSoundOverride"] = v15({
        v8.BALLOON_SWORD_DAMAGE_1,
        v8.BALLOON_SWORD_DAMAGE_2,
        v8.BALLOON_SWORD_DAMAGE_3,
        v8.BALLOON_SWORD_DAMAGE_4
    })
}
u16[v9.BALLOON_STONE_PICKAXE] = {
    ["name"] = "Balloon Stone Pickaxe",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.STONE_PICKAXE,
    ["rarity"] = v7.THREE_STAR,
    ["blockHitSoundOverride"] = v15({
        v8.BALLOON_SWORD_DAMAGE_1,
        v8.BALLOON_SWORD_DAMAGE_2,
        v8.BALLOON_SWORD_DAMAGE_3,
        v8.BALLOON_SWORD_DAMAGE_4
    })
}
u16[v9.BALLOON_IRON_PICKAXE] = {
    ["name"] = "Balloon Iron Pickaxe",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.IRON_PICKAXE,
    ["rarity"] = v7.THREE_STAR,
    ["blockHitSoundOverride"] = v15({
        v8.BALLOON_SWORD_DAMAGE_1,
        v8.BALLOON_SWORD_DAMAGE_2,
        v8.BALLOON_SWORD_DAMAGE_3,
        v8.BALLOON_SWORD_DAMAGE_4
    })
}
u16[v9.BALLOON_DIAMOND_PICKAXE] = {
    ["name"] = "Balloon Diamond Pickaxe",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.DIAMOND_PICKAXE,
    ["rarity"] = v7.THREE_STAR,
    ["blockHitSoundOverride"] = v15({
        v8.BALLOON_SWORD_DAMAGE_1,
        v8.BALLOON_SWORD_DAMAGE_2,
        v8.BALLOON_SWORD_DAMAGE_3,
        v8.BALLOON_SWORD_DAMAGE_4
    })
}
u16[v9.BALLOON_WOOD_AXE] = {
    ["name"] = "Balloon Wood Axe",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.WOOD_AXE,
    ["rarity"] = v7.THREE_STAR,
    ["blockHitSoundOverride"] = v15({
        v8.BALLOON_SWORD_DAMAGE_1,
        v8.BALLOON_SWORD_DAMAGE_2,
        v8.BALLOON_SWORD_DAMAGE_3,
        v8.BALLOON_SWORD_DAMAGE_4
    })
}
u16[v9.BALLOON_STONE_AXE] = {
    ["name"] = "Balloon Stone Axe",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.STONE_AXE,
    ["rarity"] = v7.THREE_STAR,
    ["blockHitSoundOverride"] = v15({
        v8.BALLOON_SWORD_DAMAGE_1,
        v8.BALLOON_SWORD_DAMAGE_2,
        v8.BALLOON_SWORD_DAMAGE_3,
        v8.BALLOON_SWORD_DAMAGE_4
    })
}
u16[v9.BALLOON_IRON_AXE] = {
    ["name"] = "Balloon Iron Axe",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.IRON_AXE,
    ["rarity"] = v7.THREE_STAR,
    ["blockHitSoundOverride"] = v15({
        v8.BALLOON_SWORD_DAMAGE_1,
        v8.BALLOON_SWORD_DAMAGE_2,
        v8.BALLOON_SWORD_DAMAGE_3,
        v8.BALLOON_SWORD_DAMAGE_4
    })
}
u16[v9.BALLOON_DIAMOND_AXE] = {
    ["name"] = "Balloon Diamond Axe",
    ["skinTag"] = "balloon",
    ["itemType"] = v6.DIAMOND_AXE,
    ["rarity"] = v7.THREE_STAR,
    ["blockHitSoundOverride"] = v15({
        v8.BALLOON_SWORD_DAMAGE_1,
        v8.BALLOON_SWORD_DAMAGE_2,
        v8.BALLOON_SWORD_DAMAGE_3,
        v8.BALLOON_SWORD_DAMAGE_4
    })
}
local v99 = v9.SHORT_PIXEL_WOOD_SWORD
local v100 = {
    ["name"] = "Short Pixel Wood Sword",
    ["skinTag"] = "shortpixel",
    ["itemType"] = v6.WOOD_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v99] = v100
local v101 = v9.SHORT_PIXEL_STONE_SWORD
local v102 = {
    ["name"] = "Short Pixel Stone Sword",
    ["skinTag"] = "shortpixel",
    ["itemType"] = v6.STONE_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v101] = v102
local v103 = v9.SHORT_PIXEL_IRON_SWORD
local v104 = {
    ["name"] = "Short Pixel Iron Sword",
    ["skinTag"] = "shortpixel",
    ["itemType"] = v6.IRON_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v103] = v104
local v105 = v9.SHORT_PIXEL_DIAMOND_SWORD
local v106 = {
    ["name"] = "Short Pixel Diamond Sword",
    ["skinTag"] = "shortpixel",
    ["itemType"] = v6.DIAMOND_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v105] = v106
local v107 = v9.SHORT_PIXEL_EMERALD_SWORD
local v108 = {
    ["name"] = "Short Pixel Emerald Sword",
    ["skinTag"] = "shortpixel",
    ["itemType"] = v6.EMERALD_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v107] = v108
local v109 = v9.PIXEL_WOOD_SWORD
local v110 = {
    ["name"] = "Pixel Wood Sword",
    ["skinTag"] = "pixel",
    ["itemType"] = v6.WOOD_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v109] = v110
local v111 = v9.PIXEL_STONE_SWORD
local v112 = {
    ["name"] = "Pixel Stone Sword",
    ["skinTag"] = "pixel",
    ["itemType"] = v6.STONE_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v111] = v112
local v113 = v9.PIXEL_IRON_SWORD
local v114 = {
    ["name"] = "Pixel Iron Sword",
    ["skinTag"] = "pixel",
    ["itemType"] = v6.IRON_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v113] = v114
local v115 = v9.PIXEL_DIAMOND_SWORD
local v116 = {
    ["name"] = "Pixel Diamond Sword",
    ["skinTag"] = "pixel",
    ["itemType"] = v6.DIAMOND_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v115] = v116
local v117 = v9.PIXEL_EMERALD_SWORD
local v118 = {
    ["name"] = "Pixel Emerald Sword",
    ["skinTag"] = "pixel",
    ["itemType"] = v6.EMERALD_SWORD,
    ["rarity"] = v7.THREE_STAR,
    ["sword"] = {
        ["swingSounds"] = { v8.PIXEL_SWORD_SWING },
        ["hitSounds"] = { v8.PIXEL_SWORD_DAMAGE }
    }
}
u16[v117] = v118
local v119 = v9.PILLOW_WOOD_SWORD
local v120 = {
    ["name"] = "Pillow Wood Sword",
    ["skinTag"] = "pillow",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.WOOD_SWORD,
    ["sword"] = {
        ["hitSounds"] = { v8.PILLOW_HIT_1, v8.PILLOW_HIT_2, v8.PILLOW_HIT_3 }
    }
}
u16[v119] = v120
local v121 = v9.PILLOW_STONE_SWORD
local v122 = {
    ["name"] = "Pillow Stone Sword",
    ["skinTag"] = "pillow",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.STONE_SWORD,
    ["sword"] = {
        ["hitSounds"] = { v8.PILLOW_HIT_1, v8.PILLOW_HIT_2, v8.PILLOW_HIT_3 }
    }
}
u16[v121] = v122
local v123 = v9.PILLOW_IRON_SWORD
local v124 = {
    ["name"] = "Pillow Iron Sword",
    ["skinTag"] = "pillow",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.IRON_SWORD,
    ["sword"] = {
        ["hitSounds"] = { v8.PILLOW_HIT_1, v8.PILLOW_HIT_2, v8.PILLOW_HIT_3 }
    }
}
u16[v123] = v124
local v125 = v9.PILLOW_DIAMOND_SWORD
local v126 = {
    ["name"] = "Pillow Diamond Sword",
    ["skinTag"] = "pillow",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.DIAMOND_SWORD,
    ["sword"] = {
        ["hitSounds"] = { v8.PILLOW_HIT_1, v8.PILLOW_HIT_2, v8.PILLOW_HIT_3 }
    }
}
u16[v125] = v126
local v127 = v9.PILLOW_EMERALD_SWORD
local v128 = {
    ["name"] = "Pillow Emerald Sword",
    ["skinTag"] = "pillow",
    ["kitSkinOnly"] = true,
    ["itemType"] = v6.EMERALD_SWORD,
    ["sword"] = {
        ["hitSounds"] = { v8.PILLOW_HIT_1, v8.PILLOW_HIT_2, v8.PILLOW_HIT_3 }
    }
}
u16[v127] = v128
u16[v9.GOLD_VICTORIOUS_ICE_SWORD] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.ICE_SWORD
}
u16[v9.PLATINUM_VICTORIOUS_ICE_SWORD] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.ICE_SWORD
}
u16[v9.DIAMOND_VICTORIOUS_ICE_SWORD] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.ICE_SWORD
}
u16[v9.EMERALD_VICTORIOUS_ICE_SWORD] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.ICE_SWORD
}
u16[v9.NIGHTMARE_VICTORIOUS_ICE_SWORD] = {
    ["skinTag"] = "victorious",
    ["itemType"] = v6.ICE_SWORD
}
u16[v9.WARRIOR_CHROMA_HELMET] = {
    ["name"] = "Warrior Chroma Helmet",
    ["skinTag"] = "chroma",
    ["itemType"] = v6.WARRIOR_HELMET
}
u16[v9.WARRIOR_CHROMA_CHESTPLATE] = {
    ["name"] = "Warrior Chroma Chestplate",
    ["skinTag"] = "chroma",
    ["itemType"] = v6.WARRIOR_CHESTPLATE
}
u16[v9.WARRIOR_CHROMA_BOOTS] = {
    ["name"] = "Warrior Chroma Boots",
    ["skinTag"] = "chroma",
    ["itemType"] = v6.WARRIOR_BOOTS
}
u16[v9.ICE_VIKING_WARRIOR_HELMET] = {
    ["name"] = "Ice Viking Warrior Helmet",
    ["skinTag"] = "ice viking",
    ["itemType"] = v6.WARRIOR_HELMET
}
u16[v9.ICE_VIKING_WARRIOR_CHESTPLATE] = {
    ["name"] = "Ice Viking Warrior Chestplate",
    ["skinTag"] = "ice viking",
    ["itemType"] = v6.WARRIOR_CHESTPLATE
}
u16[v9.ICE_VIKING_WARRIOR_BOOTS] = {
    ["name"] = "Ice Viking Warrior Boots",
    ["skinTag"] = "ice viking",
    ["itemType"] = v6.WARRIOR_BOOTS
}
local u135 = (function() --[[ Line: 1548 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u3
    --]]
    local v129 = {}
    for v130, v131 in u4.entries(u16) do
        local _ = v130 - 1
        local v132 = v131[1]
        local v133 = v131[2]
        local v134 = u3.getOrCreate(v129, v133.itemType, {})
        table.insert(v134, v132)
    end
    return v129
end)()
return {
    ["getItemSkinMeta"] = function(p136) --[[ Name: getItemSkinMeta, Line 1545 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        return u16[p136]
    end,
    ["getItemSkins"] = function(p137) --[[ Name: getItemSkins, Line 1562 ]]
        --[[
        Upvalues:
            [1] = u135
        --]]
        local v138 = u135[p137]
        if not v138 then
            return nil
        end
        local v139 = {}
        local v140 = #v139
        table.move(v138, 1, #v138, v140 + 1, v139)
        table.sort(v139)
        return v139
    end,
    ["ItemSkinMeta"] = u16
}