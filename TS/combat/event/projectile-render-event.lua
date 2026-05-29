local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "ProjectileRenderEvent"
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
function u1.constructor(p4, p5, p6, p7, p8, p9) --[[ Line: 14 ]]
    p4.projectile = p5
    p4.projectileMeta = p6
    p4.cframe = p7
    p4.totalTime = p8
    p4.deltaTime = p9
end
return {
    ["ProjectileRenderEvent"] = u1
}