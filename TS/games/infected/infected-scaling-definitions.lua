local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType
local v6 = {}
local v7 = v5.TANK
local v8 = {
    ["scalingTiers"] = {
        {
            ["minPointsRequired"] = 0,
            ["maxHealthScaling"] = 0,
            ["weaponScaling"] = v4.WOOD_SWORD,
            ["progressBarIcon"] = v3(v4.WOOD_SWORD).image
        },
        {
            ["minPointsRequired"] = 200,
            ["maxHealthScaling"] = 25,
            ["weaponScaling"] = v4.STONE_SWORD,
            ["additionalItems"] = { v4.IRON_PICKAXE },
            ["progressBarIcon"] = v3(v4.STONE_SWORD).image
        },
        {
            ["minPointsRequired"] = 450,
            ["maxHealthScaling"] = 100,
            ["sledgehammerDamage"] = 20,
            ["weaponScaling"] = v4.STONE_SWORD,
            ["additionalItems"] = { v4.NOXIOUS_SLEDGEHAMMER },
            ["progressBarIcon"] = v3(v4.NOXIOUS_SLEDGEHAMMER).image
        },
        {
            ["minPointsRequired"] = 800,
            ["maxHealthScaling"] = 150,
            ["sledgehammerDamage"] = 30,
            ["weaponScaling"] = v4.IRON_SWORD,
            ["additionalItems"] = { v4.DIAMOND_PICKAXE },
            ["progressBarIcon"] = v3(v4.IRON_SWORD).image
        },
        {
            ["minPointsRequired"] = 1200,
            ["maxHealthScaling"] = 250,
            ["sledgehammerDamage"] = 50,
            ["weaponScaling"] = v4.IRON_SWORD,
            ["progressBarIcon"] = v2.INFECTED_HEALTH
        },
        {
            ["minPointsRequired"] = 1800,
            ["maxHealthScaling"] = 400,
            ["sledgehammerDamage"] = 80,
            ["weaponScaling"] = v4.DIAMOND_SWORD,
            ["progressBarIcon"] = v3(v4.DIAMOND_SWORD).image
        }
    },
    ["defaultScalingWeapon"] = v4.WOOD_SWORD
}
v6[v7] = v8
local v9 = v5.DISRUPTOR
local v10 = {
    ["scalingTiers"] = {
        {
            ["minPointsRequired"] = 0,
            ["maxHealthScaling"] = 0,
            ["weaponScaling"] = v4.WOOD_SWORD,
            ["progressBarIcon"] = v3(v4.WOOD_SWORD).image
        },
        {
            ["minPointsRequired"] = 200,
            ["maxHealthScaling"] = 25,
            ["weaponScaling"] = v4.STONE_SWORD,
            ["additionalItems"] = { v4.IRON_PICKAXE },
            ["progressBarIcon"] = v3(v4.STONE_SWORD).image
        },
        {
            ["minPointsRequired"] = 550,
            ["maxHealthScaling"] = 50,
            ["weaponScaling"] = v4.IRON_SWORD,
            ["progressBarIcon"] = v3(v4.IRON_SWORD).image
        },
        {
            ["minPointsRequired"] = 1100,
            ["maxHealthScaling"] = 100,
            ["weaponScaling"] = v4.DIAMOND_SWORD,
            ["additionalItems"] = { v4.DIAMOND_PICKAXE },
            ["progressBarIcon"] = v3(v4.DIAMOND_SWORD).image
        },
        {
            ["minPointsRequired"] = 1800,
            ["maxHealthScaling"] = 200,
            ["weaponScaling"] = v4.DIAMOND_SWORD,
            ["progressBarIcon"] = v2.INFECTED_HEALTH
        }
    },
    ["defaultScalingWeapon"] = v4.WOOD_SWORD
}
v6[v9] = v10
local v11 = v5.RUSH
local v12 = {
    ["scalingTiers"] = {
        {
            ["minPointsRequired"] = 0,
            ["maxHealthScaling"] = 0,
            ["weaponScaling"] = v4.WOOD_DAGGER,
            ["progressBarIcon"] = v2.WOOD_DAGGER
        },
        {
            ["minPointsRequired"] = 200,
            ["maxHealthScaling"] = 0,
            ["weaponScaling"] = v4.STONE_DAGGER,
            ["progressBarIcon"] = v2.STONE_DAGGER
        },
        {
            ["minPointsRequired"] = 500,
            ["maxHealthScaling"] = 25,
            ["weaponScaling"] = v4.IRON_DAGGER,
            ["progressBarIcon"] = v2.IRON_DAGGER
        },
        {
            ["minPointsRequired"] = 850,
            ["maxHealthScaling"] = 75,
            ["weaponScaling"] = v4.IRON_DAGGER,
            ["additionalItems"] = { v4.IRON_PICKAXE },
            ["progressBarIcon"] = v2.INFECTED_HEALTH
        },
        {
            ["minPointsRequired"] = 1300,
            ["maxHealthScaling"] = 125,
            ["weaponScaling"] = v4.DIAMOND_DAGGER,
            ["progressBarIcon"] = v2.DIAMOND_DAGGER
        },
        {
            ["minPointsRequired"] = 1900,
            ["maxHealthScaling"] = 175,
            ["weaponScaling"] = v4.MYTHIC_DAGGER,
            ["additionalItems"] = { v4.DIAMOND_PICKAXE },
            ["progressBarIcon"] = v2.MYTHIC_DAGGER
        }
    },
    ["defaultScalingWeapon"] = v4.WOOD_DAGGER
}
v6[v11] = v12
local v13 = v5.PROWLER
local v14 = {
    ["scalingTiers"] = {
        {
            ["minPointsRequired"] = 0,
            ["maxHealthScaling"] = 0,
            ["weaponScaling"] = v4.WOOD_SWORD,
            ["progressBarIcon"] = v3(v4.WOOD_SWORD).image
        },
        {
            ["minPointsRequired"] = 200,
            ["maxHealthScaling"] = 25,
            ["weaponScaling"] = v4.STONE_SWORD,
            ["progressBarIcon"] = v3(v4.STONE_SWORD).image
        },
        {
            ["minPointsRequired"] = 550,
            ["maxHealthScaling"] = 50,
            ["weaponScaling"] = v4.IRON_SWORD,
            ["additionalItems"] = { v4.IRON_PICKAXE },
            ["progressBarIcon"] = v3(v4.IRON_SWORD).image
        },
        {
            ["minPointsRequired"] = 1100,
            ["maxHealthScaling"] = 100,
            ["weaponScaling"] = v4.DIAMOND_SWORD,
            ["progressBarIcon"] = v3(v4.DIAMOND_SWORD).image
        },
        {
            ["minPointsRequired"] = 1800,
            ["maxHealthScaling"] = 200,
            ["weaponScaling"] = v4.DIAMOND_SWORD,
            ["additionalItems"] = { v4.DIAMOND_PICKAXE },
            ["progressBarIcon"] = v2.INFECTED_HEALTH
        }
    },
    ["defaultScalingWeapon"] = v4.WOOD_SWORD
}
v6[v13] = v14
return {
    ["INFECTED_SCALING_DEFINITION"] = v6
}