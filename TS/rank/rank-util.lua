local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category-meta").RankCategoryMeta
local v4 = {}
local v5 = v2.RANKED_S16
v4.activeRankCategory = v5
v4.activeRankMeta = v3[v5]
v4.NUM_PROVISIONAL_MATCHES = 5
return {
    ["RankUtil"] = v4
}