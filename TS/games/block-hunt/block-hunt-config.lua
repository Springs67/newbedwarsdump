local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {
    ["BH_ITEM_CURRENCY"] = v1.BLOCK_HUNT_COIN,
    ["RELEASE_MESSAGE_DELAY"] = 5,
    ["RELEASE_HUNTERS_DELAY"] = 45,
    ["MATCH_DURATION"] = 525,
    ["GIVE_HIDER_ALIVE_REWARD_INTERVAL"] = 30,
    ["HIDER_INVISIBLITY_DURATION"] = 10,
    ["HUNTER_STARTER_ITEMS"] = {
        [v1.IRON_SWORD] = 1,
        [v1.IRON_HELMET] = 1,
        [v1.IRON_CHESTPLATE] = 1,
        [v1.IRON_BOOTS] = 1
    },
    ["HIDER_STARTER_ITEMS"] = {
        [v1.WOOD_SWORD] = 1
    }
}
return {
    ["BlockHuntConfig"] = v2
}