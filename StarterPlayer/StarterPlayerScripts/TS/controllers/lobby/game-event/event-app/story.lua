local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-system").CheckInSystem
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types")
local u13 = v12.GlobalTeamEventKey
local u14 = v12.GlobalTeamKey
local u15 = v1.import(script, script.Parent, "event-app").EventApp
return function(p16) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u4
        [4] = u15
        [5] = u5
        [6] = u11
        [7] = u14
        [8] = u10
        [9] = u9
        [10] = u2
        [11] = u13
        [12] = u6
        [13] = u3
    --]]
    local v17 = u8.EGG_HUNT_2026
    local v18 = u7[v17]
    local _ = v18.currencies[1]
    local u19 = u4("EventApp", u15, {
        ["event"] = v17
    }, {}, {
        ["Parent"] = p16
    })
    local v20 = u5
    local v21 = {}
    local v22 = {
        ["type"] = "SetEventDataAll"
    }
    for v23, v24 in u11.makeStarterEventData() do
        v21[v23] = v24
    end
    local v25 = {}
    local v26 = {
        ["totalGlobalTeamContribution"] = 100000,
        ["globalTeamKey"] = u14.SUMMER_2025_TEAM,
        ["timedGoals"] = {
            [u14.SUMMER_2025_TEAM] = {
                ["summer_2025_timed_goal_1"] = 50000,
                ["summer_2025_timed_goal_2"] = 100000,
                ["summer_2025_timed_goal_3"] = 500000,
                ["summer_2025_timed_goal_4"] = 1000000
            }
        },
        ["claimedGlobalTeamRewards"] = { "summer_2025_timed_goal_1_reward_1", "summer_2025_timed_goal_2_reward_1" },
        ["itemsPurchased"] = {
            {
                ["item"] = u10.HALLOWEEN_EMOTE,
                ["time"] = os.time()
            }
        },
        ["missionsClaimed"] = {},
        ["totalEnvelopesCollected"] = {
            ["tier1"] = 0,
            ["tier2"] = 0,
            ["tier3"] = 0
        },
        ["dailyEnvelopesCollected"] = {
            ["tier1"] = 0,
            ["tier2"] = 0,
            ["tier3"] = 0
        }
    }
    v25[v17] = v26
    v21.events = v25
    v22.eventData = v21
    v20:dispatch(v22)
    local v27 = {}
    for v28, v29 in v18.missionGenerators do
        local _ = v28 - 1
        local v30 = u9.convertMissionsToDataStore(v17, v29.pool, v29.id)
        v27[v29.id] = u2.randomArraySelectN(v30, v29.selectAmount)
    end
    local v31 = u5
    local v32 = {
        ["type"] = "SetEventPartial"
    }
    local v33 = {
        ["activeMissions"] = {
            [v17] = v27
        }
    }
    v32.data = v33
    v31:dispatch(v32)
    local v34 = u5
    local v35 = {
        ["type"] = "SetEventGlobalTeamDataSingle",
        ["key"] = u13.SUMMER_2025
    }
    local v36 = {}
    local v37 = {
        [u14.SUMMER_2025_TEAM] = {
            ["score"] = 0,
            ["memberCount"] = 2,
            ["timedGoalsData"] = {
                ["summer_2025_timed_goal_1"] = 450000,
                ["summer_2025_timed_goal_2"] = 50000,
                ["summer_2025_timed_goal_3"] = 50000,
                ["summer_2025_timed_goal_4"] = 50000
            }
        }
    }
    v36.globalTeams = v37
    v35.data = v36
    v34:dispatch(v35)
    u5:dispatch({
        ["type"] = "SetEventGlobalTeamKeySingle",
        ["key"] = u13.SUMMER_2025,
        ["data"] = u14.SUMMER_2025_TEAM
    })
    local v38 = u5
    local v39 = {
        ["type"] = "LobbySetCheckInData",
        ["system"] = u6.LNY_2025,
        ["data"] = {
            ["checkIns"] = {
                {
                    ["time"] = 1737760854
                },
                {
                    ["time"] = 1737915635
                },
                {
                    ["time"] = 1737946041
                },
                {
                    ["time"] = 1738103400
                }
            }
        }
    }
    v38:dispatch(v39)
    return function() --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u19
        --]]
        return u3.unmount(u19)
    end
end