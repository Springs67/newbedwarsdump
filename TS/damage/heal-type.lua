local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.LIFESTEAL_ENCHANT = "lifesteal_enchant"
v1.lifesteal_enchant = "LIFESTEAL_ENCHANT"
v2.REGEN = "regen"
v1.regen = "REGEN"
v2.SEAHORSE = "seahorse"
v1.seahorse = "SEAHORSE"
v2.SLIME = "SLIME"
v1.SLIME = "SLIME"
v2.WAND = "WAND"
v1.WAND = "WAND"
v2.CONSUME_SOUL = "consume_soul"
v1.consume_soul = "CONSUME_SOUL"
v2.CHAIN_HEAL = "chain_heal"
v1.chain_heal = "CHAIN_HEAL"
v2.LIFE_FORCE = "life_force"
v1.life_force = "LIFE_FORCE"
v2.SUMMONED_SPIRIT = "summoned_spirit"
v1.summoned_spirit = "SUMMONED_SPIRIT"
v2.TEARBLOOM_BUFF = "tearbloom_buff"
v1.tearbloom_buff = "TEARBLOOM_BUFF"
v2.CUSTOM_KIT_ABILITY = "custom_kit_ability"
v1.custom_kit_ability = "CUSTOM_KIT_ABILITY"
v2.HEALING_RAIN = "healing_rain"
v1.healing_rain = "HEALING_RAIN"
return {
    ["HealType"] = v2
}