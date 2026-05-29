local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {
    ["WOOL_AMOUNT"] = 50,
    ["DEPTH_OF_BRIDGE_BLOCKS"] = 8,
    ["SCORE_AMOUNT_TO_WIN"] = 5,
    ["ROUND_COUNTDOWN"] = 5,
    ["RESPAWN_TIME_BASE"] = 1,
    ["RESPAWN_TIME_MAX"] = 5,
    ["RESPAWN_TIME_INCREASE_PER_DEATH"] = 0.5,
    ["STARTER_ITEMS"] = {
        [v1.LEATHER_HELMET] = 1,
        [v1.LEATHER_CHESTPLATE] = 1,
        [v1.LEATHER_BOOTS] = 1,
        [v1.WOOD_BOW] = 1,
        [v1.ARROW] = 8,
        [v1.SHEARS] = 1
    }
}
return {
    ["BridgeDuelConfig"] = v2
}