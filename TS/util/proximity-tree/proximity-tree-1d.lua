local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "ProximityTreeNode"
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
function u1.constructor(p4, p5, p6, p7, p8, p9, p10, p11) --[[ Line: 14 ]]
    p4.minValue = p5
    p4.maxValue = p6
    p4.splitValue = p7
    p4.items = p8
    p4.isLeaf = p9
    p4.ltChild = p10
    p4.gtChild = p11
end
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "ProximityTree1D"
    end
})
u12.__index = u12
function u12.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, p16) --[[ Line: 37 ]]
    p15.root = p16
end
function u12.from1DPositions(_, p17, p18) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v19 = u12:buildBTreeNode(p17, p18)
    local v20 = v19 ~= nil
    assert(v20)
    return u12.new(v19)
end
function u12.buildBTreeNode(_, p21, p22) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u12
    --]]
    if #p22 == 0 then
        return nil
    end
    local v23 = p22[1].dimension
    local v24 = true
    for v25, v26 in p22 do
        local _ = v25 - 1
        local v27 = v26.dimension - v23
        if math.abs(v27) > 1 then
            v24 = false
        end
    end
    if v24 then
        local v28 = v23 - p21
        local v29 = v23 + p21
        local v30 = v23 + p21 / 2
        local v31 = table.create(#p22)
        for v32, v33 in p22 do
            local _ = v32 - 1
            v31[v32] = v33.item
        end
        return u1.new(v28, v29, v30, v31, true, nil, nil)
    end
    table.sort(p22, function(p34, p35) --[[ Line: 81 ]]
        return p34.dimension < p35.dimension
    end)
    local v36 = #p22 / 2
    local v37 = math.floor(v36)
    local v38 = p22[v37 + 1]
    local v39 = { v38.item }
    local v40 = false
    local v41 = 0
    local v42 = {}
    local v43 = {}
    while true do
        while true do
            if v40 then
                v41 = v41 + 1
            else
                v40 = true
            end
            if v41 >= #p22 then
                local v44 = u1.new(v38.dimension - p21, v38.dimension + p21, v38.dimension + p21 / 2, v39, true, nil, nil)
                if #v42 ~= 0 then
                    v44.ltChild = u12:buildBTreeNode(p21, v42)
                    if v44.ltChild then
                        v44.isLeaf = false
                        v44.splitValue = v44.ltChild.maxValue + p21 + 1
                    end
                end
                if #v43 ~= 0 then
                    v44.gtChild = u12:buildBTreeNode(p21, v43)
                    if v44.gtChild then
                        v44.isLeaf = false
                        v44.splitValue = v44.gtChild.minValue - p21 - 1
                    end
                end
                return v44
            end
            if v41 >= v37 then
                break
            end
            local v45 = p22[v41 + 1].dimension - v38.dimension
            if math.abs(v45) <= 1 then
                goto l22
            end
            local v46 = p22[v41 + 1]
            table.insert(v42, v46)
        end
        ::l22::
        if v37 < v41 then
            local v47 = p22[v41 + 1].dimension - v38.dimension
            if math.abs(v47) <= 1 then
                goto l26
            end
            local v48 = p22[v41 + 1]
            table.insert(v43, v48)
        else
            ::l26::
            if v41 ~= v37 then
                local v49 = p22[v41 + 1].item
                table.insert(v39, v49)
            end
        end
    end
end
function u12.searchTree(p50, p51) --[[ Line: 132 ]]
    local v52 = p50.root
    while not v52.isLeaf do
        if v52.minValue <= p51 and p51 <= v52.maxValue then
            return v52.items
        end
        if v52.ltChild and p51 < v52.splitValue then
            v52 = v52.ltChild
        else
            if not v52.gtChild or v52.splitValue >= p51 then
                return {}
            end
            v52 = v52.gtChild
        end
    end
    return (v52.minValue > p51 or p51 > v52.maxValue) and {} or v52.items
end
return {
    ["ProximityTreeNode"] = u1,
    ["ProximityTree1D"] = u12
}