local v1 = {}
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.SLOW = "slow"
v2.slow = "SLOW"
v3.MEDIUM = "medium"
v2.medium = "MEDIUM"
v3.FAST = "fast"
v2.fast = "FAST"
v1.SkatingSpeed = v3
return {
    ["SkatingAttributeValues"] = v1
}