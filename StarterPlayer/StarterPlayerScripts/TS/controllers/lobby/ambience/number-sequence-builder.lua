local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "NumberSequenceBuilder"
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
function u1.constructor(p4) --[[ Line: 14 ]]
    p4.keypoints = {}
end
function u1.addKeypoint(p5, p6, p7) --[[ Line: 17 ]]
    local v8 = p5.keypoints
    local v9 = NumberSequenceKeypoint.new(p6, p7)
    table.insert(v8, v9)
    return p5
end
function u1.build(p10) --[[ Line: 23 ]]
    if #p10.keypoints == 1 then
        return NumberSequence.new(p10.keypoints[1].Value)
    else
        return NumberSequence.new(p10.keypoints)
    end
end
return {
    ["NumberSequenceBuilder"] = u1
}