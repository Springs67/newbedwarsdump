local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "FarmerCletusUtil"
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
function u1.getMelonSeedPrice(p4, p5) --[[ Line: 16 ]]
    local v6 = p5:GetAttribute(p4.MelonSeedsPurchasedAttribute)
    local v7 = (v6 == nil and 0 or v6) / 5
    return math.floor(v7) + p4.baseMelonSeedPrice
end
u1.baseMelonSeedPrice = 2
u1.MelonSeedsPurchasedAttribute = "MelonSeedsPurchased"
return {
    ["FarmerCletusUtil"] = u1
}