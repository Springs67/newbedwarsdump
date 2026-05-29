local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "proximity-tree", "proximity-tree-1d").ProximityTree1D
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "ProximitySearcher2D"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(p5, p6, p7) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v8 = p7 == nil and 30 or p7
    local v9 = next(p6) == nil
    assert(not v9)
    local u10 = {}
    local u11 = {}
    local function v18(p12, p13) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
        --]]
        local v14 = {
            ["item"] = p13,
            ["dimension"] = p12.X
        }
        local v15 = u10
        table.insert(v15, v14)
        local v16 = {
            ["item"] = p13,
            ["dimension"] = p12.Z
        }
        local v17 = u11
        table.insert(v17, v16)
    end
    for v19, v20 in p6 do
        v18(v20, v19, p6)
    end
    p5.xRoot = u1:from1DPositions(v8, u10)
    p5.zRoot = u1:from1DPositions(v8, u11)
end
function u2.getNearbyItems(p21, p22) --[[ Line: 43 ]]
    local v23 = p21.xRoot:searchTree(p22.X)
    local v24 = p21.zRoot:searchTree(p22.Z)
    local v25 = 0
    local v26 = {}
    for v27, v28 in v23 do
        local _ = v27 - 1
        if table.find(v24, v28) ~= nil == true then
            v25 = v25 + 1
            v26[v25] = v28
        end
    end
    return v26
end
return {
    ["ProximitySearcher2D"] = u2
}