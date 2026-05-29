local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-type").HalloweenAbilityType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig
local v5 = {}
local v6 = v3.MAX_HEALTH_INCREASE
local v7 = {
    ["displayName"] = "Max Health Increase",
    ["upgradeTier"] = 1,
    ["description"] = "Increase your max health",
    ["bedwarsKit"] = v2.NONE
}
local v8 = v4.MAX_HEALTH_INCREASE_FLAT
v7.hudDescription = "+" .. tostring(v8) .. " Max Health"
v5[v6] = v7
local v9 = v3.DAMAGE_INCREASE
local v10 = {
    ["displayName"] = "Damage Increase",
    ["upgradeTier"] = 1,
    ["description"] = "Increase your damage",
    ["bedwarsKit"] = v2.NONE
}
local v11 = v4.DAMAGE_INCREASE_PERCENT
v10.hudDescription = "+" .. tostring(v11) .. "% Damage"
v5[v9] = v10
local v12 = v3.SPEED_INCREASE
local v13 = {
    ["displayName"] = "Speed Increase",
    ["upgradeTier"] = 1,
    ["description"] = "Increase your speed",
    ["bedwarsKit"] = v2.NONE
}
local v14 = v4.SPEED_INCREASE_PERCENT
v13.hudDescription = "+" .. tostring(v14) .. "% Speed"
v5[v12] = v13
local v15 = v3.CRIT_CHANCE_INCREASE
local v16 = {
    ["displayName"] = "Crit Chance Increase",
    ["upgradeTier"] = 1,
    ["description"] = "Increase your crit chance",
    ["bedwarsKit"] = v2.NONE
}
local v17 = v4.CRIT_CHANCE_INCREASE_PERCENT
v16.hudDescription = "+" .. tostring(v17) .. "% Crit Chance"
v5[v15] = v16
v5[v3.DEATH_ADDER_STARTER] = {
    ["displayName"] = "Sorceror Projectile",
    ["upgradeTier"] = 0,
    ["description"] = "A projectile that deals damage to enemies.",
    ["unique"] = true,
    ["hudDescription"] = "Death Adder Projectile",
    ["bedwarsKit"] = v2.SORCERER
}
local v18 = v3.DEATH_ADDER_COOLDOWN
local v19 = {
    ["displayName"] = "Sorceror Cooldown",
    ["upgradeTier"] = 1,
    ["bedwarsKit"] = v2.SORCERER
}
local v20 = v4.DEATH_ADDER_COOLDOWN_REDUCTION_PERCENT
v19.description = "Reduces the cooldown of the explosive comet by " .. tostring(v20) .. "%"
local v21 = v4.DEATH_ADDER_COOLDOWN_REDUCTION_PERCENT
v19.hudDescription = "-" .. tostring(v21) .. "% Comet Cooldown"
v5[v18] = v19
local v22 = v3.DEATH_ADDER_DAMAGE
local v23 = {
    ["displayName"] = "Damage Increase",
    ["upgradeTier"] = 1,
    ["bedwarsKit"] = v2.SORCERER
}
local v24 = v4.DEATH_ADDER_DAMAGE_PERCENT
v23.description = "Increase the damage of the explosive comet by " .. tostring(v24) .. "%"
local v25 = v4.DEATH_ADDER_DAMAGE_PERCENT
v23.hudDescription = "+" .. tostring(v25) .. "% Comet Damage"
v5[v22] = v23
local v26 = v3.DEATH_ADDER_MULTI_SHOT
local v27 = {
    ["displayName"] = "Multi Shot",
    ["upgradeTier"] = 2,
    ["hudDescription"] = "Multi Shot",
    ["unique"] = true,
    ["bedwarsKit"] = v2.SORCERER
}
local v28 = v4.DEATH_ADDER_MULTI_SHOT_COUNT
v27.description = "Fires " .. tostring(v28) .. " projectiles instead of one"
v5[v26] = v27
v5[v3.DEATH_ADDER_BIG_SHOT] = {
    ["displayName"] = "Big Shot",
    ["upgradeTier"] = 2,
    ["description"] = "Fires a large projectile that deals massive damage",
    ["hudDescription"] = "Big Shot",
    ["unique"] = true,
    ["bedwarsKit"] = v2.SORCERER
}
local v29 = v3.DEATH_ADDER_FRAG_EXPLOSION
local v30 = {
    ["displayName"] = "Frag Explosion",
    ["upgradeTier"] = 2,
    ["hudDescription"] = "Frag Explosion",
    ["unique"] = true,
    ["bedwarsKit"] = v2.SORCERER
}
local v31 = v4.DEATH_ADDER_FRAG_NUMBER
v30.description = "Each explosion triggers " .. tostring(v31) .. " additional smaller explosions."
v5[v29] = v30
v5[v3.SILAS_STARTER] = {
    ["displayName"] = "Rebellion Aura",
    ["upgradeTier"] = 0,
    ["description"] = "A damaging aura that deals damage to enemies.",
    ["unique"] = true,
    ["hudDescription"] = "Silas Aura",
    ["bedwarsKit"] = v2.REBELLION_LEADER
}
local v32 = v3.SILAS_AURA_EFFECTIVENESS
local v33 = {
    ["displayName"] = "Aura Effectiveness",
    ["upgradeTier"] = 1,
    ["bedwarsKit"] = v2.REBELLION_LEADER
}
local v34 = v4.SILAS_AURA_EFFECTIVENESS_PERCENT
v33.description = "Increase\n\t\tthe effectiveness of the aura by " .. tostring(v34) .. "% per stack."
local v35 = v4.SILAS_AURA_EFFECTIVENESS_PERCENT
v33.hudDescription = "+" .. tostring(v35) .. "% Aura Effectiveness"
v5[v32] = v33
local v36 = v3.SILAS_AURA_RADIUS
local v37 = {
    ["displayName"] = "Aura Radius",
    ["upgradeTier"] = 1,
    ["bedwarsKit"] = v2.REBELLION_LEADER
}
local v38 = v4.SILAS_AURA_RADIUS_PERCENT
v37.description = "Increase the radius of the aura by " .. tostring(v38) .. "%"
local v39 = v4.SILAS_AURA_RADIUS_PERCENT
v37.hudDescription = "+" .. tostring(v39) .. "% Aura Radius"
v5[v36] = v37
v5[v3.SILAS_AURA_DEBUFF] = {
    ["displayName"] = "Aura Debuff",
    ["upgradeTier"] = 2,
    ["description"] = "Use Triumph stacks to apply a debuff to enemies in range",
    ["hudDescription"] = "Aura Debuff",
    ["unique"] = true,
    ["disabled"] = true,
    ["bedwarsKit"] = v2.REBELLION_LEADER
}
v5[v3.SILAS_AURA_BUFF] = {
    ["displayName"] = "Aura Buff",
    ["upgradeTier"] = 2,
    ["description"] = "Use Triumph stacks to apply a buff to allies in range",
    ["hudDescription"] = "Aura Buff",
    ["unique"] = true,
    ["bedwarsKit"] = v2.REBELLION_LEADER
}
v5[v3.SILAS_DOUBLE_TRIUMPH] = {
    ["displayName"] = "Double Triumph",
    ["upgradeTier"] = 2,
    ["description"] = "Gain double Triumph stacks from kills and assists",
    ["hudDescription"] = "Double Triumph",
    ["unique"] = true,
    ["bedwarsKit"] = v2.REBELLION_LEADER
}
v5[v3.KAIDA_STARTER] = {
    ["displayName"] = "Summon Dragon",
    ["upgradeTier"] = 0,
    ["description"] = "Summons a dragon that deals damage to enemies.",
    ["unique"] = true,
    ["hudDescription"] = "Kaida Dragon",
    ["bedwarsKit"] = v2.SUMMONER
}
local v40 = v3.KAIDA_COOLDOWN
local v41 = {
    ["displayName"] = "Summon Cooldown",
    ["upgradeTier"] = 1,
    ["description"] = "Reduces the cooldown of the Summon spell by 2 seconds",
    ["maxStacks"] = 8,
    ["bedwarsKit"] = v2.SUMMONER
}
local v42 = v4.KAIDA_COOLDOWN_REDUCTION_SECONDS
v41.hudDescription = "-" .. tostring(v42) .. " seconds Summon cooldown"
v5[v40] = v41
local v43 = v3.KAIDA_RADIUS
local v44 = {
    ["displayName"] = "Summon Expansion",
    ["upgradeTier"] = 1,
    ["description"] = "Increase radius of the Summon spell",
    ["bedwarsKit"] = v2.SUMMONER
}
local v45 = v4.KAIDA_EXPANSION_PERCENT
v44.hudDescription = "+" .. tostring(v45) .. "% Summon radius"
v5[v43] = v44
v5[v3.KAIDA_UNIQUE_FIRE] = {
    ["displayName"] = "Lingering Voidflame",
    ["upgradeTier"] = 1,
    ["description"] = "Casting the Summon spell leaves a lingering Voidflame that deals damage to enemies who enter",
    ["hudDescription"] = "Lingering Voidflame",
    ["unique"] = true,
    ["bedwarsKit"] = v2.SUMMONER
}
local v46 = v3.KAIDA_UNIQUE_LIFESTEAL
local v47 = {
    ["displayName"] = "Draconic Lifesteal",
    ["upgradeTier"] = 1,
    ["hudDescription"] = "Draconic Lifesteal",
    ["unique"] = true,
    ["bedwarsKit"] = v2.SUMMONER
}
local v48 = v4.KAIDA_UNIQUE_LIFESTEAL_HEAL_PER_HIT
v47.description = "When casting the Summon spell you gain " .. tostring(v48) .. " health per enemy hit"
v5[v46] = v47
local v49 = v3.KAIDA_UNIQUE_KNOCKBACK
local v50 = {
    ["displayName"] = "Summoning Force",
    ["upgradeTier"] = 1,
    ["hudDescription"] = "Summoning Force",
    ["unique"] = true,
    ["bedwarsKit"] = v2.SUMMONER
}
local v51 = v4.KAIDA_UNIQUE_KNOCKBACK_DAMAGE_PERCENT
v50.description = "Casting the Summon spell creates a force that knocks back enemies and deals " .. tostring(v51) .. "% more damage"
v5[v49] = v50
v5[v3.NAZAR_STARTER] = {
    ["displayName"] = "Nazar Lifeforce",
    ["upgradeTier"] = 0,
    ["description"] = "Gain a lifeforce bar and unlock the empowered attack and knockback strike abilities.",
    ["unique"] = true,
    ["hudDescription"] = "Nazar Heal",
    ["disabled"] = true,
    ["bedwarsKit"] = v2.NAZAR
}
local v52 = v3.NAZAR_EMPOWERED
local v53 = {
    ["displayName"] = "Empowered Heal",
    ["upgradeTier"] = 1,
    ["bedwarsKit"] = v2.NAZAR
}
local v54 = v4.NAZAR_EMPOWERED_DAMAGE_PERCENT
v53.description = "Increase the damage of empowered attacks by " .. tostring(v54) .. "%"
local v55 = v4.NAZAR_EMPOWERED_DAMAGE_PERCENT
v53.hudDescription = "+" .. tostring(v55) .. "% Empowered Damage"
v5[v52] = v53
local v56 = v3.NAZAR_LIFEFORCE_ON_HIT
local v57 = {
    ["displayName"] = "Lifeforce on Hit",
    ["upgradeTier"] = 1,
    ["bedwarsKit"] = v2.NAZAR
}
local v58 = v4.NAZAR_LIFEFORCE_ON_HIT_PERCENT
v57.description = "Gain increased lifeforce gain by " .. tostring(v58) .. "%"
local v59 = v4.NAZAR_LIFEFORCE_ON_HIT_PERCENT
v57.hudDescription = "+" .. tostring(v59) .. "% Lifeforce on Hit"
v5[v56] = v57
v5[v3.NAZAR_KNOCKBACK_STRIKE] = {
    ["displayName"] = "Knockback Strike",
    ["upgradeTier"] = 2,
    ["description"] = "Enemies that are knocked back deal damage to enemies they pass through",
    ["hudDescription"] = "Crashing Blow",
    ["unique"] = true,
    ["bedwarsKit"] = v2.NAZAR
}
local v60 = v3.NAZAR_STACKING_EMPOWERED
local v61 = {
    ["displayName"] = "Stacking Empowered",
    ["upgradeTier"] = 2,
    ["hudDescription"] = "Stacking Empowered",
    ["unique"] = true,
    ["bedwarsKit"] = v2.NAZAR
}
local v62 = v4.NAZAR_STACKING_EMPOWERED_DAMAGE_PERCENT
v61.description = "Empowered attacks apply a stacking effect that increases damage by " .. tostring(v62) .. "% per stack"
v5[v60] = v61
local v63 = v3.NAZAR_LIFE_FORCE_SHIELD
local v64 = {
    ["displayName"] = "Life Force Shield",
    ["upgradeTier"] = 2,
    ["hudDescription"] = "Life Force Shield",
    ["unique"] = true,
    ["bedwarsKit"] = v2.NAZAR
}
local v65 = v4.NAZAR_LIFE_FORCE_SHIELD_THRESHOLD
v64.description = "When health falls below " .. tostring(v65) .. "%, lifeforce is consumed instead of health"
v5[v63] = v64
return {
    ["HalloweenAbilityMeta"] = v5
}