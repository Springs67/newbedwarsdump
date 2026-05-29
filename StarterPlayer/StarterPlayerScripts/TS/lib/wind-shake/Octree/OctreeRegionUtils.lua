local v1 = {}
local function u31(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    if not p9 then
        error("Missing MaxDepth.")
    end
    local v12 = p3 + 0.8660254037844386 * (p2.Size[1] / 2)
    local v13 = v12 * v12 + 1e-6
    local v14 = p3 * p3
    for _, v15 in next, p2.SubRegions do
        local v16 = v15.Position
        local v17 = v16[1]
        local v18 = v16[2]
        local v19 = v16[3]
        local v20 = p4 - v17
        local v21 = p5 - v18
        local v22 = p6 - v19
        if v20 * v20 + v21 * v21 + v22 * v22 <= v13 then
            if v15.Depth == p9 then
                for v23 in next, v15.Nodes do
                    local v24 = v23.PositionX
                    local v25 = v23.PositionY
                    local v26 = v23.PositionZ
                    local v27 = v24 - p4
                    local v28 = v25 - p5
                    local v29 = v26 - p6
                    local v30 = v27 * v27 + v28 * v28 + v29 * v29
                    if v30 <= v14 then
                        p10 = p10 + 1
                        p11 = p11 + 1
                        p7[p10] = v23.Object
                        p8[p11] = v30
                    end
                end
            else
                p10, p11 = u31(v15, p3, p4, p5, p6, p7, p8, p9, p10, p11)
            end
        end
    end
    return p10, p11
end
v1.GetNeighborsWithinRadius = u31
return v1