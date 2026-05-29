local v1 = {}
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.Tier1 = "tier1"
v2.tier1 = "Tier1"
v3.Tier2 = "tier2"
v2.tier2 = "Tier2"
v3.Tier3 = "tier3"
v2.tier3 = "Tier3"
v1.EnvelopeType = v3
local v4 = {
    [v3.Tier1] = {
        ["name"] = "Red Envelope",
        ["icon"] = "rbxassetid://107555109436355",
        ["themeColor"] = Color3.fromRGB(255, 59, 59)
    },
    [v3.Tier2] = {
        ["name"] = "Red & Gold Envelope",
        ["icon"] = "rbxassetid://112452931528519",
        ["themeColor"] = Color3.fromRGB(255, 148, 51)
    },
    [v3.Tier3] = {
        ["name"] = "Golden Envelope",
        ["icon"] = "rbxassetid://116705481106448",
        ["themeColor"] = Color3.fromRGB(255, 214, 23)
    }
}
v1.EnvelopeMeta = v4
v1.DailyEnvelopeCollectionLimits = {
    [v3.Tier1] = 10,
    [v3.Tier2] = 3,
    [v3.Tier3] = 1
}
v1.MatchEnvelopeSpawnLimits = {
    [v3.Tier1] = 3,
    [v3.Tier2] = 1,
    [v3.Tier3] = 1
}
v1.EnvelopeLoopDelay = {
    [v3.Tier1] = 120,
    [v3.Tier2] = 120,
    [v3.Tier3] = 120
}
v1.EnvelopeSpawnChance = {
    [v3.Tier1] = 1,
    [v3.Tier2] = 0.3,
    [v3.Tier3] = 0.05
}
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.Center = 0
v5[0] = "Center"
v6.DiamondGen = 1
v5[1] = "DiamondGen"
v6.Bed = 2
v5[2] = "Bed"
v1.EnvelopeSpawnLocations = v6
return {
    ["Lny2025Constants"] = v1
}