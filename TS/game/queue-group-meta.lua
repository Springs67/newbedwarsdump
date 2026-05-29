local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-type").QueueGroupType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
setmetatable({}, {
    ["__index"] = {}
})
local u9 = {}
local v10 = v6.BEDWARS_CLASSIC
local v11 = {
    ["title"] = "CLASSIC",
    ["description"] = "\240\159\155\140 Protect your base. Once it\'s gone, you can no longer respawn!\n\240\159\146\142 Gather resources to purchase items and team upgrades\n\240\159\143\185 Destroy enemy beds and eliminate players to win the game!",
    ["queues"] = {
        v8.BEDWARS_TO4,
        v8.BEDWARS_TO2,
        v8.BEDWARS_TO1,
        v8.BEDWARS_5v5,
        v8.BEDWARS_20v20,
        v8.BEDWARS_16v16,
        v8.BEDWARS_VOICE_CHAT
    },
    ["helperIcons"] = {
        ["text"] = {
            { "\240\159\148\165", "Popular" }
        }
    },
    ["npcDisplay"] = {
        ["title"] = "\226\154\148\239\184\143 BedWars Classic",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">POPULAR!!</font>"
    }
}
u9[v10] = v11
local v12 = v6.BEDWARS_LUCKY_BLOCK
local v13 = {
    ["title"] = "LUCKY BLOCK",
    ["description"] = "\226\156\168 Break lucky blocks for a chance at surprising rewards and sometimes deadly encounters.\n\240\159\170\130 Look out for Lucky Air Drops that periodically fall from the sky for a better chance of high-tier rewards.",
    ["queues"] = { v8.BEDWARS_LUCKY_BLOCK, v8.BEDWARS_LUCKY_BLOCK_TO2 },
    ["npcDisplay"] = {
        ["title"] = "\226\156\168 Lucky Block",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">FUN!</font>"
    }
}
u9[v12] = v13
u9[v6.ARCADE] = {
    ["title"] = "ARCADE",
    ["description"] = "\240\159\155\140 Fast pace modes!\n",
    ["queues"] = {
        v8.SKYWARS_TO2,
        v8.BLOCK_HUNT,
        v8.ROYALE,
        v8.BATTLE_ROYALE,
        v8.GUN_GAME,
        v8.INFECTED,
        v8.BEDWARS_NB4,
        v8.BEDWARS_OG_TO4,
        v8.SKULL_DROP,
        v8.HYPER_GEN_TO4,
        v8.COMBINED_KIT_TO4,
        v8.BRIDGE_DUEL,
        v8.BRIDGE_DUEL_TO2,
        v8.BEDWARS_DUELS,
        v8.WINSTREAK_1v1,
        v8.CUSTOM_KIT,
        v8.CUSTOM_KIT_CREATION,
        v8.MINE_WARS,
        v8.OVERPOWERED
    }
}
u9[v6.SKY_WARS] = {
    ["title"] = "SKY WARS",
    ["subtitle"] = "Teams of 2 ",
    ["queues"] = { v8.SKYWARS_TO4, v8.SKYWARS_TO2 }
}
u9[v6.RANKED] = {
    ["title"] = "RANKED",
    ["subtitle"] = "5v5 ",
    ["queues"] = { v4.activeRankMeta.queueType }
}
local v14 = v6.LUCKYBLOCK_ONEBLOCK
local v15 = {
    ["title"] = "LB ONEBLOCK",
    ["subtitle"] = "SOLOS",
    ["description"] = "\226\156\168 Fastpaced LTM that merges BedWars, Lucky Block, and One Block into a single mode\n",
    ["queues"] = { v8.LB_ONEBLOCK },
    ["npcDisplay"] = {
        ["title"] = "\226\156\168 LB Oneblock",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">ONE BLOCK</font>"
    }
}
u9[v14] = v15
local v16 = v6.LUCKYBLOCK_ONEBLOCK_TO2
local v17 = {
    ["title"] = "LB ONEBLOCK",
    ["subtitle"] = "DOUBLES",
    ["description"] = "\226\156\168 Fastpaced LTM that merges BedWars, Lucky Block, and One Block into a single mode\n",
    ["queues"] = { v8.LB_ONEBLOCK_TO2 },
    ["npcDisplay"] = {
        ["title"] = "\226\156\168 LB Oneblock",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">ONE BLOCK</font>"
    }
}
u9[v16] = v17
local v18 = v6.GUN_GAME
local v19 = {
    ["title"] = "GUN GAME",
    ["subtitle"] = "FFA",
    ["description"] = "\240\159\143\142\239\184\143 Race against your enemies through a series of weapons in this fast paced FFA mode. \n\240\159\151\161\239\184\143 Each kill grants you a new weapon.  Be the first player to progress through all 15 weapons to win!\n",
    ["queues"] = { v8.GUN_GAME },
    ["npcDisplay"] = {
        ["title"] = "GUN GAME",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">FFA LTM</font>"
    }
}
u9[v18] = v19
local v20 = v6.CTF
local v21 = {
    ["title"] = "CTF"
}
local v22 = v7[v8.FLAG_CAPTURE].teams[1].maxPlayers
v21.subtitle = "Teams of " .. tostring(v22)
v21.queues = { v8.FLAG_CAPTURE }
u9[v20] = v21
u9[v6.HALLOWEEN] = {
    ["title"] = "CRYPT\'S COVEN",
    ["subtitle"] = "EVENT",
    ["queues"] = { v8.HALLOWEEN_EVENT }
}
u9[v6.INFECTED] = {
    ["title"] = "INFECTED",
    ["subtitle"] = "SURVIVE",
    ["queues"] = { v8.INFECTED }
}
u9[v6.JUGGERNAUT_V2] = {
    ["title"] = "JUGGERNAUT",
    ["subtitle"] = "RAGE",
    ["queues"] = { v8.JUGGERNAUT_V2 }
}
u9[v6.MURDERER_GAME] = {
    ["subtitle"] = "MURDER",
    ["title"] = v3.GAME_NAME,
    ["queues"] = { v8.MURDER_GAME, v8.MURDER_GAME_VC }
}
u9[v6.WINTER] = {
    ["title"] = "MINIGAME MOUNTAIN",
    ["subtitle"] = "MINIGAMES",
    ["queues"] = { v8.WINTER_EVENT }
}
u9[v6.BLOCK_HUNT] = {
    ["title"] = "BLOCK HUNT",
    ["subtitle"] = "HIDE AND SEEK",
    ["description"] = "\240\159\167\144 Blend in as a block or hunt down hidden players!\n\226\143\178\239\184\143 Survive until the end of the game or eliminate all hiders to win!",
    ["queues"] = { v8.BLOCK_HUNT }
}
local v23 = v6.EGG_HUNT
local v24 = {
    ["title"] = "EGG HUNT",
    ["subtitle"] = "THE HUNT CHALLENGE",
    ["description"] = "\240\159\170\186 Collect eggs around the map and bring them back to your nest!\n\240\159\165\154 Eliminate other players to steal their eggs! First to 100 eggs wins!",
    ["queues"] = { v8.EGG_HUNT },
    ["npcDisplay"] = {
        ["title"] = "\240\159\165\154 EGG HUNT",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">THE HUNT CHALLENGE</font>"
    }
}
u9[v23] = v24
local v25 = v6.SKULL_DROP
local v26 = {
    ["title"] = "SKULL DROP",
    ["subtitle"] = "FFA PVP",
    ["description"] = "\240\159\155\140 Kill players to drop their skulls!\n\240\159\146\142 Turn in skulls at designated drop points, first to 20 wins!\n",
    ["queues"] = { v8.SKULL_DROP },
    ["npcDisplay"] = {
        ["title"] = "\240\159\146\128 SKULL DROP",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">\226\154\148\239\184\143 FFA PVP</font>"
    }
}
u9[v25] = v26
local v27 = v6.SKYWARS_ROYALE
local v28 = {
    ["title"] = "SW ROYALE ",
    ["subtitle"] = "TRIOS",
    ["description"] = "\240\159\142\174 72 players. Teams of 3.\n\240\159\143\134 Win this Skywars variant to unlock the Royale badge!",
    ["queues"] = { v8.SKYWARS_ROYALE },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    },
    ["npcDisplay"] = {
        ["title"] = "\226\143\176 SKYWARS ROYALE",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">TRIOS</font>"
    }
}
u9[v27] = v28
local v29 = v6.BED_ROYALE
local v30 = {
    ["title"] = "Bed Royale ",
    ["subtitle"] = "Doubles",
    ["queues"] = { v8.BEDWARS_MEGA },
    ["npcDisplay"] = {
        ["title"] = "\226\143\176 BED ROYALE",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">48 PLAYERS</font>"
    }
}
u9[v29] = v30
local v31 = v6.HYPER_GEN
local v32 = {
    ["title"] = "HYPER GEN",
    ["subtitle"] = "SQUADS",
    ["description"] = "\240\159\164\157 BedWars squads but faster\n\240\159\146\142 3x generator speed & forge experience\n\240\159\140\159 Extreme team upgrades",
    ["queues"] = { v8.HYPER_GEN_TO4 },
    ["npcDisplay"] = {
        ["title"] = "\240\159\146\142 HYPER GEN",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">SQUADS</font>"
    }
}
u9[v31] = v32
local v33 = v6.ALL_SAME_KIT
local v34 = {
    ["title"] = "ALL SAME KIT",
    ["subtitle"] = "SQUADS",
    ["description"] = "\240\159\164\157 Everyone plays the same kit\n\240\159\140\159 The kit rotates every hour",
    ["queues"] = { v8.ALL_SAME_KIT_TO4 },
    ["npcDisplay"] = {
        ["title"] = "\226\154\148\239\184\143 ALL SAME KIT",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">SQUADS</font>"
    }
}
u9[v33] = v34
u9[v6.OG_BEDWARS] = {
    ["title"] = "OG BEDWARS",
    ["subtitle"] = "SQUADS",
    ["description"] = "No kits, no season mechanics, old maps, og feel",
    ["queues"] = { v8.BEDWARS_OG_TO4 }
}
u9[v6.NO_BUILD_BEDWARS] = {
    ["title"] = "NO BUILD",
    ["subtitle"] = "SQUADS",
    ["description"] = "BedWars but no building!",
    ["queues"] = { v8.BEDWARS_NB4 }
}
u9[v6.TNT_WARS] = {
    ["title"] = "TNT WARS",
    ["subtitle"] = "LTM",
    ["description"] = "",
    ["queues"] = { v8.TNT_WARS }
}
u9[v6.BRIDGE_DUEL] = {
    ["title"] = "BRIDGE BATTLE",
    ["subtitle"] = "1v1",
    ["description"] = "\240\159\140\137 Conquer the bridge, clash with your opponent, and score touchdowns in their base to emerge victorious!",
    ["queues"] = { v8.BRIDGE_DUEL }
}
u9[v6.BRIDGE_DUEL_TO2] = {
    ["title"] = "BRIDGE BATTLE",
    ["subtitle"] = "2v2",
    ["description"] = "\240\159\140\137 Conquer the bridge, clash with your opponents, and score touchdowns in their base to emerge victorious!",
    ["queues"] = { v8.BRIDGE_DUEL_TO2 }
}
local v35 = v6.ONE_IN_THE_CHAMBER
local v36 = {
    ["title"] = "ONE IN THE CHAMBER ",
    ["subtitle"] = "LTM",
    ["description"] = "\240\159\146\175 Kill players to score points!\n\240\159\143\185 Each kill gives you an extra arrow, first to 30 wins!\n",
    ["queues"] = { v8.ONE_IN_THE_CHAMBER },
    ["npcDisplay"] = {
        ["title"] = "\240\159\143\185 ONE IN THE CHAMBER",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">\226\154\148\239\184\143 FFA PVP</font>"
    }
}
u9[v35] = v36
local v37 = v6.DOMINATION
local v38 = {
    ["title"] = "Domination",
    ["subtitle"] = "LTM",
    ["description"] = "\240\159\146\175 Kill and Capture objectives to get Points!\nFirst to 2500 wins!\n",
    ["queues"] = { v8.CAPTURE_POINTS },
    ["npcDisplay"] = {
        ["title"] = "Domination",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">\226\154\148\239\184\143Group PVP</font>"
    }
}
u9[v37] = v38
local v39 = v6.LASSO_WARS
local v40 = {
    ["title"] = "Lasso Wars",
    ["subtitle"] = "LTM",
    ["description"] = "\240\159\164\160 Yeehaw! Use your lasso to yoink your team to victory.\nFirst team to 50 kills wins!",
    ["queues"] = { v8.LASSO_WARS },
    ["npcDisplay"] = {
        ["title"] = "\240\159\164\160 Lasso Wars",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">\226\154\148\239\184\143Group PVP</font>"
    }
}
u9[v39] = v40
local v41 = v6.HOT_POTATO
local v42 = {
    ["title"] = "Hot Potato",
    ["subtitle"] = "LTM",
    ["description"] = "\240\159\165\148 Players scramble to pass a ticking potato bomb to opponents before it explodes.\nBe the last two standing to win!",
    ["queues"] = { v8.HOT_POTATO },
    ["npcDisplay"] = {
        ["title"] = "\240\159\165\148 Hot Potato",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">FFA</font>"
    }
}
u9[v41] = v42
local v43 = v6.SURVIVAL
local v44 = {
    ["title"] = "Penguin Survival",
    ["subtitle"] = "Roblox Classic",
    ["queues"] = { v8.SURVIVAL },
    ["npcDisplay"] = {
        ["title"] = "Penguin Survival (Roblox Classic)",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">EVENT</font>"
    }
}
u9[v43] = v44
local v45 = v6.PVP_ARENA
local v46 = {
    ["title"] = "Arena Duels",
    ["subtitle"] = "NO KITS",
    ["queues"] = { v8.PVP_ARENA },
    ["helperIcons"] = {
        ["text"] = {
            { "\226\143\176", "Limited Time Mode" }
        }
    }
}
u9[v45] = v46
u9[v6.PVP_ARENA_SOLO] = {
    ["title"] = "Arena Solos",
    ["subtitle"] = "NO KITS",
    ["queues"] = { v8.PVP_ARENA_SOLO }
}
local v47 = v6.FAST_CASUAL
local v48 = {
    ["title"] = "Quick Play",
    ["subtitle"] = "LTM",
    ["description"] = "\240\159\143\131\226\128\141\226\153\130\239\184\143 Play a fast, simplified, more casual-friendly mode with streamlined game mechanics.",
    ["queues"] = { v8.FAST_CASUAL },
    ["npcDisplay"] = {
        ["title"] = "\240\159\143\131\226\128\141\226\153\130\239\184\143 Quick Play",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">\226\154\148\239\184\143Group PVP</font>"
    }
}
u9[v47] = v48
local v49 = v6.BATTLE_ROYALE
local v50 = {
    ["title"] = "Battle Royale",
    ["subtitle"] = "TRIOS",
    ["queues"] = { v8.BATTLE_ROYALE },
    ["npcDisplay"] = {
        ["title"] = "\240\159\143\131\226\128\141\226\153\130\239\184\143 Battle Royale",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">TRIOS</font>"
    }
}
u9[v49] = v50
u9[v6.HALLOWEEN_2024] = {
    ["title"] = "Arachne\'s Lair",
    ["subtitle"] = "EVENT",
    ["queues"] = { v8.HALLOWEEN_2024_EVENT }
}
u9[v6.DUELS] = {
    ["title"] = "DUELS",
    ["queues"] = { v8.BEDWARS_DUELS, v8.WINSTREAK_1v1 }
}
u9[v6.DISASTERS] = {
    ["title"] = "Disasters",
    ["subtitle"] = "LTM",
    ["queues"] = { v8.BEDWARS_DISASTERS_TO4 }
}
local v51 = v6.COMBINED_KIT
local v52 = {
    ["title"] = "Kit Fusion",
    ["subtitle"] = "LTM",
    ["description"] = "",
    ["queues"] = { v8.COMBINED_KIT_TO4 },
    ["npcDisplay"] = {
        ["title"] = "Kit Fusion",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">\226\154\148\239\184\143Group PVP</font>"
    }
}
u9[v51] = v52
u9[v6.CUSTOM_KIT] = {
    ["title"] = "Custom Kit",
    ["queues"] = { v8.CUSTOM_KIT, v8.CUSTOM_KIT_CREATION }
}
local v53 = v6.OVERPOWERED
local v54 = {
    ["title"] = "Hyper Kits",
    ["subtitle"] = "LTM",
    ["description"] = "\240\159\146\170 Everything is fast, overpowered, and chaotic!",
    ["queues"] = { v8.OVERPOWERED },
    ["npcDisplay"] = {
        ["title"] = "Hyper Kits",
        ["subtitle"] = "<font color=\"" .. v2.richTextColor(v5.mcGreen) .. "\">\226\154\148\239\184\143Group PVP</font>"
    }
}
u9[v53] = v54
return {
    ["getQueueGroupMeta"] = function(p55) --[[ Name: getQueueGroupMeta, Line 333 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        return u9[p55]
    end,
    ["QueueGroupMeta"] = u9
}