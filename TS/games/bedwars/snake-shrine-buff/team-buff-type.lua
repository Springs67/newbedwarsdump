local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.POISON_ARROW = "poison_arrow"
v1.poison_arrow = "POISON_ARROW"
v2.POISON_SWORD = "poison_sword"
v1.poison_sword = "POISON_SWORD"
v2.BLESSED_BED = "blessed_bed"
v1.blessed_bed = "BLESSED_BED"
v2.BLESSED_GENERATOR = "blessed_generator"
v1.blessed_generator = "BLESSED_GENERATOR"
v2.BED_DEFENSE_LAYER = "bed_defense_layer"
v1.bed_defense_layer = "BED_DEFENSE_LAYER"
v2.CLINGY = "clingy"
v1.clingy = "CLINGY"
v2.SHOP_REBATE = "shop_rebate"
v1.shop_rebate = "SHOP_REBATE"
v2.RECYCLE = "recycle"
v1.recycle = "RECYCLE"
v2.SNAKE_AGILITY = "snake_agility"
v1.snake_agility = "SNAKE_AGILITY"
v2.ENCHANT_DISCOUNT = "enchant_discount"
v1.enchant_discount = "ENCHANT_DISCOUNT"
v2.VENGEFUL_VENOM = "vengeful_venom"
v1.vengeful_venom = "VENGEFUL_VENOM"
return {
    ["TeamBuffType"] = v2,
    ["TEAM_BUFF_TYPES_ORDERED_BY_CATEGORY"] = {
        v2.POISON_ARROW,
        v2.POISON_SWORD,
        v2.VENGEFUL_VENOM,
        v2.SNAKE_AGILITY,
        v2.BLESSED_BED,
        v2.BED_DEFENSE_LAYER,
        v2.CLINGY,
        v2.SHOP_REBATE,
        v2.BLESSED_GENERATOR,
        v2.RECYCLE,
        v2.ENCHANT_DISCOUNT
    }
}