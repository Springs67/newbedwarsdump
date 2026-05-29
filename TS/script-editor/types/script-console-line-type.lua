local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.LOG = 0
v1[0] = "LOG"
v2.ERROR = 1
v1[1] = "ERROR"
return {
    ["ScriptConsoleLinetype"] = v2
}