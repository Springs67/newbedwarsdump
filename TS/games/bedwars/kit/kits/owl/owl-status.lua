local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DEFAULT = 0
v1[0] = "DEFAULT"
v2.SHOOTING = 1
v1[1] = "SHOOTING"
v2.LIFTING = 2
v1[2] = "LIFTING"
return {
    ["OwlStatus"] = v2
}