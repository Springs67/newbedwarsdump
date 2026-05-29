local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HOST = "host"
v1.host = "HOST"
v2.COHOST = "cohost"
v1.cohost = "COHOST"
v2.PLAYER = "player"
v1.player = "PLAYER"
return {
    ["CustomMatchRoleAttribute"] = "CustomMatchRole",
    ["CustomMatchRole"] = v2
}