local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v8 = {}
local u9 = setmetatable({}, {
    ["__index"] = v8
})
u9.TIER_1 = 1
v8[1] = "TIER_1"
u9.TIER_2 = 2
v8[2] = "TIER_2"
u9.TIER_3 = 3
v8[3] = "TIER_3"
u9.TIER_4 = 4
v8[4] = "TIER_4"
u9.TIER_5 = 5
v8[5] = "TIER_5"
local u10 = {
    [u9.TIER_1] = {
        ["secCharge"] = 1,
        ["maxSpellCharges"] = 2,
        ["numTotalCrystalsReq"] = 0,
        ["projectileType"] = "sorcerer_projectile_1",
        ["projectileVelocity"] = 70,
        ["projectileLifetime"] = 0.9,
        ["projectileOnHitDamage"] = 10,
        ["explosionDamageMultiplier"] = 0.65,
        ["explodeRadius"] = 2.8,
        ["explodePower"] = 1.5,
        ["abilityId"] = v5.SORCERER_EXPLOSION_TIER_1,
        ["abilityIcon"] = v7.SORCERER_ABILITY_TIER_1,
        ["nextTier"] = u9.TIER_2,
        ["explosionDamageRadius"] = 4 * v6
    },
    [u9.TIER_2] = {
        ["secCharge"] = 1,
        ["maxSpellCharges"] = 3,
        ["projectileType"] = "sorcerer_projectile_2",
        ["projectileVelocity"] = 100,
        ["projectileLifetime"] = 1,
        ["projectileOnHitDamage"] = 12,
        ["explosionDamageMultiplier"] = 0.7,
        ["explodeRadius"] = 3.2,
        ["explodePower"] = 2,
        ["abilityId"] = v5.SORCERER_EXPLOSION_TIER_2,
        ["abilityIcon"] = v7.SORCERER_ABILITY_TIER_1,
        ["nextTier"] = u9.TIER_3,
        ["numTotalCrystalsReq"] = v4:IsStudio() and 2 or 5,
        ["explosionDamageRadius"] = 4.6 * v6
    },
    [u9.TIER_3] = {
        ["secCharge"] = 2,
        ["maxSpellCharges"] = 4,
        ["projectileType"] = "sorcerer_projectile_3",
        ["projectileVelocity"] = 140,
        ["projectileLifetime"] = 1.1,
        ["projectileOnHitDamage"] = 14,
        ["explosionDamageMultiplier"] = 0.75,
        ["explodeRadius"] = 3.8,
        ["explodePower"] = 10,
        ["abilityId"] = v5.SORCERER_EXPLOSION_TIER_3,
        ["abilityIcon"] = v7.SORCERER_ABILITY_TIER_2,
        ["nextTier"] = u9.TIER_4,
        ["numTotalCrystalsReq"] = v4:IsStudio() and 3 or 12,
        ["explosionDamageRadius"] = 5.2 * v6
    },
    [u9.TIER_4] = {
        ["secCharge"] = 2,
        ["maxSpellCharges"] = 5,
        ["projectileType"] = "sorcerer_projectile_4",
        ["projectileVelocity"] = 200,
        ["projectileLifetime"] = 1.3,
        ["projectileOnHitDamage"] = 18,
        ["explosionDamageMultiplier"] = 0.8,
        ["explodeRadius"] = 4.4,
        ["explodePower"] = 10.5,
        ["abilityId"] = v5.SORCERER_EXPLOSION_TIER_4,
        ["abilityIcon"] = v7.SORCERER_ABILITY_TIER_2,
        ["numTotalCrystalsReq"] = v4:IsStudio() and 4 or 20,
        ["explosionDamageRadius"] = 6 * v6,
        ["nextTier"] = u9.TIER_5
    },
    [u9.TIER_5] = {
        ["secCharge"] = 3,
        ["maxSpellCharges"] = 6,
        ["projectileType"] = "sorcerer_projectile_5",
        ["projectileVelocity"] = 245,
        ["projectileLifetime"] = 1.55,
        ["projectileOnHitDamage"] = 24,
        ["explosionDamageMultiplier"] = 0.9,
        ["explodeRadius"] = 5.2,
        ["explodePower"] = 12,
        ["abilityId"] = v5.SORCERER_EXPLOSION_TIER_5,
        ["abilityIcon"] = v7.SORCERER_ABILITY_TIER_3,
        ["numTotalCrystalsReq"] = v4:IsStudio() and 5 or 32,
        ["explosionDamageRadius"] = 6.8 * v6
    }
}
return {
    ["SorcererTier"] = u9,
    ["SorcererTierMeta"] = u10,
    ["SorcererBalance"] = {
        ["NUM_CRYSTALS_SPAWNED_MATCH_START"] = v4:IsStudio() and 30 or 12,
        ["SPELL_CHARGE_MOVE_SPEED_MODIFIER"] = 0.5,
        ["HIGHEST_TIER"] = u9.TIER_5,
        ["getSorcererTierData"] = function(p11) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            return u10[p11]
        end,
        ["getSorcererTier"] = function(p12) --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u9
                [3] = u3
                [4] = u10
            --]]
            if u2.isHoarceKat() then
                return u9.TIER_4
            end
            local v13 = p12:GetAttribute("CrystalsCollected")
            local v14 = (v13 == 0 or (v13 ~= v13 or not v13)) and 0 or v13
            local v15 = u3.entries(u10)
            table.sort(v15, function(p16, p17) --[[ Line: 131 ]]
                local v18 = p16[2].numTotalCrystalsReq
                local v19 = v18 == nil and 0 or v18
                local v20 = p17[2].numTotalCrystalsReq
                return (v20 == nil and 0 or v20) < v19
            end)
            local v21 = nil
            for v22, v23 in v15 do
                local _ = v22 - 1
                local _ = v23[1]
                local v24 = v23[2].numTotalCrystalsReq
                if (v24 == nil and 0 or v24) <= v14 == true then
                    v21 = v23
                    break
                end
            end
            if v21 ~= nil then
                v21 = v21[1]
            end
            if v21 == nil then
                v21 = u9.TIER_1
            end
            return v21
        end,
        ["getSorcererMeta"] = function() --[[ Line: 177 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            return u10
        end,
        ["getSorcererTierFromCharge"] = function(p25) --[[ Line: 181 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u10
                [3] = u9
            --]]
            local v26 = u3.entries(u10)
            table.sort(v26, function(p27, p28) --[[ Line: 183 ]]
                return p27[2].secCharge < p28[2].secCharge
            end)
            local v29 = nil
            for v30, v31 in v26 do
                local _ = v30 - 1
                local _ = v31[1]
                if p25 < v31[2].secCharge == true then
                    v29 = v31
                    break
                end
            end
            if v29 ~= nil then
                v29 = v29[1]
            end
            if v29 == nil then
                v29 = u9.TIER_1
            end
            return v29
        end
    }
}