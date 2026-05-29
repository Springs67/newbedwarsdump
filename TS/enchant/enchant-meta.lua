local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type")
local v7 = v6.ArmorEnchantType
local v8 = v6.ToolEnchantType
local v9 = v6.WeaponEnchantType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local v11 = {
    [v9.FIRE] = {
        ["name"] = "Fire",
        ["description"] = "All attacks apply a burn status effect to enemies",
        ["image"] = v3.FIRE_ENCHANT,
        ["statusEffect"] = v5.ENCHANT_FIRE
    },
    [v9.STATIC] = {
        ["name"] = "Static",
        ["description"] = "Attacks deal extra static damage that chains to nearby enemies. Applies Zapped, reducing healing received. Melee attacks that trigger static give you 1 stack of Static Charge. Reaching 3 stacks deals extra lightning damage to enemies near you.",
        ["image"] = v3.STATIC_ENCHANT,
        ["statusEffect"] = v5.ENCHANT_STATIC
    },
    [v9.EXECUTE] = {
        ["name"] = "Execute",
        ["description"] = "Attacks on an enemy increases the threshold at which an enemy will instantly die",
        ["image"] = v3.EXECUTE_ENCHANT,
        ["statusEffect"] = v5.ENCHANT_EXECUTE
    },
    [v9.CRITICAL_STRIKE] = {
        ["name"] = "Critical Strike",
        ["description"] = "Your attacks now have a chance to critically strike an enemy for more damage",
        ["image"] = v3.CRITICAL_STRIKE_ENCHANT,
        ["statusEffect"] = v5.ENCHANT_CRITICAL_STRIKE
    },
    [v9.FOREST] = {
        ["name"] = "Forest",
        ["description"] = "Forest attacks deal extra damage and increase your max health from new enemies",
        ["image"] = v3.FOREST_ENCHANT,
        ["statusEffect"] = v5.ENCHANT_FOREST
    },
    [v9.SOUL_REAVER] = {
        ["name"] = "Soul Reaver",
        ["description"] = "Killing an enemy summons a damaging aura around you for 5 seconds and adds one stack. Stacks increase the size and damage of the aura.",
        ["image"] = v3.SOUL_REAVER_ENCHANT,
        ["statusEffect"] = v5.ENCHANT_SOUL_REAVER
    },
    [v9.BERSERKER] = {
        ["name"] = "Berserker",
        ["description"] = "The less health you have, the more damage you deal. At low health, attacks will heal you",
        ["image"] = v3.BERSERKER_ENCHANT,
        ["statusEffect"] = v5.ENCHANT_BERSERKER
    }
}
local v12 = v9.CLEAVE
local v13 = {
    ["name"] = "Cleave",
    ["disabled"] = true
}
local v14 = v10.CLEAVE_DAMAGE_PERCENT
v13.description = "Melee attacks hit multiple enemies in range. Secondary targets take " .. tostring(v14) .. "% of the damage dealt to the main target"
v13.image = v3.CLEAVE_ENCHANT
v13.statusEffect = v5.ENCHANT_CLEAVE
v11[v12] = v13
local v15 = {}
local v16 = v7.BLOCKING
local v17 = {
    ["name"] = "Blocking"
}
local v18 = v10.BLOCKING_OUT_OF_COMBAT_CD
v17.description = "Block your enemy\'s first attack. The shield regenerates after " .. tostring(v18) .. "s out of combat."
v17.image = v3.BLOCKING_ARMOR_ENCHANT
v17.statusEffect = v5.ARMOR_ENCHANT_BLOCKING
v15[v16] = v17
local v19 = v7.ABSORPTION
local v20 = {
    ["name"] = "Absorption"
}
local v21 = v10.ABSORBING_AMOUNT_MAX
v20.description = "Absorb a portion of premitigation damage taken, up to " .. tostring(v21) .. ". At max, this damage is reflected to all nearby enemies"
v20.image = v3.ABSORPTION_ARMOR_ENCHANT
v20.statusEffect = v5.ARMOR_ENCHANT_ABSORPTION
v15[v19] = v20
local v22 = v7.FROST
local v23 = {
    ["name"] = "Frost"
}
local v24 = v10.FROST_HP_PERCENT_TRIGGER * 100
local v25 = math.round(v24)
v23.description = "When taken to " .. tostring(v25) .. "% health, release an icy blast that slows and disables movement abilities for all nearby enemies."
v23.image = v3.FROST_ARMOR_ENCHANT
v23.statusEffect = v5.ARMOR_ENCHANT_FROST
v15[v22] = v23
local v26 = v7.SAFEGUARD
local v27 = {
    ["name"] = "Sound Barrier"
}
local v28 = v10.SAFEGUARD_HP_PERCENT_TRIGGER * 100
local v29 = math.round(v28)
v27.description = "When taken to " .. tostring(v29) .. "% health, create a decaying shield for yourself and nearby allies."
v27.image = v3.SOUND_BARRIER_ENCHANT
v27.statusEffect = v5.ARMOR_ENCHANT_SAFEGUARD
v15[v26] = v27
v15[v7.CLOUD] = {
    ["name"] = "Cloud",
    ["description"] = "Float over the void on a cloud, recharging on land",
    ["image"] = v3.CLOUD_ENCHANT,
    ["statusEffect"] = v5.ENCHANT_CLOUD
}
local v30 = v7.SWIFT
local v31 = {
    ["name"] = "Swift"
}
local v32 = v10.SWIFT_OUT_OF_COMBAT_TIME
local v33 = tostring(v32)
local v34 = v10.SWIFT_SPEED_PERCENT
v31.description = "When out of combat for " .. v33 .. " seconds, increase move speed by " .. tostring(v34) .. "%"
v31.image = v3.SWIFT_ARMOR_ENCHANT
v31.statusEffect = v5.ARMOR_ENCHANT_SWIFT
v15[v30] = v31
local v35 = v7.ENDURANCE
local v36 = {
    ["name"] = "Stoneguard"
}
local v37 = v10.ENDURANCE_MAX_HP_PER_STACK
local v38 = tostring(v37)
local v39 = v10.ENDURANCE_MAX_STACKS
local v40 = tostring(v39)
local v41 = v10.ENDURANCE_OUT_OF_COMBAT_TIME
v36.description = "When dealing or receiving damage gain a stack that increases max health by " .. v38 .. ", capped at " .. v40 .. " stacks. Stacks reset after leaving combat for " .. tostring(v41) .. " seconds"
v36.image = v3.ENDURANCE_ARMOR_ENCHANT
v36.statusEffect = v5.ARMOR_ENCHANT_ENDURANCE
v15[v35] = v36
local v42 = {}
local v43 = v8.HEAVY_HITTER
local v44 = {
    ["name"] = "Heavy Hitter"
}
local v45 = v10.HEAVY_HITTER_DAMAGE_MULTIPLIER * 100
local v46 = math.round(v45)
v44.description = "Block hits deal " .. tostring(v46) .. "% of the damage to adjacent blocks"
v44.image = v3.HEAVY_HITTER_TOOL_ENCHANT
v44.statusEffect = v5.TOOL_ENCHANT_HEAVY_HITTER
v42[v43] = v44
local v47 = v8.EXPLOSIVE
local v48 = {
    ["name"] = "Explosive"
}
local v49 = v10.EXPLOSIVE_NUM_STACKS_FOR_EXPLOSION
v48.description = "Every " .. tostring(v49) .. "th hit spawns an explosion"
v48.image = v3.EXPLOSIVE_TOOL_ENCHANT
v48.statusEffect = v5.TOOL_ENCHANT_EXPLOSIVE
v42[v47] = v48
local v50 = v8.CRITICAL_STRIKE
local v51 = {
    ["name"] = "Shatter Strike"
}
local v52 = v10.TOOL_CRIT_CHANCE * 100
local v53 = math.round(v52)
v51.description = "Your block hits now have a " .. tostring(v53) .. "% chance to instantly break blocks"
v51.image = v3.SHATTER_STRIKE_TOOL_ENCHANT
v51.statusEffect = v5.TOOL_ENCHANT_CRITICAL_STRIKE
v42[v50] = v51
local v54 = v8.EFFICIENCY
local v55 = {
    ["name"] = "Efficiency"
}
local v56 = v10.EFFICIENCY_TOOL_PERCENT
v55.description = "Your break tools become " .. tostring(v56) .. "% faster"
v55.image = v3.EFFICIENCY_TOOL_ENCHANT
v55.statusEffect = v5.TOOL_ENCHANT_EFFICIENCY
v42[v54] = v55
return {
    ["EnchantMeta"] = v11,
    ["ArmorEnchantMeta"] = v15,
    ["ToolEnchantMeta"] = v42,
    ["EnchantButton"] = {
        ["name"] = "ENCHANT WEAPON",
        ["price"] = 2,
        ["currency"] = v4.EMERALD,
        ["buttonColor"] = Color3.fromRGB(255, 151, 92),
        ["textColor"] = v2.hexColor(16750428)
    },
    ["ArmorEnchantButton"] = {
        ["name"] = "ENCHANT ARMOR",
        ["price"] = 5,
        ["currency"] = v4.VOID_CRYSTAL,
        ["buttonColor"] = Color3.fromRGB(255, 151, 92),
        ["textColor"] = v2.hexColor(16750428)
    },
    ["ToolEnchantButton"] = {
        ["name"] = "ENCHANT TOOLS",
        ["price"] = 1,
        ["currency"] = v4.EMERALD,
        ["buttonColor"] = Color3.fromRGB(255, 151, 92),
        ["textColor"] = v2.hexColor(16750428)
    }
}