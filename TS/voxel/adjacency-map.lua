local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").Stack
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "voxel", "voxel-pathfinder").AdjacencyVoxelNode
local u7 = {
    Vector3.new(2, 0, 0),
    Vector3.new(-2, 0, 0),
    Vector3.new(0, 0, 2),
    Vector3.new(0, 0, -2),
    Vector3.new(2, 0, 2),
    Vector3.new(-2, 0, 2),
    Vector3.new(2, 0, -2),
    Vector3.new(-2, 0, -2)
}
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "AdjacencyMap"
    end
})
u8.__index = u8
function u8.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11, p12, p13) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    if p13 == nil then
        p13 = false
    end
    p11.positionMap = {}
    p11.idMap = {}
    p11.debugPartMap = {}
    p11.uniqueIdCounter = 0
    p11.visitedVoxelPositions = {}
    p11.debugMode = true
    p11.rootPosition = p12
    p11.debugMode = p13
    if p11.debugMode then
        p11.debugFolder = u4("Folder", {
            ["Name"] = "VoxelDebugFolder",
            ["Parent"] = u5
        })
    end
end
function u8.populate(u14) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    return u1.Promise.new(function(u15) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
        --]]
        task.spawn(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u14
                [3] = u15
            --]]
            if u2:getStore():getBlockAt(u14.rootPosition) then
                u15()
            end
            u14:populateMap(u14.rootPosition)
            u15()
        end)
    end)
end
function u8.getVoxelNodeNearWorldPosition(p16, p17) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
    --]]
    local v18 = u2:getBlockPosition(p17)
    local v19 = v18.X
    local v20 = p16.rootPosition.Y
    local v21 = v18.Z
    local v22 = Vector3.new(v19, v20, v21)
    local v23 = p16.positionMap[v22]
    local v24 = v23
    for v25, v26 in u7 do
        local _ = v25 - 1
        if not v24 then
            local v27 = v22 + v26 / 2
            v23 = p16.positionMap[v27]
            v24 = v23
        end
    end
    return v24
end
function u8.getVoxelNodeAt(p28, p29) --[[ Line: 88 ]]
    return p28.positionMap[p29]
end
function u8.getVoxelNodeById(p30, p31) --[[ Line: 93 ]]
    return p30.idMap[p31]
end
function u8.populateMap(u32, p33) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
    --]]
    u32.visitedVoxelPositions[p33] = true
    if u32.debugMode then
        u32:makeDebugVoxelNode(p33)
    end
    local u34 = u3.new()
    local u35 = u32:getValidAdjacentVoxelPositions(p33)
    local v36 = u32.uniqueIdCounter
    u32.uniqueIdCounter = u32.uniqueIdCounter + 1
    local v37 = {}
    for _, v38 in u35 do
        v37[v38] = true
    end
    local v39 = u6.new(p33, v37, v36)
    u32.positionMap[p33] = v39
    u32.idMap[v36] = v39
    local function v42() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u32
            [3] = u34
        --]]
        for v40, v41 in u35 do
            local _ = v40 - 1
            if u32.visitedVoxelPositions[v41] == nil then
                u32.visitedVoxelPositions[v41] = true
                u34:Push(v41)
            end
        end
    end
    v42()
    while not u34:IsEmpty() do
        local v43 = u34:Pop()
        if v43 then
            if u32.debugMode then
                u32:makeDebugVoxelNode(v43)
            end
            local v44 = u32:getValidAdjacentVoxelPositions(v43)
            local v45 = u32.uniqueIdCounter
            u32.uniqueIdCounter = u32.uniqueIdCounter + 1
            local v46 = {}
            for _, v47 in v44 do
                v46[v47] = true
            end
            local v48 = u6.new(v43, v46, v45)
            u32.positionMap[v43] = v48
            u32.idMap[v45] = v48
            v42()
        end
    end
end
function u8.getValidAdjacentVoxelPositions(p49, p50) --[[ Line: 165 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v51 = 0
    local v52 = {}
    for v53, v54 in u7 do
        local _ = v53 - 1
        local v55 = p50 + v54 / 2
        local v56 = v54 + p50
        if not (p49:isValidVoxelNodePosition(v55) and p49:isValidVoxelNodePosition(v56)) then
            v56 = nil
        end
        if v56 ~= nil then
            v51 = v51 + 1
            v52[v51] = v56
        end
    end
    return v52
end
function u8.isValidVoxelNodePosition(p57, p58) --[[ Line: 194 ]]
    local v59 = p57:isBlockAboveEmpty(p58)
    if v59 then
        v59 = not p57:isBlockBelowEmpty(p58)
    end
    return v59
end
function u8.isBlockAboveEmpty(_, p60) --[[ Line: 197 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v61 = p60 + Vector3.new(0, 1, 0)
    return u2:getStore():getBlockAt(v61) == nil
end
function u8.isBlockBelowEmpty(_, p62) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v63 = p62 + Vector3.new(0, -1, 0)
    return u2:getStore():getBlockAt(v63) == nil
end
function u8.makeDebugVoxelNode(p64, p65) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
    --]]
    local v66 = u4("Part", {
        ["CanCollide"] = false,
        ["CanTouch"] = false,
        ["CanQuery"] = false,
        ["Anchored"] = true,
        ["CastShadow"] = false,
        ["Size"] = Vector3.new(0.5, 0.5, 0.5),
        ["Name"] = "VoxelNode@" .. tostring(p65),
        ["Color"] = Color3.fromRGB(0, 255, 0),
        ["Shape"] = Enum.PartType.Ball,
        ["Material"] = Enum.Material.SmoothPlastic,
        ["Position"] = u2:getWorldPosition(p65),
        ["Parent"] = p64.debugFolder or u5
    })
    p64.debugPartMap[p65] = v66
end
function u8.highlightDebugVoxelNodePath(u67, p68, p69) --[[ Line: 226 ]]
    local u70 = p69 == nil and 1 or p69
    if not u67.debugMode then
        return nil
    end
    local function v75(p71) --[[ Line: 234 ]]
        --[[
        Upvalues:
            [1] = u67
            [2] = u70
        --]]
        local u72 = u67.debugPartMap[p71]
        if not u72 then
            return nil
        end
        local u73 = u72.Color
        local u74 = u72.Size
        u72.Color = Color3.fromRGB(255, 0, 0)
        u72.Size = u72.Size * 3
        task.delay(u70, function() --[[ Line: 245 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u73
                [3] = u74
            --]]
            u72.Color = u73
            u72.Size = u74
        end)
    end
    for v76, v77 in p68 do
        v75(v77, v76 - 1, p68)
    end
end
return {
    ["AdjacencyMap"] = u8
}