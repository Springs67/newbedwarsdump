local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = {}
v3:IsStudio()
local v6 = 300
v5.EXPIRE_TIME_SECONDS = v6
v5.SATELLITE_DISABLED_DURATION = 30
v5.MAX_DISRUPTION_PERCENT = 0.4
v5.SATELLITE_UPGRADES = { v4.ZENITH_SATELLITE_UPGRADE_2, v4.ZENITH_SATELLITE_UPGRADE_3 }
local v7 = {}
local u8 = setmetatable({}, {
    ["__index"] = v7
})
u8.TIER_1 = 1
v7[1] = "TIER_1"
u8.TIER_2 = 2
v7[2] = "TIER_2"
u8.TIER_3 = 3
v7[3] = "TIER_3"
v5.SatelliteStrengthTier = u8
local u9 = {
    [u8.TIER_1] = {
        ["disruptionPercent"] = 0.15
    },
    [u8.TIER_2] = {
        ["disruptionPercent"] = 0.2,
        ["itemType"] = v4.ZENITH_SATELLITE_UPGRADE_2
    },
    [u8.TIER_3] = {
        ["disruptionPercent"] = 0.3,
        ["itemType"] = v4.ZENITH_SATELLITE_UPGRADE_3
    }
}
v5.SatelliteScaling = u9
function v5.getSatelliteTierFromItem(p10) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
        [3] = u8
    --]]
    local v11 = nil
    for v12, v13 in u2.keys(u9) do
        local _ = v12 - 1
        if u9[v13].itemType == p10 == true then
            v11 = v13
            break
        end
    end
    if v11 == nil then
        v11 = u8.TIER_1
    end
    return v11
end
return {
    ["DisruptorBalance"] = v5
}