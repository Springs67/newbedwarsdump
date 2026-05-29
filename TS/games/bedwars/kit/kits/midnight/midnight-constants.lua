local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "MidnightConstants"
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
u1.MIDNIGHT_DURATION = 12
u1.MIDNIGHT_SPEED_BOOST = 1.1
u1.MIDNIGHT_PERSONAL_ARMOR_DEBUFF = 0.1
u1.MIDNIGHT_DAMAGE_SCALE_PER_ATTACK = 0.3
u1.MIDNIGHT_ARMOR_PIERCING_SCALE_PER_ATTACK = 0.15
u1.MIDNIGHT_NUM_ATTACKS_TO_MAX_SCALING = 5
u1.MIDNIGHT_PROGRESS_TIMEOUT_SECONDS = 10
return {
    ["MidnightConstants"] = u1
}