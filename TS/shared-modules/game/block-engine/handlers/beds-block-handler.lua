local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local u4 = v2.PrefabBlockHandler
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").snapBlockRotation
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "BedBlockHandler"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, ...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p10, ...)
end
function u7.place(p11, p12, p13, p14) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v15 = u4.place(p11, p12, p13, p14)
    local v16 = v15:FindFirstChild("Bed")
    if v16 then
        v16.Color = u5.hexColor(p13)
    end
    local v17 = v15:FindFirstChild("Blanket")
    if v17 then
        v17.Color = u5.brighten(u5.hexColor(p13), 0.2)
    end
    local v18 = v15:FindFirstChild("Bed")
    if v18 ~= nil then
        v18 = v18:FindFirstChildOfClass("SurfaceAppearance")
    end
    if v18 then
        v18.Color = u5.hexColor(p13)
    end
    local v19 = v15:FindFirstChild("Carpet")
    if v19 then
        v19.Color = u5.hexColor(p13)
    end
    return v15
end
function u7.getContainedPositions(_, p20) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
    --]]
    local v21 = p20.Position
    local v22 = select(2, p20.CFrame:ToOrientation())
    local v23 = u6((math.deg(v22)))
    local v24 = Vector3.new(0)
    local v25 = v23 == 0 and Vector3.new(0, 0, 1) or (v23 == 270 and Vector3.new(-1, 0, 0) or (v23 == 180 and Vector3.new(0, 0, -1) or (v23 == 90 and Vector3.new(1, 0, 0) or v24)))
    local v26 = u3:getBlockPosition(v21)
    return { v26, v26 + v25 }
end
return {
    ["BedBlockHandler"] = u7
}