local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission-generator-type").MissionGenerator
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "base-missions-generator").BaseMissionsGenerator
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "BattlepassMissionsGenerator"
    end,
    ["__index"] = u7
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u2
        [4] = u6
        [5] = u7
    --]]
    local v12 = u5.BATTLEPASS
    local v13 = {}
    local v14 = {
        ["name"] = "Spend %s emeralds",
        ["stages"] = {
            {
                ["type"] = "SpendResource",
                ["progress"] = 16,
                ["resource"] = u4.EMERALD
            }
        }
    }
    local v15 = {
        ["name"] = "Spend %s diamonds",
        ["stages"] = {
            {
                ["type"] = "SpendResource",
                ["progress"] = 30,
                ["resource"] = u4.DIAMOND
            }
        }
    }
    local v16 = {
        ["name"] = "Purchase the Crossbow",
        ["stages"] = {
            {
                ["type"] = "ShopPurchase",
                ["progress"] = 1,
                ["resource"] = u4.WOOD_CROSSBOW or u4.FLOWER_CROSSBOW or (u4.TACTICAL_CROSSBOW or u4.FALCONER_CROSSBOW or (u4.LIFE_CROSSBOW or u4.OG_WOOD_CROSSBOW))
            }
        }
    }
    __set_list(v13, 1, {{
    ["name"] = "Get %s kills",
    ["stages"] = {
        {
            ["type"] = "PlayerKill",
            ["progress"] = 5
        }
    }
}, {
    ["name"] = "Win %s games",
    ["stages"] = {
        {
            ["type"] = "GameWin",
            ["progress"] = 1
        }
    }
}, {
    ["name"] = "Deal %s damage",
    ["stages"] = {
        {
            ["type"] = "PlayerDamage",
            ["progress"] = 800
        }
    }
}, v14, v15, {
    ["name"] = "Break %s blocks",
    ["stages"] = {
        {
            ["type"] = "BlockBreak",
            ["progress"] = 10
        }
    }
}, {
    ["name"] = "Travel %s blocks with Telepearls",
    ["stages"] = {
        {
            ["type"] = "TelepearlTeleport",
            ["progress"] = 150
        }
    }
}, {
    ["name"] = "Deal %s damage with arrows",
    ["stages"] = {
        {
            ["type"] = "ArrowDamage",
            ["progress"] = 250
        }
    }
}, {
    ["name"] = "Use %s fireballs",
    ["stages"] = {
        {
            ["type"] = "UseProjectile",
            ["progress"] = 5,
            ["projectileType"] = "fireball"
        }
    }
}, v16, {
    ["name"] = "Research %s enchant",
    ["stages"] = {
        {
            ["type"] = "GetEnchant",
            ["progress"] = 2
        }
    }
}, {
    ["name"] = "Get Double Kills (2 kills in a row)",
    ["stages"] = {
        {
            ["type"] = "DoubleKill",
            ["progress"] = 2
        }
    }
}, {
    ["name"] = "Purchase Obsidian Blocks",
    ["stages"] = {
        {
            ["type"] = "ShopPurchase",
            ["progress"] = 1,
            ["resource"] = u4.OBSIDIAN
        }
    }
}, {
    ["name"] = "Kill Diamond Guardians",
    ["stages"] = {
        {
            ["type"] = "KillDiamondGuardians",
            ["progress"] = 3
        }
    }
}, {
    ["name"] = "Throw %s Gloops",
    ["stages"] = {
        {
            ["type"] = "UseProjectile",
            ["progress"] = 4,
            ["projectileType"] = "glue_trap"
        }
    }
}, {
    ["name"] = "Place %s TNT",
    ["stages"] = {
        {
            ["type"] = "BlockPlace",
            ["progress"] = 5,
            ["block"] = u4.TNT
        }
    }
}})
    __set_list(v13, 17, {{
    ["name"] = "Purchase %s Tesla Traps",
    ["stages"] = {
        {
            ["type"] = "ShopPurchase",
            ["progress"] = 3,
            ["resource"] = u4.TESLA_TRAP
        }
    }
}, {
    ["name"] = "Purchase %s Diamond Armor",
    ["stages"] = {
        {
            ["type"] = "ShopPurchase",
            ["progress"] = 1,
            ["resource"] = u4.DIAMOND_CHESTPLATE
        }
    }
}})
    local v17 = {
        {
            ["name"] = "Get %s kills",
            ["stages"] = {
                {
                    ["type"] = "PlayerKill",
                    ["progress"] = 20
                }
            }
        },
        {
            ["name"] = "Win %s games",
            ["stages"] = {
                {
                    ["type"] = "GameWin",
                    ["progress"] = 5
                }
            }
        },
        {
            ["name"] = "Deal %s damage",
            ["stages"] = {
                {
                    ["type"] = "PlayerDamage",
                    ["progress"] = 6000
                }
            }
        },
        {
            ["name"] = "Break %s beds",
            ["stages"] = {
                {
                    ["type"] = "BedBreak",
                    ["progress"] = 3
                }
            }
        },
        {
            ["name"] = "Spend %s emeralds",
            ["stages"] = {
                {
                    ["type"] = "SpendResource",
                    ["progress"] = 90,
                    ["resource"] = u4.EMERALD
                }
            }
        },
        {
            ["name"] = "Spend %s diamonds",
            ["stages"] = {
                {
                    ["type"] = "SpendResource",
                    ["progress"] = 110,
                    ["resource"] = u4.DIAMOND
                }
            }
        },
        {
            ["name"] = "Break %s blocks",
            ["stages"] = {
                {
                    ["type"] = "BlockBreak",
                    ["progress"] = 30
                }
            }
        },
        {
            ["name"] = "Travel %s blocks with Telepearls",
            ["stages"] = {
                {
                    ["type"] = "TelepearlTeleport",
                    ["progress"] = 600
                }
            }
        },
        {
            ["name"] = "Deal %s damage with arrows",
            ["stages"] = {
                {
                    ["type"] = "ArrowDamage",
                    ["progress"] = 1000
                }
            }
        },
        {
            ["name"] = "Defeat the Titan",
            ["stages"] = {
                {
                    ["type"] = "KillTitanBoss",
                    ["progress"] = 2
                }
            }
        },
        {
            ["name"] = "Purchase %s Emerald Sword",
            ["stages"] = {
                {
                    ["type"] = "ShopPurchase",
                    ["progress"] = 1,
                    ["resource"] = u4.EMERALD_SWORD
                }
            }
        },
        {
            ["name"] = "Purchase %s Headhunter",
            ["stages"] = {
                {
                    ["type"] = "ShopPurchase",
                    ["progress"] = 1,
                    ["resource"] = u4.HEADHUNTER
                }
            }
        }
    }
    local v18 = {}
    local v19 = u2.BATTLE_PASS_SEASON_NUMBER
    if v19 == nil then
        v19 = u2.BATTLE_PASS_SEASON
    end
    v18.missionIdPrefix = "BATTLE_PASS_" .. tostring(v19)
    v18.numDailyMissions = 2 + u6.BP_EXTRA_DAILY.numExtraMissions
    v18.numWeeklyMissions = 2
    v18.dailyMissionAmount = 2000
    v18.weeklyMissionAmount = 8000
    v18.icon = u2.BATTLE_PASS_SEASON_ICON
    u7.constructor(p11, v12, v13, v17, v18, not u2.isActiveBattlePass())
end
function u8.onGenerateDailyMissions(u20, u21) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u2
    --]]
    local function v24(p22, p23) --[[ Line: 236 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u6
            [3] = u3
            [4] = u2
            [5] = u20
        --]]
        if #u21 - u6.BP_EXTRA_DAILY.numExtraMissions <= p23 then
            p22.playerLevelReq = u6.BP_EXTRA_DAILY.levelReq
        end
        p22.reward = {
            ["name"] = "BattlePass XP",
            ["icon"] = u3.TICKET,
            ["rewards"] = {
                {
                    ["battlepassXP"] = {
                        ["battlepass"] = u2.BATTLE_PASS_SEASON,
                        ["amount"] = u20:getDailyMissionRewardAmount()
                    }
                }
            }
        }
    end
    for v25, v26 in u21 do
        v24(v26, v25 - 1, u21)
    end
    return u21
end
function u8.onGenerateWeeklyMissions(u27, p28) --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local function v33(p29) --[[ Line: 260 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u27
        --]]
        local v30 = {
            ["name"] = "BattlePass XP",
            ["icon"] = u3.TICKET
        }
        local v31 = {}
        local v32 = {
            ["battlepassXP"] = {
                ["battlepass"] = u2.BATTLE_PASS_SEASON,
                ["amount"] = u27:getDailyMissionRewardAmount()
            }
        }
        __set_list(v31, 1, {v32})
        v30.rewards = v31
        p29.reward = v30
    end
    for v34, v35 in p28 do
        v33(v35, v34 - 1, p28)
    end
    return p28
end
return {
    ["BattlepassMissionsGenerator"] = u8,
    ["BattlepassMissionsStore"] = u8.new()
}