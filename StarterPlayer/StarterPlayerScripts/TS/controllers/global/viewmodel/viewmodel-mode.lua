local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DEFAULT = 0
v1[0] = "DEFAULT"
v2.SHOW_ARMS = 1
v1[1] = "SHOW_ARMS"
return {
    ["ViewmodelMode"] = v2
}