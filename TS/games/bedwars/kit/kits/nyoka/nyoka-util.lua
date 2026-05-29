local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "nyoka-balance").NyokaBalance
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = {
    {
        ["manaRegenRate"] = 1.5,
        ["minHealCooldownDuration"] = 0.9,
        ["maxHealCooldownDuration"] = 1.2,
        ["minHealAmount"] = 5,
        ["maxHealAmount"] = 7,
        ["itemType"] = v4.MENDING_CANOPY_STAFF_TIER_1,
        ["manaId"] = v2.MENDING_CANOPY_STAFF_MANA_TIER_1,
        ["abilities"] = { v2.MENDING_CANOPY_STAFF_CHARGE_ENABLED, v2.MENDING_CANOPY_STAFF_CHARGE_DISABLED },
        ["minHealRadius"] = u3.MIN_HEAL_RADIUS,
        ["maxHealRadius"] = u3.MAX_HEAL_RADIUS
    },
    {
        ["manaRegenRate"] = 2,
        ["minHealCooldownDuration"] = 0.6,
        ["maxHealCooldownDuration"] = 0.9,
        ["minHealAmount"] = 6,
        ["maxHealAmount"] = 8,
        ["minHorizontalKnockback"] = 0.3,
        ["maxHorizontalKnockback"] = 0.5,
        ["minVerticalKnockback"] = -0.15,
        ["maxVerticalKnockback"] = -0.25,
        ["minKnockbackCooldown"] = 0.75,
        ["maxKnockbackCooldown"] = 1.5,
        ["itemType"] = v4.MENDING_CANOPY_STAFF_TIER_2,
        ["manaId"] = v2.MENDING_CANOPY_STAFF_MANA_TIER_2,
        ["abilities"] = { v2.MENDING_CANOPY_STAFF_CHARGE_ENABLED, v2.MENDING_CANOPY_STAFF_CHARGE_DISABLED },
        ["minHealRadius"] = u3.MIN_HEAL_RADIUS * 1.3,
        ["maxHealRadius"] = u3.MAX_HEAL_RADIUS * 1.5
    },
    {
        ["manaRegenRate"] = 3,
        ["minHealCooldownDuration"] = 0.4,
        ["maxHealCooldownDuration"] = 0.7,
        ["minHealAmount"] = 7,
        ["maxHealAmount"] = 9,
        ["minHorizontalKnockback"] = 0.75,
        ["maxHorizontalKnockback"] = 1.15,
        ["minVerticalKnockback"] = -0.25,
        ["maxVerticalKnockback"] = -0.4,
        ["minKnockbackCooldown"] = 0.45,
        ["maxKnockbackCooldown"] = 1,
        ["itemType"] = v4.MENDING_CANOPY_STAFF_TIER_3,
        ["manaId"] = v2.MENDING_CANOPY_STAFF_MANA_TIER_3,
        ["abilities"] = { v2.MENDING_CANOPY_STAFF_CHARGE_ENABLED, v2.MENDING_CANOPY_STAFF_CHARGE_DISABLED },
        ["extraAbilities"] = { v2.MENDING_CANOPY_STAFF_OVERCHARGE },
        ["minHealRadius"] = u3.MIN_HEAL_RADIUS * 1.5,
        ["maxHealRadius"] = u3.MAX_HEAL_RADIUS * 2
    }
}
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 57 ]]
        return "NyokaUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 66 ]] end
function u6.isMendingCanopyStaff(_, p9) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v10 = nil
    for v11, v12 in u5 do
        local _ = v11 - 1
        if v12.itemType == p9 == true then
            v10 = v12
            break
        end
    end
    return v10 and true or false
end
function u6.getMendingStaffTierData(_, p13) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v14 = nil
    for v15, v16 in u5 do
        local _ = v15 - 1
        if v16.itemType == p13 == true then
            v14 = v16
            break
        end
    end
    return v14
end
function u6.getStaffAbilities(_, p17) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v18 = nil
    for v19, v20 in u5 do
        local _ = v19 - 1
        if v20.itemType == p17 == true then
            v18 = v20
            break
        end
    end
    if v18 ~= nil then
        v18 = v18.abilities
    end
    return v18
end
function u6.getStaffExtraAbilities(_, p21) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v22 = nil
    for v23, v24 in u5 do
        local _ = v23 - 1
        if v24.itemType == p21 == true then
            v22 = v24
            break
        end
    end
    if v22 ~= nil then
        v22 = v22.extraAbilities
    end
    return v22
end
function u6.getManaId(_, p25) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v26 = nil
    for v27, v28 in u5 do
        local _ = v27 - 1
        if v28.itemType == p25 == true then
            v26 = v28
            break
        end
    end
    if v26 ~= nil then
        v26 = v26.manaId
    end
    return v26
end
function u6.getManaRegenRate(_, p29) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    local v30 = nil
    for v31, v32 in u5 do
        local _ = v31 - 1
        if v32.itemType == p29 == true then
            v30 = v32
            break
        end
    end
    if v30 ~= nil then
        v30 = v30.manaRegenRate
    end
    if v30 == nil then
        v30 = u3.MENDING_CANOPY_STAFF_MANA_REGEN_AMOUNT_PER_TICK
    end
    return v30
end
function u6.getStaffs(_) --[[ Line: 183 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v33 = {}
    for v34, v35 in u5 do
        local _ = v34 - 1
        local v36 = v35.itemType
        table.insert(v33, v36)
    end
    return v33
end
return {
    ["MENDING_CANOPY_STAFF_TIER_DATA"] = u5,
    ["NyokaUtil"] = u6
}