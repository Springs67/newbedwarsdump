return {
    ["RANK_DECAY_GRACE_SECONDS"] = 1209600,
    ["RANK_DECAY_INTERVAL_SECONDS"] = 86400,
    ["RANK_DECAY_RP_PER_DAY"] = 50,
    ["RANK_DECAY_WARNING_SECONDS"] = 259200,
    ["RANK_DECAY_WARNING_COOLDOWN_SECONDS"] = 21600,
    ["RANK_DECAY_FLOOR_DIVISION"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision.DIAMOND_1
}