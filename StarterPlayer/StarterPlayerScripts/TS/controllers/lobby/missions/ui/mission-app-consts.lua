local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DAILY = "daily"
v1.daily = "DAILY"
v2.WEEKLY = "weekly"
v1.weekly = "WEEKLY"
return {
    ["MissionAppTab"] = v2
}