local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SCRIPT_TOO_LONG = 0
v1[0] = "SCRIPT_TOO_LONG"
v2.INVALID_LUA_SYNTAX = 1
v1[1] = "INVALID_LUA_SYNTAX"
return {
    ["ScriptSyntaxError"] = v2
}