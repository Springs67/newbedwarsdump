local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "HalloweenStageConfig"
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
u1.STAGE1_CRYSTAL_AMOUNT = 6
u1.STAGE2_CRYSTAL_AMOUNT = 100
return {
    ["HalloweenStageConfig"] = u1
}