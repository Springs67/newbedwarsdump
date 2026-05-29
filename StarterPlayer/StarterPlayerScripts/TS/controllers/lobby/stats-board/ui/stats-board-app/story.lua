local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stats", "queue-stats-util").QueueStatsUtil
local u9 = v1.import(script, script.Parent, "stats-board-app").StatsBoard
return function(p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u6
        [4] = u7
        [5] = u5
        [6] = u3
        [7] = u9
        [8] = u4
    --]]
    local v11 = {}
    for v12, v13 in u8.makeStarterBedwarsQueueStats() do
        v11[v12] = v13
    end
    v11.firstPlayTime = 0
    v11.lastPlayTime = 0
    v11.wins = 162
    v11.losses = 72
    v11.ties = 0
    v11.earlyLeaves = 0
    v11.matches = 23
    v11.kills = 56532
    v11.deaths = 343
    v11.currentWinStreak = 3
    v11.highestWinStreak = 7
    v11.bedBreaks = 3
    v11.finalKills = 5
    v11.damage = 0
    v11.healing = 0
    v11.totalPlayTime = 0
    v11.damageTaken = 0
    v11.knockIntoVoid = 0
    v11.blockBreaks = 0
    v11.blocksPlaced = 0
    v11.projectilesUsed = 0
    v11.projectileDamage = 0
    v11.arrowDamage = 0
    v11.ironCollected = 0
    v11.diamondCollected = 0
    v11.emeraldCollected = 0
    v11.diamondGuardianKills = 0
    v11.titanKills = 0
    v11.telepearlsUsed = 0
    v11.telepearlBlocksTravelled = 0
    v11.enchants = 0
    v11.multiKills = 0
    v11.highestKillStreak = 0
    v11.highestMultiKillChain = 0
    local u14 = {}
    for v15, v16 in u8.makeStarterBedwarsQueueStats() do
        u14[v15] = v16
    end
    u14.firstPlayTime = 0
    u14.lastPlayTime = 0
    u14.wins = 162
    u14.losses = 72
    u14.ties = 0
    u14.earlyLeaves = 0
    u14.matches = 23
    u14.kills = 5632
    u14.deaths = 343
    u14.currentWinStreak = 32
    u14.highestWinStreak = 734
    u14.bedBreaks = 333
    u14.finalKills = 533
    u14.damage = 0
    u14.healing = 0
    u14.totalPlayTime = 0
    u14.damageTaken = 0
    u14.knockIntoVoid = 0
    u14.blockBreaks = 0
    u14.blocksPlaced = 0
    u14.projectilesUsed = 0
    u14.projectileDamage = 0
    u14.arrowDamage = 0
    u14.ironCollected = 0
    u14.diamondCollected = 0
    u14.emeraldCollected = 0
    u14.diamondGuardianKills = 0
    u14.titanKills = 0
    u14.telepearlsUsed = 0
    u14.telepearlBlocksTravelled = 0
    u14.enchants = 0
    u14.multiKills = 0
    u14.highestKillStreak = 0
    u14.highestMultiKillChain = 0
    local v17 = u2.values(u6)
    local function v22(p18) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u14
        --]]
        if p18 ~= u7.activeRankMeta.queueType then
            return { p18, u14 }
        end
        local v19 = {}
        for v20, v21 in u14 do
            v19[v20] = v21
        end
        v19.lastPlayTime = os.time() - 172800
        return { p18, v19 }
    end
    local v23 = table.create(#v17)
    for v24, v25 in v17 do
        v23[v24] = v22(v25, v24 - 1, v17)
    end
    u5:dispatch({
        ["type"] = "SetStats",
        ["globalStats"] = v11,
        ["queues"] = u2.fromEntries(v23),
        ["rankStats"] = {
            ["rankPoints"] = 3800,
            ["matchesPlayed"] = 6,
            ["leaderboardPosition"] = -1
        }
    })
    local u33 = u4("stats-board", function(p26) --[[ Name: statsBoard, Line 121 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u9
        --]]
        local v27 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromOffset(437, 700)
        }
        local v28 = {}
        local v29 = #v28
        local v30 = {}
        for v31, v32 in p26 do
            v30[v31] = v32
        end
        v28[v29 + 1] = u3.createElement(u9, v30)
        return u3.createElement("Frame", v27, v28)
    end, {}, {}, {
        ["Parent"] = p10
    })
    return function() --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u33
        --]]
        u3.unmount(u33)
    end
end