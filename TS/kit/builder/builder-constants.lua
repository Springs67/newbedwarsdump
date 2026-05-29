local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.RETRACTED = 0
v1[0] = "RETRACTED"
v2.EXTENDED = 1
v1[1] = "EXTENDED"
return {
    ["BridgeState"] = v2
}