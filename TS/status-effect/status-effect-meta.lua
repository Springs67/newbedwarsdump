local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cursed-coffin-balance").CursedCoffinBalance
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "frankenstein-curse-balance").FrankensteinCurseBalance
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "infernal-shield-balance").InfernalShieldBalance
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "spider-queen-balance").SpiderQueenBalance
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta")
local v8 = v7.ArmorEnchantMeta
local v9 = v7.EnchantMeta
local v10 = v7.ToolEnchantMeta
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type")
local v12 = v11.ArmorEnchantType
local v13 = v11.ToolEnchantType
local v14 = v11.WeaponEnchantType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "slime-tamer", "slime-util").HEAL_SLIME_INTERVAL_SECONDS
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-gardener", "spirit-gardener-balance").SpiritGardenerKitBalance
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants")
local v22 = v21.GOLEM_VARIANT_BLESSING_DAMAGE_PERCENT_INCREASE
local v23 = v21.SPIRIT_GOLEM_BLESSING_MAX_HEAL_PERCENT
local v24 = v21.SPIRIT_GOLEM_BLESSING_TICK_RATE
local v25 = v21.TITAN_BLESSING_DAMAGE_PERCENT_INCREASE
local v26 = v21.TITAN_BLESSING_RECALL_REDUCTION
local v27 = v21.VOID_GOLEM_TRUE_DAMAGE_PERCENT
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "visualizer", "visualizer-type").VisualizerCategory
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-category").StatusEffectCategory
local v30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local v31 = {
    [v30.ENCHANT_FIRE] = {
        ["displayName"] = "Fire Enchant",
        ["image"] = v18.FIRE_ENCHANT,
        ["description"] = v9[v14.FIRE].description,
        ["category"] = v29.ENCHANT,
        ["visualizer"] = v28.Fire
    },
    [v30.ENCHANT_STATIC] = {
        ["displayName"] = "Static Enchant",
        ["image"] = v18.STATIC_ENCHANT,
        ["description"] = v9[v14.STATIC].description,
        ["category"] = v29.ENCHANT,
        ["visualizer"] = v28.Static
    },
    [v30.ENCHANT_EXECUTE] = {
        ["displayName"] = "Execute Enchant",
        ["image"] = v18.EXECUTE_ENCHANT,
        ["description"] = v9[v14.EXECUTE].description,
        ["category"] = v29.ENCHANT
    },
    [v30.ENCHANT_CRITICAL_STRIKE] = {
        ["displayName"] = "Critical Strike Enchant",
        ["image"] = v18.CRITICAL_STRIKE_ENCHANT,
        ["description"] = v9[v14.CRITICAL_STRIKE].description,
        ["category"] = v29.ENCHANT
    },
    [v30.ENCHANT_BERSERKER] = {
        ["displayName"] = "Berserker Enchant",
        ["image"] = v18.BERSERKER_ENCHANT,
        ["description"] = v9[v14.BERSERKER].description,
        ["category"] = v29.ENCHANT,
        ["visualizer"] = v28.Berserker
    },
    [v30.ENCHANT_FOREST] = {
        ["displayName"] = "Forest Enchant",
        ["image"] = v18.FOREST_ENCHANT,
        ["description"] = v9[v14.FOREST].description,
        ["category"] = v29.ENCHANT
    },
    [v30.ENCHANT_SOUL_REAVER] = {
        ["displayName"] = "Soul Reaver Enchant",
        ["image"] = v18.SOUL_REAVER_ENCHANT,
        ["description"] = v9[v14.SOUL_REAVER].description,
        ["category"] = v29.ENCHANT,
        ["visualizer"] = v28.SoulReaver
    },
    [v30.ENCHANT_CLOUD] = {
        ["displayName"] = "Cloud Enchant",
        ["image"] = v18.CLOUD_ENCHANT,
        ["description"] = v8[v12.CLOUD].description,
        ["category"] = v29.ENCHANT
    },
    [v30.ENCHANT_CLEAVE] = {
        ["displayName"] = "Cleave Enchant",
        ["image"] = v18.CLEAVE_ENCHANT,
        ["description"] = v9[v14.CLEAVE].description,
        ["category"] = v29.ENCHANT,
        ["visualizer"] = v28.Cleave
    },
    [v30.ARMOR_ENCHANT_ABSORPTION] = {
        ["displayName"] = "Absorption Armor Enchant",
        ["image"] = v18.ABSORPTION_ARMOR_ENCHANT,
        ["description"] = v8[v12.ABSORPTION].description,
        ["category"] = v29.ENCHANT
    },
    [v30.ARMOR_ENCHANT_BLOCKING] = {
        ["displayName"] = "Blocking Armor Enchant",
        ["image"] = v18.BLOCKING_ARMOR_ENCHANT,
        ["description"] = v8[v12.BLOCKING].description,
        ["category"] = v29.ENCHANT
    },
    [v30.ARMOR_ENCHANT_FROST] = {
        ["displayName"] = "Frost Armor Enchant",
        ["image"] = v18.FROST_ARMOR_ENCHANT,
        ["description"] = v8[v12.FROST].description,
        ["category"] = v29.ENCHANT
    },
    [v30.ARMOR_ENCHANT_SWIFT] = {
        ["displayName"] = "Swift Armor Enchant",
        ["image"] = v18.SWIFT_ARMOR_ENCHANT,
        ["description"] = v8[v12.SWIFT].description,
        ["category"] = v29.ENCHANT
    },
    [v30.ARMOR_ENCHANT_ENDURANCE] = {
        ["displayName"] = "Stoneguard Armor Enchant",
        ["showZeroStacks"] = true,
        ["image"] = v18.ENDURANCE_ARMOR_ENCHANT,
        ["description"] = v8[v12.ENDURANCE].description,
        ["category"] = v29.ENCHANT
    },
    [v30.ARMOR_ENCHANT_SAFEGUARD] = {
        ["displayName"] = "Sound Barrier Armor Enchant",
        ["image"] = v18.SOUND_BARRIER_ENCHANT,
        ["description"] = v8[v12.SAFEGUARD].description,
        ["category"] = v29.ENCHANT
    },
    [v30.TOOL_ENCHANT_HEAVY_HITTER] = {
        ["displayName"] = "Heavy Hitter Tool Enchant",
        ["image"] = v18.HEAVY_HITTER_TOOL_ENCHANT,
        ["description"] = v10[v13.HEAVY_HITTER].description,
        ["category"] = v29.ENCHANT
    },
    [v30.TOOL_ENCHANT_EXPLOSIVE] = {
        ["displayName"] = "Explosive Tool Enchant",
        ["image"] = v18.EXPLOSIVE_TOOL_ENCHANT,
        ["description"] = v10[v13.EXPLOSIVE].description,
        ["category"] = v29.ENCHANT
    },
    [v30.TOOL_ENCHANT_CRITICAL_STRIKE] = {
        ["displayName"] = "Shatter Strike Tool Enchant",
        ["image"] = v18.SHATTER_STRIKE_TOOL_ENCHANT,
        ["description"] = v10[v13.CRITICAL_STRIKE].description,
        ["category"] = v29.ENCHANT
    },
    [v30.TOOL_ENCHANT_EFFICIENCY] = {
        ["displayName"] = "Efficiency Tool Enchant",
        ["image"] = v18.EFFICIENCY_TOOL_ENCHANT,
        ["description"] = v10[v13.EFFICIENCY].description,
        ["category"] = v29.ENCHANT,
        ["visualizer"] = v28.ToolEnchantEfficiency
    },
    [v30.SPEED_PIE] = {
        ["displayName"] = "Speed Pie",
        ["item"] = v20.PIE
    },
    [v30.LIFE_STEAL_1] = {
        ["displayName"] = "Life Steal",
        ["image"] = v18.LIFE_STEAL_ELEMENT,
        ["visualizer"] = v28.LifeSteal
    },
    [v30.SHIELD_ACTIVE] = {
        ["displayName"] = "Shield Active",
        ["image"] = "rbxassetid://9866786852"
    },
    [v30.SHIELD_DOWN] = {
        ["displayName"] = "Shield On Cooldown",
        ["image"] = v18.PLUNDER_ELEMENT
    },
    [v30.INVISIBILITY] = {
        ["displayName"] = "Invisibility",
        ["image"] = "rbxassetid://15489989448"
    },
    [v30.JUMP] = {
        ["displayName"] = "Jump Boost",
        ["item"] = v20.JUMP_POTION
    },
    [v30.GIANT] = {
        ["displayName"] = "Giant",
        ["item"] = v20.GIANT_POTION
    },
    [v30.SHRINK] = {
        ["displayName"] = "Shrink",
        ["item"] = v20.SHRINK_POTION
    },
    [v30.SPEED] = {
        ["displayName"] = "Speed Boost",
        ["item"] = v20.SPEED_POTION
    },
    [v30.NO_KNOCKBACK] = {
        ["displayName"] = "No Knockback",
        ["image"] = v18.ANTI_KB_ELEMENT
    },
    [v30.BURN] = {
        ["displayName"] = "Burn",
        ["noDisplay"] = true
    },
    [v30.HEAL_OVER_TIME] = {
        ["displayName"] = "Regen",
        ["noDisplay"] = false,
        ["image"] = v18.RAPID_REGEN_ELEMENT
    },
    [v30.GROUNDED] = {
        ["displayName"] = "Grounded",
        ["image"] = v18.GLUE_DEBUFF
    },
    [v30.SILENCE] = {
        ["displayName"] = "Silenced",
        ["noDisplay"] = true
    },
    [v30.SMOKE_INVISIBILITY] = {
        ["displayName"] = "Smoke Invisibility",
        ["item"] = v20.SMOKE_BOMB
    },
    [v30.FORCEFIELD] = {
        ["displayName"] = "Forcefield",
        ["item"] = v20.FORCEFIELD_POTION
    },
    [v30.GROUNDED_ENCHANT] = {
        ["displayName"] = "Sticky",
        ["image"] = v18.GLUE_ELEMENT,
        ["category"] = v29.ENCHANT
    },
    [v30.POISON] = {
        ["displayName"] = "Poison",
        ["image"] = "rbxassetid://9135917252"
    },
    [v30.INFECTED_POISON] = {
        ["displayName"] = "Infected Poison",
        ["noDisplay"] = true
    },
    [v30.BIG_HEAD] = {
        ["displayName"] = "Shrink",
        ["item"] = v20.BIG_HEAD_POTION
    },
    [v30.DECAY] = {
        ["displayName"] = "Decay",
        ["noDisplay"] = true
    },
    [v30.VOID_ASCEND] = {
        ["displayName"] = "Ascended Void Knight",
        ["description"] = "Deal increased damage and gain increased health",
        ["image"] = v18.VOID_KNIGHT_TIER_5
    },
    [v30.DIZZY] = {
        ["displayName"] = "Dizzy",
        ["description"] = "You are dizzy!",
        ["image"] = "rbxassetid://10086864455"
    },
    [v30.SNOW_CONE] = {
        ["displayName"] = "Snow Cone",
        ["description"] = "They\'re tasty!",
        ["image"] = "rbxassetid://10489888403"
    },
    [v30.ENHANCED_PROJECTILE] = {
        ["displayName"] = "Enhanced Projectile",
        ["description"] = "Fire a volley of arrows",
        ["image"] = v18.EYE_ICON_1
    },
    [v30.MAGE_FIRE_ELEMENT] = {
        ["displayName"] = "Mage Fire Element",
        ["keepOnDeath"] = true,
        ["noDisplay"] = true,
        ["image"] = v18.FIRE_ENCHANT
    },
    [v30.MAGE_ICE_ELEMENT] = {
        ["displayName"] = "Mage Ice Element",
        ["keepOnDeath"] = true,
        ["noDisplay"] = true,
        ["image"] = v18.MAGE_ICE_ICON
    },
    [v30.MAGE_NATURE_ELEMENT] = {
        ["displayName"] = "Mage Nature Element",
        ["keepOnDeath"] = true,
        ["noDisplay"] = true,
        ["image"] = v18.LIFE_STEAL_ELEMENT
    },
    [v30.MAGE_BURN] = {
        ["displayName"] = "Mage Burn",
        ["image"] = v18.FIRE_ENCHANT
    },
    [v30.ANTI_TEAMING_BUFF] = {
        ["displayName"] = "Defender\'s Boost",
        ["description"] = "Deal +5% more damage and gain 5 shield per enemy at your team\'s base.",
        ["image"] = v18.FIGHTER_KIT_ICON
    },
    [v30.WORMHOLE_RELIC] = {
        ["displayName"] = "Wormhole",
        ["description"] = "Recall to your home base.",
        ["item"] = v20.WORMHOLE
    },
    [v30.ENHANCED_DEFENSE] = {
        ["displayName"] = "Damage reduction",
        ["noDisplay"] = true
    },
    [v30.IMPRISONED_SOULS] = {
        ["displayName"] = "Imprisoned Souls",
        ["description"] = "Get Break Speed and Shield Gen for each imprisoned soul.",
        ["image"] = v18.STATUS_EFFECT_IMPRISONED_SOULS
    },
    [v30.FROSTY_SHIELD] = {
        ["displayName"] = "Frost Shield",
        ["description"] = "Ice Shield.",
        ["image"] = v18.FROST_SHIELD
    },
    [v30.TITANS_BLESSING] = {
        ["displayName"] = "Titan\'s Blessing",
        ["image"] = v18.TITANS_BLESSING,
        ["description"] = "Deal +" .. tostring(v25) .. "% damage & reduce recall time by " .. tostring(v26) .. "%"
    },
    [v30.SPIRIT_TITANS_BLESSING] = {
        ["displayName"] = "Spirit Titan\'s Blessing",
        ["image"] = v18.SPIRIT_TITANS_BLESSING,
        ["description"] = "Deal +" .. tostring(v22) .. "% damage, heal +" .. tostring(v23) .. " HP per " .. tostring(v24) .. " seconds, and reduce recall time by " .. tostring(v26) .. "%"
    },
    [v30.VOID_TITANS_BLESSING] = {
        ["displayName"] = "Void Titan\'s Blessing",
        ["image"] = v18.VOID_TITANS_BLESSING,
        ["description"] = "Deal +" .. tostring(v22) .. "% damage, deal +" .. tostring(v27) .. "% true damage, and reduce recall time by " .. tostring(v26) .. "%"
    },
    [v30.KILL_STREAK] = {
        ["displayName"] = "Kill Streak Count",
        ["description"] = "Each stack increase damage",
        ["image"] = v18.KILL_STREAK_ICON
    },
    [v30.GOLDEN_APPLE] = {
        ["displayName"] = "Golden Apple",
        ["description"] = "Massive regeneration & damage reduction",
        ["image"] = "rbxassetid://12444096542"
    },
    [v30.BLEED] = {
        ["displayName"] = "Decay",
        ["description"] = "Health will decay over time",
        ["image"] = "rbxassetid://12518331892"
    },
    [v30.ZAPPED_1] = {
        ["displayName"] = "Zapped 1",
        ["description"] = "Healing and shielding reduced by 40%",
        ["image"] = "rbxassetid://12813461592"
    },
    [v30.ZAPPED_2] = {
        ["displayName"] = "Zapped 2",
        ["description"] = "Healing and shielding reduced by 60%",
        ["image"] = "rbxassetid://12813461592"
    },
    [v30.ZAPPED_3] = {
        ["displayName"] = "Zapped 3",
        ["description"] = "Healing and shielding reduced by 85%",
        ["image"] = "rbxassetid://12813461592"
    }
}
local v32 = v30.TRAVELING_MERCHANT_DAMAGE
local v33 = {
    ["displayName"] = "Traveling Merchant\'s Stength",
    ["image"] = "rbxassetid://13418711108",
    ["keepOnDeath"] = true
}
local v34 = (v2.TRAVELING_MERCHANT_DAMAGE_MULTIPLER - 1) * 100
local v35 = math.round(v34)
v33.description = "Deal +" .. tostring(v35) .. "% damage"
v31[v32] = v33
local v36 = v30.TRAVELING_MERCHANT_HEAL
local v37 = {
    ["displayName"] = "Traveling Merchant\'s Vitality",
    ["image"] = "rbxassetid://13418710986",
    ["keepOnDeath"] = true
}
local v38 = v2.TRAVELING_MERCHANT_HEAL_AMOUNT
v37.description = "Heal +" .. tostring(v38) .. " HP per second"
v31[v36] = v37
v31[v30.TASTY] = {
    ["displayName"] = "Tasty",
    ["description"] = "Devourers gain increased speed towards you",
    ["image"] = "rbxassetid://14220394873"
}
v31[v30.DEVOURER_SPEED] = {
    ["displayName"] = "Devourer",
    ["description"] = "Gain increased speed towards players marked with `Tasty` effect",
    ["image"] = "rbxassetid://14220394728"
}
v31[v30.GREASED] = {
    ["displayName"] = "Greasy",
    ["description"] = "Slip and slide, finding traction is tough",
    ["image"] = "rbxassetid://14847434952"
}
v31[v30.STICKY_BOOTS] = {
    ["displayName"] = "Sticky boots",
    ["description"] = "Sprinting and jumping disabled",
    ["image"] = "rbxassetid://14313382740"
}
v31[v30.GOLDEN_EGG] = {
    ["displayName"] = "Golden Egg",
    ["image"] = "rbxassetid://15361547782",
    ["description"] = "Deal +1% damage per stack"
}
v31[v30.WEREWOLF_FEAR] = {
    ["displayName"] = "Frightened",
    ["description"] = "Automatically run away from the werewolf",
    ["image"] = "rbxassetid://15121135194"
}
v31[v30.WEREWOLF] = {
    ["displayName"] = "Werewolf",
    ["description"] = "You have enhanced speed and jump, and can howl to scare your enemies",
    ["image"] = "rbxassetid://15121134924"
}
v31[v30.WEREWOLF_FERAL] = {
    ["displayName"] = "Feral",
    ["description"] = "You take more damage",
    ["image"] = "rbxassetid://15121134924"
}
local v39 = v30.VAMPIRISM
local v40 = {
    ["displayName"] = "Vampirism",
    ["image"] = "rbxassetid://15120314382"
}
local v41 = v3.HUNGRY_ACTIVATION_TIME
v40.description = "Increased max HP and lifesteal, but you must feed every " .. tostring(v41) .. " seconds"
v31[v39] = v40
v31[v30.HUNGRY] = {
    ["displayName"] = "Hungry",
    ["description"] = "Health decreases over time, attack players to feed.",
    ["image"] = "rbxassetid://15120314141"
}
v31[v30.FEEBLE] = {
    ["displayName"] = "Feeble",
    ["description"] = "Max HP reduced",
    ["image"] = "rbxassetid://12518331892"
}
v31[v30.DARK_POWER] = {
    ["displayName"] = "Dark Power",
    ["description"] = "Damage increased",
    ["image"] = "rbxassetid://15120331338"
}
local v42 = v30.FRANKENSTEIN_MONSTER
local v43 = {
    ["displayName"] = "Frankenstein\'s Monster",
    ["image"] = "rbxassetid://15119315143"
}
local v44 = v4.LIGHTNING_DISCHARGE_INTERVAL_SEC
v43.description = "Immune to static damage, and lightning will strike around you every " .. tostring(v44) .. " seconds"
v31[v42] = v43
v31[v30.CURSE_OF_THE_ALTAR] = {
    ["displayName"] = "Curse of the Altar",
    ["description"] = "Permanently take damage over time",
    ["image"] = "rbxassetid://15177278900"
}
v31[v30.SLIME_BUFF_HEALING] = {
    ["displayName"] = "Blessed Slime Buff",
    ["image"] = "rbxassetid://15295059428",
    ["description"] = "Restores missing health every " .. tostring(v15) .. " seconds."
}
v31[v30.SLIME_BUFF_VOID] = {
    ["displayName"] = "Void Slime Buff",
    ["description"] = "Boosts damage on hit enemies.",
    ["image"] = "rbxassetid://15295057154"
}
v31[v30.SLIME_BUFF_STICKY] = {
    ["displayName"] = "Sticky Slime Buff",
    ["description"] = "Attracts nearby rare resources, with a chance to duplicate them.",
    ["image"] = "rbxassetid://15295064061"
}
v31[v30.SLIME_BUFF_FROSTY] = {
    ["displayName"] = "Frosty Slime Buff",
    ["description"] = "Slows the movement speed of hit enemies.",
    ["image"] = "rbxassetid://15295050177"
}
v31[v30.EMPOWERED_KICKS] = {
    ["displayName"] = "Empowered Kicks",
    ["description"] = "Permanently increase damage of Block Kick hits",
    ["image"] = "rbxassetid://15392670831"
}
v31[v30.TOASTY] = {
    ["displayName"] = "Toasty",
    ["description"] = "Immune to effects from the snow",
    ["image"] = "rbxassetid://15625719185"
}
v31[v30.BASE_REGEN] = {
    ["displayName"] = "Base Regen",
    ["description"] = "Regenerate health while near your generator",
    ["image"] = v18.RAPID_REGEN_ELEMENT
}
v31[v30.SOLAR_FLARE] = {
    ["displayName"] = "Solar Flare",
    ["description"] = "Explosive damage triggered at 3 stacks",
    ["image"] = "rbxassetid://16100481573"
}
v31[v30.LUNAR_VENOM] = {
    ["displayName"] = "Lunar Venom",
    ["description"] = "Deals damage over time. Additional damage and infection triggered at 3 stacks",
    ["image"] = "rbxassetid://16100454759"
}
v31[v30.NINJA_SUBSTITUTION_ON_COOLDOWN] = {
    ["displayName"] = "Jutsu Recovering",
    ["description"] = "Can\'t use invisibility jutsu while recovering",
    ["image"] = "rbxassetid://15513969839"
}
v31[v30.NINJA_INVISIBLE] = {
    ["displayName"] = "Invisibility Jutsu",
    ["image"] = "rbxassetid://15513972548",
    ["description"] = "You are invisible"
}
v31[v30.FROSTED] = {
    ["displayName"] = "Frosted",
    ["description"] = "You are slowed. If frosted too much, you will be frozen.",
    ["image"] = "rbxassetid://11611911951"
}
v31[v30.COLD] = {
    ["displayName"] = "Frosted",
    ["description"] = "You are Frosted. If frosted too much, you will be frozen.",
    ["image"] = "rbxassetid://11611911951"
}
v31[v30.COLD_RESIST] = {
    ["displayName"] = "Cold Resistance",
    ["description"] = "Recently Frozen. Gain resistance from Cold.",
    ["image"] = "rbxassetid://15625715830"
}
v31[v30.FROZEN] = {
    ["displayName"] = "Frozen",
    ["image"] = "rbxassetid://15619476034"
}
local v45 = v30.SHIELDER_I
local v46 = {
    ["displayName"] = "Shielder Protection",
    ["image"] = "rbxassetid://7051149149"
}
local v47 = v5.SHIELDER_PASSIVE_DAMAGE_REDUCTION
v46.description = "Your defense is increased by " .. tostring(v47) .. "%"
v31[v45] = v46
local v48 = v30.SHIELDER_II
local v49 = {
    ["displayName"] = "Shielder Protection II",
    ["image"] = "rbxassetid://124327562916665"
}
local v50 = v5.SHIELDER_SHIELD_RAISED_DAMAGE_REDUCTION
v49.description = "Your defense is increased by " .. tostring(v50) .. "%"
v31[v48] = v49
local v51 = v30.SHIELDER_ULT
local v52 = {
    ["displayName"] = "Shielder Protection III",
    ["image"] = "rbxassetid://112133264430467"
}
local v53 = v5.SHIELDER_ULT_DAMAGE_REDUCTION
v52.description = "Your defense is increased by " .. tostring(v53) .. "%"
v31[v51] = v52
v31[v30.FROST_BITE] = {
    ["displayName"] = "Frostbitten",
    ["image"] = "rbxassetid://8216841057",
    ["description"] = "Your armor is decreased by 20%"
}
v31[v30.SHARPENED] = {
    ["displayName"] = "Sharpened",
    ["description"] = "Increased armor penetration",
    ["image"] = "rbxassetid://16122815302"
}
v31[v30.STACKING_DECAY] = {
    ["displayName"] = "Stacking Decay",
    ["description"] = "Health will decay with more stacks",
    ["image"] = "rbxassetid://12518331892"
}
v31[v30.FALCONS_EYE] = {
    ["displayName"] = "Falcon\'s Eye",
    ["description"] = "Ranged attacks against you are guaranteed to critically strike",
    ["image"] = "rbxassetid://16830265561"
}
v31[v30.MENDING_CANOPY_GLIDE] = {
    ["displayName"] = "Glide",
    ["description"] = "Reduced fall speed and no fall damage",
    ["image"] = "rbxassetid://17007899750"
}
v31[v30.POWDERED] = {
    ["displayName"] = "Powdered",
    ["description"] = "Firing yourself from a cannon will inflict damage",
    ["image"] = "rbxassetid://16580101589"
}
v31[v30.SPEED_BOOST] = {
    ["displayName"] = "Speed Boost",
    ["image"] = "rbxassetid://17363798233",
    ["noDisplay"] = false
}
v31[v30.COMBO_MASTER] = {
    ["displayName"] = "Ares\' Favor",
    ["description"] = "Deal increasing damage on combos",
    ["noDisplay"] = true,
    ["visualizer"] = v28.ComboMaster
}
v31[v30.SURVIVAL_COMBO_BOOST] = {
    ["displayName"] = "ON FIRE!",
    ["description"] = "Deal increased damage!",
    ["noDisplay"] = true,
    ["image"] = v18.FIRE_ENCHANT,
    ["visualizer"] = v28.Fire
}
v31[v30.ATTACK_AURA_1] = {
    ["displayName"] = "ATTACK I",
    ["description"] = "Increased attack damage",
    ["noDisplay"] = true
}
v31[v30.ATTACK_AURA_2] = {
    ["displayName"] = "ATTACK II",
    ["description"] = "Increased attack damage",
    ["noDisplay"] = true
}
v31[v30.TRIUMPH] = {
    ["displayName"] = "Triumph",
    ["description"] = "Each stack reduce damage taken",
    ["image"] = "rbxassetid://133802871831157"
}
v31[v30.DAMAGE_STAT_UPGRADE] = {
    ["displayName"] = "Damage Stat Upgrade",
    ["noDisplay"] = true,
    ["keepOnDeath"] = true,
    ["visualizer"] = v28.DamageStatUpgrade
}
v31[v30.SERPENTS_TOUCH_POTION] = {
    ["displayName"] = v19(v20.SERPENTS_TOUCH_POTION).displayName,
    ["item"] = v20.SERPENTS_TOUCH_POTION,
    ["description"] = v19(v20.SERPENTS_TOUCH_POTION).description
}
v31[v30.FURY_POTION] = {
    ["displayName"] = v19(v20.FURY_POTION).displayName,
    ["item"] = v20.FURY_POTION,
    ["description"] = v19(v20.FURY_POTION).description
}
local v54 = v30.SPIDER_WEB_SLOW
local v55 = {
    ["displayName"] = "Enwebbed",
    ["image"] = v18.SPIDER_WEB
}
local v56 = v6.SPIDER_WEB_SLOW_PER_STACK * 100
v55.description = "You are slowed by " .. tostring(v56) .. "% per Enwebbed stack."
v31[v54] = v55
local v57 = v30.SILAS_HALLOWEEN_HEX
local v58 = {
    ["displayName"] = "Hexed",
    ["showOnTagList"] = true
}
local v59 = v17.SILAS_HEX_DEBUFF_PERCENT_PER_STACK
v58.description = "For each stack take " .. tostring(v59) .. "% more damage"
v58.image = v18.SILAS_HALLOWEEN_HEX
v31[v57] = v58
local v60 = v30.SILAS_HALLOWEEN_DAMAGE_BUFF
local v61 = {
    ["displayName"] = "Victorious"
}
local v62 = v17.SILAS_DAMAGE_PERCENT_PER_STACK
v61.description = "For each stack deal " .. tostring(v62) .. "% more damage"
v61.image = v18.SILAS_HALLOWEEN_BUFF
v31[v60] = v61
local v63 = v30.NAZAR_HALLOWEEN_KNOCKBACK_STRIKE
local v64 = {
    ["displayName"] = "Knockback Strike"
}
local v65 = v17.NAZAR_KNOCKBACK_STRIKE_DAMAGE_PERCENT
v64.description = "Your next strike will deal an additional " .. tostring(v65) .. "% damage and has increased knockback"
v64.image = v18.KNOCKBACK_STRIKE
v31[v63] = v64
local v66 = v30.NAZAR_HALLOWEEN_EMPOWERED_STACKS
local v67 = {
    ["displayName"] = "Empowered",
    ["showOnTagList"] = true
}
local v68 = v17.NAZAR_EMPOWERED_DAMAGE_PERCENT
v67.description = "For each stack deal " .. tostring(v68) .. "% more damage"
v67.image = v18.EMPOWERED_STACK
v31[v66] = v67
v31[v30.VOID_HUNTER_MARKED] = {
    ["displayName"] = "Marked",
    ["description"] = "Marked by a Void Hunter. They can see you through walls and gain speed when chasing you",
    ["image"] = v18.VOID_HUNTER_MARKED_STATUS_EFFECT_ICON
}
v31[v30.VOID_HUNTER_BOOSTED] = {
    ["displayName"] = "Pursuing",
    ["description"] = "Chasing a marked player. Gain speed",
    ["image"] = v18.VOID_HUNTER_CHASING_STATUS_EFFECT_ICON
}
local v69 = v30.SPIRIT_GARDENER_TEARBLOOM_BUFF
local v70 = {
    ["displayName"] = "Tearbloom Empowered"
}
local v71 = v16.TEARBLOOM_BUFF_HEAL_PER_STACK
local v72 = tostring(v71)
local v73 = v16.MAX_BUFF_STACKS
v70.description = "Each stack heals " .. v72 .. " health per second. Stacks Max at " .. tostring(v73)
v70.image = v18.TEARBLOOM_FLOWER
v31[v69] = v70
local v74 = v30.SPIRIT_GARDENER_SOULVINE_BUFF
local v75 = {
    ["displayName"] = "Soulvine Empowered"
}
local v76 = v16.SOULVINE_BUFF_DAMAGE_PERCENT_PER_STACK
local v77 = tostring(v76)
local v78 = v16.MAX_BUFF_STACKS
v75.description = "Each stack increases damage by " .. v77 .. "%. Stacks Max at " .. tostring(v78)
v75.image = v18.SOULVINE_FLOWER
v31[v74] = v75
v31[v30.HIGH_SPEED_SKATING] = {
    ["displayName"] = "High Speed Skating",
    ["description"] = "Maintain high speed to trigger dodges",
    ["image"] = v18.SKATING_MAX_SPEED
}
v31[v30.ON_ICE] = {
    ["displayName"] = "On Ice",
    ["description"] = "Momentum increases at a faster rate",
    ["image"] = v18.SKATING_ON_ICE
}
v31[v30.VOID_WALKER_DAMAGE_BUFF] = {
    ["displayName"] = "Rift Madness",
    ["description"] = "Melee attacks reduce Rift Warp ability cooldown",
    ["image"] = v18.VOID_WALKER_WARP_ICON2
}
v31[v30.SNAKE_AGILITY] = {
    ["displayName"] = "Snake\'s Agility",
    ["description"] = "Briefly turn invisible and get a speed boost when your health drop below 30%",
    ["keepOnDeath"] = true,
    ["image"] = v18.SNAKE_ICON
}
v31[v30.SNAKE_AGILITY_INVISIBLE] = {
    ["displayName"] = "Snake\'s Agility",
    ["description"] = "Invisible",
    ["keepOnDeath"] = true,
    ["image"] = v18.SNAKE_ICON
}
v31[v30.SNAKE_CLINGY] = {
    ["displayName"] = "Snake God\'s Blessing",
    ["description"] = "Half of your resources are kept on death",
    ["image"] = v18.CLINGY_ELEMENT
}
v31[v30.SNAKE_ENCHANT_DISCOUNT] = {
    ["displayName"] = "Snake God\'s Blessing",
    ["description"] = "All enchant purchases are discounted",
    ["keepOnDeath"] = true,
    ["image"] = v18.FORTUNE_ENCHANT
}
v31[v30.SNAKE_POISON_SWORD] = {
    ["displayName"] = "Snake God\'s Blessing",
    ["description"] = "Melee attacks apply poison",
    ["keepOnDeath"] = true,
    ["image"] = v18.POISON_SWORD
}
v31[v30.SNAKE_POISON_ARROW] = {
    ["displayName"] = "Snake God\'s Blessing",
    ["description"] = "Arrow attacks apply poison",
    ["keepOnDeath"] = true,
    ["image"] = v18.POISON_ARROW
}
v31[v30.SNAKE_SHOP_REBATE] = {
    ["displayName"] = "Snake God\'s Blessing",
    ["description"] = "Get a rebate on shop purchases",
    ["keepOnDeath"] = true,
    ["image"] = v18.LUNAR_COIN_ICON
}
v31[v30.SNAKE_RECYCLE] = {
    ["displayName"] = "Snake God\'s Blessing",
    ["description"] = "When using a consumable, there\'s a chance it won\'t be consumed",
    ["keepOnDeath"] = true,
    ["image"] = v18.SNAKE_RECYCLE
}
v31[v30.VENGEFUL_VENOM] = {
    ["displayName"] = "Snake God\'s Blessing",
    ["description"] = "Chance to apply poison to anyone attacking you. Creates a poison cloud on death.",
    ["keepOnDeath"] = true,
    ["image"] = v18.VENGEFUL_VENOM
}
v31[v30.ENCHANT_STATIC_SELF_STACK] = {
    ["displayName"] = "Static Charge",
    ["description"] = "Triggering at least one static enchant effect with a melee attack increases these stacks. When reaching 5 stacks a lightning bolt will damage enemies around you.",
    ["image"] = v18.STATIC_ENCHANT
}
v31[v30.OASIS_WATER_VEIL] = {
    ["displayName"] = "Oasis Water Veil",
    ["description"] = "Regenerate health rapidly.",
    ["image"] = v18.OASIS_WATER_VEIL
}
v31[v30.OASIS_BUFF_CHARGE] = {
    ["displayName"] = "Oasis Damage Buff",
    ["description"] = "Gain +1% damage buff per oasis charge.",
    ["image"] = v18.OASIS_DAMAGE_BUFF
}
v31[v30.CLOAK_SPEED_BOOST] = {
    ["displayName"] = "Speed Boost",
    ["image"] = "rbxassetid://17363798233"
}
v31[v30.BERSERKER_RAGE] = {
    ["displayName"] = "Berserker Rage",
    ["description"] = "Gain break speed, reduce incoming damage, and prevent knockback.",
    ["image"] = v18.BERSERKER_KIT_ABILITY
}
v31[v30.BHAA_BUFF] = {
    ["displayName"] = "Bhaa\'s Blessing",
    ["image"] = "rbxassetid://125373168797212",
    ["keepOnDeath"] = true,
    ["description"] = "Can Revive through Sacrophagus after bed is broken"
}
v31[v30.WEAK_ARMOR] = {
    ["displayName"] = "Weak Armor",
    ["noDisplay"] = true
}
v31[v30.SOAKED] = {
    ["displayName"] = "Soaked",
    ["description"] = "Reduced armor effectiveness.",
    ["image"] = v18.SOAKED
}
v31[v30.ISABEL_SHIELD_BROKEN] = {
    ["displayName"] = "Shield Broken",
    ["description"] = "Your shield is broken! Steady yourself while it regains its strength.",
    ["image"] = v18.BROKEN_WOOD_SHIELD_RENDER
}
v31[v30.GRAVE_TRAP] = {
    ["displayName"] = "Grave Trap",
    ["description"] = "Continually take damage, your speed is reduced, and you can\'t jump",
    ["image"] = "rbxassetid://14313382740"
}
v31[v30.SKELETON_POISON] = {
    ["displayName"] = "Marrow\'s Poison",
    ["description"] = "You have reduced movement speed and take damage over time",
    ["image"] = v18.SKELETON_KIT_ABILITY_ICON
}
v31[v30.OIL_SPILLED] = {
    ["displayName"] = "Stepped on oil",
    ["description"] = "Unable to jump",
    ["image"] = "rbxassetid://7808151981"
}
v31[v30.ARACHNE_SPIDER_STACKS] = {
    ["displayName"] = "Spider Level",
    ["description"] = "Your spiders do more damage at higher levels. Kill players with your spiders to level up!",
    ["keepOnDeath"] = true,
    ["image"] = v18.SPIDER_QUEEN_SUMMON_SPIDERS_ICON
}
v31[v30.ARACHNE_SPIDER_LIFETIME] = {
    ["displayName"] = "Spider Lifetime",
    ["description"] = "The remaining seconds that your spiders will be alive for",
    ["image"] = v18.SPIDER_QUEEN_SUMMON_SPIDERS_ICON
}
v31[v30.GENERIC_SPEED_BOOST] = {
    ["displayName"] = "Speed Boost",
    ["image"] = "rbxassetid://7836794566",
    ["item"] = v20.SPEED_BOOST
}
v31[v30.MUSHROOM_ATTACK_BOOST] = {
    ["displayName"] = "Mushroom Boost",
    ["description"] = "Increased attack power...but also makes you dizzy",
    ["image"] = "rbxassetid://9285679955"
}
v31[v30.SOUL_LINK] = {
    ["displayName"] = "Soul Link",
    ["description"] = "Your damage is linked with others, and vice versa. Break the link by getting far enough away.",
    ["image"] = v18.SOUL_LINK_STATUS_ICON
}
v31[v30.SOUL_GUARD] = {
    ["displayName"] = "Soul Guard",
    ["description"] = "Reduces incoming damage by redirecting a portion of it to the caster ally",
    ["image"] = v18.SOUL_GUARD_STATUS_ICON
}
v31[v30.WARRIOR_FINAL_STAND] = {
    ["displayName"] = "Final Stand",
    ["description"] = "Will not fall until grit is depleated",
    ["image"] = "rbxassetid://9166207008"
}
v31[v30.CAKE_SWORD] = {
    ["displayName"] = "Increase Sword Damage",
    ["description"] = "+5% sword damage",
    ["image"] = v18.SWORD_FLAT_ICON
}
v31[v30.CAKE_BREAKSPEED] = {
    ["displayName"] = "Increased Break Speed",
    ["description"] = "+20% break speed",
    ["image"] = "rbxassetid://6875481325"
}
v31[v30.CAKE_REGEN] = {
    ["displayName"] = "Regen",
    ["description"] = "Regen 1 hp per second",
    ["image"] = v18.RAPID_REGEN_ELEMENT
}
v31[v30.CAKE_PROJECTILE] = {
    ["displayName"] = "Increased cake projectile",
    ["description"] = "+10% projectile damage",
    ["image"] = v18.BOW_ARROW_ICON_SOLID
}
v31[v30.CAKE_SHIELD] = {
    ["displayName"] = "Shield",
    ["description"] = "gain 10 shield whenever left battle",
    ["image"] = v18.SHIELD
}
return {
    ["StatusEffectMeta"] = v31
}