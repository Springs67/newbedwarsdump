local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.BLOCKING_AUGMENT = "blocking_augment"
v1.blocking_augment = "BLOCKING_AUGMENT"
v2.ABSORBING_AUGMENT = "absorbing_augment"
v1.absorbing_augment = "ABSORBING_AUGMENT"
return {
    ["AugmentName"] = v2
}