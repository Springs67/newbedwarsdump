local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "MatchStateChangeEvent"
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
function u1.constructor(p4, p5, p6, p7) --[[ Line: 14 ]]
    p4.matchState = p5
    p4.startTime = p6
    p4.customMatch = p7
end
return {
    ["MatchStateChangeEvent"] = u1
}