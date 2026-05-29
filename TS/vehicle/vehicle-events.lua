local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "MountVehicleEvent"
    end
})
u1.__index = u1
function u1.new(...) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    return v3:constructor(...) or v3
end
function u1.constructor(p4, p5, p6) --[[ Line: 14 ]]
    p4.vehicle = p5
    p4.player = p6
end
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "DismountVehicleEvent"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, p11, p12) --[[ Line: 31 ]]
    p10.vehicle = p11
    p10.player = p12
end
return {
    ["MountVehicleEvent"] = u1,
    ["DismountVehicleEvent"] = u7
}