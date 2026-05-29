local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "DragonSlayerConstants"
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
u1.MAX_STACKS = 3
u1.STACK_DECAY_SEC = 12
u1.PUNCH_COOLDOWN_SEC = 8
u1.PUNCH_SPEED_STUD_PER_SEC = 180
u1.VICTIM_COOLDOWN_SEC = 8
return {
    ["DragonSlayerConstants"] = u1
}