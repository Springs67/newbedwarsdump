local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier
local function v6(p5) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p5 == u4.BRONZE then
        return Color3.fromRGB(140, 74, 47)
    elseif p5 == u4.SILVER then
        return Color3.fromRGB(207, 207, 207)
    elseif p5 == u4.GOLD then
        return Color3.fromRGB(253, 228, 0)
    elseif p5 == u4.PLATINUM then
        return Color3.fromRGB(0, 253, 192)
    elseif p5 == u4.DIAMOND then
        return Color3.fromRGB(53, 243, 255)
    elseif p5 == u4.EMERALD then
        return Color3.fromRGB(8, 199, 0)
    elseif p5 == u4.NIGHTMARE then
        return Color3.fromRGB(87, 0, 173)
    else
        return Color3.fromRGB(140, 74, 47)
    end
end
local function v8(p7) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p7 == u4.BRONZE then
        return UDim2.fromScale(0.8, 0.8)
    elseif p7 == u4.SILVER then
        return UDim2.fromScale(0.8, 0.8)
    elseif p7 == u4.GOLD then
        return UDim2.fromScale(0.85, 0.85)
    elseif p7 == u4.PLATINUM then
        return UDim2.fromScale(0.9, 0.9)
    elseif p7 == u4.DIAMOND then
        return UDim2.fromScale(1, 1)
    elseif p7 == u4.EMERALD then
        return UDim2.fromScale(1, 1)
    elseif p7 == u4.NIGHTMARE then
        return UDim2.fromScale(1, 1)
    else
        return UDim2.fromScale(1, 1)
    end
end
local v9 = {
    [v3.BRONZE_1] = {
        ["name"] = "Bronze 1",
        ["shortName"] = "B1",
        ["tier"] = u4.BRONZE,
        ["color"] = v6(u4.BRONZE),
        ["image"] = v2.BRONZE_RANK,
        ["imageSize"] = v8(u4.BRONZE),
        ["nextRank"] = v3.BRONZE_2
    },
    [v3.BRONZE_2] = {
        ["name"] = "Bronze 2",
        ["shortName"] = "B2",
        ["tier"] = u4.BRONZE,
        ["color"] = v6(u4.BRONZE),
        ["image"] = v2.BRONZE_RANK,
        ["imageSize"] = v8(u4.BRONZE),
        ["prevRank"] = v3.BRONZE_1,
        ["nextRank"] = v3.BRONZE_3
    },
    [v3.BRONZE_3] = {
        ["name"] = "Bronze 3",
        ["shortName"] = "B3",
        ["tier"] = u4.BRONZE,
        ["color"] = v6(u4.BRONZE),
        ["image"] = v2.BRONZE_RANK,
        ["imageSize"] = v8(u4.BRONZE),
        ["prevRank"] = v3.BRONZE_2,
        ["nextRank"] = v3.BRONZE_4
    },
    [v3.BRONZE_4] = {
        ["name"] = "Bronze 4",
        ["shortName"] = "B4",
        ["tier"] = u4.BRONZE,
        ["color"] = v6(u4.BRONZE),
        ["image"] = v2.BRONZE_RANK,
        ["imageSize"] = v8(u4.BRONZE),
        ["prevRank"] = v3.BRONZE_3,
        ["nextRank"] = v3.SILVER_1
    },
    [v3.SILVER_1] = {
        ["name"] = "Silver 1",
        ["shortName"] = "S1",
        ["tier"] = u4.SILVER,
        ["color"] = v6(u4.SILVER),
        ["image"] = v2.SILVER_RANK,
        ["imageSize"] = v8(u4.SILVER),
        ["prevRank"] = v3.BRONZE_4,
        ["nextRank"] = v3.SILVER_2
    },
    [v3.SILVER_2] = {
        ["name"] = "Silver 2",
        ["shortName"] = "S2",
        ["tier"] = u4.SILVER,
        ["color"] = v6(u4.SILVER),
        ["image"] = v2.SILVER_RANK,
        ["imageSize"] = v8(u4.SILVER),
        ["prevRank"] = v3.SILVER_1,
        ["nextRank"] = v3.SILVER_3
    },
    [v3.SILVER_3] = {
        ["name"] = "Silver 3",
        ["shortName"] = "S3",
        ["tier"] = u4.SILVER,
        ["color"] = v6(u4.SILVER),
        ["image"] = v2.SILVER_RANK,
        ["imageSize"] = v8(u4.SILVER),
        ["prevRank"] = v3.SILVER_2,
        ["nextRank"] = v3.SILVER_4
    },
    [v3.SILVER_4] = {
        ["name"] = "Silver 4",
        ["shortName"] = "S4",
        ["tier"] = u4.SILVER,
        ["color"] = v6(u4.SILVER),
        ["image"] = v2.SILVER_RANK,
        ["imageSize"] = v8(u4.SILVER),
        ["prevRank"] = v3.SILVER_3,
        ["nextRank"] = v3.GOLD_1
    },
    [v3.GOLD_1] = {
        ["name"] = "Gold 1",
        ["shortName"] = "G1",
        ["tier"] = u4.GOLD,
        ["color"] = v6(u4.GOLD),
        ["image"] = v2.GOLD_RANK,
        ["imageSize"] = v8(u4.GOLD),
        ["prevRank"] = v3.SILVER_4,
        ["nextRank"] = v3.GOLD_2
    },
    [v3.GOLD_2] = {
        ["name"] = "Gold 2",
        ["shortName"] = "G2",
        ["tier"] = u4.GOLD,
        ["color"] = v6(u4.GOLD),
        ["image"] = v2.GOLD_RANK,
        ["imageSize"] = v8(u4.GOLD),
        ["prevRank"] = v3.GOLD_1,
        ["nextRank"] = v3.GOLD_3
    },
    [v3.GOLD_3] = {
        ["name"] = "Gold 3",
        ["shortName"] = "G3",
        ["tier"] = u4.GOLD,
        ["color"] = v6(u4.GOLD),
        ["image"] = v2.GOLD_RANK,
        ["imageSize"] = v8(u4.GOLD),
        ["prevRank"] = v3.GOLD_2,
        ["nextRank"] = v3.GOLD_4
    },
    [v3.GOLD_4] = {
        ["name"] = "Gold 4",
        ["shortName"] = "G4",
        ["tier"] = u4.GOLD,
        ["color"] = v6(u4.GOLD),
        ["image"] = v2.GOLD_RANK,
        ["imageSize"] = v8(u4.GOLD),
        ["prevRank"] = v3.GOLD_3,
        ["nextRank"] = v3.PLATINUM_1
    },
    [v3.PLATINUM_1] = {
        ["name"] = "Platinum 1",
        ["shortName"] = "P1",
        ["tier"] = u4.PLATINUM,
        ["color"] = v6(u4.PLATINUM),
        ["image"] = v2.PLATINUM_RANK,
        ["imageSize"] = v8(u4.PLATINUM),
        ["prevRank"] = v3.GOLD_4,
        ["nextRank"] = v3.PLATINUM_2
    },
    [v3.PLATINUM_2] = {
        ["name"] = "Platinum 2",
        ["shortName"] = "P2",
        ["tier"] = u4.PLATINUM,
        ["color"] = v6(u4.PLATINUM),
        ["image"] = v2.PLATINUM_RANK,
        ["imageSize"] = v8(u4.PLATINUM),
        ["prevRank"] = v3.PLATINUM_1,
        ["nextRank"] = v3.PLATINUM_3
    },
    [v3.PLATINUM_3] = {
        ["name"] = "Platinum 3",
        ["shortName"] = "P3",
        ["tier"] = u4.PLATINUM,
        ["color"] = v6(u4.PLATINUM),
        ["image"] = v2.PLATINUM_RANK,
        ["imageSize"] = v8(u4.PLATINUM),
        ["prevRank"] = v3.PLATINUM_2,
        ["nextRank"] = v3.PLATINUM_4
    },
    [v3.PLATINUM_4] = {
        ["name"] = "Platinum 4",
        ["shortName"] = "P4",
        ["tier"] = u4.PLATINUM,
        ["color"] = v6(u4.PLATINUM),
        ["image"] = v2.PLATINUM_RANK,
        ["imageSize"] = v8(u4.PLATINUM),
        ["prevRank"] = v3.PLATINUM_3,
        ["nextRank"] = v3.DIAMOND_1
    },
    [v3.DIAMOND_1] = {
        ["name"] = "Diamond 1",
        ["shortName"] = "D1",
        ["tier"] = u4.DIAMOND,
        ["color"] = v6(u4.DIAMOND),
        ["image"] = v2.DIAMOND_RANK,
        ["imageSize"] = v8(u4.DIAMOND),
        ["prevRank"] = v3.PLATINUM_4,
        ["nextRank"] = v3.DIAMOND_2
    },
    [v3.DIAMOND_2] = {
        ["name"] = "Diamond 2",
        ["shortName"] = "D2",
        ["tier"] = u4.DIAMOND,
        ["color"] = v6(u4.DIAMOND),
        ["image"] = v2.DIAMOND_RANK,
        ["imageSize"] = v8(u4.DIAMOND),
        ["prevRank"] = v3.DIAMOND_1,
        ["nextRank"] = v3.DIAMOND_3
    },
    [v3.DIAMOND_3] = {
        ["name"] = "Diamond 3",
        ["shortName"] = "D3",
        ["tier"] = u4.DIAMOND,
        ["color"] = v6(u4.DIAMOND),
        ["image"] = v2.DIAMOND_RANK,
        ["imageSize"] = v8(u4.DIAMOND),
        ["prevRank"] = v3.DIAMOND_2,
        ["nextRank"] = v3.DIAMOND_4
    },
    [v3.DIAMOND_4] = {
        ["name"] = "Diamond 4",
        ["shortName"] = "D4",
        ["tier"] = u4.DIAMOND,
        ["color"] = v6(u4.DIAMOND),
        ["image"] = v2.DIAMOND_RANK,
        ["imageSize"] = v8(u4.DIAMOND),
        ["prevRank"] = v3.DIAMOND_3,
        ["nextRank"] = v3.EMERALD_1
    },
    [v3.EMERALD_1] = {
        ["name"] = "EMERALD 1",
        ["shortName"] = "E1",
        ["tier"] = u4.EMERALD,
        ["color"] = v6(u4.EMERALD),
        ["image"] = v2.EMERALD_RANK,
        ["imageSize"] = v8(u4.EMERALD),
        ["prevRank"] = v3.DIAMOND_4,
        ["nextRank"] = v3.EMERALD_2
    },
    [v3.EMERALD_2] = {
        ["name"] = "EMERALD 2",
        ["shortName"] = "E2",
        ["tier"] = u4.EMERALD,
        ["color"] = v6(u4.EMERALD),
        ["image"] = v2.EMERALD_RANK,
        ["imageSize"] = v8(u4.EMERALD),
        ["prevRank"] = v3.EMERALD_1,
        ["nextRank"] = v3.EMERALD_3
    },
    [v3.EMERALD_3] = {
        ["name"] = "EMERALD 3",
        ["shortName"] = "E3",
        ["tier"] = u4.EMERALD,
        ["color"] = v6(u4.EMERALD),
        ["image"] = v2.EMERALD_RANK,
        ["imageSize"] = v8(u4.EMERALD),
        ["prevRank"] = v3.EMERALD_2,
        ["nextRank"] = v3.EMERALD_4
    },
    [v3.EMERALD_4] = {
        ["name"] = "EMERALD 4",
        ["shortName"] = "E4",
        ["noRPLimit"] = true,
        ["tier"] = u4.EMERALD,
        ["color"] = v6(u4.EMERALD),
        ["image"] = v2.EMERALD_RANK,
        ["imageSize"] = v8(u4.EMERALD),
        ["prevRank"] = v3.EMERALD_3
    },
    [v3.NIGHTMARE_1] = {
        ["name"] = "NIGHTMARE",
        ["shortName"] = "N1",
        ["noRPLimit"] = true,
        ["noInstantDemote"] = true,
        ["tier"] = u4.NIGHTMARE,
        ["color"] = v6(u4.NIGHTMARE),
        ["image"] = v2.NIGHTMARE_RANK,
        ["imageSize"] = v8(u4.NIGHTMARE)
    }
}
return {
    ["getRankColor"] = v6,
    ["getImageSize"] = v8,
    ["RankMeta"] = v9
}