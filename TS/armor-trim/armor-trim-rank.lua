local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta")
local v4 = v3.getRankColor
local v5 = v3.getImageSize
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier
local v7 = {}
local v8 = setmetatable({}, {
    ["__index"] = v7
})
v8.T1 = 0
v7[0] = "T1"
v8.T2 = 1
v7[1] = "T2"
v8.T3 = 2
v7[2] = "T3"
v8.T4 = 3
v7[3] = "T4"
v8.T5 = 4
v7[4] = "T5"
v8.T6 = 5
v7[5] = "T6"
v8.T7 = 6
v7[6] = "T7"
local v9 = {
    [v8.T1] = {
        ["text"] = "T1",
        ["tier"] = v6.BRONZE,
        ["color"] = v4(v6.BRONZE),
        ["image"] = v2.BRONZE_RANK,
        ["imageSize"] = v5(v6.BRONZE),
        ["material"] = Enum.Material.Glacier
    },
    [v8.T2] = {
        ["text"] = "T2",
        ["tier"] = v6.SILVER,
        ["color"] = v4(v6.SILVER),
        ["image"] = v2.SILVER_RANK,
        ["imageSize"] = v5(v6.SILVER),
        ["material"] = Enum.Material.Glacier
    },
    [v8.T3] = {
        ["text"] = "T3",
        ["tier"] = v6.GOLD,
        ["color"] = v4(v6.GOLD),
        ["image"] = v2.GOLD_RANK,
        ["imageSize"] = v5(v6.GOLD),
        ["material"] = Enum.Material.Glacier
    },
    [v8.T4] = {
        ["text"] = "T4",
        ["tier"] = v6.PLATINUM,
        ["color"] = v4(v6.PLATINUM),
        ["image"] = v2.PLATINUM_RANK,
        ["imageSize"] = v5(v6.PLATINUM),
        ["material"] = Enum.Material.Glacier
    },
    [v8.T5] = {
        ["text"] = "T5",
        ["tier"] = v6.DIAMOND,
        ["color"] = v4(v6.DIAMOND),
        ["image"] = v2.DIAMOND_RANK,
        ["imageSize"] = v5(v6.DIAMOND),
        ["material"] = Enum.Material.Neon
    },
    [v8.T6] = {
        ["text"] = "T6",
        ["tier"] = v6.EMERALD,
        ["color"] = v4(v6.EMERALD),
        ["image"] = v2.EMERALD_RANK,
        ["imageSize"] = v5(v6.EMERALD),
        ["material"] = Enum.Material.Neon
    },
    [v8.T7] = {
        ["text"] = "T7",
        ["tier"] = v6.NIGHTMARE,
        ["color"] = v4(v6.NIGHTMARE),
        ["image"] = v2.NIGHTMARE_RANK,
        ["imageSize"] = v5(v6.NIGHTMARE),
        ["material"] = Enum.Material.Neon
    }
}
return {
    ["ArmorTrimEffectRank"] = v8,
    ["ArmorTrimEffectRankMeta"] = v9
}