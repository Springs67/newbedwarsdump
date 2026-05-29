local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.ZERO = 0
v1[0] = "ZERO"
v2.ONE = 1
v1[1] = "ONE"
v2.TWO = 2
v1[2] = "TWO"
v2.THREE = 3
v1[3] = "THREE"
v2.FOUR = 4
v1[4] = "FOUR"
v2.FIVE = 5
v1[5] = "FIVE"
v2.SIX = 6
v1[6] = "SIX"
v2.SEVEN = 7
v1[7] = "SEVEN"
v2.EIGHT = 8
v1[8] = "EIGHT"
v2.NINE = 9
v1[9] = "NINE"
v2.TEN = 10
v1[10] = "TEN"
return {
    ["MatchLevel"] = v2
}