local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-types").PlayfabLeaderboard
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory
local u5 = {
    [v4.RANKED_S16] = {
        ["queueType"] = v2.BEDWARS_RANKED_S16,
        ["leaderboard"] = v3.RankPoints_S16
    },
    [v4.RANKED_S15] = {
        ["queueType"] = v2.BEDWARS_RANKED_S15,
        ["leaderboard"] = v3.RankPoints_S15
    },
    [v4.RANKED_S14] = {
        ["queueType"] = v2.BEDWARS_RANKED_S14,
        ["leaderboard"] = v3.RankPoints_S14
    },
    [v4.RANKED_S13] = {
        ["queueType"] = v2.BEDWARS_RANKED_S13,
        ["leaderboard"] = v3.RankPoints_S13
    },
    [v4.RANKED_S12] = {
        ["queueType"] = v2.BEDWARS_RANKED_S12,
        ["leaderboard"] = v3.RankPoints_S12
    },
    [v4.RANKED_S11] = {
        ["queueType"] = v2.BEDWARS_RANKED_S11,
        ["leaderboard"] = v3.RankPoints_S11
    },
    [v4.RANKED_S10] = {
        ["queueType"] = v2.BEDWARS_RANKED_S10,
        ["leaderboard"] = v3.RankPoints_S10
    },
    [v4.RANKED_S9] = {
        ["queueType"] = v2.BEDWARS_RANKED_S9,
        ["leaderboard"] = v3.RankPoints_S9
    },
    [v4.RANKED_S8] = {
        ["queueType"] = v2.BEDWARS_RANKED_S8,
        ["leaderboard"] = v3.RankPoints_S8
    },
    [v4.RANKED_S7] = {
        ["queueType"] = v2.BEDWARS_RANKED_S7,
        ["leaderboard"] = v3.RankPoints_S7
    },
    [v4.RANKED_S6] = {
        ["queueType"] = v2.BEDWARS_RANKED_S6,
        ["leaderboard"] = v3.RankPoints_S6_2
    },
    [v4.RANKED_S5] = {
        ["queueType"] = v2.BEDWARS_RANKED_S5,
        ["leaderboard"] = v3.RankPoints_S5
    },
    [v4.RANKED_S4] = {
        ["queueType"] = v2.BEDWARS_RANKED_S4,
        ["leaderboard"] = v3.RankPoints
    },
    [v4.RANKED_BETA] = {
        ["queueType"] = v2.BEDWARS_RANKED_BETA,
        ["leaderboard"] = v3.RankPoints
    }
}
return {
    ["getRankCategoryMeta"] = function(p6) --[[ Name: getRankCategoryMeta, Line 64 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        return u5[p6]
    end,
    ["RankCategoryMeta"] = u5
}