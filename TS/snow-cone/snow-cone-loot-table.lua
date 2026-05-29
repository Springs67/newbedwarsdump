local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WeightedSelect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["MakeSnowConePrice"] = 1,
    ["TimeToMakeSnowCone"] = 2,
    ["MakeSnowConeCurrency"] = v3.EMERALD,
    ["snowConeDropSelect"] = v2.new({
        {
            ["weight"] = 100,
            ["amount"] = 1,
            ["itemType"] = v3.SNOW_CONE
        },
        {
            ["weight"] = 1,
            ["amount"] = 1,
            ["itemType"] = v3.LUCKY_SNOW_CONE
        }
    })
}