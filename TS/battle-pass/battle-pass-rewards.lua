local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-type").BattlePass
local v14 = {}
local v15 = v13.EASTER_2026
local v16 = {}
local v17 = {
    ["paid"] = true,
    ["level"] = 20,
    ["kit"] = v5.SOUL_BROKER
}
local v18 = {
    ["paid"] = false,
    ["level"] = 41,
    ["kit"] = v5.SOUL_BROKER
}
local v19 = {
    ["paid"] = true,
    ["level"] = 35,
    ["bedSkin"] = v3.BED_EASTER_RABBIT
}
local v20 = {
    ["paid"] = true,
    ["level"] = 7,
    ["title"] = v10.EGG_EMOJI
}
local v21 = {
    ["paid"] = false,
    ["level"] = 39,
    ["title"] = v10.YOLKED
}
local v22 = {
    ["paid"] = true,
    ["level"] = 39,
    ["title"] = v10.AWAKENED
}
local v23 = {
    ["paid"] = true,
    ["level"] = 23,
    ["title"] = v10.BLOOMED
}
local v24 = {
    ["paid"] = false,
    ["level"] = 2,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v25 = {
    ["paid"] = false,
    ["level"] = 14,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v26 = {
    ["paid"] = false,
    ["level"] = 27,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v27 = {
    ["paid"] = false,
    ["level"] = 31,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v28 = {
    ["paid"] = true,
    ["level"] = 31,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v29 = {
    ["paid"] = true,
    ["level"] = 2,
    ["consumable"] = {
        ["amount"] = 2,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v30 = {
    ["paid"] = true,
    ["level"] = 14,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v31 = {
    ["paid"] = true,
    ["level"] = 27,
    ["consumable"] = {
        ["amount"] = 2,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v32 = {
    ["paid"] = true,
    ["level"] = 38,
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
__set_list(v16, 1, {v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32})
local v33 = {
    ["paid"] = true,
    ["level"] = 6,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v34 = {
    ["paid"] = false,
    ["level"] = 9,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v35 = {
    ["paid"] = true,
    ["level"] = 18,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v36 = {
    ["paid"] = true,
    ["level"] = 21,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v37 = {
    ["paid"] = false,
    ["level"] = 36,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v38 = {
    ["paid"] = true,
    ["level"] = 30,
    ["crate"] = v12.DIAMOND_LUCKY_CRATE
}
local v39 = {
    ["paid"] = true,
    ["level"] = 1,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v40 = {
    ["paid"] = true,
    ["level"] = 36,
    ["crate"] = v12.DIAMOND_LUCKY_CRATE
}
local v41 = {
    ["paid"] = false,
    ["level"] = 40,
    ["crate"] = v12.KITSKIN_CRATE
}
local v42 = {
    ["paid"] = false,
    ["level"] = 4,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_1_5X
    }
}
local v43 = {
    ["paid"] = false,
    ["level"] = 15,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_1_5X
    }
}
local v44 = {
    ["paid"] = false,
    ["level"] = 34,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v45 = {
    ["paid"] = true,
    ["level"] = 34,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v46 = {
    ["paid"] = true,
    ["level"] = 4,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v47 = {
    ["paid"] = true,
    ["level"] = 12,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v48 = {
    ["paid"] = true,
    ["level"] = 29,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_3X
    }
}
__set_list(v16, 17, {v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48})
local v49 = {
    ["paid"] = false,
    ["level"] = 33,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_FIGHTER_7
    }
}
local v50 = {
    ["paid"] = false,
    ["level"] = 3,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_MOVEMENT_7
    }
}
local v51 = {
    ["paid"] = true,
    ["level"] = 33,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_FIGHTER_7
    }
}
local v52 = {
    ["paid"] = true,
    ["level"] = 3,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_NORMAL
    }
}
local v53 = {
    ["paid"] = false,
    ["level"] = 37,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_BATTLEPASS_7
    }
}
local v54 = {
    ["paid"] = true,
    ["level"] = 37,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_ALL_7
    }
}
__set_list(v16, 33, {v49, v50, v51, v52, v53, v54, {
    ["paid"] = false,
    ["level"] = 1,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 5,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 8,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 11,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 13,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 19,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 22,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 32,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 38,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 32,
    ["bedCoins"] = 1000
}})
__set_list(v16, 49, {{
    ["paid"] = false,
    ["level"] = 28,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 24,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 1,
    ["bedCoins"] = 2000
}, {
    ["paid"] = true,
    ["level"] = 5,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 8,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 11,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 13,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 17,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 17,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 19,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 22,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 24,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 28,
    ["bedCoins"] = 2000
}, {
    ["paid"] = true,
    ["level"] = 1,
    ["emote"] = v7.ROTTEN_EGG
}, {
    ["paid"] = true,
    ["level"] = 16,
    ["emote"] = v7.BUNNY_BARBARIAN_QUESTION
}, {
    ["paid"] = false,
    ["level"] = 6,
    ["emote"] = v7.EASTER_FREIYA_DANGER
}})
__set_list(v16, 65, {{
    ["paid"] = true,
    ["level"] = 9,
    ["emote"] = v7.EASTER_GROVE_AWE
}, {
    ["paid"] = false,
    ["level"] = 12,
    ["emote"] = v7.EASTER_FREIYA_OMG
}, {
    ["paid"] = false,
    ["level"] = 18,
    ["emote"] = v7.EASTER_GRIM_QUIET
}, {
    ["paid"] = true,
    ["level"] = 15,
    ["emote"] = v7.EASTER_UMA_HAPPY
}, {
    ["paid"] = false,
    ["level"] = 23,
    ["emote"] = v7.EASTER_UMA_LOVE
}, {
    ["paid"] = true,
    ["level"] = 26,
    ["emote"] = v7.TALIYAH_MISCHIEVOUS
}, {
    ["paid"] = true,
    ["level"] = 25,
    ["killEffect"] = v8.BEE_STING
}, {
    ["paid"] = true,
    ["level"] = 20,
    ["killEffect"] = v8.POP
}, {
    ["paid"] = true,
    ["level"] = 10,
    ["killEffect"] = v8.EGG_HATCH
}, {
    ["paid"] = false,
    ["level"] = 10,
    ["killEffect"] = v8.CARROT_SPLOSION
}, {
    ["paid"] = false,
    ["level"] = 25,
    ["killEffect"] = v8.FLOWER_SPLOSION
}, {
    ["paid"] = false,
    ["level"] = 35,
    ["bedBreakEffect"] = v6.POP
}, {
    ["paid"] = true,
    ["level"] = 15,
    ["bedBreakEffect"] = v6.BALLOONS
}, {
    ["paid"] = false,
    ["level"] = 20,
    ["bedBreakEffect"] = v6.FLOWER_SPLOSION
}, {
    ["paid"] = false,
    ["level"] = 11,
    ["itemSkin"] = v3.RABBIT_BEAM_WOOD_SWORD
}, {
    ["paid"] = false,
    ["level"] = 16,
    ["itemSkin"] = v3.RABBIT_BEAM_STONE_SWORD
}})
__set_list(v16, 81, {{
    ["paid"] = false,
    ["level"] = 21,
    ["itemSkin"] = v3.RABBIT_BEAM_IRON_SWORD
}, {
    ["paid"] = false,
    ["level"] = 26,
    ["itemSkin"] = v3.RABBIT_BEAM_DIAMOND_SWORD
}, {
    ["paid"] = false,
    ["level"] = 30,
    ["itemSkin"] = v3.RABBIT_BEAM_EMERALD_SWORD
}, {
    ["paid"] = true,
    ["level"] = 40,
    ["itemSkin"] = v3.PIXEL_WOOD_SWORD
}, {
    ["paid"] = true,
    ["level"] = 40,
    ["itemSkin"] = v3.PIXEL_STONE_SWORD
}, {
    ["paid"] = true,
    ["level"] = 40,
    ["itemSkin"] = v3.PIXEL_IRON_SWORD
}, {
    ["paid"] = true,
    ["level"] = 40,
    ["itemSkin"] = v3.PIXEL_DIAMOND_SWORD
}, {
    ["paid"] = true,
    ["level"] = 40,
    ["itemSkin"] = v3.PIXEL_EMERALD_SWORD
}, {
    ["paid"] = true,
    ["level"] = 41,
    ["kitSkin"] = v4.GRIM_REAPER_EASTER
}})
v14[v15] = v16
local v55 = v13.LNY_2026
local v56 = {}
local v57 = {
    ["paid"] = false,
    ["level"] = 2,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v58 = {
    ["paid"] = false,
    ["level"] = 16,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v59 = {
    ["paid"] = false,
    ["level"] = 14,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v60 = {
    ["paid"] = false,
    ["level"] = 27,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v61 = {
    ["paid"] = true,
    ["level"] = 2,
    ["consumable"] = {
        ["amount"] = 2,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v62 = {
    ["paid"] = true,
    ["level"] = 16,
    ["consumable"] = {
        ["amount"] = 2,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v63 = {
    ["paid"] = true,
    ["level"] = 27,
    ["consumable"] = {
        ["amount"] = 2,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v64 = {
    ["paid"] = true,
    ["level"] = 5,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v65 = {
    ["paid"] = false,
    ["level"] = 10,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v66 = {
    ["paid"] = true,
    ["level"] = 15,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v67 = {
    ["paid"] = true,
    ["level"] = 21,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v68 = {
    ["paid"] = true,
    ["level"] = 27,
    ["crate"] = v12.DIAMOND_LUCKY_CRATE
}
local v69 = {
    ["paid"] = true,
    ["level"] = 1,
    ["crate"] = v12.LEVEL_UP_CRATE
}
local v70 = {
    ["paid"] = true,
    ["level"] = 29,
    ["crate"] = v12.DIAMOND_LUCKY_CRATE
}
local v71 = {
    ["paid"] = false,
    ["level"] = 30,
    ["crate"] = v12.KITSKIN_CRATE
}
local v72 = {
    ["paid"] = false,
    ["level"] = 4,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_1_5X
    }
}
__set_list(v56, 1, {v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72})
local v73 = {
    ["paid"] = true,
    ["level"] = 4,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v74 = {
    ["paid"] = true,
    ["level"] = 12,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v75 = {
    ["paid"] = true,
    ["level"] = 18,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v76 = {
    ["paid"] = true,
    ["level"] = 23,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_3X
    }
}
local v77 = {
    ["paid"] = false,
    ["level"] = 33,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v78 = {
    ["paid"] = false,
    ["level"] = 15,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_FIGHTER_7
    }
}
local v79 = {
    ["paid"] = false,
    ["level"] = 3,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_MOVEMENT_7
    }
}
local v80 = {
    ["paid"] = true,
    ["level"] = 3,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_NORMAL
    }
}
local v81 = {
    ["paid"] = false,
    ["level"] = 29,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_BATTLEPASS_7
    }
}
local v82 = {
    ["paid"] = true,
    ["level"] = 28,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_ALL_7
    }
}
__set_list(v56, 17, {v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, {
    ["paid"] = false,
    ["level"] = 1,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 7,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 29,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 3,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 5,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 8,
    ["bedCoins"] = 500
}})
__set_list(v56, 33, {{
    ["paid"] = false,
    ["level"] = 11,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 13,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 19,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 22,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 26,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 28,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 24,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 1,
    ["bedCoins"] = 2000
}, {
    ["paid"] = true,
    ["level"] = 6,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 8,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 11,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 13,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 17,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 17,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 19,
    ["bedCoins"] = 1500
}, {
    ["paid"] = true,
    ["level"] = 24,
    ["bedCoins"] = 2000
}})
__set_list(v56, 49, {{
    ["paid"] = true,
    ["level"] = 28,
    ["bedCoins"] = 2000
}, {
    ["paid"] = false,
    ["level"] = 20,
    ["killEffect"] = v8.FIRE_CRACKERS
}, {
    ["paid"] = true,
    ["level"] = 10,
    ["killEffect"] = v8.SHOT_BY_CUPID
}, {
    ["paid"] = false,
    ["level"] = 15,
    ["bedBreakEffect"] = v6.FIREWORK
}, {
    ["paid"] = true,
    ["level"] = 5,
    ["bedBreakEffect"] = v6.ROSE
}, {
    ["paid"] = true,
    ["level"] = 18,
    ["lobbyGadget"] = v9.LOVE_CHAIR
}, {
    ["paid"] = false,
    ["level"] = 5,
    ["itemSkin"] = v3.HEARTBEAM_WOOD_SWORD
}, {
    ["paid"] = false,
    ["level"] = 10,
    ["itemSkin"] = v3.HEARTBEAM_STONE_SWORD
}, {
    ["paid"] = false,
    ["level"] = 15,
    ["itemSkin"] = v3.HEARTBEAM_IRON_SWORD
}, {
    ["paid"] = false,
    ["level"] = 20,
    ["itemSkin"] = v3.HEARTBEAM_DIAMOND_SWORD
}, {
    ["paid"] = false,
    ["level"] = 25,
    ["itemSkin"] = v3.HEARTBEAM_EMERALD_SWORD
}, {
    ["paid"] = true,
    ["level"] = 1,
    ["itemSkin"] = v3.VALENTINE_WOOD_SWORD
}, {
    ["paid"] = true,
    ["level"] = 5,
    ["itemSkin"] = v3.VALENTINE_STONE_SWORD
}, {
    ["paid"] = true,
    ["level"] = 10,
    ["itemSkin"] = v3.VALENTINE_IRON_SWORD
}, {
    ["paid"] = true,
    ["level"] = 20,
    ["itemSkin"] = v3.VALENTINE_DIAMOND_SWORD
}, {
    ["paid"] = true,
    ["level"] = 25,
    ["itemSkin"] = v3.VALENTINE_EMERALD_SWORD
}})
__set_list(v56, 65, {{
    ["paid"] = true,
    ["level"] = 1,
    ["itemSkin"] = v3.VALENTINE_WOOD_PICKAXE
}, {
    ["paid"] = true,
    ["level"] = 5,
    ["itemSkin"] = v3.VALENTINE_STONE_PICKAXE
}, {
    ["paid"] = true,
    ["level"] = 10,
    ["itemSkin"] = v3.VALENTINE_IRON_PICKAXE
}, {
    ["paid"] = true,
    ["level"] = 20,
    ["itemSkin"] = v3.VALENTINE_DIAMOND_PICKAXE
}, {
    ["paid"] = true,
    ["level"] = 1,
    ["itemSkin"] = v3.VALENTINE_WOOD_AXE
}, {
    ["paid"] = true,
    ["level"] = 5,
    ["itemSkin"] = v3.VALENTINE_STONE_AXE
}, {
    ["paid"] = true,
    ["level"] = 10,
    ["itemSkin"] = v3.VALENTINE_IRON_AXE
}, {
    ["paid"] = true,
    ["level"] = 20,
    ["itemSkin"] = v3.VALENTINE_DIAMOND_AXE
}, {
    ["paid"] = true,
    ["level"] = 25,
    ["kitSkin"] = v4.SPIRIT_ASSASSIN_KURO
}, {
    ["paid"] = true,
    ["level"] = 30,
    ["kitSkin"] = v4.BARBARIAN_DYNASTY
}, {
    ["paid"] = true,
    ["level"] = 30,
    ["title"] = v10.HARMONY
}, {
    ["paid"] = false,
    ["level"] = 21,
    ["title"] = v10.GOLDEN
}, {
    ["paid"] = true,
    ["level"] = 7,
    ["title"] = v10.HEART_ARROW_EMOJI
}, {
    ["paid"] = true,
    ["level"] = 1,
    ["title"] = v10.HEART_SYMBOL
}, {
    ["paid"] = false,
    ["level"] = 26,
    ["title"] = v10.HEARTLESS
}, {
    ["paid"] = false,
    ["level"] = 9,
    ["title"] = v10.BROKEN_HEART_SYMBOL
}})
__set_list(v56, 81, {{
    ["paid"] = true,
    ["level"] = 14,
    ["emote"] = v7.BUILDER_CRY
}, {
    ["paid"] = false,
    ["level"] = 6,
    ["emote"] = v7.EVELYNN_DENIAL
}, {
    ["paid"] = true,
    ["level"] = 9,
    ["emote"] = v7.EVELYNN_HEARTBREAK
}, {
    ["paid"] = false,
    ["level"] = 12,
    ["emote"] = v7.MELODY_FLOWERS_FOR_YOU
}, {
    ["paid"] = false,
    ["level"] = 18,
    ["emote"] = v7.LOVE_STRUCK_VANESSA
}, {
    ["paid"] = true,
    ["level"] = 22,
    ["emote"] = v7.VALENTINE_AERY_LOVE
}, {
    ["paid"] = false,
    ["level"] = 23,
    ["emote"] = v7.VALENTINE_AERY_QUEEN
}, {
    ["paid"] = true,
    ["level"] = 26,
    ["emote"] = v7.MISCHIEF_VALENTINES_EVELYNN
}})
v14[v55] = v56
local v83 = v13.XMAS_2025
local v84 = {}
local v85 = {
    ["paid"] = true,
    ["level"] = 1,
    ["lobbyGadget"] = v9.SNOWBOARD
}
local v86 = {
    ["paid"] = false,
    ["level"] = 2,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v87 = {
    ["paid"] = false,
    ["level"] = 16,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v88 = {
    ["paid"] = false,
    ["level"] = 28,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v89 = {
    ["paid"] = true,
    ["level"] = 2,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v90 = {
    ["paid"] = true,
    ["level"] = 11,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v91 = {
    ["paid"] = true,
    ["level"] = 16,
    ["consumable"] = {
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v92 = {
    ["paid"] = true,
    ["level"] = 24,
    ["consumable"] = {
        ["amount"] = 2,
        ["consumableType"] = v2.KITSKIN_CRATE_FRAGMENT
    }
}
local v93 = {
    ["paid"] = false,
    ["level"] = 4,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_1_5X
    }
}
local v94 = {
    ["paid"] = true,
    ["level"] = 4,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v95 = {
    ["paid"] = true,
    ["level"] = 12,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_2X
    }
}
local v96 = {
    ["paid"] = true,
    ["level"] = 23,
    ["consumable"] = {
        ["consumableType"] = v2.ARMOR_TRIM_3X
    }
}
local v97 = {
    ["paid"] = false,
    ["level"] = 14,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_FIGHTER_7
    }
}
local v98 = {
    ["paid"] = false,
    ["level"] = 7,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_MOVEMENT_7
    }
}
local v99 = {
    ["paid"] = true,
    ["level"] = 3,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_NORMAL
    }
}
local v100 = {
    ["paid"] = false,
    ["level"] = 29,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_BATTLEPASS_7
    }
}
__set_list(v84, 1, {v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100})
local v101 = {
    ["paid"] = true,
    ["level"] = 28,
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_ALL_7
    }
}
__set_list(v84, 17, {v101, {
    ["paid"] = true,
    ["level"] = 20,
    ["killEffect"] = v8.SLEIGH_RAN_OVER
}, {
    ["paid"] = false,
    ["level"] = 25,
    ["killEffect"] = v8.SNOWBALL_RAN_OVER
}, {
    ["paid"] = true,
    ["level"] = 10,
    ["bedBreakEffect"] = v6.SNOWBALL
}, {
    ["paid"] = false,
    ["level"] = 18,
    ["emote"] = v7.CHRISTMAS_CAROL
}, {
    ["paid"] = true,
    ["level"] = 25,
    ["kitSkin"] = v4.STARRYSOLDIER_VULCAN
}, {
    ["paid"] = true,
    ["level"] = 30,
    ["kitSkin"] = v4.SUBZERO_MARCEL
}, {
    ["paid"] = true,
    ["level"] = 5,
    ["crate"] = v12.LEVEL_UP_CRATE
}, {
    ["paid"] = false,
    ["level"] = 10,
    ["crate"] = v12.LEVEL_UP_CRATE
}, {
    ["paid"] = true,
    ["level"] = 15,
    ["crate"] = v12.LEVEL_UP_CRATE
}, {
    ["paid"] = true,
    ["level"] = 21,
    ["crate"] = v12.LEVEL_UP_CRATE
}, {
    ["paid"] = true,
    ["level"] = 27,
    ["crate"] = v12.DIAMOND_LUCKY_CRATE
}, {
    ["paid"] = true,
    ["level"] = 1,
    ["crate"] = v12.LEVEL_UP_CRATE
}, {
    ["paid"] = false,
    ["level"] = 30,
    ["crate"] = v12.DIAMOND_LUCKY_CRATE
}, {
    ["paid"] = true,
    ["level"] = 29,
    ["crate"] = v12.KITSKIN_CRATE
}, {
    ["paid"] = true,
    ["level"] = 30,
    ["title"] = v10.FROZEN
}})
__set_list(v84, 33, {{
    ["paid"] = false,
    ["level"] = 21,
    ["title"] = v10.HOLLY
}, {
    ["paid"] = true,
    ["level"] = 7,
    ["title"] = v10.SNOWBOARDER_EMOJI
}, {
    ["paid"] = false,
    ["level"] = 14,
    ["title"] = v10.SEND_IT
}, {
    ["paid"] = true,
    ["level"] = 14,
    ["emote"] = v7.COOKIE_TREE
}, {
    ["paid"] = false,
    ["level"] = 6,
    ["emote"] = v7.NOGIFT_LASSY
}, {
    ["paid"] = true,
    ["level"] = 9,
    ["emote"] = v7.GRINCH_MILO
}, {
    ["paid"] = false,
    ["level"] = 12,
    ["emote"] = v7.INJURED_GINGERBREAD
}, {
    ["paid"] = true,
    ["level"] = 18,
    ["emote"] = v7.NUTCRACKER_BUILDER_PANIC
}, {
    ["paid"] = true,
    ["level"] = 22,
    ["emote"] = v7.REINDEER_LASSY
}, {
    ["paid"] = false,
    ["level"] = 27,
    ["emote"] = v7.WRENS_GIFT
}, {
    ["paid"] = true,
    ["level"] = 26,
    ["emote"] = v7.FROSTY_FURY
}, {
    ["paid"] = false,
    ["level"] = 1,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 3,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 5,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 9,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 11,
    ["bedCoins"] = 500
}})
__set_list(v84, 49, {{
    ["paid"] = false,
    ["level"] = 13,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 19,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 22,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 24,
    ["bedCoins"] = 500
}, {
    ["paid"] = false,
    ["level"] = 26,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 23,
    ["bedCoins"] = 500
}, {
    ["paid"] = true,
    ["level"] = 1,
    ["bedCoins"] = 2000
}, {
    ["paid"] = true,
    ["level"] = 6,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 8,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 12,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 14,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 17,
    ["bedCoins"] = 1000
}, {
    ["paid"] = false,
    ["level"] = 17,
    ["bedCoins"] = 1000
}, {
    ["paid"] = true,
    ["level"] = 19,
    ["bedCoins"] = 1500
}, {
    ["paid"] = true,
    ["level"] = 25,
    ["bedCoins"] = 2000
}, {
    ["paid"] = true,
    ["level"] = 28,
    ["bedCoins"] = 2000
}})
v14[v83] = v84
v14[v13.season13] = {
    {
        ["paid"] = false,
        ["level"] = 51,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 52,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 53,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 54,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 55,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 51,
        ["emote"] = v7.I_SEE_YOU
    },
    {
        ["paid"] = false,
        ["level"] = 52,
        ["emote"] = v7.NALHA_PROWLER
    },
    {
        ["paid"] = true,
        ["level"] = 54,
        ["title"] = v10.PRIDE_RGB
    },
    {
        ["paid"] = true,
        ["level"] = 53,
        ["bedCoins"] = 3000
    },
    {
        ["paid"] = true,
        ["level"] = 55,
        ["kitSkin"] = v4.SHARK_RAMIL
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 10,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 30,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.OASIS
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["title"] = v10.SAND_BENDER
    },
    {
        ["paid"] = true,
        ["level"] = 18,
        ["title"] = v10.ONE_OF_A_KIND
    },
    {
        ["paid"] = true,
        ["level"] = 2,
        ["title"] = v10.SKILL_ISSUE
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["title"] = v10.WANDERER
    },
    {
        ["paid"] = false,
        ["level"] = 46,
        ["title"] = v10.MIRAGE
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["title"] = v10.CACTUS_EMOJI
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["title"] = v10.YAPPER
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["title"] = v10.IN_YOUR_HEAD
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["title"] = v10.DODO_TAMER
    },
    {
        ["paid"] = true,
        ["level"] = 13,
        ["emote"] = v7.IM_OKAY
    },
    {
        ["paid"] = true,
        ["level"] = 28,
        ["emote"] = v7.SANDBENDER_SAD
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.OASIS_WATER_SPLASH
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["emote"] = v7.COBALT_LOW_BATTERY
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.SANDBENDER_PEACE
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["emote"] = v7.KRYSTAL_BROKEN_HEART
    },
    {
        ["paid"] = false,
        ["level"] = 44,
        ["emote"] = v7.MELODY_BROKE
    },
    {
        ["paid"] = true,
        ["level"] = 37,
        ["emote"] = v7.YAMINI_POINT
    },
    {
        ["paid"] = false,
        ["level"] = 14,
        ["emote"] = v7.BUILDER_RAGE
    },
    {
        ["paid"] = false,
        ["level"] = 17,
        ["emote"] = v7.CLETUS_BURNED_CROPS
    },
    {
        ["paid"] = false,
        ["level"] = 24,
        ["emote"] = v7.BAKER_COOKING
    },
    {
        ["paid"] = true,
        ["level"] = 46,
        ["emote"] = v7.SKOLL_LET_ME_THINK
    },
    {
        ["paid"] = true,
        ["level"] = 22,
        ["emote"] = v7.OASIS_L
    },
    {
        ["paid"] = false,
        ["level"] = 27,
        ["emote"] = v7.MERCHANT_MARCO_QUICK_SAND
    },
    {
        ["paid"] = true,
        ["level"] = 38,
        ["emote"] = v7.STELLA_NU_UH
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["emote"] = v7.SKOLL_WOLF_TREAT
    },
    {
        ["paid"] = true,
        ["level"] = 19,
        ["emote"] = v7.OASIS_RELAXED
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.TRIXIE_HAHA
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.TOO_MUCH_YAPPING
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["emote"] = v7.TALIYAH_MIZU5
    },
    {
        ["paid"] = false,
        ["level"] = 35,
        ["emote"] = v7.TALIYAH_EAT
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["emote"] = v7.THIRSTY
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["emote"] = v7.WALK_LIKE_EGYPTIAN
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["emote"] = v7.RAIN_DANCE
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["killEffect"] = v8.MUMMY
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["killEffect"] = v8.GENIE_LAMP
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["killEffect"] = v8.SARCOPHAGUS
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["bedBreakEffect"] = v6.UFO
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["bedBreakEffect"] = v6.SARCOPHAGUS
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kitSkin"] = v4.SPIRIT_AGNI
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["winEffect"] = v11.DUST_DEVIL
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.EGYPTIAN_CAT
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["lobbyGadget"] = v9.FLYING_CARPET
    },
    {
        ["paid"] = false,
        ["level"] = 1,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 3,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 9,
        ["bedCoins"] = 750
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 29,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["bedCoins"] = 750
    },
    {
        ["paid"] = false,
        ["level"] = 36,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 39,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 42,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 48,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 6,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 12,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 16,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 23,
        ["bedCoins"] = 1500
    },
    {
        ["paid"] = true,
        ["level"] = 26,
        ["bedCoins"] = 1500
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["bedCoins"] = 1500
    },
    {
        ["paid"] = true,
        ["level"] = 33,
        ["bedCoins"] = 1500
    },
    {
        ["paid"] = true,
        ["level"] = 36,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 48,
        ["bedCoins"] = 2000
    }
}
v14[v13.season12] = {
    {
        ["paid"] = false,
        ["level"] = 51,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 52,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 53,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 54,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 55,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 53,
        ["emote"] = v7.BRAIN_LOADING
    },
    {
        ["paid"] = true,
        ["level"] = 51,
        ["title"] = v10.HUNTER_RGB
    },
    {
        ["paid"] = true,
        ["level"] = 55,
        ["kitSkin"] = v4.BONE_SKOLL
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 10,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 35,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.DIMENSION_TRAVELER
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["title"] = v10.BLUE_HEART
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["title"] = v10.HUNTER
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["title"] = v10.SPIRIT_WARRIOR
    },
    {
        ["paid"] = false,
        ["level"] = 4,
        ["title"] = v10.VOIDLING
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["title"] = v10.SPIRIT_WHISPERER
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["title"] = v10.PURPLE_HEART
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.GARDENER
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["title"] = v10.RIFTWALKER
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["title"] = v10.ABSOLUTE_CINEMA
    },
    {
        ["paid"] = false,
        ["level"] = 25,
        ["title"] = v10.FINGERS_POINTING_INWARD
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["title"] = v10.CORRUPTED
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["title"] = v10.VOID_KNIGHT
    },
    {
        ["paid"] = false,
        ["level"] = 46,
        ["title"] = v10.SPIRIT_ISLAND_RESIDENT
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.COGSWORTH_CHARMED
    },
    {
        ["paid"] = false,
        ["level"] = 2,
        ["emote"] = v7.TRINITY_TWO_SIDES
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.TERRA_INTIMIDATION
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["emote"] = v7.COGSWORTH_SORRY
    },
    {
        ["paid"] = false,
        ["level"] = 44,
        ["emote"] = v7.SPIRIT_CRITTER_WHATCHU_DOIN
    },
    {
        ["paid"] = true,
        ["level"] = 36,
        ["emote"] = v7.SPIRIT_GARDENER_TAKE_THEM_PLEASE
    },
    {
        ["paid"] = true,
        ["level"] = 13,
        ["emote"] = v7.SPIRIT_GARDENER_FLOWER_BASKET
    },
    {
        ["paid"] = false,
        ["level"] = 14,
        ["emote"] = v7.SPIRIT_CRITTER_WOW
    },
    {
        ["paid"] = false,
        ["level"] = 17,
        ["emote"] = v7.WHISPER_SPEECH
    },
    {
        ["paid"] = true,
        ["level"] = 18,
        ["emote"] = v7.TALIYAH_HEART_HANDS
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["emote"] = v7.SPIRIT_CRITTER_PLEASE
    },
    {
        ["paid"] = true,
        ["level"] = 46,
        ["emote"] = v7.VOID_KNIGHT_SWORD
    },
    {
        ["paid"] = true,
        ["level"] = 26,
        ["emote"] = v7.SPIRIT_CATCHER_STARE
    },
    {
        ["paid"] = true,
        ["level"] = 24,
        ["emote"] = v7.SPIRIT_CRITTER_STARE
    },
    {
        ["paid"] = true,
        ["level"] = 22,
        ["emote"] = v7.KALIYAH_PUNCH
    },
    {
        ["paid"] = false,
        ["level"] = 27,
        ["emote"] = v7.IGNIS_BRIDGE_SUMMON
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["emote"] = v7.EVELYNN_I_FEEL_AMAZING
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["emote"] = v7.METAL_DETECTOR_LETS_GO_LOOTING
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["emote"] = v7.FISHERMAN_ABSOLUTE_CINEMA
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["emote"] = v7.WHISPER_UNAMUSED
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.EVELYNN_SHOCK
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.SPIRIT_GARDENER_SOB
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["emote"] = v7.VOID_SLIME_PAT
    },
    {
        ["paid"] = false,
        ["level"] = 36,
        ["emote"] = v7.TERRA_PING
    },
    {
        ["paid"] = true,
        ["level"] = 2,
        ["emote"] = v7.FARMER_CLETUS_FARM_SPAMMING
    },
    {
        ["paid"] = false,
        ["level"] = 41,
        ["emote"] = v7.SPIRIT_CATCHER_PHONE_SHOCK
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["emote"] = v7.EVELYNN_STRESSED
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["emote"] = v7.KAIDA_DOMAIN_EXPANSION
    },
    {
        ["paid"] = true,
        ["level"] = 16,
        ["emote"] = v7.RABBIT_HAT_TRICK
    },
    {
        ["paid"] = false,
        ["level"] = 21,
        ["emote"] = v7.TAKE_SELFIE
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["emote"] = v7.VOID_MEDITATION
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["emote"] = v7.DUCK_WALK
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["killEffect"] = v8.DYNAMITE
    },
    {
        ["paid"] = true,
        ["level"] = 23,
        ["killEffect"] = v8.TUCK_IN
    },
    {
        ["paid"] = true,
        ["level"] = 33,
        ["killEffect"] = v8.PAPER
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["bedBreakEffect"] = v6.CUBE_SPLIT
    },
    {
        ["paid"] = true,
        ["level"] = 43,
        ["bedBreakEffect"] = v6.BUTTERFLY_SWARM
    },
    {
        ["paid"] = false,
        ["level"] = 30,
        ["bedBreakEffect"] = v6.PET
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["winEffect"] = v11.SPIRIT_BLOSSOM
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.POGO_STICK
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["lobbyGadget"] = v9.BANANARANG
    },
    {
        ["paid"] = false,
        ["level"] = 18,
        ["lobbyGadget"] = v9.KAIDA_CLAW
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["lobbyGadget"] = v9.SHRINK_POTION
    },
    {
        ["paid"] = true,
        ["level"] = 38,
        ["lobbyGadget"] = v9.SPRING_PUNCH
    },
    {
        ["paid"] = false,
        ["level"] = 1,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 3,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 9,
        ["bedCoins"] = 750
    },
    {
        ["paid"] = false,
        ["level"] = 11,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 22,
        ["bedCoins"] = 750
    },
    {
        ["paid"] = false,
        ["level"] = 24,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 29,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 32,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 34,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 39,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 42,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 47,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 49,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 6,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 8,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 12,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 17,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 19,
        ["bedCoins"] = 1500
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 28,
        ["bedCoins"] = 1500
    },
    {
        ["paid"] = true,
        ["level"] = 31,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 37,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 48,
        ["bedCoins"] = 2000
    }
}
v14[v13.season11] = {
    {
        ["paid"] = false,
        ["level"] = 51,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 52,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 53,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 54,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 55,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 53,
        ["emote"] = v7.BLAH_BLAH_ANIMATED
    },
    {
        ["paid"] = true,
        ["level"] = 51,
        ["title"] = v10.POISON_RGB
    },
    {
        ["paid"] = true,
        ["level"] = 55,
        ["kitSkin"] = v4.PRISMATIC_KAIDA
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 7,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 35,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.ROYAL
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["title"] = v10.SPARKLES_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["title"] = v10.ALCHEMIST
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["title"] = v10.RAVEN
    },
    {
        ["paid"] = false,
        ["level"] = 4,
        ["title"] = v10.MAGICAL
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["title"] = v10.TANK
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["title"] = v10.MASK_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.SUMMONER
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["title"] = v10.SORCERER
    },
    {
        ["paid"] = false,
        ["level"] = 38,
        ["title"] = v10.ASSASSIN
    },
    {
        ["paid"] = false,
        ["level"] = 25,
        ["title"] = v10.REBEL
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["title"] = v10.NAH_ID_WIN
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["title"] = v10.RANKED_ONLY
    },
    {
        ["paid"] = false,
        ["level"] = 46,
        ["title"] = v10.UNSTOPPABLE
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.SORCERER_AURA
    },
    {
        ["paid"] = false,
        ["level"] = 2,
        ["emote"] = v7.TRADER_HUH
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.RAVEN_OK
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["emote"] = v7.SUMMONER_DRAGON_BUDDY
    },
    {
        ["paid"] = false,
        ["level"] = 10,
        ["emote"] = v7.AGNI_BOOM
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["emote"] = v7.SORCERER_OOPS
    },
    {
        ["paid"] = true,
        ["level"] = 13,
        ["emote"] = v7.TRAPPER_WARNING
    },
    {
        ["paid"] = false,
        ["level"] = 14,
        ["emote"] = v7.BUILDER_READY
    },
    {
        ["paid"] = false,
        ["level"] = 17,
        ["emote"] = v7.TRADER_DONATE
    },
    {
        ["paid"] = true,
        ["level"] = 18,
        ["emote"] = v7.SORCERY_DUO
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["emote"] = v7.FRIENDSHIP_SLIMES
    },
    {
        ["paid"] = false,
        ["level"] = 19,
        ["emote"] = v7.TRAPPER_POINT
    },
    {
        ["paid"] = true,
        ["level"] = 26,
        ["emote"] = v7.RAVEN_HMM
    },
    {
        ["paid"] = true,
        ["level"] = 24,
        ["emote"] = v7.BAKER_SERIOUSLY
    },
    {
        ["paid"] = true,
        ["level"] = 22,
        ["emote"] = v7.LASSY_HEAL
    },
    {
        ["paid"] = false,
        ["level"] = 27,
        ["emote"] = v7.DRAGON_ROAR
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["emote"] = v7.MARINA_PANIC
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["emote"] = v7.ALCHEMIST_DIZZY
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["emote"] = v7.SMOKE_RED_FLAG
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["emote"] = v7.ELDERTREE_FURY
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.DAVEY_WIN
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.TRAPPER_PROUD
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["emote"] = v7.YOURE_WANTED
    },
    {
        ["paid"] = false,
        ["level"] = 36,
        ["emote"] = v7.NOELLE_BUTTERFLY
    },
    {
        ["paid"] = true,
        ["level"] = 2,
        ["emote"] = v7.REBELLION_LEADER_DODO
    },
    {
        ["paid"] = false,
        ["level"] = 41,
        ["emote"] = v7.SUMMONER_SUMMON
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["emote"] = v7.TERRA_BUFF
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["emote"] = v7.KALIYAH_FIRED_UP
    },
    {
        ["paid"] = false,
        ["level"] = 44,
        ["emote"] = v7.ZEPHYR_YELLING
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["emote"] = v7.SORCERER_LAUGH
    },
    {
        ["paid"] = false,
        ["level"] = 48,
        ["emote"] = v7.MONK_MEDITATION
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["emote"] = v7.SORCERER_RAGE
    },
    {
        ["paid"] = true,
        ["level"] = 16,
        ["emote"] = v7.GRIDDY
    },
    {
        ["paid"] = false,
        ["level"] = 21,
        ["emote"] = v7.GOODNIGHT_DANCE
    },
    {
        ["paid"] = true,
        ["level"] = 36,
        ["emote"] = v7.FUNKY_DANCE
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["emote"] = v7.SWORD_TWIRL
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["killEffect"] = v8.DISMANTLE
    },
    {
        ["paid"] = true,
        ["level"] = 23,
        ["killEffect"] = v8.RAVEN_EXPLOSION
    },
    {
        ["paid"] = true,
        ["level"] = 33,
        ["killEffect"] = v8.ALCHEMY_CIRCLE
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["bedBreakEffect"] = v6.METEOR
    },
    {
        ["paid"] = true,
        ["level"] = 43,
        ["bedBreakEffect"] = v6.CRYSTALLIZE
    },
    {
        ["paid"] = false,
        ["level"] = 30,
        ["bedBreakEffect"] = v6.VOID_PORTAL
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["kitSkin"] = v4.SORCERER_ICE_QUEEN
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["winEffect"] = v11.STATUE_OF_TRIUMPH
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.CLOAK
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["lobbyGadget"] = v9.SKY_SCYTHE
    },
    {
        ["paid"] = false,
        ["level"] = 18,
        ["lobbyGadget"] = v9.BEACHBALL
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["lobbyGadget"] = v9.INVISIBILITY_POTION
    },
    {
        ["paid"] = true,
        ["level"] = 38,
        ["lobbyGadget"] = v9.HOT_AIR_BALLOON
    },
    {
        ["paid"] = true,
        ["level"] = 46,
        ["lobbyGadget"] = v9.LASSO
    },
    {
        ["paid"] = false,
        ["level"] = 1,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 3,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 9,
        ["bedCoins"] = 750
    },
    {
        ["paid"] = false,
        ["level"] = 11,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 22,
        ["bedCoins"] = 750
    },
    {
        ["paid"] = false,
        ["level"] = 24,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 29,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 32,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 34,
        ["bedCoins"] = 500
    },
    {
        ["paid"] = false,
        ["level"] = 39,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 42,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 47,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = false,
        ["level"] = 49,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 6,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 8,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 12,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 17,
        ["bedCoins"] = 1000
    },
    {
        ["paid"] = true,
        ["level"] = 19,
        ["bedCoins"] = 1500
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 28,
        ["bedCoins"] = 1500
    },
    {
        ["paid"] = true,
        ["level"] = 31,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 37,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["bedCoins"] = 2000
    },
    {
        ["paid"] = true,
        ["level"] = 48,
        ["bedCoins"] = 2000
    }
}
v14[v13.season10] = {
    {
        ["paid"] = false,
        ["level"] = 51,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 52,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 54,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 55,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 51,
        ["emote"] = v7.FARMER_CLETUS_WATER_GUN
    },
    {
        ["paid"] = false,
        ["level"] = 53,
        ["emote"] = v7.AGNI_WARMING
    },
    {
        ["paid"] = true,
        ["level"] = 53,
        ["title"] = v10.FLOW
    },
    {
        ["paid"] = true,
        ["level"] = 55,
        ["bedBreakEffect"] = v6.LIGHTNING_STRIKE
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 35,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kitSkin"] = v4.FISH_TANK_TINKER
    },
    {
        ["paid"] = false,
        ["level"] = 10,
        ["kit"] = v5.AGNI
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["kit"] = v5.STYX
    },
    {
        ["paid"] = false,
        ["level"] = 30,
        ["kit"] = v5.NYOKA
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["kit"] = v5.FALCONER
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.TINKER
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.GODLY
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["title"] = v10.HALO_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["title"] = v10.BLESSED
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["title"] = v10.LIL_BRO
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["title"] = v10.ON_FIRE
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["title"] = v10.MARKED
    },
    {
        ["paid"] = true,
        ["level"] = 22,
        ["title"] = v10.ORACLE
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.MECHANIC
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["title"] = v10.TOILET
    },
    {
        ["paid"] = false,
        ["level"] = 36,
        ["title"] = v10.PYROMANIAC
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["title"] = v10.FIRE_EMOJI
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["title"] = v10.ANGEL
    },
    {
        ["paid"] = false,
        ["level"] = 46,
        ["title"] = v10.IMMORTAL
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.AGNI_ANGRY
    },
    {
        ["paid"] = false,
        ["level"] = 2,
        ["emote"] = v7.NYX_ANGY
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.SANDWICH_FARMER
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["emote"] = v7.VOID_TERRA_THUMBS_UP
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["emote"] = v7.TRINITY_TOILET
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.EVELYNN_ADORE
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["emote"] = v7.NOELLE_WELL_DONE
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["emote"] = v7.MILO_GOD
    },
    {
        ["paid"] = false,
        ["level"] = 17,
        ["emote"] = v7.FREIYA_NYAN_CAT
    },
    {
        ["paid"] = true,
        ["level"] = 18,
        ["emote"] = v7.CAT_GUN
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["emote"] = v7.NYX_BOBA
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["emote"] = v7.CLETUS_AEUGH
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["emote"] = v7.AERY_SOB
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["emote"] = v7.YUZI_COPIUM
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["emote"] = v7.TRINITY_THUMBS_UP
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["emote"] = v7.BAKER_SAD
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["emote"] = v7.STYX_SAD
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.MILO_BUG_SPRAY
    },
    {
        ["paid"] = true,
        ["level"] = 37,
        ["emote"] = v7.ELEKTRA_POWER_UP
    },
    {
        ["paid"] = false,
        ["level"] = 48,
        ["emote"] = v7.TRINITY_PUNCH
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["emote"] = v7.BARB_MENACING
    },
    {
        ["paid"] = false,
        ["level"] = 41,
        ["emote"] = v7.GOMPY_CAUGHT_IN_4K
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["emote"] = v7.STYX_RELAX
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["emote"] = v7.TINKER_AMAZING
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["emote"] = v7.SILLY_LEGS_DANCE
    },
    {
        ["paid"] = false,
        ["level"] = 24,
        ["emote"] = v7.PUSH_UP_GLASSSES
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["emote"] = v7.DROPPED_THIS_CROWN
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["killEffect"] = v8.BLASTING_OFF
    },
    {
        ["paid"] = false,
        ["level"] = 19,
        ["killEffect"] = v8.TOILET
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["killEffect"] = v8.BLESSED_HEAVEN
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.ARES_SPEAR
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["lobbyGadget"] = v9.MENDING_CANOPY_STAFF_TIER_3
    },
    {
        ["paid"] = false,
        ["level"] = 38,
        ["lobbyGadget"] = v9.DIAMOND_CHAKRAM
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["lobbyGadget"] = v9.FALCONER_BOW
    },
    {
        ["paid"] = true,
        ["level"] = 43,
        ["lobbyGadget"] = v9.NOCTURNE
    }
}
v14[v13.season9] = {
    {
        ["paid"] = false,
        ["level"] = 51,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 52,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 53,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 54,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 55,
        ["crate"] = v12.DIAMOND_LUCKY_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 51,
        ["emote"] = v7.YAMINI_CAT_LOAF
    },
    {
        ["paid"] = true,
        ["level"] = 53,
        ["title"] = v10.LIT_RGB
    },
    {
        ["paid"] = true,
        ["level"] = 55,
        ["kitSkin"] = v4.BLOCK_KICKER_VOID
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 35,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["kit"] = v5.NINJA
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["kit"] = v5.CAT
    },
    {
        ["paid"] = false,
        ["level"] = 30,
        ["kit"] = v5.STEAM_ENGINEER
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["kit"] = v5.SLIME_TAMER
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.BLOCK_KICKER
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.MARTIAL_EMOJI
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["title"] = v10.GENIUS
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["title"] = v10.CHEF
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["title"] = v10.LIT
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["title"] = v10.SLIME_TAMER
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["title"] = v10.MARTIAL_ARTIST
    },
    {
        ["paid"] = true,
        ["level"] = 22,
        ["title"] = v10.INVENTOR
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.TINKERER
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["title"] = v10.ZOOM
    },
    {
        ["paid"] = false,
        ["level"] = 36,
        ["title"] = v10.STEALTHY
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["title"] = v10.RAWR
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["title"] = v10.BOOP
    },
    {
        ["paid"] = false,
        ["level"] = 46,
        ["title"] = v10.CAT_EMOJI
    },
    {
        ["paid"] = true,
        ["level"] = 48,
        ["title"] = v10.CRIMSON
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.DODO_PLUMP
    },
    {
        ["paid"] = false,
        ["level"] = 2,
        ["emote"] = v7.UMBRA_VILLAIN
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.CAT_FRIEND
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["emote"] = v7.FREIYA_SALAD_MEME
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["emote"] = v7.YUZI_BEE_SWARM
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.ROBO_SPARKLE
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["emote"] = v7.TALIYAH_SPARKLE
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["emote"] = v7.CAT_DEAL
    },
    {
        ["paid"] = false,
        ["level"] = 17,
        ["emote"] = v7.STAR_COLLECTOR_DAZED
    },
    {
        ["paid"] = true,
        ["level"] = 18,
        ["emote"] = v7.MARCO_INSPECT
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["emote"] = v7.LYLA_POPCORN
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["emote"] = v7.SMOKE_PEACE_OUT
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["emote"] = v7.NOELLE_SLIMES
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["emote"] = v7.MILO_CRAZY
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["emote"] = v7.KICKER_ANGRY
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["emote"] = v7.MILO_SNACK
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["emote"] = v7.MELODY_SURPRISED
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.CAT_CUTE
    },
    {
        ["paid"] = true,
        ["level"] = 37,
        ["emote"] = v7.METAL_DETECTOR_EGG
    },
    {
        ["paid"] = false,
        ["level"] = 38,
        ["emote"] = v7.MILO_SLEEP
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["emote"] = v7.CAT_AUTUMN
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["emote"] = v7.GOMPY_SCARY
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["emote"] = v7.FREIYA_SUS
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["emote"] = v7.HEAL_SLIME_SAD
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["emote"] = v7.ROBO_WORK
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["emote"] = v7.CAMERA
    },
    {
        ["paid"] = false,
        ["level"] = 24,
        ["emote"] = v7.POPCORN
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["emote"] = v7.STURDY
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.HEADHUNTER
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["lobbyGadget"] = v9.HUNTERS_ECHO
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["lobbyGadget"] = v9.CAN_OF_BEANS
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["lobbyGadget"] = v9.FLYING_BROOM
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["killEffect"] = v8.GIANT_GLOVE
    },
    {
        ["paid"] = false,
        ["level"] = 19,
        ["killEffect"] = v8.BROOM
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["killEffect"] = v8.PORTAL
    }
}
v14[v13.season8] = {
    {
        ["paid"] = false,
        ["level"] = 51,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 52,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 53,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 54,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 55,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 51,
        ["emote"] = v7.BEE_KEEPER_PEACE
    },
    {
        ["paid"] = true,
        ["level"] = 55,
        ["title"] = v10.SUPER
    },
    {
        ["paid"] = true,
        ["level"] = 53,
        ["emote"] = v7.DIAMOND_GUARDIAN
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["kit"] = v5.IGNIS
    },
    {
        ["paid"] = false,
        ["level"] = 35,
        ["kit"] = v5.CARD
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.ELEKTRA
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.ELECTRIFY
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["title"] = v10.WHO_LET_EM_COOK
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["title"] = v10.SUMMER_STRIKER
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["title"] = v10.RADIANT
    },
    {
        ["paid"] = true,
        ["level"] = 22,
        ["title"] = v10.SUNSHINE
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["title"] = v10.WAVE_RIDER
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.JESTER
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["title"] = v10.CLOWN_EMOJI
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["title"] = v10.BLAZING
    },
    {
        ["paid"] = true,
        ["level"] = 48,
        ["title"] = v10.VOLT_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 36,
        ["title"] = v10.NERD_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["title"] = v10.VIRTUOSO
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["title"] = v10.GIGACHAD
    },
    {
        ["paid"] = true,
        ["level"] = 37,
        ["title"] = v10.LET_EM_COOK
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["title"] = v10.SURF_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 46,
        ["title"] = v10.CARRY
    },
    {
        ["paid"] = false,
        ["level"] = 2,
        ["emote"] = v7.AMY_HELLO
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.AERY_HMPH
    },
    {
        ["paid"] = false,
        ["level"] = 17,
        ["emote"] = v7.BLACKHOLE
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["emote"] = v7.BEE_KEEPER_STARE
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.CLETUS_NERD
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["emote"] = v7.CAUGHT_YOU
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["emote"] = v7.CAITLYN_ROCK
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["emote"] = v7.CLETUS_PLUSHIE
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["emote"] = v7.GHOST_CELEBRATE
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["emote"] = v7.CRYPT_SKULL
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["emote"] = v7.MELODY_NOTED
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.KILLER_AMY
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.HANNAH_ANGRY
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["emote"] = v7.SHEILA_SING
    },
    {
        ["paid"] = false,
        ["level"] = 38,
        ["emote"] = v7.STELLA_BORED
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["emote"] = v7.STELLA_IDOL
    },
    {
        ["paid"] = true,
        ["level"] = 18,
        ["emote"] = v7.MEAN_GIRLS
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["emote"] = v7.STELLA_OMG
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["emote"] = v7.TABLET_KIDS
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["emote"] = v7.WASNT_ME
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["emote"] = v7.ZEPHYR_STRESSED
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["emote"] = v7.ZEPHYR_WHAT
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["emote"] = v7.CARD
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["emote"] = v7.PYRO_CELEBRATE
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["emote"] = v7.LUXURY_CHAIR
    },
    {
        ["paid"] = false,
        ["level"] = 30,
        ["emote"] = v7.FACE_PALM
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["emote"] = v7.KAZOTSKY_KICK
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.MYTHIC_GREAT_HAMMER
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["lobbyGadget"] = v9.IMPULSE_GUN
    },
    {
        ["paid"] = false,
        ["level"] = 24,
        ["lobbyGadget"] = v9.LEATHER_HELMET
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["lobbyGadget"] = v9.RAINBOW_STAFF
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["killEffect"] = v8.STARS
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["killEffect"] = v8.BUBBLES
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["killEffect"] = v8.BOXING_GLOVE
    }
}
v14[v13.season7] = {
    {
        ["paid"] = true,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["crate"] = v12.LEVEL_UP_CRATE
    },
    {
        ["paid"] = false,
        ["level"] = 10,
        ["kit"] = v5.DRILL
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["kit"] = v5.QUEEN_BEE
    },
    {
        ["paid"] = false,
        ["level"] = 35,
        ["kit"] = v5.HATTER
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.BLOOD_ASSASSIN
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.TITAN
    },
    {
        ["paid"] = false,
        ["level"] = 9,
        ["title"] = v10.GOOD_FORTUNE
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["title"] = v10.POTATO
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["title"] = v10.ROBOT
    },
    {
        ["paid"] = true,
        ["level"] = 24,
        ["title"] = v10.ROBOT_EMOJI
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["title"] = v10.SNEAKY
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.GEN_CAMPER
    },
    {
        ["paid"] = false,
        ["level"] = 39,
        ["title"] = v10.INFECTED
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["title"] = v10.SHARP_SHOOTER
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["title"] = v10.UNDEFEATED
    },
    {
        ["paid"] = false,
        ["level"] = 34,
        ["title"] = v10.GLOOP
    },
    {
        ["paid"] = true,
        ["level"] = 12,
        ["title"] = v10.HATS_OFF
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["title"] = v10.ON_THE_GRIND
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["title"] = v10.SPEED_DEMON
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["title"] = v10.SLAY
    },
    {
        ["paid"] = false,
        ["level"] = 22,
        ["title"] = v10.BIG_EGO
    },
    {
        ["paid"] = true,
        ["level"] = 19,
        ["title"] = v10.WHAT_FACE
    },
    {
        ["paid"] = false,
        ["level"] = 46,
        ["title"] = v10.BLOCK_FACE
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["emote"] = v7.AFK_TEAMMATE
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.BARB_ANGRY
    },
    {
        ["paid"] = false,
        ["level"] = 17,
        ["emote"] = v7.BARB_PIN
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["emote"] = v7.BATHING_IN_MONEY
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.BING_CHILLING
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["emote"] = v7.BONGO_CAT_FREIYA
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["emote"] = v7.BOUNTY_HUNTER_HUNT
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["emote"] = v7.BUILDER_IDEA
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["emote"] = v7.BURNING_THE_BED
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["emote"] = v7.MIC_UP
    },
    {
        ["paid"] = true,
        ["level"] = 36,
        ["emote"] = v7.GET_TRAPPED
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["emote"] = v7.VULCAN_GET_REAL
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.HATTER_GG
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.HATTER_HEART
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["emote"] = v7.HATTER_SHY
    },
    {
        ["paid"] = false,
        ["level"] = 38,
        ["emote"] = v7.JADE_BONKING
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["emote"] = v7.JADE_SAD
    },
    {
        ["paid"] = true,
        ["level"] = 18,
        ["emote"] = v7.KALIYAH_ANGRY
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["emote"] = v7.LANI_IDK
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["emote"] = v7.LANI_POINT
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["emote"] = v7.LASSY_SIDE_EYE
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["emote"] = v7.LUCIA_WHATS_POPPIN
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["emote"] = v7.LUMEN_REVERSE_CARD
    },
    {
        ["paid"] = false,
        ["level"] = 48,
        ["emote"] = v7.MARCO_DIAMOND_SWORD
    },
    {
        ["paid"] = false,
        ["level"] = 2,
        ["emote"] = v7.SHEEP_HERDER_LOVE
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["emote"] = v7.SHEILA_COZY
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["emote"] = v7.SPIRIT_COUPLE
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["emote"] = v7.SURPRISE_ATTACK
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["emote"] = v7.TNT
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["emote"] = v7.VANESSA_DESERVE
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["emote"] = v7.WHAT_DID_I_SEE
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["emote"] = v7.ASSASSIN
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["emote"] = v7.DISCO
    },
    {
        ["paid"] = false,
        ["level"] = 30,
        ["emote"] = v7.CHEERS_BOTTLE
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["emote"] = v7.SLOW_CLAP
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.LASER_SWORD
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["lobbyGadget"] = v9.VOID_AXE
    },
    {
        ["paid"] = false,
        ["level"] = 25,
        ["lobbyGadget"] = v9.GLITCH_GUITAR
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["lobbyGadget"] = v9.TENNIS_RACKET
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["killEffect"] = v8.ATOMIC
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["killEffect"] = v8.RAVE
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["killEffect"] = v8.SWORD
    }
}
v14[v13.season6] = {
    {
        ["paid"] = false,
        ["level"] = 15,
        ["kit"] = v5.PALADIN
    },
    {
        ["paid"] = false,
        ["level"] = 25,
        ["kit"] = v5.MAGE
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["kit"] = v5.VOID_DRAGON
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["kit"] = v5.JAILOR
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.DRAGON_SLAYER
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["killEffect"] = v8.KNIFE_RAIN
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["killEffect"] = v8.BUTTERFLY
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["killEffect"] = v8.MIRROR
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["lobbyGadget"] = v9.TOY_HAMMER
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.TWIRL_BLADE
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["lobbyGadget"] = v9.GRENADE_LAUNCHER
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["lobbyGadget"] = v9.ROCKET_BELT
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.KNIGHTS_BOW
    },
    {
        ["paid"] = true,
        ["level"] = 48,
        ["emote"] = v7.ZEN_HOVER
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["emote"] = v7.BOOK_READ
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["emote"] = v7.ALCHEMIST_SAD
    },
    {
        ["paid"] = false,
        ["level"] = 14,
        ["emote"] = v7.AMY_SILENT
    },
    {
        ["paid"] = true,
        ["level"] = 26,
        ["emote"] = v7.AMY_EASTER_NO_IRON
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["emote"] = v7.BAKER_PROFIT
    },
    {
        ["paid"] = false,
        ["level"] = 11,
        ["emote"] = v7.BEE_KEEPER_THANKS
    },
    {
        ["paid"] = true,
        ["level"] = 19,
        ["emote"] = v7.BUILDER_LEAVE_DOOR
    },
    {
        ["paid"] = false,
        ["level"] = 39,
        ["emote"] = v7.BUILDER_SHEESH
    },
    {
        ["paid"] = false,
        ["level"] = 21,
        ["emote"] = v7.COBALT_CHARGED
    },
    {
        ["paid"] = false,
        ["level"] = 17,
        ["emote"] = v7.CROCOWOLF_YOU_CANT_RUN
    },
    {
        ["paid"] = true,
        ["level"] = 28,
        ["emote"] = v7.FARMER_CRY
    },
    {
        ["paid"] = true,
        ["level"] = 13,
        ["emote"] = v7.DOM_IM_DONE
    },
    {
        ["paid"] = false,
        ["level"] = 2,
        ["emote"] = v7.FARMER_NOT_BAD
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["emote"] = v7.MAGE_ELEMENTAL
    },
    {
        ["paid"] = false,
        ["level"] = 29,
        ["emote"] = v7.FIRE_DRAGON_SIP
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["emote"] = v7.FIRE_DRAGON_WHAT
    },
    {
        ["paid"] = true,
        ["level"] = 38,
        ["emote"] = v7.FIRE_DRAGON_WIN_STREAK
    },
    {
        ["paid"] = false,
        ["level"] = 32,
        ["emote"] = v7.FISHERMAN_GOLD
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["emote"] = v7.FREIYA_POP_CAT
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.GHOST_CATCHER_IN_LOVE
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["emote"] = v7.LUCIA_PATHETIC
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["emote"] = v7.MARCO_VILLAGER
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.MELODY_FACE_PALM
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["emote"] = v7.MELODY_PEACE_OUT
    },
    {
        ["paid"] = true,
        ["level"] = 22,
        ["emote"] = v7.METAL_DETECTOR_BORING
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["emote"] = v7.PENGUIN_SLEEP
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["emote"] = v7.PINANTA_PARTY_TIME
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["emote"] = v7.STELLA_HEART
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["emote"] = v7.VOID_DRAGON_ANGRY
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.VOID_DRAGON_ART
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["emote"] = v7.YUZI_ANGRY
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["emote"] = v7.ZEPHYR_SMUG
    },
    {
        ["paid"] = false,
        ["level"] = 18,
        ["title"] = v10.MAGE
    },
    {
        ["paid"] = false,
        ["level"] = 3,
        ["title"] = v10.KNIGHT
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.DRAGON
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["title"] = v10.PALADIN
    },
    {
        ["paid"] = true,
        ["level"] = 43,
        ["title"] = v10.DRAGON_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 36,
        ["title"] = v10.SHAPE_SHIFTER
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["title"] = v10.QUEEN
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["title"] = v10.KING
    },
    {
        ["paid"] = true,
        ["level"] = 24,
        ["title"] = v10.CROWN_EMOJI
    },
    {
        ["paid"] = true,
        ["level"] = 48,
        ["title"] = v10.RULER
    },
    {
        ["paid"] = false,
        ["level"] = 41,
        ["title"] = v10.FANCY
    },
    {
        ["paid"] = false,
        ["level"] = 46,
        ["title"] = v10.CLEAN
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["title"] = v10.MID
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["title"] = v10.SCARED
    },
    {
        ["paid"] = true,
        ["level"] = 33,
        ["title"] = v10.BAIT
    },
    {
        ["paid"] = false,
        ["level"] = 27,
        ["title"] = v10.GENERATOR
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["title"] = v10.NOOB
    },
    {
        ["paid"] = true,
        ["level"] = 16,
        ["title"] = v10.CASUAL
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["title"] = v10.COMPETITIVE
    }
}
v14[v13.season5] = {
    {
        ["paid"] = false,
        ["level"] = 10,
        ["kit"] = v5.MERCHANT
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["kit"] = v5.BATTERY
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["kit"] = v5.STAR_COLLECTOR
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.WIND_WALKER
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["kit"] = v5.DINO_TAMER
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["kit"] = v5.PINATA
    },
    {
        ["paid"] = false,
        ["level"] = 29,
        ["killEffect"] = v8.BEACH_BALL
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["killEffect"] = v8.GLITCH
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["killEffect"] = v8.LIFE_RING
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["lobbyGadget"] = v9.GRAPPLING_HOOK
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.VOID_SWORD
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["lobbyGadget"] = v9.SCYTHE
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.BEACH_VACATION
    },
    {
        ["paid"] = false,
        ["level"] = 25,
        ["emote"] = v7.WIGGLE
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["emote"] = v7.ROCK_PAPER_SCISSORS
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.VULCAN_OVERHEAT
    },
    {
        ["paid"] = false,
        ["level"] = 2,
        ["emote"] = v7.SMOKE_WAVE
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.DINO_HAI
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["emote"] = v7.JADE_IM_THE_BEST
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["emote"] = v7.RAVEN_RIP
    },
    {
        ["paid"] = true,
        ["level"] = 8,
        ["emote"] = v7.FREIYA_HEARTS
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.TESLA_DANGER
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["emote"] = v7.CYBER_DAB
    },
    {
        ["paid"] = true,
        ["level"] = 16,
        ["emote"] = v7.CLETUS_TROLL
    },
    {
        ["paid"] = false,
        ["level"] = 18,
        ["emote"] = v7.BAKER_PROTECTION
    },
    {
        ["paid"] = true,
        ["level"] = 19,
        ["emote"] = v7.BAKER_PIECE_OF_CAKE
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["emote"] = v7.DINO_RAWR
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["emote"] = v7.SPIRIT_DUO_EZ
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["emote"] = v7.MELODY_YOU_ROCK
    },
    {
        ["paid"] = true,
        ["level"] = 24,
        ["emote"] = v7.METAL_DETECTOR
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["emote"] = v7.BARB_U_SHALL_NOT_PASS
    },
    {
        ["paid"] = true,
        ["level"] = 28,
        ["emote"] = v7.CYBER_MAD
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["emote"] = v7.LV50_DUO_WOMBO_COMBO
    },
    {
        ["paid"] = true,
        ["level"] = 31,
        ["emote"] = v7.STAR_COLLECTOR_FUN
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["emote"] = v7.REAPER_GOT_EM
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["emote"] = v7.TIGER_WELL_PLAYED
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["emote"] = v7.RAINING_GEMS
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["emote"] = v7.BUILDER_HELP_PLS
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["emote"] = v7.OH_MY_STARS
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["emote"] = v7.CYBER_DEFENSE
    },
    {
        ["paid"] = true,
        ["level"] = 46,
        ["emote"] = v7.LUMEN_PAIN
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["emote"] = v7.DINO_YIPEEE
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["title"] = v10.SUMMER
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["title"] = v10.DINOSAUR
    },
    {
        ["paid"] = false,
        ["level"] = 9,
        ["title"] = v10.DEAL_OR_NO_DEAL
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["title"] = v10.SPECIALIST
    },
    {
        ["paid"] = true,
        ["level"] = 13,
        ["title"] = v10.BEACH_EMOJI
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["title"] = v10.HARD_STUCK
    },
    {
        ["paid"] = true,
        ["level"] = 17,
        ["title"] = v10.SUMMER_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 22,
        ["title"] = v10.BEACH_DAY
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["title"] = v10.BAITED
    },
    {
        ["paid"] = false,
        ["level"] = 34,
        ["title"] = v10.VOID
    },
    {
        ["paid"] = true,
        ["level"] = 36,
        ["title"] = v10.CHAD
    },
    {
        ["paid"] = true,
        ["level"] = 38,
        ["title"] = v10.STAR
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["title"] = v10.SHARK
    },
    {
        ["paid"] = false,
        ["level"] = 42,
        ["title"] = v10.HARD_CARRY
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["title"] = v10.TRADE_OFFER
    },
    {
        ["paid"] = false,
        ["level"] = 48,
        ["title"] = v10.SUNGLASSES
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.ZEPHYR
    }
}
v14[v13.season4] = {
    {
        ["paid"] = false,
        ["level"] = 10,
        ["kit"] = v5.ALCHEMIST
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["kit"] = v5.BEAST
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["kit"] = v5.CONQUEROR
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.MIDNIGHT
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["kit"] = v5.SHEEP_HERDER
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["kit"] = v5.METAL_DETECTOR
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["kitSkin"] = v4.FREIYA_TIGER_BRAWLER
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["kitSkin"] = v4.BAKER_SPIRIT
    },
    {
        ["paid"] = false,
        ["level"] = 29,
        ["killEffect"] = v8.BIRD
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["killEffect"] = v8.ROCKET
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["killEffect"] = v8.BLACKHOLE
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["lobbyGadget"] = v9.JADE_HAMMER
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.FREIYA_ICE_SWORD
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["lobbyGadget"] = v9.RAVEN
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.ROCK_OUT
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["emote"] = v7.PARTY_UP
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["emote"] = v7.SIDE_TO_SIDE
    },
    {
        ["paid"] = false,
        ["level"] = 25,
        ["emote"] = v7.BOUNTY_MAD
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.YUZI_HYPE
    },
    {
        ["paid"] = false,
        ["level"] = 1,
        ["emote"] = v7.WARRIOR_UPDATE_DAY
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.ACADEMY_AERY_GL
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.ACADEMY_AERY_READ
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["emote"] = v7.NICE
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["emote"] = v7.SLAY
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["emote"] = v7.AERY_PRO
    },
    {
        ["paid"] = false,
        ["level"] = 2,
        ["emote"] = v7.AERY_WINSTREAK
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["emote"] = v7.AMY_NO
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["emote"] = v7.ARCHER_THUMBS_DOWN
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["emote"] = v7.BARBARIAN_ENRAGED
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["emote"] = v7.BARBARIAN_WAVE
    },
    {
        ["paid"] = true,
        ["level"] = 6,
        ["emote"] = v7.BUILDER_SPEECHLESS
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["emote"] = v7.CLAN_INVITE
    },
    {
        ["paid"] = true,
        ["level"] = 8,
        ["emote"] = v7.DE_VANESSA_SPEECHLESS
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.DONT_RUSH_ME_PLS
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["emote"] = v7.DUCK_CELEBRATION
    },
    {
        ["paid"] = true,
        ["level"] = 19,
        ["emote"] = v7.ELDER_TREE_INJURED
    },
    {
        ["paid"] = true,
        ["level"] = 18,
        ["emote"] = v7.FARMER_ANGRY
    },
    {
        ["paid"] = true,
        ["level"] = 24,
        ["emote"] = v7.FREIYA_SURPRISED
    },
    {
        ["paid"] = false,
        ["level"] = 23,
        ["emote"] = v7.GRIM_REAPER_GG
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["emote"] = v7.GRIM_REAPER_STICKER
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["emote"] = v7.JADE_GG
    },
    {
        ["paid"] = true,
        ["level"] = 28,
        ["emote"] = v7.JADE_HEART
    },
    {
        ["paid"] = true,
        ["level"] = 31,
        ["emote"] = v7.LASSY_CELEBRATION
    },
    {
        ["paid"] = true,
        ["level"] = 22,
        ["emote"] = v7.LASSY_GRAB
    },
    {
        ["paid"] = true,
        ["level"] = 16,
        ["emote"] = v7.MINER_UWU
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.MINER_LAUGH
    },
    {
        ["paid"] = false,
        ["level"] = 48,
        ["emote"] = v7.SPACE_MINER_RAGE
    },
    {
        ["paid"] = true,
        ["level"] = 37,
        ["emote"] = v7.SPIRIT_CATACHER_LOL
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["emote"] = v7.SPIRIT_TEAMWORK
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["emote"] = v7.TO_BATTLE
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["emote"] = v7.VULCAN_LOADING
    },
    {
        ["paid"] = false,
        ["level"] = 47,
        ["title"] = v10.CRACKED
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["title"] = v10.DUCK
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["title"] = v10.SKYWARS_MAIN
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.RABBIT
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["title"] = v10.RABBIT_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 34,
        ["title"] = v10.HAPPY_EASTER
    },
    {
        ["paid"] = false,
        ["level"] = 9,
        ["title"] = v10.BLOSSOM
    },
    {
        ["paid"] = true,
        ["level"] = 2,
        ["title"] = v10.FLOWERS_EMOJI
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["title"] = v10.BORK
    },
    {
        ["paid"] = true,
        ["level"] = 38,
        ["title"] = v10.ARROW_MAGNET
    },
    {
        ["paid"] = false,
        ["level"] = 21,
        ["title"] = v10.SPIRIT_SPAMMER
    },
    {
        ["paid"] = true,
        ["level"] = 23,
        ["title"] = v10.EMOTIONAL_DAMAGE
    },
    {
        ["paid"] = true,
        ["level"] = 33,
        ["title"] = v10.JUGGERNAUT
    },
    {
        ["paid"] = true,
        ["level"] = 17,
        ["title"] = v10.ENCHANTER
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["title"] = v10.MIDNIGHT
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["title"] = v10.SHEEP_EMOJI
    },
    {
        ["paid"] = true,
        ["level"] = 36,
        ["title"] = v10.POTTER
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["title"] = v10.BEAST
    },
    {
        ["paid"] = true,
        ["level"] = 46,
        ["title"] = v10.EMPEROR
    },
    {
        ["paid"] = false,
        ["level"] = 41,
        ["title"] = v10.BLOCK_CLUTCHER
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["title"] = v10.COMBO_MASTER
    }
}
v14[v13.season3] = {
    {
        ["paid"] = true,
        ["level"] = 25,
        ["kit"] = v5.SMOKE
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["kit"] = v5.FROSTY
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["kit"] = v5.SANTA
    },
    {
        ["paid"] = false,
        ["level"] = 30,
        ["kit"] = v5.YETI
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.AERY
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["kit"] = v5.GINGERBREAD_MAN
    },
    {
        ["paid"] = false,
        ["level"] = 25,
        ["killEffect"] = v8.BLIMP
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["killEffect"] = v8.JELLY
    },
    {
        ["paid"] = true,
        ["level"] = 33,
        ["killEffect"] = v8.GIFT
    },
    {
        ["paid"] = false,
        ["level"] = 43,
        ["killEffect"] = v8.SNOWMAN
    },
    {
        ["paid"] = true,
        ["level"] = 1,
        ["lobbyGadget"] = v9.SPEED_BOOTS
    },
    {
        ["paid"] = false,
        ["level"] = 35,
        ["lobbyGadget"] = v9.JUMP_BOOTS
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["lobbyGadget"] = v9.SNOW_BALL
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["lobbyGadget"] = v9.RAGEBLADE
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["emote"] = v7.ANGRY_BUILDER
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["emote"] = v7.ARCHER
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["emote"] = v7.ARSON
    },
    {
        ["paid"] = false,
        ["level"] = 9,
        ["emote"] = v7.AXOLOTL_SLEEPING
    },
    {
        ["paid"] = true,
        ["level"] = 46,
        ["emote"] = v7.AXOLOTLS
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["emote"] = v7.BAKER_THUMBS_UP
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["emote"] = v7.BALLOONS
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["emote"] = v7.BEE
    },
    {
        ["paid"] = true,
        ["level"] = 8,
        ["emote"] = v7.STOCKING
    },
    {
        ["paid"] = false,
        ["level"] = 1,
        ["emote"] = v7.CHRISTMAS_ROCKET
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.DUO
    },
    {
        ["paid"] = true,
        ["level"] = 17,
        ["emote"] = v7.EMERALD_ARMOR
    },
    {
        ["paid"] = true,
        ["level"] = 24,
        ["emote"] = v7.FREIYA
    },
    {
        ["paid"] = false,
        ["level"] = 19,
        ["emote"] = v7.FREIYA_2
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["emote"] = v7.FREIYA_SNOWMAN
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["emote"] = v7.HEART
    },
    {
        ["paid"] = true,
        ["level"] = 2,
        ["emote"] = v7.LUCKY_GIFT
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["emote"] = v7.PYRO_COAL
    },
    {
        ["paid"] = true,
        ["level"] = 36,
        ["emote"] = v7.RAVEN_SKETCH
    },
    {
        ["paid"] = true,
        ["level"] = 22,
        ["emote"] = v7.REAPER_GIFT
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["emote"] = v7.SAD_GOMPY
    },
    {
        ["paid"] = true,
        ["level"] = 48,
        ["emote"] = v7.SELFIE
    },
    {
        ["paid"] = true,
        ["level"] = 18,
        ["emote"] = v7.BOO
    },
    {
        ["paid"] = true,
        ["level"] = 42,
        ["emote"] = v7.TEAMWORK
    },
    {
        ["paid"] = true,
        ["level"] = 26,
        ["emote"] = v7.WINSTREAK
    },
    {
        ["paid"] = true,
        ["level"] = 38,
        ["emote"] = v7.WORM_FARMER
    },
    {
        ["paid"] = true,
        ["level"] = 28,
        ["emote"] = v7.FREIYA_3
    },
    {
        ["paid"] = true,
        ["level"] = 44,
        ["emote"] = v7.ELDERTREE_GG
    },
    {
        ["paid"] = false,
        ["level"] = 7,
        ["emote"] = v7.CHRISTMAS_DODO
    },
    {
        ["paid"] = false,
        ["level"] = 32,
        ["emote"] = v7.CHRISTMAS_TREE
    },
    {
        ["paid"] = false,
        ["level"] = 49,
        ["title"] = v10.SWAG
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["title"] = v10.CHRISTMAS_TREE
    },
    {
        ["paid"] = true,
        ["level"] = 23,
        ["title"] = v10.SANTA_CLAUS
    },
    {
        ["paid"] = true,
        ["level"] = 16,
        ["title"] = v10.SNOWMAN
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["title"] = v10.THUMBSUP
    },
    {
        ["paid"] = false,
        ["level"] = 47,
        ["title"] = v10.RAD
    },
    {
        ["paid"] = false,
        ["level"] = 22,
        ["title"] = v10.AYOO
    },
    {
        ["paid"] = false,
        ["level"] = 36,
        ["title"] = v10.BING_BONG
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["title"] = v10.FROSTY
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["title"] = v10.SNOWFLAKE
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["title"] = v10.COLD
    },
    {
        ["paid"] = false,
        ["level"] = 27,
        ["title"] = v10.BIGBRAIN
    },
    {
        ["paid"] = false,
        ["level"] = 42,
        ["title"] = v10.CLUTCHGOD
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["title"] = v10.BOWMASTER
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.MICCHECK
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["title"] = v10.LUCKY
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["title"] = v10.COZY
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["title"] = v10.DERP
    },
    {
        ["paid"] = false,
        ["level"] = 39,
        ["title"] = v10.BEAR
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["title"] = v10.SWORD
    },
    {
        ["paid"] = false,
        ["level"] = 4,
        ["title"] = v10.QUIRKY
    },
    {
        ["paid"] = false,
        ["level"] = 21,
        ["title"] = v10.JACK_FROST
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["title"] = v10.ICE_QUEEN
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["title"] = v10.MERRY_CHRISTMAS
    }
}
v14[v13.season2] = {
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.SPOOKY
    },
    {
        ["paid"] = false,
        ["level"] = 1,
        ["title"] = v10.BOO
    },
    {
        ["paid"] = true,
        ["level"] = 2,
        ["title"] = v10.TEAM_PLAYER
    },
    {
        ["paid"] = true,
        ["level"] = 3,
        ["kit"] = v5.TRAPPER
    },
    {
        ["paid"] = false,
        ["level"] = 4,
        ["emote"] = v7.SURRENDER
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["title"] = v10.UMM
    },
    {
        ["paid"] = false,
        ["level"] = 6,
        ["emote"] = v7.READY_UP
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["emote"] = v7.VULCAN_ERROR
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["title"] = v10.OBSIDIAN_OP
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["emote"] = v7.BEE_CUTE
    },
    {
        ["paid"] = false,
        ["level"] = 10,
        ["emote"] = v7.WAITING_ON_IRON
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.REAPER_SMILE
    },
    {
        ["paid"] = false,
        ["level"] = 12,
        ["title"] = v10.ZOMBIE
    },
    {
        ["paid"] = true,
        ["level"] = 13,
        ["emote"] = v7.ZOMBIE_BARBARIAN
    },
    {
        ["paid"] = false,
        ["level"] = 14,
        ["title"] = v10.GAMER
    },
    {
        ["paid"] = true,
        ["level"] = 15,
        ["emote"] = v7.RAVEN_KNIFE
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["emote"] = v7.BABY_DODO
    },
    {
        ["paid"] = true,
        ["level"] = 17,
        ["title"] = v10.CAT_FACE_2
    },
    {
        ["paid"] = false,
        ["level"] = 18,
        ["title"] = v10.SURFER
    },
    {
        ["paid"] = true,
        ["level"] = 19,
        ["emote"] = v7.HAPPY_GOMPY
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["kit"] = v5.GHOST_CATCHER
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["emote"] = v7.NO_BULLY
    },
    {
        ["paid"] = false,
        ["level"] = 22,
        ["title"] = v10.RIP
    },
    {
        ["paid"] = true,
        ["level"] = 23,
        ["title"] = v10.CRANK_90
    },
    {
        ["paid"] = false,
        ["level"] = 24,
        ["emote"] = v7.JADE_VAMPIRE
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["kit"] = v5.FISHERMAN
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["title"] = v10.SUPER_STAR
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["emote"] = v7.CONTROLLING_REAPER
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.YOU_FR
    },
    {
        ["paid"] = false,
        ["level"] = 27,
        ["title"] = v10.OKAY
    },
    {
        ["paid"] = true,
        ["level"] = 28,
        ["title"] = v10.RICH
    },
    {
        ["paid"] = false,
        ["level"] = 29,
        ["title"] = v10.HAUNTED
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["emote"] = v7.RAVEN_FLOWER
    },
    {
        ["paid"] = false,
        ["level"] = 31,
        ["emote"] = v7.FISHERMAN
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["title"] = v10.WOOF
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["emote"] = v7.BED_KING
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["title"] = v10.SHRUG
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["title"] = v10.EBOY
    },
    {
        ["paid"] = true,
        ["level"] = 36,
        ["emote"] = v7.VULCAN_GRAVE
    },
    {
        ["paid"] = false,
        ["level"] = 37,
        ["title"] = v10.DODO
    },
    {
        ["paid"] = true,
        ["level"] = 38,
        ["title"] = v10.EGIRL
    },
    {
        ["paid"] = false,
        ["level"] = 39,
        ["title"] = v10.TRICK_OR_TREAT
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["kit"] = v5.OIL_MAN
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["emote"] = v7.BEEKEEPER_EMERALD
    },
    {
        ["paid"] = false,
        ["level"] = 42,
        ["emote"] = v7.BOUNTY_HUNTER
    },
    {
        ["paid"] = true,
        ["level"] = 43,
        ["emote"] = v7.HEADLESS_CLETUS
    },
    {
        ["paid"] = false,
        ["level"] = 44,
        ["emote"] = v7.ZOMBIE_MELODY
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["emote"] = v7.BED_BREAKER
    },
    {
        ["paid"] = false,
        ["level"] = 46,
        ["title"] = v10.XD
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["title"] = v10.GHOST
    },
    {
        ["paid"] = false,
        ["level"] = 48,
        ["title"] = v10.GGANBU
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["title"] = v10.UWU
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.SPEARMAN
    }
}
v14[v13.season1] = {
    {
        ["paid"] = true,
        ["level"] = 1,
        ["emote"] = v7.CLETUS_CARROT
    },
    {
        ["paid"] = false,
        ["level"] = 1,
        ["title"] = v10.UPDATE_HYPE
    },
    {
        ["paid"] = true,
        ["level"] = 2,
        ["title"] = v10.BOT
    },
    {
        ["paid"] = false,
        ["level"] = 3,
        ["emote"] = v7.BUILDER_HAMMER
    },
    {
        ["paid"] = true,
        ["level"] = 4,
        ["emote"] = v7.MELODY_TUNES
    },
    {
        ["paid"] = false,
        ["level"] = 4,
        ["title"] = v10.AGGRO
    },
    {
        ["paid"] = false,
        ["level"] = 5,
        ["title"] = v10.ISLANDS_MAIN
    },
    {
        ["paid"] = true,
        ["level"] = 5,
        ["killEffect"] = v8.EXPLODE
    },
    {
        ["paid"] = true,
        ["level"] = 6,
        ["title"] = v10.INVITE_ME
    },
    {
        ["paid"] = true,
        ["level"] = 7,
        ["emote"] = v7.PIRATE_BALLOONS
    },
    {
        ["paid"] = false,
        ["level"] = 7,
        ["title"] = v10.GOD_BRIDGER
    },
    {
        ["paid"] = true,
        ["level"] = 8,
        ["title"] = v10.FARMER
    },
    {
        ["paid"] = false,
        ["level"] = 8,
        ["title"] = v10.SNIPER
    },
    {
        ["paid"] = true,
        ["level"] = 9,
        ["emote"] = v7.LASSY_EMERALDS
    },
    {
        ["paid"] = true,
        ["level"] = 10,
        ["kit"] = v5.WARRIOR
    },
    {
        ["paid"] = false,
        ["level"] = 10,
        ["title"] = v10.ONE_V_ONE_ME
    },
    {
        ["paid"] = true,
        ["level"] = 11,
        ["emote"] = v7.CHUNKY_ELDER_TREE
    },
    {
        ["paid"] = true,
        ["level"] = 12,
        ["title"] = v10.SMILE
    },
    {
        ["paid"] = false,
        ["level"] = 13,
        ["emote"] = v7.ARCHER_CHEERS
    },
    {
        ["paid"] = true,
        ["level"] = 14,
        ["emote"] = v7.BUILDER_SPARKLE
    },
    {
        ["paid"] = false,
        ["level"] = 15,
        ["killEffect"] = v8.HEART
    },
    {
        ["paid"] = false,
        ["level"] = 16,
        ["kit"] = v5.BOUNTY_HUNTER
    },
    {
        ["paid"] = true,
        ["level"] = 16,
        ["emote"] = v7.GRIM_REAPER_LANTERN
    },
    {
        ["paid"] = false,
        ["level"] = 17,
        ["title"] = v10.WINNABLE
    },
    {
        ["paid"] = false,
        ["level"] = 18,
        ["emote"] = v7.ELDER_TREE
    },
    {
        ["paid"] = true,
        ["level"] = 19,
        ["title"] = v10.EMERALD_HOARDER
    },
    {
        ["paid"] = true,
        ["level"] = 20,
        ["kit"] = v5.BEEKEEPER
    },
    {
        ["paid"] = false,
        ["level"] = 20,
        ["emote"] = v7.EMERALD_CHEST
    },
    {
        ["paid"] = true,
        ["level"] = 21,
        ["title"] = v10.CAMPER
    },
    {
        ["paid"] = false,
        ["level"] = 22,
        ["emote"] = v7.LASSY_CAPTURE
    },
    {
        ["paid"] = true,
        ["level"] = 23,
        ["emote"] = v7.VULCAN_HEART
    },
    {
        ["paid"] = true,
        ["level"] = 24,
        ["emote"] = v7.MELODY_DIAMOND
    },
    {
        ["paid"] = true,
        ["level"] = 25,
        ["killEffect"] = v8.STATUE
    },
    {
        ["paid"] = false,
        ["level"] = 25,
        ["title"] = v10.EXTREME
    },
    {
        ["paid"] = false,
        ["level"] = 26,
        ["emote"] = v7.SHIELDER_CLAP
    },
    {
        ["paid"] = true,
        ["level"] = 27,
        ["title"] = v10.BOW_SPAMMER
    },
    {
        ["paid"] = true,
        ["level"] = 28,
        ["emote"] = v7.VULCAN_GG
    },
    {
        ["paid"] = false,
        ["level"] = 28,
        ["title"] = v10.DEFENDER
    },
    {
        ["paid"] = true,
        ["level"] = 29,
        ["title"] = v10.RUSHER
    },
    {
        ["paid"] = false,
        ["level"] = 30,
        ["kit"] = v5.JADE
    },
    {
        ["paid"] = true,
        ["level"] = 30,
        ["title"] = v10.SWEATY
    },
    {
        ["paid"] = true,
        ["level"] = 31,
        ["title"] = v10.ANTI_BOW_SPAMMER
    },
    {
        ["paid"] = true,
        ["level"] = 32,
        ["emote"] = v7.BANANA_BARBARIAN
    },
    {
        ["paid"] = false,
        ["level"] = 32,
        ["title"] = v10.LATE_GAME
    },
    {
        ["paid"] = false,
        ["level"] = 33,
        ["title"] = v10.MLG
    },
    {
        ["paid"] = true,
        ["level"] = 34,
        ["title"] = v10.TELEPEARLER
    },
    {
        ["paid"] = true,
        ["level"] = 35,
        ["killEffect"] = v8.CONFETTI
    },
    {
        ["paid"] = false,
        ["level"] = 36,
        ["title"] = v10.LFG
    },
    {
        ["paid"] = true,
        ["level"] = 37,
        ["title"] = v10.EXPLOSIVES_EXPERT
    },
    {
        ["paid"] = true,
        ["level"] = 38,
        ["emote"] = v7.CUTE_GRIM_REAPER
    },
    {
        ["paid"] = false,
        ["level"] = 38,
        ["title"] = v10.LONE_WOLF
    },
    {
        ["paid"] = true,
        ["level"] = 39,
        ["title"] = v10.SUS
    },
    {
        ["paid"] = false,
        ["level"] = 40,
        ["emote"] = v7.VULCAN_LETS_GO
    },
    {
        ["paid"] = true,
        ["level"] = 40,
        ["kit"] = v5.RAVEN
    },
    {
        ["paid"] = true,
        ["level"] = 41,
        ["emote"] = v7.WINSTREAK_PLUS_ONE
    },
    {
        ["paid"] = false,
        ["level"] = 42,
        ["title"] = v10.SUPER_CPS
    },
    {
        ["paid"] = true,
        ["level"] = 43,
        ["emote"] = v7.CRY_ABOUT_IT
    },
    {
        ["paid"] = false,
        ["level"] = 44,
        ["title"] = v10.DEDICATED
    },
    {
        ["paid"] = true,
        ["level"] = 45,
        ["killEffect"] = v8.ASCEND
    },
    {
        ["paid"] = false,
        ["level"] = 45,
        ["kit"] = v5.SPIRIT_CATCHER
    },
    {
        ["paid"] = true,
        ["level"] = 46,
        ["title"] = v10.BUILT_DIFFERENT
    },
    {
        ["paid"] = true,
        ["level"] = 47,
        ["title"] = v10.CAT_FACE
    },
    {
        ["paid"] = false,
        ["level"] = 47,
        ["title"] = v10.OUTPLAYED
    },
    {
        ["paid"] = true,
        ["level"] = 48,
        ["emote"] = v7.WIZARD_READING_YOU
    },
    {
        ["paid"] = false,
        ["level"] = 48,
        ["title"] = v10.EXTREME
    },
    {
        ["paid"] = true,
        ["level"] = 49,
        ["title"] = v10.ONE_V_THIRTY
    },
    {
        ["paid"] = true,
        ["level"] = 50,
        ["kit"] = v5.PYRO
    },
    {
        ["paid"] = false,
        ["level"] = 50,
        ["title"] = v10.SPICY
    }
}
return {
    ["BattlePassRewards"] = v14
}