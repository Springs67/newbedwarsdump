local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type")
local v2 = v1.ClanUpgradeTier
local v3 = v1.ClanUpgradeType
local v4 = {
    [v3.CLAN_LEVEL] = {
        ["name"] = "Clan Level",
        ["firstUpgrade"] = v2.CLAN_LEVEL1
    },
    [v3.MEMBER_CAP] = {
        ["name"] = "Member Cap",
        ["firstUpgrade"] = v2.MEMBER_CAP1
    },
    [v3.KIT_SHOP] = {
        ["name"] = "Kit Shop",
        ["disabled"] = true,
        ["firstUpgrade"] = v2.KIT_SHOP1
    },
    [v3.SHOP] = {
        ["name"] = "Shop",
        ["firstUpgrade"] = v2.SHOP1
    },
    [v3.BATTLE_PASS_XP] = {
        ["name"] = "Battle Pass XP",
        ["firstUpgrade"] = v2.BATTLE_PASS_XP1
    },
    [v3.CLAN_ICON] = {
        ["name"] = "Clan Emblem",
        ["firstUpgrade"] = v2.CLAN_ICON
    },
    [v3.CRATE_ALTAR] = {
        ["name"] = "Crate Altar",
        ["firstUpgrade"] = v2.CRATE_ALTAR_1
    }
}
local v5 = {
    [v2.BATTLE_PASS_XP1] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 1,
        ["value"] = 1.01,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "0 \226\134\146 1% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP2,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP2] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 2,
        ["value"] = 1.02,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "1 \226\134\146 2% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP3,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP3] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 3,
        ["value"] = 1.03,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "2 \226\134\146 3% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP4,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP4] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 4,
        ["value"] = 1.04,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "3 \226\134\146 4% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP5,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP5] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 5,
        ["value"] = 1.05,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "4 \226\134\146 5% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP6,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP6] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 6,
        ["value"] = 1.06,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "5 \226\134\146 6% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP7,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP7] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 7,
        ["value"] = 1.07,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "6 \226\134\146 7% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP8,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP8] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 8,
        ["value"] = 1.08,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "7 \226\134\146 8% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP9,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP9] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 9,
        ["value"] = 1.09,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "8 \226\134\146 9% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP10,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP10] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 10,
        ["value"] = 1.1,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "9 \226\134\146 10% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP11,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP11] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 11,
        ["value"] = 1.11,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "10 \226\134\146 11% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP12,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP12] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 12,
        ["value"] = 1.12,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "11 \226\134\146 12% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP13,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP13] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 13,
        ["value"] = 1.13,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "12 \226\134\146 13% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP14,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP14] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 14,
        ["value"] = 1.14,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "13 \226\134\146 14% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP15,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP15] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 15,
        ["value"] = 1.15,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "14 \226\134\146 15% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP16,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP16] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 16,
        ["value"] = 1.16,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "15 \226\134\146 16% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP17,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP17] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 17,
        ["value"] = 1.17,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "16 \226\134\146 17% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP18,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP18] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 18,
        ["value"] = 1.18,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "17 \226\134\146 18% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP19,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP19] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 19,
        ["value"] = 1.19,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "18 \226\134\146 19% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP20,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP20] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 20,
        ["value"] = 1.2,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "19 \226\134\146 20% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP21,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP21] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 21,
        ["value"] = 1.21,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "20 \226\134\146 21% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP22,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP22] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 22,
        ["value"] = 1.22,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "21 \226\134\146 22% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP23,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP23] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 23,
        ["value"] = 1.23,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "22 \226\134\146 23% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP24,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP24] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 24,
        ["value"] = 1.24,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "23 \226\134\146 24% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP25,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP25] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 25,
        ["value"] = 1.25,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "24 \226\134\146 25% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP26,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP26] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 26,
        ["value"] = 1.26,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "25 \226\134\146 26% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP27,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP27] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 27,
        ["value"] = 1.27,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "26 \226\134\146 27% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP28,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP28] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 28,
        ["value"] = 1.28,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "27 \226\134\146 28% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP29,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP29] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 29,
        ["value"] = 1.29,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "28 \226\134\146 29% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP30,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP30] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 30,
        ["value"] = 1.3,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "29 \226\134\146 30% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP31,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP31] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 31,
        ["value"] = 1.31,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "30 \226\134\146 31% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP32,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP32] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 32,
        ["value"] = 1.32,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "31 \226\134\146 32% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP33,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP33] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 33,
        ["value"] = 1.33,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "32 \226\134\146 33% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP34,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP34] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 34,
        ["value"] = 1.34,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "33 \226\134\146 34% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP35,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP35] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 35,
        ["value"] = 1.35,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "34 \226\134\146 35% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP36,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP36] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 36,
        ["value"] = 1.36,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "35 \226\134\146 36% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP37,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP37] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 37,
        ["value"] = 1.37,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "36 \226\134\146 37% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP38,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP38] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 38,
        ["value"] = 1.38,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "37 \226\134\146 38% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP39,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP39] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 39,
        ["value"] = 1.39,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "38 \226\134\146 39% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP40,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP40] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 40,
        ["value"] = 1.4,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "39 \226\134\146 40% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP41,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP41] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 41,
        ["value"] = 1.41,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "40 \226\134\146 41% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP42,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP42] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 42,
        ["value"] = 1.42,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "41 \226\134\146 42% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP43,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP43] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 43,
        ["value"] = 1.43,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "42 \226\134\146 43% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP44,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP44] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 44,
        ["value"] = 1.44,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "43 \226\134\146 44% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP45,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP45] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 45,
        ["value"] = 1.45,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "44 \226\134\146 45% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP46,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP46] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 46,
        ["value"] = 1.46,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "45 \226\134\146 46% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP47,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP47] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 47,
        ["value"] = 1.47,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "46 \226\134\146 47% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP48,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP48] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 48,
        ["value"] = 1.48,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "47 \226\134\146 48% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP49,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP49] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 49,
        ["value"] = 1.49,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "48 \226\134\146 49% xp" },
        ["nextUpgrade"] = v2.BATTLE_PASS_XP50,
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.BATTLE_PASS_XP50] = {
        ["description"] = "Upgrade the amount of Battle Pass XP your clan members gain by +1%",
        ["level"] = 50,
        ["value"] = 1.5,
        ["cost"] = 250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "49 \226\134\146 50% xp" },
        ["type"] = v3.BATTLE_PASS_XP
    },
    [v2.CLAN_LEVEL1] = {
        ["description"] = "Upgrade to Clan Level 1",
        ["level"] = 1,
        ["value"] = 1,
        ["cost"] = 200000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "0 \226\134\146 1 level" },
        ["nextUpgrade"] = v2.CLAN_LEVEL2,
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.CLAN_LEVEL2] = {
        ["description"] = "Upgrade to Clan Level 2",
        ["level"] = 2,
        ["value"] = 2,
        ["cost"] = 400000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "1 \226\134\146 2 level" },
        ["nextUpgrade"] = v2.CLAN_LEVEL3,
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.CLAN_LEVEL3] = {
        ["description"] = "Upgrade to Clan Level 3",
        ["level"] = 3,
        ["value"] = 3,
        ["cost"] = 700000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "2 \226\134\146 3 level" },
        ["nextUpgrade"] = v2.CLAN_LEVEL4,
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.CLAN_LEVEL4] = {
        ["description"] = "Upgrade to Clan Level 4",
        ["level"] = 4,
        ["value"] = 4,
        ["cost"] = 1500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "3 \226\134\146 4 level" },
        ["nextUpgrade"] = v2.CLAN_LEVEL5,
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.CLAN_LEVEL5] = {
        ["description"] = "Upgrade to Clan Level 5",
        ["level"] = 5,
        ["value"] = 5,
        ["cost"] = 2000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "4 \226\134\146 5 level" },
        ["nextUpgrade"] = v2.CLAN_LEVEL6,
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.CLAN_LEVEL6] = {
        ["description"] = "Upgrade to Clan Level 6",
        ["level"] = 6,
        ["value"] = 6,
        ["cost"] = 3000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "5 \226\134\146 6 level" },
        ["nextUpgrade"] = v2.CLAN_LEVEL7,
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.CLAN_LEVEL7] = {
        ["description"] = "Upgrade to Clan Level 7",
        ["level"] = 7,
        ["value"] = 7,
        ["cost"] = 3500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "6 \226\134\146 7 level" },
        ["nextUpgrade"] = v2.CLAN_LEVEL8,
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.CLAN_LEVEL8] = {
        ["description"] = "Upgrade to Clan Level 8",
        ["level"] = 8,
        ["value"] = 8,
        ["cost"] = 4000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "7 \226\134\146 8 level" },
        ["nextUpgrade"] = v2.CLAN_LEVEL9,
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.CLAN_LEVEL9] = {
        ["description"] = "Upgrade to Clan Level 9",
        ["level"] = 9,
        ["value"] = 9,
        ["cost"] = 4500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "8 \226\134\146 9 level" },
        ["nextUpgrade"] = v2.CLAN_LEVEL10,
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.CLAN_LEVEL10] = {
        ["description"] = "Upgrade to Clan Level 10",
        ["level"] = 10,
        ["value"] = 10,
        ["cost"] = 5000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "9 \226\134\146 10 level" },
        ["type"] = v3.CLAN_LEVEL
    },
    [v2.MEMBER_CAP1] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 1,
        ["value"] = 15,
        ["cost"] = 50000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "10 \226\134\146 15 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP2
    },
    [v2.MEMBER_CAP2] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 2,
        ["value"] = 20,
        ["cost"] = 100000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "15 \226\134\146 20 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP3
    },
    [v2.MEMBER_CAP3] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 3,
        ["value"] = 25,
        ["cost"] = 150000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "20 \226\134\146 25 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP4
    },
    [v2.MEMBER_CAP4] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 4,
        ["value"] = 30,
        ["cost"] = 200000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "25 \226\134\146 30 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP5
    },
    [v2.MEMBER_CAP5] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 5,
        ["value"] = 35,
        ["cost"] = 300000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "30 \226\134\146 35 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP6
    },
    [v2.MEMBER_CAP6] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 6,
        ["value"] = 40,
        ["cost"] = 400000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "35 \226\134\146 40 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP7
    },
    [v2.MEMBER_CAP7] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 7,
        ["value"] = 45,
        ["cost"] = 500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "40 \226\134\146 45 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP8
    },
    [v2.MEMBER_CAP8] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 8,
        ["value"] = 50,
        ["cost"] = 750000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "45 \226\134\146 50 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP9
    },
    [v2.MEMBER_CAP9] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 9,
        ["value"] = 55,
        ["cost"] = 1000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "50 \226\134\146 55 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP10
    },
    [v2.MEMBER_CAP10] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 10,
        ["value"] = 60,
        ["cost"] = 1250000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "55 \226\134\146 60 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP11
    },
    [v2.MEMBER_CAP11] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 11,
        ["value"] = 65,
        ["cost"] = 1500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "60 \226\134\146 65 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP12
    },
    [v2.MEMBER_CAP12] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 12,
        ["value"] = 70,
        ["cost"] = 2000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "65 \226\134\146 70 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP13
    },
    [v2.MEMBER_CAP13] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 13,
        ["value"] = 75,
        ["cost"] = 2500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "70 \226\134\146 75 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP14
    },
    [v2.MEMBER_CAP14] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 14,
        ["value"] = 80,
        ["cost"] = 3000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "75 \226\134\146 80 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP15
    },
    [v2.MEMBER_CAP15] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 15,
        ["value"] = 85,
        ["cost"] = 3500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "80 \226\134\146 85 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP16
    },
    [v2.MEMBER_CAP16] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 16,
        ["value"] = 90,
        ["cost"] = 4000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "85 \226\134\146 90 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP17
    },
    [v2.MEMBER_CAP17] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 17,
        ["value"] = 95,
        ["cost"] = 5000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "90 \226\134\146 95 members" },
        ["type"] = v3.MEMBER_CAP,
        ["nextUpgrade"] = v2.MEMBER_CAP18
    },
    [v2.MEMBER_CAP18] = {
        ["description"] = "Upgrade your clan\'s max member slots by +5",
        ["level"] = 18,
        ["value"] = 100,
        ["cost"] = 7500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "95 \226\134\146 100 members" },
        ["type"] = v3.MEMBER_CAP
    },
    [v2.KIT_SHOP1] = {
        ["description"] = "Increase the number of possible kits that you can unlock in the kit shop by +1",
        ["level"] = 1,
        ["value"] = 2,
        ["cost"] = 2500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "1 \226\134\146 2 kits" },
        ["type"] = v3.KIT_SHOP,
        ["nextUpgrade"] = v2.KIT_SHOP2,
        ["prerequisites"] = { v2.CLAN_LEVEL5 }
    },
    [v2.KIT_SHOP2] = {
        ["description"] = "Increase the number of possible kits that you can unlock in the kit shop by +1",
        ["level"] = 2,
        ["value"] = 3,
        ["cost"] = 5000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "2 \226\134\146 3 kits" },
        ["type"] = v3.KIT_SHOP,
        ["prerequisites"] = { v2.CLAN_LEVEL7 }
    },
    [v2.SHOP1] = {
        ["description"] = "Open up a shop for your clan members to purchase items!",
        ["level"] = 1,
        ["value"] = 0,
        ["cost"] = 1000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "Unlocks the shop" },
        ["type"] = v3.SHOP,
        ["nextUpgrade"] = v2.SHOP2,
        ["prerequisites"] = { v2.CLAN_LEVEL1 }
    },
    [v2.SHOP2] = {
        ["description"] = "Open up a shop for your clan members to purchase items!",
        ["level"] = 2,
        ["value"] = 0,
        ["cost"] = 1500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "Unlock more items" },
        ["type"] = v3.SHOP,
        ["nextUpgrade"] = v2.SHOP3,
        ["prerequisites"] = { v2.CLAN_LEVEL3 }
    },
    [v2.SHOP3] = {
        ["description"] = "Open up a shop for your clan members to purchase items!",
        ["level"] = 3,
        ["value"] = 0,
        ["cost"] = 3000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "Unlock more items" },
        ["type"] = v3.SHOP,
        ["nextUpgrade"] = v2.SHOP4,
        ["prerequisites"] = { v2.CLAN_LEVEL5 }
    },
    [v2.SHOP4] = {
        ["description"] = "Open up a shop for your clan members to purchase items!",
        ["level"] = 4,
        ["value"] = 0,
        ["cost"] = 5000000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "Unlock more items" },
        ["type"] = v3.SHOP,
        ["prerequisites"] = { v2.CLAN_LEVEL8 }
    },
    [v2.CLAN_ICON] = {
        ["description"] = "Clan Swag",
        ["level"] = 1,
        ["value"] = 5,
        ["cost"] = 500000,
        ["currency"] = "ClanCoin",
        ["rewards"] = { "Unlocks the clan emblem" },
        ["type"] = v3.CLAN_ICON,
        ["prerequisites"] = { v2.CLAN_LEVEL3 }
    },
    [v2.CRATE_ALTAR_1] = {
        ["description"] = "Upgrade your luck at the crate altar inside your clan HQ",
        ["level"] = 1,
        ["value"] = 0,
        ["cost"] = 25000,
        ["currency"] = "ClanWarCoin",
        ["rewards"] = { "Unlocks a crate altar with increased luck" },
        ["type"] = v3.CRATE_ALTAR,
        ["nextUpgrade"] = v2.CRATE_ALTAR_2,
        ["prerequisites"] = { v2.CLAN_LEVEL3 }
    },
    [v2.CRATE_ALTAR_2] = {
        ["description"] = "Upgrade your luck at the crate altar inside your clan HQ",
        ["level"] = 2,
        ["value"] = 0,
        ["cost"] = 50000,
        ["currency"] = "ClanWarCoin",
        ["rewards"] = { "Unlocks a crate altar with even more luck" },
        ["type"] = v3.CRATE_ALTAR,
        ["nextUpgrade"] = v2.CRATE_ALTAR_3,
        ["prerequisites"] = { v2.CLAN_LEVEL5 }
    },
    [v2.CRATE_ALTAR_3] = {
        ["description"] = "Upgrade your luck at the crate altar inside your clan HQ",
        ["level"] = 3,
        ["value"] = 0,
        ["cost"] = 100000,
        ["currency"] = "ClanWarCoin",
        ["rewards"] = { "Unlocks a crate altar with even more luck" },
        ["type"] = v3.CRATE_ALTAR,
        ["prerequisites"] = { v2.CLAN_LEVEL8 }
    }
}
return {
    ["ClanUpgradeTypeMeta"] = v4,
    ["ClanUpgradeMeta"] = v5
}