local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.BEDWARS = "bedwars"
v1.bedwars = "BEDWARS"
v2.PVP = "pvp"
v1.pvp = "PVP"
v2.ROLEPLAY = "roleplay"
v1.roleplay = "ROLEPLAY"
v2.BUILDING = "building"
v1.building = "BUILDING"
v2.OBBY = "obby"
v1.obby = "OBBY"
v2.MINIGAME = "minigame"
v1.minigame = "MINIGAME"
return {
    ["MapBrowserTags"] = v2
}