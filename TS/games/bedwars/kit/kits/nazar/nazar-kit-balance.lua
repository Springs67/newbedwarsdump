local v1 = {
    ["HEAL_TO_LIFE_FORCE_CONVERSION_RATIO"] = 0.8,
    ["LIFE_FORCE_TO_HEALTH_CONVERSION_RATIO"] = 0.8,
    ["MAX_STORED_LIFE_FORCE"] = 150,
    ["MAX_ADDITIONAL_DAMAGE_LIFE_FORCE"] = 10,
    ["MAX_LIFE_FORCE_TAKEN_ON_CONSUME"] = 35,
    ["BASE_DAMAGE_LIFE_FORCE_CONVERSION_PERCENT"] = 0.4,
    ["LIFE_FORCE_TO_DAMAGE_MULTIPLIER"] = 1,
    ["MELEE_DAMAGE_TO_LIFE_FORCE_CONVERSION_PERCENT"] = 0.25,
    ["MELEE_HITS_TO_GET_LIFE_FORCE"] = 2,
    ["LIFE_FORCE_FROM_LIFE_ARROW_MULTIPLIER"] = 0.5,
    ["LIFE_FORCE_GAIN_TICK_SEC"] = 7,
    ["LIFE_FORCE_GAIN_ON_TICK"] = 10,
    ["LIFE_FORCE_PASSIVE_GAIN_CAP"] = 75,
    ["EMPOWERED_ARMOR_PENETRATION_MULTIPLIER"] = 0.92,
    ["LIFE_BOW_DAMAGE"] = 18,
    ["LIFE_BOW_ARMOR_MULTIPLIER"] = 0.9,
    ["LIFE_CROSSBOW_DAMAGE"] = 34,
    ["LIFE_CROSSBOW_ARMOR_MULTIPLIER"] = 0.85,
    ["LIFE_HEADHUNTER_DAMAGE"] = 50,
    ["LIFE_HEADHUNTER_ARMOR_MULTIPLIER"] = 0.8,
    ["HEALTH_TAKEN_BY_PROJECTILE"] = {
        ["life_arrow"] = {
            ["damage"] = 5,
            ["armorMult"] = 0.5
        },
        ["life_crossbow_arrow"] = {
            ["damage"] = 10,
            ["armorMult"] = 0.4
        },
        ["life_headhunter_arrow"] = {
            ["damage"] = 12,
            ["armorMult"] = 0.25
        }
    },
    ["CONSUME_LIFE_FORCE_COOLDOWN_SEC"] = 3,
    ["TOGGLE_LIFE_FORCE_ATTACK_COOLDOWN_SEC"] = 2,
    ["STATIC_ANTIHEAL_EFFICACY_REDUCTION"] = 0.5
}
return {
    ["NazarKitBalance"] = v1
}