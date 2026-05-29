local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata")
local v5 = v4.EventCurrencyType
local v6 = v4.EventType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-event-meta").GlobalTeamEvents
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types")
local v9 = v8.GlobalTeamEventKey
local v10 = v8.GlobalTeamKey
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "riddle", "riddles").Riddle
local v13 = {
    ["dailyEventCurrencyTreasureLimit"] = 3,
    ["possibleTreasureChestEventCurrencyValues"] = { 500, 750, 1000 },
    ["perMatchTreasureLimit"] = nil,
    ["inMatchRewards"] = {
        {
            ["minMatchTime"] = 600,
            ["rewards"] = {
                {
                    ["itemType"] = v11.EMERALD,
                    ["amountRange"] = { 2, 3 }
                },
                {
                    ["itemType"] = v11.IRON,
                    ["amountRange"] = { 100, 160 }
                }
            }
        },
        {
            ["minMatchTime"] = 300,
            ["rewards"] = {
                {
                    ["itemType"] = v11.EMERALD,
                    ["amountRange"] = { 1, 2 }
                },
                {
                    ["itemType"] = v11.IRON,
                    ["amountRange"] = { 100, 160 }
                }
            }
        },
        {
            ["minMatchTime"] = 0,
            ["rewards"] = {
                {
                    ["itemType"] = v11.IRON,
                    ["amountRange"] = { 100, 160 }
                }
            }
        }
    },
    ["disableBuyingTreasureMapAttribute"] = "Summer2025_DisableBuyingTreasureMap"
}
local v14 = {}
local v15 = v12.SUMMER2025_RIDDLE_1
local v16 = {}
local v17 = v7[v9.SUMMER_2025].timedGoals
if v17 ~= nil then
    v17 = v17[v10.SUMMER_2025_TEAM]
    if v17 ~= nil then
        v17 = v17[1].startTime
    end
end
v16.startDate = v17 == nil and 0 or v17
v16.endDate = v3[v6.SUMMER_2025].endDate
v16.order = 1
v16.rewards = {
    {
        ["eventCurrency"] = {
            ["amount"] = 4000,
            ["currency"] = v5.SUMMER_2025_CURRENCY
        }
    },
    {
        ["bedCoins"] = 1000
    }
}
v14[v15] = v16
local v18 = v12.SUMMER2025_RIDDLE_2
local v19 = {}
local v20 = v7[v9.SUMMER_2025].timedGoals
if v20 ~= nil then
    v20 = v20[v10.SUMMER_2025_TEAM]
    if v20 ~= nil then
        v20 = v20[2].startTime
    end
end
v19.startDate = v20 == nil and 0 or v20
v19.endDate = v3[v6.SUMMER_2025].endDate
v19.order = 2
v19.rewards = {
    {
        ["eventCurrency"] = {
            ["amount"] = 4000,
            ["currency"] = v5.SUMMER_2025_CURRENCY
        }
    },
    {
        ["consumable"] = {
            ["amount"] = 1,
            ["consumableType"] = v2.BATTLE_PASS_3X
        }
    }
}
v14[v18] = v19
local v21 = v12.SUMMER2025_RIDDLE_3
local v22 = {}
local v23 = v7[v9.SUMMER_2025].timedGoals
if v23 ~= nil then
    v23 = v23[v10.SUMMER_2025_TEAM]
    if v23 ~= nil then
        v23 = v23[3].startTime
    end
end
v22.startDate = v23 == nil and 0 or v23
v22.endDate = v3[v6.SUMMER_2025].endDate
v22.order = 3
v22.rewards = {
    {
        ["eventCurrency"] = {
            ["amount"] = 4000,
            ["currency"] = v5.SUMMER_2025_CURRENCY
        }
    },
    {
        ["consumable"] = {
            ["amount"] = 1,
            ["consumableType"] = v2.AUTO_COMPLETE_WEEKLY_MISSION_TICKET
        }
    }
}
v14[v21] = v22
local v24 = v12.SUMMER2025_RIDDLE_4
local v25 = {}
local v26 = v7[v9.SUMMER_2025].timedGoals
if v26 ~= nil then
    v26 = v26[v10.SUMMER_2025_TEAM]
    if v26 ~= nil then
        v26 = v26[4].startTime
    end
end
v25.startDate = v26 == nil and 0 or v26
v25.endDate = v3[v6.SUMMER_2025].endDate
v25.order = 4
v25.rewards = {
    {
        ["eventCurrency"] = {
            ["amount"] = 4000,
            ["currency"] = v5.SUMMER_2025_CURRENCY
        }
    },
    {
        ["bedCoins"] = 1000
    }
}
v14[v24] = v25
v13.treasureRiddles = v14
v13.timedGoalToRiddle = {
    ["summer_2025_timed_goal_1"] = v12.SUMMER2025_RIDDLE_1,
    ["summer_2025_timed_goal_2"] = v12.SUMMER2025_RIDDLE_2,
    ["summer_2025_timed_goal_3"] = v12.SUMMER2025_RIDDLE_3,
    ["summer_2025_timed_goal_4"] = v12.SUMMER2025_RIDDLE_4
}
return {
    ["Summer2025Constants"] = v13
}