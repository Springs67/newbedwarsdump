local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision
local v4 = {}
local v5 = {
    [v3.BRONZE_1] = 0,
    [v3.BRONZE_2] = 150,
    [v3.BRONZE_3] = 300,
    [v3.BRONZE_4] = 450,
    [v3.SILVER_1] = 600,
    [v3.SILVER_2] = 800,
    [v3.SILVER_3] = 1000,
    [v3.SILVER_4] = 1200,
    [v3.GOLD_1] = 1400,
    [v3.GOLD_2] = 1600,
    [v3.GOLD_3] = 1750,
    [v3.GOLD_4] = 1900,
    [v3.PLATINUM_1] = 2000,
    [v3.PLATINUM_2] = 2100,
    [v3.PLATINUM_3] = 2200,
    [v3.PLATINUM_4] = 2300,
    [v3.DIAMOND_1] = 2350,
    [v3.DIAMOND_2] = 2400,
    [v3.DIAMOND_3] = 2450,
    [v3.DIAMOND_4] = 2450,
    [v3.EMERALD_1] = 2475,
    [v3.EMERALD_2] = 2475,
    [v3.EMERALD_3] = 2475,
    [v3.EMERALD_4] = 2475,
    [v3.NIGHTMARE_1] = 2500
}
v4.oldS14GlickoTable = {
    [v3.BRONZE_1] = 0,
    [v3.BRONZE_2] = 100,
    [v3.BRONZE_3] = 200,
    [v3.BRONZE_4] = 300,
    [v3.SILVER_1] = 400,
    [v3.SILVER_2] = 480,
    [v3.SILVER_3] = 560,
    [v3.SILVER_4] = 640,
    [v3.GOLD_1] = 720,
    [v3.GOLD_2] = 800,
    [v3.GOLD_3] = 880,
    [v3.GOLD_4] = 960,
    [v3.PLATINUM_1] = 1040,
    [v3.PLATINUM_2] = 1090,
    [v3.PLATINUM_3] = 1140,
    [v3.PLATINUM_4] = 1190,
    [v3.DIAMOND_1] = 1250,
    [v3.DIAMOND_2] = 1310,
    [v3.DIAMOND_3] = 1370,
    [v3.DIAMOND_4] = 1430,
    [v3.EMERALD_1] = 1490,
    [v3.EMERALD_2] = 1490,
    [v3.EMERALD_3] = 1490,
    [v3.EMERALD_4] = 1490,
    [v3.NIGHTMARE_1] = 1600
}
local v6 = {
    [v3.BRONZE_1] = 0,
    [v3.BRONZE_2] = 100,
    [v3.BRONZE_3] = 200,
    [v3.BRONZE_4] = 300,
    [v3.SILVER_1] = 400,
    [v3.SILVER_2] = 480,
    [v3.SILVER_3] = 560,
    [v3.SILVER_4] = 640,
    [v3.GOLD_1] = 720,
    [v3.GOLD_2] = 800,
    [v3.GOLD_3] = 880,
    [v3.GOLD_4] = 960,
    [v3.PLATINUM_1] = 1040,
    [v3.PLATINUM_2] = 1110,
    [v3.PLATINUM_3] = 1180,
    [v3.PLATINUM_4] = 1250,
    [v3.DIAMOND_1] = 1310,
    [v3.DIAMOND_2] = 1380,
    [v3.DIAMOND_3] = 1450,
    [v3.DIAMOND_4] = 1520,
    [v3.EMERALD_1] = 1580,
    [v3.EMERALD_2] = 1640,
    [v3.EMERALD_3] = 1700,
    [v3.EMERALD_4] = 1760,
    [v3.NIGHTMARE_1] = 1840
}
v4.currentGlickoRatingTable = v6
local u7 = {
    [v2.RANKED_BETA] = v5,
    [v2.RANKED_S4] = v5,
    [v2.RANKED_S5] = v5,
    [v2.RANKED_S6] = v5,
    [v2.RANKED_S7] = v5,
    [v2.RANKED_S8] = v5,
    [v2.RANKED_S9] = v5,
    [v2.RANKED_S10] = v5,
    [v2.RANKED_S11] = v5,
    [v2.RANKED_S12] = v5,
    [v2.RANKED_S13] = v5,
    [v2.RANKED_S14] = v6,
    [v2.RANKED_S15] = v6,
    [v2.RANKED_S16] = v6
}
function v4.getRatingTable(p8) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7[p8]
end
return {
    ["GlickoRatings"] = v4
}