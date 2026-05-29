local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util").MageElement
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v6 = {
    ["SPLIT_RANGE"] = 30 * v3,
    ["SNOW_CONE_ARROW_COST"] = 1,
    ["SNOW_CONE_BLOCK_COST"] = 3,
    ["SNOW_CONE_SWORD_COST"] = 5,
    ["SNOW_CONE_ARROW_BASE_DMG"] = 1.3,
    ["SNOW_CONE_ARROW_STACK_BONUS"] = 0.01,
    ["SNOW_CONE_BLOCK_BASE_DMG"] = 1.5,
    ["SNOW_CONE_BLOCK_STACK_BONUS"] = 0.01,
    ["SNOW_CONE_SWORD_BASE_DMG"] = 1.3,
    ["SNOW_CONE_SWORD_STACK_BONUS"] = 0.04,
    ["RepairSnowConeMachinePrice"] = 5,
    ["RepairSnowConeMachineCurrency"] = v5.DIAMOND,
    ["VOLLEY_ENCHANT_COOLDOWN"] = 2.75,
    ["VOLLEY_ENCHANT_ARROW_COUNT"] = 4,
    ["WALL_HEIGHT"] = 5,
    ["WALL_HALF_WIDTH"] = 4,
    ["TNT_WARS_DRONE_COOLDOWN"] = 60,
    ["TNT_WARS_BALLOON_COUNT"] = 8,
    ["TNT_WARS_BALLOON_TNT_COUNT"] = 8,
    ["TNT_WARS_BALLOON_TRAVEL_TIME"] = 30,
    ["TNT_WARS_BALLOON_NUMBER_ROTATIONS"] = 3,
    ["EVELYNN_INTERNAL_COOLDOWN"] = 5,
    ["HANNAH_BASE_EXECUTE_THRESHOLD"] = 0.25,
    ["HANNAH_MAX_COMBO"] = 3,
    ["HANNAH_COMBO_EXECUTE_BOOST"] = 0.06,
    ["HANNAH_COMBO_EXPIRATION_SEC"] = 8,
    ["HANNAH_EXECUTE_MAX_DISTANCE"] = 30,
    ["PIRATE_TELESCOPE_DURATION"] = 5,
    ["PIRATE_TELESCOPE_RANGE"] = 15,
    ["PIRATE_SHOVEL_IRON"] = 60,
    ["PIRATE_SHOVEL_DIAMOND"] = 112,
    ["PIRATE_SHOVEL_EMERALD"] = 130,
    ["PIRATE_FLAG_RANGE"] = 22,
    ["HANNAH_EXECUTE_THRESHOLD"] = 0.2,
    ["GLITCH_LB_TELEPORT_DURATION"] = 0.05,
    ["GLITCH_LB_ANNOUNCEMENT_DURATION"] = 1.25,
    ["LEARN_TOME_DURATION"] = 2,
    ["MAGE_SWORD_DAMAGE_MULTIPLIER"] = 0.85,
    ["MAGE_ARMOR_MULTIPLIER"] = 0.95,
    ["MAGE_TOME_INITIAL_DELAY"] = 30,
    ["MAGE_TOME_INTERVAL_DURATION"] = 180,
    ["MAGE_ELEMENT_CYCLE"] = { v4.NATURE, v4.FIRE, v4.ICE },
    ["TOTAL_TOME_COUNT"] = 3,
    ["MAGE_BURN_DURATION"] = 6,
    ["MAGE_BURN_DAMAGE"] = 4,
    ["MAGE_BURN_INTERVAL"] = 0.5,
    ["MAGE_ICE_GROUND_DURATION"] = 6,
    ["MAGE_LIFE_STEAL_PERCENTAGE"] = 0.3,
    ["MAGE_LIFE_STEAL_DURATION"] = 3,
    ["NECROMANCER_CLAIM_SKELETON_EFFECT_DURATION"] = 0.5,
    ["NECROMANCER_SUMMON_SKELETON_DURATION"] = 0.5,
    ["NECROMANCER_RANDOM_GRAVESTONE_INTERVAL"] = 10,
    ["NECROMANCER_SUMMONED_SKELETON_MAX"] = 5,
    ["SKELETON_SWORD_DAMAGE_REDUCTION"] = 0.7,
    ["SKELETON_LIFE_TIME"] = 120,
    ["KALIYAH_PUNCH_DAMAGE_HIT_BLOCK"] = 28,
    ["KALIYAH_PUNCH_DAMAGE"] = 6,
    ["KALIYAH_PUNCHED_MAX_STUDS"] = 20,
    ["KALIYAH_FIRE_EXPLOSION_RADIUS_STUDS"] = 21,
    ["THRUSTER_DURATION"] = 5,
    ["VENDING_MACHINE_COOLDOWN"] = 15,
    ["FRONT_DAMAGE_REDUCTION"] = 0.1,
    ["BACK_DAMAGE_REDUCTION"] = 0.25,
    ["GROUNDED_SLOW_PERCENT"] = 0.5,
    ["GROUNDED_SLOW_DURATION"] = 1,
    ["MAX_PLACED"] = 3,
    ["SOLAR_PANEL_RESOURCE_GEN_TIME"] = 24,
    ["JailorKit"] = {
        ["RESPAWN_DELAY_MULTIPLIER"] = 2
    },
    ["NEW_YEARS_BALL_DROP_TIME"] = 10,
    ["NEW_YEARS_LB_SPAWN_COUNT"] = 20,
    ["FOREST_COOLDOWN"] = v2:IsStudio() and 1 or 45,
    ["FOREST_INSTANT_HP_BY_STRENGTH"] = 10,
    ["FOREST_HP_SCALE_PER_STACK"] = 0.015,
    ["WIND_MAX_STACK"] = 15,
    ["FireSheepActivationDelay"] = 2,
    ["FireSheepSearchRate"] = 1,
    ["FireSheepHayDispenseInterval"] = 60,
    ["FireSheepAttackChargeTime"] = 1,
    ["LIFE_STEAL_1"] = 0.08,
    ["LIFE_STEAL_2"] = 0.12,
    ["LIFE_STEAL_3"] = 0.15,
    ["LIFE_STEAL_4"] = 0.265,
    ["CyberDrone"] = {
        ["BASE_SPEED"] = 1.5,
        ["BOOSTED_SPEED"] = 1.85,
        ["SPEED_BOOST_DURATION"] = 4,
        ["SPEED_BOOST_COOLDOWN"] = 12,
        ["TNT_CAPACITY"] = 10
    },
    ["OWL_FIRE_COOLDOWN"] = 0.5,
    ["SpiritAssassinKit"] = {
        ["SPIRIT_ASSASSIN_SPEED_DURATION"] = 3,
        ["SPIRIT_ASSASSIN_SPEED_MODIFIER"] = 1.4,
        ["SPIRIT_ASSASSIN_ORB_COOLDOWN"] = 30,
        ["SPIRIT_ASSASSIN_SPIN_DAMAGE"] = 15,
        ["SPIRIT_ASSASSIN_SHIELD_AMOUNT"] = 15,
        ["SPIRIT_ASSASSIN_STACK_CONSTANT"] = 25
    },
    ["BakerKit"] = {
        ["SPEED_PIE_MULTIPLIER"] = 1.275,
        ["SPEED_PIE_DURATION_SEC"] = 100,
        ["APPLE_HEAL"] = 20,
        ["GOLD_APPLE_HEAL"] = 30
    },
    ["RAINBOW_AXE_PRISM_INTERVAL"] = 0.4,
    ["RAINBOW_AXE_BASE_PRISM_DAMAGE"] = 10,
    ["RAINBOW_AXE_PRISM_DAMAGE_MULTIPLIER"] = 0.3,
    ["RAINBOW_AXE_ABILITY_COOLDOWN"] = 15,
    ["DrillKit"] = {
        ["EARLY_GAME_DRILL_HP"] = 450,
        ["MID_GAME_DRILL_HP"] = 750,
        ["LATE_GAME_DRILL_HP"] = 900,
        ["EARLY_GAME_DRILL_DAMAGE"] = 32,
        ["MID_GAME_DRILL_DAMAGE"] = 45,
        ["LATE_GAME_DRILL_DAMAGE"] = 58,
        ["DRILL_ATTACK_COOLDOWN"] = 0.5
    },
    ["BLOOM_REQ"] = 2,
    ["TRIGGER_DISTANCE"] = v3 * 5,
    ["BLOOM_DEFAULT_DURATION"] = 3.6,
    ["FLOWER_LIFETIME"] = 600,
    ["MAX_FLOWER"] = 7,
    ["DAMAGE_PER_BEE"] = 3,
    ["ACTIVATION_TIME"] = 1,
    ["MAX_BEE"] = 10,
    ["BLOSSOM_ATTACK_MULTIPLIER"] = 1.3,
    ["BLOSSOM_DEFENSE_MULTIPLIER"] = 1.3,
    ["BLOSSOM_HORIZONTAL_KNOCKBACK_MULTIPLIER"] = 1.5,
    ["BLOSSOM_VERTICAL_KNOCKBACK_MULTIPLIER"] = 1.3,
    ["BLOSSOM_HEAL_AMOUNT"] = 1,
    ["BLOSSOM_HEAL_RATE"] = 0.3,
    ["BLOSSOM_CHARM_MAX_PROGRESS"] = 500,
    ["BLOSSOM_CHARM_IRON_PROGRESS"] = 2,
    ["BLOSSOM_CHARM_DIAMOND_PROGRESS"] = 20,
    ["BLOSSOM_CHARM_EMERALD_PROGRESS"] = 30,
    ["BLOSSOM_CHARM_PICKUP_DISTANCE"] = 5,
    ["FLORA_BEEHIVE_GRENADE_DAMAGE"] = 34,
    ["FLORA_SEEKING_BEE_ARMOR_PEN"] = 0.3,
    ["FLORA_SEEKING_BEE_DAMAGE"] = 5,
    ["FLORA_SEEKING_BEE_COUNT"] = 4,
    ["FLORA_GRENADES_GRANTED_ON_KILL"] = 1,
    ["FLORA_GRENADE_INTERVAL"] = 45,
    ["HUNTER_GOAL_ROTATION_INTERVAL"] = 30,
    ["HUNTER_WIN_SKULL_COUNT"] = 20,
    ["HUNTER_MODE_DURATION"] = 600,
    ["SKULL_DROP_HEAL_ON_KILL"] = 85,
    ["CHAMBER_GAME_DURATION"] = 480,
    ["CHAMBER_MAX_KILLS"] = 30,
    ["CHAMBER_MOVE_SPEED_MULT"] = 1.5,
    ["CHAMBER_PLAYER_MAX_HEALTH"] = 100,
    ["CHAMBER_PLAYER_RESPAWN_TIME"] = 3,
    ["CHAMBER_HEALTH_DROP_DURATION"] = 10,
    ["ORANGE_HEAL_AMOUNT"] = 10,
    ["FIREBALL_BURN_STRENGTH"] = 1,
    ["FIREBALL_BURN_DURATION"] = 2,
    ["TRAVELING_MERCHANT_DAMAGE_MULTIPLER"] = 1.2,
    ["TRAVELING_MERCHANT_DAMAGE_DURATION"] = 120,
    ["TRAVELING_MERCHANT_HEAL_AMOUNT"] = 2,
    ["TRAVELING_MERCHANT_HEAL_DURATION"] = 120,
    ["HEADHUNTER_HEADSHOT_DAMAGE_MULTIPLIER"] = 1.5,
    ["FLYING_CLOUD_STRIKE_DAMAGE"] = 35,
    ["FLYING_CLOUD_STRIKE_COOLDOWN"] = 2,
    ["FLYING_CLOUD_STRIKE_MAX_RANGE"] = v3 * 12,
    ["FLYING_CLOUD_SPEED"] = 90,
    ["FLYING_CLOUD_STRIKE_RADIUS"] = v3 * 6,
    ["TRIPLE_SHOT_HORIZONTAL_KB_MULT"] = 0.5,
    ["TRIPLE_SHOT_HORIZONTAL_KB_DECAY"] = 0.15,
    ["TRIPLE_SHOT_VERTICAL_KB_MULT"] = 0.45,
    ["TRIPLE_SHOT_VERTICAL_KB_DECAY"] = 0.15,
    ["HOT_AIR_BALLOON_SPEED"] = 24,
    ["HOT_AIR_BALLOON_HEALTH"] = 1800,
    ["HOT_AIR_BALLOON_YAW_MULTIPLIER"] = 0.5,
    ["SPIRIT_BRIDGE_DURATION"] = 30,
    ["SPIRIT_BRIDGE_MOVEMENT_SPEED_MULTIPLIER"] = 3,
    ["SPIRIT_ARMOR_AOE_RADIUS"] = v3 * 12,
    ["SPIRIT_ARMOR_SHIELD_MIN"] = 12,
    ["SPIRIT_ARMOR_SHIELD_MAX"] = 40,
    ["SPIRIT_BRIDGE_DISTANCE_FOR_MAX_SHIELD"] = 140,
    ["SPIRIT_ARMOR_DELAY"] = 1,
    ["SPIRIT_FORM_CONTACT_HEAL"] = 50,
    ["SPIRIT_FORM_DAMAGE_REDUCTION_MULTIPLIER"] = 0.5,
    ["SPIRIT_FORM_HORIZONTAL_KNOCKBACK_MULTIPLIER"] = 0.2,
    ["ELEKTRA"] = {
        ["ELECTRIC_DASH_DURATION"] = 0.3,
        ["ELECTRIC_DASH_COOLDOWN"] = 0.25,
        ["ELECTRIC_DASH_ANTI_GRAVITY_DURATION"] = 0.2,
        ["ELECTRIC_DASH_SECONDS_PER_CHARGE"] = 9,
        ["ELECTRIC_DASH_SECONDS_PER_CHARGE_HIT"] = 6,
        ["ELECTRIC_DASH_DAMAGE"] = 15,
        ["ELECTRIC_DASH_DEPTH_GOAL"] = 9 * v3,
        ["ELECTRIC_DASH_HEIGHT_LIMIT"] = 5 * v3
    },
    ["RADIOACTIVE_PLANT_ACTIVATION_DELAY"] = 5,
    ["RADIOACTIVE_PLANT_SEARCH_RATE"] = 0.5,
    ["RADIOACTIVE_PLANT_DAMAGE_RATE"] = 0.5,
    ["RADIOACTIVE_PLANT_IRON_DAMAGE"] = 3,
    ["RADIOACTIVE_PLANT_DIAMOND_DAMAGE"] = 5,
    ["RADIOACTIVE_PLANT_COMBO_DAMAGE"] = 2,
    ["RADIOACTIVE_PLANT_AOE_DURATION"] = 10,
    ["RADIOACTIVE_PLANT_IRON_AOE_RANGE"] = 20,
    ["RADIOACTIVE_PLANT_DIAMOND_AOE_RANGE"] = 15,
    ["RADIOACTIVE_PLANT_COMBO_AOE_RANGE"] = 10,
    ["SCYTHE_MAX_CHARGE_DURATION"] = 2,
    ["EMERALD_SWORD_EXTRA_DAMAGE"] = 1.2,
    ["ZAPPED_DURATION"] = 10,
    ["ZAPPED_1_HEAL_SHIELD_REDUCTION"] = 0.4,
    ["ZAPPED_2_HEAL_SHIELD_REDUCTION"] = 0.6,
    ["ZAPPED_3_HEAL_SHIELD_REDUCTION"] = 0.85,
    ["SPIDER_WEB_STUN_DURATION"] = 2,
    ["AXOLOTL"] = {
        ["SHIELD"] = 15,
        ["AXOLOTL_DAMAGE_MULT"] = 1.16,
        ["AXOLOTL_BREAK_SPEED_MULT"] = 1.6,
        ["HEALTH_REGEN_DURATION"] = 5,
        ["HEALTH_REGEN_TICK_RATE"] = 0.4,
        ["PERC_MAX_HEALTH_PER_TICK"] = 0.01
    },
    ["StarCollectorStella"] = {
        ["TEAM_BUFF_RANGE"] = 35
    }
}
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 530 ]]
        return "SpiderWebBalance"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 535 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 539 ]] end
u7.SPIDER_WEB_STUN_DURATION = 2
u7.SPIDER_WEB_SETUP_TIME = 2
u7.SPIDER_WEB_DEBUFF_TIME = 7
u7.SPIDER_LIFETIME = 20
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 549 ]]
        return "WarlockBalance"
    end
})
u10.__index = u10
function u10.new(...) --[[ Line: 554 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(_) --[[ Line: 558 ]] end
u10.TICK_INTERVAL = 0.75
u10.BASE_DAMAGE_PER_TICK = 4
u10.LIFESTEAL_RATIO = 0.5
u10.ALLY_LINK_HEAL_PER_TICK = 3
u10.ALLY_LINKED_DAMAGE_AMPLIFY = 1.25
u10.SELECTOR_RANGE = 24
u10.MAX_RANGE = 30
u10.RANGE_MULTIPLIER = 21
u10.BOUNS_RANGE_PER_STACK = 0.5
u10.DAMAGE_MULT_AT_MAX_RANGE = 0.8
u10.DAMAGE_MULT_AT_MIN_RANGE = 1.3
u10.ENERGY_CONVERSION_RATE = 0.8
u10.MAX_ENERGY = 30
u10.FINAL_DAMAGE_MULTIPLIER = 1.15
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 578 ]]
        return "DiscoGrenadeBalance"
    end
})
u13.__index = u13
function u13.new(...) --[[ Line: 583 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(_) --[[ Line: 587 ]] end
u13.DURATION = 5
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 594 ]]
        return "FireworkCrateBalance"
    end
})
u16.__index = u16
function u16.new(...) --[[ Line: 599 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(_) --[[ Line: 603 ]] end
u16.SHOT_COUNT = 10
u16.FIRE_DELAY = 2
u16.EXTRA_SHOTS = 20
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 612 ]]
        return "DragonSwordBalance"
    end
})
u19.__index = u19
function u19.new(...) --[[ Line: 617 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(_) --[[ Line: 621 ]] end
u19.SWORD_REGEN_TIME = 12
u19.MAX_SWORD = 3
u19.SWORD_DAMAGE_MULTIPLIER = 1.35
u19.BURN_DURATION = 5
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 631 ]]
        return "HarpoonBalance"
    end
})
u22.__index = u22
function u22.new(...) --[[ Line: 636 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(_) --[[ Line: 640 ]] end
u22.MAX_ANCHOR_TIME = 10
u22.COOLDOWN = 9
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 648 ]]
        return "RebellionBalance"
    end
})
u25.__index = u25
function u25.new(...) --[[ Line: 653 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(_) --[[ Line: 657 ]] end
u25.MAX_TRIUMPH_STACKS = 20
u25.PRESS_THE_ATTACK_MAX_TRIUMPH_STACKS = u25.MAX_TRIUMPH_STACKS
u25.PRESS_THE_ATTACK_MIN_SHIELD = 10
u25.PRESS_THE_ATTACK_MAX_SHIELD = 20
u25.DAMAGE_BUFF = 0.05
u25.BUFF_TICK_RATE = 0.75
u25.BASE_HEAL_PER_TICK = 1
u25.DAMAGE_REDUCTION_PER_STACK = 0.01
u25.AURA_DISTANCE = 18
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 672 ]]
        return "DinoTamerBalance"
    end
})
u28.__index = u28
function u28.new(...) --[[ Line: 677 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(_) --[[ Line: 681 ]] end
u28.DINO_CHARGE_SPEED_MULTIPLIER = 2.5
u28.DINO_CHARGE_WALK_SPEED_MULTIPLIER = 1.1
u28.DINO_CHARGE_DURATION = 5
u28.DINO_CHARGE_COOLDOWN = 50
u28.TIME_TO_GET_DINO_CHARGE_II = 2.5
return {
    ["BalanceFile"] = v6,
    ["SpiderWebBalance"] = u7,
    ["WarlockBalance"] = u10,
    ["DiscoGrenadeBalance"] = u13,
    ["FireworkCrateBalance"] = u16,
    ["DragonSwordBalance"] = u19,
    ["HarpoonBalance"] = u22,
    ["RebellionBalance"] = u25,
    ["DinoTamerBalance"] = u28
}