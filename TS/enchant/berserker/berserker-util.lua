local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "BerserkerUtil"
    end
})
u5.__index = u5
function u5.new(...) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(_) --[[ Line: 18 ]] end
function u5.getBerserkerLevel(_, p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
    --]]
    local v9 = u2:getEntity(p8)
    return v9 and (u4:isActive(v9:getInstance(), u3.ENCHANT_BERSERKER) and 1 or 0) or 0
end
function u5.getLifeStealAmount(p10, p11) --[[ Line: 31 ]]
    return p10:getBerserkerLevel(p11) <= 0 and 0 or p10.LIFE_STEAL_PER_MISSING_HP
end
function u5.getExtraDamageAmount(p12, p13) --[[ Line: 38 ]]
    return p12:getBerserkerLevel(p13) <= 0 and 0 or p12.EXTRA_DAMAGE_PER_MISSING_HP
end
u5.LIFE_STEAL_PER_MISSING_HP = 0.0015
u5.LIFE_STEAL_THRESHOLD = 0.25
u5.EXTRA_DAMAGE_PER_MISSING_HP = 0.0035
u5.EXTRA_DAMAGE_THRESHOLD = 0.7
return {
    ["BerserkerUtil"] = u5
}