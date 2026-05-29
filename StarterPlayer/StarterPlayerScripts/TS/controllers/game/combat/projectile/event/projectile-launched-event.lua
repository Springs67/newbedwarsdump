local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").CancellableEvent
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "ProjectileLaunchedEvent"
    end,
    ["__index"] = u2
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, p10, p11, p12, p13, p14, p15) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    u2.constructor(p9)
    p9.projectileType = p10
    p9.projectile = p11
    p9.launchVelocity = p12
    p9.origin = p13
    p9.shooter = p14
    p9.launchData = p15
    p9.statusEffects = {}
    if p14 and p14 ~= "__UNDEFINED_EVENT_PARAMETER" then
        p9.statusEffects = u5:getAllActive(p14)
    end
end
function u6.isLocalShooter(p16) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v17
    if p16.shooter == nil then
        v17 = false
    else
        v17 = p16.shooter == u3.LocalPlayer.Character
    end
    return v17
end
function u6.getShooterHandItem(p18) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    if p18.shooter then
        local v19 = u3:GetPlayerFromCharacter(p18.shooter)
        if v19 then
            return u4.getInventory(v19).hand
        else
            return nil
        end
    else
        return nil
    end
end
function u6.hasStatusEffect(p20, p21) --[[ Line: 50 ]]
    local v22 = nil
    for v23, v24 in p20.statusEffects do
        local _ = v23 - 1
        if v24.statusEffect == p21 == true then
            v22 = v24
            break
        end
    end
    return v22 ~= nil
end
function u6.getActiveStatusEffects(p25) --[[ Line: 66 ]]
    return p25.statusEffects
end
return {
    ["ProjectileLaunchedEvent"] = u6
}