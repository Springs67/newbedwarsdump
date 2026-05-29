local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v5 = {
    ["SEED_DESPAWN_TIME"] = 90,
    ["SPIRIT_ENERGY_ORBS_SPAWNED_PER_INTERVAL"] = 4,
    ["SPIRIT_ENERGY_ON_COLLECTION"] = 20,
    ["FIRST_SPAWN_STARTING_ENERGY"] = 50,
    ["MAX_ENERGY"] = 100,
    ["ENERGY_PER_TICK"] = 0.5,
    ["ENERGY_SECONDS_PER_TICK"] = 1,
    ["WATER_ENERGY_COST_PER_FLOWER_PER_SECOND"] = 0.5,
    ["WATER_ENERGY_COST_PER_SECOND_BY_FLOWER_TYPE"] = {
        [v3.TEARBLOOM_FLOWER] = 0.5,
        [v3.SOULVINE_FLOWER] = 0.5,
        [v3.CRYSTALHEART_FLOWER] = 1
    },
    ["WATER_ABILITY_COOLDOWN"] = 0.6,
    ["WATER_ABILITY_RANGE"] = v2 * 7,
    ["WATER_HEAL_PER_SECOND"] = 1.25,
    ["FLOWER_BUFF_RADIUS"] = v2 * 7,
    ["FLOWER_GENERATOR_RADIUS"] = v2 * 7,
    ["FLOWER_TICK_RATE"] = 1,
    ["FLOWER_DECAY_PER_SECOND"] = 0.1,
    ["FLOWER_TEAM_GENERATOR_SPEED_MULTIPLIER"] = 1.08,
    ["FLOWER_GLOBAL_GENERATOR_SPEED_MULTIPLIER"] = 1.2,
    ["FLOWER_HEALTH"] = 10,
    ["SOULVINE_BUFF_DAMAGE_PERCENT_PER_STACK"] = 3,
    ["TEARBLOOM_BUFF_HEAL_PER_STACK"] = 1.25,
    ["MAX_BUFF_STACKS"] = 10,
    ["FLOWER_DAMAGED_THRESHOLD"] = 1,
    ["DISTANCE_CAN_PLACE_FLOWERS"] = 18
}
return {
    ["SpiritGardenerKitBalance"] = v5,
    ["SpiritGardenerUtil"] = {
        ["CROP_PLANT_SOUNDS"] = { v4.CROP_PLANT_1, v4.CROP_PLANT_2, v4.CROP_PLANT_3 }
    }
}