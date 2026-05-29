local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "BatteryUtil"
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
u1.BATTERY_BLUE = Color3.fromRGB(95, 112, 207)
u1.BATTERY_RED = Color3.fromRGB(172, 68, 76)
u1.OVERLOAD_DURATION_SEC = 8
u1.OVERLOAD_SPEED_MULT = 1.2
u1.BATTERY_SHIELD = 12
u1.BATTERY_DROP_COOLDOWN_SEC = 1
u1.BATTERY_ACTIVATION_TIME_SEC = 0.75
u1.BATTERY_LIFETIME_SEC = 30
u1.OVERLOAD_DAMAGE_BOOST_ENABLED = false
u1.OVERLOAD_DAMAGE_BOOST = 0.15
u1.OVERLOAD_DAMAGE_REFLECT_ENABLED = true
u1.OVERLOAD_DAMAGE_REFLECT_MULTIPLIER = 0.25
return {
    ["BatteryUtil"] = u1
}