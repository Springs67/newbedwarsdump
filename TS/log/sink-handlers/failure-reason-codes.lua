local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.MinLogLevelNotMet = 0
v1[0] = "MinLogLevelNotMet"
v2.MaxLogLevelNotMet = 1
v1[1] = "MaxLogLevelNotMet"
v2.InvalidEnvironment = 2
v1[2] = "InvalidEnvironment"
v2.SampleRate = 3
v1[3] = "SampleRate"
v2.LackPermissions = 4
v1[4] = "LackPermissions"
v2.Spam = 5
v1[5] = "Spam"
return {
    ["FailureReasonCodes"] = v2
}