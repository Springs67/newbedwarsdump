local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local u4 = v2.BlockHandler
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "CropBlockHandler"
    end,
    ["__index"] = u4
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p11, ...)
end
function u8.place(p12, p13, p14, _) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v15 = p12:createNewInstance(p14)
    v15.CFrame = CFrame.new(u3:getWorldPosition(p13))
    return v15
end
function u8.destroy(_, p16) --[[ Line: 31 ]]
    p16:Destroy()
end
function u8.createNewInstance(p17, _) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u6
    --]]
    local v18 = u5
    local v19 = {
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Name"] = p17:getBlockType()
    }
    local v20 = u7
    local v21 = u7
    local v22 = u7
    v19.Size = Vector3.new(v20, v21, v22)
    v19.CFrame = CFrame.new(Vector3.new(0, 0, 0))
    local v23 = v18("Part", v19)
    v23.Parent = u6
    local v24 = u5
    local v25 = {
        ["Name"] = "Soil",
        ["CastShadow"] = false,
        ["Anchored"] = false,
        ["CanCollide"] = true
    }
    local v26 = u7
    local v27 = u7
    v25.Size = Vector3.new(v26, 0.2, v27)
    v25.CFrame = CFrame.new(Vector3.new(0, -1.45, 0))
    v25.Material = Enum.Material.Sand
    v25.Color = Color3.fromRGB(85, 63, 48)
    local v28 = v24("Part", v25)
    v28.Parent = v23
    u5("WeldConstraint", {
        ["Part0"] = v28,
        ["Part1"] = v23,
        ["Parent"] = v28
    })
    v23.Parent = nil
    return v23
end
return {
    ["CropBlockHandler"] = u8
}