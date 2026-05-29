local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {}
local v3 = {
    ["name"] = "Purchase the Crossbow",
    ["rewardAmount"] = 1000,
    ["stages"] = {
        {
            ["type"] = "ShopPurchase",
            ["progress"] = 1,
            ["resource"] = v1.WOOD_CROSSBOW or v1.FLOWER_CROSSBOW or (v1.TACTICAL_CROSSBOW or v1.FALCONER_CROSSBOW)
        }
    }
}
__set_list(v2, 1, {{
    ["name"] = "Break 2 beds",
    ["rewardAmount"] = 1000,
    ["stages"] = {
        {
            ["type"] = "BedBreak",
            ["progress"] = 2
        }
    }
}, {
    ["name"] = "Perform 2 final kills",
    ["rewardAmount"] = 1000,
    ["stages"] = {
        {
            ["type"] = "FinalKill",
            ["progress"] = 2
        }
    }
}, {
    ["name"] = "Deal 1,000 damage to other players",
    ["rewardAmount"] = 1000,
    ["stages"] = {
        {
            ["type"] = "PlayerDamage",
            ["progress"] = 1000
        }
    }
}, {
    ["name"] = "Kill 4 other players",
    ["rewardAmount"] = 1000,
    ["stages"] = {
        {
            ["type"] = "PlayerKill",
            ["progress"] = 4
        }
    }
}, v3, {
    ["name"] = "Research 2 enchants",
    ["rewardAmount"] = 1000,
    ["stages"] = {
        {
            ["type"] = "GetEnchant",
            ["progress"] = 2
        }
    }
}, {
    ["name"] = "Purchase Obsidian Blocks",
    ["rewardAmount"] = 1000,
    ["stages"] = {
        {
            ["type"] = "ShopPurchase",
            ["progress"] = 2,
            ["resource"] = v1.OBSIDIAN
        }
    }
}})
return {
    ["Base_Event_DailyMissions"] = v2,
    ["Base_Event_WeeklyMissions"] = {
        {
            ["name"] = "Play 15 Games",
            ["rewardAmount"] = 5000,
            ["stages"] = {
                {
                    ["type"] = "GamePlay",
                    ["progress"] = 15
                }
            }
        },
        {
            ["name"] = "Spend 70 Diamonds",
            ["rewardAmount"] = 5000,
            ["stages"] = {
                {
                    ["type"] = "SpendResource",
                    ["progress"] = 70,
                    ["resource"] = v1.DIAMOND
                }
            }
        },
        {
            ["name"] = "Break 8 Beds",
            ["rewardAmount"] = 5000,
            ["stages"] = {
                {
                    ["type"] = "BedBreak",
                    ["progress"] = 8
                }
            }
        },
        {
            ["name"] = "Perform 15 final kills",
            ["rewardAmount"] = 5000,
            ["stages"] = {
                {
                    ["type"] = "FinalKill",
                    ["progress"] = 15
                }
            }
        },
        {
            ["name"] = "Deal 12,000 damage to other players",
            ["rewardAmount"] = 5000,
            ["stages"] = {
                {
                    ["type"] = "PlayerDamage",
                    ["progress"] = 12000
                }
            }
        },
        {
            ["name"] = "Kill 40 other players",
            ["rewardAmount"] = 5000,
            ["stages"] = {
                {
                    ["type"] = "PlayerKill",
                    ["progress"] = 40
                }
            }
        },
        {
            ["name"] = "Win 12 Games",
            ["rewardAmount"] = 5000,
            ["stages"] = {
                {
                    ["type"] = "GameWin",
                    ["progress"] = 12
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
            }
        },
        {
            ["name"] = "Spend 80 Emeralds",
            ["rewardAmount"] = 5000,
            ["stages"] = {
                {
                    ["type"] = "SpendResource",
                    ["progress"] = 80,
                    ["resource"] = v1.EMERALD
                }
            }
        }
    }
}