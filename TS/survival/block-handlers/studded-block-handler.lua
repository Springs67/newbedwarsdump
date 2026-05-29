local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").GreedyBlockHandler
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v6 = {}
local u7 = setmetatable({}, {
    ["__index"] = v6
})
u7.TopSurface = "TopSurface"
v6.TopSurface = "TopSurface"
u7.BottomSurface = "BottomSurface"
v6.BottomSurface = "BottomSurface"
u7.LeftSurface = "LeftSurface"
v6.LeftSurface = "LeftSurface"
u7.RightSurface = "RightSurface"
v6.RightSurface = "RightSurface"
u7.FrontSurface = "FrontSurface"
v6.FrontSurface = "FrontSurface"
u7.BackSurface = "BackSurface"
v6.BackSurface = "BackSurface"
local u8 = {
    [Enum.NormalId.Top] = u7.TopSurface,
    [Enum.NormalId.Bottom] = u7.BottomSurface,
    [Enum.NormalId.Left] = u7.LeftSurface,
    [Enum.NormalId.Right] = u7.RightSurface,
    [Enum.NormalId.Front] = u7.FrontSurface,
    [Enum.NormalId.Back] = u7.BackSurface
}
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "StuddedBlockHandler"
    end,
    ["__index"] = u2
})
u9.__index = u9
function u9.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, p13, p14, p15, p16, p17) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.constructor(p12, p13, p14, p15)
    p12.color = p16
    p12.surfaces = p17
end
function u9.createNewInstance(p18, _) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u3
        [4] = u4
    --]]
    local v19 = {
        ["Anchored"] = true,
        ["CanCollide"] = true,
        ["CastShadow"] = true,
        ["Name"] = p18:getBlockType()
    }
    local v20 = u5
    local v21 = u5
    local v22 = u5
    v19.Size = Vector3.new(v20, v21, v22)
    v19.Material = Enum.Material.Plastic
    v19.Color = p18.color
    for v23, v24 in p18.surfaces or {
        [u7.TopSurface] = Enum.SurfaceType.Studs,
        [u7.BottomSurface] = Enum.SurfaceType.Inlet
    } do
        v19[v23] = v24
    end
    local v25 = u3("Part", v19)
    if u4:IsServer() and u4:IsRunning() then
        v25.CollisionGroup = "Blocks"
    end
    return v25
end
function u9.createFace(p26, p27, _, p28) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u2
    --]]
    if p27.MaterialVariant ~= "" then
        return nil
    end
    local v29
    if p26.surfaces then
        v29 = p26.surfaces[u8[p28]]
    elseif p28 == Enum.NormalId.Top then
        v29 = Enum.SurfaceType.Studs
    else
        v29 = nil
    end
    local v30
    if p26.surfaces then
        v30 = p26.surfaces[u8[p28]]
    elseif p28 == Enum.NormalId.Top then
        v30 = Enum.SurfaceType.Studs
    else
        v30 = nil
    end
    debug.profilebegin("create-face")
    local v31 = u3("CornerWedgePart", {
        ["Size"] = Vector3.new(3, 0, 3),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Color"] = p26.color,
        ["TopSurface"] = v29,
        ["BottomSurface"] = v30,
        ["Material"] = Enum.Material.Plastic
    })
    if v31 then
        v31.Name = p28.Name
    end
    u2.updateFacePositionSize(p26, v31, p27, p28)
    debug.profileend()
    return v31
end
return {
    ["Surfaces"] = u7,
    ["StuddedBlockHandler"] = u9
}