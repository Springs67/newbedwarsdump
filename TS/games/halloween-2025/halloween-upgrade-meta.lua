local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-type").HalloweenUpgradeType
local v5 = {}
local v6 = v4.MAX_HEALTH_INCREASE
local v7 = {
    ["displayName"] = "Max Health Increase",
    ["upgradeTier"] = 1,
    ["description"] = "Increase your max health",
    ["halloweenKit"] = v3.NONE
}
local v8 = v2.MAX_HEALTH_INCREASE_FLAT
v7.hudDescription = "+" .. tostring(v8) .. " Max Health"
v5[v6] = v7
local v9 = v4.DAMAGE_INCREASE
local v10 = {
    ["displayName"] = "Damage Increase",
    ["upgradeTier"] = 2,
    ["description"] = "Increase your damage",
    ["halloweenKit"] = v3.NONE
}
local v11 = v2.DAMAGE_INCREASE_PERCENT
v10.hudDescription = "+" .. tostring(v11) .. "% Damage"
v5[v9] = v10
local v12 = v4.SPEED_INCREASE
local v13 = {
    ["displayName"] = "Speed Increase",
    ["upgradeTier"] = 3,
    ["description"] = "Increase your speed",
    ["halloweenKit"] = v3.NONE
}
local v14 = v2.SPEED_INCREASE_PERCENT
v13.hudDescription = "+" .. tostring(v14) .. "% Speed"
v5[v12] = v13
local v15 = v4.CRIT_CHANCE_INCREASE
local v16 = {
    ["displayName"] = "Crit Chance Increase",
    ["upgradeTier"] = 4,
    ["description"] = "Increase your crit chance",
    ["halloweenKit"] = v3.NONE
}
local v17 = v2.CRIT_CHANCE_INCREASE_PERCENT
v16.hudDescription = "+" .. tostring(v17) .. "% Crit Chance"
v5[v15] = v16
v5[v4.HEAL_INCREMENT] = {
    ["displayName"] = "Heal Increase I",
    ["upgradeTier"] = 1,
    ["description"] = "Slightly increase healing",
    ["hudDescription"] = "+1 healing per tick",
    ["halloweenKit"] = v3.MELODY
}
v5[v4.HEAL_INCREMENT_2] = {
    ["displayName"] = "Heal Increase II",
    ["upgradeTier"] = 2,
    ["description"] = "Increase healing",
    ["hudDescription"] = "+2 healing per tick",
    ["halloweenKit"] = v3.MELODY
}
v5[v4.AURA_DURATION] = {
    ["displayName"] = "Longer Aura",
    ["upgradeTier"] = 3,
    ["description"] = "Increase duration of Aura",
    ["hudDescription"] = "+2 Music Aura duration",
    ["halloweenKit"] = v3.MELODY
}
v5[v4.ULT_DURATION] = {
    ["displayName"] = "Dance enhance",
    ["upgradeTier"] = 4,
    ["description"] = "Increase duration of Dance",
    ["hudDescription"] = "+1 seconds Dance duration",
    ["halloweenKit"] = v3.MELODY
}
local v18 = v4.NAZAR_EMPOWERED
local v19 = {
    ["displayName"] = "Empowered Heal",
    ["upgradeTier"] = 1,
    ["disabled"] = true,
    ["halloweenKit"] = v3.NAZAR
}
local v20 = v2.NAZAR_EMPOWERED_DAMAGE_PERCENT
v19.description = "Increase the damage of empowered attacks by " .. tostring(v20) .. "%"
local v21 = v2.NAZAR_EMPOWERED_DAMAGE_PERCENT
v19.hudDescription = "+" .. tostring(v21) .. "% Empowered Damage"
v5[v18] = v19
local v22 = v4.NAZAR_LIFEFORCE_ON_HIT
local v23 = {
    ["displayName"] = "Lifeforce on Hit",
    ["upgradeTier"] = 1,
    ["disabled"] = true,
    ["halloweenKit"] = v3.NAZAR
}
local v24 = v2.NAZAR_LIFEFORCE_ON_HIT_PERCENT
v23.description = "Gain increased lifeforce gain by " .. tostring(v24) .. "%"
local v25 = v2.NAZAR_LIFEFORCE_ON_HIT_PERCENT
v23.hudDescription = "+" .. tostring(v25) .. "% Lifeforce on Hit"
v5[v22] = v23
local v26 = v4.NAZAR_STACKING_EMPOWERED
local v27 = {
    ["displayName"] = "Stacking Empowered",
    ["upgradeTier"] = 2,
    ["hudDescription"] = "Stacking Empowered",
    ["unique"] = true,
    ["halloweenKit"] = v3.NAZAR
}
local v28 = v2.NAZAR_STACKING_EMPOWERED_DAMAGE_PERCENT
v27.description = "Empowered attacks apply a stacking effect that increases damage by " .. tostring(v28) .. "% per stack"
v5[v26] = v27
local v29 = v4.NAZAR_LIFE_FORCE_SHIELD
local v30 = {
    ["displayName"] = "Life Force Shield",
    ["upgradeTier"] = 2,
    ["hudDescription"] = "Life Force Shield",
    ["unique"] = true,
    ["halloweenKit"] = v3.NAZAR
}
local v31 = v2.NAZAR_LIFE_FORCE_SHIELD_THRESHOLD
v30.description = "When health falls below " .. tostring(v31) .. "%, lifeforce is consumed instead of health"
v5[v29] = v30
local v32 = v4.KAIDA_COOLDOWN
local v33 = {
    ["displayName"] = "Summon Cooldown",
    ["disabled"] = true,
    ["upgradeTier"] = 1,
    ["description"] = "Reduces the cooldown of the Summon spell by 2 seconds",
    ["maxStacks"] = 8,
    ["halloweenKit"] = v3.SUMMONER
}
local v34 = v2.KAIDA_COOLDOWN_REDUCTION_SECONDS
v33.hudDescription = "-" .. tostring(v34) .. " seconds Summon cooldown"
v5[v32] = v33
local v35 = v4.KAIDA_RADIUS
local v36 = {
    ["displayName"] = "Summon Expansion",
    ["upgradeTier"] = 1,
    ["description"] = "Increase radius of the Summon spell",
    ["halloweenKit"] = v3.SUMMONER
}
local v37 = v2.KAIDA_EXPANSION_PERCENT
v36.hudDescription = "+" .. tostring(v37) .. "% Summon radius"
v5[v35] = v36
v5[v4.KAIDA_UNIQUE_FIRE] = {
    ["displayName"] = "Lingering Voidflame",
    ["upgradeTier"] = 1,
    ["description"] = "Casting the Summon spell leaves a lingering Voidflame that deals damage to enemies who enter",
    ["hudDescription"] = "Lingering Voidflame",
    ["unique"] = true,
    ["halloweenKit"] = v3.SUMMONER
}
local v38 = v4.KAIDA_UNIQUE_LIFESTEAL
local v39 = {
    ["displayName"] = "Draconic Lifesteal",
    ["upgradeTier"] = 1,
    ["hudDescription"] = "Draconic Lifesteal",
    ["unique"] = true,
    ["halloweenKit"] = v3.SUMMONER
}
local v40 = v2.KAIDA_UNIQUE_LIFESTEAL_HEAL_PER_HIT
v39.description = "When casting the Summon spell you gain " .. tostring(v40) .. " health per enemy hit"
v5[v38] = v39
local v41 = v4.KAIDA_UNIQUE_KNOCKBACK
local v42 = {
    ["displayName"] = "Summoning Force",
    ["upgradeTier"] = 1,
    ["hudDescription"] = "Summoning Force",
    ["unique"] = true,
    ["halloweenKit"] = v3.SUMMONER
}
local v43 = v2.KAIDA_UNIQUE_KNOCKBACK_DAMAGE_PERCENT
v42.description = "Casting the Summon spell creates a force that knocks back enemies and deals " .. tostring(v43) .. "% more damage"
v5[v41] = v42
local v44 = v4.SILAS_AURA_EFFECTIVENESS
local v45 = {
    ["displayName"] = "Aura Effectiveness",
    ["upgradeTier"] = 1,
    ["halloweenKit"] = v3.REBELLION_LEADER
}
local v46 = v2.SILAS_AURA_EFFECTIVENESS_PERCENT
v45.description = "Increase\n\t\t\tthe effectiveness of the aura by " .. tostring(v46) .. "% per stack."
local v47 = v2.SILAS_AURA_EFFECTIVENESS_PERCENT
v45.hudDescription = "+" .. tostring(v47) .. "% Aura Effectiveness"
v5[v44] = v45
local v48 = v4.SILAS_AURA_RADIUS
local v49 = {
    ["displayName"] = "Aura Radius",
    ["upgradeTier"] = 1,
    ["halloweenKit"] = v3.REBELLION_LEADER
}
local v50 = v2.SILAS_AURA_RADIUS_PERCENT
v49.description = "Increase the radius of the aura by " .. tostring(v50) .. "%"
local v51 = v2.SILAS_AURA_RADIUS_PERCENT
v49.hudDescription = "+" .. tostring(v51) .. "% Aura Radius"
v5[v48] = v49
v5[v4.SILAS_AURA_DEBUFF] = {
    ["displayName"] = "Aura Debuff",
    ["upgradeTier"] = 2,
    ["description"] = "Use Triumph stacks to apply a debuff to enemies in range",
    ["hudDescription"] = "Aura Debuff",
    ["unique"] = true,
    ["disabled"] = true,
    ["halloweenKit"] = v3.REBELLION_LEADER
}
v5[v4.SILAS_AURA_BUFF] = {
    ["displayName"] = "Aura Buff",
    ["upgradeTier"] = 2,
    ["description"] = "Use Triumph stacks to apply a buff to allies in range",
    ["hudDescription"] = "Aura Buff",
    ["unique"] = true,
    ["halloweenKit"] = v3.REBELLION_LEADER
}
v5[v4.SILAS_DOUBLE_TRIUMPH] = {
    ["displayName"] = "Double Triumph",
    ["upgradeTier"] = 2,
    ["description"] = "Gain double Triumph stacks from kills and assists",
    ["hudDescription"] = "Double Triumph",
    ["unique"] = true,
    ["halloweenKit"] = v3.REBELLION_LEADER
}
local v52 = v4.DEATH_ADDER_COOLDOWN
local v53 = {
    ["displayName"] = "Sorceror Cooldown",
    ["disabled"] = true,
    ["upgradeTier"] = 1,
    ["halloweenKit"] = v3.SORCERER
}
local v54 = v2.DEATH_ADDER_COOLDOWN_REDUCTION_PERCENT
v53.description = "Reduces the cooldown of the explosive comet by " .. tostring(v54) .. "%"
local v55 = v2.DEATH_ADDER_COOLDOWN_REDUCTION_PERCENT
v53.hudDescription = "-" .. tostring(v55) .. "% Comet Cooldown"
v5[v52] = v53
local v56 = v4.DEATH_ADDER_DAMAGE
local v57 = {
    ["displayName"] = "Damage Increase",
    ["upgradeTier"] = 1,
    ["halloweenKit"] = v3.SORCERER
}
local v58 = v2.DEATH_ADDER_DAMAGE_PERCENT
v57.description = "Increase the damage of the explosive comet by " .. tostring(v58) .. "%"
local v59 = v2.DEATH_ADDER_DAMAGE_PERCENT
v57.hudDescription = "+" .. tostring(v59) .. "% Comet Damage"
v5[v56] = v57
local v60 = v4.DEATH_ADDER_MULTI_SHOT
local v61 = {
    ["displayName"] = "Multi Shot",
    ["upgradeTier"] = 2,
    ["hudDescription"] = "Multi Shot",
    ["unique"] = true,
    ["halloweenKit"] = v3.SORCERER
}
local v62 = v2.DEATH_ADDER_MULTI_SHOT_COUNT
v61.description = "Fires " .. tostring(v62) .. " projectiles instead of one"
v5[v60] = v61
v5[v4.DEATH_ADDER_BIG_SHOT] = {
    ["displayName"] = "Big Shot",
    ["upgradeTier"] = 2,
    ["description"] = "Fires a large projectile that deals massive damage",
    ["hudDescription"] = "Big Shot",
    ["unique"] = true,
    ["halloweenKit"] = v3.SORCERER
}
local v63 = v4.DEATH_ADDER_FRAG_EXPLOSION
local v64 = {
    ["displayName"] = "Frag Explosion",
    ["upgradeTier"] = 2,
    ["hudDescription"] = "Frag Explosion",
    ["unique"] = true,
    ["halloweenKit"] = v3.SORCERER
}
local v65 = v2.DEATH_ADDER_FRAG_NUMBER
v64.description = "Each explosion triggers " .. tostring(v65) .. " additional smaller explosions."
v5[v63] = v64
return {
    ["HalloweenUpgradeMeta"] = v5
}