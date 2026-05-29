local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.KETCHUP = "ketchup"
v1.ketchup = "KETCHUP"
v2.MUSTARD = "mustard"
v1.mustard = "MUSTARD"
return {
    ["CondimentGunModes"] = v2
}