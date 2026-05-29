local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta").CrateMeta
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata")
local v26 = v25.EventCurrencyType
local v27 = v25.EventShopItemTier
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem
local v29 = {
    [v28.BED_COIN_100] = {
        ["name"] = "Bed Coins (100)",
        ["price"] = 1000,
        ["maxPurchasesPerEvent"] = 20,
        ["image"] = v10.BED_COIN_ICON,
        ["items"] = {
            {
                ["bedCoins"] = 100
            }
        }
    },
    [v28.BED_COIN_1000] = {
        ["name"] = "Bed Coins (1000)",
        ["price"] = 100,
        ["maxPurchasesPerEvent"] = 5,
        ["image"] = v10.BED_COIN_ICON,
        ["currency"] = v26.SKULLS,
        ["items"] = {
            {
                ["bedCoins"] = 1000
            }
        }
    }
}
local v30 = v28.DIAMOND_LUCKY_CRATE
local v31 = {
    ["price"] = 8000,
    ["maxPurchasesPerEvent"] = 2,
    ["name"] = v23[v24.DIAMOND_LUCKY_CRATE].displayName,
    ["image"] = v23[v24.DIAMOND_LUCKY_CRATE].image,
    ["items"] = {
        {
            ["crate"] = v24.DIAMOND_LUCKY_CRATE
        }
    }
}
v29[v30] = v31
local v32 = v28.LUCKY_CRATE
local v33 = {
    ["price"] = 4000,
    ["maxPurchasesPerEvent"] = 2,
    ["name"] = v23[v24.LEVEL_UP_CRATE].displayName,
    ["image"] = v23[v24.LEVEL_UP_CRATE].image,
    ["items"] = {
        {
            ["crate"] = v24.LEVEL_UP_CRATE
        }
    }
}
v29[v32] = v33
local v34 = v28.KIT_RENTAL_NORMAL_3
local v35 = {
    ["price"] = 4000,
    ["maxPurchasesPerEvent"] = 2,
    ["name"] = v4(v5.KIT_RENTAL_NORMAL).displayName,
    ["image"] = v4(v5.KIT_RENTAL_NORMAL).image
}
local v36 = {}
local v37 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_NORMAL
    }
}
__set_list(v36, 1, {v37})
v35.items = v36
v29[v34] = v35
local v38 = v28.KIT_RENTAL_FIGHTER_7
local v39 = {
    ["price"] = 3000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.KIT_RENTAL_FIGHTER_7).displayName,
    ["image"] = v4(v5.KIT_RENTAL_FIGHTER_7).image
}
local v40 = {}
local v41 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_FIGHTER_7
    }
}
__set_list(v40, 1, {v41})
v39.items = v40
v29[v38] = v39
local v42 = v28.KIT_RENTAL_SUPPORT_7
local v43 = {
    ["price"] = 3000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.KIT_RENTAL_SUPPORT_7).displayName,
    ["image"] = v4(v5.KIT_RENTAL_SUPPORT_7).image
}
local v44 = {}
local v45 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_SUPPORT_7
    }
}
__set_list(v44, 1, {v45})
v43.items = v44
v29[v42] = v43
local v46 = v28.KIT_RENTAL_TANK_7
local v47 = {
    ["price"] = 3000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.KIT_RENTAL_TANK_7).displayName,
    ["image"] = v4(v5.KIT_RENTAL_TANK_7).image
}
local v48 = {}
local v49 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_TANK_7
    }
}
__set_list(v48, 1, {v49})
v47.items = v48
v29[v46] = v47
local v50 = v28.KIT_RENTAL_DEFENDER_7
local v51 = {
    ["price"] = 3000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.KIT_RENTAL_DEFENDER_7).displayName,
    ["image"] = v4(v5.KIT_RENTAL_DEFENDER_7).image
}
local v52 = {}
local v53 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_DEFENDER_7
    }
}
__set_list(v52, 1, {v53})
v51.items = v52
v29[v50] = v51
local v54 = v28.KIT_RENTAL_MOVEMENT_7
local v55 = {
    ["price"] = 3000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.KIT_RENTAL_MOVEMENT_7).displayName,
    ["image"] = v4(v5.KIT_RENTAL_MOVEMENT_7).image
}
local v56 = {}
local v57 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_MOVEMENT_7
    }
}
__set_list(v56, 1, {v57})
v55.items = v56
v29[v54] = v55
local v58 = v28.KIT_RENTAL_ECONOMY_7
local v59 = {
    ["price"] = 3000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.KIT_RENTAL_ECONOMY_7).displayName,
    ["image"] = v4(v5.KIT_RENTAL_ECONOMY_7).image
}
local v60 = {}
local v61 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_ECONOMY_7
    }
}
__set_list(v60, 1, {v61})
v59.items = v60
v29[v58] = v59
local v62 = v28.KIT_RENTAL_DESTROYER_7
local v63 = {
    ["price"] = 3000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.KIT_RENTAL_DESTROYER_7).displayName,
    ["image"] = v4(v5.KIT_RENTAL_DESTROYER_7).image
}
local v64 = {}
local v65 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_DESTROYER_7
    }
}
__set_list(v64, 1, {v65})
v63.items = v64
v29[v62] = v63
local v66 = v28.KIT_RENTAL_RANGED_7
local v67 = {
    ["price"] = 3000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.KIT_RENTAL_RANGED_7).displayName,
    ["image"] = v4(v5.KIT_RENTAL_RANGED_7).image
}
local v68 = {}
local v69 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_RANGED_7
    }
}
__set_list(v68, 1, {v69})
v67.items = v68
v29[v66] = v67
local v70 = v28.KIT_RENTAL_LIMITED_7
local v71 = {
    ["price"] = 6000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.KIT_RENTAL_BATTLEPASS_7).displayName,
    ["image"] = v4(v5.KIT_RENTAL_BATTLEPASS_7).image
}
local v72 = {}
local v73 = {
    ["consumable"] = {
        ["consumableType"] = v5.KIT_RENTAL_BATTLEPASS_7
    }
}
__set_list(v72, 1, {v73})
v71.items = v72
v29[v70] = v71
local v74 = v28.BATTLE_PASS_2X
local v75 = {
    ["price"] = 2000,
    ["maxPurchasesPerEvent"] = 2,
    ["name"] = v4(v5.BATTLE_PASS_2X).displayName,
    ["image"] = v4(v5.BATTLE_PASS_2X).image
}
local v76 = {}
local v77 = {
    ["consumable"] = {
        ["consumableType"] = v5.BATTLE_PASS_2X
    }
}
__set_list(v76, 1, {v77})
v75.items = v76
v29[v74] = v75
local v78 = v28.BATTLE_PASS_3X
local v79 = {
    ["price"] = 4000,
    ["maxPurchasesPerEvent"] = 1,
    ["name"] = v4(v5.BATTLE_PASS_3X).displayName,
    ["image"] = v4(v5.BATTLE_PASS_3X).image
}
local v80 = {}
local v81 = {
    ["consumable"] = {
        ["consumableType"] = v5.BATTLE_PASS_3X
    }
}
__set_list(v80, 1, {v81})
v79.items = v80
v29[v78] = v79
local v82 = v28.AUTO_COMPLETE_DAILY_MISSION_TICKET
local v83 = {
    ["price"] = 3000,
    ["maxPurchasesPerEvent"] = 3,
    ["name"] = v4(v5.AUTO_COMPLETE_DAILY_MISSION_TICKET).displayName,
    ["image"] = v4(v5.AUTO_COMPLETE_DAILY_MISSION_TICKET).image
}
local v84 = {}
local v85 = {
    ["consumable"] = {
        ["consumableType"] = v5.AUTO_COMPLETE_DAILY_MISSION_TICKET
    }
}
__set_list(v84, 1, {v85})
v83.items = v84
v29[v82] = v83
local v86 = v28.AUTO_COMPLETE_WEEKLY_MISSION_TICKET
local v87 = {
    ["price"] = 4000,
    ["maxPurchasesPerEvent"] = 2,
    ["name"] = v4(v5.AUTO_COMPLETE_WEEKLY_MISSION_TICKET).displayName,
    ["image"] = v4(v5.AUTO_COMPLETE_WEEKLY_MISSION_TICKET).image
}
local v88 = {}
local v89 = {
    ["consumable"] = {
        ["consumableType"] = v5.AUTO_COMPLETE_WEEKLY_MISSION_TICKET
    }
}
__set_list(v88, 1, {v89})
v87.items = v88
v29[v86] = v87
local v90 = v28.PIRATE_TITLE_1
local v91 = {
    ["price"] = 1000,
    ["name"] = v21[v22.ARRGH].text .. " Title",
    ["textImage"] = v21[v22.ARRGH].text,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["title"] = v22.ARRGH
        }
    }
}
v29[v90] = v91
local v92 = v28.PIRATE_TITLE_2
local v93 = {
    ["price"] = 2000,
    ["name"] = v21[v22.PIRATE].text .. " Title",
    ["textImage"] = v21[v22.PIRATE].text,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["title"] = v22.PIRATE
        }
    }
}
v29[v92] = v93
local v94 = v28.PIRATE_TITLE_3
local v95 = {
    ["price"] = 7000,
    ["name"] = v21[v22.CAPTAIN].text .. " Title",
    ["textImage"] = v21[v22.CAPTAIN].text,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["title"] = v22.CAPTAIN
        }
    }
}
v29[v94] = v95
local v96 = v28.PIRATE_TITLE_4
local v97 = {
    ["price"] = 5000,
    ["name"] = v21[v22.QUARTERMASTER].text .. " Title",
    ["textImage"] = v21[v22.QUARTERMASTER].text,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["title"] = v22.QUARTERMASTER
        }
    }
}
v29[v96] = v97
local v98 = v28.PIRATE_TITLE_5
local v99 = {
    ["price"] = 5000,
    ["name"] = v21[v22.FIRST_MATE].text .. " Title",
    ["textImage"] = v21[v22.FIRST_MATE].text,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["title"] = v22.FIRST_MATE
        }
    }
}
v29[v98] = v99
local v100 = v28.PIRATE_TITLE_6
local v101 = {
    ["price"] = 2500,
    ["name"] = v21[v22.SAILOR].text .. " Title",
    ["textImage"] = v21[v22.SAILOR].text,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["title"] = v22.SAILOR
        }
    }
}
v29[v100] = v101
local v102 = v28.PIRATE_ATTACK_KILL_EFFECT
local v103 = {
    ["name"] = "Pirate Attack Kill Effect",
    ["price"] = 10000,
    ["image"] = v17[v18.PIRATE_SHIP_ATTACK].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["killEffect"] = v18.PIRATE_SHIP_ATTACK
        }
    }
}
v29[v102] = v103
local v104 = v28.PIRATE_GHOST_KILL_EFFECT
local v105 = {
    ["name"] = "Pirate Ghost Kill Effect",
    ["price"] = 13337,
    ["image"] = v17[v18.GHOST].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["killEffect"] = v18.GHOST
        }
    }
}
v29[v104] = v105
local v106 = v28.PIRATE_EMOTE_1
local v107 = {
    ["price"] = 2000,
    ["name"] = v15[v16.HANNAH_GHOST_MOMENT].name .. " Emote",
    ["image"] = v15[v16.HANNAH_GHOST_MOMENT].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.HANNAH_GHOST_MOMENT
        }
    }
}
v29[v106] = v107
local v108 = v28.PIRATE_EMOTE_2
local v109 = {
    ["price"] = 2000,
    ["name"] = v15[v16.HANNAH_SORRY_NOT].name .. " Emote",
    ["image"] = v15[v16.HANNAH_SORRY_NOT].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.HANNAH_SORRY_NOT
        }
    }
}
v29[v108] = v109
local v110 = v28.PIRATE_EMOTE_3
local v111 = {
    ["price"] = 2000,
    ["name"] = v15[v16.SMOKE_AGAIN].name .. " Emote",
    ["image"] = v15[v16.SMOKE_AGAIN].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.SMOKE_AGAIN
        }
    }
}
v29[v110] = v111
local v112 = v28.PIRATE_EMOTE_4
local v113 = {
    ["price"] = 2000,
    ["name"] = v15[v16.ZEPHYR_BEGONE].name .. " Emote",
    ["image"] = v15[v16.ZEPHYR_BEGONE].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.ZEPHYR_BEGONE
        }
    }
}
v29[v112] = v113
local v114 = v28.PIRATE_EMOTE_5
local v115 = {
    ["price"] = 2000,
    ["name"] = v15[v16.ZEPHYR_GOING_FAST].name .. " Emote",
    ["image"] = v15[v16.ZEPHYR_GOING_FAST].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.ZEPHYR_GOING_FAST
        }
    }
}
v29[v114] = v115
local v116 = v28.PIRATE_EMOTE_6
local v117 = {
    ["price"] = 4000,
    ["name"] = v15[v16.HANNAH_FIRED_UP].name .. " Emote",
    ["image"] = v15[v16.HANNAH_FIRED_UP].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.HANNAH_FIRED_UP
        }
    }
}
v29[v116] = v117
local v118 = v28.PIRATE_EMOTE_7
local v119 = {
    ["price"] = 2000,
    ["name"] = v15[v16.HANNAH_FEAR].name .. " Emote",
    ["image"] = v15[v16.HANNAH_FEAR].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.HANNAH_FEAR
        }
    }
}
v29[v118] = v119
local v120 = v28.PIRATE_EMOTE_8
local v121 = {
    ["price"] = 4000,
    ["name"] = v15[v16.SMOKE_DUDE].name .. " Emote",
    ["image"] = v15[v16.SMOKE_DUDE].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.SMOKE_DUDE
        }
    }
}
v29[v120] = v121
local v122 = v28.PIRATE_EMOTE_9
local v123 = {
    ["price"] = 4000,
    ["name"] = v15[v16.GHOST_DAVEY].name .. " Emote",
    ["image"] = v15[v16.GHOST_DAVEY].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.GHOST_DAVEY
        }
    }
}
v29[v122] = v123
local v124 = v28.PIRATE_ANIMATED_EMOTE_1
local v125 = {
    ["price"] = 5000,
    ["name"] = v15[v16.SEARCHING_FAR_AWAY].name .. " Emote",
    ["animation"] = v3[v15[v16.SEARCHING_FAR_AWAY].animation.type],
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.SEARCHING_FAR_AWAY
        }
    }
}
v29[v124] = v125
local v126 = v28.PIRATE_ANIMATED_EMOTE_2
local v127 = {
    ["price"] = 5000,
    ["name"] = v15[v16.PIRATES_GOODBYE].name .. " Emote",
    ["animation"] = v3[v15[v16.PIRATES_GOODBYE].animation.type],
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.PIRATES_GOODBYE
        }
    }
}
v29[v126] = v127
local v128 = v28.PIRATE_ANIMATED_EMOTE_3
local v129 = {
    ["price"] = 10000,
    ["name"] = v15[v16.COIN_TOSS].name .. " Emote",
    ["animation"] = v3[v15[v16.COIN_TOSS].animation.type],
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["emote"] = v16.COIN_TOSS
        }
    }
}
v29[v128] = v129
local v130 = v28.PIRATE_DAVEY_GHOST_SKIN
local v131 = {
    ["price"] = 10000,
    ["name"] = v7[v6.DAVEY_GHOST].name .. " Kit Skin",
    ["image"] = v7[v6.DAVEY_GHOST].renderImage,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["kitSkin"] = v6.DAVEY_GHOST
        }
    }
}
v29[v130] = v131
local v132 = v28.PIRATE_LOBBY_GADGET_1
local v133 = {
    ["price"] = 7000,
    ["name"] = v19[v20.BLUNDERBUSS].name .. " Lobby Gadget",
    ["image"] = v19[v20.BLUNDERBUSS].image,
    ["currency"] = v26.DOUBLOONS,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.BLUNDERBUSS
        }
    }
}
v29[v132] = v133
local v134 = v28.HALLOWEEN_TITLE_1
local v135 = {
    ["price"] = 4000,
    ["name"] = v21[v22.NECROMANCER].text .. " Title",
    ["textImage"] = v21[v22.NECROMANCER].text,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["title"] = v22.NECROMANCER
        }
    }
}
v29[v134] = v135
local v136 = v28.HALLOWEEN_TITLE_2
local v137 = {
    ["price"] = 10000,
    ["name"] = v21[v22.PHANTOM].text .. " Title",
    ["textImage"] = v21[v22.PHANTOM].text,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["title"] = v22.PHANTOM
        }
    }
}
v29[v136] = v137
local v138 = v28.HALLOWEEN_TITLE_3
local v139 = {
    ["price"] = 7500,
    ["name"] = v21[v22.BLOODY].text .. " Title",
    ["textImage"] = v21[v22.BLOODY].text,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["title"] = v22.BLOODY
        }
    }
}
v29[v138] = v139
local v140 = v28.HALLOWEEN_TITLE_4
local v141 = {
    ["price"] = 2500,
    ["name"] = v21[v22.MUMMY].text .. " Title",
    ["textImage"] = v21[v22.MUMMY].text,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["title"] = v22.MUMMY
        }
    }
}
v29[v140] = v141
local v142 = v28.HALLOWEEN_TITLE_5
local v143 = {
    ["price"] = 2500,
    ["name"] = v21[v22.SKELETON].text .. " Title",
    ["textImage"] = v21[v22.SKELETON].text,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["title"] = v22.SKELETON
        }
    }
}
v29[v142] = v143
local v144 = v28.HALLOWEEN_EMOTE
local v145 = {
    ["price"] = 5000,
    ["name"] = v15[v16.SKELETON_PARTY].name .. " Emote",
    ["image"] = v15[v16.SKELETON_PARTY].image,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["emote"] = v16.SKELETON_PARTY
        }
    }
}
v29[v144] = v145
local v146 = v28.HALLOWEEN_EMOTE_2
local v147 = {
    ["price"] = 2000,
    ["name"] = v15[v16.TRICK_OR_TREAT].name .. " Emote",
    ["image"] = v15[v16.TRICK_OR_TREAT].image,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["emote"] = v16.TRICK_OR_TREAT
        }
    }
}
v29[v146] = v147
local v148 = v28.HALLOWEEN_EMOTE_3
local v149 = {
    ["price"] = 4000,
    ["name"] = v15[v16.GRIM_THRILLER].name .. " Emote",
    ["image"] = v15[v16.GRIM_THRILLER].image,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["emote"] = v16.GRIM_THRILLER
        }
    }
}
v29[v148] = v149
local v150 = v28.HALLOWEEN_EMOTE_4
local v151 = {
    ["price"] = 2000,
    ["name"] = v15[v16.NO_CANDY].name .. " Emote",
    ["image"] = v15[v16.NO_CANDY].image,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["emote"] = v16.NO_CANDY
        }
    }
}
v29[v150] = v151
local v152 = v28.HALLOWEEN_LOBBY_GADGET
local v153 = {
    ["price"] = 10000,
    ["name"] = v19[v20.NECROMANCER_STAFF].name .. " Lobby Gadget",
    ["image"] = v19[v20.NECROMANCER_STAFF].image,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.NECROMANCER_STAFF
        }
    }
}
v29[v152] = v153
local v154 = v28.HALLOWEEN_LASSY_MUMMY_SKIN
local v155 = {
    ["name"] = "Mummy Lassy Kit Skin",
    ["price"] = 15000,
    ["image"] = v7[v6.COWGIRL_MUMMY].renderImage,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["kitSkin"] = v6.COWGIRL_MUMMY
        }
    }
}
v29[v154] = v155
local v156 = v28.HALLOWEEN_VULCAN_CYBER_VAMPIRE_SKIN
local v157 = {
    ["name"] = "Vampire Vulcan Kit Skin",
    ["price"] = 15000,
    ["image"] = v7[v6.VULCAN_VAMPIRE].renderImage,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["kitSkin"] = v6.VULCAN_VAMPIRE
        }
    }
}
v29[v156] = v157
local v158 = v28.HALLOWEEN_GRAVESTONE_KILL_EFFECT
local v159 = {
    ["name"] = "Gravestone Kill Effect",
    ["price"] = 12000,
    ["image"] = v17[v18.GRAVESTONE].image,
    ["currency"] = v26.CANDY,
    ["items"] = {
        {
            ["killEffect"] = v18.GRAVESTONE
        }
    }
}
v29[v158] = v159
local v160 = v28.CHRISTMAS_CRYPT_SKIN
local v161 = {
    ["name"] = "Cryptmas Kit Skin",
    ["price"] = 20000,
    ["image"] = v7[v6.NECROMANCER_CHRISTMAS].renderImage,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["kitSkin"] = v6.NECROMANCER_CHRISTMAS
        }
    }
}
v29[v160] = v161
local v162 = v28.CHRISTMAS_EVELYNN_SKIN
local v163 = {
    ["name"] = "Silent Night Evelynn Kit Skin",
    ["price"] = 20000,
    ["image"] = v7[v6.SILENT_NIGHT_SPIRIT_ASSASSIN].renderImage,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["kitSkin"] = v6.SILENT_NIGHT_SPIRIT_ASSASSIN
        }
    }
}
v29[v162] = v163
local v164 = v28.CHRISTMAS_TITLE_1
local v165 = {
    ["price"] = 10000,
    ["name"] = v21[v22.ICY].text .. " Title",
    ["textImage"] = v21[v22.ICY].text,
    ["currency"] = v26.XMAS_TOKEN_2023,
    ["items"] = {
        {
            ["title"] = v22.ICY
        }
    }
}
v29[v164] = v165
local v166 = v28.CHRISTMAS_TITLE_2
local v167 = {
    ["price"] = 3000,
    ["name"] = v21[v22.JOLLY].text .. " Title",
    ["textImage"] = v21[v22.JOLLY].text,
    ["currency"] = v26.XMAS_TOKEN_2023,
    ["items"] = {
        {
            ["title"] = v22.JOLLY
        }
    }
}
v29[v166] = v167
local v168 = v28.CHRISTMAS_TITLE_3
local v169 = {
    ["price"] = 5000,
    ["name"] = v21[v22.CHILL].text .. " Title",
    ["textImage"] = v21[v22.CHILL].text,
    ["currency"] = v26.XMAS_TOKEN_2023,
    ["items"] = {
        {
            ["title"] = v22.CHILL
        }
    }
}
v29[v168] = v169
local v170 = v28.CHRISTMAS_TITLE_4
local v171 = {
    ["price"] = 3000,
    ["name"] = v21[v22.SNOWFLAKE_EMOJI].text .. " Title",
    ["textImage"] = v21[v22.SNOWFLAKE_EMOJI].text,
    ["currency"] = v26.XMAS_TOKEN_2023,
    ["items"] = {
        {
            ["title"] = v22.SNOWFLAKE_EMOJI
        }
    }
}
v29[v170] = v171
local v172 = v28.CHRISTMAS_EMOTE
local v173 = {
    ["price"] = 5000,
    ["name"] = v15[v16.XMAS_AERY].name .. " Emote",
    ["image"] = v15[v16.XMAS_AERY].image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["emote"] = v16.XMAS_AERY
        }
    }
}
v29[v172] = v173
local v174 = v28.CHRISTMAS_EMOTE_2
local v175 = {
    ["price"] = 5000,
    ["name"] = v15[v16.XMAS_LASSY_CATCH].name .. " Emote",
    ["image"] = v15[v16.XMAS_LASSY_CATCH].image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["emote"] = v16.XMAS_LASSY_CATCH
        }
    }
}
v29[v174] = v175
local v176 = v28.CHRISTMAS_EMOTE_3
local v177 = {
    ["price"] = 5000,
    ["name"] = v15[v16.BARB_XMAS_LIGHTS].name .. " Emote",
    ["image"] = v15[v16.BARB_XMAS_LIGHTS].image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["emote"] = v16.BARB_XMAS_LIGHTS
        }
    }
}
v29[v176] = v177
local v178 = v28.CHRISTMAS_EMOTE_4
local v179 = {
    ["price"] = 3000,
    ["name"] = v15[v16.CHILLY].name .. " Emote",
    ["image"] = v15[v16.CHILLY].image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["emote"] = v16.CHILLY
        }
    }
}
v29[v178] = v179
local v180 = v28.CHRISTMAS_EMOTE_5
local v181 = {
    ["price"] = 3000,
    ["name"] = v15[v16.GINGERBREAD_COZY].name .. " Emote",
    ["image"] = v15[v16.GINGERBREAD_COZY].image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["emote"] = v16.GINGERBREAD_COZY
        }
    }
}
v29[v180] = v181
local v182 = v28.CHRISTMAS_EMOTE_6
local v183 = {
    ["price"] = 3000,
    ["name"] = v15[v16.BAKING_GINGERBREAD].name .. " Emote",
    ["image"] = v15[v16.BAKING_GINGERBREAD].image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["emote"] = v16.BAKING_GINGERBREAD
        }
    }
}
v29[v182] = v183
local v184 = v28.CHRISTMAS_EMOTE_7
local v185 = {
    ["price"] = 5000,
    ["name"] = v15[v16.BRUH].name .. " Emote",
    ["image"] = v15[v16.BRUH].image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["emote"] = v16.BRUH
        }
    }
}
v29[v184] = v185
local v186 = v28.CHRISTMAS_EMOTE_8
local v187 = {
    ["price"] = 5000,
    ["name"] = v15[v16.CHRISTMAS_TREE].name .. " Emote",
    ["image"] = v15[v16.CHRISTMAS_TREE].image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["emote"] = v16.CHRISTMAS_TREE
        }
    }
}
v29[v186] = v187
local v188 = v28.CHRISTMAS_SNOW_KILL_EFFECT
local v189 = {
    ["price"] = 15000,
    ["name"] = v17[v18.SNOWBALL].name .. " Kill Effect",
    ["image"] = v11(v12.SNOWBALL).image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["killEffect"] = v18.SNOWBALL
        }
    }
}
v29[v188] = v189
local v190 = v28.FROSTY_HAMMER_LOBBY_GADGET
local v191 = {
    ["price"] = 15000,
    ["name"] = v19[v20.FROSTY_HAMMER].name .. " Lobby Gadget",
    ["image"] = v11(v12.FROSTY_HAMMER).image,
    ["currency"] = v26.XMAS_TOKEN,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.FROSTY_HAMMER
        }
    }
}
v29[v190] = v191
local v192 = v28.TWO_YEAR_EMOTE_1
local v193 = {
    ["price"] = 2000,
    ["name"] = v15[v16.TWO_YEAR_BAKER].name .. " Emote",
    ["image"] = v15[v16.TWO_YEAR_BAKER].image,
    ["currency"] = v26.TWO_YEAR_COIN,
    ["items"] = {
        {
            ["emote"] = v16.TWO_YEAR_BAKER
        }
    }
}
v29[v192] = v193
local v194 = v28.TWO_YEAR_EMOTE_2
local v195 = {
    ["price"] = 2000,
    ["name"] = v15[v16.TWO_YEAR_LUCIA].name .. " Emote",
    ["image"] = v15[v16.TWO_YEAR_LUCIA].image,
    ["currency"] = v26.TWO_YEAR_COIN,
    ["items"] = {
        {
            ["emote"] = v16.TWO_YEAR_LUCIA
        }
    }
}
v29[v194] = v195
local v196 = v28.TWO_YEAR_EMOTE_3
local v197 = {
    ["price"] = 2000,
    ["name"] = v15[v16.TWO_YEAR_BARB].name .. " Emote",
    ["image"] = v15[v16.TWO_YEAR_BARB].image,
    ["currency"] = v26.TWO_YEAR_COIN,
    ["items"] = {
        {
            ["emote"] = v16.TWO_YEAR_BARB
        }
    }
}
v29[v196] = v197
local v198 = v28.TWO_YEAR_EMOTE_4
local v199 = {
    ["price"] = 2000,
    ["name"] = v15[v16.TWO_YEAR_SPIRIT].name .. " Emote",
    ["image"] = v15[v16.TWO_YEAR_SPIRIT].image,
    ["currency"] = v26.TWO_YEAR_COIN,
    ["items"] = {
        {
            ["emote"] = v16.TWO_YEAR_SPIRIT
        }
    }
}
v29[v198] = v199
local v200 = v28.TWO_YEAR_EMOTE_5
local v201 = {
    ["price"] = 2000,
    ["name"] = v15[v16.TWO_YEAR_BEE].name .. " Emote",
    ["image"] = v15[v16.TWO_YEAR_BEE].image,
    ["currency"] = v26.TWO_YEAR_COIN,
    ["items"] = {
        {
            ["emote"] = v16.TWO_YEAR_BEE
        }
    }
}
v29[v200] = v201
local v202 = v28.TWO_YEAR_TITLE_1
local v203 = {
    ["price"] = 6000
}
local v204 = v21[v22.PARTY].name
v203.name = tostring(v204) .. " Title"
v203.textImage = v21[v22.PARTY].text
v203.currency = v26.TWO_YEAR_COIN
v203.items = {
    {
        ["title"] = v22.PARTY
    }
}
v29[v202] = v203
local v205 = v28.TWO_YEAR_TITLE_2
local v206 = {
    ["price"] = 2000
}
local v207 = v21[v22.BIRTHDAY].name
v206.name = tostring(v207) .. " Title"
v206.textImage = v21[v22.BIRTHDAY].text
v206.currency = v26.TWO_YEAR_COIN
v206.items = {
    {
        ["title"] = v22.BIRTHDAY
    }
}
v29[v205] = v206
local v208 = v28.HW_2023_TITLE_1
local v209 = {
    ["price"] = 5000,
    ["name"] = v21[v22.PUMPKIN].text .. " Title",
    ["textImage"] = v21[v22.PUMPKIN].text,
    ["items"] = {
        {
            ["title"] = v22.PUMPKIN
        }
    }
}
v29[v208] = v209
local v210 = v28.HW_2023_TITLE_2
local v211 = {
    ["price"] = 5000,
    ["name"] = v21[v22.CURSED].text .. " Title",
    ["textImage"] = v21[v22.CURSED].text,
    ["items"] = {
        {
            ["title"] = v22.CURSED
        }
    }
}
v29[v210] = v211
local v212 = v28.HW_2023_TITLE_3
local v213 = {
    ["price"] = 10000,
    ["name"] = v21[v22.SKULL_EMOJI].text .. " Title",
    ["textImage"] = v21[v22.SKULL_EMOJI].text,
    ["items"] = {
        {
            ["title"] = v22.SKULL_EMOJI
        }
    }
}
v29[v212] = v213
local v214 = v28.HW_2023_TITLE_4
local v215 = {
    ["price"] = 4000,
    ["name"] = v21[v22.WITCH].text .. " Title",
    ["textImage"] = v21[v22.WITCH].text,
    ["items"] = {
        {
            ["title"] = v22.WITCH
        }
    }
}
v29[v214] = v215
local v216 = v28.HW_2023_EMOTE_1
local v217 = {
    ["price"] = 4000,
    ["name"] = v15[v16.CORRUPTED_RAGE_BLADE].name .. " Emote",
    ["image"] = v15[v16.CORRUPTED_RAGE_BLADE].image,
    ["items"] = {
        {
            ["emote"] = v16.CORRUPTED_RAGE_BLADE
        }
    }
}
v29[v216] = v217
local v218 = v28.HW_2023_EMOTE_2
local v219 = {
    ["price"] = 2000,
    ["name"] = v15[v16.GOMPY_ROCK].name .. " Emote",
    ["image"] = v15[v16.GOMPY_ROCK].image,
    ["items"] = {
        {
            ["emote"] = v16.GOMPY_ROCK
        }
    }
}
v29[v218] = v219
local v220 = v28.HW_2023_EMOTE_3
local v221 = {
    ["price"] = 4000,
    ["name"] = v15[v16.HW_YUZI_LAUGH].name .. " Emote",
    ["image"] = v15[v16.HW_YUZI_LAUGH].image,
    ["items"] = {
        {
            ["emote"] = v16.HW_YUZI_LAUGH
        }
    }
}
v29[v220] = v221
local v222 = v28.HW_2023_EMOTE_4
local v223 = {
    ["price"] = 4000,
    ["name"] = v15[v16.HW_YUZI_PIN].name .. " Emote",
    ["image"] = v15[v16.HW_YUZI_PIN].image,
    ["items"] = {
        {
            ["emote"] = v16.HW_YUZI_PIN
        }
    }
}
v29[v222] = v223
local v224 = v28.HW_2023_EMOTE_5
local v225 = {
    ["price"] = 2000,
    ["name"] = v15[v16.LUCIA_CANDY].name .. " Emote",
    ["image"] = v15[v16.LUCIA_CANDY].image,
    ["items"] = {
        {
            ["emote"] = v16.LUCIA_CANDY
        }
    }
}
v29[v224] = v225
local v226 = v28.HW_2023_EMOTE_6
local v227 = {
    ["price"] = 2000,
    ["name"] = v15[v16.PUMPKIN_BOMB].name .. " Emote",
    ["image"] = v15[v16.PUMPKIN_BOMB].image,
    ["items"] = {
        {
            ["emote"] = v16.PUMPKIN_BOMB
        }
    }
}
v29[v226] = v227
local v228 = v28.HW_2024_TITLE_1
local v229 = {
    ["price"] = 10000,
    ["name"] = v21[v22.SPIDER_EMOJI].text .. " Title",
    ["textImage"] = v21[v22.SPIDER_EMOJI].text,
    ["items"] = {
        {
            ["title"] = v22.SPIDER_EMOJI
        }
    }
}
v29[v228] = v229
local v230 = v28.HW_2024_TITLE_2
local v231 = {
    ["price"] = 5000,
    ["name"] = v21[v22.MONSTER].text .. " Title",
    ["textImage"] = v21[v22.MONSTER].text,
    ["items"] = {
        {
            ["title"] = v22.MONSTER
        }
    }
}
v29[v230] = v231
local v232 = v28.HW_2024_TITLE_3
local v233 = {
    ["price"] = 5000,
    ["name"] = v21[v22.ARACHNID].text .. " Title",
    ["textImage"] = v21[v22.ARACHNID].text,
    ["items"] = {
        {
            ["title"] = v22.ARACHNID
        }
    }
}
v29[v232] = v233
local v234 = v28.HW_2024_TITLE_4
local v235 = {
    ["price"] = 4000,
    ["name"] = v21[v22.SCARY].text .. " Title",
    ["textImage"] = v21[v22.SCARY].text,
    ["items"] = {
        {
            ["title"] = v22.SCARY
        }
    }
}
v29[v234] = v235
local v236 = v28.HW_2024_TITLE_5
local v237 = {
    ["price"] = 5000,
    ["name"] = v21[v22.SPIDER_SQUASHER].text .. " Title",
    ["textImage"] = v21[v22.SPIDER_SQUASHER].text,
    ["items"] = {
        {
            ["title"] = v22.SPIDER_SQUASHER
        }
    }
}
v29[v236] = v237
local v238 = v28.HW_2024_EMOTE_1
local v239 = {
    ["price"] = 4000,
    ["name"] = v15[v16.WITCH_NOM].name .. " Emote",
    ["image"] = v15[v16.WITCH_NOM].image,
    ["items"] = {
        {
            ["emote"] = v16.WITCH_NOM
        }
    }
}
v29[v238] = v239
local v240 = v28.HW_2024_EMOTE_2
local v241 = {
    ["price"] = 2000,
    ["name"] = v15[v16.WRENS_NIGHTMARE].name .. " Emote",
    ["image"] = v15[v16.WRENS_NIGHTMARE].image,
    ["items"] = {
        {
            ["emote"] = v16.WRENS_NIGHTMARE
        }
    }
}
v29[v240] = v241
local v242 = v28.HW_2024_EMOTE_3
local v243 = {
    ["price"] = 4000,
    ["name"] = v15[v16.WITCHS_WRATH].name .. " Emote",
    ["image"] = v15[v16.WITCHS_WRATH].image,
    ["items"] = {
        {
            ["emote"] = v16.WITCHS_WRATH
        }
    }
}
v29[v242] = v243
local v244 = v28.HW_2024_EMOTE_4
local v245 = {
    ["price"] = 2000,
    ["name"] = v15[v16.WREN_LAUGH].name .. " Emote",
    ["image"] = v15[v16.WREN_LAUGH].image,
    ["items"] = {
        {
            ["emote"] = v16.WREN_LAUGH
        }
    }
}
v29[v244] = v245
local v246 = v28.HW_2024_EMOTE_5
local v247 = {
    ["price"] = 4000,
    ["name"] = v15[v16.MUMMY].name .. " Emote",
    ["image"] = v15[v16.MUMMY].image,
    ["items"] = {
        {
            ["emote"] = v16.MUMMY
        }
    }
}
v29[v246] = v247
local v248 = v28.HW_2024_EMOTE_6
local v249 = {
    ["price"] = 2000,
    ["name"] = v15[v16.CANDY_PLEASE].name .. " Emote",
    ["image"] = v15[v16.CANDY_PLEASE].image,
    ["items"] = {
        {
            ["emote"] = v16.CANDY_PLEASE
        }
    }
}
v29[v248] = v249
local v250 = v28.HW_2024_EMOTE_7
local v251 = {
    ["price"] = 2000,
    ["name"] = v15[v16.WITCH_LAUGH].name .. " Emote",
    ["image"] = v15[v16.WITCH_LAUGH].image,
    ["items"] = {
        {
            ["emote"] = v16.WITCH_LAUGH
        }
    }
}
v29[v250] = v251
local v252 = v28.HW_2024_EMOTE_8
local v253 = {
    ["price"] = 2000,
    ["name"] = v15[v16.WITHERED_ELDERTREE].name .. " Emote",
    ["image"] = v15[v16.WITHERED_ELDERTREE].image,
    ["items"] = {
        {
            ["emote"] = v16.WITHERED_ELDERTREE
        }
    }
}
v29[v252] = v253
local v254 = v28.MUMMY_NAZAR_KITSKIN
local v255 = {
    ["price"] = 15000,
    ["name"] = v7[v6.MUMMY_NAZAR].name .. " Kit Skin",
    ["image"] = v7[v6.MUMMY_NAZAR].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.MUMMY_NAZAR
        }
    }
}
v29[v254] = v255
local v256 = v28.GREAT_WOLF_SILAS_KITSKIN
local v257 = {
    ["price"] = 15000,
    ["name"] = v7[v6.GREAT_WOLF_SILAS].name .. " Kit Skin",
    ["image"] = v7[v6.GREAT_WOLF_SILAS].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.GREAT_WOLF_SILAS
        }
    }
}
v29[v256] = v257
local v258 = v28.HALLOWEEN_WREN_KITSKIN
local v259 = {
    ["price"] = 15000,
    ["name"] = v7[v6.HALLOWEEN_WREN].name .. " Kit Skin",
    ["image"] = v7[v6.HALLOWEEN_WREN].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.HALLOWEEN_WREN
        }
    }
}
v29[v258] = v259
local v260 = v28.WITCH_KAIDA
local v261 = {
    ["price"] = 15000,
    ["name"] = v7[v6.WITCH_KAIDA].name .. " Kit Skin",
    ["image"] = v7[v6.WITCH_KAIDA].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.WITCH_KAIDA
        }
    }
}
v29[v260] = v261
local v262 = v28.GHOSTIFY_BED_BREAK
local v263 = {
    ["price"] = 10000,
    ["name"] = v13[v14.GHOSTIFY].name .. " Bed Break",
    ["image"] = v13[v14.GHOSTIFY].image,
    ["items"] = {
        {
            ["bedBreakEffect"] = v14.GHOSTIFY
        }
    }
}
v29[v262] = v263
local v264 = v28.SPIDER_QUEEN_SPIDER_PET
local v265 = {
    ["price"] = 10000,
    ["name"] = v19[v20.HALLOWEEN_2024_SPIDER].name .. " Pet",
    ["image"] = v19[v20.HALLOWEEN_2024_SPIDER].image,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.HALLOWEEN_2024_SPIDER
        }
    }
}
v29[v264] = v265
local v266 = v28.WEBBED_UP_KILL_EFFECT
local v267 = {
    ["name"] = "Webbed Up Kill Effect",
    ["price"] = 10000,
    ["image"] = v17[v18.WEBBED_UP].image,
    ["items"] = {
        {
            ["killEffect"] = v18.WEBBED_UP
        }
    }
}
v29[v266] = v267
local v268 = v28.SKELETON_KILL_EFFECT
local v269 = {
    ["name"] = "Skeleton Kill Effect",
    ["price"] = 10000,
    ["image"] = v17[v18.SKELETON].image,
    ["items"] = {
        {
            ["killEffect"] = v18.SKELETON
        }
    }
}
v29[v268] = v269
local v270 = v28.SOULLEAVE_KILL_EFFECT
local v271 = {
    ["name"] = "Soul Leave Kill Effect",
    ["price"] = 20000,
    ["image"] = v17[v18.SOUL_LEAVE].image,
    ["items"] = {
        {
            ["killEffect"] = v18.SOUL_LEAVE
        }
    }
}
v29[v270] = v271
local v272 = v28.CORRUPTED_BARBARIAN_KITSKIN
local v273 = {
    ["price"] = 20000,
    ["name"] = v7[v6.BARBARIAN_CORRUPTED].name .. " Kit Skin",
    ["image"] = v7[v6.BARBARIAN_CORRUPTED].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.BARBARIAN_CORRUPTED
        }
    }
}
v29[v272] = v273
local v274 = v28.XMAS_23_TITLE_1
local v275 = {
    ["price"] = 10000,
    ["name"] = v21[v22.FESTIVE].text .. " Title",
    ["textImage"] = v21[v22.FESTIVE].text,
    ["items"] = {
        {
            ["title"] = v22.FESTIVE
        }
    }
}
v29[v274] = v275
local v276 = v28.XMAS_23_TITLE_2
local v277 = {
    ["price"] = 4000,
    ["name"] = v21[v22.CHEERFUL].text .. " Title",
    ["textImage"] = v21[v22.CHEERFUL].text,
    ["items"] = {
        {
            ["title"] = v22.CHEERFUL
        }
    }
}
v29[v276] = v277
local v278 = v28.XMAS_23_EMOTE_1
local v279 = {
    ["price"] = 2000,
    ["name"] = v15[v16.BAKER_HOLIDAY_EAT].name .. " Emote",
    ["image"] = v15[v16.BAKER_HOLIDAY_EAT].image,
    ["items"] = {
        {
            ["emote"] = v16.BAKER_HOLIDAY_EAT
        }
    }
}
v29[v278] = v279
local v280 = v28.XMAS_23_EMOTE_2
local v281 = {
    ["price"] = 2000,
    ["name"] = v15[v16.COZY_MELODY_SMILE].name .. " Emote",
    ["image"] = v15[v16.COZY_MELODY_SMILE].image,
    ["items"] = {
        {
            ["emote"] = v16.COZY_MELODY_SMILE
        }
    }
}
v29[v280] = v281
local v282 = v28.XMAS_23_EMOTE_3
local v283 = {
    ["price"] = 4000,
    ["name"] = v15[v16.FROSTY_BALLER].name .. " Emote",
    ["image"] = v15[v16.FROSTY_BALLER].image,
    ["items"] = {
        {
            ["emote"] = v16.FROSTY_BALLER
        }
    }
}
v29[v282] = v283
local v284 = v28.XMAS_23_EMOTE_4
local v285 = {
    ["price"] = 2000,
    ["name"] = v15[v16.GINGERBREAD_MAN_RAGE].name .. " Emote",
    ["image"] = v15[v16.GINGERBREAD_MAN_RAGE].image,
    ["items"] = {
        {
            ["emote"] = v16.GINGERBREAD_MAN_RAGE
        }
    }
}
v29[v284] = v285
local v286 = v28.XMAS_23_EMOTE_5
local v287 = {
    ["price"] = 2000,
    ["name"] = v15[v16.KRAMPUS_EMBER].name .. " Emote",
    ["image"] = v15[v16.KRAMPUS_EMBER].image,
    ["items"] = {
        {
            ["emote"] = v16.KRAMPUS_EMBER
        }
    }
}
v29[v286] = v287
local v288 = v28.XMAS_23_EMOTE_6
local v289 = {
    ["price"] = 4000,
    ["name"] = v15[v16.YETI_GIFT].name .. " Emote",
    ["image"] = v15[v16.YETI_GIFT].image,
    ["items"] = {
        {
            ["emote"] = v16.YETI_GIFT
        }
    }
}
v29[v288] = v289
local v290 = v28.ELDRIC_CHRISTMAS_SPIRIT_KITSKIN
local v291 = {
    ["price"] = 20000,
    ["name"] = v7[v6.WARLOCK_CHRISTMAS_SPIRIT].name .. " Kit Skin",
    ["image"] = v7[v6.WARLOCK_CHRISTMAS_SPIRIT].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.WARLOCK_CHRISTMAS_SPIRIT
        }
    }
}
v29[v290] = v291
local v292 = v28.MILO_GRINCH_KITSKIN
local v293 = {
    ["price"] = 2,
    ["name"] = v7[v6.MILO_GRINCH].name .. " Kit Skin",
    ["image"] = v7[v6.MILO_GRINCH].renderImage,
    ["currency"] = v26.XMAS_RED_TOKEN_2023,
    ["items"] = {
        {
            ["kitSkin"] = v6.MILO_GRINCH
        }
    },
    ["tier"] = v27.LEGENDARY
}
v29[v292] = v293
local v294 = v28.MELODY_COZY_KITSKIN
local v295 = {
    ["name"] = "Holiday Cozy Melody Kit Skin",
    ["price"] = 20000,
    ["image"] = v7[v6.MELODY_HOLIDAY_COZY].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.MELODY_HOLIDAY_COZY
        }
    }
}
v29[v294] = v295
local v296 = v28.SUMMON_SNOW_ANIMATED_EMOTE
local v297 = {
    ["price"] = 15000,
    ["name"] = v15[v16.SUMMON_SNOW].name .. " Emote",
    ["animation"] = v3[v15[v16.SUMMON_SNOW].animation.type],
    ["items"] = {
        {
            ["emote"] = v16.SUMMON_SNOW
        }
    }
}
v29[v296] = v297
local v298 = v28.PENGUIN_CRUSH_KILL_EFFECT
local v299 = {
    ["price"] = 15000,
    ["name"] = v17[v18.PENGUIN_CRUSH].name .. " Kill Effect",
    ["image"] = v17[v18.PENGUIN_CRUSH].image,
    ["items"] = {
        {
            ["killEffect"] = v18.PENGUIN_CRUSH
        }
    }
}
v29[v298] = v299
local v300 = v28.SNOWBALL_LAUNCHER_LOBBY_GADGET
local v301 = {
    ["price"] = 15000,
    ["name"] = v19[v20.SNOWBALL_LAUNCHER].name .. " Lobby Gadget",
    ["image"] = v19[v20.SNOWBALL_LAUNCHER].image,
    ["currency"] = v26.XMAS_TOKEN_2023,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.SNOWBALL_LAUNCHER
        }
    }
}
v29[v300] = v301
local v302 = v28.LNY_24_EMOTE_1
local v303 = {
    ["price"] = 4000,
    ["name"] = v15[v16.YUZI_FIRECRACKERS].name .. " Emote",
    ["image"] = v15[v16.YUZI_FIRECRACKERS].image,
    ["items"] = {
        {
            ["emote"] = v16.YUZI_FIRECRACKERS
        }
    }
}
v29[v302] = v303
local v304 = v28.LNY_24_EMOTE_2
local v305 = {
    ["price"] = 4000,
    ["name"] = v15[v16.LUNAR_DRAGON_ARCHER].name .. " Emote",
    ["image"] = v15[v16.LUNAR_DRAGON_ARCHER].image,
    ["items"] = {
        {
            ["emote"] = v16.LUNAR_DRAGON_ARCHER
        }
    }
}
v29[v304] = v305
local v306 = v28.LNY_24_EMOTE_3
local v307 = {
    ["price"] = 6000,
    ["name"] = v15[v16.LUNAR_XUROT_MEME].name .. " Emote",
    ["image"] = v15[v16.LUNAR_XUROT_MEME].image,
    ["items"] = {
        {
            ["emote"] = v16.LUNAR_XUROT_MEME
        }
    }
}
v29[v306] = v307
local v308 = v28.LNY_24_EMOTE_4
local v309 = {
    ["price"] = 4000,
    ["name"] = v15[v16.DRAGON_KIT_DUEL].name .. " Emote",
    ["image"] = v15[v16.DRAGON_KIT_DUEL].image,
    ["items"] = {
        {
            ["emote"] = v16.DRAGON_KIT_DUEL
        }
    }
}
v29[v308] = v309
local v310 = v28.LNY_24_EMOTE_5
local v311 = {
    ["price"] = 4000,
    ["name"] = v15[v16.LUNAR_FREIYA_CAT].name .. " Emote",
    ["image"] = v15[v16.LUNAR_FREIYA_CAT].image,
    ["items"] = {
        {
            ["emote"] = v16.LUNAR_FREIYA_CAT
        }
    }
}
v29[v310] = v311
local v312 = v28.LNY_24_EMOTE_6
local v313 = {
    ["price"] = 4000,
    ["name"] = v15[v16.LUNAR_FREIYA_CELEBRATION].name .. " Emote",
    ["image"] = v15[v16.LUNAR_FREIYA_CELEBRATION].image,
    ["items"] = {
        {
            ["emote"] = v16.LUNAR_FREIYA_CELEBRATION
        }
    }
}
v29[v312] = v313
local v314 = v28.LNY_24_TITLE_1
local v315 = {
    ["price"] = 4000,
    ["name"] = v21[v22.GOOD_LUCK].text .. " Title",
    ["textImage"] = v21[v22.GOOD_LUCK].text,
    ["items"] = {
        {
            ["title"] = v22.GOOD_LUCK
        }
    }
}
v29[v314] = v315
local v316 = v28.LNY_24_TITLE_2
local v317 = {
    ["price"] = 6000,
    ["name"] = v21[v22.PROSPEROUS].text .. " Title",
    ["textImage"] = v21[v22.PROSPEROUS].text,
    ["items"] = {
        {
            ["title"] = v22.PROSPEROUS
        }
    }
}
v29[v316] = v317
local v318 = v28.LNY_24_TITLE_3
local v319 = {
    ["price"] = 4000,
    ["name"] = v21[v22.LONGEVITY].text .. " Title",
    ["textImage"] = v21[v22.LONGEVITY].text,
    ["items"] = {
        {
            ["title"] = v22.LONGEVITY
        }
    }
}
v29[v318] = v319
local v320 = v28.LNY_24_TITLE_4
local v321 = {
    ["price"] = 4000,
    ["name"] = v21[v22.RED_ENVELOPE].text .. " Title",
    ["textImage"] = v21[v22.RED_ENVELOPE].text,
    ["items"] = {
        {
            ["title"] = v22.RED_ENVELOPE
        }
    }
}
v29[v320] = v321
local v322 = v28.LNY_24_TITLE_5
local v323 = {
    ["price"] = 4000,
    ["name"] = v21[v22.RED_PAPER_LANTERN].text .. " Title",
    ["textImage"] = v21[v22.RED_PAPER_LANTERN].text,
    ["items"] = {
        {
            ["title"] = v22.RED_PAPER_LANTERN
        }
    }
}
v29[v322] = v323
local v324 = v28.LNY_24_KITSKIN_1
local v325 = {
    ["price"] = 20000,
    ["name"] = v7[v6.ARCHER_LUNAR_DRAGON].name .. " Kit Skin",
    ["image"] = v7[v6.ARCHER_LUNAR_DRAGON].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.ARCHER_LUNAR_DRAGON
        }
    }
}
v29[v324] = v325
local v326 = v28.LNY_24_KILL_EFFECT_1
local v327 = {
    ["price"] = 15000,
    ["name"] = v17[v18.LUNAR_DRAGON].name .. " Kill Effect",
    ["image"] = v17[v18.LUNAR_DRAGON].image,
    ["items"] = {
        {
            ["killEffect"] = v18.LUNAR_DRAGON
        }
    }
}
v29[v326] = v327
local v328 = v28.LNY_24_ANIMATED_EMOTE_1
local v329 = {
    ["image"] = "rbxassetid://16213995446",
    ["price"] = 15000,
    ["name"] = v15[v16.COIN_FOUNTAIN].name .. " Animated Emote",
    ["items"] = {
        {
            ["emote"] = v16.COIN_FOUNTAIN
        }
    }
}
v29[v328] = v329
local v330 = v28.THREE_YEAR_ANNIVERSARY_BALLOON_LOBBY_GADGET
local v331 = {
    ["price"] = 15000,
    ["name"] = v19[v20.ANNIVERSARY_BALLOONS].name .. " Lobby Gadget",
    ["image"] = v19[v20.ANNIVERSARY_BALLOONS].image,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.ANNIVERSARY_BALLOONS
        }
    }
}
v29[v330] = v331
local v332 = v28.THREE_YEAR_ANNIVERSARY_PARTY_HAT_LOBBY_GADGET
local v333 = {
    ["price"] = 15000,
    ["name"] = v19[v20.PARTY_HAT_LAUNCHER].name .. " Lobby Gadget",
    ["image"] = v19[v20.PARTY_HAT_LAUNCHER].image,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.PARTY_HAT_LAUNCHER
        }
    }
}
v29[v332] = v333
local v334 = v28.THREE_YEAR_ANNIVERSARY_KILL_EFFECT_1
local v335 = {
    ["price"] = 15000,
    ["name"] = v17[v18.FLOAT_AWAY].name .. " Kill Effect",
    ["image"] = v17[v18.FLOAT_AWAY].image,
    ["items"] = {
        {
            ["killEffect"] = v18.FLOAT_AWAY
        }
    }
}
v29[v334] = v335
local v336 = v28.THREE_YEAR_ANNIVERSARY_TITLE_1
local v337 = {
    ["price"] = 2000,
    ["name"] = v21[v22.THREE_YEAR_ANNIVERSARY].text .. " Title",
    ["textImage"] = v21[v22.THREE_YEAR_ANNIVERSARY].text,
    ["items"] = {
        {
            ["title"] = v22.THREE_YEAR_ANNIVERSARY
        }
    }
}
v29[v336] = v337
local v338 = v28.THREE_YEAR_ANNIVERSARY_TITLE_2
local v339 = {
    ["price"] = 4000,
    ["name"] = v21[v22.SQUAD_UP].text .. " Title",
    ["textImage"] = v21[v22.SQUAD_UP].text,
    ["items"] = {
        {
            ["title"] = v22.SQUAD_UP
        }
    }
}
v29[v338] = v339
local v340 = v28.THREE_YEAR_ANNIVERSARY_TITLE_3
local v341 = {
    ["price"] = 4000,
    ["name"] = v21[v22.TRIPLE_THREAT].text .. " Title",
    ["textImage"] = v21[v22.TRIPLE_THREAT].text,
    ["items"] = {
        {
            ["title"] = v22.TRIPLE_THREAT
        }
    }
}
v29[v340] = v341
local v342 = v28.THREE_YEAR_ANNIVERSARY_CONGA_EMOTE
local v343 = {
    ["price"] = 15000,
    ["name"] = v15[v16.CONGA_LINE].name .. " Emote",
    ["image"] = v15[v16.CONGA_LINE].image,
    ["animation"] = v3[v15[v16.CONGA_LINE].animation.type],
    ["items"] = {
        {
            ["emote"] = v16.CONGA_LINE
        }
    }
}
v29[v342] = v343
local v344 = v28.THREE_YEAR_ANNIVERSARY_EMOTE_BEKZAT
local v345 = {
    ["price"] = 4000,
    ["name"] = v15[v16.THREE_YEAR_BEKZAT].name .. " Emote",
    ["image"] = v15[v16.THREE_YEAR_BEKZAT].image,
    ["items"] = {
        {
            ["emote"] = v16.THREE_YEAR_BEKZAT
        }
    }
}
v29[v344] = v345
local v346 = v28.THREE_YEAR_ANNIVERSARY_EMOTE_BARBARIAN
local v347 = {
    ["price"] = 4000,
    ["name"] = v15[v16.THREE_YEAR_BARBARIAN].name .. " Emote",
    ["image"] = v15[v16.THREE_YEAR_BARBARIAN].image,
    ["items"] = {
        {
            ["emote"] = v16.THREE_YEAR_BARBARIAN
        }
    }
}
v29[v346] = v347
local v348 = v28.THREE_YEAR_ANNIVERSARY_EMOTE_LYLA
local v349 = {
    ["price"] = 4000,
    ["name"] = v15[v16.THREE_YEAR_LYLA].name .. " Emote",
    ["image"] = v15[v16.THREE_YEAR_LYLA].image,
    ["items"] = {
        {
            ["emote"] = v16.THREE_YEAR_LYLA
        }
    }
}
v29[v348] = v349
local v350 = v28.THREE_YEAR_ANNIVERSARY_EMOTE_CAKE_FACE
local v351 = {
    ["price"] = 4000,
    ["name"] = v15[v16.THREE_YEAR_CAKE_FACE].name .. " Emote",
    ["image"] = v15[v16.THREE_YEAR_CAKE_FACE].image,
    ["items"] = {
        {
            ["emote"] = v16.THREE_YEAR_CAKE_FACE
        }
    }
}
v29[v350] = v351
local v352 = v28.THREE_YEAR_ANNIVERSARY_EMOTE_BAKER
local v353 = {
    ["price"] = 4000,
    ["name"] = v15[v16.THREE_YEAR_BAKER].name .. " Emote",
    ["image"] = v15[v16.THREE_YEAR_BAKER].image,
    ["items"] = {
        {
            ["emote"] = v16.THREE_YEAR_BAKER
        }
    }
}
v29[v352] = v353
local v354 = v28.THREE_YEAR_ANNIVERSARY_KIT_SKIN_1
local v355 = {
    ["price"] = 20000,
    ["name"] = v7[v6.WIZARD_ANNIVERSARY].name .. " Kit Skin",
    ["image"] = v7[v6.WIZARD_ANNIVERSARY].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.WIZARD_ANNIVERSARY
        }
    }
}
v29[v354] = v355
local v356 = v28.SUMMER_24_EMOTE_1
local v357 = {
    ["price"] = 4000,
    ["name"] = v15[v16.VULCAN_ASK].name .. " Emote",
    ["image"] = v15[v16.VULCAN_ASK].image,
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.VULCAN_ASK
        }
    }
}
v29[v356] = v357
local v358 = v28.SUMMER_24_EMOTE_2
local v359 = {
    ["price"] = 4000,
    ["name"] = v15[v16.VULCAN_BRAINFREEZE].name .. " Emote",
    ["image"] = v15[v16.VULCAN_BRAINFREEZE].image,
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.VULCAN_BRAINFREEZE
        }
    }
}
v29[v358] = v359
local v360 = v28.SUMMER_24_EMOTE_3
local v361 = {
    ["price"] = 4000,
    ["name"] = v15[v16.MILO_SPLASH].name .. " Emote",
    ["image"] = v15[v16.MILO_SPLASH].image,
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.MILO_SPLASH
        }
    }
}
v29[v360] = v361
local v362 = v28.SUMMER_24_EMOTE_4
local v363 = {
    ["price"] = 4000,
    ["name"] = v15[v16.MILO_SANDCASTLE].name .. " Emote",
    ["image"] = v15[v16.MILO_SANDCASTLE].image,
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.MILO_SANDCASTLE
        }
    }
}
v29[v362] = v363
local v364 = v28.SUMMER_24_EMOTE_5
local v365 = {
    ["price"] = 4000,
    ["name"] = v15[v16.INFERNAL_SURFER_WINK].name .. " Emote",
    ["image"] = v15[v16.INFERNAL_SURFER_WINK].image,
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.INFERNAL_SURFER_WINK
        }
    }
}
v29[v364] = v365
local v366 = v28.SUMMER_24_EMOTE_6
local v367 = {
    ["price"] = 4000,
    ["name"] = v15[v16.SHEILA_VOLLEYBALL].name .. " Emote",
    ["image"] = v15[v16.SHEILA_VOLLEYBALL].image,
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.SHEILA_VOLLEYBALL
        }
    }
}
v29[v366] = v367
local v368 = v28.SUMMER_24_KIT_SKIN_1
local v369 = {
    ["price"] = 20000,
    ["name"] = v7[v6.MILO_AQUATIC].name .. " Kit Skin",
    ["image"] = v7[v6.MILO_AQUATIC].renderImage,
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["kitSkin"] = v6.MILO_AQUATIC
        }
    }
}
v29[v368] = v369
local v370 = v28.SUMMER_24_KIT_SKIN_2
local v371 = {
    ["price"] = 20000,
    ["name"] = v7[v6.SHIELDER_SUMMER].name .. " Kit Skin",
    ["image"] = v7[v6.SHIELDER_SUMMER].renderImage,
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["kitSkin"] = v6.SHIELDER_SUMMER
        }
    }
}
v29[v370] = v371
local v372 = v28.SUMMER_24_KIT_SKIN_3
local v373 = {
    ["price"] = 20000,
    ["name"] = v7[v6.MELODY_SIREN].name .. " Kit Skin",
    ["image"] = v7[v6.MELODY_SIREN].renderImage,
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["kitSkin"] = v6.MELODY_SIREN
        }
    }
}
v29[v372] = v373
local v374 = v28.SUMMER_24_ANIMATED_EMOTE_1
local v375 = {
    ["price"] = 15000,
    ["name"] = v15[v16.ICY_DELIGHT].name .. " Animated Emote",
    ["animation"] = v3[v15[v16.ICY_DELIGHT].animation.type],
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.ICY_DELIGHT
        }
    }
}
v29[v374] = v375
local v376 = v28.SUMMER_24_ANIMATED_EMOTE_2
local v377 = {
    ["price"] = 15000,
    ["name"] = v15[v16.CRAB_DANCE].name .. " Animated Emote",
    ["animation"] = v3[v15[v16.CRAB_DANCE].animation.type],
    ["currency"] = v26.SUMMER_2024_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.CRAB_DANCE
        }
    }
}
v29[v376] = v377
local v378 = v28.SUMMER_24_KILL_EFFECT_1
local v379 = {
    ["name"] = "Summer Pet Kill Effect",
    ["price"] = 15000,
    ["image"] = v17[v18.SUMMER_PET_DANCE].image,
    ["items"] = {
        {
            ["killEffect"] = v18.SUMMER_PET_DANCE
        }
    }
}
v29[v378] = v379
local v380 = v28.SUMMER_24_BEACHBALL_LOBBY_GADGET
local v381 = {
    ["price"] = 8000,
    ["name"] = v19[v20.BEACHBALL].name .. " Lobby Gadget",
    ["image"] = v19[v20.BEACHBALL].image,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.BEACHBALL
        }
    }
}
v29[v380] = v381
local v382 = v28.SUMMER_24_TITLE_1
local v383 = {
    ["price"] = 3000,
    ["name"] = v21[v22.SUNS_OUT_GUNS_OUT].text .. " Title",
    ["textImage"] = v21[v22.SUNS_OUT_GUNS_OUT].text,
    ["items"] = {
        {
            ["title"] = v22.SUNS_OUT_GUNS_OUT
        }
    }
}
v29[v382] = v383
local v384 = v28.SUMMER_24_TITLE_2
local v385 = {
    ["price"] = 3000,
    ["name"] = v21[v22.SUNGLASSES_EMOJI].text .. " Title",
    ["textImage"] = v21[v22.SUNGLASSES_EMOJI].text,
    ["items"] = {
        {
            ["title"] = v22.SUNGLASSES_EMOJI
        }
    }
}
v29[v384] = v385
local v386 = v28.SUMMER_24_TITLE_3
local v387 = {
    ["price"] = 3000,
    ["name"] = v21[v22.SALTY].text .. " Title",
    ["textImage"] = v21[v22.SALTY].text,
    ["items"] = {
        {
            ["title"] = v22.SALTY
        }
    }
}
v29[v386] = v387
local v388 = v28.LNY_25_EMOTE_2
local v389 = {
    ["price"] = 2000,
    ["name"] = v15[v16.BUILDER_RED_ENVELOPE].name .. " Emote",
    ["image"] = v15[v16.BUILDER_RED_ENVELOPE].image,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.BUILDER_RED_ENVELOPE
        }
    }
}
v29[v388] = v389
local v390 = v28.LNY_25_EMOTE_3
local v391 = {
    ["price"] = 2000,
    ["name"] = v15[v16.YUZI_RED_ENVELOPE].name .. " Emote",
    ["image"] = v15[v16.YUZI_RED_ENVELOPE].image,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.YUZI_RED_ENVELOPE
        }
    }
}
v29[v390] = v391
local v392 = v28.LNY_25_EMOTE_4
local v393 = {
    ["price"] = 2000,
    ["name"] = v15[v16.LIAN_LNY_CELEBRATE].name .. " Emote",
    ["image"] = v15[v16.LIAN_LNY_CELEBRATE].image,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.LIAN_LNY_CELEBRATE
        }
    }
}
v29[v392] = v393
local v394 = v28.LNY_25_EMOTE_5
local v395 = {
    ["price"] = 2000,
    ["name"] = v15[v16.LUNAR_HANNAH_FIREWORKS].name .. " Emote",
    ["image"] = v15[v16.LUNAR_HANNAH_FIREWORKS].image,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.LUNAR_HANNAH_FIREWORKS
        }
    }
}
v29[v394] = v395
local v396 = v28.LNY_25_EMOTE_6
local v397 = {
    ["price"] = 2000,
    ["name"] = v15[v16.YUZI_LNY_LANTERNS].name .. " Emote",
    ["image"] = v15[v16.YUZI_LNY_LANTERNS].image,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.YUZI_LNY_LANTERNS
        }
    }
}
v29[v396] = v397
local v398 = v28.LNY_25_KIT_SKIN_1
local v399 = {
    ["price"] = 15000,
    ["name"] = v7[v6.HANNAH_LUNAR].name .. " Kit Skin",
    ["image"] = v7[v6.HANNAH_LUNAR].renderImage,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["kitSkin"] = v6.HANNAH_LUNAR
        }
    }
}
v29[v398] = v399
local v400 = v28.LNY_25_ANIMATED_EMOTE_1
local v401 = {
    ["price"] = 10000,
    ["name"] = v15[v16.PAPER_LANTERN_RELEASE].name .. " Emote",
    ["animation"] = v3[v15[v16.PAPER_LANTERN_RELEASE].animation.type],
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.PAPER_LANTERN_RELEASE
        }
    }
}
v29[v400] = v401
local v402 = v28.LNY_LOBBY_GADGET_1
local v403 = {
    ["price"] = 10000,
    ["name"] = v19[v20.LNY_2025_GOLDEN_SNAKE].name .. " Pet",
    ["image"] = v19[v20.LNY_2025_GOLDEN_SNAKE].image,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.LNY_2025_GOLDEN_SNAKE
        }
    }
}
v29[v402] = v403
local v404 = v28.LNY_25_TITLE_1
local v405 = {
    ["price"] = 2000,
    ["name"] = v21[v22.SNAKE_EMOJI].text .. " Title",
    ["textImage"] = v21[v22.SNAKE_EMOJI].text,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["title"] = v22.SNAKE_EMOJI
        }
    }
}
v29[v404] = v405
local v406 = v28.LNY_25_TITLE_2
local v407 = {
    ["price"] = 2000,
    ["name"] = v21[v22.VIPER].text .. " Title",
    ["textImage"] = v21[v22.VIPER].text,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["title"] = v22.VIPER
        }
    }
}
v29[v406] = v407
local v408 = v28.LNY_25_TITLE_3
local v409 = {
    ["price"] = 2000,
    ["name"] = v21[v22.VENOM].text .. " Title",
    ["textImage"] = v21[v22.VENOM].text,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["title"] = v22.VENOM
        }
    }
}
v29[v408] = v409
local v410 = v28.LNY_25_TITLE_4
local v411 = {
    ["price"] = 3000,
    ["name"] = v21[v22.FANG].text .. " Title",
    ["textImage"] = v21[v22.FANG].text,
    ["currency"] = v26.LNY_2025_CURRENCY,
    ["items"] = {
        {
            ["title"] = v22.FANG
        }
    }
}
v29[v410] = v411
local v412 = v28.SUMMER_25_EMOTE_1
local v413 = {
    ["price"] = 4000,
    ["name"] = v15[v16.LIFEGUARD_LASSY_WARNING].name .. " Emote",
    ["image"] = v15[v16.LIFEGUARD_LASSY_WARNING].image,
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.LIFEGUARD_LASSY_WARNING
        }
    }
}
v29[v412] = v413
local v414 = v28.SUMMER_25_EMOTE_2
local v415 = {
    ["price"] = 4000,
    ["name"] = v15[v16.MARTIN_HYDRATE].name .. " Emote",
    ["image"] = v15[v16.MARTIN_HYDRATE].image,
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.MARTIN_HYDRATE
        }
    }
}
v29[v414] = v415
local v416 = v28.SUMMER_25_EMOTE_3
local v417 = {
    ["price"] = 4000,
    ["name"] = v15[v16.TIDAL_WREN_SHINY].name .. " Emote",
    ["image"] = v15[v16.TIDAL_WREN_SHINY].image,
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.TIDAL_WREN_SHINY
        }
    }
}
v29[v416] = v417
local v418 = v28.SUMMER_25_EMOTE_4
local v419 = {
    ["price"] = 4000,
    ["name"] = v15[v16.CRYPTWRECKED_SALUTE].name .. " Emote",
    ["image"] = v15[v16.CRYPTWRECKED_SALUTE].image,
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.CRYPTWRECKED_SALUTE
        }
    }
}
v29[v418] = v419
local v420 = v28.SUMMER_25_EMOTE_5
local v421 = {
    ["price"] = 4000,
    ["name"] = v15[v16.TIDAL_WREN_CHEERS].name .. " Emote",
    ["image"] = v15[v16.TIDAL_WREN_CHEERS].image,
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.TIDAL_WREN_CHEERS
        }
    }
}
v29[v420] = v421
local v422 = v28.SUMMER_25_EMOTE_6
local v423 = {
    ["price"] = 4000,
    ["name"] = v15[v16.LIFEGUARD_LASSY_CHILLING].name .. " Emote",
    ["image"] = v15[v16.LIFEGUARD_LASSY_CHILLING].image,
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.LIFEGUARD_LASSY_CHILLING
        }
    }
}
v29[v422] = v423
local v424 = v28.SUMMER_25_KIT_SKIN_1
local v425 = {
    ["price"] = 20000,
    ["name"] = v7[v6.CRYPTWRECKED].name .. " Kit Skin",
    ["image"] = v7[v6.CRYPTWRECKED].renderImage,
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["kitSkin"] = v6.CRYPTWRECKED
        }
    }
}
v29[v424] = v425
local v426 = v28.SUMMER_25_KIT_SKIN_2
local v427 = {
    ["price"] = 20000,
    ["name"] = v7[v6.TIDAL_WREN].name .. " Kit Skin",
    ["image"] = v7[v6.TIDAL_WREN].renderImage,
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["kitSkin"] = v6.TIDAL_WREN
        }
    }
}
v29[v426] = v427
local v428 = v28.SUMMER_25_KIT_SKIN_3
local v429 = {
    ["price"] = 20000,
    ["name"] = v7[v6.BIGMAN_REEF].name .. " Kit Skin",
    ["image"] = v7[v6.BIGMAN_REEF].renderImage,
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["kitSkin"] = v6.BIGMAN_REEF
        }
    }
}
v29[v428] = v429
local v430 = v28.SUMMER_25_ANIMATED_EMOTE_1
local v431 = {
    ["price"] = 15000,
    ["name"] = v15[v16.PIRATE_TREASURE].name .. " Animated Emote",
    ["animation"] = v3[v15[v16.PIRATE_TREASURE].animation.type],
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.PIRATE_TREASURE
        }
    }
}
v29[v430] = v431
local v432 = v28.SUMMER_25_ANIMATED_EMOTE_2
local v433 = {
    ["price"] = 15000,
    ["name"] = v15[v16.BEACH_VOLLEY_BALL].name .. " Animated Emote",
    ["animation"] = v3[v15[v16.BEACH_VOLLEY_BALL].animation.type],
    ["currency"] = v26.SUMMER_2025_CURRENCY,
    ["items"] = {
        {
            ["emote"] = v16.BEACH_VOLLEY_BALL
        }
    }
}
v29[v432] = v433
local v434 = v28.SUMMER_25_KILL_EFFECT_1
local v435 = {
    ["name"] = "Shark Bite Kill Effect",
    ["price"] = 15000,
    ["image"] = v17[v18.SHARK].image,
    ["items"] = {
        {
            ["killEffect"] = v18.SHARK
        }
    }
}
v29[v434] = v435
local v436 = v28.SUMMER_25_BED_BREAK_EFFECT_1
local v437 = {
    ["price"] = 15000,
    ["name"] = v13[v14.CONFETTI].name .. " Bed Break",
    ["image"] = v13[v14.CONFETTI].image,
    ["items"] = {
        {
            ["bedBreakEffect"] = v14.CONFETTI
        }
    }
}
v29[v436] = v437
local v438 = v28.SUMMER_25_WATER_GUN_LOBBY_GADGET
local v439 = {
    ["price"] = 8000,
    ["name"] = v19[v20.WATER_GUN].name .. " Lobby Gadget",
    ["image"] = v19[v20.WATER_GUN].image,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.WATER_GUN
        }
    }
}
v29[v438] = v439
local v440 = v28.SUMMER_25_TITLE_1
local v441 = {
    ["price"] = 3000,
    ["name"] = v21[v22.WAVEMAKER].text .. " Title",
    ["textImage"] = v21[v22.WAVEMAKER].text,
    ["items"] = {
        {
            ["title"] = v22.WAVEMAKER
        }
    }
}
v29[v440] = v441
local v442 = v28.SUMMER_25_TITLE_2
local v443 = {
    ["price"] = 3000,
    ["name"] = v21[v22.TREASURE_HUNTER].text .. " Title",
    ["textImage"] = v21[v22.TREASURE_HUNTER].text,
    ["items"] = {
        {
            ["title"] = v22.TREASURE_HUNTER
        }
    }
}
v29[v442] = v443
local v444 = v28.SUMMER_25_TITLE_3
local v445 = {
    ["price"] = 3000,
    ["name"] = v21[v22.CASTAWAY].text .. " Title",
    ["textImage"] = v21[v22.CASTAWAY].text,
    ["items"] = {
        {
            ["title"] = v22.CASTAWAY
        }
    }
}
v29[v444] = v445
local v446 = v28.INCARNATION_GRIM_REAPER
local v447 = {
    ["name"] = "Incarnation: Grim Reaper Emote",
    ["price"] = 2000,
    ["animation"] = v3[v2.HEAVENLY_SWORD_SWING],
    ["currency"] = v26.SKULLS,
    ["items"] = {
        {
            ["emote"] = v16.INCARNATION_GRIM_REAPER
        }
    },
    ["tier"] = v27.LEGENDARY
}
v29[v446] = v447
local v448 = v28.UNDERWORLD_ENVOY_INTERN
local v449 = {
    ["name"] = "Underworld Envoy Trainee Title",
    ["price"] = 10,
    ["currency"] = v26.SKULLS,
    ["items"] = {
        {
            ["title"] = v22.REAPER_INTERN
        }
    }
}
v29[v448] = v449
local v450 = v28.UNDERWORLD_ENVOY_AGENT
local v451 = {
    ["name"] = "Underworld Envoy Agent Title",
    ["price"] = 200,
    ["currency"] = v26.SKULLS,
    ["items"] = {
        {
            ["title"] = v22.REAPER_AGENT
        }
    }
}
v29[v450] = v451
local v452 = v28.UNDERWORLD_ENVOY_EMISSARY
local v453 = {
    ["name"] = "Underworld Envoy Emissary Title",
    ["price"] = 600,
    ["currency"] = v26.SKULLS,
    ["items"] = {
        {
            ["title"] = v22.REAPER_EMISSARY
        }
    }
}
v29[v452] = v453
local v454 = v28.EMOTE_GRIM_SKULL_HARVESTER
local v455 = {
    ["price"] = 20,
    ["name"] = v15[v16.GRIM_SKULL_HARVESTER].name .. " Emote",
    ["image"] = v15[v16.GRIM_SKULL_HARVESTER].image,
    ["currency"] = v26.SKULLS,
    ["items"] = {
        {
            ["emote"] = v16.GRIM_SKULL_HARVESTER
        }
    }
}
v29[v454] = v455
local v456 = v28.EMOTE_GRIM_SKULL_EMOJI
local v457 = {
    ["price"] = 20,
    ["name"] = v15[v16.GRIM_SKULL_EMOJI].name .. " Emote",
    ["image"] = v15[v16.GRIM_SKULL_EMOJI].image,
    ["currency"] = v26.SKULLS,
    ["items"] = {
        {
            ["emote"] = v16.GRIM_SKULL_EMOJI
        }
    }
}
v29[v456] = v457
local v458 = v28.GRIM_REAPER_RENTAL
local v459 = {
    ["name"] = "Grim Reaper Rental Ticket (3 Days)",
    ["image"] = "rbxassetid://12510116571",
    ["price"] = 30,
    ["maxPurchasesPerEvent"] = 1,
    ["currency"] = v26.SKULLS
}
local v460 = {}
local v461 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.KIT_RENTAL_GRIM_REAPER
    }
}
__set_list(v460, 1, {v461})
v459.items = v460
v29[v458] = v459
local v462 = v28.SKULL_DROP_LUCKY_CRATE
local v463 = {
    ["name"] = "Lucky Crate",
    ["price"] = 20,
    ["maxPurchasesPerEvent"] = 2,
    ["image"] = v23[v24.LEVEL_UP_CRATE].image,
    ["currency"] = v26.SKULLS
}
local v464 = {}
local v465 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LEVEL_UP_CRATE
    }
}
__set_list(v464, 1, {v465})
v463.items = v464
v29[v462] = v463
local v466 = v28.HALLOWEEN_2025_ANIMATED_EMOTE_1
local v467 = {
    ["price"] = 15000,
    ["name"] = v15[v16.THRILLER].name .. " Emote",
    ["image"] = v15[v16.THRILLER].image,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["emote"] = v16.THRILLER
        }
    }
}
v29[v466] = v467
local v468 = v28.HALLOWEEN_2025_ANIMATED_EMOTE_2
local v469 = {
    ["price"] = 15000,
    ["name"] = v15[v16.HEADS_OFF].name .. " Emote",
    ["image"] = v15[v16.HEADS_OFF].image,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["emote"] = v16.HEADS_OFF
        }
    }
}
v29[v468] = v469
local v470 = v28.HALLOWEEN_2025_IMAGE_EMOTE_1
local v471 = {
    ["price"] = 5000,
    ["name"] = v15[v16.WREN_TRICK_OR_TREAT].name .. " Emote",
    ["image"] = v15[v16.WREN_TRICK_OR_TREAT].image,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["emote"] = v16.WREN_TRICK_OR_TREAT
        }
    }
}
v29[v470] = v471
local v472 = v28.HALLOWEEN_2025_IMAGE_EMOTE_2
local v473 = {
    ["price"] = 5000,
    ["name"] = v15[v16.ALCHEMIST_PUMPKIN_STEW].name .. " Emote",
    ["image"] = v15[v16.ALCHEMIST_PUMPKIN_STEW].image,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["emote"] = v16.ALCHEMIST_PUMPKIN_STEW
        }
    }
}
v29[v472] = v473
local v474 = v28.HALLOWEEN_2025_IMAGE_EMOTE_3
local v475 = {
    ["price"] = 5000,
    ["name"] = v15[v16.WREN_COFFIN].name .. " Emote",
    ["image"] = v15[v16.WREN_COFFIN].image,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["emote"] = v16.WREN_COFFIN
        }
    }
}
v29[v474] = v475
local v476 = v28.HALLOWEEN_2025_IMAGE_EMOTE_4
local v477 = {
    ["price"] = 5000,
    ["name"] = v15[v16.KAIDA_WITCH_APPLE].name .. " Emote",
    ["image"] = v15[v16.KAIDA_WITCH_APPLE].image,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["emote"] = v16.KAIDA_WITCH_APPLE
        }
    }
}
v29[v476] = v477
local v478 = v28.HALLOWEEN_2025_IMAGE_EMOTE_5
local v479 = {
    ["price"] = 5000,
    ["name"] = v15[v16.GOMPY_SCARED].name .. " Emote",
    ["image"] = v15[v16.GOMPY_SCARED].image,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["emote"] = v16.GOMPY_SCARED
        }
    }
}
v29[v478] = v479
local v480 = v28.HALLOWEEN_2025_TITLE_1
local v481 = {
    ["price"] = 5000,
    ["name"] = v21[v22.SCARED_EMOJI].text .. " Title",
    ["textImage"] = v21[v22.SCARED_EMOJI].text,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["title"] = v22.SCARED_EMOJI
        }
    }
}
v29[v480] = v481
local v482 = v28.HALLOWEEN_2025_TITLE_2
local v483 = {
    ["price"] = 5000,
    ["name"] = v21[v22.BAT_EMOJIS].text .. " Title",
    ["textImage"] = v21[v22.BAT_EMOJIS].text,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["title"] = v22.BAT_EMOJIS
        }
    }
}
v29[v482] = v483
local v484 = v28.HALLOWEEN_2025_TITLE_3
local v485 = {
    ["price"] = 5000,
    ["name"] = v21[v22.UNDEAD].text .. " Title",
    ["textImage"] = v21[v22.UNDEAD].text,
    ["currency"] = v26.CANDY_2025,
    ["items"] = {
        {
            ["title"] = v22.UNDEAD
        }
    }
}
v29[v484] = v485
local v486 = v28.HALLOWEEN_2025_BATEXPLOSION_KILLEFFECT
local v487 = {
    ["name"] = "Bat-Splode Kill Effect",
    ["price"] = 20000,
    ["image"] = v17[v18.BAT].image,
    ["items"] = {
        {
            ["killEffect"] = v18.BAT
        }
    }
}
v29[v486] = v487
local v488 = v28.HALLOWEEN_2025_BATEXPLOSION_BEDBREAKEFFECT
local v489 = {
    ["name"] = "Bat-Splode Bed Break Effect",
    ["price"] = 20000,
    ["image"] = v13[v14.BAT].image,
    ["items"] = {
        {
            ["bedBreakEffect"] = v14.BAT
        }
    }
}
v29[v488] = v489
local v490 = v28.HALLOWEEN_2025_WITCHPOLYMOPRH_KILLEFFECT
local v491 = {
    ["name"] = "Witch Polymorph Kill Effect",
    ["price"] = 20000,
    ["image"] = v17[v18.POLYMORPH].image,
    ["items"] = {
        {
            ["killEffect"] = v18.POLYMORPH
        }
    }
}
v29[v490] = v491
local v492 = v28.HALLOWEEN_2025_CENTIPEDE_BEDBREAKEFFECT
local v493 = {
    ["name"] = "Centipede Bed Break Effect",
    ["price"] = 20000,
    ["image"] = v13[v14.CENTIPEDE].image,
    ["items"] = {
        {
            ["bedBreakEffect"] = v14.CENTIPEDE
        }
    }
}
v29[v492] = v493
local v494 = v28.HALLOWEEN_2025_JIANG_SHI_LIAN_KIT_SKIN
local v495 = {
    ["price"] = 25000,
    ["name"] = v7[v6.DRAGON_SWORD_JIANG_SHI].name .. " Kit Skin",
    ["currency"] = v26.CANDY_2025,
    ["image"] = v7[v6.DRAGON_SWORD_JIANG_SHI].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.DRAGON_SWORD_JIANG_SHI
        }
    }
}
v29[v494] = v495
local v496 = v28.HALLOWEEN_2025_DEMON_TRITON_KIT_SKIN
local v497 = {
    ["price"] = 2,
    ["name"] = v7[v6.DEMON_TRITON].name .. " Kit Skin",
    ["currency"] = v26.RARE_CANDY_2025,
    ["image"] = v7[v6.DEMON_TRITON].renderImage,
    ["items"] = {
        {
            ["kitSkin"] = v6.DEMON_TRITON
        }
    },
    ["tier"] = v27.LEGENDARY
}
v29[v496] = v497
local v498 = v28.HALLOWEEN_2025_SKELETON_KIT
local v499 = {
    ["price"] = 3,
    ["name"] = v9[v8.SKELETON].name .. " Kit",
    ["currency"] = v26.RARE_CANDY_2025,
    ["items"] = {
        {
            ["kit"] = v8.SKELETON
        }
    },
    ["tier"] = v27.LEGENDARY
}
v29[v498] = v499
local v500 = v28.METEOR_LUCKY_CRATE_1
local v501 = {
    ["name"] = "Lucky Crate",
    ["price"] = 5,
    ["maxPurchasesPerEvent"] = 3,
    ["image"] = v23[v24.LEVEL_UP_CRATE].image,
    ["currency"] = v26.METEOR_SHARD
}
local v502 = {}
local v503 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LEVEL_UP_CRATE
    }
}
__set_list(v502, 1, {v503})
v501.items = v502
v29[v500] = v501
local v504 = v28.METEOR_LUCKY_CRATE_2
local v505 = {
    ["name"] = "Lucky Crate",
    ["price"] = 7,
    ["maxPurchasesPerEvent"] = 1,
    ["image"] = v23[v24.LEVEL_UP_CRATE].image,
    ["currency"] = v26.METEOR_SHARD
}
local v506 = {}
local v507 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LEVEL_UP_CRATE
    }
}
__set_list(v506, 1, {v507})
v505.items = v506
v29[v504] = v505
local v508 = v28.METEOR_LUCKY_CRATE_3
local v509 = {
    ["name"] = "Lucky Crate",
    ["price"] = 10,
    ["maxPurchasesPerEvent"] = 1,
    ["image"] = v23[v24.LEVEL_UP_CRATE].image,
    ["currency"] = v26.METEOR_SHARD
}
local v510 = {}
local v511 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LEVEL_UP_CRATE
    }
}
__set_list(v510, 1, {v511})
v509.items = v510
v29[v508] = v509
local v512 = v28.METEOR_STAFF_LOBBY_GADGET
local v513 = {
    ["name"] = "Meteor Caller Staff Lobby Gadget",
    ["price"] = 30,
    ["maxPurchasesPerEvent"] = 1,
    ["image"] = v10.METEOR_STAFF,
    ["currency"] = v26.METEOR_SHARD,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.METEOR_CALLER_STAFF
        }
    }
}
v29[v512] = v513
local v514 = v28.AGNI_RENTAL_TICKET
local v515 = {
    ["name"] = "Agni Rental Ticket (3 Days)",
    ["price"] = 10,
    ["maxPurchasesPerEvent"] = 1,
    ["image"] = v10.AGNI_RENTAL,
    ["currency"] = v26.METEOR_SHARD
}
local v516 = {}
local v517 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.KIT_RENTAL_AGNI
    }
}
__set_list(v516, 1, {v517})
v515.items = v516
v29[v514] = v515
local v518 = v28.SHIELDER_RENTAL_TICKET
local v519 = {
    ["name"] = "Infernal Shielder Rental Ticket (3 Days)",
    ["price"] = 10,
    ["maxPurchasesPerEvent"] = 1,
    ["image"] = v10.SHIELDER_RENTAL,
    ["currency"] = v26.METEOR_SHARD
}
local v520 = {}
local v521 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.KIT_RENTAL_INFERNAL_SHIELDER
    }
}
__set_list(v520, 1, {v521})
v519.items = v520
v29[v518] = v519
local v522 = v28.PYRO_RENTAL_TICKET
local v523 = {
    ["name"] = "Pyro Rental Ticket (3 Days)",
    ["price"] = 10,
    ["maxPurchasesPerEvent"] = 1,
    ["image"] = v10.PYRO_RENTAL,
    ["currency"] = v26.METEOR_SHARD
}
local v524 = {}
local v525 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.KIT_RENTAL_PYRO
    }
}
__set_list(v524, 1, {v525})
v523.items = v524
v29[v522] = v523
local v526 = v28.METEOR_KILL_EFFECT
local v527 = {
    ["name"] = "Meteor Kill Effect",
    ["price"] = 25,
    ["maxPurchasesPerEvent"] = 1,
    ["image"] = v10.METEOR,
    ["currency"] = v26.METEOR_SHARD,
    ["items"] = {
        {
            ["killEffect"] = v18.METEOR
        }
    }
}
v29[v526] = v527
v29[v28.METEOR_BED_COIN_50] = {
    ["name"] = "Bed Coins (50)",
    ["price"] = 1,
    ["maxPurchasesPerEvent"] = 40,
    ["image"] = v10.BED_COIN_ICON,
    ["currency"] = v26.METEOR_SHARD,
    ["items"] = {
        {
            ["bedCoins"] = 50
        }
    }
}
local v528 = v28.BABY_PENGUIN_PET
local v529 = {
    ["price"] = 30,
    ["shopDisplayOrder"] = 0,
    ["name"] = v19[v20.BABY_PENGUIN].name .. " Pet",
    ["image"] = v19[v20.BABY_PENGUIN].image,
    ["currency"] = v26.PENGUIN_COIN,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.BABY_PENGUIN
        }
    }
}
v29[v528] = v529
local v530 = v28.PENGUIN_CATCHING_LUCKY_CRATE_1
local v531 = {
    ["name"] = "Lucky Crate",
    ["price"] = 5,
    ["maxPurchasesPerEvent"] = 2,
    ["shopDisplayOrder"] = 2,
    ["image"] = v23[v24.LEVEL_UP_CRATE].image,
    ["currency"] = v26.PENGUIN_COIN
}
local v532 = {}
local v533 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LEVEL_UP_CRATE
    }
}
__set_list(v532, 1, {v533})
v531.items = v532
v29[v530] = v531
local v534 = v28.PENGUIN_CATCHING_LUCKY_CRATE_2
local v535 = {
    ["name"] = "Lucky Crate",
    ["price"] = 7,
    ["maxPurchasesPerEvent"] = 2,
    ["shopDisplayOrder"] = 3,
    ["image"] = v23[v24.LEVEL_UP_CRATE].image,
    ["currency"] = v26.PENGUIN_COIN
}
local v536 = {}
local v537 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LEVEL_UP_CRATE
    }
}
__set_list(v536, 1, {v537})
v535.items = v536
v29[v534] = v535
local v538 = v28.PENGUIN_CATCHING_LUCKY_CRATE_3
local v539 = {
    ["name"] = "Lucky Crate",
    ["price"] = 9,
    ["maxPurchasesPerEvent"] = 2,
    ["shopDisplayOrder"] = 4,
    ["image"] = v23[v24.LEVEL_UP_CRATE].image,
    ["currency"] = v26.PENGUIN_COIN
}
local v540 = {}
local v541 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LEVEL_UP_CRATE
    }
}
__set_list(v540, 1, {v541})
v539.items = v540
v29[v538] = v539
v29[v28.PENGUIN_CATCHING_BED_COIN_50] = {
    ["name"] = "Bed Coins (50)",
    ["price"] = 3,
    ["maxPurchasesPerEvent"] = 40,
    ["shopDisplayOrder"] = 9,
    ["image"] = v10.BED_COIN_ICON,
    ["currency"] = v26.PENGUIN_COIN,
    ["items"] = {
        {
            ["bedCoins"] = 50
        }
    }
}
local v542 = v28.WEB_SHOOTER_LOBBY_GADGET
local v543 = {
    ["name"] = "Web Launcher Lobby Gadget",
    ["image"] = "rbxassetid://84336567156604",
    ["price"] = 30,
    ["maxPurchasesPerEvent"] = 1,
    ["shopDisplayOrder"] = 1,
    ["currency"] = v26.PENGUIN_COIN,
    ["items"] = {
        {
            ["lobbyGadget"] = v20.WEB_SHOOTER
        }
    }
}
v29[v542] = v543
local v544 = v28.FREIYA_RENTAL_TICKET
local v545 = {
    ["name"] = "Rental Ticket Freiya(3 Days)",
    ["image"] = "rbxassetid://99590202643099",
    ["price"] = 10,
    ["maxPurchasesPerEvent"] = 1,
    ["shopDisplayOrder"] = 5,
    ["currency"] = v26.PENGUIN_COIN
}
local v546 = {}
local v547 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.KIT_RENTAL_FREIYA
    }
}
__set_list(v546, 1, {v547})
v545.items = v546
v29[v544] = v545
local v548 = v28.FROSTY_RENTAL_TICKET
local v549 = {
    ["name"] = "Rental Ticket Frosty (3 Days)",
    ["image"] = "rbxassetid://121673995464093",
    ["price"] = 10,
    ["maxPurchasesPerEvent"] = 1,
    ["shopDisplayOrder"] = 6,
    ["currency"] = v26.PENGUIN_COIN
}
local v550 = {}
local v551 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.KIT_RENTAL_FROSTY
    }
}
__set_list(v550, 1, {v551})
v549.items = v550
v29[v548] = v549
local v552 = v28.YETI_RENTAL_TICKET
local v553 = {
    ["name"] = "Rental Ticket Yeti (3 Days)",
    ["image"] = "rbxassetid://136923206161648",
    ["price"] = 10,
    ["maxPurchasesPerEvent"] = 1,
    ["shopDisplayOrder"] = 7,
    ["currency"] = v26.PENGUIN_COIN
}
local v554 = {}
local v555 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.KIT_RENTAL_YETI
    }
}
__set_list(v554, 1, {v555})
v553.items = v554
v29[v552] = v553
local v556 = v28.LNY_2026_ENVELOPE
local v557 = {
    ["name"] = "Lunar New Year 2026 Envelope (Tier 1)",
    ["price"] = 5,
    ["maxPurchasesPerEvent"] = 500,
    ["shopDisplayOrder"] = 1,
    ["image"] = v10.LNY2026_FIRE_HORSE_RED_GOLD_ENVELOPE,
    ["currency"] = v26.LNY_2026_CURRENCY
}
local v558 = {}
local v559 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LNY_2026_ENVELOPE
    }
}
__set_list(v558, 1, {v559})
v557.items = v558
v29[v556] = v557
local v560 = v28.LNY_2026_ENVELOPE_2
local v561 = {
    ["name"] = "Lunar New Year 2026 Envelope (Tier 2)",
    ["price"] = 10,
    ["maxPurchasesPerEvent"] = 20,
    ["shopDisplayOrder"] = 2,
    ["image"] = v10.LNY2026_FIRE_HORSE_FULL_RED_ENVELOPE,
    ["currency"] = v26.LNY_2026_CURRENCY
}
local v562 = {}
local v563 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LNY_2026_ENVELOPE_2
    }
}
__set_list(v562, 1, {v563})
v561.items = v562
v29[v560] = v561
local v564 = v28.LNY_2026_ENVELOPE_3
local v565 = {
    ["name"] = "Lunar New Year 2026 Envelope (Tier 3)",
    ["price"] = 15,
    ["maxPurchasesPerEvent"] = 10,
    ["shopDisplayOrder"] = 3,
    ["image"] = v10.LNY2026_FIRE_HORSE_FULL_GOLD_ENVELOPE,
    ["currency"] = v26.LNY_2026_CURRENCY
}
local v566 = {}
local v567 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v5.LNY_2026_ENVELOPE_3
    }
}
__set_list(v566, 1, {v567})
v565.items = v566
v29[v564] = v565
return {
    ["EventShopItemMeta"] = v29
}