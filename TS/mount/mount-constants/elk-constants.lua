local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "ElkConstants"
    end
})
u1.__index = u1
function u1.new(...) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    return v3:constructor(...) or v3
end
function u1.constructor(_) --[[ Line: 14 ]] end
u1.ELK_ENERGY_REGEN_RATE = 0.1
u1.ELK_ENERGY_IDLE_DECAY_RATE = 0.1
u1.ELK_ENERGY_MOVE_DECAY_RATE = 0.2
u1.ELK_ENERGY_CHARGE_DECAY_RATE = 0.2
u1.ELK_MINIMUM_THRESHOLD = 0.1
u1.ELK_ENERGY_CHARGE_COST = 0.5
u1.ELK_SUMMON_SPEED_MULTIPLIER = 1.5
u1.ELK_SUMMON_JUMP_MULTIPLIER = 1.6
u1.CHARGE_ARMOR_MULTIPLIER = 0.4
u1.DAMAGE_TO_SPEED_RATIO_BLOCK_HIT = 0.6
u1.CHARGE_DURATION = 5
u1.CHARGE_COOLDOWN = 14
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.ENTITY_HIT = "entity_hit"
v4.entity_hit = "ENTITY_HIT"
v5.BLOCK_HIT = "block_hit"
v4.block_hit = "BLOCK_HIT"
v5.DEATH = "death"
v4.death = "DEATH"
return {
    ["ElkConstants"] = u1,
    ["ElkChargeEndReason"] = v5
}