local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-tier-types").CrateTiers
local u5 = {}
local v6 = v3.ONE_STAR
local v7 = {
    ["id"] = "common",
    ["stars"] = 1,
    ["gradient"] = {
        ["colorBottom"] = v2.hexColor(11711154),
        ["colorTop"] = v2.hexColor(16777215)
    },
    ["tier"] = v4.ONE
}
u5[v6] = v7
local v8 = v3.TWO_STAR
local v9 = {
    ["id"] = "uncommon",
    ["stars"] = 2,
    ["gradient"] = {
        ["colorBottom"] = v2.hexColor(3319890),
        ["colorTop"] = v2.hexColor(5626232)
    },
    ["tier"] = v4.ONE
}
u5[v8] = v9
local v10 = v3.THREE_STAR
local v11 = {
    ["id"] = "rare",
    ["stars"] = 3,
    ["gradient"] = {
        ["colorBottom"] = v2.hexColor(4224511),
        ["colorTop"] = v2.hexColor(6211071)
    },
    ["tier"] = v4.ONE
}
u5[v10] = v11
local v12 = v3.FOUR_STAR
local v13 = {
    ["id"] = "epic",
    ["stars"] = 4,
    ["gradient"] = {
        ["colorBottom"] = v2.hexColor(10639871),
        ["colorTop"] = v2.hexColor(13983487)
    },
    ["tier"] = v4.ONE
}
u5[v12] = v13
local v14 = v3.FIVE_STAR
local v15 = {
    ["id"] = "legendary",
    ["stars"] = 5,
    ["gradient"] = {
        ["colorBottom"] = v2.hexColor(16711680),
        ["colorTop"] = v2.hexColor(16728642)
    },
    ["tier"] = v4.ONE
}
u5[v14] = v15
local v16 = v3.SIX_STAR
local v17 = {
    ["id"] = "mythic",
    ["stars"] = 1,
    ["gradient"] = {
        ["colorBottom"] = v2.hexColor(16753720),
        ["colorTop"] = v2.hexColor(16770560)
    },
    ["tier"] = v4.TWO
}
u5[v16] = v17
return {
    ["getCrateItemRarityMeta"] = function(p18) --[[ Name: getCrateItemRarityMeta, Line 62 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        return u5[p18]
    end
}