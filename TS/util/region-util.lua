local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "RegionUtil"
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
function u1.createRegion3(_, p4, p5) --[[ Line: 16 ]]
    local v6 = p4.X
    local v7 = p5.X
    local v8 = math.min(v6, v7)
    local v9 = p4.Y
    local v10 = p5.Y
    local v11 = math.min(v9, v10)
    local v12 = p4.Z
    local v13 = p5.Z
    local v14 = math.min(v12, v13)
    local v15 = Vector3.new(v8, v11, v14)
    local v16 = p4.X
    local v17 = p5.X
    local v18 = math.max(v16, v17)
    local v19 = p4.Y
    local v20 = p5.Y
    local v21 = math.max(v19, v20)
    local v22 = p4.Z
    local v23 = p5.Z
    local v24 = math.max(v22, v23)
    local v25 = Vector3.new(v18, v21, v24)
    return Region3.new(v15, v25)
end
return {
    ["RegionUtil"] = u1
}