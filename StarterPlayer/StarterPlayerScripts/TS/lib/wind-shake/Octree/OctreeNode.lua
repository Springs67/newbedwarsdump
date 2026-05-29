local u1 = {
    ["ClassName"] = "OctreeNode"
}
u1.__index = u1
function u1.new(p2, p3) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v4 = {
        ["CurrentLowestRegion"] = nil,
        ["Position"] = nil,
        ["PositionX"] = nil,
        ["PositionY"] = nil,
        ["PositionZ"] = nil,
        ["Octree"] = p2 or error("No octree"),
        ["Object"] = p3 or error("No object")
    }
    local v5 = u1
    return setmetatable(v4, v5)
end
function u1.KNearestNeighborsSearch(p6, p7, p8) --[[ Line: 20 ]]
    return p6.Octree:KNearestNeighborsSearch(p6.Position, p7, p8)
end
function u1.GetObject(p9) --[[ Line: 24 ]]
    warn("OctreeNode:GetObject is deprecated.")
    return p9.Object
end
function u1.RadiusSearch(p10, p11) --[[ Line: 29 ]]
    return p10.Octree:RadiusSearch(p10.Position, p11)
end
function u1.GetPosition(p12) --[[ Line: 33 ]]
    warn("OctreeNode:GetPosition is deprecated.")
    return p12.Position
end
function u1.GetRawPosition(p13) --[[ Line: 38 ]]
    return p13.PositionX, p13.PositionY, p13.PositionZ
end
function u1.SetPosition(p14, p15) --[[ Line: 42 ]]
    if p14.Position ~= p15 then
        local v16 = p15.X
        local v17 = p15.Y
        local v18 = p15.Z
        p14.PositionX = v16
        p14.PositionY = v17
        p14.PositionZ = v18
        p14.Position = p15
        if p14.CurrentLowestRegion then
            local v19 = p14.CurrentLowestRegion
            local v20 = v19.LowerBounds
            local v21 = v19.UpperBounds
            if v20[1] <= v16 and (v16 <= v21[1] and (v20[2] <= v17 and (v17 <= v21[2] and (v20[3] <= v18 and v18 <= v21[3])))) then
                return
            end
        end
        local v22 = p14.Octree:GetOrCreateLowestSubRegion(v16, v17, v18)
        local v23
        if p14.CurrentLowestRegion then
            local v24 = p14.CurrentLowestRegion
            if v24.Depth ~= v22.Depth then
                error("fromLowest.Depth ~= toLowest.Depth")
            end
            if v24 == v22 then
                error("fromLowest == toLowest")
                v23 = v22
            else
                v23 = v22
            end
            while v24 ~= v22 do
                local v25 = v24.Nodes
                if not v25[p14] then
                    error("CurrentFrom.Nodes doesn\'t have a node here.")
                end
                local v26 = v24.NodeCount
                if v26 <= 0 then
                    error("NodeCount is <= 0.")
                end
                local v27 = v26 - 1
                v25[p14] = nil
                v24.NodeCount = v27
                local v28 = v24.ParentIndex
                if v27 <= 0 and v28 then
                    local v29 = v24.Parent
                    if not v29 then
                        error("CurrentFrom.Parent doesn\'t exist.")
                    end
                    local v30 = v29.SubRegions
                    if v30[v28] ~= v24 then
                        error("Failed equality check.")
                    end
                    v30[v28] = nil
                end
                local v31 = v22.Nodes
                if v31[p14] then
                    error("CurrentTo.Nodes already has a node here.")
                end
                v31[p14] = p14
                v22.NodeCount = v22.NodeCount + 1
                v24 = v24.Parent
                v22 = v22.Parent
            end
        else
            v23 = v22
            while v22 do
                local v32 = v22.Nodes
                if not v32[p14] then
                    v32[p14] = p14
                    v22.NodeCount = v22.NodeCount + 1
                end
                v22 = v22.Parent
            end
        end
        p14.CurrentLowestRegion = v23
    end
end
function u1.Destroy(p33) --[[ Line: 137 ]]
    local v34 = p33.CurrentLowestRegion
    if v34 then
        while v34 do
            local v35 = v34.Nodes
            if not v35[p33] then
                error("CurrentFrom.Nodes doesn\'t have a node here.")
            end
            local v36 = v34.NodeCount
            if v36 <= 0 then
                error("NodeCount is <= 0.")
            end
            local v37 = v36 - 1
            v35[p33] = nil
            v34.NodeCount = v37
            local v38 = v34.Parent
            local v39 = v34.ParentIndex
            if v37 <= 0 and v39 then
                if not v38 then
                    error("Current.Parent doesn\'t exist.")
                end
                local v40 = v38.SubRegions
                if v40[v39] ~= v34 then
                    error("Failed equality check.")
                end
                v40[v39] = nil
                v34 = v38
            else
                v34 = v38
            end
        end
    end
end
return u1