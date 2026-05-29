local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.BACKGROUND_MUSIC = 0
v1[0] = "BACKGROUND_MUSIC"
v2.SKYBOX = 1
v1[1] = "SKYBOX"
return {
    ["ClanHqSelectorType"] = v2
}