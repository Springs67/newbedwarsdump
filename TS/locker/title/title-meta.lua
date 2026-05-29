local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").getRankColor
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v7 = {
    ["font"] = Enum.Font.LuckiestGuy,
    ["backgroundTransparency"] = 1,
    ["backgroundColor"] = Color3.fromRGB(0, 0, 0),
    ["color"] = Color3.fromRGB(255, 255, 255)
}
local v8 = {
    [v6.NONE] = {
        ["name"] = "None",
        ["text"] = ""
    },
    [v6.GIFTER] = {
        ["name"] = "Gifter",
        ["text"] = "Gifter",
        ["font"] = Enum.Font.Roboto,
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["color"] = Color3.fromRGB(5, 255, 5)
    },
    [v6.RANK_BETA_BRONZE] = {
        ["name"] = "Ranked Beta Bronze",
        ["text"] = "Bronze (BETA Season)",
        ["font"] = Enum.Font.Roboto,
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_BETA_SILVER] = {
        ["name"] = "Ranked Beta Silver",
        ["text"] = "Silver (BETA Season)",
        ["font"] = Enum.Font.Roboto,
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_BETA_GOLD] = {
        ["name"] = "Ranked Beta Gold",
        ["text"] = "Gold (BETA Season)",
        ["font"] = Enum.Font.Roboto,
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_BETA_PLATINUM] = {
        ["name"] = "Ranked Beta Platinum",
        ["text"] = "Platinum (BETA Season)",
        ["font"] = Enum.Font.Roboto,
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_BETA_DIAMOND] = {
        ["name"] = "Ranked Beta Diamond",
        ["text"] = "Diamond (BETA Season)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_BETA_NIGHTMARE] = {
        ["name"] = "Ranked Beta Nightmare",
        ["text"] = "NIGHTMARE (BETA Season)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S4_BRONZE] = {
        ["name"] = "Ranked Season 4 Bronze",
        ["text"] = "Bronze (Season 4)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S4_SILVER] = {
        ["name"] = "Ranked Season 4 Silver",
        ["text"] = "Silver (Season 4)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S4_GOLD] = {
        ["name"] = "Ranked Season 4 Gold",
        ["text"] = "Gold (Season 4)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S4_PLATINUM] = {
        ["name"] = "Ranked Season 4 Platinum",
        ["text"] = "Platinum (Season 4)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S4_DIAMOND] = {
        ["name"] = "Ranked Season 4 Diamond",
        ["text"] = "Diamond (Season 4)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S4_NIGHTMARE] = {
        ["name"] = "Ranked Season 4 Nightmare",
        ["text"] = "NIGHTMARE (Season 4)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S5_BRONZE] = {
        ["name"] = "Ranked Season 5 Bronze",
        ["text"] = "Bronze (Season 5)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S5_SILVER] = {
        ["name"] = "Ranked Season 5 Silver",
        ["text"] = "Silver (Season 5)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S5_GOLD] = {
        ["name"] = "Ranked Season 5 Gold",
        ["text"] = "Gold (Season 5)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S5_PLATINUM] = {
        ["name"] = "Ranked Season 5 Platinum",
        ["text"] = "Platinum (Season 5)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S5_DIAMOND] = {
        ["name"] = "Ranked Season 5 Diamond",
        ["text"] = "Diamond (Season 5)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S5_NIGHTMARE] = {
        ["name"] = "Ranked Season 5 Nightmare",
        ["text"] = "NIGHTMARE (Season 5)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S6_BRONZE] = {
        ["name"] = "Ranked Season 6 Bronze",
        ["text"] = "Bronze (Season 6)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S6_SILVER] = {
        ["name"] = "Ranked Season 6 Silver",
        ["text"] = "Silver (Season 6)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S6_GOLD] = {
        ["name"] = "Ranked Season 6 Gold",
        ["text"] = "Gold (Season 6)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S6_PLATINUM] = {
        ["name"] = "Ranked Season 6 Platinum",
        ["text"] = "Platinum (Season 6)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S6_DIAMOND] = {
        ["name"] = "Ranked Season 6 Diamond",
        ["text"] = "Diamond (Season 6)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S6_NIGHTMARE] = {
        ["name"] = "Ranked Season 6 Nightmare",
        ["text"] = "NIGHTMARE (Season 6)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S7_BRONZE] = {
        ["name"] = "Ranked Season 7 Bronze",
        ["text"] = "Bronze (Season 7)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S7_SILVER] = {
        ["name"] = "Ranked Season 7 Silver",
        ["text"] = "Silver (Season 7)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S7_GOLD] = {
        ["name"] = "Ranked Season 7 Gold",
        ["text"] = "Gold (Season 7)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S7_PLATINUM] = {
        ["name"] = "Ranked Season 7 Platinum",
        ["text"] = "Platinum (Season 7)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S7_DIAMOND] = {
        ["name"] = "Ranked Season 7 Diamond",
        ["text"] = "Diamond (Season 7)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S7_EMERALD] = {
        ["name"] = "Ranked Season 7 Emerald",
        ["text"] = "Emerald (Season 7)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.EMERALD)
    },
    [v6.RANK_S7_NIGHTMARE] = {
        ["name"] = "Ranked Season 7 Nightmare",
        ["text"] = "NIGHTMARE (Season 7)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S8_BRONZE] = {
        ["name"] = "Ranked Season 8 Bronze",
        ["text"] = "Bronze (Season 8)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S8_SILVER] = {
        ["name"] = "Ranked Season 8 Silver",
        ["text"] = "Silver (Season 8)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S8_GOLD] = {
        ["name"] = "Ranked Season 8 Gold",
        ["text"] = "Gold (Season 8)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S8_PLATINUM] = {
        ["name"] = "Ranked Season 8 Platinum",
        ["text"] = "Platinum (Season 8)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S8_DIAMOND] = {
        ["name"] = "Ranked Season 8 Diamond",
        ["text"] = "Diamond (Season 8)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S8_EMERALD] = {
        ["name"] = "Ranked Season 8 Emerald",
        ["text"] = "Emerald (Season 8)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.EMERALD)
    },
    [v6.RANK_S8_NIGHTMARE] = {
        ["name"] = "Ranked Season 8 Nightmare",
        ["text"] = "NIGHTMARE (Season 8)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S9_BRONZE] = {
        ["name"] = "Ranked Season 9 Bronze",
        ["text"] = "Bronze (Season 9)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S9_SILVER] = {
        ["name"] = "Ranked Season 9 Silver",
        ["text"] = "Silver (Season 9)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S9_GOLD] = {
        ["name"] = "Ranked Season 9 Gold",
        ["text"] = "Gold (Season 9)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S9_PLATINUM] = {
        ["name"] = "Ranked Season 9 Platinum",
        ["text"] = "Platinum (Season 9)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S9_DIAMOND] = {
        ["name"] = "Ranked Season 9 Diamond",
        ["text"] = "Diamond (Season 9)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S9_EMERALD] = {
        ["name"] = "Ranked Season 9 Emerald",
        ["text"] = "Emerald (Season 9)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.EMERALD)
    },
    [v6.RANK_S9_NIGHTMARE] = {
        ["name"] = "Ranked Season 9 Nightmare",
        ["text"] = "NIGHTMARE (Season 9)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S10_BRONZE] = {
        ["name"] = "Ranked Season 10 Bronze",
        ["text"] = "Bronze (Season 10)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S10_SILVER] = {
        ["name"] = "Ranked Season 10 Silver",
        ["text"] = "Silver (Season 10)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S10_GOLD] = {
        ["name"] = "Ranked Season 10 Gold",
        ["text"] = "Gold (Season 10)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S10_PLATINUM] = {
        ["name"] = "Ranked Season 10 Platinum",
        ["text"] = "Platinum (Season 10)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S10_DIAMOND] = {
        ["name"] = "Ranked Season 10 Diamond",
        ["text"] = "Diamond (Season 10)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S10_EMERALD] = {
        ["name"] = "Ranked Season 10 Emerald",
        ["text"] = "Emerald (Season 10)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.EMERALD)
    },
    [v6.RANK_S10_NIGHTMARE] = {
        ["name"] = "Ranked Season 10 Nightmare",
        ["text"] = "NIGHTMARE (Season 10)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S11_BRONZE] = {
        ["name"] = "Ranked Season 11 Bronze",
        ["text"] = "Bronze (Season 11)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S11_SILVER] = {
        ["name"] = "Ranked Season 11 Silver",
        ["text"] = "Silver (Season 11)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S11_GOLD] = {
        ["name"] = "Ranked Season 11 Gold",
        ["text"] = "Gold (Season 11)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S11_PLATINUM] = {
        ["name"] = "Ranked Season 11 Platinum",
        ["text"] = "Platinum (Season 11)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S11_DIAMOND] = {
        ["name"] = "Ranked Season 11 Diamond",
        ["text"] = "Diamond (Season 11)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S11_EMERALD] = {
        ["name"] = "Ranked Season 11 Emerald",
        ["text"] = "Emerald (Season 11)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.EMERALD)
    },
    [v6.RANK_S11_NIGHTMARE] = {
        ["name"] = "Ranked Season 11 Nightmare",
        ["text"] = "NIGHTMARE (Season 11)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S12_BRONZE] = {
        ["name"] = "Ranked Season 12 Bronze",
        ["text"] = "Bronze (Season 12)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S12_SILVER] = {
        ["name"] = "Ranked Season 12 Silver",
        ["text"] = "Silver (Season 12)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S12_GOLD] = {
        ["name"] = "Ranked Season 12 Gold",
        ["text"] = "Gold (Season 12)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S12_PLATINUM] = {
        ["name"] = "Ranked Season 12 Platinum",
        ["text"] = "Platinum (Season 12)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S12_DIAMOND] = {
        ["name"] = "Ranked Season 12 Diamond",
        ["text"] = "Diamond (Season 12)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S12_EMERALD] = {
        ["name"] = "Ranked Season 12 Emerald",
        ["text"] = "Emerald (Season 12)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.EMERALD)
    },
    [v6.RANK_S12_NIGHTMARE] = {
        ["name"] = "Ranked Season 12 Nightmare",
        ["text"] = "NIGHTMARE (Season 12)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S13_BRONZE] = {
        ["name"] = "Ranked Season 13 Bronze",
        ["text"] = "Bronze (Season 13)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S13_SILVER] = {
        ["name"] = "Ranked Season 13 Silver",
        ["text"] = "Silver (Season 13)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S13_GOLD] = {
        ["name"] = "Ranked Season 13 Gold",
        ["text"] = "Gold (Season 13)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S13_PLATINUM] = {
        ["name"] = "Ranked Season 13 Platinum",
        ["text"] = "Platinum (Season 13)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S13_DIAMOND] = {
        ["name"] = "Ranked Season 13 Diamond",
        ["text"] = "Diamond (Season 13)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S13_EMERALD] = {
        ["name"] = "Ranked Season 13 Emerald",
        ["text"] = "Emerald (Season 13)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.EMERALD)
    },
    [v6.RANK_S13_NIGHTMARE] = {
        ["name"] = "Ranked Season 13 Nightmare",
        ["text"] = "NIGHTMARE (Season 13)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S14_BRONZE] = {
        ["name"] = "Ranked Season 14 Bronze",
        ["text"] = "Bronze (Season 14)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S14_SILVER] = {
        ["name"] = "Ranked Season 14 Silver",
        ["text"] = "Silver (Season 14)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S14_GOLD] = {
        ["name"] = "Ranked Season 14 Gold",
        ["text"] = "Gold (Season 14)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S14_PLATINUM] = {
        ["name"] = "Ranked Season 14 Platinum",
        ["text"] = "Platinum (Season 14)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S14_DIAMOND] = {
        ["name"] = "Ranked Season 14 Diamond",
        ["text"] = "Diamond (Season 14)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S14_EMERALD] = {
        ["name"] = "Ranked Season 14 Emerald",
        ["text"] = "Emerald (Season 14)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.EMERALD)
    },
    [v6.RANK_S14_NIGHTMARE] = {
        ["name"] = "Ranked Season 14 Nightmare",
        ["text"] = "NIGHTMARE (Season 14)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.RANK_S15_BRONZE] = {
        ["name"] = "Ranked Season 15 Bronze",
        ["text"] = "Bronze (Season 15)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.BRONZE)
    },
    [v6.RANK_S15_SILVER] = {
        ["name"] = "Ranked Season 15 Silver",
        ["text"] = "Silver (Season 15)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.SILVER)
    },
    [v6.RANK_S15_GOLD] = {
        ["name"] = "Ranked Season 15 Gold",
        ["text"] = "Gold (Season 15)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.GOLD)
    },
    [v6.RANK_S15_PLATINUM] = {
        ["name"] = "Ranked Season 15 Platinum",
        ["text"] = "Platinum (Season 15)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.PLATINUM)
    },
    [v6.RANK_S15_DIAMOND] = {
        ["name"] = "Ranked Season 15 Diamond",
        ["text"] = "Diamond (Season 15)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.DIAMOND)
    },
    [v6.RANK_S15_EMERALD] = {
        ["name"] = "Ranked Season 15 Emerald",
        ["text"] = "Emerald (Season 15)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v3(v4.EMERALD)
    },
    [v6.RANK_S15_NIGHTMARE] = {
        ["name"] = "Ranked Season 15 Nightmare",
        ["text"] = "NIGHTMARE (Season 15)",
        ["fontWeight"] = Enum.FontWeight.Bold,
        ["font"] = Enum.Font.Roboto,
        ["color"] = v2.hexColor(16533162)
    },
    [v6.MINERS_OF_THE_GALAXY] = {
        ["text"] = "Miners of the Galaxy",
        ["color"] = Color3.fromRGB(127, 17, 124)
    },
    [v6.PICKAXE] = {
        ["text"] = "\240\159\146\142\226\155\143\239\184\143",
        ["name"] = "Pickaxe"
    },
    [v6.MINING_AWAY] = {
        ["text"] = "MINING AWAY!"
    },
    [v6.YEAR_OF_THE_TIGER] = {
        ["text"] = "Year of the Tiger \240\159\144\175",
        ["color"] = v5.mcGold
    },
    [v6.SPRING_FESTIVAL] = {
        ["text"] = "Spring Festival"
    },
    [v6.LUNAR_NEW_YEAR] = {
        ["text"] = "Lunar New Year!",
        ["color"] = v5.mcRed
    },
    [v6.Infernal] = {
        ["text"] = "Infernal \240\159\148\165",
        ["color"] = Color3.fromRGB(140, 5, 56)
    },
    [v6.LIGHT] = {
        ["text"] = "Light \240\159\148\133",
        ["color"] = Color3.fromRGB(242, 209, 0)
    },
    [v6.MLG] = {
        ["text"] = "MLG",
        ["backgroundTransparency"] = 1,
        ["font"] = Enum.Font.LuckiestGuy
    },
    [v6.BED_BREAKER] = {
        ["text"] = "Bed Breaker"
    },
    [v6.EXPLOSIVES_EXPERT] = {
        ["text"] = "Explosives Expert"
    },
    [v6.TELEPEARLER] = {
        ["text"] = "Telepearler"
    },
    [v6.DEFENDER] = {
        ["text"] = "Defender"
    },
    [v6.RUSHER] = {
        ["text"] = "Rusher"
    },
    [v6.BUILT_DIFFERENT] = {
        ["text"] = "Built Different"
    },
    [v6.WINNABLE] = {
        ["text"] = "Winnable"
    },
    [v6.BOT] = {
        ["text"] = "Bot"
    },
    [v6.FARMER] = {
        ["text"] = "Farmer"
    },
    [v6.INVITE_ME] = {
        ["text"] = "Invite Me!"
    },
    [v6.DEDICATED] = {
        ["text"] = "Dedicated"
    },
    [v6.ONE_V_THIRTY] = {
        ["text"] = "1v30"
    },
    [v6.EMERALD_HOARDER] = {
        ["text"] = "Emerald Hoarder"
    },
    [v6.BOW_SPAMMER] = {
        ["text"] = "Bow Spammer"
    },
    [v6.ANTI_BOW_SPAMMER] = {
        ["text"] = "Anti Bow Spammer"
    },
    [v6.SUPER_CPS] = {
        ["text"] = "20 CPS"
    },
    [v6.SMILE] = {
        ["name"] = "Smile",
        ["text"] = ":)"
    },
    [v6.CAT_FACE] = {
        ["name"] = "Cat Face",
        ["text"] = ":3"
    },
    [v6.SUS] = {
        ["text"] = "Sus"
    },
    [v6.ONE_V_ONE_ME] = {
        ["text"] = "1v1 Me"
    },
    [v6.UPDATE_HYPE] = {
        ["text"] = "Update Hype"
    },
    [v6.SWEATY] = {
        ["text"] = "Sweaty"
    },
    [v6.ISLANDS_MAIN] = {
        ["text"] = "Islands Main"
    },
    [v6.LFG] = {
        ["text"] = "LFG"
    },
    [v6.SPICY] = {
        ["text"] = "Spicy"
    },
    [v6.AIMBOT] = {
        ["text"] = "Aimbot"
    },
    [v6.GOD_BRIDGER] = {
        ["text"] = "God Bridger"
    },
    [v6.LONE_WOLF] = {
        ["text"] = "Lone Wolf"
    },
    [v6.SNIPER] = {
        ["text"] = "Sniper"
    },
    [v6.AGGRO] = {
        ["text"] = "Aggro"
    },
    [v6.LATE_GAME] = {
        ["text"] = "Late Game"
    },
    [v6.OUTPLAYED] = {
        ["text"] = "Outplayed"
    },
    [v6.CAMPER] = {
        ["text"] = "Camper"
    },
    [v6.EXTREME] = {
        ["text"] = "Extreme"
    },
    [v6.ROCKET_SHIP] = {
        ["text"] = "\240\159\154\128",
        ["name"] = "Rocket Ship Emoji"
    },
    [v6.UMM] = {
        ["text"] = "Umm?"
    },
    [v6.OKAY] = {
        ["text"] = "Okayyy??"
    },
    [v6.CAT_FACE_2] = {
        ["text"] = "^._.^",
        ["name"] = "Cat Face 2"
    },
    [v6.SPOOKY] = {
        ["text"] = "SpoOoky"
    },
    [v6.BOO] = {
        ["text"] = "Boo!"
    },
    [v6.XD] = {
        ["text"] = "xD"
    },
    [v6.RICH] = {
        ["text"] = "Rich"
    },
    [v6.SUPER_STAR] = {
        ["text"] = "Super Star"
    },
    [v6.GHOST] = {
        ["text"] = "\240\159\145\187",
        ["name"] = "Ghost Emoji"
    },
    [v6.RIP] = {
        ["text"] = "RIP"
    },
    [v6.HORROR] = {
        ["text"] = "Horror"
    },
    [v6.CRANK_90] = {
        ["text"] = "Crank 90"
    },
    [v6.TEAM_PLAYER] = {
        ["text"] = "Team Player"
    },
    [v6.HAUNTED] = {
        ["text"] = "Haunted"
    },
    [v6.WOOF] = {
        ["text"] = "Woof!"
    },
    [v6.YOU_FR] = {
        ["text"] = "You fr?"
    },
    [v6.OBSIDIAN_OP] = {
        ["text"] = "Obsidian OP"
    },
    [v6.TRICK_OR_TREAT] = {
        ["text"] = "Trick or Treat!"
    },
    [v6.ZOMBIE] = {
        ["text"] = "Zombie"
    },
    [v6.SURFER] = {
        ["text"] = "Surfer"
    },
    [v6.SHRUG] = {
        ["text"] = "\194\175\\_(\227\131\132)_/\194\175",
        ["name"] = "Shrug"
    },
    [v6.GGANBU] = {
        ["text"] = "Gganbu"
    },
    [v6.UWU] = {
        ["text"] = "uwu"
    },
    [v6.GAMER] = {
        ["text"] = "Gamer"
    },
    [v6.DODO] = {
        ["text"] = "Dodo"
    },
    [v6.EBOY] = {
        ["text"] = "Eboy"
    },
    [v6.EGIRL] = {
        ["text"] = "Egirl"
    },
    [v6.SWAG] = {
        ["text"] = "Swag"
    },
    [v6.CHRISTMAS_TREE] = {
        ["text"] = "\240\159\142\132",
        ["name"] = "Christmas Tree Emoji"
    },
    [v6.SANTA_CLAUS] = {
        ["text"] = "\240\159\142\133",
        ["name"] = "Santa Claus Emoji"
    },
    [v6.SNOWMAN] = {
        ["text"] = "\226\155\132",
        ["name"] = "Snowman Emoji"
    },
    [v6.THUMBSUP] = {
        ["text"] = "\240\159\145\141",
        ["name"] = "Thumbs Up Emoji"
    },
    [v6.RAD] = {
        ["text"] = "\240\159\164\170\240\159\164\153\240\159\143\188",
        ["name"] = "Rad Emoji"
    },
    [v6.AYOO] = {
        ["text"] = "Ayoo?"
    },
    [v6.BING_BONG] = {
        ["text"] = "BING BONG"
    },
    [v6.FROSTY] = {
        ["text"] = "Frosty"
    },
    [v6.SNOWFLAKE] = {
        ["text"] = "Snowflake"
    },
    [v6.COLD] = {
        ["text"] = "Cold"
    },
    [v6.BIGBRAIN] = {
        ["text"] = "Big Brain"
    },
    [v6.CLUTCHGOD] = {
        ["text"] = "Clutch God"
    },
    [v6.BOWMASTER] = {
        ["text"] = "Bow Master"
    },
    [v6.MICCHECK] = {
        ["text"] = "Mic Check"
    },
    [v6.LUCKY] = {
        ["text"] = "Lucky"
    },
    [v6.COZY] = {
        ["text"] = "Cozy"
    },
    [v6.DERP] = {
        ["text"] = "Derp"
    },
    [v6.BEAR] = {
        ["text"] = "\202\149\226\128\162\204\129\225\180\165\226\128\162\204\128\202\148\227\129\163",
        ["name"] = "Bear"
    },
    [v6.SWORD] = {
        ["text"] = "\226\154\148\239\184\143",
        ["name"] = "Sword Emoji"
    },
    [v6.QUIRKY] = {
        ["text"] = "Quirky"
    },
    [v6.JACK_FROST] = {
        ["text"] = "Jack Frost"
    },
    [v6.ICE_QUEEN] = {
        ["text"] = "Ice Queen"
    },
    [v6.MERRY_CHRISTMAS] = {
        ["text"] = "Merry Christmas"
    },
    [v6.CRACKED] = {
        ["text"] = "Cracked"
    },
    [v6.DUCK] = {
        ["text"] = "Duck"
    },
    [v6.SKYWARS_MAIN] = {
        ["text"] = "Skywars Main"
    },
    [v6.RABBIT] = {
        ["text"] = "Rabbit"
    },
    [v6.RABBIT_EMOJI] = {
        ["text"] = "\240\159\144\135",
        ["name"] = "Rabbit Emoji"
    },
    [v6.HAPPY_EASTER] = {
        ["text"] = "Happy Easter"
    },
    [v6.BLOSSOM] = {
        ["text"] = "Blossom"
    },
    [v6.FLOWERS_EMOJI] = {
        ["text"] = "\240\159\140\188\240\159\140\183\240\159\140\187",
        ["name"] = "Flowers Emoji"
    },
    [v6.BORK] = {
        ["text"] = "BORK"
    },
    [v6.ARROW_MAGNET] = {
        ["text"] = "Arrow Magnet"
    },
    [v6.SPIRIT_SPAMMER] = {
        ["text"] = "Spirit Spammer"
    },
    [v6.EMOTIONAL_DAMAGE] = {
        ["text"] = "EMOTIONAL DAMAGE"
    },
    [v6.JUGGERNAUT] = {
        ["text"] = "JUGGERNAUT"
    },
    [v6.ENCHANTER] = {
        ["text"] = "Enchanter"
    },
    [v6.MIDNIGHT] = {
        ["text"] = "Mid<font color=\"" .. v2.richTextColor(v2.BLACK) .. "\">night</font>"
    },
    [v6.SHEEP_EMOJI] = {
        ["text"] = "\240\159\144\145",
        ["name"] = "Sheep Emoji"
    },
    [v6.POTTER] = {
        ["text"] = "Potter"
    },
    [v6.BEAST] = {
        ["text"] = "Beast"
    },
    [v6.EMPEROR] = {
        ["text"] = "Emperor"
    },
    [v6.BLOCK_CLUTCHER] = {
        ["text"] = "Block Clutcher"
    },
    [v6.COMBO_MASTER] = {
        ["text"] = "Combo Master"
    },
    [v6.SUMMER] = {
        ["text"] = "Summer"
    },
    [v6.BEACH_DAY] = {
        ["text"] = "Beach Day"
    },
    [v6.SUMMER_EMOJI] = {
        ["text"] = "\240\159\140\158\240\159\140\138\240\159\140\180",
        ["name"] = "Summer Emojis"
    },
    [v6.BEACH_EMOJI] = {
        ["text"] = "\240\159\143\150\239\184\143",
        ["name"] = "Beach Emoji"
    },
    [v6.VOID] = {
        ["text"] = "Void",
        ["color"] = Color3.fromRGB(121, 36, 199)
    },
    [v6.COOKING] = {
        ["text"] = "Cooking"
    },
    [v6.CHAD] = {
        ["text"] = "Chad"
    },
    [v6.UNLUCKY] = {
        ["text"] = "Unlucky"
    },
    [v6.STAR] = {
        ["text"] = "\226\173\144 Star",
        ["color"] = v5.mcYellow
    },
    [v6.BAITED] = {
        ["text"] = "Baited"
    },
    [v6.HARD_CARRY] = {
        ["text"] = "Hard Carry"
    },
    [v6.HARD_STUCK] = {
        ["text"] = "Hard Stuck"
    },
    [v6.DINOSAUR] = {
        ["text"] = "DINOSAUR"
    },
    [v6.TRADE_OFFER] = {
        ["text"] = "\226\154\160\239\184\143 Trade Offer \226\154\160\239\184\143"
    },
    [v6.DEAL_OR_NO_DEAL] = {
        ["text"] = "Deal or no Deal"
    },
    [v6.SPECIALIST] = {
        ["text"] = "Specialist"
    }
}
local v9 = v6.ZEPHYR
local v10 = {
    ["text"] = "Zephyr",
    ["font"] = Enum.Font.Gotham,
    ["fontWeight"] = Enum.FontWeight.Bold,
    ["stroke"] = {
        ["color"] = Color3.fromRGB(56, 56, 56)
    }
}
v8[v9] = v10
v8[v6.SUNGLASSES] = {
    ["text"] = "B)",
    ["name"] = "Sunglasses"
}
v8[v6.SHARK] = {
    ["text"] = "Shark"
}
v8[v6.MAGE] = {
    ["text"] = "Mage"
}
v8[v6.KNIGHT] = {
    ["text"] = "Knight"
}
v8[v6.PALADIN] = {
    ["text"] = "Paladin"
}
v8[v6.DRAGON] = {
    ["text"] = "Dragon",
    ["color"] = Color3.fromRGB(255, 148, 71)
}
v8[v6.DRAGON_EMOJI] = {
    ["text"] = "\240\159\144\178",
    ["name"] = "Dragon Emoji"
}
v8[v6.SHAPE_SHIFTER] = {
    ["text"] = "Shape Shifter"
}
v8[v6.QUEEN] = {
    ["text"] = "Queen",
    ["color"] = v5.mcYellow
}
v8[v6.KING] = {
    ["text"] = "King",
    ["color"] = v5.mcYellow
}
v8[v6.CROWN_EMOJI] = {
    ["text"] = "\240\159\145\145",
    ["name"] = "Crown Emoji"
}
v8[v6.RULER] = {
    ["text"] = "Ruler",
    ["color"] = Color3.fromRGB(255, 69, 69)
}
v8[v6.FANCY] = {
    ["text"] = "Fancy"
}
v8[v6.CLEAN] = {
    ["text"] = "Clean"
}
v8[v6.MID] = {
    ["text"] = "Mid"
}
v8[v6.SCARED] = {
    ["text"] = "Scared"
}
v8[v6.BAIT] = {
    ["text"] = "Bait"
}
v8[v6.GENERATOR] = {
    ["text"] = "Generator"
}
v8[v6.NOOB] = {
    ["text"] = "Noob"
}
v8[v6.CASUAL] = {
    ["text"] = "CASUAL"
}
v8[v6.COMPETITIVE] = {
    ["text"] = "Competitive"
}
v8[v6.VERIFIED] = {
    ["text"] = "Verified",
    ["color"] = Color3.fromRGB(71, 214, 255)
}
v8[v6.EASTER_EVENT_2022] = {
    ["name"] = "Easter Event 2022",
    ["text"] = "\240\159\165\154\240\159\144\176 <font color=\"#9DF8DF\">Happy</font> <font color=\"#FCC370\">Easter</font> <font color=\"#FDCEDD\">2022</font>"
}
v8[v6.PIRATE_EVENT_2022] = {
    ["name"] = "Pirate Event 2022 \240\159\143\180\226\128\141\226\152\160\239\184\143",
    ["text"] = "<font color=\"#191919\">Pirate Event</font> <font color=\"#FFFFFF\">2022 \240\159\143\180\226\128\141\226\152\160\239\184\143</font>"
}
v8[v6.ARRGH] = {
    ["text"] = "AARGH!"
}
v8[v6.CAPTAIN] = {
    ["text"] = "Captain",
    ["color"] = Color3.fromHex("#E82A2A")
}
v8[v6.PIRATE] = {
    ["text"] = "Pirate \240\159\166\156"
}
v8[v6.CORSAIR] = {
    ["text"] = "Corsair"
}
v8[v6.QUARTERMASTER] = {
    ["text"] = "Quartermaster"
}
v8[v6.FIRST_MATE] = {
    ["text"] = "First Mate"
}
v8[v6.SAILOR] = {
    ["text"] = "Sailor"
}
v8[v6.CRYPT_MASTER] = {
    ["text"] = "Crypt Master",
    ["color"] = Color3.fromRGB(10, 240, 194)
}
v8[v6.NECROMANCER] = {
    ["text"] = "Necromancer"
}
v8[v6.PHANTOM] = {
    ["text"] = "Phantom",
    ["color"] = Color3.fromRGB(176, 10, 181)
}
v8[v6.BLOODY] = {
    ["text"] = "Bloody",
    ["color"] = Color3.fromRGB(255, 23, 23)
}
v8[v6.MUMMY] = {
    ["text"] = "Mummy"
}
v8[v6.SKELETON] = {
    ["text"] = "Skeleton"
}
v8[v6.ICY] = {
    ["name"] = "Icy",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(46, 247, 255)) .. "\">Icy</font>"
}
v8[v6.JOLLY] = {
    ["name"] = "Jolly",
    ["text"] = "Jolly"
}
v8[v6.CHILL] = {
    ["name"] = "Chill",
    ["text"] = "Chill"
}
v8[v6.SNOWFLAKE_EMOJI] = {
    ["name"] = "Snowflake Emoji",
    ["text"] = "\226\157\132\239\184\143"
}
v8[v6.MOUNTAIN_CONQUEROR] = {
    ["name"] = "Mountain Conqueror",
    ["text"] = "Mountain Conqueror",
    ["color"] = Color3.fromRGB(46, 247, 255)
}
v8[v6.ICED_OUT] = {
    ["name"] = "Iced Out",
    ["text"] = "Iced Out",
    ["color"] = Color3.fromRGB(110, 187, 255)
}
local v11 = v6.BING_CHILLING
local v12 = {
    ["name"] = "Bing chilling \240\159\165\182\240\159\141\166",
    ["text"] = "Bing chilling \240\159\165\182\240\159\141\166",
    ["color"] = Color3.fromRGB(110, 187, 255),
    ["stroke"] = {
        ["color"] = Color3.fromRGB(0, 0, 0)
    }
}
v8[v11] = v12
v8[v6.NY_2023] = {
    ["name"] = "2023",
    ["text"] = "2023",
    ["color"] = v5.mcGold
}
v8[v6.TITAN] = {
    ["name"] = "TITAN",
    ["text"] = "TITAN",
    ["color"] = Color3.fromRGB(255, 41, 41)
}
v8[v6.GOOD_FORTUNE] = {
    ["name"] = "Good Fortune",
    ["text"] = "Good Fortune"
}
v8[v6.POTATO] = {
    ["name"] = "Potato",
    ["text"] = "Potato"
}
v8[v6.ROBOT] = {
    ["name"] = "Robot",
    ["text"] = "Robot"
}
v8[v6.ROBOT_EMOJI] = {
    ["name"] = "Robot Emoji",
    ["text"] = "\240\159\164\150"
}
v8[v6.SNEAKY] = {
    ["name"] = "Sneaky",
    ["text"] = "Sneaky"
}
v8[v6.GEN_CAMPER] = {
    ["name"] = "Gen Camper",
    ["text"] = "Gen Camper"
}
v8[v6.INFECTED] = {
    ["name"] = "Infected",
    ["text"] = "Infected"
}
v8[v6.SHARP_SHOOTER] = {
    ["name"] = "Sharp Shooter",
    ["text"] = "Sharp Shooter"
}
v8[v6.UNDEFEATED] = {
    ["name"] = "Undefeated",
    ["text"] = "Undefeated"
}
v8[v6.GLOOP] = {
    ["name"] = "Gloop",
    ["text"] = "Gloop"
}
v8[v6.HATS_OFF] = {
    ["name"] = "Hats Off",
    ["text"] = "Hats Off"
}
v8[v6.ON_THE_GRIND] = {
    ["name"] = "On The Grind",
    ["text"] = "On The Grind"
}
v8[v6.SPEED_DEMON] = {
    ["name"] = "Speed Demon",
    ["text"] = "Speed Demon"
}
v8[v6.SLAY] = {
    ["name"] = "Slay",
    ["text"] = "Slay"
}
v8[v6.BIG_EGO] = {
    ["name"] = "Big Ego",
    ["text"] = "Big Ego"
}
v8[v6.WHAT_FACE] = {
    ["name"] = "Face",
    ["text"] = ".-."
}
v8[v6.BLOCK_FACE] = {
    ["name"] = "Block Face",
    ["text"] = "[^-^]"
}
v8[v6.BOMB_EMOJI] = {
    ["name"] = "Bomb Emoji",
    ["text"] = "\240\159\146\163"
}
v8[v6.DESTROYER] = {
    ["name"] = "Destroyer",
    ["text"] = "Destroyer"
}
v8[v6.LEGEND] = {
    ["name"] = "Legend",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(56, 56, 56)) .. "\" thickness=\"2\"><font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 199, 41)) .. "\">Legend</font></stroke>",
    ["color"] = Color3.fromRGB(255, 199, 41)
}
v8[v6.EGG_HUNT_2023] = {
    ["name"] = "\240\159\165\154 Egg Hunt 2023 \240\159\144\135",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(36, 36, 36)) .. "\" thickness=\"2\"><font>Egg Hunt 2023</font></stroke>"
}
v8[v6.EGGCELLENT] = {
    ["name"] = "EGGCELLENT",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\" thickness=\"3\"><font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 184, 82)) .. "\">\240\159\165\154 EGG-CELLENT</font></stroke>"
}
v8[v6.TWO_YEAR_ANNIVERSARY] = {
    ["name"] = "Two Year Anniversary",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\" thickness=\"1\"><font color=\"" .. v2.richTextColor(Color3.fromRGB(110, 110, 255)) .. "\">\240\159\142\137 TWO YEAR ANNIVERSARY \240\159\142\137</font></stroke>"
}
v8[v6.BIRTHDAY] = {
    ["name"] = "Birthday",
    ["text"] = "Birthday \240\159\142\130"
}
v8[v6.PARTY] = {
    ["name"] = "Party",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 0, 0)) .. "\">P</font><font color=\"" .. v2.richTextColor(Color3.fromRGB(0, 255, 0)) .. "\">A</font><font color=\"" .. v2.richTextColor(Color3.fromRGB(0, 0, 255)) .. "\">R</font><font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 255, 0)) .. "\">T</font><font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 192, 203)) .. "\">Y</font>"
}
v8[v6.LET_EM_COOK] = {
    ["name"] = "Let em cook",
    ["text"] = "Let em cook"
}
v8[v6.WHO_LET_EM_COOK] = {
    ["name"] = "Who let em cook",
    ["text"] = "Who let em cook"
}
v8[v6.COMFY] = {
    ["name"] = "Comfy",
    ["text"] = "Comfy"
}
v8[v6.GIGACHAD] = {
    ["name"] = "Gigachad",
    ["text"] = "Gigachad"
}
v8[v6.CLOWN_EMOJI] = {
    ["name"] = "Clown Emoji",
    ["text"] = "\240\159\164\161"
}
v8[v6.NERD_EMOJI] = {
    ["name"] = "Nerd Emoji",
    ["text"] = "\240\159\164\147"
}
v8[v6.SUMMER_STRIKER] = {
    ["name"] = "Summer Striker",
    ["text"] = "Summer Striker"
}
v8[v6.SUNSHINE] = {
    ["name"] = "Sunshine",
    ["text"] = "Sunshine"
}
v8[v6.WAVE_RIDER] = {
    ["name"] = "Wave Rider",
    ["text"] = "Wave Rider"
}
v8[v6.RADIANT] = {
    ["name"] = "Radiant",
    ["text"] = "Radiant"
}
v8[v6.BLAZING] = {
    ["name"] = "Blazing",
    ["text"] = "Blazing",
    ["color"] = Color3.fromRGB(255, 135, 71)
}
v8[v6.VIRTUOSO] = {
    ["name"] = "Virtuoso",
    ["text"] = "Virtuoso"
}
v8[v6.CHANCE] = {
    ["name"] = "Chance",
    ["text"] = "Chance",
    ["color"] = Color3.fromRGB(255, 33, 120)
}
v8[v6.JESTER] = {
    ["name"] = "Jester",
    ["text"] = "Jester"
}
v8[v6.VOLT_EMOJI] = {
    ["name"] = "Volt Emoji",
    ["text"] = "\226\154\161"
}
v8[v6.ELECTRIFY] = {
    ["name"] = "Electrify",
    ["text"] = "Electrify",
    ["color"] = Color3.fromRGB(10, 145, 255)
}
v8[v6.SURF_EMOJI] = {
    ["name"] = "Surf Emoji",
    ["text"] = "\240\159\143\132"
}
v8[v6.CARRY] = {
    ["name"] = "Carry",
    ["text"] = "Carry"
}
v8[v6.BARBARIAN] = {
    ["name"] = "Barbarian",
    ["text"] = "Barbarian",
    ["color"] = Color3.fromRGB(245, 59, 20)
}
v8[v6.PUMPKIN] = {
    ["name"] = "Pumpkin",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 148, 10)) .. "\">Pumpkin</font>"
}
v8[v6.CURSED] = {
    ["name"] = "Cursed",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(74, 0, 145)) .. "\">Cursed</font>"
}
v8[v6.SKULL_EMOJI] = {
    ["name"] = "Skull Emoji",
    ["text"] = "\240\159\146\128"
}
v8[v6.WITCH] = {
    ["name"] = "Witch",
    ["text"] = "Witch"
}
v8[v6.WARLOCK_SLAYER] = {
    ["name"] = "Warlock Slayer",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(5, 255, 26)) .. "\">Warlock Slayer</font>"
}
v8[v6.SPIDER_EMOJI] = {
    ["name"] = "Spider Emoji",
    ["text"] = "\240\159\149\183\239\184\143"
}
v8[v6.MONSTER] = {
    ["name"] = "Monster",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(214, 15, 227)) .. "\">Monster</font>"
}
v8[v6.ARACHNID] = {
    ["name"] = "Monster",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(61, 10, 148)) .. "\">Arachnid</font>"
}
v8[v6.SCARY] = {
    ["name"] = "Monster",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(0, 222, 41)) .. "\">Scary</font>"
}
v8[v6.SPIDER_SQUASHER] = {
    ["name"] = "Monster",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(122, 10, 23)) .. "\">Spider Squasher</font>"
}
local v13 = v6.SUPER
local v14 = {
    ["name"] = "Epilogue: RGB SUPER",
    ["text"] = "SUPER",
    ["effects"] = {
        ["rgb"] = {
            Color3.fromRGB(255, 69, 69),
            Color3.fromRGB(255, 158, 82),
            Color3.fromRGB(255, 245, 107),
            Color3.fromRGB(102, 171, 255)
        }
    }
}
v8[v13] = v14
v8[v6.SLIME_TAMER] = {
    ["name"] = "Slime Tamer",
    ["text"] = "Slime Tamer"
}
v8[v6.MARTIAL_ARTIST] = {
    ["name"] = "Martial Artist",
    ["text"] = "Martial Artist"
}
v8[v6.CRIMSON] = {
    ["name"] = "Crimson",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(181, 10, 10)) .. "\">Crimson</font>"
}
v8[v6.TINKERER] = {
    ["name"] = "Tinkerer",
    ["text"] = "Tinkerer"
}
v8[v6.INVENTOR] = {
    ["name"] = "Inventor",
    ["text"] = "Inventor"
}
v8[v6.GENIUS] = {
    ["name"] = "Genius",
    ["text"] = "Genius"
}
v8[v6.RAWR] = {
    ["name"] = "RAWR",
    ["text"] = "RAWR"
}
v8[v6.STEALTHY] = {
    ["name"] = "Stealthy",
    ["text"] = "Stealthy"
}
v8[v6.SHADOW] = {
    ["name"] = "Shadow",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(23, 23, 23)) .. "\">Shadow</font>"
}
v8[v6.CAT_EMOJI] = {
    ["name"] = "Cat Emoji",
    ["text"] = "\240\159\144\177"
}
v8[v6.LIT] = {
    ["name"] = "LIT",
    ["text"] = "LIT"
}
local v15 = v6.LIT_RGB
local v16 = {
    ["name"] = "Epilogue: RGB LIT",
    ["text"] = "LIT",
    ["effects"] = {
        ["rgb"] = {
            Color3.fromRGB(255, 69, 69),
            Color3.fromRGB(255, 158, 82),
            Color3.fromRGB(255, 245, 107),
            Color3.fromRGB(102, 171, 255)
        }
    }
}
v8[v15] = v16
v8[v6.BOOP] = {
    ["name"] = "Boop",
    ["text"] = "Boop"
}
v8[v6.ZOOM] = {
    ["name"] = "ZOOM",
    ["text"] = "ZOOM"
}
v8[v6.CHEF] = {
    ["name"] = "Chef",
    ["text"] = "Chef"
}
v8[v6.MARTIAL_EMOJI] = {
    ["name"] = "Martial Arts Emoji",
    ["text"] = "\240\159\165\139"
}
v8[v6.NEW_YEARS_2024] = {
    ["name"] = "2024",
    ["text"] = "2024",
    ["color"] = v5.mcGold
}
v8[v6.FESTIVE] = {
    ["name"] = "Festive",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(220, 20, 60)) .. "\">Fe</font><font color=\"" .. v2.richTextColor(Color3.fromRGB(34, 139, 34)) .. "\">sti</font><font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 215, 0)) .. "\">ve</font> \240\159\142\132\226\152\131\239\184\143\226\157\132\239\184\143"
}
v8[v6.CHEERFUL] = {
    ["name"] = "Cheerful",
    ["text"] = "Cheerful"
}
v8[v6.BLIZZARD] = {
    ["name"] = "Blizzard",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(33, 232, 255)) .. "\">Blizzard</font>"
}
v8[v6.PRESENT_EMOJI] = {
    ["name"] = "Present Emoji",
    ["text"] = "\240\159\142\129"
}
local v17 = v6.HERO
local v18 = {
    ["name"] = "Hero",
    ["text"] = "Hero",
    ["stroke"] = {
        ["thickness"] = 3,
        ["color"] = v2.BLACK
    },
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(92, 227, 255), Color3.fromRGB(102, 168, 255) }
    }
}
v8[v17] = v18
v8[v6.SPIRIT_ASSASSIN] = {
    ["name"] = "Evelynn",
    ["text"] = "Evelynn",
    ["color"] = Color3.fromRGB(110, 92, 255)
}
v8[v6.YEAR_OF_THE_DRAGON] = {
    ["name"] = "Year of The Dragon",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(252, 199, 59)) .. "\">Year of The Dragon</font>"
}
v8[v6.LUNAR_NEW_YEAR_2024] = {
    ["name"] = "Lunar New Year 2024",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 61, 61)) .. "\">Lunar New Year 2024</font>"
}
v8[v6.GOOD_LUCK] = {
    ["name"] = "Good Luck",
    ["text"] = "Good Luck"
}
v8[v6.PROSPEROUS] = {
    ["name"] = "Prosperous",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 61, 61)) .. "\">Prosperous</font>"
}
v8[v6.LONGEVITY] = {
    ["name"] = "Longevity",
    ["text"] = "Longevity"
}
v8[v6.RED_ENVELOPE] = {
    ["name"] = "Red Envelope Emoji",
    ["text"] = "\240\159\167\167"
}
v8[v6.RED_PAPER_LANTERN] = {
    ["name"] = "Red Paper Lantern Emoji",
    ["text"] = "\240\159\143\174"
}
local v19 = v6.MAP_CONTEST_WINNER
local v20 = {
    ["name"] = "Map Contest Winner",
    ["text"] = "Map Contest Winner",
    ["effects"] = {
        ["rgb"] = {
            Color3.fromRGB(255, 69, 69),
            Color3.fromRGB(255, 153, 61),
            Color3.fromRGB(255, 235, 74),
            Color3.fromRGB(92, 255, 92),
            Color3.fromRGB(92, 227, 255),
            Color3.fromRGB(255, 102, 255)
        }
    }
}
v8[v19] = v20
v8[v6.EGG_HUNT_2024] = {
    ["name"] = "\240\159\165\154 Egg Hunt 2024 \240\159\144\135",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(36, 36, 36)) .. "\" thickness=\"2\"><font>Egg Hunt 2024</font></stroke>"
}
v8[v6.EGGSTRAORDINARY] = {
    ["name"] = "EGGSTRAORDINARY",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\" thickness=\"3\"><font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 184, 82)) .. "\">\240\159\165\154 EGGSTRAORDINARY</font></stroke>"
}
v8[v6.SCHOLAR] = {
    ["name"] = "Scholar",
    ["text"] = "\240\159\142\147 Scholar"
}
v8[v6.ANGEL] = {
    ["name"] = "Angel",
    ["text"] = "Angel"
}
v8[v6.BLESSED] = {
    ["name"] = "Blessed",
    ["text"] = "Blessed"
}
v8[v6.GODLY] = {
    ["name"] = "Godly",
    ["text"] = "Godly",
    ["color"] = Color3.fromRGB(255, 230, 3)
}
v8[v6.HALO_EMOJI] = {
    ["name"] = "Halo Emoji",
    ["text"] = "\240\159\152\135"
}
v8[v6.ON_FIRE] = {
    ["name"] = "On Fire",
    ["text"] = "On Fire"
}
v8[v6.MECHANIC] = {
    ["name"] = "Mechanic",
    ["text"] = "Mechanic"
}
v8[v6.FIRE_EMOJI] = {
    ["name"] = "Fire Emoji",
    ["text"] = "\240\159\148\165"
}
v8[v6.IMMORTAL] = {
    ["name"] = "Immortal",
    ["text"] = "Immortal",
    ["color"] = Color3.fromRGB(163, 28, 0)
}
v8[v6.MARKED] = {
    ["name"] = "Marked",
    ["text"] = "Marked"
}
v8[v6.ORACLE] = {
    ["name"] = "Oracle",
    ["text"] = "Oracle"
}
v8[v6.PYROMANIAC] = {
    ["name"] = "Pyromaniac",
    ["text"] = "Pyromaniac"
}
v8[v6.TOILET] = {
    ["name"] = "Toilet",
    ["text"] = "Toilet \240\159\167\145\240\159\154\189"
}
v8[v6.LIL_BRO] = {
    ["name"] = "Lil Bro",
    ["text"] = "Lil Bro"
}
local v21 = v6.FEATURED_MAP_CREATOR
local v22 = {
    ["name"] = "Featured Map Creator",
    ["text"] = "\226\173\144 Featured Map Creator \226\173\144",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(252, 179, 43), Color3.fromRGB(255, 212, 56) }
    }
}
v8[v21] = v22
v8[v6.THREE_YEAR_ANNIVERSARY] = {
    ["name"] = "Three Year Anniversary",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\" thickness=\"1\"><font color=\"" .. v2.richTextColor(Color3.fromRGB(110, 171, 255)) .. "\">\240\159\142\137 THREE YEAR ANNIVERSARY \240\159\142\137</font></stroke>"
}
local v23 = v6.SQUAD_UP
local v24 = {
    ["name"] = "Squad Up",
    ["text"] = "SQUAD UP",
    ["color"] = Color3.fromRGB(130, 130, 255),
    ["stroke"] = {
        ["thickness"] = 1,
        ["color"] = Color3.fromRGB(255, 255, 255)
    }
}
v8[v23] = v24
v8[v6.TRIPLE_THREAT] = {
    ["name"] = "Triple Threat",
    ["text"] = "TRIPLE THREAT",
    ["color"] = Color3.fromRGB(232, 117, 61)
}
v8[v6.GRIM_REAPER] = {
    ["name"] = "Grim Reaper",
    ["text"] = "Grim Reaper",
    ["color"] = Color3.fromRGB(43, 28, 71)
}
local v25 = v6.U_JELLY
local v26 = {
    ["name"] = "U JELLY?",
    ["text"] = "U JELLY?",
    ["color"] = Color3.fromRGB(69, 125, 255),
    ["stroke"] = {
        ["thickness"] = 1,
        ["color"] = Color3.fromRGB(255, 255, 255)
    }
}
v8[v25] = v26
v8[v6.SUNGLASSES_EMOJI] = {
    ["name"] = "Sunglasses Emoji",
    ["text"] = "\240\159\152\142"
}
local v27 = v6.SUNS_OUT_GUNS_OUT
local v28 = {
    ["name"] = "SUNS OUT GUNS OUT",
    ["text"] = "\240\159\146\170 SUNS OUT GUNS OUT \240\159\146\170",
    ["color"] = Color3.fromRGB(255, 255, 255),
    ["stroke"] = {
        ["thickness"] = 1,
        ["color"] = Color3.fromRGB(255, 255, 255)
    }
}
v8[v27] = v28
v8[v6.SALTY] = {
    ["name"] = "SALTY",
    ["text"] = "SALTY",
    ["color"] = Color3.fromRGB(255, 255, 255)
}
local v29 = v6.FLOW
local v30 = {
    ["name"] = "Flow",
    ["text"] = "FLOW",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(87, 181, 255), Color3.fromRGB(34, 52, 174) }
    }
}
v8[v29] = v30
local v31 = v6.NAH_ID_WIN
local v32 = {
    ["name"] = "NAH, I\'D WIN",
    ["text"] = "NAH, I\'D WIN",
    ["color"] = Color3.fromRGB(255, 255, 255),
    ["stroke"] = {
        ["thickness"] = 1,
        ["color"] = Color3.fromRGB(0, 0, 0)
    }
}
v8[v31] = v32
v8[v6.ALCHEMIST] = {
    ["name"] = "Alchemist",
    ["text"] = "Alchemist"
}
v8[v6.SUMMONER] = {
    ["name"] = "Summoner",
    ["text"] = "Summoner"
}
v8[v6.MASK_EMOJI] = {
    ["name"] = "Mask Emoji",
    ["text"] = "\240\159\142\173"
}
v8[v6.RANKED_ONLY] = {
    ["name"] = "Ranked Only",
    ["text"] = "Ranked Only"
}
v8[v6.SPARKLES_EMOJI] = {
    ["name"] = "Sparkles Emoji",
    ["text"] = "\226\156\168"
}
v8[v6.TANK] = {
    ["name"] = "Tank",
    ["text"] = "Tank"
}
v8[v6.ASSASSIN] = {
    ["name"] = "Assassin",
    ["text"] = "Assassin",
    ["color"] = Color3.fromRGB(189, 81, 81)
}
local v33 = v6.RAVEN
local v34 = {
    ["name"] = "Raven",
    ["text"] = "Raven",
    ["color"] = Color3.fromRGB(87, 201, 102),
    ["stroke"] = {
        ["color"] = Color3.fromRGB(0, 0, 0)
    }
}
v8[v33] = v34
v8[v6.MAGICAL] = {
    ["name"] = "Magical",
    ["text"] = "\240\159\146\171 Magical \240\159\146\171"
}
v8[v6.REBEL] = {
    ["name"] = "Rebel",
    ["text"] = "Rebel"
}
local v35 = v6.SORCERER
local v36 = {
    ["name"] = "Sorcerer",
    ["text"] = "Sorcerer",
    ["color"] = Color3.fromRGB(129, 10, 123),
    ["stroke"] = {
        ["color"] = Color3.fromRGB(244, 195, 88)
    }
}
v8[v35] = v36
local v37 = v6.UNSTOPPABLE
local v38 = {
    ["name"] = "UNSTOPPABLE",
    ["text"] = "UNSTOPPABLE",
    ["color"] = Color3.fromRGB(3, 191, 182),
    ["stroke"] = {
        ["thickness"] = 2,
        ["color"] = Color3.fromRGB(0, 0, 0)
    }
}
v8[v37] = v38
v8[v6.ROYAL] = {
    ["name"] = "ROYAL",
    ["text"] = "\240\159\145\145 ROYAL \240\159\145\145",
    ["color"] = Color3.fromRGB(252, 194, 3)
}
v8[v6.TOURNAMENT_CHAMPION] = {
    ["name"] = "Tournament Champion",
    ["text"] = "\240\159\143\134 Tournament Champion \240\159\143\134",
    ["limited"] = true,
    ["color"] = Color3.fromRGB(252, 194, 3)
}
v8[v6.SPIDER_SLAYER] = {
    ["name"] = "Spider Slayer",
    ["text"] = "Spider Slayer",
    ["color"] = Color3.fromRGB(163, 0, 199)
}
local v39 = v6.POISON_RGB
local v40 = {
    ["name"] = "Poison RGB",
    ["text"] = "Poison",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(56, 222, 56), Color3.fromRGB(31, 143, 23) }
    }
}
v8[v39] = v40
v8[v6.HUNTER] = {
    ["name"] = "Hunter",
    ["text"] = "Hunter",
    ["color"] = Color3.fromRGB(130, 18, 10)
}
v8[v6.SPIRIT_WARRIOR] = {
    ["name"] = "Spirit Warrior",
    ["text"] = "Spirit Warrior"
}
local v41 = v6.VOID_KNIGHT
local v42 = {
    ["name"] = "Void Knight",
    ["text"] = "Void Knight",
    ["color"] = Color3.fromRGB(89, 23, 166),
    ["stroke"] = {
        ["thickness"] = 1,
        ["color"] = Color3.fromRGB(0, 0, 0)
    }
}
v8[v41] = v42
local v43 = v6.SPIRIT_WHISPERER
local v44 = {
    ["name"] = "Spirit Whisperer",
    ["text"] = "Spirit Whisperer",
    ["color"] = Color3.fromRGB(74, 173, 204),
    ["stroke"] = {
        ["thickness"] = 1,
        ["color"] = Color3.fromRGB(255, 255, 255)
    }
}
v8[v43] = v44
v8[v6.ABSOLUTE_CINEMA] = {
    ["name"] = "Absolute Cinema",
    ["text"] = "\226\156\139 Absolute Cinema \240\159\164\154"
}
local v45 = v6.GARDENER
local v46 = {
    ["name"] = "Gardener",
    ["text"] = "\240\159\140\177 Gardener \240\159\140\177",
    ["color"] = Color3.fromRGB(36, 171, 59),
    ["stroke"] = {
        ["thickness"] = 1,
        ["color"] = Color3.fromRGB(23, 107, 13)
    }
}
v8[v45] = v46
v8[v6.VOIDLING] = {
    ["name"] = "Voidling",
    ["text"] = "Voidling"
}
local v47 = v6.RIFTWALKER
local v48 = {
    ["name"] = "Riftwalker",
    ["text"] = "Riftwalker",
    ["color"] = Color3.fromRGB(97, 13, 148),
    ["stroke"] = {
        ["thickness"] = 1,
        ["color"] = Color3.fromRGB(0, 0, 0)
    }
}
v8[v47] = v48
v8[v6.PURPLE_HEART] = {
    ["name"] = "Purple Heart Emoji",
    ["text"] = "\240\159\146\156"
}
v8[v6.BLUE_HEART] = {
    ["name"] = "Blue Heart Emoji",
    ["text"] = "\240\159\146\153"
}
v8[v6.FINGERS_POINTING_INWARD] = {
    ["name"] = "Shy Emoji",
    ["text"] = "\240\159\145\137\240\159\145\136"
}
local v49 = v6.CORRUPTED
local v50 = {
    ["name"] = "Corrupted",
    ["text"] = "Corrupted",
    ["effects"] = {
        ["rgb"] = {
            Color3.fromRGB(143, 48, 214),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(173, 33, 179),
            Color3.fromRGB(0, 0, 0)
        }
    }
}
v8[v49] = v50
local v51 = v6.SPIRIT_ISLAND_RESIDENT
local v52 = {
    ["name"] = "Spirit Island Resident",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(107, 196, 209)) .. "\">Spirit</font> <font color=\"" .. v2.richTextColor(Color3.fromRGB(196, 84, 194)) .. "\">Island</font> <font color=\"" .. v2.richTextColor(Color3.fromRGB(69, 150, 209)) .. "\">Resident</font>",
    ["stroke"] = {
        ["thickness"] = 1,
        ["color"] = Color3.fromRGB(255, 255, 255)
    }
}
v8[v51] = v52
local v53 = v6.DIMENSION_TRAVELER
local v54 = {
    ["name"] = "Dimension Traveler",
    ["text"] = "\226\156\168 Dimension Traveler \226\156\168",
    ["effects"] = {
        ["rgb"] = {
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(92, 227, 255),
            Color3.fromRGB(255, 102, 255),
            Color3.fromRGB(255, 255, 255)
        }
    }
}
v8[v53] = v54
v8[v6.NEW_YEARS_2025] = {
    ["name"] = "2025",
    ["text"] = "2025",
    ["color"] = v5.mcGold
}
v8[v6.ICE_SKATER] = {
    ["name"] = "Ice Skater",
    ["text"] = "\226\155\184\239\184\143 Ice Skater \226\155\184\239\184\143",
    ["color"] = Color3.fromRGB(54, 252, 237)
}
v8[v6.YEAR_OF_THE_SNAKE] = {
    ["name"] = "Year of The Snake",
    ["text"] = "\240\159\144\141 Year of The Snake \240\159\144\141",
    ["color"] = Color3.fromRGB(255, 74, 74)
}
v8[v6.SNAKE_EMOJI] = {
    ["name"] = "Snake Emoji",
    ["text"] = "\240\159\144\141"
}
v8[v6.VIPER] = {
    ["name"] = "Viper",
    ["text"] = "Viper"
}
v8[v6.VENOM] = {
    ["name"] = "Venom",
    ["text"] = "Venom",
    ["color"] = Color3.fromRGB(84, 250, 117)
}
v8[v6.FANG] = {
    ["name"] = "Fang",
    ["text"] = "Fang",
    ["color"] = Color3.fromRGB(255, 227, 43)
}
v8[v6.VIP] = {
    ["name"] = "VIP",
    ["text"] = "VIP",
    ["color"] = Color3.fromRGB(84, 250, 117)
}
v8[v6.DASHER] = {
    ["name"] = "Yuzi",
    ["text"] = "Yuzi",
    ["color"] = Color3.fromRGB(209, 36, 36)
}
v8[v6.TRICKSTER] = {
    ["name"] = "Trickster",
    ["text"] = "Trickster",
    ["color"] = Color3.fromRGB(153, 36, 209)
}
local v55 = v6.HUNTER_RGB
local v56 = {
    ["name"] = "Hunter RGB",
    ["text"] = "Hunter",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(130, 18, 10), Color3.fromRGB(237, 28, 28) }
    }
}
v8[v55] = v56
v8[v6.EGG_HUNT_2025] = {
    ["name"] = "Egg Hunt 2025",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(36, 36, 36)) .. "\" thickness=\"2\"><font>Egg Hunt 2025</font></stroke>"
}
v8[v6.EGGSQUISITE] = {
    ["name"] = "Eggsquisite",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\" thickness=\"3\"><font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 184, 82)) .. "\">\240\159\165\154 EGGSQUISITE</font></stroke>"
}
v8[v6.ONE_OF_A_KIND] = {
    ["name"] = "One of a Kind",
    ["text"] = "One of a Kind"
}
v8[v6.MIRAGE] = {
    ["name"] = "Mirage",
    ["text"] = "Mirage",
    ["color"] = Color3.fromRGB(60, 255, 243)
}
local v57 = v6.OASIS
local v58 = {
    ["name"] = "Oasis",
    ["text"] = "\240\159\143\157\239\184\143 Oasis",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(82, 207, 217), Color3.fromRGB(64, 74, 240) }
    }
}
v8[v57] = v58
v8[v6.SAND_BENDER] = {
    ["name"] = "Sand Bender",
    ["text"] = "\240\159\143\156\239\184\143 Sand Bender",
    ["color"] = Color3.fromRGB(255, 171, 60)
}
v8[v6.YAPPER] = {
    ["name"] = "Yapper",
    ["text"] = "Yapper"
}
v8[v6.DODO_TAMER] = {
    ["name"] = "Dodo Tamer",
    ["text"] = "\240\159\166\164 Dodo Tamer"
}
v8[v6.WANDERER] = {
    ["name"] = "Wanderer",
    ["text"] = "Wanderer"
}
v8[v6.SKILL_ISSUE] = {
    ["name"] = "Skill Issue",
    ["text"] = "Skill Issue"
}
v8[v6.IN_YOUR_HEAD] = {
    ["name"] = "In Your Head",
    ["text"] = "In Your Head"
}
v8[v6.CACTUS_EMOJI] = {
    ["name"] = "Cactus Emoji",
    ["text"] = "\240\159\140\181"
}
v8[v6.FOUR_YEAR_ANNIVERSARY] = {
    ["name"] = "Four Year Anniversary",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\" thickness=\"1\"><font color=\"" .. v2.richTextColor(Color3.fromRGB(110, 110, 255)) .. "\">\240\159\142\137 FOUR YEAR ANNIVERSARY \240\159\142\137</font></stroke>"
}
v8[v6.SHARP] = {
    ["name"] = "Sharp",
    ["text"] = "Sharp",
    ["color"] = Color3.fromRGB(38, 150, 255)
}
local v59 = v6.WAVEMAKER
local v60 = {
    ["name"] = "Wavemaker",
    ["text"] = "\240\159\140\138 Wavemaker \240\159\140\138",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(82, 166, 217), Color3.fromRGB(64, 74, 240), Color3.fromRGB(176, 201, 217) }
    }
}
v8[v59] = v60
v8[v6.TREASURE_HUNTER] = {
    ["name"] = "Treasure Hunter",
    ["text"] = "Treasure Hunter \226\157\140"
}
v8[v6.CASTAWAY] = {
    ["name"] = "Castaway",
    ["text"] = "Castaway",
    ["color"] = Color3.fromRGB(255, 153, 0)
}
v8[v6.GILDED] = {
    ["name"] = "Gilded",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(255, 230, 38)) .. "\" thickness=\"1\"><font color=\"" .. v2.richTextColor(Color3.fromRGB(28, 28, 28)) .. "\">Gilded</font></stroke>"
}
local v61 = v6.PRIDE_RGB
local v62 = {
    ["name"] = "Pride RGB",
    ["text"] = "Pride",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(217, 196, 82), Color3.fromRGB(240, 204, 64), Color3.fromRGB(212, 133, 89) }
    }
}
v8[v61] = v62
v8[v6.FROST_QUEEN] = {
    ["name"] = "Frost Queen",
    ["text"] = "\240\159\145\145 Frost Queen \240\159\145\145",
    ["color"] = Color3.fromRGB(102, 255, 255)
}
v8[v6.AERY] = {
    ["name"] = "Aery",
    ["text"] = "Aery",
    ["color"] = Color3.fromRGB(122, 255, 255)
}
v8[v6.COOK] = {
    ["name"] = "Cook",
    ["text"] = "\240\159\148\165 Cook \240\159\148\165",
    ["color"] = Color3.fromRGB(255, 186, 59)
}
v8[v6.BAKER] = {
    ["name"] = "Baker",
    ["text"] = "Baker",
    ["color"] = Color3.fromRGB(250, 201, 145)
}
v8[v6.NIGHT_OWL] = {
    ["name"] = "Night Owl",
    ["text"] = "\240\159\140\153 Night Owl \240\159\140\153",
    ["color"] = Color3.fromRGB(112, 36, 110)
}
v8[v6.WHISPER] = {
    ["name"] = "Whisper",
    ["text"] = "Whisper",
    ["color"] = Color3.fromRGB(166, 43, 148)
}
v8[v6.COW_GIRL] = {
    ["name"] = "Cow Girl",
    ["text"] = "\240\159\144\132 Cow Girl \240\159\144\132",
    ["color"] = Color3.fromRGB(255, 153, 0)
}
v8[v6.LASSY] = {
    ["name"] = "Lassy",
    ["text"] = "Lassy",
    ["color"] = Color3.fromRGB(255, 153, 0)
}
v8[v6.SANDBENDER] = {
    ["name"] = "Sandbender",
    ["text"] = "\240\159\143\156\239\184\143 Sandbender \240\159\143\156\239\184\143",
    ["color"] = Color3.fromRGB(255, 222, 173)
}
v8[v6.RAMIL] = {
    ["name"] = "Ramil",
    ["text"] = "Ramil",
    ["color"] = Color3.fromRGB(255, 214, 153)
}
v8[v6.JELLY] = {
    ["name"] = "Jelly",
    ["text"] = "\240\159\170\188 Jelly \240\159\170\188",
    ["color"] = Color3.fromRGB(115, 189, 232)
}
v8[v6.MARINA] = {
    ["name"] = "Marina",
    ["text"] = "Marina",
    ["color"] = Color3.fromRGB(143, 179, 217)
}
v8[v6.DRAGON_SUMMONER] = {
    ["name"] = "Dragon Summoner",
    ["text"] = "\240\159\144\137 Dragon Summoner \240\159\144\137",
    ["color"] = Color3.fromRGB(201, 168, 255)
}
v8[v6.KAIDA] = {
    ["name"] = "Kaida",
    ["text"] = "Kaida",
    ["color"] = Color3.fromRGB(189, 135, 232)
}
v8[v6.HIDDEN] = {
    ["name"] = "Hidden",
    ["text"] = "\240\159\164\171 Hidden \240\159\164\171",
    ["color"] = Color3.fromRGB(255, 255, 255)
}
v8[v6.MILO] = {
    ["name"] = "Milo",
    ["text"] = "Milo",
    ["color"] = Color3.fromRGB(255, 255, 255)
}
v8[v6.ELECTRIC] = {
    ["name"] = "Electric",
    ["text"] = "\226\154\161 Electric \226\154\161",
    ["color"] = Color3.fromRGB(235, 232, 110)
}
v8[v6.ELEKTRA] = {
    ["name"] = "Elektra",
    ["text"] = "Elektra",
    ["color"] = Color3.fromRGB(117, 245, 235)
}
v8[v6.ICE_KING] = {
    ["name"] = "Ice King",
    ["text"] = "\240\159\165\182 Ice King \240\159\165\182",
    ["color"] = Color3.fromRGB(36, 117, 212)
}
v8[v6.ADETUNDE] = {
    ["name"] = "Adetunde",
    ["text"] = "Adetunde",
    ["color"] = Color3.fromRGB(36, 117, 212)
}
v8[v6.THE_AFK_KING] = {
    ["name"] = "The King Of AFK",
    ["text"] = "\240\159\152\180The King Of AFK \240\159\152\180",
    ["color"] = Color3.fromRGB(204, 38, 255)
}
v8[v6.REAPER_INTERN] = {
    ["name"] = "Underworld Envoy (Trainee)",
    ["text"] = "Underworld Envoy (Trainee)"
}
v8[v6.REAPER_AGENT] = {
    ["name"] = "Underworld Envoy (Agent)",
    ["text"] = "Underworld Envoy (Agent)",
    ["color"] = Color3.fromRGB(0, 5, 0)
}
local v63 = v6.REAPER_EMISSARY
local v64 = {
    ["name"] = "Underworld Envoy (Emissary)",
    ["text"] = "Underworld Envoy (Emissary)",
    ["color"] = Color3.fromRGB(0, 0, 0),
    ["stroke"] = {
        ["color"] = v2.WHITE
    }
}
v8[v63] = v64
local v65 = v6.THE_SCYTHE_OF_DEATH
local v66 = {
    ["name"] = "The Scythe Of Death",
    ["text"] = "\240\159\146\128The Scythe Of Death\240\159\146\128",
    ["color"] = Color3.fromRGB(0, 0, 0),
    ["stroke"] = {
        ["color"] = v2.WHITE
    },
    ["effects"] = {
        ["rgb"] = {
            Color3.fromRGB(120, 5, 145),
            Color3.fromRGB(61, 5, 74),
            Color3.fromRGB(0, 0, 0),
            Color3.fromRGB(5, 74, 18)
        }
    }
}
v8[v65] = v66
local v67 = v6.SOUL_HARVESTER
local v68 = {
    ["name"] = "Soul Harvester",
    ["text"] = "Soul Harvester",
    ["statsTracking"] = true,
    ["color"] = Color3.fromRGB(0, 0, 0),
    ["stroke"] = {
        ["color"] = v2.WHITE
    },
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(0, 0, 0), Color3.fromRGB(92, 92, 92) }
    }
}
v8[v67] = v68
v8[v6.BED_EMOJI] = {
    ["name"] = "Bed Emoji",
    ["text"] = "\240\159\155\143\239\184\143"
}
v8[v6.SCARED_EMOJI] = {
    ["name"] = "Scared Emoji",
    ["text"] = "\240\159\152\177",
    ["color"] = Color3.fromRGB(255, 255, 255)
}
v8[v6.BAT_EMOJIS] = {
    ["name"] = "Bat Emojis",
    ["text"] = "\240\159\166\135\240\159\166\135\240\159\166\135",
    ["color"] = Color3.fromRGB(255, 255, 255)
}
v8[v6.UNDEAD] = {
    ["name"] = "Undead",
    ["text"] = "Undead",
    ["color"] = Color3.fromRGB(255, 255, 255)
}
v8[v6.BONE_EMOJI] = {
    ["name"] = "Bone Emoji",
    ["text"] = "\240\159\166\180"
}
v8[v6.SKELETON_SLAYER] = {
    ["name"] = "Skeleton Slayer",
    ["text"] = "<font color=\"" .. v2.richTextColor(Color3.fromRGB(5, 255, 26)) .. "\">Skeleton Slayer</font>"
}
v8[v6.HOLLY] = {
    ["name"] = "Holly",
    ["text"] = "Holly",
    ["color"] = Color3.fromRGB(0, 130, 10)
}
local v69 = v6.FROZEN
local v70 = {
    ["name"] = "Frozen",
    ["text"] = "Frozen",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(153, 240, 255), Color3.fromRGB(74, 255, 252), Color3.fromRGB(74, 214, 255) }
    }
}
v8[v69] = v70
v8[v6.SEND_IT] = {
    ["name"] = "Send It",
    ["text"] = "Send It"
}
v8[v6.STEEZE] = {
    ["name"] = "Steeze",
    ["text"] = "Steeze"
}
v8[v6.SNOWBOARDER_EMOJI] = {
    ["name"] = "Snowboarder Emoji",
    ["text"] = "\240\159\143\130"
}
v8[v6.NEW_YEARS_2026] = {
    ["name"] = "2026",
    ["text"] = "2026",
    ["color"] = v5.mcGold
}
local v71 = v6.AURORA
local v72 = {
    ["name"] = "Aurora",
    ["text"] = "Aurora",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(135, 230, 255), Color3.fromRGB(74, 255, 204), Color3.fromRGB(224, 117, 255) }
    }
}
v8[v71] = v72
v8[v6.ICE_MAIDEN] = {
    ["name"] = "Ice Maiden",
    ["text"] = "Ice Maiden",
    ["color"] = Color3.fromRGB(38, 204, 255)
}
v8[v6.HEART_ARROW_EMOJI] = {
    ["name"] = "Heart Arrow Emoji",
    ["text"] = "\240\159\146\152"
}
v8[v6.HEART_SYMBOL] = {
    ["name"] = "<3",
    ["text"] = "<3"
}
v8[v6.BROKEN_HEART_SYMBOL] = {
    ["name"] = "</3",
    ["text"] = "</3"
}
v8[v6.HEARTLESS] = {
    ["name"] = "Heartless",
    ["text"] = "Heartless"
}
v8[v6.GOLDEN] = {
    ["name"] = "Golden",
    ["text"] = "Golden",
    ["color"] = Color3.fromRGB(255, 240, 28)
}
local v73 = v6.HARMONY
local v74 = {
    ["name"] = "Harmony",
    ["text"] = "Harmony",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(41, 240, 74), Color3.fromRGB(102, 240, 125) }
    }
}
v8[v73] = v74
v8[v6.THE_VOID_BRINGER] = {
    ["name"] = "Void Bringer",
    ["text"] = "Void Bringer",
    ["color"] = Color3.fromRGB(82, 0, 133)
}
v8[v6.EGG_EMOJI] = {
    ["name"] = "Egg Emoji",
    ["text"] = "\240\159\165\154"
}
v8[v6.YOLKED] = {
    ["name"] = "Yolked",
    ["text"] = "Yolked"
}
v8[v6.BLOOMED] = {
    ["name"] = "Bloomed",
    ["text"] = "Bloomed",
    ["color"] = Color3.fromRGB(64, 252, 133)
}
local v75 = v6.AWAKENED
local v76 = {
    ["name"] = "Awakened",
    ["text"] = "Awakened",
    ["effects"] = {
        ["rgb"] = { Color3.fromRGB(227, 240, 41), Color3.fromRGB(102, 240, 237) }
    }
}
v8[v75] = v76
v8[v6.EGG_HUNT_2026] = {
    ["name"] = "Egg Hunt 2026",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(36, 36, 36)) .. "\" thickness=\"2\"><font>Egg Hunt 2026</font></stroke>"
}
v8[v6.EGGCEPTIONAL] = {
    ["name"] = "Eggceptional",
    ["text"] = "<stroke color=\"" .. v2.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\" thickness=\"3\"><font color=\"" .. v2.richTextColor(Color3.fromRGB(255, 184, 82)) .. "\">\240\159\165\154 Eggceptional</font></stroke>"
}
return {
    ["LobbyTitleDefaults"] = v7,
    ["TitleMeta"] = v8
}