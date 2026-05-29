local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HERO = "Hero"
v1.Hero = "HERO"
v2.VILLAIN = "Villain"
v1.Villain = "VILLAIN"
return {
    ["HVFaction"] = v2
}