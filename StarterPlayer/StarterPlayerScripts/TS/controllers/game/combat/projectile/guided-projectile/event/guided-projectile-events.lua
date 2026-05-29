local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "GuidedProjectileDetonateEvent"
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
    p4.guidedProjectileType = p5
    p4.position = p6
end
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "GuidedProjectileRemovedEvent"
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
    p10.guidedProjectileType = p11
    p10.model = p12
end
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "GuidedProjectileDisablingEvent"
    end
})
u13.__index = u13
function u13.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, p17, p18) --[[ Line: 48 ]]
    p16.guidedProjectileType = p17
    p16.model = p18
end
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 56 ]]
        return "GuidedProjectileEnablingEvent"
    end
})
u19.__index = u19
function u19.new(...) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22, p23, p24) --[[ Line: 65 ]]
    p22.guidedProjectileType = p23
    p22.model = p24
end
return {
    ["GuidedProjectileDetonateEvent"] = u1,
    ["GuidedProjectileRemovedEvent"] = u7,
    ["GuidedProjectileDisablingEvent"] = u13,
    ["GuidedProjectileEnablingEvent"] = u19
}