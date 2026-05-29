local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.NORMAL = 0
v1[0] = "NORMAL"
v2.SPARKS = 1
v1[1] = "SPARKS"
v2.HEART = 2
v1[2] = "HEART"
v2.DV = 3
v1[3] = "DV"
v2.NEW_YEARS = 4
v1[4] = "NEW_YEARS"
v2.GOOSE = 5
v1[5] = "GOOSE"
v2.FIREWORK_CRATE = 6
v1[6] = "FIREWORK_CRATE"
v2.CONFETTI = 7
v1[7] = "CONFETTI"
v2.METEOR = 8
v1[8] = "METEOR"
v2.RAINBOW_METEOR = 9
v1[9] = "RAINBOW_METEOR"
return {
    ["FireworkType"] = v2
}