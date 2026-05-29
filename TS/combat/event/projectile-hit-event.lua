local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").CancellableEvent
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "ProjectileHitEvent"
    end,
    ["__index"] = u2
})
u4.__index = u4
function u4.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    u2.constructor(p7)
    p7.shooter = p8
    p7.projectileType = p9
    p7.projectileModel = p10
    p7.projectileRefId = p11
    p7.source = p12
    p7.hitData = p13
    p7.hitEntity = p14
    p7.chargePercent = p15
    p7.projectileDamageMult = p16
    p7.launchData = p17
    p7.projectileKnockbackMult = p18
    p7.metadata = p19
    p7.damageExtra = p20
    p7.projectileIsReturning = p21
    p7.customAbilityId = p22
    p7.projectileMeta = u3[p9]
end
return {
    ["ProjectileHitEvent"] = u4
}