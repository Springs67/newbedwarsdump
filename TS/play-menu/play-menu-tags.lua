local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.RECOMMENDED = "RECOMMENDED"
v1.RECOMMENDED = "RECOMMENDED"
v2.NEW = "NEW"
v1.NEW = "NEW"
v2.FUN = "FUN"
v1.FUN = "FUN"
v2.FAST = "FAST"
v1.FAST = "FAST"
return {
    ["PlayMenuCardTag"] = v2
}