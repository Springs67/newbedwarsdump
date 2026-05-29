local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local v10 = {}
local v11 = v2.BARBARIAN
local v12 = {
    ["rewards"] = {
        {
            ["tier"] = 1,
            ["paid"] = false,
            ["emote"] = v4.KIT_MASTERY_EMOTE,
            ["task"] = {
                ["wins"] = 3
            }
        },
        {
            ["tier"] = 2,
            ["paid"] = false,
            ["emote"] = v4.RAGEBLADE_SWORDS,
            ["task"] = {
                ["kills"] = 20
            }
        },
        {
            ["tier"] = 3,
            ["paid"] = false,
            ["crate"] = v9.LEVEL_UP_CRATE,
            ["task"] = {
                ["wins"] = 10
            }
        },
        {
            ["tier"] = 4,
            ["paid"] = true,
            ["lobbyGadget"] = v6.BARBARIAN_HELMET,
            ["task"] = {
                ["kills"] = 50,
                ["wins"] = 20
            }
        },
        {
            ["tier"] = 5,
            ["paid"] = true,
            ["requiresPurchaseUnlock"] = true,
            ["emote"] = v4.BARBARIAN_ON_FIRE,
            ["task"] = {
                ["kills"] = 150
            }
        },
        {
            ["tier"] = 6,
            ["paid"] = true,
            ["requiresPurchaseUnlock"] = true,
            ["killEffect"] = v5.RAGE_BLADE,
            ["task"] = {
                ["wins"] = 40,
                ["kills"] = 300
            }
        },
        {
            ["tier"] = 7,
            ["paid"] = true,
            ["requiresPurchaseUnlock"] = true,
            ["crate"] = v9.LEVEL_UP_CRATE,
            ["task"] = {
                ["kills"] = 500,
                ["wins"] = 70
            }
        },
        {
            ["tier"] = 8,
            ["paid"] = true,
            ["requiresPurchaseUnlock"] = true,
            ["emote"] = v4.BARBARIAN_RAGEBLADE_MASTER,
            ["task"] = {
                ["kills"] = 750
            }
        },
        {
            ["tier"] = 9,
            ["paid"] = false,
            ["requiresPurchaseUnlock"] = true,
            ["title"] = v7.BARBARIAN,
            ["task"] = {
                ["wins"] = 100
            }
        },
        {
            ["tier"] = 10,
            ["paid"] = true,
            ["requiresPurchaseUnlock"] = true,
            ["winEffect"] = v8.JUGGERNAUT_BARBARIAN,
            ["task"] = {
                ["kills"] = 1500,
                ["wins"] = 150
            }
        }
    }
}
v10[v11] = v12
local v13 = v2.SPIRIT_ASSASSIN
local v14 = {
    ["kitStats"] = { "dashes", "dash kills" }
}
local v15 = {}
local v16 = {
    ["tier"] = 1,
    ["paid"] = false,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v17 = {
    ["tier"] = 2,
    ["paid"] = false,
    ["emote"] = v4.SPIRIT_ASSASSIN_DAGGER,
    ["task"] = {
        ["kills"] = 20
    }
}
local v18 = {
    ["tier"] = 3,
    ["paid"] = false,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10
    }
}
local v19 = {
    ["tier"] = 4,
    ["paid"] = true,
    ["lobbyGadget"] = v6.SPIRIT_ASSASSIN_DAGGER,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v20 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.SPIRIT_ASSASSIN_HEARTS,
    ["task"] = {
        ["kills"] = 150,
        ["dashes"] = 100,
        ["dash kills"] = 5
    }
}
local v21 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.SPIRIT_ASSASSIN,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v22 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70
    }
}
local v23 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.SPIRIT_ASSASSIN_TOP_ASSASSIN,
    ["task"] = {
        ["kills"] = 750,
        ["dashes"] = 300,
        ["dash kills"] = 15
    }
}
local v24 = {
    ["tier"] = 9,
    ["paid"] = false,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.SPIRIT_ASSASSIN,
    ["task"] = {
        ["wins"] = 100
    }
}
local v25 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["winEffect"] = v8.SPIRIT_ASSASSIN,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["dashes"] = 600,
        ["dash kills"] = 30
    }
}
__set_list(v15, 1, {v16, v17, v18, v19, v20, v21, v22, v23, v24, v25})
v14.rewards = v15
v10[v13] = v14
local v26 = v2.GRIM_REAPER
local v27 = {
    ["kitStats"] = { "souls", "damage healed" }
}
local v28 = {}
local v29 = {
    ["tier"] = 1,
    ["paid"] = false,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v30 = {
    ["tier"] = 2,
    ["paid"] = false,
    ["emote"] = v4.GRIM_REAPER_SCYTHE,
    ["task"] = {
        ["kills"] = 20
    }
}
local v31 = {
    ["tier"] = 3,
    ["paid"] = false,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10
    }
}
local v32 = {
    ["tier"] = 4,
    ["paid"] = true,
    ["lobbyGadget"] = v6.GRIM_REAPER_SCYTHE,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v33 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.GRIM_REAPER_TAUNT,
    ["task"] = {
        ["kills"] = 150,
        ["souls"] = 100,
        ["damage healed"] = 2750
    }
}
local v34 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.JUDGEMENT_DAY,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v35 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70
    }
}
local v36 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.DEAD_TO_ME,
    ["task"] = {
        ["kills"] = 750,
        ["souls"] = 200,
        ["damage healed"] = 5750
    }
}
local v37 = {
    ["tier"] = 9,
    ["paid"] = false,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.GRIM_REAPER,
    ["task"] = {
        ["wins"] = 100
    }
}
local v38 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["winEffect"] = v8.GRIM_REAPER,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["souls"] = 300,
        ["damage healed"] = 8750
    }
}
__set_list(v28, 1, {v29, v30, v31, v32, v33, v34, v35, v36, v37, v38})
v27.rewards = v28
v10[v26] = v27
local v39 = v2.DASHER
local v40 = {
    ["kitStats"] = { "dashes", "dash kills" }
}
local v41 = {}
local v42 = {
    ["tier"] = 1,
    ["paid"] = false,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v43 = {
    ["tier"] = 2,
    ["paid"] = false,
    ["emote"] = v4.YUZI_LOVE_CHU,
    ["task"] = {
        ["kills"] = 20
    }
}
local v44 = {
    ["tier"] = 3,
    ["paid"] = false,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10
    }
}
local v45 = {
    ["tier"] = 4,
    ["paid"] = true,
    ["lobbyGadget"] = v6.EMERALD_DAO,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v46 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.YUZI_SNAKE_PET,
    ["task"] = {
        ["kills"] = 150,
        ["dashes"] = 100,
        ["dash kills"] = 5
    }
}
local v47 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.YUZI_BLADE_STORM,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v48 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70
    }
}
local v49 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.YUZI_FLIP,
    ["task"] = {
        ["kills"] = 750,
        ["dashes"] = 300,
        ["dash kills"] = 15
    }
}
local v50 = {
    ["tier"] = 9,
    ["paid"] = false,
    ["title"] = v7.DASHER,
    ["task"] = {
        ["wins"] = 100
    }
}
local v51 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["winEffect"] = v8.DRAGON_RIDER,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["dashes"] = 600,
        ["dash kills"] = 30
    }
}
__set_list(v41, 1, {v42, v43, v44, v45, v46, v47, v48, v49, v50, v51})
v40.rewards = v41
v10[v39] = v40
local v52 = v2.AERY
local v53 = {
    ["kitStats"] = { "butterflies stacked" }
}
local v54 = {}
local v55 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v56 = {
    ["tier"] = 2,
    ["emote"] = v4.AERY_OUT_OF_BREATH,
    ["task"] = {
        ["kills"] = 20
    }
}
local v57 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10
    }
}
local v58 = {
    ["tier"] = 4,
    ["title"] = v7.FROST_QUEEN,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v59 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["lobbyGadget"] = v6.AERY_CROWN,
    ["task"] = {
        ["kills"] = 150,
        ["butterflies stacked"] = 200
    }
}
local v60 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.AERY_THINKING,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v61 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70
    }
}
local v62 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.BUTTERFLY_EXPLOSION,
    ["task"] = {
        ["kills"] = 750,
        ["butterflies stacked"] = 1000
    }
}
local v63 = {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.AERY,
    ["task"] = {
        ["wins"] = 100
    }
}
local v64 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["bedBreakEffect"] = v3.BUTTERFLY_EXPLOSION,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["butterflies stacked"] = 2000
    }
}
__set_list(v54, 1, {v55, v56, v57, v58, v59, v60, v61, v62, v63, v64})
v53.rewards = v54
v10[v52] = v53
local v65 = v2.BAKER
local v66 = {
    ["disabled"] = true,
    ["kitStats"] = {
        "apples consumed",
        "pies consumed",
        "golden apples consumed",
        "baguette damage"
    }
}
local v67 = {}
local v68 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v69 = {
    ["tier"] = 2,
    ["emote"] = v4.BAKER_NOOO,
    ["task"] = {
        ["kills"] = 20
    }
}
local v70 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["apples consumed"] = 50,
        ["pies consumed"] = 50
    }
}
local v71 = {
    ["tier"] = 5,
    ["lobbyGadget"] = nil,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 150,
        ["baguette damage"] = 300,
        ["golden apples consumed"] = 20
    }
}
local v72 = {
    ["tier"] = 8,
    ["killEffect"] = nil,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 750,
        ["apples consumed"] = 300,
        ["pies consumed"] = 300
    }
}
local v73 = {
    ["tier"] = 10,
    ["winEffect"] = nil,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["baguette damage"] = 1000,
        ["golden apples consumed"] = 100
    }
}
__set_list(v67, 1, {v68, v69, v70, {
    ["tier"] = 4,
    ["title"] = v7.COOK,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}, v71, {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.BAKER_BAKING,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}, {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70
    }
}, v72, {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.BAKER,
    ["task"] = {
        ["wins"] = 100
    }
}, v73})
v66.rewards = v67
v10[v65] = v66
local v74 = v2.OWL
local v75 = {
    ["kitStats"] = { "players lifted", "healing total", "owl damage" }
}
local v76 = {}
local v77 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v78 = {
    ["tier"] = 2,
    ["emote"] = v4.WHISPER_CHICKEN,
    ["task"] = {
        ["owl damage"] = 500
    }
}
local v79 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["healing total"] = 750
    }
}
local v80 = {
    ["tier"] = 4,
    ["title"] = v7.NIGHT_OWL,
    ["task"] = {
        ["wins"] = 20
    }
}
local v81 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["lobbyGadget"] = v6.OWL,
    ["task"] = {
        ["players lifted"] = 50
    }
}
local v82 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.GOOD_WHISPER,
    ["task"] = {
        ["wins"] = 40
    }
}
local v83 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 70
    }
}
local v84 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.SPIRIT_OWL,
    ["task"] = {
        ["kills"] = 750,
        ["owl damage"] = 5000
    }
}
local v85 = {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.WHISPER,
    ["task"] = {
        ["wins"] = 100
    }
}
local v86 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["winEffect"] = v8.OWL,
    ["task"] = {
        ["wins"] = 150,
        ["players lifted"] = 500,
        ["healing total"] = 50000,
        ["owl damage"] = 50000
    }
}
__set_list(v76, 1, {v77, v78, v79, v80, v81, v82, v83, v84, v85, v86})
v75.rewards = v76
v10[v74] = v75
local v87 = v2.COWGIRL
local v88 = {
    ["disabled"] = true,
    ["kitStats"] = { "players wrangled" }
}
local v89 = {}
local v90 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v91 = {
    ["tier"] = 2,
    ["emote"] = v4.LASSY_SHOCKED,
    ["task"] = {
        ["kills"] = 20
    }
}
local v92 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["players wrangled"] = 50
    }
}
local v93 = {
    ["tier"] = 4,
    ["title"] = v7.COW_GIRL,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v94 = {
    ["tier"] = 5,
    ["lobbyGadget"] = nil,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 150,
        ["players wrangled"] = 300
    }
}
local v95 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.LASSY_FAN,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v96 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70,
        ["players wrangled"] = 1000
    }
}
local v97 = {
    ["tier"] = 10,
    ["winEffect"] = nil,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["players wrangled"] = 5000
    }
}
__set_list(v89, 1, {v90, v91, v92, v93, v94, v95, v96, {
    ["tier"] = 8,
    ["killEffect"] = nil,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 750
    }
}, {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.LASSY,
    ["task"] = {
        ["wins"] = 100
    }
}, v97})
v88.rewards = v89
v10[v87] = v88
local v98 = v2.AIRBENDER
local v99 = {
    ["disabled"] = true,
    ["kitStats"] = { "sand tornado damage", "sand tornado kills" }
}
local v100 = {}
local v101 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v102 = {
    ["tier"] = 2,
    ["emote"] = v4.RAMIL_ANGRY_KITTY,
    ["task"] = {
        ["kills"] = 20
    }
}
local v103 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["players wrangled"] = 50
    }
}
local v104 = {
    ["tier"] = 4,
    ["title"] = v7.SANDBENDER,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v105 = {
    ["tier"] = 5,
    ["lobbyGadget"] = nil,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 150,
        ["players wrangled"] = 300
    }
}
local v106 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.RAMIL_SANDBENDER,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v107 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70,
        ["players wrangled"] = 1000
    }
}
local v108 = {
    ["tier"] = 10,
    ["winEffect"] = nil,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["players wrangled"] = 5000
    }
}
__set_list(v100, 1, {v101, v102, v103, v104, v105, v106, v107, {
    ["tier"] = 8,
    ["killEffect"] = nil,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 750
    }
}, {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.RAMIL,
    ["task"] = {
        ["wins"] = 100
    }
}, v108})
v99.rewards = v100
v10[v98] = v99
local v109 = v2.JELLYFISH
local v110 = {
    ["kitStats"] = { "jellyfish damage", "jellyfish kills" }
}
local v111 = {}
local v112 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v113 = {
    ["tier"] = 2,
    ["emote"] = v4.MARINA_HAPPY,
    ["task"] = {
        ["kills"] = 20
    }
}
local v114 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["jellyfish damage"] = 500
    }
}
local v115 = {
    ["tier"] = 4,
    ["title"] = v7.JELLY,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v116 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["lobbyGadget"] = v6.JELLYFISH,
    ["task"] = {
        ["kills"] = 150,
        ["jellyfish kills"] = 5
    }
}
local v117 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.MARINA_BLOW_BUBBLES,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v118 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70,
        ["jellyfish damage"] = 8000
    }
}
local v119 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.JELLYFISH,
    ["task"] = {
        ["kills"] = 750
    }
}
local v120 = {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.MARINA,
    ["task"] = {
        ["wins"] = 100
    }
}
local v121 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["bedBreakEffect"] = v3.JELLYFISH,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["jellyfish kills"] = 100
    }
}
__set_list(v111, 1, {v112, v113, v114, v115, v116, v117, v118, v119, v120, v121})
v110.rewards = v111
v10[v109] = v110
local v122 = v2.SUMMONER
local v123 = {
    ["kitStats"] = {
        "dragon damage",
        "claw damage",
        "emerald claw reached",
        "dragon kills"
    }
}
local v124 = {}
local v125 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v126 = {
    ["tier"] = 2,
    ["emote"] = v4.KAIDA_LAUGH,
    ["task"] = {
        ["kills"] = 20
    }
}
local v127 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["claw damage"] = 1000
    }
}
local v128 = {
    ["tier"] = 4,
    ["title"] = v7.DRAGON_SUMMONER,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v129 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["lobbyGadget"] = v6.DRAGON,
    ["task"] = {
        ["kills"] = 150,
        ["dragon damage"] = 1000,
        ["emerald claw reached"] = 10
    }
}
local v130 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.KAIDA_SERIOUS_SUMMON,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v131 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70,
        ["claw damage"] = 7000
    }
}
local v132 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.DRAGON_INCINERATE,
    ["task"] = {
        ["kills"] = 750
    }
}
local v133 = {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.KAIDA,
    ["task"] = {
        ["wins"] = 100
    }
}
local v134 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["bedBreakEffect"] = v3.DRAGON_INCINERATE,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["claw damage"] = 25000,
        ["dragon damage"] = 5000,
        ["emerald claw reached"] = 100
    }
}
__set_list(v124, 1, {v125, v126, v127, v128, v129, v130, v131, v132, v133, v134})
v123.rewards = v124
v10[v122] = v123
local v135 = v2.ELEKTRA
local v136 = {
    ["kitStats"] = { "player dash hits", "dashes", "dash kills" }
}
local v137 = {}
local v138 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v139 = {
    ["tier"] = 2,
    ["emote"] = v4.ELEKTRA_WRATH,
    ["task"] = {
        ["kills"] = 20
    }
}
local v140 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["player dash hits"] = 20
    }
}
local v141 = {
    ["tier"] = 4,
    ["title"] = v7.ELECTRIC,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v142 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["lobbyGadget"] = v6.ELEKTRA_CROWN,
    ["task"] = {
        ["kills"] = 150,
        ["dashes"] = 100
    }
}
local v143 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.ELEKTRA_TP,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v144 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70
    }
}
local v145 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.ELECTROCUTED,
    ["task"] = {
        ["kills"] = 750,
        ["dashes"] = 300
    }
}
local v146 = {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.ELEKTRA,
    ["task"] = {
        ["wins"] = 100
    }
}
local v147 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["bedBreakEffect"] = v3.ELECTROCUTED,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["dashes"] = 600,
        ["player dash hits"] = 300
    }
}
__set_list(v137, 1, {v138, v139, v140, v141, v142, v143, v144, v145, v146, v147})
v136.rewards = v137
v10[v135] = v136
local v148 = v2.WIND_WALKER
local v149 = {
    ["disabled"] = true,
    ["kitStats"] = { "kills at max stacks", "windstrike damage" }
}
local v150 = {}
local v151 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v152 = {
    ["tier"] = 2,
    ["emote"] = v4.MARINA_HAPPY,
    ["task"] = {
        ["kills"] = 20
    }
}
local v153 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["windstrike damage"] = 500,
        ["kills at max stacks"] = 10
    }
}
local v154 = {
    ["tier"] = 4,
    ["title"] = v7.JELLY,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v155 = {
    ["tier"] = 5,
    ["lobbyGadget"] = nil,
    ["paid"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 150,
        ["windstrike damage"] = 2500,
        ["kills at max stacks"] = 100
    }
}
local v156 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["emote"] = v4.MARINA_BLOW_BUBBLES,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v157 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70,
        ["windstrike damage"] = 10000,
        ["kills at max stacks"] = 200
    }
}
local v158 = {
    ["tier"] = 10,
    ["winEffect"] = nil,
    ["paid"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["windstrike damage"] = 25000,
        ["kills at max stacks"] = 400
    }
}
__set_list(v150, 1, {v151, v152, v153, v154, v155, v156, v157, {
    ["tier"] = 8,
    ["killEffect"] = nil,
    ["paid"] = true,
    ["comingSoonReward"] = {
        ["text"] = "Coming soon"
    },
    ["task"] = {
        ["kills"] = 750
    }
}, {
    ["tier"] = 9,
    ["paid"] = true,
    ["title"] = v7.MARINA,
    ["task"] = {
        ["wins"] = 100
    }
}, v158})
v149.rewards = v150
v10[v148] = v149
local v159 = v2.MIMIC
local v160 = {
    ["kitStats"] = { "seconds hidden", "resources stolen" }
}
local v161 = {}
local v162 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v163 = {
    ["tier"] = 2,
    ["emote"] = v4.MILO_HELLO,
    ["task"] = {
        ["kills"] = 20
    }
}
local v164 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["seconds hidden"] = 600
    }
}
local v165 = {
    ["tier"] = 4,
    ["title"] = v7.HIDDEN,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v166 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["lobbyGadget"] = v6.CHAMELEON,
    ["task"] = {
        ["kills"] = 150,
        ["resources stolen"] = 500
    }
}
local v167 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.MILO_YIPPEE,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v168 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70,
        ["seconds hidden"] = 3000
    }
}
local v169 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.BLOCK_TRANSFORMATION,
    ["task"] = {
        ["kills"] = 750
    }
}
local v170 = {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.MILO,
    ["task"] = {
        ["wins"] = 100
    }
}
local v171 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["winEffect"] = v8.MEGA_BLOCK,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["seconds hidden"] = 10000,
        ["resources stolen"] = 3000
    }
}
__set_list(v161, 1, {v162, v163, v164, v165, v166, v167, v168, v169, v170, v171})
v160.rewards = v161
v10[v159] = v160
local v172 = v2.FROSTY_HAMMER
local v173 = {
    ["kitStats"] = { "crystals collected", "frosty hammer upgrades", "max upgrades reached" }
}
local v174 = {}
local v175 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v176 = {
    ["tier"] = 2,
    ["emote"] = v4.ADETUNDE_ANNOYED,
    ["task"] = {
        ["kills"] = 20
    }
}
local v177 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["crystals collected"] = 100
    }
}
local v178 = {
    ["tier"] = 4,
    ["title"] = v7.ICE_KING,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v179 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["lobbyGadget"] = v6.ADETUNDE_CROWN,
    ["task"] = {
        ["kills"] = 150,
        ["frosty hammer upgrades"] = 40
    }
}
local v180 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.ADETUNDE_COLD,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v181 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70,
        ["max upgrades reached"] = 40
    }
}
local v182 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.FROZEN,
    ["task"] = {
        ["kills"] = 750
    }
}
local v183 = {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["title"] = v7.ADETUNDE,
    ["task"] = {
        ["wins"] = 100,
        ["crystals collected"] = 1500
    }
}
local v184 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["bedBreakEffect"] = v3.FROZEN,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["crystals collected"] = 4000,
        ["frosty hammer upgrades"] = 400,
        ["max upgrades reached"] = 100
    }
}
__set_list(v174, 1, {v175, v176, v177, v178, v179, v180, v181, v182, v183, v184})
v173.rewards = v174
v10[v172] = v173
local v185 = v2.VOID_KNIGHT
local v186 = {
    ["kitStats"] = { "resource consumed", "void knight upgrades", "void knight max upgrades reached" }
}
local v187 = {}
local v188 = {
    ["tier"] = 1,
    ["emote"] = v4.KIT_MASTERY_EMOTE,
    ["task"] = {
        ["wins"] = 3
    }
}
local v189 = {
    ["tier"] = 2,
    ["emote"] = v4.VOID_KNIGHT,
    ["task"] = {
        ["kills"] = 20
    }
}
local v190 = {
    ["tier"] = 3,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["wins"] = 10,
        ["resource consumed"] = 300
    }
}
local v191 = {
    ["tier"] = 4,
    ["title"] = v7.THE_VOID_BRINGER,
    ["task"] = {
        ["kills"] = 50,
        ["wins"] = 20
    }
}
local v192 = {
    ["tier"] = 5,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["lobbyGadget"] = v6.VOID_KNIGHT_SWORD,
    ["task"] = {
        ["kills"] = 150,
        ["void knight max upgrades reached"] = 30
    }
}
local v193 = {
    ["tier"] = 6,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["emote"] = v4.VOID_HUNTER_ABSORB,
    ["task"] = {
        ["wins"] = 40,
        ["kills"] = 300
    }
}
local v194 = {
    ["tier"] = 7,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["crate"] = v9.LEVEL_UP_CRATE,
    ["task"] = {
        ["kills"] = 500,
        ["wins"] = 70,
        ["void knight max upgrades reached"] = 40
    }
}
local v195 = {
    ["tier"] = 8,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["killEffect"] = v5.VOID_KNIGHT,
    ["task"] = {
        ["kills"] = 750
    }
}
local v196 = {
    ["tier"] = 9,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["bedBreakEffect"] = v3.VOID_CREATURES,
    ["task"] = {
        ["wins"] = 100,
        ["resource consumed"] = 4000
    }
}
local v197 = {
    ["tier"] = 10,
    ["paid"] = true,
    ["requiresPurchaseUnlock"] = true,
    ["lobbyGadget"] = v6.VOID_KNIGHT_ARMOR,
    ["task"] = {
        ["kills"] = 1500,
        ["wins"] = 150,
        ["resource consumed"] = 8000,
        ["void knight upgrades"] = 300,
        ["void knight max upgrades reached"] = 80
    }
}
__set_list(v187, 1, {v188, v189, v190, v191, v192, v193, v194, v195, v196, v197})
v186.rewards = v187
v10[v185] = v186
return {
    ["KitContractRewards"] = v10
}