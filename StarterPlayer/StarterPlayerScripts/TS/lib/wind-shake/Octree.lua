local v1 = require(script.OctreeNode)
local v2 = require(script.OctreeRegionUtils)
local u3 = {
    { 0.25, 0.25, -0.25 },
    { -0.25, 0.25, -0.25 },
    { 0.25, 0.25, 0.25 },
    { -0.25, 0.25, 0.25 },
    { 0.25, -0.25, -0.25 },
    { -0.25, -0.25, -0.25 },
    { 0.25, -0.25, 0.25 },
    { -0.25, -0.25, 0.25 }
}
local u4 = {
    ["ClassName"] = "Octree"
}
u4.__index = u4
local u5 = v1.new
local u6 = v2.GetNeighborsWithinRadius
function u4.new() --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v7 = {
        ["MaxDepth"] = 4,
        ["MaxRegionSize"] = table.create(3, 512),
        ["RegionHashMap"] = {}
    }
    local v8 = u4
    return setmetatable(v7, v8)
end
function u4.ClearNodes(p9) --[[ Line: 36 ]]
    p9.MaxDepth = 4
    p9.MaxRegionSize = table.create(3, 512)
    table.clear(p9.RegionHashMap)
end
function u4.GetAllNodes(p10) --[[ Line: 42 ]]
    local v11 = 0
    local v12 = {}
    for _, v13 in next, p10.RegionHashMap do
        for _, v14 in ipairs(v13) do
            for v15 in next, v14.Nodes do
                v11 = v11 + 1
                v12[v11] = v15
            end
        end
    end
    return v12
end
function u4.CreateNode(p16, p17, p18) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if typeof(p17) ~= "Vector3" then
        error("Bad position value")
    end
    if not p18 then
        error("Bad object value.")
    end
    local v19 = u5(p16, p18)
    v19:SetPosition(p17)
    return v19
end
function u4.RadiusSearch(p20, p21, p22) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if typeof(p21) ~= "Vector3" then
        error("Bad position value")
    end
    if type(p22) ~= "number" then
        error("Bad radius value")
    end
    local v23 = p21.X
    local v24 = p21.Y
    local v25 = p21.Z
    local v26 = p22 + 0.8660254037844386 * p20.MaxRegionSize[1]
    local v27 = v26 * v26 + 1e-9
    local v28 = 0
    local v29 = {}
    local v30 = {}
    local v31 = 0
    for _, v32 in next, p20.RegionHashMap do
        for _, v33 in ipairs(v32) do
            local v34 = v33.Position
            local v35 = v34[1]
            local v36 = v34[2]
            local v37 = v34[3]
            local v38 = v23 - v35
            local v39 = v24 - v36
            local v40 = v25 - v37
            if v38 * v38 + v39 * v39 + v40 * v40 <= v27 then
                v31, v28 = u6(v33, p22, v23, v24, v25, v29, v30, p20.MaxDepth, v31, v28)
            end
        end
    end
    return v29, v30
end
local function u43(p41, p42) --[[ Line: 110 ]]
    return p41.Distance2 < p42.Distance2
end
function u4.KNearestNeighborsSearch(p44, p45, p46, p47) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u43
    --]]
    if typeof(p45) ~= "Vector3" then
        error("Bad position value")
    end
    if type(p47) ~= "number" then
        error("Bad radius value")
    end
    local v48 = p45.X
    local v49 = p45.Y
    local v50 = p45.Z
    local v51 = p47 + 0.8660254037844386 * p44.MaxRegionSize[1]
    local v52 = v51 * v51 + 1e-9
    local v53 = 0
    local v54 = {}
    local v55 = {}
    local v56 = 0
    for _, v57 in next, p44.RegionHashMap do
        for _, v58 in ipairs(v57) do
            local v59 = v58.Position
            local v60 = v59[1]
            local v61 = v59[2]
            local v62 = v59[3]
            local v63 = v48 - v60
            local v64 = v49 - v61
            local v65 = v50 - v62
            if v63 * v63 + v64 * v64 + v65 * v65 <= v52 then
                v56, v53 = u6(v58, p47, v48, v49, v50, v54, v55, p44.MaxDepth, v56, v53)
            end
        end
    end
    local v66 = table.create(v53)
    for v67, v68 in ipairs(v55) do
        v66[v67] = {
            ["Distance2"] = v68,
            ["Index"] = v67
        }
    end
    table.sort(v66, u43)
    local v69 = math.min(v53, p46)
    local v70 = table.create(v69)
    local v71 = table.create(v69)
    for v72 = 1, v69 do
        local v73 = v66[v72]
        v71[v72] = v73.Distance2
        v70[v72] = v54[v73.Index]
    end
    return v70, v71
end
local function u100(p74, p75, p76, p77) --[[ Line: 171 ]]
    local v78 = p74.RegionHashMap
    local v79 = p74.MaxRegionSize
    local v80 = v79[1]
    local v81 = v79[2]
    local v82 = v79[3]
    local v83 = p75 / v80 + 0.5
    local v84 = math.floor(v83)
    local v85 = p76 / v81 + 0.5
    local v86 = math.floor(v85)
    local v87 = p77 / v82 + 0.5
    local v88 = math.floor(v87)
    local v89 = v84 * 73856093 + v86 * 19351301 + v88 * 83492791
    local v90 = v78[v89]
    if not v90 then
        v90 = {}
        v78[v89] = v90
    end
    local v91 = v80 * v84
    local v92 = v81 * v86
    local v93 = v82 * v88
    for _, v94 in ipairs(v90) do
        local v95 = v94.Position
        if v95[1] == v91 and (v95[2] == v92 and v95[3] == v93) then
            return v94
        end
    end
    local v96 = v80 / 2
    local v97 = v81 / 2
    local v98 = v82 / 2
    local v99 = {
        ["Depth"] = 1,
        ["NodeCount"] = 0,
        ["Parent"] = nil,
        ["ParentIndex"] = nil,
        ["LowerBounds"] = { v91 - v96, v92 - v97, v93 - v98 },
        ["Nodes"] = {},
        ["Position"] = { v91, v92, v93 },
        ["Size"] = { v80, v81, v82 },
        ["SubRegions"] = {},
        ["UpperBounds"] = { v91 + v96, v92 + v97, v93 + v98 }
    }
    table.insert(v90, v99)
    return v99
end
function u4.GetOrCreateLowestSubRegion(p101, p102, p103, p104) --[[ Line: 216 ]]
    --[[
    Upvalues:
        [1] = u100
        [2] = u3
    --]]
    local v105 = u100(p101, p102, p103, p104)
    local v106 = p101.MaxDepth
    for _ = v105.Depth, v106 do
        local v107 = v105.Position
        local v108 = v107[1] < p102 and 1 or 2
        if p103 <= v107[2] then
            v108 = v108 + 4
        end
        if v107[3] <= p104 then
            v108 = v108 + 2
        end
        local v109 = v105.SubRegions
        local v110 = v109[v108]
        if v110 then
            v105 = v110
        else
            local v111 = v105.Size
            local v112 = u3[v108]
            local v113 = v111[1]
            local v114 = v111[2]
            local v115 = v111[3]
            local v116 = v107[1] + v112[1] * v113
            local v117 = v107[2] + v112[2] * v114
            local v118 = v107[3] + v112[3] * v115
            local v119 = v113 / 2
            local v120 = v114 / 2
            local v121 = v115 / 2
            local v122 = v119 / 2
            local v123 = v120 / 2
            local v124 = v121 / 2
            local v125 = { v116 - v122, v117 - v123, v118 - v124 }
            local v126 = { v116 + v122, v117 + v123, v118 + v124 }
            v105 = {
                ["NodeCount"] = 0,
                ["Depth"] = v105 and (v105.Depth + 1 or 1) or 1,
                ["LowerBounds"] = v125,
                ["Nodes"] = {},
                ["Parent"] = v105,
                ["ParentIndex"] = v108,
                ["Position"] = { v116, v117, v118 },
                ["Size"] = { v119, v120, v121 },
                ["SubRegions"] = {},
                ["UpperBounds"] = v126
            }
            v109[v108] = v105
        end
    end
    return v105
end
return u4