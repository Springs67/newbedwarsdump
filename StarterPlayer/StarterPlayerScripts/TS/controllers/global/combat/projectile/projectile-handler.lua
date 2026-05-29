local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "ProjectileHandler"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17) --[[ Line: 16 ]]
    local v18 = p11 == nil and Vector3.new(0, 2, 0) or p11
    local v19 = p12 == nil and 0 or p12
    p5.gravityMultiplier = p6
    p5.velocityMultiplier = p7
    p5.projectile = p8
    p5.inputInfo = p9
    p5.targetPoint = p10
    p5.fromPositionOffset = v18
    p5.drawDurationSeconds = v19
    p5.lockedAimPoint = p13
    p5.targetingId = p14
    p5.startAtCenterOfCamera = p15
    p5.projectileSourceController = p16
    p5.player = p17
end
function u2.getProjectileMeta(p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1[p20.projectile]
end
return {
    ["ProjectileHandler"] = u2
}