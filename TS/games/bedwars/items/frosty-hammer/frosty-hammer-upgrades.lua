local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "frosty-hammer-balance").FrostyHammerBalance
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.STRENGTH = "strength"
v4.strength = "STRENGTH"
v5.SHIELD = "shield"
v4.shield = "SHIELD"
v5.SPEED = "speed"
v4.speed = "SPEED"
local u6 = {}
local v7 = v5.STRENGTH
local v8 = {
    ["name"] = "Strength"
}
local v9 = {}
local v10 = {}
local v11 = v2.DAMAGE_LV1
v10.name = tostring(v11) .. " Attack Damage"
v10.values = { 100 }
v10.price = v2.ATTACK_LEVEL1_COST
v10.currency = v3.FROST_CRYSTAL
local v12 = {}
local v13 = v2.DAMAGE_LV2
v12.name = tostring(v13) .. " Attack Damage"
v12.values = { 180 }
v12.price = v2.ATTACK_LEVEL2_COST
v12.currency = v3.FROST_CRYSTAL
local v14 = {}
local v15 = v2.DAMAGE_LV3
v14.name = tostring(v15) .. " Attack Damage"
v14.values = { 250 }
v14.price = v2.ATTACK_LEVEL3_COST
v14.currency = v3.FROST_CRYSTAL
__set_list(v9, 1, {v10, v12, v14})
v8.tiers = v9
u6[v7] = v8
local v16 = v5.SPEED
local v17 = {
    ["name"] = "Speed"
}
local v18 = {}
local v19 = {}
local v20 = v2.ATTACK_SPEED_LV1
v19.name = tostring(v20) .. " Attack Cooldown"
v19.values = { 100 }
v19.price = v2.SPEED_LEVEL1_COST
v19.currency = v3.FROST_CRYSTAL
local v21 = {}
local v22 = v2.ATTACK_SPEED_LV2
v21.name = tostring(v22) .. " Attack Cooldown"
v21.values = { 180 }
v21.price = v2.SPEED_LEVEL2_COST
v21.currency = v3.FROST_CRYSTAL
local v23 = {}
local v24 = v2.ATTACK_SPEED_LV3
v23.name = tostring(v24) .. " Attack Cooldown"
v23.values = { 250 }
v23.price = v2.SPEED_LEVEL3_COST
v23.currency = v3.FROST_CRYSTAL
__set_list(v18, 1, {v19, v21, v23})
v17.tiers = v18
u6[v16] = v17
local v25 = v5.SHIELD
local v26 = {
    ["name"] = "SHIELD"
}
local v27 = {}
local v28 = {}
local v29 = v2.SHIELD_LV1
v28.name = tostring(v29) .. " shield per attack"
v28.values = { 100 }
v28.price = v2.SHIELD_LEVEL1_COST
v28.currency = v3.FROST_CRYSTAL
local v30 = {}
local v31 = v2.SHIELD_LV2
v30.name = tostring(v31) .. " shield per attack"
v30.values = { 180 }
v30.price = v2.SHIELD_LEVEL2_COST
v30.currency = v3.FROST_CRYSTAL
local v32 = {}
local v33 = v2.SHIELD_LV3
v32.name = tostring(v33) .. " shield per attack"
v32.values = { 250 }
v32.price = v2.SHIELD_LEVEL3_COST
v32.currency = v3.FROST_CRYSTAL
__set_list(v27, 1, {v28, v30, v32})
v26.tiers = v27
u6[v25] = v26
return {
    ["getFrostyHammerUpgradeMeta"] = function(p34) --[[ Name: getFrostyHammerUpgradeMeta, Line 77 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6[p34]
    end,
    ["FrostyHammerUpgrade"] = v5,
    ["FrostyHammerUpgradeMeta"] = u6
}