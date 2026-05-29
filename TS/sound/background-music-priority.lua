local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.MENU = 20
v1[20] = "MENU"
v2.EVENT = 15
v1[15] = "EVENT"
v2.CUSTOM = 11
v1[11] = "CUSTOM"
v2.DEFAULT = 10
v1[10] = "DEFAULT"
return {
    ["BackgroundMusicPriority"] = v2
}