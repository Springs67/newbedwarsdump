local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "CrateConstants"
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
u1.CRATE_OPEN_DECAY_SECONDS = 10
u1.CRATE_MAX_ACTIVATION_DISTANCE = 10
u1.CRATE_ALTAR_ACTIVE_MAX_SECONDS = 20
u1.CRATE_UPGRADE_USAGE_COST = 3000
return {
    ["CrateConstants"] = u1
}