local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta")
local u3 = v2.ArmorEnchantMeta
local u4 = v2.EnchantMeta
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type")
local u6 = v5.ArmorEnchantType
local u7 = v5.WeaponEnchantType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "ninja", "ninja-kit-balance").NinjaKitBalance
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "markup", "markup-util").MarkupUtil
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-category").PvPArenaAugmentCategory
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-class").PvPArenaAugmentClass
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u73 = {
    [v17.INVISIBILITY_JUTSU] = {
        ["displayName"] = "Invisibility Jutsu",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 28 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            return {
                ["duration"] = u8.INVISIBILITY_DURATION
            }
        end,
        ["description"] = function(p18) --[[ Name: description, Line 33 ]]
            local v19 = p18.duration
            return "When struck by a melee attack, become invisible for the next [g]" .. tostring(v19) .. "[/g] seconds."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v13[v14.NINJA_INVISIBLE].image
    },
    [v17.FLEET_FOOTED] = {
        ["displayName"] = "Fleet Footed",
        ["rarityWeight"] = 1,
        ["config"] = function() --[[ Name: config, Line 44 ]]
            return {
                ["speedMultiplier"] = 1.2
            }
        end,
        ["description"] = function(p20) --[[ Name: description, Line 49 ]]
            local v21 = (1 - p20.speedMultiplier) * 100
            local v22 = math.round(v21)
            local v23 = math.abs(v22)
            return "Increase speed by [g]+" .. tostring(v23) .. "%[/g]."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.STAT,
        ["image"] = v13[v14.SPEED_BOOST].image
    },
    [v17.BULK_UP] = {
        ["displayName"] = "Bulk Up",
        ["rarityWeight"] = 1,
        ["config"] = function() --[[ Name: config, Line 59 ]]
            return {
                ["maxHealthIncrease"] = 10
            }
        end,
        ["description"] = function(p24) --[[ Name: description, Line 64 ]]
            local v25 = p24.maxHealthIncrease
            return "Increase max health by [g]+" .. tostring(v25) .. "[/g]."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.STAT,
        ["image"] = v9.INFECTED_HEALTH
    },
    [v17.TRIUMPH] = {
        ["displayName"] = "Triumph",
        ["rarityWeight"] = 1,
        ["config"] = function() --[[ Name: config, Line 74 ]] end,
        ["description"] = function(_) --[[ Name: description, Line 75 ]]
            return "Winning a match regen 5 team health."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.INFECTED_HEALTH
    },
    [v17.BULLY] = {
        ["displayName"] = "Bully",
        ["rarityWeight"] = 1,
        ["config"] = function() --[[ Name: config, Line 85 ]] end,
        ["description"] = function(_) --[[ Name: description, Line 86 ]]
            return "Gain a stack of bully whenever you Kill a player. When you lose, lose stacks and gain reward based on the stacks"
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.HAND_FIST_ICON
    },
    [v17.INVEST] = {
        ["displayName"] = "Invest",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 96 ]]
            return {
                ["interestPercentage"] = 5
            }
        end,
        ["description"] = function(p26) --[[ Name: description, Line 101 ]]
            local v27 = p26.interestPercentage
            return "Gain [g]+" .. tostring(v27) .. "%[/g] interest each round based on your unspent gold."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.PLUNDER_ELEMENT
    },
    [v17.PROJECTILE_DAMAGE] = {
        ["displayName"] = "Projectile Damage",
        ["rarityWeight"] = 1,
        ["config"] = function() --[[ Name: config, Line 112 ]]
            return {
                ["damagePercentIncrease"] = 20
            }
        end,
        ["description"] = function(p28) --[[ Name: description, Line 117 ]]
            local v29 = p28.damagePercentIncrease
            return "Increase damage of projectiles by [g]+" .. tostring(v29) .. "%[/g]."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.STAT,
        ["image"] = v9.BOW_ARROW_ICON_SOLID
    },
    [v17.SWORD_DAMAGE] = {
        ["displayName"] = "Sword Damage",
        ["rarityWeight"] = 1,
        ["config"] = function() --[[ Name: config, Line 127 ]]
            return {
                ["damagePercentIncrease"] = 10
            }
        end,
        ["description"] = function(p30) --[[ Name: description, Line 132 ]]
            local v31 = p30.damagePercentIncrease
            return "Increase damage of swords by [g]+" .. tostring(v31) .. "%[/g]."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.STAT,
        ["image"] = v9.SWORD_ICON
    },
    [v17.HEALTH_REGEN] = {
        ["displayName"] = "Health Regen",
        ["rarityWeight"] = 1,
        ["config"] = function() --[[ Name: config, Line 142 ]]
            return {
                ["healthGainedPerSecond"] = 1
            }
        end,
        ["description"] = function(p32) --[[ Name: description, Line 147 ]]
            local v33 = p32.healthGainedPerSecond
            return "Regenerate [g]+" .. tostring(v33) .. "[/g] health per second."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.INFECTED_HEALTH
    },
    [v17.WEAPON_MASTER] = {
        ["displayName"] = "Weapon Master",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 157 ]] end,
        ["description"] = function(_) --[[ Name: description, Line 158 ]]
            return "Gain a random temporary special weapon everyround."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v9.SWORD_ICON
    },
    [v17.DECAYING_SHIELD] = {
        ["displayName"] = "Decaying Shield",
        ["rarityWeight"] = 1,
        ["config"] = function() --[[ Name: config, Line 169 ]]
            return {
                ["initialShieldAmount"] = 25
            }
        end,
        ["description"] = function(p34) --[[ Name: description, Line 174 ]]
            local v35 = p34.initialShieldAmount
            return "At the start of each round, receive a [g]+" .. tostring(v35) .. "[/g] shield that decays over time."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.SHIELD_GEN_ELEMENT
    },
    [v17.BAKERS_DELIGHT] = {
        ["displayName"] = "Baker\'s Delight",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 184 ]]
            return {
                ["appleAmount"] = 2,
                ["pieAmount"] = 1
            }
        end,
        ["description"] = function(p36) --[[ Name: description, Line 190 ]]
            local v37 = p36.appleAmount
            local v38 = tostring(v37)
            local v39 = p36.pieAmount
            return "At the start of each round, receive " .. v38 .. " apples and " .. tostring(v39) .. " speed pie."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v10(v11.APPLE).image
    },
    [v17.RESOURCEFUL] = {
        ["displayName"] = "Resourceful",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 201 ]]
            return {
                ["percentGainedResources"] = 20
            }
        end,
        ["description"] = function(p40) --[[ Name: description, Line 206 ]]
            local v41 = p40.percentGainedResources
            return "Receive an additional [g]+" .. tostring(v41) .. "%[/g] resources upon collection."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.GIFTS_SOLID
    },
    [v17.SHOPPING_SPREE] = {
        ["displayName"] = "Shopping Spree",
        ["rarityWeight"] = 1,
        ["config"] = function() --[[ Name: config, Line 217 ]]
            return {
                ["shopDiscountPercentPerStack"] = 5,
                ["minimumPriceMultiplier"] = 0.2
            }
        end,
        ["description"] = function(p42) --[[ Name: description, Line 223 ]]
            local v43 = p42.shopDiscountPercentPerStack
            return "Get [g]" .. tostring(v43) .. "%[/g] shop discount on every item."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.PLUNDER_ELEMENT
    },
    [v17.TARGETED_STRIKE] = {
        ["displayName"] = "Targeted Strike",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 233 ]]
            return {
                ["markedPercentDamageIncrease"] = 20
            }
        end,
        ["description"] = function(p44) --[[ Name: description, Line 238 ]]
            local v45 = p44.markedPercentDamageIncrease
            return "Projectiles will mark a single enemy. Marked enemies take [g]+" .. tostring(v45) .. "%[/g] more damage."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.TURRET_CROSSHAIR
    },
    [v17.TERRA_KICK] = {
        ["displayName"] = "Block-wondo",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 249 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 252 ]]
            return "Get Terra\'s [g]block kick ability[/g]."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ABILITY,
        ["image"] = v9.BLOCK_KICK
    },
    [v17.ELEKTRA_DASH] = {
        ["displayName"] = "Electric Dashes",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 263 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 266 ]]
            return "Get an [g]Elektra Dash[/g] ability."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ABILITY,
        ["image"] = v9.ELECTRIC_DASH_ICON
    },
    [v17.VOID_REGENT_AXE] = {
        ["displayName"] = "Axe of Doom",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 277 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 280 ]]
            return "Receive a [g]Void Axe[/g]."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v10(v11.VOID_AXE).image
    },
    [v17.DWARF] = {
        ["displayName"] = "Dwarf",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 291 ]]
            return {
                ["walkSpeedMultiplier"] = 1.4,
                ["maxHealthMultiplier"] = 0.7,
                ["sizeMultiplier"] = 0.7
            }
        end,
        ["description"] = function(p46) --[[ Name: description, Line 298 ]]
            local v47 = (1 - p46.sizeMultiplier) * 100
            local v48 = math.round(v47)
            local v49 = math.abs(v48)
            local v50 = tostring(v49)
            local v51 = (1 - p46.walkSpeedMultiplier) * 100
            local v52 = math.round(v51)
            local v53 = math.abs(v52)
            local v54 = tostring(v53)
            local v55 = (1 - p46.maxHealthMultiplier) * 100
            local v56 = math.round(v55)
            local v57 = math.abs(v56)
            return "Become [g]+" .. v50 .. "%[/g] smaller, move [g]+" .. v54 .. "%[/g] faster, but lose [r]-" .. tostring(v57) .. "%[/r] health."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.STAT
    },
    [v17.GOLIATH] = {
        ["displayName"] = "Goliath",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 308 ]]
            return {
                ["walkSpeedMultiplier"] = 0.8,
                ["maxHealthMultiplier"] = 1.5,
                ["sizeMultiplier"] = 1.3
            }
        end,
        ["description"] = function(p58) --[[ Name: description, Line 315 ]]
            local v59 = (1 - p58.sizeMultiplier) * 100
            local v60 = math.round(v59)
            local v61 = math.abs(v60)
            local v62 = tostring(v61)
            local v63 = (1 - p58.maxHealthMultiplier) * 100
            local v64 = math.round(v63)
            local v65 = math.abs(v64)
            local v66 = tostring(v65)
            local v67 = (1 - p58.walkSpeedMultiplier) * 100
            local v68 = math.round(v67)
            local v69 = math.abs(v68)
            return "Become [g]+" .. v62 .. "%[/g] larger, gaining [g]+" .. v66 .. "%[/g] health, but move [r]-" .. tostring(v69) .. "%[/r] slower."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.STAT
    },
    [v17.MELODY_GUITAR] = {
        ["displayName"] = "Rhythm of the Heart",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 325 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 328 ]]
            return "Receive a [g]Melody Guitar[/g]. Play a tune that heals a nearby ally."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v10(v11.GUITAR).image,
        ["soloModify"] = {
            ["disabled"] = true
        }
    },
    [v17.FOREST_ENCHANT] = {
        ["displayName"] = "Forest Enchant",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 342 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 345 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u7
            --]]
            return "Gain [n]Forest[/n] Enchant. " .. u4[u7.FOREST].description
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ENCHANT,
        ["image"] = u4[u7.FOREST].image
    },
    [v17.STATIC_ENCHANT] = {
        ["displayName"] = "Static Enchant",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 356 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 359 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u7
            --]]
            return "Gain [n]Static[/n] Enchant. " .. u4[u7.STATIC].description
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ENCHANT,
        ["image"] = u4[u7.STATIC].image
    },
    [v17.CLOUD_ENCHANT] = {
        ["displayName"] = "Cloud Enchant",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 370 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 373 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u6
            --]]
            return "Gain [n]Cloud[/n] Enchant. " .. u3[u6.CLOUD].description
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.ENCHANT,
        ["image"] = u3[u6.CLOUD].image
    },
    [v17.LIFESTEAL_ENCHANT] = {
        ["displayName"] = "Lifesteal Enchant",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 384 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 387 ]]
            return "Gain [n]Lifesteal[/n] Enchant. Your attacks heal you for a percentage of the damage you deal."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ENCHANT,
        ["image"] = v9.LIFE_STEAL_ELEMENT
    },
    [v17.FIRE_ENCHANT] = {
        ["displayName"] = "Fire Enchant",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 398 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 401 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u7
            --]]
            return "Gain [n]Fire[/n] Enchant. " .. u4[u7.FIRE].description
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ENCHANT,
        ["image"] = u4[u7.FIRE].image
    },
    [v17.BERSERKER_ENCHANT] = {
        ["displayName"] = "Berserker Enchant",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 412 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 415 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u7
            --]]
            return "Gain [n]Berserker[/n] Enchant. " .. u4[u7.BERSERKER].description
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ENCHANT,
        ["image"] = u4[u7.BERSERKER].image
    },
    [v17.CRITICAL_STRIKE_ENCHANT] = {
        ["displayName"] = "Critical Strike Enchant",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 426 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 429 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u7
            --]]
            return "Gain [n]Critical Strike[/n] Enchant. " .. u4[u7.CRITICAL_STRIKE].description
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ENCHANT,
        ["image"] = u4[u7.CRITICAL_STRIKE].image
    },
    [v17.EXECUTE_ENCHANT] = {
        ["displayName"] = "Execute Enchant",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 440 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 443 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u7
            --]]
            return "Gain [n]Execute[/n] Enchant. " .. u4[u7.EXECUTE].description
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ENCHANT,
        ["image"] = u4[u7.EXECUTE].image
    },
    [v17.TESLA] = {
        ["displayName"] = "Electric",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 454 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 457 ]]
            return "Unlock tesla traps in the shop."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v10(v11.TESLA_TRAP).image
    },
    [v17.FLOWER_BOW] = {
        ["displayName"] = "Flower Power",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 468 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 471 ]]
            return "Gain a [g]flower bow[/g] and unlocks flower projectiles weapons in shop."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ITEM
    },
    [v17.TRIPLE_SHOT] = {
        ["displayName"] = "Triple Threat",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 481 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 484 ]]
            return "Gain the ability to load and shoot three projectiles from bows."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.BOW_ARROW_ICON_SOLID
    },
    [v17.SHIELDER] = {
        ["displayName"] = "Back at Ya!",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 495 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 498 ]]
            return "Gain an [g]Infernal Shield[/g] that will reflect incoming projectiles."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v10(v11.INFERNAL_SHIELD).image
    },
    [v17.FLY] = {
        ["displayName"] = "Sky\'s the Limit",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 509 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 512 ]]
            return "Gain a [g]flying backpack[/g]."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v10(v11.FLYING_BACKPACK).image
    },
    [v17.SPIKEY_SPIKES] = {
        ["displayName"] = "Spiky Spike",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 523 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 526 ]]
            return "Gain a [g]spike shell backpack[/g] that reflects damage on melee attacks."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v10(v11.SPIKE_SHELL_BACKPACK).image
    },
    [v17.GOLDEN_APPLE] = {
        ["displayName"] = "Golden Bite",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 537 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 540 ]]
            return "Gain a [g]golden apple[/g] when you respawn. Consuming it grants large amount of health and a regen buff."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v10(v11.GOLDEN_APPLE).image
    },
    [v17.AXOLOTL] = {
        ["displayName"] = "Axolotl Defense",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 551 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 554 ]]
            return "Gain [g]axolotls[/g] grants shield, health regen and damage."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.PASSIVE
    },
    [v17.AERY] = {
        ["displayName"] = "Trainer",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 564 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 567 ]]
            return "Killing an enemy will permanently increase your damage."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v9.BUTTERFLY_RENDER
    },
    [v17.MINER] = {
        ["displayName"] = "Digging Deeper",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 578 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 581 ]]
            return "Killing an enemy will turn them into a statue, breaking it will grant gold."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.PASSIVE
    },
    [v17.SEAHORSE] = {
        ["displayName"] = "Best buddy",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 591 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 594 ]]
            return "Gain a [g]seahorse[/g] that progressively grows stronger with kills and over the rounds. Your buddy will attack enemies and heal your team."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.PASSIVE
    },
    [v17.SHARED_HEALING] = {
        ["displayName"] = "Healing Bond",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 604 ]]
            return {
                ["healingMultiplier"] = 0.5
            }
        end,
        ["description"] = function(p70) --[[ Name: description, Line 609 ]]
            local v71 = p70.healingMultiplier * 100
            local v72 = math.round(v71)
            return "Whenever you heal, your nearby teammate also receive [g]+" .. tostring(v72) .. "%[/g] of the healing."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["soloModify"] = {
            ["disabled"] = true
        },
        ["image"] = v9.HEART
    },
    [v17.BARBARIAN] = {
        ["displayName"] = "Barbaric Rage",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 622 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 625 ]]
            return "Stack rage by damaging players, the more rage the better your sword. You keep your current sword."
        end,
        ["augmentCategory"] = v15.GOLD,
        ["augmentClass"] = v16.PASSIVE,
        ["image"] = v10(v11.RAGEBLADE).image
    },
    [v17.COBALT] = {
        ["displayName"] = "Recharge",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 636 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 639 ]]
            return "Drop batteries that will grant you a [g]shield[/g] and [g]health regen[/g]."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.PASSIVE
    },
    [v17.MARROW] = {
        ["displayName"] = "Catch Me If You Can!",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 649 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 652 ]]
            return "Leave a trail of [g]poison cloud[/g] that will slow enemies and deal damage over time."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ABILITY,
        ["image"] = v9.SKELETON_KIT_ABILITY_ICON
    },
    [v17.FORTUNA] = {
        ["displayName"] = "Heart of the Cards",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 663 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 666 ]]
            return "Gain and upgrade [g]card throwing ability[/g] from damaging players."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ABILITY,
        ["image"] = v9.CARD_THROW
    },
    [v17.EVELYNN] = {
        ["displayName"] = "Sharp Spirits",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 677 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 680 ]]
            return "Drop a [g]spirit dagger[/g] when damaging an enemy. Picking it up will instantly teleport and gain an attack buff for a short duration."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ABILITY,
        ["image"] = v10(v11.SPIRIT_DAGGER).image
    },
    [v17.TRIXIE] = {
        ["displayName"] = "Riftwalking",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 691 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 694 ]]
            return "Gain [g]riftwalk ability[/g] and warp ahead and create a portal that you can return to later. Gives you Rift Madness."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ABILITY,
        ["image"] = v9.VOID_WALKER_REWIND_ICON
    },
    [v17.MARTIN] = {
        ["displayName"] = "Cactus Splines",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 705 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 708 ]]
            return "Gain a [g]cactus ability[/g] that siphons life essence from nearby enemies and converts it to max HP permanently."
        end,
        ["augmentCategory"] = v15.PRISMATIC,
        ["augmentClass"] = v16.ABILITY,
        ["image"] = v9.CACTUS_BALL
    },
    [v17.LASSO] = {
        ["displayName"] = "Wrangler",
        ["rarityWeight"] = 1,
        ["unique"] = true,
        ["config"] = function() --[[ Name: config, Line 719 ]]
            return {}
        end,
        ["description"] = function(_) --[[ Name: description, Line 722 ]]
            return "Gain [g]lasso[/g] that can be used to bring enemies to you."
        end,
        ["augmentCategory"] = v15.SILVER,
        ["augmentClass"] = v16.ITEM,
        ["image"] = v10(v11.LASSO).image
    }
}
return {
    ["getPvPArenaAugmentMeta"] = function(p74) --[[ Name: getPvPArenaAugmentMeta, Line 732 ]]
        --[[
        Upvalues:
            [1] = u73
        --]]
        return u73[p74]
    end,
    ["getPvPArenaAugmentConfig"] = function(p75) --[[ Name: getPvPArenaAugmentConfig, Line 735 ]]
        --[[
        Upvalues:
            [1] = u73
        --]]
        return u73[p75].config()
    end,
    ["getPvPArenaAugmentDescription"] = function(p76, p77) --[[ Name: getPvPArenaAugmentDescription, Line 743 ]]
        --[[
        Upvalues:
            [1] = u73
            [2] = u12
        --]]
        local v78 = u73[p76]
        local v79 = u73[p76].config()
        if p77 then
            local v80 = v78.description
            if type(v80) == "function" then
                return u12:removeMarkup(v78.description(v79))
            else
                return u12:removeMarkup(v78.description)
            end
        else
            local v81 = v78.description
            if type(v81) == "function" then
                return u12:transformMarkup(v78.description(v79))
            else
                return u12:transformMarkup(v78.description)
            end
        end
    end,
    ["PVP_ARENA_AUGMENT_META"] = u73
}