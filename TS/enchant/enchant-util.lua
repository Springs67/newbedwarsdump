local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-knight-balance").VoidKnightBalance
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["EnchantBalance"] = {
        ["USE_ENCHANT_TABLE_ANY_TEAM"] = true,
        ["BLOCKING_OUT_OF_COMBAT_CD"] = 5,
        ["ABSORBING_AMOUNT_MAX"] = 25,
        ["ABSORBING_REFLECT_RANGE"] = 15,
        ["ABSORBING_RATIO"] = 0.1,
        ["ABSORBING_ARMOR_MULTIPLIER"] = 0.2,
        ["FROST_SLOW_RANGE"] = 18,
        ["FROST_COOLDOWN"] = 20,
        ["FROST_HP_PERCENT_TRIGGER"] = 0.5,
        ["FROSTED_DURATION"] = 2.5,
        ["CLEAVE_DAMAGE_PERCENT"] = 80,
        ["SWIFT_SPEED_PERCENT"] = 20,
        ["SWIFT_OUT_OF_COMBAT_TIME"] = 5,
        ["ENDURANCE_DAMAGE_PERCENT_PER_STACK"] = 1,
        ["ENDURANCE_MAX_HP_PER_STACK"] = 2,
        ["ENDURANCE_OUT_OF_COMBAT_TIME"] = 10,
        ["ENDURANCE_MAX_STACKS"] = 20,
        ["SAFEGUARD_HP_PERCENT_TRIGGER"] = 0.5,
        ["SAFEGUARD_COOLDOWN"] = 20,
        ["SAFEGUARD_RANGE"] = 21,
        ["SAFEGUARD_SELF_SHIELD_HP"] = 50,
        ["SAFEGUARD_ALLY_SHIELD_HP"] = 25,
        ["SAFEGUARD_SHIELD_DECAY_PER_TICK"] = 0.5,
        ["SAFEGUARD_SHIELD_TICK_RATE"] = 0.2,
        ["HEAVY_HITTER_DAMAGE_MULTIPLIER"] = 0.5,
        ["HEAVY_HITTER_DAMAGE_RANGE"] = 9,
        ["TOOL_CRIT_CHANCE"] = 0.15,
        ["EFFICIENCY_TOOL_PERCENT"] = 50,
        ["EXPLOSIVE_NUM_STACKS_FOR_EXPLOSION"] = 10,
        ["SOUL_REAVER_TICK_RATE"] = 0.5,
        ["SOUL_REAVER_DURATION"] = 7,
        ["SOUL_REAVER_BASE_DAMAGE_PER_TICK"] = 5,
        ["SOUL_REAVER_DAMAGE_INCREASE_PER_STACK"] = 1,
        ["SOUL_REAVER_BASE_RANGE"] = 12,
        ["SOUL_REAVER_RANGE_INCREASE_PER_STACK"] = v3 * 0.2,
        ["MIN_HP_ELDERTREE_REQUIREMENT"] = 300,
        ["MIN_TIER_VOID_KNIGHT_REQUIREMENT"] = v2.ProgressTiers.EMPOWERED,
        ["ARMOR_PURCHASES_FOR_ARMOR_ENCHANTS"] = {
            v5.DIAMOND_CHESTPLATE,
            v5.EMERALD_CHESTPLATE,
            v5.WARRIOR_CHESTPLATE,
            v5.TINKER_DIAMOND_MECH_UPGRADE,
            v5.TINKER_EMERALD_MECH_UPGRADE,
            v5.TINKER_VOID_MECH_UPGRADE
        }
    },
    ["EnchantUtil"] = {
        ["isEnchantableBreakTool"] = function(p6) --[[ Name: isEnchantableBreakTool, Line 93 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            return u4(p6).breakBlock ~= nil
        end
    }
}