local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "WeightedSelect"
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
    p4.objects = {}
    p4.cumulativeWeight = 0
    p4.maxElementWeight = 0
    p4:setObjects(p5)
end
function u1.setObjects(p6, p7) --[[ Line: 20 ]]
    table.sort(p7, function(p8, p9) --[[ Line: 22 ]]
        return p8.weight > p9.weight
    end)
    p6.objects = p7
    local v10 = 0
    for _, v11 in p7 do
        v10 = v10 + v11.weight
        local v12 = p6.maxElementWeight
        local v13 = v11.weight
        p6.maxElementWeight = math.max(v12, v13)
    end
    p6.cumulativeWeight = v10
end
function u1.getCumulativeWeight(p14) --[[ Line: 34 ]]
    return p14.cumulativeWeight
end
function u1.getMaxElementWeight(p15) --[[ Line: 37 ]]
    return p15.maxElementWeight
end
function u1.selectRandom(p16, p17) --[[ Line: 40 ]]
    local v18 = p17 == nil and 1 or p17
    local v19 = math.random() * p16.cumulativeWeight
    local v20 = false
    local v21 = 0
    while true do
        if v20 then
            v21 = v21 + 1
        else
            v20 = true
        end
        if v21 >= v18 - 1 then
            break
        end
        local v22 = math.random() * p16.cumulativeWeight
        v19 = math.max(v19, v22)
    end
    local v23 = false
    local v24 = 0
    local v25 = 0
    while true do
        if v23 then
            v24 = v24 + 1
        else
            v23 = true
        end
        if v24 >= #p16.objects then
            return p16.objects[1]
        end
        local v26 = p16.objects[v24 + 1]
        if v25 < v19 and v19 <= v25 + v26.weight then
            return v26
        end
        v25 = v25 + v26.weight
    end
end
function u1.getObjects(p27) --[[ Line: 82 ]]
    return p27.objects
end
function u1.getObjectPercentages(p28) --[[ Line: 85 ]]
    local v29 = p28.objects
    local v30 = table.create(#v29)
    for v31, v32 in v29 do
        local _ = v31 - 1
        v30[v31] = {
            ["object"] = v32,
            ["percentage"] = v32.weight / p28.cumulativeWeight
        }
    end
    return v30
end
return {
    ["WeightedSelect"] = u1
}