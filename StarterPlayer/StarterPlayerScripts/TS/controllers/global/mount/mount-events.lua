local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "GenericMountMounted"
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
function u1.constructor(p4, p5, p6, p7, p8) --[[ Line: 14 ]]
    p4.player = p5
    p4.mountType = p6
    p4.model = p7
    p4.character = p8
end
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "GenericMountDismounted"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, p13, p14) --[[ Line: 33 ]]
    p12.player = p13
    p12.mountType = p14
end
return {
    ["GenericMountMounted"] = u1,
    ["GenericMountDismounted"] = u9
}