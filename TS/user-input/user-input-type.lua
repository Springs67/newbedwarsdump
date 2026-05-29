local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.MOBILE = "MOBILE"
v1.MOBILE = "MOBILE"
v2.PC = "PC"
v1.PC = "PC"
v2.GAMEPAD = "GAMEPAD"
v1.GAMEPAD = "GAMEPAD"
return {
    ["UserInputType"] = v2
}