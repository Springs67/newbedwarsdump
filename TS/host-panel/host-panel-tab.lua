local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.GENERAL = 1
v1[1] = "GENERAL"
v2.PLAYERS = 2
v1[2] = "PLAYERS"
v2.ITEMS = 3
v1[3] = "ITEMS"
v2.KITS = 4
v1[4] = "KITS"
v2.GENERATORS = 5
v1[5] = "GENERATORS"
v2.MAP = 6
v1[6] = "MAP"
v2.SCRIPTS = 7
v1[7] = "SCRIPTS"
v2.AUDIT_LOG = 8
v1[8] = "AUDIT_LOG"
return {
    ["HostPanelTab"] = v2
}