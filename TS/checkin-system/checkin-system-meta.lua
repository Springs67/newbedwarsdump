local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-type").BattlePass
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata")
local v6 = v5.EventCurrencyType
local v7 = v5.EventType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-system").CheckInSystem
local u13 = {
    [v12.XMAS_2024] = {
        ["interval"] = 86400,
        ["disabled"] = true,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.KIT_RENTAL_BATTLEPASS_7
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.LEVEL_UP_CRATE
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.BATTLE_PASS_2X
                }
            },
            {
                ["paid"] = false,
                ["bedCoins"] = 500
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.BATTLE_PASS_3X
                }
            },
            {
                ["paid"] = false,
                ["emote"] = v10.GINGERBREADS_NIGHTMARE
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.LEVEL_UP_CRATE
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.AUTO_COMPLETE_WEEKLY_MISSION_TICKET
                }
            },
            {
                ["paid"] = false,
                ["bedCoins"] = 500
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.DIAMOND_LUCKY_CRATE
                }
            },
            {
                ["paid"] = false,
                ["emote"] = v10.BUILDER_NUTCRACKER_LETHAL
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.LEVEL_UP_CRATE
                }
            },
            {
                ["paid"] = false,
                ["kitSkin"] = v8.WRANGLER_REINDEER_LASSY
            },
            {
                ["paid"] = false,
                ["bedCoins"] = 1000
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.KIT_RENTAL_ALL_7
                }
            }
        }
    },
    [v12.LNY_2025] = {
        ["interval"] = 86400,
        ["event"] = v7.LNY_2025,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.RED_GOLD_ENVELOPE
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.RED_GOLD_ENVELOPE
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 1000,
                    ["currency"] = v6.LNY_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.RED_GOLD_ENVELOPE
                }
            },
            {
                ["paid"] = false,
                ["emote"] = v10.LIAN_DUMPLING_EAT
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.GOLDEN_ENVELOPE
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.RED_GOLD_ENVELOPE
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 1000,
                    ["currency"] = v6.LNY_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.RED_GOLD_ENVELOPE
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.DIAMOND_LUCKY_CRATE
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.GOLDEN_ENVELOPE
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.RED_GOLD_ENVELOPE
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 1000,
                    ["currency"] = v6.LNY_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["consumableType"] = v4.KIT_RENTAL_BATTLEPASS_7
                }
            },
            {
                ["paid"] = false,
                ["bedBreakEffect"] = v9.SNAKE
            }
        }
    },
    [v12.FOUR_YEAR_ANNIVERSARY] = {
        ["interval"] = 86400,
        ["event"] = v7.FOUR_YEAR_ANNIVERSARY,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.BATTLE_PASS_2X
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.KIT_RENTAL_NORMAL
                }
            },
            {
                ["paid"] = false,
                ["bedCoins"] = 1500
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.AUTO_COMPLETE_DAILY_MISSION_TICKET
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.LEVEL_UP_CRATE
                }
            },
            {
                ["paid"] = false,
                ["emote"] = v10.STELLA_BIRTHDAY
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.KIT_RENTAL_NORMAL
                }
            },
            {
                ["paid"] = false,
                ["bedCoins"] = 1500
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.AUTO_COMPLETE_WEEKLY_MISSION_TICKET
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.DIAMOND_LUCKY_CRATE
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.BATTLE_PASS_3X
                }
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.LEVEL_UP_CRATE
                }
            },
            {
                ["paid"] = false,
                ["bedCoins"] = 3000
            },
            {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v4.KIT_RENTAL_BATTLEPASS_7
                }
            },
            {
                ["paid"] = false,
                ["kitSkin"] = v8.DODO_EVELYNN
            }
        }
    },
    [v12.SUMMER_2025] = {
        ["interval"] = 86400,
        ["autoCheckinOnMatchStart"] = true,
        ["event"] = v7.SUMMER_2025,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 6000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 6000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 3000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 3000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 3000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 3000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 6000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 3000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 3000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 3000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 3000,
                    ["currency"] = v6.SUMMER_2025_CURRENCY
                }
            },
            {
                ["paid"] = false,
                ["kitSkin"] = v8.LIFEGUARD_LASSY
            }
        }
    },
    [v12.HW_2025] = {
        ["interval"] = 86400,
        ["autoCheckinOnMatchStart"] = true,
        ["event"] = v7.HALLOWEEN_2025,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 1,
                    ["currency"] = v6.RARE_CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 4000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 4000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2,
                    ["currency"] = v6.RARE_CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 4000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 4000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 4000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 4000,
                    ["currency"] = v6.CANDY_2025
                }
            },
            {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 10000,
                    ["currency"] = v6.CANDY_2025
                }
            }
        },
        ["timePeriod"] = {
            ["startTime"] = 1761318000,
            ["endTime"] = 1763161200
        }
    }
}
local v14 = v12.XMAS_2025
local v15 = {
    ["interval"] = 86400,
    ["autoCheckinOnMatchStart"] = true,
    ["event"] = v7.XMAS_2025,
    ["rewards"] = {
        {
            ["paid"] = false,
            ["consumable"] = {
                ["consumableType"] = v4.BATTLE_PASS_2X
            }
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 5000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["bedCoins"] = 1000
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 5000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["consumableType"] = v4.LEVEL_UP_CRATE
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["consumableType"] = v4.KIT_RENTAL_SUPPORT_7
            }
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 5000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["emote"] = v10.HOLIDAY_SHEEPHERDER_BELL
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 5000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["amount"] = 1,
                ["consumableType"] = v4.KITSKIN_CRATE_FRAGMENT
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["amount"] = 1,
                ["consumableType"] = v4.BATTLE_PASS_2X
            }
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 5000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["consumableType"] = v4.ARMOR_TRIM_2X
            }
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 5000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["consumableType"] = v4.KIT_RENTAL_NORMAL
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["amount"] = 1,
                ["consumableType"] = v4.KITSKIN_CRATE_FRAGMENT
            }
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 5000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["emote"] = v10.MOAI_YETI
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 5000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["consumableType"] = v4.DIAMOND_LUCKY_CRATE
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["consumableType"] = v4.KIT_RENTAL_ECONOMY_7
            }
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 10000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["bedCoins"] = 2000
        },
        {
            ["paid"] = false,
            ["battlepassXP"] = {
                ["amount"] = 10000,
                ["battlepass"] = v3.XMAS_2025
            }
        },
        {
            ["paid"] = false,
            ["consumable"] = {
                ["consumableType"] = v4.KIT_RENTAL_ALL_7
            }
        }
    },
    ["timePeriod"] = {
        ["endTime"] = 1767999600,
        ["startTime"] = v11.isProduction() and not v2:IsStudio() and 1764975600 or 1764630000
    }
}
u13[v14] = v15
return {
    ["getCheckInSystemMeta"] = function(p16) --[[ Name: getCheckInSystemMeta, Line 606 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        return u13[p16]
    end,
    ["CheckInSystemMeta"] = u13
}