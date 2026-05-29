local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta")
local u6 = v5.DEFAULT_LEADERBOARD_TO_DISPLAY
local u7 = v5.getLeaderboardMeta
local u8 = v5.getLeaderboardsToDisplay
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-types").PlayfabLeaderboard
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-distribution").RankDistribution
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u13 = v1.import(script, script.Parent, "leaderboard-core").LeaderboardCore
return function(p14) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u7
        [4] = u10
        [5] = u11
        [6] = u12
        [7] = u8
        [8] = u6
        [9] = u2
        [10] = u13
        [11] = u3
    --]]
    local v15 = table.create(100, "")
    local v16 = table.create(#v15)
    local function v20(_, p17) --[[ Line: 18 ]]
        local v18 = {
            ["userId"] = 1,
            ["username"] = "ExamplePlayer" .. tostring(p17)
        }
        local v19 = math.random
        v18.avatarImage = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v19(100000000, 999999999)) .. "&w=60&h=60"
        v18.statValue = math.random(1400, 3000)
        return v18
    end
    for v21, v22 in v15 do
        v16[v21] = v20(v22, v21 - 1, v15)
    end
    table.sort(v16, function(p23, p24) --[[ Line: 33 ]]
        return p23.statValue > p24.statValue
    end)
    local v25 = u4
    local v26 = {
        ["type"] = "UpdateLeaderboard",
        ["leaderboard"] = u9.WinsMonthly
    }
    local v27 = {}
    for v28, v29 in u7(u9.WinsMonthly) do
        v27[v28] = v29
    end
    v27.nextReset = os.time() + math.random(100000, 1000000)
    v27.lastRefresh = os.time() - math.random(100, 1000)
    v27.users = v16
    v27.leaderboardPosition = 63735
    v27.localStatValue = 4667
    v26.data = v27
    v25:dispatch(v26)
    local v30 = u10:getDisplayedRank(0, -1)
    local v31 = u11[v30.division]
    local v32 = {
        ["rankStatValue"] = 25,
        ["image"] = v31.image,
        ["rankName"] = v31.name
    }
    local v33 = u4
    local v34 = {
        ["type"] = "UpdateLeaderboard",
        ["leaderboard"] = u12.activeRankMeta.leaderboard
    }
    local v35 = {}
    for v36, v37 in u7(u12.activeRankMeta.leaderboard) do
        v35[v36] = v37
    end
    v35.lastRefresh = os.time() - math.random(100, 1000)
    local function v44(p38) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
        --]]
        local v39 = u10:getDisplayedRank(p38.statValue, -1)
        local v40 = u11[v39.division]
        local v41 = {}
        for v42, v43 in p38 do
            v41[v42] = v43
        end
        v41.statRank = {
            ["rankStatValue"] = 75,
            ["image"] = v40.image,
            ["rankName"] = v40.name
        }
        v41.statValue = v39.rankPoints
        return v41
    end
    local v45 = table.create(#v16)
    for v46, v47 in v16 do
        v45[v46] = v44(v47, v46 - 1, v16)
    end
    v35.users = v45
    v35.leaderboardPosition = 63735
    v35.localStatRank = v32
    v35.localStatValue = v30.rankPoints
    v34.data = v35
    v33:dispatch(v34)
    local u55 = u3("LeaderboardApp", function(p48) --[[ Name: leaderboard, Line 101 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u2
            [4] = u13
        --]]
        local v49 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromOffset(437, 700)
        }
        local v50 = {}
        local v51 = #v50
        local v52 = {
            ["Leaderboards"] = u8(),
            ["DefaultLeaderboard"] = u6
        }
        for v53, v54 in p48 do
            v52[v53] = v54
        end
        v50[v51 + 1] = u2.createElement(u13, v52)
        return u2.createElement("Frame", v49, v50)
    end, {
        ["LeaderboardName"] = u12.activeRankMeta.leaderboard
    }, {}, {
        ["Parent"] = p14
    })
    return function() --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u55
        --]]
        u2.unmount(u55)
    end
end