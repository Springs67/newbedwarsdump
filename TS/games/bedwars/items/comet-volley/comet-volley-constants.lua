local v1 = {
    ["COMET_VOLLEY_ASCEND_DURATION"] = 3,
    ["COMET_VOLLEY_DESCEND_DURATION"] = 2,
    ["COMET_VOLLEY_TARGETING_DURATION"] = 3,
    ["COMET_VOLLEY_FIRING_DURATION"] = 0.25,
    ["COMET_VOLLEY_TRAVEL_DURATION"] = 0.5,
    ["COMET_VOLLEY_TARGET_RADIUS"] = 16,
    ["COMET_VOLLEY_TIER_0_DAMAGE"] = 60,
    ["COMET_VOLLEY_TIER_1_DAMAGE"] = 70,
    ["COMET_VOLLEY_TIER_2_DAMAGE"] = 90,
    ["COMET_VOLLEY_TIER_3_DAMAGE"] = 120,
    ["COMET_VOLLEY_TIER_0_COMET_COUNT"] = 3,
    ["COMET_VOLLEY_TIER_1_COMET_COUNT"] = 5,
    ["COMET_VOLLEY_TIER_2_COMET_COUNT"] = 7,
    ["COMET_VOLLEY_TIER_3_COMET_COUNT"] = 9,
    ["COMET_VOLLEY_TIER_0_RESOURCE_YIELD"] = 3,
    ["COMET_VOLLEY_TIER_1_RESOURCE_YIELD"] = 5,
    ["COMET_VOLLEY_TIER_2_RESOURCE_YIELD"] = 7,
    ["COMET_VOLLEY_TIER_3_RESOURCE_YIELD"] = 10
}
require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService:IsStudio()
local v2 = 1
v1.COMET_VOLLEY_DAMAGED_COOLDOWN = v2
return {
    ["CometVolleyConstants"] = v1
}