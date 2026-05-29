local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.CIVILIAN = "civilian"
v1.civilian = "CIVILIAN"
v2.SHERIFF = "sheriff"
v1.sheriff = "SHERIFF"
v2.MURDERER = "murderer"
v1.murderer = "MURDERER"
return {
    ["MurderGameRole"] = v2
}