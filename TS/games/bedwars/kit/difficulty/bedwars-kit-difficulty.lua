local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.NONE = 0
v1[0] = "NONE"
v2.EASY = 1
v1[1] = "EASY"
v2.MEDIUM = 2
v1[2] = "MEDIUM"
v2.HARD = 3
v1[3] = "HARD"
return {
    ["BedwarsKitDifficulty"] = v2
}