local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-type").TeamBuffType
local v5 = {
    [v4.POISON_ARROW] = {
        ["displayName"] = "Poison Arrow",
        ["description"] = "All arrow attacks deal additional poison damage. Purchase multiple times to increase poison damage.",
        ["defaultDuration"] = 180,
        ["applyVisualEffect"] = true,
        ["baseCost"] = 3,
        ["applyMultiplier"] = true,
        ["statusEffect"] = v3.SNAKE_POISON_ARROW,
        ["image"] = v2.POISON_ARROW,
        ["purchaseLimit"] = {
            ["activeCountLimit"] = 5
        }
    },
    [v4.POISON_SWORD] = {
        ["displayName"] = "Poison Sword",
        ["description"] = "All melee attacks deal additional poison damage. Purchase multiple times to increase poison damage.",
        ["defaultDuration"] = 180,
        ["applyVisualEffect"] = true,
        ["baseCost"] = 5,
        ["applyMultiplier"] = true,
        ["statusEffect"] = v3.SNAKE_POISON_SWORD,
        ["image"] = v2.POISON_SWORD,
        ["purchaseLimit"] = {
            ["activeCountLimit"] = 5
        }
    },
    [v4.BLESSED_BED] = {
        ["displayName"] = "Blessed Bed",
        ["description"] = "Increase your bed\'s maximum health.",
        ["baseCost"] = 4,
        ["applyMultiplier"] = true,
        ["disableOnBedBreak"] = true,
        ["purchaseLimit"] = {
            ["totalCountLimit"] = 4
        },
        ["image"] = v2.BED_RED_RENDER
    },
    [v4.BLESSED_GENERATOR] = {
        ["displayName"] = "Blessed Generator",
        ["description"] = "Increase emeralds dropped in the team generator for the next 60 seconds. Purchase again to reset the duration.",
        ["defaultDuration"] = 60,
        ["applyCooldown"] = true,
        ["baseCost"] = 6,
        ["applyMultiplier"] = false
    },
    [v4.BED_DEFENSE_LAYER] = {
        ["displayName"] = "Bed Defense Layer",
        ["description"] = "Add an obsidian bed defense layer to your bed. Purchase again to increase the layer (limit 4).",
        ["baseCost"] = 6,
        ["applyMultiplier"] = true,
        ["disableOnBedBreak"] = true,
        ["purchaseLimit"] = {
            ["totalCountLimit"] = 4
        }
    },
    [v4.CLINGY] = {
        ["displayName"] = "Clingy",
        ["description"] = "Half of your resources are kept on your next death. Purchase again to reset the status duration for your team.",
        ["defaultDuration"] = 300,
        ["applyVisualEffect"] = true,
        ["applyCooldown"] = true,
        ["baseCost"] = 4,
        ["applyMultiplier"] = false,
        ["disableOnBedBreak"] = true,
        ["statusEffect"] = v3.SNAKE_CLINGY,
        ["image"] = v2.CLINGY_ELEMENT
    },
    [v4.SHOP_REBATE] = {
        ["displayName"] = "Shop Rebate",
        ["description"] = "Get a shop rebate when making purchases. Purchase again to increase your discount.",
        ["defaultDuration"] = 300,
        ["applyVisualEffect"] = true,
        ["applyCooldown"] = true,
        ["baseCost"] = 4,
        ["applyMultiplier"] = true,
        ["statusEffect"] = v3.SNAKE_SHOP_REBATE,
        ["image"] = v2.LUNAR_COIN_ICON
    },
    [v4.RECYCLE] = {
        ["displayName"] = "Recycle Consumables",
        ["description"] = "Consumables have a chance to be recycled, so they aren\'t consumed. Purchase again to reset the status duration for your team.",
        ["defaultDuration"] = 300,
        ["applyVisualEffect"] = true,
        ["applyCooldown"] = true,
        ["baseCost"] = 4,
        ["applyMultiplier"] = true,
        ["statusEffect"] = v3.SNAKE_RECYCLE,
        ["image"] = v2.SNAKE_RECYCLE
    },
    [v4.SNAKE_AGILITY] = {
        ["displayName"] = "Snake\'s Agility",
        ["description"] = "Gain a speed buff if your health drops below 30%. Lost after your first use. Purchase again to reset the status duration for your team.",
        ["defaultDuration"] = 300,
        ["applyVisualEffect"] = true,
        ["applyCooldown"] = true,
        ["baseCost"] = 3,
        ["applyMultiplier"] = false,
        ["image"] = v2.SNAKE_ICON
    },
    [v4.ENCHANT_DISCOUNT] = {
        ["displayName"] = "Enchant Discount",
        ["description"] = "Discounted enchants for the next 60 seconds. Purchase again to reset the duration.",
        ["defaultDuration"] = 60,
        ["applyVisualEffect"] = true,
        ["applyCooldown"] = true,
        ["baseCost"] = 6,
        ["applyMultiplier"] = false,
        ["statusEffect"] = v3.SNAKE_ENCHANT_DISCOUNT,
        ["image"] = v2.FORTUNE_ENCHANT
    },
    [v4.VENGEFUL_VENOM] = {
        ["displayName"] = "Vengeful Venom",
        ["description"] = "When attacked, there\'s a chance to apply poison damage to the attacker. On death, release a poison cloud. Purchase multiple times to increase the strength of the poison.",
        ["defaultDuration"] = 300,
        ["applyVisualEffect"] = true,
        ["applyCooldown"] = true,
        ["baseCost"] = 4,
        ["applyMultiplier"] = true,
        ["statusEffect"] = v3.VENGEFUL_VENOM,
        ["purchaseLimit"] = {
            ["activeCountLimit"] = 5
        },
        ["image"] = v2.VENGEFUL_VENOM
    }
}
return {
    ["teamBuffMeta"] = v5
}