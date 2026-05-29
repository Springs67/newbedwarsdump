local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "event-reducer").EventReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-milestone-meta").EggHunt2026MilestoneMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-milestone-reward-meta").Easter2026MilestoneRewardMeta
local u14 = v1.import(script, script.Parent, "egg-hunt-board-core").EggHuntBoardCore
return function(p15) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u9
        [4] = u4
        [5] = u6
        [6] = u5
        [7] = u11
        [8] = u10
        [9] = u2
        [10] = u12
        [11] = u13
        [12] = u14
        [13] = u3
    --]]
    local v16 = u8.EASTER_2023
    local v17 = {}
    for v18, v19 in u7[v16].missionGenerators do
        local _ = v18 - 1
        local v20 = u9.convertMissionsToDataStore(v16, v19.pool, v19.id)
        v17[v19.id] = v20
    end
    local v21 = {
        ["Game"] = u6,
        ["Event"] = u5
    }
    local v22 = u4.combineReducers(v21)
    local v23 = {}
    local v24 = {}
    local v25 = {}
    for v26, v27 in u11.makeStarterEventData() do
        v23[v26] = v27
    end
    v23.events = {
        [v16] = {
            ["itemsPurchased"] = {
                {
                    ["item"] = u10.HALLOWEEN_EMOTE,
                    ["time"] = os.time()
                }
            },
            ["missionsClaimed"] = {},
            ["claimedEggs"] = {}
        }
    }
    v24.profileData = v23
    v24.activeMissions = {
        [v16] = v17
    }
    v25.Event = v24
    local v28 = u4.Store.new(v22, v25)
    local v29 = u2
    local v30 = {
        ["store"] = v28
    }
    local v31 = {}
    local v32 = #v31
    local v33 = {
        ["milestoneMeta"] = u12,
        ["milestoneRewardsMeta"] = u13
    }
    local v34 = v28:getState().Event.profileData.events[v16]
    if v34 ~= nil then
        local v35 = v34.claimedEggs
        v34 = v35 ~= nil and #v35 or v35
    end
    v33.numEggsCollected = v34 == nil and 0 or v34
    v31[v32 + 1] = u2.createElement(u14, v33)
    local u36 = v29.mount(u2.createElement(u3, v30, v31), p15)
    return function() --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u36
        --]]
        return u2.unmount(u36)
    end
end