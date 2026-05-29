local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SHIFT_LOCK_DEFAULT = 0
v1[0] = "SHIFT_LOCK_DEFAULT"
v2.SEND_SESSION_DATA = 1
v1[1] = "SEND_SESSION_DATA"
v2.REWARD_DATA = 2
v1[2] = "REWARD_DATA"
return {
    ["ABTestId"] = v2
}