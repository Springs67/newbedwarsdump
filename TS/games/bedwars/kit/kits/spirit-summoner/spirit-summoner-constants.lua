local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["SpiritSummonerBalance"] = {
        ["MAX_SPIRITS"] = 10,
        ["TARGETING_RANGE"] = 70,
        ["DEPLOY_RADIUS"] = v2 * 5,
        ["SPIRIT_TRAVEL_SPEED"] = 40,
        ["SPIRIT_ENERGY_MAX"] = 100,
        ["SPIRIT_ATTACK_ENERGY_COST"] = 25,
        ["SPIRIT_ATTACK_RATE"] = 0.5,
        ["SPIRIT_ATTACK_BASE_DAMAGE"] = 2,
        ["SPIRIT_ATTACK_DAMAGE_TIER_INCREASE"] = 1,
        ["SPIRIT_ATTACK_AFFINITY_MULTIPLIER"] = 1.5,
        ["SPIRIT_ATTACK_BASE_BONUS"] = 5,
        ["SPIRIT_HEAL_ENERGY_COST"] = 25,
        ["SPIRIT_HEAL_RATE"] = 0.5,
        ["SPIRIT_HEAL_BASE_AMOUNT"] = 2,
        ["SPIRIT_HEAL_AMOUNT_TIER_INCREASE"] = 1,
        ["SPIRIT_HEAL_AFFINITY_MULTIPLIER"] = 2,
        ["SPIRIT_HEAL_BASE_BONUS"] = 5,
        ["SPIRIT_COLLECT_ENERGY_COST"] = 100,
        ["PASSIVE_RECEIVE_TIME"] = 20,
        ["SPIRIT_TRAIL_DISTANCE"] = 5,
        ["SPIRIT_MAX_TRAIL_COUNT"] = 3,
        ["SUMMON_STONE_CURRENCY"] = v3.IRON,
        ["SUMMON_STONE_COST"] = 30,
        ["SUMMON_TIER_CURRENCY"] = v3.EMERALD,
        ["SUMMON_TIER_1_COST"] = 1,
        ["SUMMON_TIER_2_COST"] = 3,
        ["SUMMON_TIER_3_COST"] = 6
    }
}