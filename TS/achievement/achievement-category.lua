local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.CHALLENGE = "challenge"
v1.challenge = "CHALLENGE"
v2.MATCH_LIFETIME = "match_lifetime"
v1.match_lifetime = "MATCH_LIFETIME"
v2.EVENT = "event"
v1.event = "EVENT"
v2.SYSTEM_LIFETIME = "system_lifetime"
v1.system_lifetime = "SYSTEM_LIFETIME"
local v3 = {
    [v2.CHALLENGE] = {
        ["text"] = "Challenge",
        ["color"] = Color3.fromRGB(0, 204, 255)
    },
    [v2.MATCH_LIFETIME] = {
        ["text"] = "Match Lifetime",
        ["color"] = Color3.fromRGB(128, 255, 69)
    },
    [v2.EVENT] = {
        ["text"] = "Event",
        ["color"] = Color3.fromRGB(255, 102, 64)
    },
    [v2.SYSTEM_LIFETIME] = {
        ["text"] = "System Lifetime",
        ["color"] = Color3.fromRGB(255, 117, 224)
    }
}
return {
    ["AchievementCategory"] = v2,
    ["AchievementCategoryMeta"] = v3
}