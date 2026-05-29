local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "timer-util").TimerUtil
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-category").AchievementCategory
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-constants")
local v9 = v8.AchievementConstants
local v10 = v8.AchievementImageId
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-rank").AchievementRank
local v13 = {}
local v14 = v11.MULTIKILLCHAIN_1
local v17 = {
    ["title"] = "Multikiller I",
    ["description"] = function(p15) --[[ Name: description, Line 17 ]]
        return "Achieve a multikill chain of " .. tostring(p15) .. " or higher"
    end,
    ["icon"] = {
        ["image"] = v10.MULTIKILLER
    },
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "highestMultiKillChain"
    },
    ["goal"] = {
        ["value"] = 3
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["rewards"] = {
        {
            ["bedCoins"] = 250
        }
    },
    ["progressString"] = function(p16) --[[ Name: progressString, Line 35 ]]
        return "Highest multikill chain: " .. tostring(p16)
    end
}
v13[v14] = v17
local v18 = v11.MULTIKILLCHAIN_2
local v21 = {
    ["title"] = "Multikiller II",
    ["description"] = function(p19) --[[ Name: description, Line 41 ]]
        return "Achieve a multikill chain of " .. tostring(p19) .. " or higher"
    end,
    ["icon"] = {
        ["image"] = v10.MULTIKILLER
    },
    ["rank"] = v12.EPIC,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "highestMultiKillChain"
    },
    ["goal"] = {
        ["value"] = 5
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["rewards"] = {
        {
            ["crate"] = v5.LEVEL_UP_CRATE
        }
    },
    ["progressString"] = function(p20) --[[ Name: progressString, Line 59 ]]
        return "Highest multikill chain: " .. tostring(p20)
    end
}
v13[v18] = v21
local v22 = v11.MULTIKILLCHAIN_3
local v25 = {
    ["title"] = "Multikiller III",
    ["description"] = function(p23) --[[ Name: description, Line 65 ]]
        return "Achieve a multikill chain of " .. tostring(p23) .. " or higher"
    end,
    ["icon"] = {
        ["image"] = v10.MULTIKILLER
    },
    ["rank"] = v12.LEGENDARY,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "highestMultiKillChain"
    },
    ["goal"] = {
        ["value"] = 10
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["rewards"] = {
        {
            ["crate"] = v5.DIAMOND_LUCKY_CRATE
        }
    },
    ["progressString"] = function(p24) --[[ Name: progressString, Line 83 ]]
        return "Highest multikill chain: " .. tostring(p24)
    end
}
v13[v22] = v25
local v26 = v11.WRATH_1
local v29 = {
    ["title"] = "Wrath I",
    ["description"] = function(p27) --[[ Name: description, Line 89 ]]
        return "Get " .. tostring(p27) .. " or more kills in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.WRATH
    },
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "playerKillsRecord"
    },
    ["goal"] = {
        ["value"] = 10
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["progressString"] = function(p28) --[[ Name: progressString, Line 104 ]]
        return "Current record: " .. tostring(p28)
    end,
    ["rewards"] = {
        {
            ["bedCoins"] = 250
        }
    }
}
v13[v26] = v29
local v30 = v11.WRATH_2
local v33 = {
    ["title"] = "Wrath II",
    ["description"] = function(p31) --[[ Name: description, Line 113 ]]
        return "Get " .. tostring(p31) .. " or more kills in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.WRATH
    },
    ["rank"] = v12.EPIC,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "playerKillsRecord"
    },
    ["goal"] = {
        ["value"] = 25
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["rewards"] = {
        {
            ["crate"] = v5.LEVEL_UP_CRATE
        }
    },
    ["progressString"] = function(p32) --[[ Name: progressString, Line 131 ]]
        return "Current record: " .. tostring(p32)
    end
}
v13[v30] = v33
local v34 = v11.WRATH_3
local v37 = {
    ["title"] = "Wrath III",
    ["description"] = function(p35) --[[ Name: description, Line 137 ]]
        return "Get " .. tostring(p35) .. " or more kills in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.WRATH
    },
    ["rank"] = v12.LEGENDARY,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "playerKillsRecord"
    },
    ["goal"] = {
        ["value"] = 50
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["rewards"] = {
        {
            ["crate"] = v5.DIAMOND_LUCKY_CRATE
        }
    },
    ["progressString"] = function(p36) --[[ Name: progressString, Line 155 ]]
        return "Current record: " .. tostring(p36)
    end
}
v13[v34] = v37
local v38 = v11.EXECUTIONER_1
local v39 = {
    ["title"] = "Executioner I",
    ["description"] = function(_) --[[ Name: description, Line 161 ]]
        return "Get a final kill"
    end,
    ["icon"] = {
        ["image"] = v10.EXECUTIONER
    },
    ["rank"] = v12.COMMON,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "finalKillsRecord"
    },
    ["goal"] = {
        ["value"] = 1
    },
    ["games"] = { v3.BEDWARS },
    ["rewards"] = {
        {
            ["bedCoins"] = 250
        }
    }
}
v13[v38] = v39
local v40 = v11.EXECUTIONER_2
local v43 = {
    ["title"] = "Executioner II",
    ["description"] = function(p41) --[[ Name: description, Line 182 ]]
        return "Get " .. tostring(p41) .. " final kills in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.EXECUTIONER
    },
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "finalKillsRecord"
    },
    ["goal"] = {
        ["value"] = 3
    },
    ["games"] = { v3.BEDWARS },
    ["progressString"] = function(p42) --[[ Name: progressString, Line 197 ]]
        return "Current record: " .. tostring(p42)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.LEVEL_UP_CRATE
        }
    }
}
v13[v40] = v43
local v44 = v11.EXECUTIONER_3
local v47 = {
    ["title"] = "Executioner III",
    ["description"] = function(p45) --[[ Name: description, Line 206 ]]
        return "Get " .. tostring(p45) .. " final kills in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.EXECUTIONER
    },
    ["rank"] = v12.EPIC,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "finalKillsRecord"
    },
    ["goal"] = {
        ["value"] = 5
    },
    ["games"] = { v3.BEDWARS },
    ["progressString"] = function(p46) --[[ Name: progressString, Line 221 ]]
        return "Current record: " .. tostring(p46)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.DIAMOND_LUCKY_CRATE
        }
    }
}
v13[v44] = v47
v13[v11.GUNGAME_TOP_5] = {
    ["title"] = "Gun Game Top 5",
    ["description"] = function(p48) --[[ Name: description, Line 230 ]]
        return "Rank top " .. tostring(p48) .. " in gun game"
    end,
    ["icon"] = {
        ["image"] = "rbxassetid://120574767106886",
        ["full"] = true
    },
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "topPlacement",
        ["extra"] = "gunGame"
    },
    ["goal"] = {
        ["value"] = 5,
        ["inverted"] = true
    },
    ["progressString"] = function(p49) --[[ Name: progressString, Line 247 ]]
        local v50 = p49 == -1 and "N/A" or p49
        return "Highest placement: " .. tostring(v50)
    end,
    ["rewards"] = {
        {
            ["bedCoins"] = 250
        }
    },
    ["games"] = { v3.GUN_GAME }
}
local v51 = v11.GUNGAME_TOP_1
local v55 = {
    ["title"] = "Gun Game #1",
    ["description"] = function(p52) --[[ Name: description, Line 257 ]]
        return "Rank #" .. tostring(p52) .. " in gun game"
    end,
    ["icon"] = {
        ["image"] = "rbxassetid://93829221559102",
        ["full"] = true
    },
    ["rank"] = v12.EPIC,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "topPlacement",
        ["extra"] = "gunGame"
    },
    ["goal"] = {
        ["value"] = 1,
        ["inverted"] = true
    },
    ["progressString"] = function(p53) --[[ Name: progressString, Line 274 ]]
        local v54 = p53 == -1 and "N/A" or p53
        return "Highest placement: " .. tostring(v54)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.LEVEL_UP_CRATE
        }
    },
    ["games"] = { v3.GUN_GAME }
}
v13[v51] = v55
v13[v11.BEDWARS_NO_ARMOR] = {
    ["title"] = "Glass Cannon",
    ["description"] = function() --[[ Name: description, Line 284 ]]
        return "Win a Bedwars match without buying armor"
    end,
    ["rank"] = v12.EPIC,
    ["details"] = v9.CUSTOM_ARMOR_KITS_INVALID,
    ["games"] = { v3.BEDWARS },
    ["category"] = v7.CHALLENGE,
    ["icon"] = {
        ["image"] = "rbxassetid://131867933999376",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO4_NO_ARMOR] = {
    ["title"] = "Glass Cannon (Squads)",
    ["description"] = function() --[[ Name: description, Line 298 ]]
        return "Win a Bedwars Squads match without buying armor"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_ARMOR_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO4 },
    ["icon"] = {
        ["image"] = "rbxassetid://131867933999376",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO2_NO_ARMOR] = {
    ["title"] = "Glass Cannon (Doubles)",
    ["description"] = function() --[[ Name: description, Line 312 ]]
        return "Win a Bedwars Doubles match without buying armor"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_ARMOR_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO2 },
    ["icon"] = {
        ["image"] = "rbxassetid://131867933999376",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO1_NO_ARMOR] = {
    ["title"] = "Glass Cannon (Solos)",
    ["description"] = function() --[[ Name: description, Line 326 ]]
        return "Win a Bedwars Solos match without buying armor"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_ARMOR_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO1 },
    ["icon"] = {
        ["image"] = "rbxassetid://131867933999376",
        ["full"] = true
    }
}
v13[v11.BEDWARS_5V5_NO_ARMOR] = {
    ["title"] = "Glass Cannon (5v5)",
    ["description"] = function() --[[ Name: description, Line 340 ]]
        return "Win a Bedwars 5v5 match without buying armor"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_ARMOR_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_5v5 },
    ["icon"] = {
        ["image"] = "rbxassetid://131867933999376",
        ["full"] = true
    }
}
v13[v11.BEDWARS_DUELS_NO_ARMOR] = {
    ["title"] = "Glass Cannon (Duels)",
    ["description"] = function() --[[ Name: description, Line 354 ]]
        return "Win a Bedwars Duels match without buying armor"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_ARMOR_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_DUELS },
    ["icon"] = {
        ["image"] = "rbxassetid://131867933999376",
        ["full"] = true
    }
}
v13[v11.BEDWARS_LB_NO_ARMOR] = {
    ["title"] = "Glass Cannon (Lucky Block)",
    ["description"] = function() --[[ Name: description, Line 368 ]]
        return "Win a Bedwars Lucky Block match without buying armor"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_ARMOR_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_LUCKY_BLOCK },
    ["icon"] = {
        ["image"] = "rbxassetid://131867933999376",
        ["full"] = true
    }
}
v13[v11.BEDWARS_NO_SWORD] = {
    ["title"] = "Death by a Thousand Cuts",
    ["description"] = function() --[[ Name: description, Line 382 ]]
        return "Win a Bedwars match without upgrading your sword"
    end,
    ["rank"] = v12.EPIC,
    ["details"] = v9.CUSTOM_MELEE_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["games"] = { v3.BEDWARS },
    ["icon"] = {
        ["image"] = "rbxassetid://95747959763675",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO4_NO_SWORD] = {
    ["title"] = "Death by a Thousand Cuts (Squads)",
    ["description"] = function() --[[ Name: description, Line 396 ]]
        return "Win a Bedwars Squads match without upgrading your sword"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_MELEE_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO4 },
    ["icon"] = {
        ["image"] = "rbxassetid://95747959763675",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO2_NO_SWORD] = {
    ["title"] = "Death by a Thousand Cuts (Doubles)",
    ["description"] = function() --[[ Name: description, Line 410 ]]
        return "Win a Bedwars Doubles match without upgrading your sword"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_MELEE_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO2 },
    ["icon"] = {
        ["image"] = "rbxassetid://95747959763675",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO1_NO_SWORD] = {
    ["title"] = "Death by a Thousand Cuts (Solos)",
    ["description"] = function() --[[ Name: description, Line 424 ]]
        return "Win a Bedwars Solos match without upgrading your sword"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_MELEE_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO1 },
    ["icon"] = {
        ["image"] = "rbxassetid://95747959763675",
        ["full"] = true
    }
}
v13[v11.BEDWARS_5V5_NO_SWORD] = {
    ["title"] = "Death by a Thousand Cuts (5v5)",
    ["description"] = function() --[[ Name: description, Line 438 ]]
        return "Win a Bedwars 5v5 match without upgrading your sword"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_MELEE_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_5v5 },
    ["icon"] = {
        ["image"] = "rbxassetid://95747959763675",
        ["full"] = true
    }
}
v13[v11.BEDWARS_DUELS_NO_SWORD] = {
    ["title"] = "Death by a Thousand Cuts (Duels)",
    ["description"] = function() --[[ Name: description, Line 452 ]]
        return "Win a Bedwars Duels match without upgrading your sword"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_MELEE_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_DUELS },
    ["icon"] = {
        ["image"] = "rbxassetid://95747959763675",
        ["full"] = true
    }
}
v13[v11.BEDWARS_LB_NO_SWORD] = {
    ["title"] = "Death by a Thousand Cuts (Lucky Block)",
    ["description"] = function() --[[ Name: description, Line 466 ]]
        return "Win a Bedwars Lucky Block match without upgrading your sword"
    end,
    ["rank"] = v12.RARE,
    ["details"] = v9.CUSTOM_MELEE_KITS_INVALID,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_LUCKY_BLOCK },
    ["icon"] = {
        ["image"] = "rbxassetid://95747959763675",
        ["full"] = true
    }
}
v13[v11.BEDWARS_NO_DEATHS] = {
    ["title"] = "Immortal",
    ["description"] = function() --[[ Name: description, Line 480 ]]
        return "Win a Bedwars match without any deaths"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["games"] = { v3.BEDWARS },
    ["icon"] = {
        ["image"] = "rbxassetid://99667205424662",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO4_NO_DEATHS] = {
    ["title"] = "Immortal (Squads)",
    ["description"] = function() --[[ Name: description, Line 493 ]]
        return "Win a Bedwars Squads match without any deaths"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO4 },
    ["icon"] = {
        ["image"] = "rbxassetid://99667205424662",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO2_NO_DEATHS] = {
    ["title"] = "Immortal (Doubles)",
    ["description"] = function() --[[ Name: description, Line 506 ]]
        return "Win a Bedwars Doubles match without any deaths"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO2 },
    ["icon"] = {
        ["image"] = "rbxassetid://99667205424662",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO1_NO_DEATHS] = {
    ["title"] = "Immortal (Solos)",
    ["description"] = function() --[[ Name: description, Line 519 ]]
        return "Win a Bedwars Solos match without any deaths"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO1 },
    ["icon"] = {
        ["image"] = "rbxassetid://99667205424662",
        ["full"] = true
    }
}
v13[v11.BEDWARS_5V5_NO_DEATHS] = {
    ["title"] = "Immortal (5v5)",
    ["description"] = function() --[[ Name: description, Line 532 ]]
        return "Win a Bedwars 5v5 match without any deaths"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_5v5 },
    ["icon"] = {
        ["image"] = "rbxassetid://99667205424662",
        ["full"] = true
    }
}
v13[v11.BEDWARS_DUELS_NO_DEATHS] = {
    ["title"] = "Immortal (Duels)",
    ["description"] = function() --[[ Name: description, Line 545 ]]
        return "Win a Bedwars Duels match without any deaths"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_DUELS },
    ["icon"] = {
        ["image"] = "rbxassetid://99667205424662",
        ["full"] = true
    }
}
v13[v11.BEDWARS_LB_NO_DEATHS] = {
    ["title"] = "Immortal (Lucky Block)",
    ["description"] = function() --[[ Name: description, Line 558 ]]
        return "Win a Bedwars Lucky Block match without any deaths"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_LUCKY_BLOCK },
    ["icon"] = {
        ["image"] = "rbxassetid://99667205424662",
        ["full"] = true
    }
}
v13[v11.BEDWARS_NO_DAMAGE] = {
    ["title"] = "Untouchable",
    ["description"] = function() --[[ Name: description, Line 571 ]]
        return "Win a Bedwars match without taking any damage"
    end,
    ["rank"] = v12.EPIC,
    ["category"] = v7.CHALLENGE,
    ["games"] = { v3.BEDWARS },
    ["icon"] = {
        ["image"] = "rbxassetid://99656475427127",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO4_NO_DAMAGE] = {
    ["title"] = "Untouchable (Squads)",
    ["description"] = function() --[[ Name: description, Line 584 ]]
        return "Win a Bedwars Squads match without taking any damage"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO4 },
    ["icon"] = {
        ["image"] = "rbxassetid://99656475427127",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO2_NO_DAMAGE] = {
    ["title"] = "Untouchable (Doubles)",
    ["description"] = function() --[[ Name: description, Line 597 ]]
        return "Win a Bedwars Doubles match without taking any damage"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO2 },
    ["icon"] = {
        ["image"] = "rbxassetid://99656475427127",
        ["full"] = true
    }
}
v13[v11.BEDWARS_TO1_NO_DAMAGE] = {
    ["title"] = "Untouchable (Solos)",
    ["description"] = function() --[[ Name: description, Line 610 ]]
        return "Win a Bedwars Solos match without taking any damage"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_TO1 },
    ["icon"] = {
        ["image"] = "rbxassetid://99656475427127",
        ["full"] = true
    }
}
v13[v11.BEDWARS_5V5_NO_DAMAGE] = {
    ["title"] = "Untouchable (5v5)",
    ["description"] = function() --[[ Name: description, Line 623 ]]
        return "Win a Bedwars 5v5 match without taking any damage"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_5v5 },
    ["icon"] = {
        ["image"] = "rbxassetid://99656475427127",
        ["full"] = true
    }
}
v13[v11.BEDWARS_DUELS_NO_DAMAGE] = {
    ["title"] = "Untouchable (Duels)",
    ["description"] = function() --[[ Name: description, Line 636 ]]
        return "Win a Bedwars Duels match without taking any damage"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_DUELS },
    ["icon"] = {
        ["image"] = "rbxassetid://99656475427127",
        ["full"] = true
    }
}
v13[v11.BEDWARS_LB_NO_DAMAGE] = {
    ["title"] = "Untouchable (Lucky Block)",
    ["description"] = function() --[[ Name: description, Line 649 ]]
        return "Win a Bedwars Lucky Block match without taking any damage"
    end,
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["queues"] = { v4.BEDWARS_LUCKY_BLOCK },
    ["icon"] = {
        ["image"] = "rbxassetid://99656475427127",
        ["full"] = true
    }
}
local v56 = v11.KIT_VARIETY_1
local v58 = {
    ["title"] = "Well-Rounded I",
    ["useProgressBar"] = true,
    ["icon"] = {
        ["image"] = v10.WELL_ROUNDED
    },
    ["rank"] = v12.COMMON,
    ["category"] = v7.MATCH_LIFETIME,
    ["description"] = function(p57) --[[ Name: description, Line 667 ]]
        return "Win a match with " .. tostring(p57) .. " different kits"
    end,
    ["goal"] = {
        ["value"] = 10
    }
}
local v59 = {}
local v60 = {
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_NORMAL
    }
}
__set_list(v59, 1, {v60})
v58.rewards = v59
v13[v56] = v58
local v61 = v11.KIT_VARIETY_2
local v63 = {
    ["title"] = "Well-Rounded II",
    ["useProgressBar"] = true,
    ["icon"] = {
        ["image"] = v10.WELL_ROUNDED
    },
    ["rank"] = v12.RARE,
    ["category"] = v7.MATCH_LIFETIME,
    ["description"] = function(p62) --[[ Name: description, Line 687 ]]
        return "Win a match with " .. tostring(p62) .. " different kits"
    end,
    ["goal"] = {
        ["value"] = 50
    }
}
local v64 = {}
local v65 = {
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_ALL_7
    }
}
__set_list(v64, 1, {v65})
v63.rewards = v64
v13[v61] = v63
local v66 = v11.KIT_VARIETY_3
local v68 = {
    ["title"] = "Well-Rounded III",
    ["useProgressBar"] = true,
    ["icon"] = {
        ["image"] = v10.WELL_ROUNDED
    },
    ["rank"] = v12.EPIC,
    ["category"] = v7.MATCH_LIFETIME,
    ["description"] = function(p67) --[[ Name: description, Line 707 ]]
        return "Win a match with " .. tostring(p67) .. " different kits"
    end,
    ["goal"] = {
        ["value"] = 100
    },
    ["rewards"] = {
        {
            ["crate"] = v5.DIAMOND_LUCKY_CRATE
        }
    }
}
v13[v66] = v68
local v69 = v11.DAMAGE_LEGEND_1
local v73 = {
    ["title"] = "Damage Legend I",
    ["icon"] = {
        ["image"] = v10.DAMAGE_LEGEND
    },
    ["description"] = function(p70) --[[ Name: description, Line 723 ]]
        return "Deal " .. tostring(p70) .. " damage in a single match"
    end,
    ["rank"] = v12.RARE,
    ["trackedStat"] = {
        ["key"] = "totalDamageDealtRecord"
    },
    ["goal"] = {
        ["value"] = 3000
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["progressString"] = function(p71) --[[ Name: progressString, Line 734 ]]
        local v72 = math.floor(p71)
        return "Current record: " .. tostring(v72)
    end,
    ["rewards"] = {
        {
            ["bedCoins"] = 250
        }
    }
}
v13[v69] = v73
local v74 = v11.DAMAGE_LEGEND_2
local v78 = {
    ["title"] = "Damage Legend II",
    ["icon"] = {
        ["image"] = v10.DAMAGE_LEGEND
    },
    ["description"] = function(p75) --[[ Name: description, Line 746 ]]
        return "Deal " .. tostring(p75) .. " damage in a single match"
    end,
    ["rank"] = v12.EPIC,
    ["trackedStat"] = {
        ["key"] = "totalDamageDealtRecord"
    },
    ["goal"] = {
        ["value"] = 8000
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["progressString"] = function(p76) --[[ Name: progressString, Line 757 ]]
        local v77 = math.floor(p76)
        return "Current record: " .. tostring(v77)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.LEVEL_UP_CRATE
        }
    }
}
v13[v74] = v78
local v79 = v11.DAMAGE_LEGEND_3
local v83 = {
    ["title"] = "Damage Legend III",
    ["icon"] = {
        ["image"] = v10.DAMAGE_LEGEND
    },
    ["description"] = function(p80) --[[ Name: description, Line 769 ]]
        return "Deal " .. tostring(p80) .. " damage in a single match"
    end,
    ["rank"] = v12.LEGENDARY,
    ["trackedStat"] = {
        ["key"] = "totalDamageDealtRecord"
    },
    ["goal"] = {
        ["value"] = 20000
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["progressString"] = function(p81) --[[ Name: progressString, Line 780 ]]
        local v82 = math.floor(p81)
        return "Current record: " .. tostring(v82)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.DIAMOND_LUCKY_CRATE
        }
    }
}
v13[v79] = v83
local v84 = v11.RANGED_LEGEND_1
local v88 = {
    ["title"] = "Ranged Legend I",
    ["description"] = function(p85) --[[ Name: description, Line 789 ]]
        return "Deal " .. tostring(p85) .. " ranged damage in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.RANGED_LEGEND
    },
    ["rank"] = v12.RARE,
    ["trackedStat"] = {
        ["key"] = "totalRangedDamageDealtRecord"
    },
    ["goal"] = {
        ["value"] = 1000
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["progressString"] = function(p86) --[[ Name: progressString, Line 803 ]]
        local v87 = math.floor(p86)
        return "Current record: " .. tostring(v87)
    end,
    ["rewards"] = {
        {
            ["bedCoins"] = 250
        }
    }
}
v13[v84] = v88
local v89 = v11.RANGED_LEGEND_2
local v93 = {
    ["title"] = "Ranged Legend II",
    ["description"] = function(p90) --[[ Name: description, Line 812 ]]
        return "Deal " .. tostring(p90) .. " ranged damage in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.RANGED_LEGEND
    },
    ["rank"] = v12.EPIC,
    ["trackedStat"] = {
        ["key"] = "totalRangedDamageDealtRecord"
    },
    ["goal"] = {
        ["value"] = 2000
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["progressString"] = function(p91) --[[ Name: progressString, Line 826 ]]
        local v92 = math.floor(p91)
        return "Current record: " .. tostring(v92)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.LEVEL_UP_CRATE
        }
    }
}
v13[v89] = v93
local v94 = v11.RANGED_LEGEND_3
local v98 = {
    ["title"] = "Ranged Legend III",
    ["description"] = function(p95) --[[ Name: description, Line 835 ]]
        return "Deal " .. tostring(p95) .. " ranged damage in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.RANGED_LEGEND
    },
    ["rank"] = v12.LEGENDARY,
    ["trackedStat"] = {
        ["key"] = "totalRangedDamageDealtRecord"
    },
    ["goal"] = {
        ["value"] = 2500
    },
    ["games"] = { v3.BEDWARS, v3.SKYWARS },
    ["progressString"] = function(p96) --[[ Name: progressString, Line 849 ]]
        local v97 = math.floor(p96)
        return "Current record: " .. tostring(v97)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.DIAMOND_LUCKY_CRATE
        }
    }
}
v13[v94] = v98
local v99 = v11.FULLY_KITTED
local v100 = {
    ["title"] = "Fully Kitted",
    ["description"] = function() --[[ Name: description, Line 858 ]]
        return "Equip Emerald Armor and Emerald Sword at the same time"
    end,
    ["rank"] = v12.COMMON,
    ["icon"] = {
        ["image"] = "rbxassetid://137512130244351",
        ["full"] = true
    },
    ["games"] = { v3.BEDWARS }
}
local v101 = {}
local v102 = {
    ["consumable"] = {
        ["consumableType"] = v2.KIT_RENTAL_NORMAL
    }
}
__set_list(v101, 1, {v102})
v100.rewards = v101
v13[v99] = v100
v13[v11.ARACHNES_LAIR_VICTORY] = {
    ["title"] = "Arachne\'s Lair",
    ["disabled"] = false,
    ["icon"] = {
        ["image"] = "rbxassetid://86855579950902",
        ["full"] = true
    },
    ["description"] = function() --[[ Name: description, Line 879 ]]
        return "Beat Arachne\'s Lair"
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.COMMON
}
v13[v11.ARACHNES_LAIR_SOLO_VICTORY] = {
    ["title"] = "Arachne\'s Lair Solo",
    ["disabled"] = true,
    ["icon"] = {
        ["image"] = "rbxassetid://107593241806648",
        ["full"] = true
    },
    ["description"] = function() --[[ Name: description, Line 892 ]]
        return "Beat Arachne\'s Lair solo"
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.EPIC,
    ["goal"] = {
        ["value"] = 1,
        ["inverted"] = true
    },
    ["trackedStat"] = {
        ["key"] = "minPlayersCompleted",
        ["extra"] = "halloween"
    },
    ["queues"] = { v4.HALLOWEEN_2025_EVENT_PVE }
}
v13[v11.ARACHNES_LAIR_SPEEDRUN_1] = {
    ["title"] = "Arachne\'s Lair Speedrun I",
    ["disabled"] = false,
    ["icon"] = {
        ["image"] = "rbxassetid://105119547718786",
        ["full"] = true
    },
    ["description"] = function(p103) --[[ Name: description, Line 914 ]]
        local v104 = math
        local v105 = (p103 == nil and 60 or p103) / 60
        local v106 = v104.floor(v105)
        return "Beat Arachne\'s Lair within " .. tostring(v106) .. " minutes"
    end,
    ["progressString"] = function(p107) --[[ Name: progressString, Line 922 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return "Best time: " .. (p107 >= 9999 and "N/A" or u6.getTimeString(p107))
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.RARE,
    ["goal"] = {
        ["value"] = 600,
        ["inverted"] = true
    },
    ["trackedStat"] = {
        ["key"] = "bestCompletionTime",
        ["extra"] = "halloween"
    },
    ["queues"] = { v4.HALLOWEEN_2025_EVENT_PVE }
}
v13[v11.ARACHNES_LAIR_SPEEDRUN_2] = {
    ["title"] = "Arachne\'s Lair Speedrun II",
    ["disabled"] = false,
    ["icon"] = {
        ["image"] = "rbxassetid://93735486863480",
        ["full"] = true
    },
    ["description"] = function(p108) --[[ Name: description, Line 944 ]]
        local v109 = math
        local v110 = (p108 == nil and 60 or p108) / 60
        local v111 = v109.floor(v110)
        return "Beat Arachne\'s Lair within " .. tostring(v111) .. " minutes"
    end,
    ["progressString"] = function(p112) --[[ Name: progressString, Line 952 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return "Best time: " .. (p112 >= 9999 and "N/A" or u6.getTimeString(p112))
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.EPIC,
    ["goal"] = {
        ["value"] = 540,
        ["inverted"] = true
    },
    ["trackedStat"] = {
        ["key"] = "bestCompletionTime",
        ["extra"] = "halloween"
    },
    ["queues"] = { v4.HALLOWEEN_2025_EVENT_PVE }
}
v13[v11.ARACHNES_LAIR_SPEEDRUN_3] = {
    ["title"] = "Arachne\'s Lair Speedrun III",
    ["disabled"] = false,
    ["icon"] = {
        ["image"] = "rbxassetid://72025676724125",
        ["full"] = true
    },
    ["description"] = function(p113) --[[ Name: description, Line 974 ]]
        local v114 = math
        local v115 = (p113 == nil and 60 or p113) / 60
        local v116 = v114.floor(v115)
        return "Beat Arachne\'s Lair within " .. tostring(v116) .. " minutes"
    end,
    ["progressString"] = function(p117) --[[ Name: progressString, Line 982 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return "Best time: " .. (p117 >= 9999 and "N/A" or u6.getTimeString(p117))
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.LEGENDARY,
    ["goal"] = {
        ["value"] = 420,
        ["inverted"] = true
    },
    ["trackedStat"] = {
        ["key"] = "bestCompletionTime",
        ["extra"] = "halloween"
    },
    ["queues"] = { v4.HALLOWEEN_2025_EVENT_PVE }
}
v13[v11.MARROWS_MADNESS_VICTORY] = {
    ["title"] = "Marrow\'s Madness",
    ["disabled"] = false,
    ["icon"] = {
        ["image"] = "rbxassetid://123419107285671",
        ["full"] = true
    },
    ["description"] = function() --[[ Name: description, Line 1004 ]]
        return "Beat Marrow\'s Madness"
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.COMMON
}
v13[v11.MINIGAME_MOUNTAIN_VICTORY] = {
    ["title"] = "Minigame Mountaineer",
    ["disabled"] = false,
    ["icon"] = {
        ["image"] = "rbxassetid://122456480664326",
        ["full"] = true
    },
    ["description"] = function() --[[ Name: description, Line 1017 ]]
        return "Summit and Beat Minigame Mountain"
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.RARE
}
v13[v11.CRYPT_TRIALS_2025_SOLO_VICTORY] = {
    ["title"] = "Crypt Trials Solo",
    ["disabled"] = true,
    ["icon"] = {
        ["image"] = "rbxassetid://108693738064550",
        ["full"] = true
    },
    ["description"] = function() --[[ Name: description, Line 1030 ]]
        return "Beat Crypt Trials solo"
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.EPIC,
    ["goal"] = {
        ["value"] = 1,
        ["inverted"] = true
    },
    ["trackedStat"] = {
        ["key"] = "minPlayersCompleted",
        ["extra"] = "halloween"
    },
    ["queues"] = { v4.HALLOWEEN_EVENT }
}
v13[v11.CRYPT_TRIALS_2025_SPEEDRUN_1] = {
    ["title"] = "Crypt Trials Speedrun I",
    ["disabled"] = true,
    ["icon"] = {
        ["image"] = "rbxassetid://119685936705376",
        ["full"] = true
    },
    ["description"] = function(p118) --[[ Name: description, Line 1052 ]]
        local v119 = math
        local v120 = (p118 == nil and 60 or p118) / 60
        local v121 = v119.floor(v120)
        return "Beat Crypt Trials within " .. tostring(v121) .. " minutes"
    end,
    ["progressString"] = function(p122) --[[ Name: progressString, Line 1060 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return "Best time: " .. (p122 >= 9999 and "N/A" or u6.getTimeString(p122))
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.RARE,
    ["goal"] = {
        ["value"] = 600,
        ["inverted"] = true
    },
    ["trackedStat"] = {
        ["key"] = "bestCompletionTime",
        ["extra"] = "halloween"
    },
    ["queues"] = { v4.HALLOWEEN_EVENT }
}
v13[v11.CRYPT_TRIALS_2025_SPEEDRUN_2] = {
    ["title"] = "Crypt Trials Speedrun II",
    ["disabled"] = true,
    ["icon"] = {
        ["image"] = "rbxassetid://78208403746087",
        ["full"] = true
    },
    ["description"] = function(p123) --[[ Name: description, Line 1082 ]]
        local v124 = math
        local v125 = (p123 == nil and 60 or p123) / 60
        local v126 = v124.floor(v125)
        return "Beat Crypt Trials within " .. tostring(v126) .. " minutes"
    end,
    ["progressString"] = function(p127) --[[ Name: progressString, Line 1090 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return "Best time: " .. (p127 >= 9999 and "N/A" or u6.getTimeString(p127))
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.EPIC,
    ["goal"] = {
        ["value"] = 540,
        ["inverted"] = true
    },
    ["trackedStat"] = {
        ["key"] = "bestCompletionTime",
        ["extra"] = "halloween"
    },
    ["queues"] = { v4.HALLOWEEN_EVENT }
}
v13[v11.CRYPT_TRIALS_2025_SPEEDRUN_3] = {
    ["title"] = "Crypt Trials Speedrun III",
    ["disabled"] = true,
    ["icon"] = {
        ["image"] = "rbxassetid://77973709448416",
        ["full"] = true
    },
    ["description"] = function(p128) --[[ Name: description, Line 1112 ]]
        local v129 = math
        local v130 = (p128 == nil and 60 or p128) / 60
        local v131 = v129.floor(v130)
        return "Beat Crypt Trials within " .. tostring(v131) .. " minutes"
    end,
    ["progressString"] = function(p132) --[[ Name: progressString, Line 1120 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return "Best time: " .. (p132 >= 9999 and "N/A" or u6.getTimeString(p132))
    end,
    ["category"] = v7.EVENT,
    ["rank"] = v12.LEGENDARY,
    ["goal"] = {
        ["value"] = 480,
        ["inverted"] = true
    },
    ["trackedStat"] = {
        ["key"] = "bestCompletionTime",
        ["extra"] = "halloween"
    },
    ["queues"] = { v4.HALLOWEEN_EVENT }
}
local v133 = v11.BEDWARS_EMERALD_SPENDER_1
local v136 = {
    ["title"] = "Emerald Spender I",
    ["description"] = function(p134) --[[ Name: description, Line 1138 ]]
        return "Spend " .. tostring(p134) .. " or more emeralds in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.EMERALD_SPENDER
    },
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "emeraldsSpentRecord"
    },
    ["goal"] = {
        ["value"] = 50
    },
    ["games"] = { v3.BEDWARS },
    ["progressString"] = function(p135) --[[ Name: progressString, Line 1153 ]]
        return "Current record: " .. tostring(p135)
    end,
    ["rewards"] = {
        {
            ["bedCoins"] = 250
        }
    }
}
v13[v133] = v136
local v137 = v11.BEDWARS_EMERALD_SPENDER_2
local v140 = {
    ["title"] = "Emerald Spender II",
    ["description"] = function(p138) --[[ Name: description, Line 1162 ]]
        return "Spend " .. tostring(p138) .. " or more emeralds in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.EMERALD_SPENDER
    },
    ["rank"] = v12.EPIC,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "emeraldsSpentRecord"
    },
    ["goal"] = {
        ["value"] = 80
    },
    ["games"] = { v3.BEDWARS },
    ["progressString"] = function(p139) --[[ Name: progressString, Line 1177 ]]
        return "Current record: " .. tostring(p139)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.LEVEL_UP_CRATE
        }
    }
}
v13[v137] = v140
local v141 = v11.BEDWARS_EMERALD_SPENDER_3
local v144 = {
    ["title"] = "Emerald Spender III",
    ["description"] = function(p142) --[[ Name: description, Line 1186 ]]
        return "Spend " .. tostring(p142) .. " or more emeralds in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.EMERALD_SPENDER
    },
    ["rank"] = v12.LEGENDARY,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "emeraldsSpentRecord"
    },
    ["goal"] = {
        ["value"] = 150
    },
    ["games"] = { v3.BEDWARS },
    ["progressString"] = function(p143) --[[ Name: progressString, Line 1201 ]]
        return "Current record: " .. tostring(p143)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.DIAMOND_LUCKY_CRATE
        }
    }
}
v13[v141] = v144
local v145 = v11.BEDWARS_IRON_SPENDER_1
local v148 = {
    ["title"] = "Iron Spender I",
    ["description"] = function(p146) --[[ Name: description, Line 1210 ]]
        return "Spend " .. tostring(p146) .. " or more iron in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.IRON_SPENDER
    },
    ["rank"] = v12.COMMON,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "ironSpentRecord"
    },
    ["goal"] = {
        ["value"] = 1000
    },
    ["games"] = { v3.BEDWARS },
    ["progressString"] = function(p147) --[[ Name: progressString, Line 1225 ]]
        return "Current record: " .. tostring(p147)
    end,
    ["rewards"] = {
        {
            ["bedCoins"] = 250
        }
    }
}
v13[v145] = v148
local v149 = v11.BEDWARS_IRON_SPENDER_2
local v152 = {
    ["title"] = "Iron Spender II",
    ["description"] = function(p150) --[[ Name: description, Line 1234 ]]
        return "Spend " .. tostring(p150) .. " or more iron in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.IRON_SPENDER
    },
    ["rank"] = v12.RARE,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "ironSpentRecord"
    },
    ["goal"] = {
        ["value"] = 2500
    },
    ["games"] = { v3.BEDWARS },
    ["progressString"] = function(p151) --[[ Name: progressString, Line 1249 ]]
        return "Current record: " .. tostring(p151)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.LEVEL_UP_CRATE
        }
    }
}
v13[v149] = v152
local v153 = v11.BEDWARS_IRON_SPENDER_3
local v156 = {
    ["title"] = "Iron Spender III",
    ["description"] = function(p154) --[[ Name: description, Line 1258 ]]
        return "Spend " .. tostring(p154) .. " or more iron in a single match"
    end,
    ["icon"] = {
        ["image"] = v10.IRON_SPENDER
    },
    ["rank"] = v12.EPIC,
    ["category"] = v7.CHALLENGE,
    ["trackedStat"] = {
        ["key"] = "ironSpentRecord"
    },
    ["goal"] = {
        ["value"] = 5000
    },
    ["games"] = { v3.BEDWARS },
    ["progressString"] = function(p155) --[[ Name: progressString, Line 1273 ]]
        return "Current record: " .. tostring(p155)
    end,
    ["rewards"] = {
        {
            ["crate"] = v5.DIAMOND_LUCKY_CRATE
        }
    }
}
v13[v153] = v156
return {
    ["AchievementsMeta"] = v13,
    ["AchievementTierGroups"] = {
        { v11.MULTIKILLCHAIN_1, v11.MULTIKILLCHAIN_2, v11.MULTIKILLCHAIN_3 },
        { v11.GUNGAME_TOP_5, v11.GUNGAME_TOP_1 },
        { v11.KIT_VARIETY_1, v11.KIT_VARIETY_2, v11.KIT_VARIETY_3 },
        { v11.WRATH_1, v11.WRATH_2, v11.WRATH_3 },
        { v11.EXECUTIONER_1, v11.EXECUTIONER_2, v11.EXECUTIONER_3 },
        { v11.DAMAGE_LEGEND_1, v11.DAMAGE_LEGEND_2, v11.DAMAGE_LEGEND_3 },
        { v11.RANGED_LEGEND_1, v11.RANGED_LEGEND_2, v11.RANGED_LEGEND_3 },
        { v11.ARACHNES_LAIR_SPEEDRUN_1, v11.ARACHNES_LAIR_SPEEDRUN_2, v11.ARACHNES_LAIR_SPEEDRUN_3 },
        { v11.CRYPT_TRIALS_2025_SPEEDRUN_1, v11.CRYPT_TRIALS_2025_SPEEDRUN_2, v11.CRYPT_TRIALS_2025_SPEEDRUN_3 },
        { v11.BEDWARS_EMERALD_SPENDER_1, v11.BEDWARS_EMERALD_SPENDER_2, v11.BEDWARS_EMERALD_SPENDER_3 }
    }
}