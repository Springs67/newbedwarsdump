local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.EASY = 0
v1[0] = "EASY"
v2.MEDIUM = 1
v1[1] = "MEDIUM"
v2.HARD = 2
v1[2] = "HARD"
v2.EASY_MYSTERY = 3
v1[3] = "EASY_MYSTERY"
v2.HARD_MYSTERY = 4
v1[4] = "HARD_MYSTERY"
return {
    ["EasterEggRarity"] = v2
}