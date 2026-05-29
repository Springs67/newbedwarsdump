local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.ONE = 0
v1[0] = "ONE"
v2.TWO = 1
v1[1] = "TWO"
return {
    ["CrateTiers"] = v2,
    ["CrateStarTierColors"] = {
        [v2.TWO] = Color3.fromRGB(255, 199, 138)
    }
}