local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types").GlobalTeamEventKey
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil
local v7 = {}
local v8 = {
    ["metaId"] = "daily_collection",
    ["name"] = "Collect 30 Shell",
    ["rewardAmount"] = 2000,
    ["layoutOrder"] = 1,
    ["guaranteedSelection"] = true,
    ["stages"] = {
        {
            ["type"] = "CollectShellCoins",
            ["progress"] = 30
        }
    },
    ["currencyReward"] = v2.SUMMER_2025_CURRENCY,
    ["reward"] = {
        ["name"] = "Shell Contributions",
        ["icon"] = v4.SHELL_COIN,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["globalTeamCurrency"] = {
                    ["amount"] = 25,
                    ["eventKey"] = v3.SUMMER_2025
                }
            }
        }
    }
}
local v9 = {
    ["metaId"] = "daily_collection_2",
    ["name"] = "Collect 15 Shell (Losing Team Only)",
    ["rewardAmount"] = 0,
    ["layoutOrder"] = 1,
    ["guaranteedSelection"] = true,
    ["stages"] = {
        {
            ["type"] = "CollectShellCoins",
            ["progress"] = 15
        }
    },
    ["reward"] = {
        ["name"] = "Shell Contributions",
        ["icon"] = v4.SHELL_COIN,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["globalTeamCurrency"] = {
                    ["amount"] = 25,
                    ["eventKey"] = v3.SUMMER_2025
                }
            }
        }
    },
    ["globalTeamConfig"] = {
        ["activeIf"] = "LOSING",
        ["eventKey"] = v3.SUMMER_2025
    }
}
local v10 = {
    ["name"] = "Break 2 beds",
    ["rewardAmount"] = 2000,
    ["stages"] = {
        {
            ["type"] = "BedBreak",
            ["progress"] = 2
        }
    },
    ["currencyReward"] = v2.SUMMER_2025_CURRENCY,
    ["reward"] = {
        ["name"] = "Shell Contributions",
        ["icon"] = v4.SHELL_COIN,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["globalTeamCurrency"] = {
                    ["amount"] = 20,
                    ["eventKey"] = v3.SUMMER_2025
                }
            }
        }
    }
}
local v11 = {
    ["name"] = "Perform 2 final kills",
    ["rewardAmount"] = 2000,
    ["stages"] = {
        {
            ["type"] = "FinalKill",
            ["progress"] = 2
        }
    },
    ["currencyReward"] = v2.SUMMER_2025_CURRENCY,
    ["reward"] = {
        ["name"] = "Shell Contributions",
        ["icon"] = v4.SHELL_COIN,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["globalTeamCurrency"] = {
                    ["amount"] = 20,
                    ["eventKey"] = v3.SUMMER_2025
                }
            }
        }
    }
}
local v12 = {
    ["name"] = "Deal 1,000 damage to other players",
    ["rewardAmount"] = 2000,
    ["stages"] = {
        {
            ["type"] = "PlayerDamage",
            ["progress"] = 2000
        }
    },
    ["currencyReward"] = v2.SUMMER_2025_CURRENCY,
    ["reward"] = {
        ["name"] = "Shell Contributions",
        ["icon"] = v4.SHELL_COIN,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["globalTeamCurrency"] = {
                    ["amount"] = 20,
                    ["eventKey"] = v3.SUMMER_2025
                }
            }
        }
    }
}
local v13 = {
    ["name"] = "Kill 4 other players",
    ["rewardAmount"] = 2000,
    ["stages"] = {
        {
            ["type"] = "PlayerKill",
            ["progress"] = 4
        }
    },
    ["currencyReward"] = v2.SUMMER_2025_CURRENCY,
    ["reward"] = {
        ["name"] = "Shell Contributions",
        ["icon"] = v4.SHELL_COIN,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["globalTeamCurrency"] = {
                    ["amount"] = 20,
                    ["eventKey"] = v3.SUMMER_2025
                }
            }
        }
    }
}
local v14 = {
    ["name"] = "Purchase the Crossbow",
    ["rewardAmount"] = 2000,
    ["stages"] = {
        {
            ["type"] = "ShopPurchase",
            ["progress"] = 1,
            ["resource"] = v5.WOOD_CROSSBOW or v5.FLOWER_CROSSBOW or (v5.TACTICAL_CROSSBOW or v5.FALCONER_CROSSBOW)
        }
    },
    ["currencyReward"] = v2.SUMMER_2025_CURRENCY,
    ["reward"] = {
        ["name"] = "Shell Contributions",
        ["icon"] = v4.SHELL_COIN,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["globalTeamCurrency"] = {
                    ["amount"] = 20,
                    ["eventKey"] = v3.SUMMER_2025
                }
            }
        }
    }
}
__set_list(v7, 1, {v8, v9, v10, v11, v12, v13, v14, {
    ["name"] = "Research 2 enchants",
    ["rewardAmount"] = 2000,
    ["stages"] = {
        {
            ["type"] = "GetEnchant",
            ["progress"] = 2
        }
    },
    ["currencyReward"] = v2.SUMMER_2025_CURRENCY,
    ["reward"] = {
        ["name"] = "Shell Contributions",
        ["icon"] = v4.SHELL_COIN,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["globalTeamCurrency"] = {
                    ["amount"] = 20,
                    ["eventKey"] = v3.SUMMER_2025
                }
            }
        }
    }
}, {
    ["name"] = "Purchase Obsidian Blocks",
    ["rewardAmount"] = 2000,
    ["stages"] = {
        {
            ["type"] = "ShopPurchase",
            ["progress"] = 2,
            ["resource"] = v5.OBSIDIAN
        }
    },
    ["currencyReward"] = v2.SUMMER_2025_CURRENCY,
    ["reward"] = {
        ["name"] = "Shell Contributions",
        ["icon"] = v4.SHELL_COIN,
        ["rewards"] = {
            {
                ["paid"] = false,
                ["globalTeamCurrency"] = {
                    ["amount"] = 20,
                    ["eventKey"] = v3.SUMMER_2025
                }
            }
        }
    }
}})
local v15 = {}
local v16 = #v15
table.move(v7, 1, #v7, v16 + 1, v15)
local v17 = v6.generateMissions(v15, v2.SUMMER_2025_CURRENCY)
local v18 = {
    {
        ["metaId"] = "weekly_collection",
        ["name"] = "Collect 150 Shells",
        ["rewardAmount"] = 6000,
        ["layoutOrder"] = 1,
        ["guaranteedSelection"] = true,
        ["stages"] = {
            {
                ["type"] = "CollectShellCoins",
                ["progress"] = 150
            }
        },
        ["currencyReward"] = v2.SUMMER_2025_CURRENCY,
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 100,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    },
    {
        ["name"] = "Play 15 Games",
        ["rewardAmount"] = 6000,
        ["stages"] = {
            {
                ["type"] = "GamePlay",
                ["progress"] = 15
            }
        },
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 75,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    },
    {
        ["name"] = "Spend 70 Diamonds",
        ["rewardAmount"] = 6000,
        ["stages"] = {
            {
                ["type"] = "SpendResource",
                ["progress"] = 70,
                ["resource"] = v5.DIAMOND
            }
        },
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 75,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    },
    {
        ["name"] = "Break 8 Beds",
        ["rewardAmount"] = 6000,
        ["stages"] = {
            {
                ["type"] = "BedBreak",
                ["progress"] = 8
            }
        },
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 75,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    },
    {
        ["name"] = "Perform 15 final kills",
        ["rewardAmount"] = 6000,
        ["stages"] = {
            {
                ["type"] = "FinalKill",
                ["progress"] = 15
            }
        },
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 75,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    },
    {
        ["name"] = "Deal 12,000 damage to other players",
        ["rewardAmount"] = 6000,
        ["stages"] = {
            {
                ["type"] = "PlayerDamage",
                ["progress"] = 12000
            }
        },
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 75,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    },
    {
        ["name"] = "Kill 40 other players",
        ["rewardAmount"] = 6000,
        ["stages"] = {
            {
                ["type"] = "PlayerKill",
                ["progress"] = 40
            }
        },
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 75,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    },
    {
        ["name"] = "Win 12 Games",
        ["rewardAmount"] = 6000,
        ["stages"] = {
            {
                ["type"] = "GameWin",
                ["progress"] = 12
            }
        },
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 75,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    },
    {
        ["name"] = "Earn 21,600 points from time spent playing games",
        ["rewardAmount"] = 6000,
        ["stages"] = {
            {
                ["type"] = "GamePlayTime",
                ["progress"] = 21600
            }
        },
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 75,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    },
    {
        ["name"] = "Spend 80 Emeralds",
        ["rewardAmount"] = 6000,
        ["stages"] = {
            {
                ["type"] = "SpendResource",
                ["progress"] = 80,
                ["resource"] = v5.EMERALD
            }
        },
        ["reward"] = {
            ["name"] = "Shell Contributions",
            ["icon"] = v4.SHELL_COIN,
            ["rewards"] = {
                {
                    ["paid"] = false,
                    ["globalTeamCurrency"] = {
                        ["amount"] = 75,
                        ["eventKey"] = v3.SUMMER_2025
                    }
                }
            }
        }
    }
}
local v19 = {}
local v20 = #v19
table.move(v18, 1, #v18, v20 + 1, v19)
return {
    ["DAILY_SHELL_COINS_REQUIRED"] = 30,
    ["WEEKLY_SHELL_COINS_REQUIRED"] = 150,
    ["Summer_2025_Extended_Daily_Missions"] = v17,
    ["Summer_2025_Extended_Weekly_Missions"] = v6.generateMissions(v19, v2.SUMMER_2025_CURRENCY)
}