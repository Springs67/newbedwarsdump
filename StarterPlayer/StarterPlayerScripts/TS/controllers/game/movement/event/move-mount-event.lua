local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.UP = 0
v1[0] = "UP"
v2.DOWN = 1
v1[1] = "DOWN"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.PRESS = 0
v3[0] = "PRESS"
v4.RELEASE = 1
v3[1] = "RELEASE"
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "MoveMountEvent"
    end
})
u5.__index = u5
function u5.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8, p9, p10) --[[ Line: 36 ]]
    p8.direction = p9
    p8.inputActionType = p10
end
return {
    ["MoveMountDirection"] = v2,
    ["InputActionType"] = v4,
    ["MoveMountEvent"] = u5
}