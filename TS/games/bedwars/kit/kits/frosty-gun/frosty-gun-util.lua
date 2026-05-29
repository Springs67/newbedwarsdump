local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.MIST = 0
v4[0] = "MIST"
v5.PROJECTILE = 1
v4[1] = "PROJECTILE"
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "FrostyStaffUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 28 ]] end
function u6.getWeaponMistDamage(_, p9) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return p9 == u3.FROST_STAFF_1 and 4 or (p9 == u3.FROST_STAFF_2 and 7 or (p9 == u3.FROST_STAFF_3 and 12 or 0))
end
function u6.getWeaponMistDamageCooldown(_, p10) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return p10 == u3.FROST_STAFF_1 and 0.2 or (p10 == u3.FROST_STAFF_2 and 0.18 or (p10 == u3.FROST_STAFF_3 and 0.16 or 0.2))
end
function u6.getStackFromProjectile(_, p11) --[[ Line: 58 ]]
    return p11 == "frosty_snowball_1" and 2 or (p11 == "frosty_snowball_2" and 3 or (p11 == "frosty_snowball_3" and 3 or 0))
end
function u6.getStackFromMist(_, p12) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return p12 == u3.FROST_STAFF_1 and 1 or (p12 == u3.FROST_STAFF_2 and 1 or (p12 == u3.FROST_STAFF_3 and 1 or 0))
end
function u6.isFrostyStaff(_, p13) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return p13 == u3.FROST_STAFF_1 or (p13 == u3.FROST_STAFF_2 or p13 == u3.FROST_STAFF_3)
end
u6.MAX_COLD_STACK = 10
u6.MAX_SLOW = 0.5
u6.FROZEN_DURATION = 1.5
u6.COLD_DURATION = 7
u6.COLD_RESIST_DURATION = 10
u6.MIST_DAMAGE_ARMOR_MULTIPLIER = 0.85
u6.MIST_RANGE = v2 * 8
u6.MAX_CHARGE_STACK = 1
return {
    ["FrostyGunMode"] = v5,
    ["FrostyStaffUtil"] = u6
}