local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").MinPriorityQueue
local u3 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "VoxelPathfinder"
    end
})
u3.__index = u3
function u3.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v4 = u3
    local v5 = setmetatable({}, v4)
    return v5:constructor(...) or v5
end
function u3.constructor(_) --[[ Line: 19 ]] end
function u3.generatePath(u6, u7, u8, u9, u10) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    return u1.Promise.new(function(u11) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
            [3] = u7
            [4] = u6
            [5] = u8
            [6] = u10
        --]]
        task.spawn(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u9
                [3] = u7
                [4] = u11
                [5] = u6
                [6] = u8
                [7] = u10
            --]]
            local u12 = {}
            local u13 = u2.new()
            local u14 = {}
            local v15 = u9:getVoxelNodeAt(u7)
            if not v15 then
                u11({})
                return nil
            end
            local v16 = u6:CreateComputedVoxelNode(v15, u8, 10, u10)
            local v17 = v15:getNodeUniqueId()
            u12[v17] = v16
            u13:InsertWithPriority(v17, v16.f)
            while not u13:IsEmpty() do
                local v18 = u13:PopElement().Value
                local u19 = u12[v18]
                u14[v18] = true
                local v20 = u9:getVoxelNodeById(v18)
                if v20 then
                    if v20:getPosition() == u8 then
                        local v21 = { u19.adjacencyRef:getPosition() }
                        while true do
                            u19 = u19.parent
                            if not u19 then
                                break
                            end
                            local v22 = u19.adjacencyRef:getPosition()
                            table.insert(v21, v22)
                        end
                        u11(v21)
                        return nil
                    end
                    local v23 = v20:getConnectedNodes()
                    local function v30(p24) --[[ Line: 67 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u14
                            [3] = u19
                            [4] = u13
                            [5] = u6
                            [6] = u8
                            [7] = u10
                            [8] = u12
                        --]]
                        local v25 = u9:getVoxelNodeAt(p24)
                        if not v25 then
                            return nil
                        end
                        local v26 = v25:getNodeUniqueId()
                        if u14[v26] == nil then
                            local v27 = u19.g + 10
                            if not u13:Contains(v26) then
                                local v28 = u6:CreateComputedVoxelNode(v25, u8, v27, u10)
                                v28.parent = u19
                                u12[v26] = v28
                                u13:InsertWithPriority(v26, v28.f)
                                return
                            end
                            local v29 = u12[v26]
                            if v27 < v29.g then
                                v29.g = v27
                                v29.h = u10(v25, u8)
                                v29.f = v29.g + v29.h
                                v29.parent = u19
                                u13:ChangePriority(v26, v29.f)
                            end
                        end
                    end
                    for v31 in v23 do
                        v30(v31, v31, v23)
                    end
                end
            end
            return {}
        end)
    end)
end
function u3.CreateComputedVoxelNode(_, p32, p33, p34, p35) --[[ Line: 104 ]]
    local v36 = p35(p32, p33)
    return {
        ["adjacencyRef"] = p32,
        ["g"] = p34,
        ["h"] = v36,
        ["f"] = p34 + v36
    }
end
local u37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 118 ]]
        return "AdjacencyVoxelNode"
    end
})
u37.__index = u37
function u37.new(...) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v38 = u37
    local v39 = setmetatable({}, v38)
    return v39:constructor(...) or v39
end
function u37.constructor(p40, p41, p42, p43) --[[ Line: 127 ]]
    p40.position = p41
    p40.connectedNodes = p42
    p40.uniqueNodeId = p43
end
function u37.getPosition(p44) --[[ Line: 132 ]]
    return p44.position
end
function u37.getConnectedNodes(p45) --[[ Line: 135 ]]
    return p45.connectedNodes
end
function u37.getNodeUniqueId(p46) --[[ Line: 138 ]]
    return p46.uniqueNodeId
end
return {
    ["VoxelPathfinder"] = u3,
    ["AdjacencyVoxelNode"] = u37
}