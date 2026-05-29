local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.OVERRIDE = 0
v1[0] = "OVERRIDE"
v2.OVERLAY = 1
v1[1] = "OVERLAY"
return {
    ["PetAnimationPriority"] = v2
}