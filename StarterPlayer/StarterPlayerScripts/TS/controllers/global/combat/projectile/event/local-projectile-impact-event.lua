local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "LocalProjectileImpactEvent"
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
    p4.projectile = p5
    p4.hitPosition = p6
    p4.hitEntity = p7
    p4.hitPart = p8
end
return {
    ["LocalProjectileImpactEvent"] = u1
}