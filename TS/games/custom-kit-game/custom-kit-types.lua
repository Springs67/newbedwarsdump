local v1 = {}
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.ID = "id"
v2.id = "ID"
v3.NAME = "name"
v2.name = "NAME"
v3.DESCRIPTION = "description"
v2.description = "DESCRIPTION"
v3.ABILITY_TRIGGER_TYPE = "ability_trigger_type"
v2.ability_trigger_type = "ABILITY_TRIGGER_TYPE"
v3.TARGET_TYPE = "target_type"
v2.target_type = "TARGET_TYPE"
v3.TARGET_TEAM = "target_team"
v2.target_team = "TARGET_TEAM"
v3.COOLDOWN = "cooldown"
v2.cooldown = "COOLDOWN"
v3.DAMAGE_POTENCY = "potency"
v2.potency = "DAMAGE_POTENCY"
v3.HEAL_POTENCY = "heal_potency"
v2.heal_potency = "HEAL_POTENCY"
v3.PROJECTILE_SPEED = "projectile_speed"
v2.projectile_speed = "PROJECTILE_SPEED"
v3.PROJECTILE_EXPLOSION_RADIUS = "projectile_explosion_radius"
v2.projectile_explosion_radius = "PROJECTILE_EXPLOSION_RADIUS"
v3.AOE_RADIUS = "aoe_radius"
v2.aoe_radius = "AOE_RADIUS"
v3.AURA_RADIUS = "aura_radius"
v2.aura_radius = "AURA_RADIUS"
v3.AURA_DURATION = "aura_duration"
v2.aura_duration = "AURA_DURATION"
v3.STATUS_EFFECT = "status_effect"
v2.status_effect = "STATUS_EFFECT"
v3.STATUS_EFFECT_DURATION = "status_effect_duration"
v2.status_effect_duration = "STATUS_EFFECT_DURATION"
v1.AbilityPropertyKey = v3
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.LEVEL = "level"
v4.level = "LEVEL"
v5.DROPDOWN = "dropdown"
v4.dropdown = "DROPDOWN"
v5.STRING = "string"
v4.string = "STRING"
v1.AbilityPropertyGUIDisplayType = v5
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.HEALTH = "health"
v6.health = "HEALTH"
v7.MELEE_DAMAGE = "melee_damage"
v6.melee_damage = "MELEE_DAMAGE"
v7.RANGED_DAMAGE = "ranged_damage"
v6.ranged_damage = "RANGED_DAMAGE"
v7.DEFENSE = "defense"
v6.defense = "DEFENSE"
v7.SPEED = "speed"
v6.speed = "SPEED"
v7.KNOCKBACK_RESISTANCE = "knockback_resistance"
v6.knockback_resistance = "KNOCKBACK_RESISTANCE"
v1.Stat = v7
local v8 = {}
local v9 = setmetatable({}, {
    ["__index"] = v8
})
v9.SELF = "self"
v8.self = "SELF"
v9.PROJECTILE = "projectile"
v8.projectile = "PROJECTILE"
v9.AOE = "aoe"
v8.aoe = "AOE"
v9.AURA = "aura"
v8.aura = "AURA"
v9.MELEE = "melee"
v8.melee = "MELEE"
v1.TargetType = v9
local v10 = {}
local v11 = setmetatable({}, {
    ["__index"] = v10
})
v11.NONE = "none"
v10.none = "NONE"
v11.ENEMY = "enemy"
v10.enemy = "ENEMY"
v11.ALLY = "ally"
v10.ally = "ALLY"
v1.TargetTeam = v11
local v12 = {}
local v13 = setmetatable({}, {
    ["__index"] = v12
})
v13.NONE = "none"
v12.none = "NONE"
v13.REGEN = "regen"
v12.regen = "REGEN"
v13.SHIELD = "shield"
v12.shield = "SHIELD"
v13.INVISIBILITY = "invisibility"
v12.invisibility = "INVISIBILITY"
v13.POISON = "poison"
v12.poison = "POISON"
v13.ZAPPED = "zapped"
v12.zapped = "ZAPPED"
v13.SILENCE = "silence"
v12.silence = "SILENCE"
v13.DECAY = "decay"
v12.decay = "DECAY"
v13.DIZZY = "dizzy"
v12.dizzy = "DIZZY"
v13.GROUNDED = "grounded"
v12.grounded = "GROUNDED"
v1.StatusEffectType = v13
v1.AllyStatusEffects = {
    v13.NONE,
    v13.REGEN,
    v13.SHIELD,
    v13.INVISIBILITY
}
v1.EnemyStatusEffects = {
    v13.NONE,
    v13.POISON,
    v13.ZAPPED,
    v13.SILENCE,
    v13.DECAY,
    v13.DIZZY,
    v13.GROUNDED
}
return {
    ["CustomKitTypes"] = v1
}