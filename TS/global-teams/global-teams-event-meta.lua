local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata")
local v5 = v4.EventCurrencyType
local v6 = v4.EventType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "riddle", "riddles").Riddle
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types")
local v13 = v12.GlobalTeamEventKey
local v14 = v12.GlobalTeamKey
local v15 = v12.GlobalTeamTimedGoalType
local v16 = {
    [v13.SUMMER_2024] = {
        ["displayName"] = "Crabs vs. Turtles",
        ["useCombinedTeamScoresForRewards"] = true,
        ["needsLobbyUpdates"] = true,
        ["globalTeams"] = {
            {
                ["displayName"] = "Crabs",
                ["score"] = 0,
                ["key"] = v14.SUMMER_2024_CRAB,
                ["icon"] = v7.CRAB_DRAWN,
                ["themeColor"] = Color3.fromRGB(255, 193, 73),
                ["rewards"] = {}
            },
            {
                ["displayName"] = "Turtles",
                ["score"] = 0,
                ["key"] = v14.SUMMER_2024_TURTLE,
                ["icon"] = v7.TURTLE_DRAWN,
                ["themeColor"] = Color3.fromRGB(104, 153, 101),
                ["rewards"] = {}
            }
        },
        ["bedwarsEventType"] = v6.SUMMER_2024,
        ["sharedTeamRewards"] = {
            {
                ["globalTeamRewardId"] = "summer2024_shared_1",
                ["globalTeamScoreRequired"] = 1000000,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.LEVEL_UP_CRATE
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_currency_1",
                ["globalTeamScoreRequired"] = 2500000,
                ["reward"] = {
                    ["paid"] = false,
                    ["eventCurrency"] = {
                        ["amount"] = 5000,
                        ["currency"] = v5.SUMMER_2024_CURRENCY
                    }
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_2",
                ["globalTeamScoreRequired"] = 5000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.LEVEL_UP_CRATE
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_emote_2",
                ["globalTeamScoreRequired"] = 7500000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["emote"] = v8.SURFER_HOT
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_3",
                ["globalTeamScoreRequired"] = 10000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.LEVEL_UP_CRATE
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_emote_3",
                ["globalTeamScoreRequired"] = 15000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["emote"] = v8.ICE_CREAM_TRIO
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_4",
                ["globalTeamScoreRequired"] = 20000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.LEVEL_UP_CRATE
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_currency_2",
                ["globalTeamScoreRequired"] = 25000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["eventCurrency"] = {
                        ["amount"] = 5000,
                        ["currency"] = v5.SUMMER_2024_CURRENCY
                    }
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_6",
                ["globalTeamScoreRequired"] = 30000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.LEVEL_UP_CRATE
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_emote_4",
                ["globalTeamScoreRequired"] = 35000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["emote"] = v8.SURFER_RIZZ
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_7",
                ["globalTeamScoreRequired"] = 40000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.LEVEL_UP_CRATE
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_12",
                ["globalTeamScoreRequired"] = 45000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["eventCurrency"] = {
                        ["amount"] = 10000,
                        ["currency"] = v5.SUMMER_2024_CURRENCY
                    }
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_8",
                ["globalTeamScoreRequired"] = 50000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.LEVEL_UP_CRATE
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_9",
                ["globalTeamScoreRequired"] = 60000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.DIAMOND_LUCKY_CRATE
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_currency_3",
                ["globalTeamScoreRequired"] = 75000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["eventCurrency"] = {
                        ["amount"] = 10000,
                        ["currency"] = v5.SUMMER_2024_CURRENCY
                    }
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_10",
                ["globalTeamScoreRequired"] = 90000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.DIAMOND_LUCKY_CRATE
                }
            },
            {
                ["globalTeamRewardId"] = "summer2024_shared_11",
                ["globalTeamScoreRequired"] = 125000000,
                ["personalContributionScoreRequired"] = 100,
                ["reward"] = {
                    ["paid"] = false,
                    ["crate"] = v9.DIAMOND_LUCKY_CRATE
                }
            }
        }
    }
}
local v17 = v13.SUMMER_2025
local v18 = {
    ["displayName"] = "Summer 2025",
    ["useCombinedTeamScoresForRewards"] = true,
    ["needsLobbyUpdates"] = true,
    ["globalTeams"] = {
        {
            ["displayName"] = "Crabs",
            ["score"] = 0,
            ["key"] = v14.SUMMER_2025_TEAM,
            ["icon"] = v7.CRAB_DRAWN,
            ["themeColor"] = Color3.fromRGB(255, 193, 73),
            ["rewards"] = {}
        }
    },
    ["defaultTeam"] = v14.SUMMER_2025_TEAM,
    ["bedwarsEventType"] = v6.SUMMER_2025
}
local v19 = {}
local v20 = v14.SUMMER_2025_TEAM
local v21 = {}
local v22 = {
    ["key"] = "summer_2025_timed_goal_1",
    ["maxGoalValue"] = 50000000,
    ["name"] = "Week 1",
    ["description"] = "Kill Players",
    ["endTime"] = 1752271199,
    ["goalType"] = v15.KILLS,
    ["startTime"] = (v2:IsStudio() or v11.isStaging()) and 1751061600 or 1751666400,
    ["rewards"] = {
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_1_reward_1",
            ["personalContributionScoreRequired"] = 2,
            ["globalTeamScoreRequired"] = v11.isStaging() and 2 or 100000,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.LEVEL_UP_CRATE
            },
            ["riddleReward"] = {
                ["lineIndex"] = 0,
                ["riddle"] = v10.SUMMER2025_RIDDLE_1
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_1_reward_2",
            ["personalContributionScoreRequired"] = 5,
            ["globalTeamScoreRequired"] = v11.isStaging() and 5 or 250000,
            ["reward"] = {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v5.SUMMER_2025_CURRENCY
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_1_reward_3",
            ["personalContributionScoreRequired"] = 10,
            ["globalTeamScoreRequired"] = v11.isStaging() and 10 or 500000,
            ["reward"] = {
                ["paid"] = false,
                ["bedCoins"] = 1000
            },
            ["riddleReward"] = {
                ["lineIndex"] = 1,
                ["riddle"] = v10.SUMMER2025_RIDDLE_1
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_1_reward_4",
            ["personalContributionScoreRequired"] = 15,
            ["globalTeamScoreRequired"] = v11.isStaging() and 15 or 1000000,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.LEVEL_UP_CRATE
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_1_reward_5",
            ["personalContributionScoreRequired"] = 20,
            ["globalTeamScoreRequired"] = v11.isStaging() and 20 or 2500000,
            ["reward"] = {
                ["paid"] = false,
                ["emote"] = v8.SPIRIT_CATACHER_TARGET_SHOT
            },
            ["riddleReward"] = {
                ["lineIndex"] = 2,
                ["riddle"] = v10.SUMMER2025_RIDDLE_1
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_1_reward_6",
            ["personalContributionScoreRequired"] = 30,
            ["globalTeamScoreRequired"] = v11.isStaging() and 25 or 10000000,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.LEVEL_UP_CRATE
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_1_reward_7",
            ["personalContributionScoreRequired"] = 40,
            ["globalTeamScoreRequired"] = v11.isStaging() and 30 or 20000000,
            ["reward"] = {
                ["paid"] = false,
                ["bedCoins"] = 2000
            },
            ["riddleReward"] = {
                ["lineIndex"] = 3,
                ["riddle"] = v10.SUMMER2025_RIDDLE_1
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_1_reward_8",
            ["personalContributionScoreRequired"] = 50,
            ["globalTeamScoreRequired"] = v11.isStaging() and 35 or 35000000,
            ["reward"] = {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 5000,
                    ["currency"] = v5.SUMMER_2025_CURRENCY
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_1_reward_9",
            ["globalTeamScoreRequired"] = 50000000,
            ["personalContributionScoreRequired"] = 60,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.DIAMOND_LUCKY_CRATE
            }
        }
    }
}
local v23 = {
    ["key"] = "summer_2025_timed_goal_2",
    ["maxGoalValue"] = 5000000,
    ["name"] = "Week 2",
    ["description"] = "Open Treasure Chests",
    ["endTime"] = 1752875999,
    ["goalType"] = v15.SUMMER_2025_TREASURE_CHESTS,
    ["startTime"] = v2:IsStudio() and 1751666400 or 1752271200,
    ["rewards"] = {
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_2_reward_1",
            ["personalContributionScoreRequired"] = 2,
            ["globalTeamScoreRequired"] = v11.isStaging() and 2 or 50000,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.LEVEL_UP_CRATE
            },
            ["riddleReward"] = {
                ["lineIndex"] = 0,
                ["riddle"] = v10.SUMMER2025_RIDDLE_2
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_2_reward_2",
            ["personalContributionScoreRequired"] = 3,
            ["globalTeamScoreRequired"] = v11.isStaging() and 5 or 100000,
            ["reward"] = {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v5.SUMMER_2025_CURRENCY
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_2_reward_3",
            ["personalContributionScoreRequired"] = 3,
            ["globalTeamScoreRequired"] = v11.isStaging() and 10 or 150000,
            ["reward"] = {
                ["paid"] = false,
                ["bedCoins"] = 1000
            },
            ["riddleReward"] = {
                ["lineIndex"] = 1,
                ["riddle"] = v10.SUMMER2025_RIDDLE_2
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_2_reward_4",
            ["personalContributionScoreRequired"] = 6,
            ["globalTeamScoreRequired"] = v11.isStaging() and 15 or 200000,
            ["reward"] = {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v3.BATTLE_PASS_3X
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_2_reward_5",
            ["personalContributionScoreRequired"] = 9,
            ["globalTeamScoreRequired"] = v11.isStaging() and 20 or 300000,
            ["reward"] = {
                ["paid"] = false,
                ["emote"] = v8.SUMMER_INFERNAL_SHIELDER_CHEERS
            },
            ["riddleReward"] = {
                ["lineIndex"] = 2,
                ["riddle"] = v10.SUMMER2025_RIDDLE_2
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_2_reward_6",
            ["personalContributionScoreRequired"] = 12,
            ["globalTeamScoreRequired"] = v11.isStaging() and 25 or 400000,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.LEVEL_UP_CRATE
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_2_reward_7",
            ["personalContributionScoreRequired"] = 15,
            ["globalTeamScoreRequired"] = v11.isStaging() and 30 or 500000,
            ["reward"] = {
                ["paid"] = false,
                ["bedCoins"] = 2000
            },
            ["riddleReward"] = {
                ["lineIndex"] = 3,
                ["riddle"] = v10.SUMMER2025_RIDDLE_2
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_2_reward_8",
            ["personalContributionScoreRequired"] = 18,
            ["globalTeamScoreRequired"] = v11.isStaging() and 35 or 600000,
            ["reward"] = {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 5000,
                    ["currency"] = v5.SUMMER_2025_CURRENCY
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_2_reward_9",
            ["globalTeamScoreRequired"] = 700000,
            ["personalContributionScoreRequired"] = 21,
            ["reward"] = {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v3.KIT_RENTAL_NORMAL
                }
            }
        }
    }
}
local v24 = {
    ["key"] = "summer_2025_timed_goal_3",
    ["maxGoalValue"] = 5000000,
    ["name"] = "Week 3",
    ["description"] = "Kill Penguins in Survival Mode",
    ["endTime"] = 1753480799,
    ["goalType"] = v15.PENGUINS_KILLED,
    ["startTime"] = v2:IsStudio() and 1752271200 or 1752876000,
    ["rewards"] = {
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_3_reward_1",
            ["personalContributionScoreRequired"] = 0,
            ["globalTeamScoreRequired"] = v11.isStaging() and 2 or 50000,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.LEVEL_UP_CRATE
            },
            ["riddleReward"] = {
                ["lineIndex"] = 0,
                ["riddle"] = v10.SUMMER2025_RIDDLE_3
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_3_reward_2",
            ["personalContributionScoreRequired"] = 10,
            ["globalTeamScoreRequired"] = v11.isStaging() and 5 or 150000,
            ["reward"] = {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v5.SUMMER_2025_CURRENCY
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_3_reward_3",
            ["personalContributionScoreRequired"] = 20,
            ["globalTeamScoreRequired"] = v11.isStaging() and 10 or 300000,
            ["reward"] = {
                ["paid"] = false,
                ["bedCoins"] = 1000
            },
            ["riddleReward"] = {
                ["lineIndex"] = 1,
                ["riddle"] = v10.SUMMER2025_RIDDLE_3
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_3_reward_4",
            ["personalContributionScoreRequired"] = 30,
            ["globalTeamScoreRequired"] = v11.isStaging() and 15 or 600000,
            ["reward"] = {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v3.AUTO_COMPLETE_WEEKLY_MISSION_TICKET
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_3_reward_5",
            ["personalContributionScoreRequired"] = 60,
            ["globalTeamScoreRequired"] = v11.isStaging() and 20 or 950000,
            ["reward"] = {
                ["paid"] = false,
                ["emote"] = v8.ELDER_REEF
            },
            ["riddleReward"] = {
                ["lineIndex"] = 2,
                ["riddle"] = v10.SUMMER2025_RIDDLE_3
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_3_reward_6",
            ["personalContributionScoreRequired"] = 70,
            ["globalTeamScoreRequired"] = v11.isStaging() and 25 or 1350000,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.LEVEL_UP_CRATE
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_3_reward_7",
            ["personalContributionScoreRequired"] = 80,
            ["globalTeamScoreRequired"] = v11.isStaging() and 30 or 2000000,
            ["reward"] = {
                ["paid"] = false,
                ["bedCoins"] = 2000
            },
            ["riddleReward"] = {
                ["lineIndex"] = 3,
                ["riddle"] = v10.SUMMER2025_RIDDLE_3
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_3_reward_8",
            ["personalContributionScoreRequired"] = 90,
            ["globalTeamScoreRequired"] = v11.isStaging() and 35 or 3200000,
            ["reward"] = {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 5000,
                    ["currency"] = v5.SUMMER_2025_CURRENCY
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_3_reward_9",
            ["globalTeamScoreRequired"] = 5000000,
            ["personalContributionScoreRequired"] = 100,
            ["reward"] = {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v3.DIAMOND_LUCKY_CRATE
                }
            }
        }
    }
}
local v25 = {
    ["key"] = "summer_2025_timed_goal_4",
    ["maxGoalValue"] = 2000000,
    ["name"] = "Week 4",
    ["description"] = "Participate In A Match",
    ["endTime"] = 1754085599,
    ["goalType"] = v15.MATCHES_PLAYED,
    ["startTime"] = v2:IsStudio() and 1752876000 or 1753480800,
    ["rewards"] = {
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_4_reward_1",
            ["globalTeamScoreRequired"] = 50000,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.LEVEL_UP_CRATE
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_4_reward_2",
            ["personalContributionScoreRequired"] = 1,
            ["globalTeamScoreRequired"] = v11.isStaging() and 5 or 100000,
            ["reward"] = {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 2000,
                    ["currency"] = v5.SUMMER_2025_CURRENCY
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_4_reward_3",
            ["personalContributionScoreRequired"] = 1,
            ["globalTeamScoreRequired"] = v11.isStaging() and 10 or 200000,
            ["reward"] = {
                ["paid"] = false,
                ["bedCoins"] = 1000
            },
            ["riddleReward"] = {
                ["lineIndex"] = 1,
                ["riddle"] = v10.SUMMER2025_RIDDLE_4
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_4_reward_4",
            ["personalContributionScoreRequired"] = 2,
            ["globalTeamScoreRequired"] = v11.isStaging() and 15 or 400000,
            ["reward"] = {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 2,
                    ["consumableType"] = v3.BATTLE_PASS_2X
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_4_reward_5",
            ["personalContributionScoreRequired"] = 3,
            ["globalTeamScoreRequired"] = v11.isStaging() and 20 or 700000,
            ["reward"] = {
                ["paid"] = false,
                ["emote"] = v8.DESSERT_MARINA
            },
            ["riddleReward"] = {
                ["lineIndex"] = 2,
                ["riddle"] = v10.SUMMER2025_RIDDLE_4
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_4_reward_6",
            ["personalContributionScoreRequired"] = 4,
            ["globalTeamScoreRequired"] = v11.isStaging() and 25 or 1000000,
            ["reward"] = {
                ["paid"] = false,
                ["crate"] = v9.LEVEL_UP_CRATE
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_4_reward_7",
            ["personalContributionScoreRequired"] = 5,
            ["globalTeamScoreRequired"] = v11.isStaging() and 30 or 1400000,
            ["reward"] = {
                ["paid"] = false,
                ["bedCoins"] = 2000
            },
            ["riddleReward"] = {
                ["lineIndex"] = 3,
                ["riddle"] = v10.SUMMER2025_RIDDLE_4
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_4_reward_8",
            ["personalContributionScoreRequired"] = 6,
            ["globalTeamScoreRequired"] = v11.isStaging() and 35 or 1900000,
            ["reward"] = {
                ["paid"] = false,
                ["eventCurrency"] = {
                    ["amount"] = 5000,
                    ["currency"] = v5.SUMMER_2025_CURRENCY
                }
            }
        },
        {
            ["globalTeamRewardId"] = "summer_2025_timed_goal_4_reward_9",
            ["globalTeamScoreRequired"] = 2500000,
            ["personalContributionScoreRequired"] = 7,
            ["reward"] = {
                ["paid"] = false,
                ["consumable"] = {
                    ["amount"] = 1,
                    ["consumableType"] = v3.KIT_RENTAL_NORMAL
                }
            }
        }
    }
}
__set_list(v21, 1, {v22, v23, v24, v25})
v19[v20] = v21
v18.timedGoals = v19
v16[v17] = v18
return {
    ["GlobalTeamEvents"] = v16
}