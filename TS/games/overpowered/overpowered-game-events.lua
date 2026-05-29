local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "ProjectileCooldownModifierCheckEvent"
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
function u1.constructor(p4, p5) --[[ Line: 14 ]]
    p4.cooldown = p5
end
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "ProjectileMaxChargeTimeModifierCheckEvent"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, p10) --[[ Line: 30 ]]
    p9.maxChargeTime = p10
end
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "CropGrowthTimeModifierCheckEvent"
    end
})
u11.__index = u11
function u11.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, p15) --[[ Line: 46 ]]
    p14.growthTime = p15
end
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 53 ]]
        return "ResourceBuildingModifierCheckEvent"
    end
})
u16.__index = u16
function u16.new(...) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, p20) --[[ Line: 62 ]]
    p19.amount = p20
end
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 69 ]]
        return "ItemCooldownModifierCheckEvent"
    end
})
u21.__index = u21
function u21.new(...) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24, p25) --[[ Line: 78 ]]
    p24.cooldown = p25
end
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 85 ]]
        return "ResourceSpawnDelayModifierCheckEvent"
    end
})
u26.__index = u26
function u26.new(...) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29, p30) --[[ Line: 94 ]]
    p29.spawnDelay = p30
end
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 101 ]]
        return "RepeatingGiveItemModifierCheckEvent"
    end
})
u31.__index = u31
function u31.new(...) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34, p35) --[[ Line: 110 ]]
    p34.interval = p35
end
local u36 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 117 ]]
        return "AbilityCooldownModifierCheckEvent"
    end
})
u36.__index = u36
function u36.new(...) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    local v37 = u36
    local v38 = setmetatable({}, v37)
    return v38:constructor(...) or v38
end
function u36.constructor(p39, p40) --[[ Line: 126 ]]
    p39.cooldown = p40
end
local u41 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 133 ]]
        return "BuffDurationModifierCheckEvent"
    end
})
u41.__index = u41
function u41.new(...) --[[ Line: 138 ]]
    --[[
    Upvalues:
        [1] = u41
    --]]
    local v42 = u41
    local v43 = setmetatable({}, v42)
    return v43:constructor(...) or v43
end
function u41.constructor(p44, p45) --[[ Line: 142 ]]
    p44.duration = p45
end
local u46 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 149 ]]
        return "DebuffDurationModifierCheckEvent"
    end
})
u46.__index = u46
function u46.new(...) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u46
    --]]
    local v47 = u46
    local v48 = setmetatable({}, v47)
    return v48:constructor(...) or v48
end
function u46.constructor(p49, p50) --[[ Line: 158 ]]
    p49.duration = p50
end
local u51 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 165 ]]
        return "CastTimeModifierCheckEvent"
    end
})
u51.__index = u51
function u51.new(...) --[[ Line: 170 ]]
    --[[
    Upvalues:
        [1] = u51
    --]]
    local v52 = u51
    local v53 = setmetatable({}, v52)
    return v53:constructor(...) or v53
end
function u51.constructor(p54, p55) --[[ Line: 174 ]]
    p54.castTime = p55
end
local u56 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 181 ]]
        return "AbilityTickDelayModifierCheckEvent"
    end
})
u56.__index = u56
function u56.new(...) --[[ Line: 186 ]]
    --[[
    Upvalues:
        [1] = u56
    --]]
    local v57 = u56
    local v58 = setmetatable({}, v57)
    return v58:constructor(...) or v58
end
function u56.constructor(p59, p60) --[[ Line: 190 ]]
    p59.tickDelay = p60
end
local u61 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 197 ]]
        return "ConsumableConsumeTimeModifierCheckEvent"
    end
})
u61.__index = u61
function u61.new(...) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u61
    --]]
    local v62 = u61
    local v63 = setmetatable({}, v62)
    return v63:constructor(...) or v63
end
function u61.constructor(p64, p65) --[[ Line: 206 ]]
    p64.consumeTime = p65
end
local u66 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 213 ]]
        return "SwordChargeTimeModifierCheckEvent"
    end
})
u66.__index = u66
function u66.new(...) --[[ Line: 218 ]]
    --[[
    Upvalues:
        [1] = u66
    --]]
    local v67 = u66
    local v68 = setmetatable({}, v67)
    return v68:constructor(...) or v68
end
function u66.constructor(p69, p70, p71) --[[ Line: 222 ]]
    p69.maxChargeTime = p70
    p69.minChargeTime = p71
end
return {
    ["ProjectileCooldownModifierCheckEvent"] = u1,
    ["ProjectileMaxChargeTimeModifierCheckEvent"] = u6,
    ["CropGrowthTimeModifierCheckEvent"] = u11,
    ["ResourceBuildingModifierCheckEvent"] = u16,
    ["ItemCooldownModifierCheckEvent"] = u21,
    ["ResourceSpawnDelayModifierCheckEvent"] = u26,
    ["RepeatingGiveItemModifierCheckEvent"] = u31,
    ["AbilityCooldownModifierCheckEvent"] = u36,
    ["BuffDurationModifierCheckEvent"] = u41,
    ["DebuffDurationModifierCheckEvent"] = u46,
    ["CastTimeModifierCheckEvent"] = u51,
    ["AbilityTickDelayModifierCheckEvent"] = u56,
    ["ConsumableConsumeTimeModifierCheckEvent"] = u61,
    ["SwordChargeTimeModifierCheckEvent"] = u66
}