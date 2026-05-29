local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.ONE_STAR = 0
v1[0] = "ONE_STAR"
v2.TWO_STAR = 1
v1[1] = "TWO_STAR"
v2.THREE_STAR = 2
v1[2] = "THREE_STAR"
v2.FOUR_STAR = 3
v1[3] = "FOUR_STAR"
v2.FIVE_STAR = 4
v1[4] = "FIVE_STAR"
v2.SIX_STAR = 5
v1[5] = "SIX_STAR"
return {
    ["CrateItemRarity"] = v2
}