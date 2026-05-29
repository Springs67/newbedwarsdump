local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SPEED_BOOST = 0
v1[0] = "SPEED_BOOST"
v2.FORCE_FIELD = 1
v1[1] = "FORCE_FIELD"
return {
    ["HotPotatoGameItemType"] = v2
}