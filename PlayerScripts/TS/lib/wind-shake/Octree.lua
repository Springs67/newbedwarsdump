-- Decompiled with Potassium's decompiler.

local OctreeNode = require(script.OctreeNode);
local OctreeRegionUtils = require(script.OctreeRegionUtils);
local u1 = { { 0.25, 0.25, -0.25 }, { -0.25, 0.25, -0.25 }, { 0.25, 0.25, 0.25 }, { -0.25, 0.25, 0.25 }, { 0.25, -0.25, -0.25 }, { -0.25, -0.25, -0.25 }, { 0.25, -0.25, 0.25 }, { -0.25, -0.25, 0.25 } };
local u2 = {
    ClassName = "Octree"
};
u2.__index = u2;
local new = OctreeNode.new;
local GetNeighborsWithinRadius = OctreeRegionUtils.GetNeighborsWithinRadius;

function u2.new() -- Line: 28
    -- upvalues: u2 (copy)
    local v3 = {
        MaxDepth = 4,
        MaxRegionSize = table.create(3, 512),
        RegionHashMap = {}
    };

    return setmetatable(v3, u2);
end;

function u2.ClearNodes(p4) -- Line: 36
    p4.MaxDepth = 4;
    p4.MaxRegionSize = table.create(3, 512);
    table.clear(p4.RegionHashMap);
end;

function u2.GetAllNodes(p5) -- Line: 42
    local v6 = 0;
    local v7 = {};

    for _, v in next, p5.RegionHashMap do
        for _, v2 in ipairs(v) do
            for i in next, v2.Nodes do
                v6 = v6 + 1;
                v7[v6] = i;
            end;
        end;
    end;

    return v7;
end;

function u2.CreateNode(p8, p9, p10) -- Line: 58
    -- upvalues: new (copy)
    if typeof(p9) ~= "Vector3" then
        error("Bad position value");
    end;

    if not p10 then
        error("Bad object value.");
    end;

    local v11 = new(p8, p10);
    v11:SetPosition(p9);

    return v11;
end;

function u2.RadiusSearch(p12, p13, p14) -- Line: 72
    -- upvalues: GetNeighborsWithinRadius (copy)
    if typeof(p13) ~= "Vector3" then
        error("Bad position value");
    end;

    if type(p14) ~= "number" then
        error("Bad radius value");
    end;

    local X = p13.X;
    local Y = p13.Y;
    local Z = p13.Z;
    local v15 = p14 + 0.8660254037844386 * p12.MaxRegionSize[1];
    local v16 = v15 * v15 + 1e-9;
    local v17 = 0;
    local v18 = {};
    local v19 = 0;
    local v20 = {};

    for _, v in next, p12.RegionHashMap do
        for _, v2 in ipairs(v) do
            local Position = v2.Position;
            local v21 = X - Position[1];
            local v22 = Y - Position[2];
            local v23 = Z - Position[3];

            if v21 * v21 + v22 * v22 + v23 * v23 <= v16 then
                v17, v19 = GetNeighborsWithinRadius(v2, p14, X, Y, Z, v18, v20, p12.MaxDepth, v17, v19);
            end;
        end;
    end;

    return v18, v20;
end;

local function NearestNeighborSort(p24, p25) -- Line: 110
    return p24.Distance2 < p25.Distance2;
end;

function u2.KNearestNeighborsSearch(p26, p27, p28, p29) -- Line: 114
    -- upvalues: GetNeighborsWithinRadius (copy), NearestNeighborSort (copy)
    if typeof(p27) ~= "Vector3" then
        error("Bad position value");
    end;

    if type(p29) ~= "number" then
        error("Bad radius value");
    end;

    local X = p27.X;
    local Y = p27.Y;
    local Z = p27.Z;
    local v30 = p29 + 0.8660254037844386 * p26.MaxRegionSize[1];
    local v31 = v30 * v30 + 1e-9;
    local v32 = 0;
    local v33 = {};
    local v34 = 0;
    local v35 = {};

    for _, v in next, p26.RegionHashMap do
        for _, v2 in ipairs(v) do
            local Position = v2.Position;
            local v36 = X - Position[1];
            local v37 = Y - Position[2];
            local v38 = Z - Position[3];

            if v36 * v36 + v37 * v37 + v38 * v38 <= v31 then
                v32, v34 = GetNeighborsWithinRadius(v2, p29, X, Y, Z, v35, v33, p26.MaxDepth, v32, v34);
            end;
        end;
    end;

    local v39 = table.create(v34);

    for i, v in ipairs(v33) do
        v39[i] = {
            Distance2 = v,
            Index = i
        };
    end;

    table.sort(v39, NearestNeighborSort);
    local v40 = math.min(v34, p28);
    local v41 = table.create(v40);
    local v42 = table.create(v40);

    for i = 1, v40 do
        local v43 = v39[i];
        v42[i] = v43.Distance2;
        v41[i] = v35[v43.Index];
    end;

    return v41, v42;
end;

local function GetOrCreateRegion(p44, p45, p46, p47) -- Line: 171
    local RegionHashMap = p44.RegionHashMap;
    local MaxRegionSize = p44.MaxRegionSize;
    local v48 = MaxRegionSize[1];
    local v49 = MaxRegionSize[2];
    local v50 = MaxRegionSize[3];
    local v51 = math.floor(p45 / v48 + 0.5);
    local v52 = math.floor(p46 / v49 + 0.5);
    local v53 = math.floor(p47 / v50 + 0.5);
    local v54 = v51 * 73856093 + v52 * 19351301 + v53 * 83492791;
    local v55 = RegionHashMap[v54];

    if not v55 then
        v55 = {};
        RegionHashMap[v54] = v55;
    end;

    local v56 = v48 * v51;
    local v57 = v49 * v52;
    local v58 = v50 * v53;

    for _, v in ipairs(v55) do
        local Position = v.Position;

        if Position[1] == v56 and (Position[2] == v57 and Position[3] == v58) then
            return v;
        end;
    end;

    local v59 = v48 / 2;
    local v60 = v49 / 2;
    local v61 = v50 / 2;
    local v62 = {
        Depth = 1,
        NodeCount = 0,
        Parent = nil,
        ParentIndex = nil,
        LowerBounds = { v56 - v59, v57 - v60, v58 - v61 },
        Nodes = {},
        Position = { v56, v57, v58 },
        Size = { v48, v49, v50 },
        SubRegions = {},
        UpperBounds = { v56 + v59, v57 + v60, v58 + v61 }
    };
    table.insert(v55, v62);

    return v62;
end;

function u2.GetOrCreateLowestSubRegion(p63, p64, p65, p66) -- Line: 216
    -- upvalues: GetOrCreateRegion (copy), u1 (copy)
    local v67 = GetOrCreateRegion(p63, p64, p65, p66);

    for _ = v67.Depth, p63.MaxDepth do
        local Position = v67.Position;
        local v68 = Position[1] < p64 and 1 or 2;

        if p65 <= Position[2] then
            v68 = v68 + 4;
        end;

        if Position[3] <= p66 then
            v68 = v68 + 2;
        end;

        local SubRegions = v67.SubRegions;
        local v69 = SubRegions[v68];

        if v69 then
            v67 = v69;
        else
            local Size = v67.Size;
            local v70 = u1[v68];
            local v71 = Size[1];
            local v72 = Size[2];
            local v73 = Size[3];
            local v74 = Position[1] + v70[1] * v71;
            local v75 = Position[2] + v70[2] * v72;
            local v76 = Position[3] + v70[3] * v73;
            local v77 = v71 / 2;
            local v78 = v72 / 2;
            local v79 = v73 / 2;
            local v80 = v77 / 2;
            local v81 = v78 / 2;
            local v82 = v79 / 2;
            v67 = {
                NodeCount = 0,
                Depth = v67 and (v67.Depth + 1 or 1) or 1,
                LowerBounds = { v74 - v80, v75 - v81, v76 - v82 },
                Nodes = {},
                Parent = v67,
                ParentIndex = v68,
                Position = { v74, v75, v76 },
                Size = { v77, v78, v79 },
                SubRegions = {},
                UpperBounds = { v74 + v80, v75 + v81, v76 + v82 }
            };
            SubRegions[v68] = v67;
        end;
    end;

    return v67;
end;

return u2;