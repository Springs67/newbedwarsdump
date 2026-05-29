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
local v7 = {}
local v8 = setmetatable({}, {
    ["__index"] = v7
})
v8.Statue1 = "1"
v7["1"] = "Statue1"
v8.Statue2 = "2"
v7["2"] = "Statue2"
v8.Statue3 = "3"
v7["3"] = "Statue3"
v8.Statue4 = "4"
v7["4"] = "Statue4"
v8.Statue5 = "5"
v7["5"] = "Statue5"
v8.Statue6 = "6"
v7["6"] = "Statue6"
v8.Statue7 = "7"
v7["7"] = "Statue7"
v8.Statue8 = "8"
v7["8"] = "Statue8"
v8.Statue9 = "9"
v7["9"] = "Statue9"
v8.Statue10 = "10"
v7["10"] = "Statue10"
v8.Statue11 = "11"
v7["11"] = "Statue11"
v8.Statue12 = "12"
v7["12"] = "Statue12"
v8.Statue13 = "13"
v7["13"] = "Statue13"
v8.Statue14 = "14"
v7["14"] = "Statue14"
v8.Statue15 = "15"
v7["15"] = "Statue15"
v8.Statue16 = "16"
v7["16"] = "Statue16"
v8.Statue17 = "17"
v7["17"] = "Statue17"
v8.Statue18 = "18"
v7["18"] = "Statue18"
v8.Statue19 = "19"
v7["19"] = "Statue19"
v8.Statue20 = "20"
v7["20"] = "Statue20"
v1.SnakeStatue = v8
return {
    ["Lny2025Constants"] = v1
}