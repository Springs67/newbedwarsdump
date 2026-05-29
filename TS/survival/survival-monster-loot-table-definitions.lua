local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WeightedSelect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.TIER1 = 0
v4[0] = "TIER1"
v5.TIER2 = 1
v4[1] = "TIER2"
v5.TIER3 = 2
v4[2] = "TIER3"
v5.TIER4 = 3
v4[3] = "TIER4"
v5.TIER5 = 4
v4[4] = "TIER5"
local v6 = {}
local v7 = v5.TIER1
local v8 = {
    ["lootTable"] = v2.new({
        {
            ["weight"] = 70,
            ["amount"] = 1,
            ["itemType"] = v3.IRON
        },
        {
            ["weight"] = 30,
            ["amount"] = 2,
            ["itemType"] = v3.IRON
        }
    })
}
v6[v7] = v8
local v9 = v5.TIER2
local v10 = {
    ["lootTable"] = v2.new({
        {
            ["weight"] = 40,
            ["amount"] = 1,
            ["itemType"] = v3.IRON
        },
        {
            ["weight"] = 60,
            ["amount"] = 2,
            ["itemType"] = v3.IRON
        }
    })
}
v6[v9] = v10
local v11 = v5.TIER3
local v12 = {
    ["lootTable"] = v2.new({
        {
            ["weight"] = 55,
            ["amount"] = 2,
            ["itemType"] = v3.IRON
        },
        {
            ["weight"] = 35,
            ["amount"] = 3,
            ["itemType"] = v3.IRON
        },
        {
            ["weight"] = 10,
            ["amount"] = 1,
            ["itemType"] = v3.EMERALD
        }
    })
}
v6[v11] = v12
local v13 = v5.TIER4
local v14 = {
    ["lootTable"] = v2.new({
        {
            ["weight"] = 50,
            ["amount"] = 5,
            ["itemType"] = v3.IRON
        },
        {
            ["weight"] = 35,
            ["amount"] = 1,
            ["itemType"] = v3.EMERALD
        },
        {
            ["weight"] = 15,
            ["amount"] = 2,
            ["itemType"] = v3.EMERALD
        }
    })
}
v6[v13] = v14
local v15 = v5.TIER5
local v16 = {
    ["lootTable"] = v2.new({
        {
            ["weight"] = 100,
            ["amount"] = 10,
            ["itemType"] = v3.EMERALD
        }
    })
}
v6[v15] = v16
return {
    ["SurvivalMonsterLootCategory"] = v5,
    ["SurvivalMonsterCategoryLootData"] = v6
}