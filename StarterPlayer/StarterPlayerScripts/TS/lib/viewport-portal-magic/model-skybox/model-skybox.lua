local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Lighting
local u7 = v4.Players
local u8 = v4.RunService
local u9 = v4.Workspace
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "WorldModelHandler"
    end
})
u10.__index = u10
function u10.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    p13.trackedDeepModels = {}
    p13.trackedShallowModels = {}
    p13.worldModel = u3("WorldModel", {})
end
function u10.cloneObjectDescendants(_, p14) --[[ Line: 28 ]]
    local v15 = p14:GetDescendants()
    local v16 = {}
    for v17, v18 in pairs(v15) do
        v18:SetAttribute("_cloneMatch", v17)
    end
    p14.Archivable = true
    local v19 = p14:Clone()
    for _, v20 in ipairs(v19:GetDescendants()) do
        local v21 = v20:GetAttribute("_cloneMatch")
        if v21 ~= 0 and (v21 == v21 and v21) then
            local v22 = v15[v21]
            if v22 then
                v16[v22] = v20
                v15[v21] = nil
                v22:SetAttribute("_cloneMatch", nil)
            end
            v20:SetAttribute("_cloneMatch", nil)
        end
    end
    return {
        ["copy"] = v19,
        ["matches"] = v16
    }
end
function u10.trackCharacter(u23, u24) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
    --]]
    local v25 = u23:cloneObjectDescendants(u24)
    local u26 = v25.copy
    local v27 = v25.matches
    u5:RemoveTag(u26, "inventory-entity")
    for _, v28 in u26:GetDescendants() do
        if v28:IsA("BasePart") or v28:IsA("Decal") then
            v28.LocalTransparencyModifier = 0
        end
    end
    local v29 = u26:FindFirstChild("Animate")
    if v29 then
        v29:Destroy()
    end
    u26.Parent = u23.worldModel
    local v30 = {}
    for v31, v32 in v27 do
        if v31:IsA("BasePart") and v32:IsA("BasePart") then
            v32.Anchored = true
            v30[v31] = v32
        end
    end
    u23.trackedDeepModels[u26] = v30
    u24.AncestryChanged:Connect(function() --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u9
            [3] = u26
            [4] = u23
        --]]
        if not u24:IsDescendantOf(u9) then
            u26:Destroy()
            u23.trackedDeepModels[u26] = nil
        end
    end)
    return u26
end
function u10.addShallowModel(p33, p34) --[[ Line: 86 ]]
    local v35 = p34:Clone()
    p33.trackedShallowModels[p34] = v35
    v35.Parent = p33.worldModel
end
function u10.updateWorldModel(p36, p37) --[[ Line: 93 ]]
    if p37 == nil then
        p37 = Vector3.new()
    end
    for _, v38 in p36.trackedDeepModels do
        for v39, v40 in v38 do
            v40.CFrame = v39.CFrame + p37
        end
    end
    for v41, v42 in p36.trackedShallowModels do
        v42:PivotTo(v41:GetPivot())
    end
end
local u43 = u10
local u44 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 114 ]]
        return "ModelSkybox"
    end,
    ["__index"] = u43
})
u44.__index = u44
function u44.new(...) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u44
    --]]
    local v45 = u44
    local v46 = setmetatable({}, v45)
    return v46:constructor(...) or v46
end
function u44.constructor(u47, p48, p49) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u43
        [2] = u2
        [3] = u9
        [4] = u3
        [5] = u7
        [6] = u6
        [7] = u8
    --]]
    local v50 = p49 == nil and true or p49
    u43.constructor(u47)
    u47.origin = p48
    u47.maid = u2.new()
    u47.scale = 500
    u47.distance = 500
    u47.pos = Vector3.new()
    u47.pos = p48
    u47.currentCamera = u9.CurrentCamera
    u47.attachment = u3("Attachment", {
        ["Parent"] = u9.Terrain
    })
    u47.billboardGui = u3("BillboardGui", {
        ["ResetOnSpawn"] = false,
        ["Parent"] = u7.LocalPlayer:FindFirstChildOfClass("PlayerGui"),
        ["Adornee"] = u47.attachment
    })
    u47.camera = u3("Camera", {
        ["Parent"] = u47.billboardGui
    })
    u47.viewportFrame = u3("ViewportFrame", {
        ["BackgroundTransparency"] = 1,
        ["Ambient"] = Color3.fromRGB(200, 200, 200),
        ["LightColor"] = Color3.fromRGB(140, 140, 140),
        ["LightDirection"] = u6:GetSunDirection(),
        ["Size"] = UDim2.fromScale(1, 1),
        ["CurrentCamera"] = u47.camera,
        ["Parent"] = u47.billboardGui
    })
    u47.worldModel.Parent = u47.viewportFrame
    if v50 then
        u47.maid:GiveTask(u47.currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 158 ]]
            --[[
            Upvalues:
                [1] = u47
            --]]
            u47:updateBillboardSize()
        end))
        u47:updateBillboardSize()
        u47.maid:GiveTask(u8.Heartbeat:Connect(function() --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u47
            --]]
            u47:update()
        end))
    end
    u47.maid:GiveTask(function() --[[ Line: 166 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47.attachment:Destroy()
        u47.billboardGui:Destroy()
        u47.camera:Destroy()
        u47.viewportFrame:Destroy()
        u47.worldModel:Destroy()
    end)
end
function u44.update(p51) --[[ Line: 174 ]]
    local v52 = p51.pos - p51.origin
    local v53 = p51.pos + p51.currentCamera.CFrame.Position / p51.scale
    local v54 = p51.currentCamera.CFrame
    local v55 = CFrame.new(0, 0, -p51.distance)
    p51.attachment.WorldCFrame = v54 * v55
    p51.camera.CFrame = CFrame.fromMatrix(v53, p51.currentCamera.CFrame.RightVector, p51.currentCamera.CFrame.UpVector)
    p51.camera.FieldOfView = p51.currentCamera.FieldOfView
    p51:updateWorldModel(v52)
end
function u44.updateBillboardSize(p56) --[[ Line: 190 ]]
    p56.billboardGui.Size = UDim2.fromOffset(p56.currentCamera.ViewportSize.X, p56.currentCamera.ViewportSize.Y)
end
function u44.destroy(p57) --[[ Line: 193 ]]
    p57.maid:Destroy()
end
local u58 = u44
local u59 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 201 ]]
        return "ModelBillboard"
    end,
    ["__index"] = u58
})
u59.__index = u59
function u59.new(...) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u59
    --]]
    local v60 = u59
    local v61 = setmetatable({}, v60)
    return v61:constructor(...) or v61
end
function u59.constructor(u62, u63, u64, u65) --[[ Line: 211 ]]
    --[[
    Upvalues:
        [1] = u58
        [2] = u8
    --]]
    u58.constructor(u62, Vector3.new(), false)
    u62:trackCharacter(u63)
    u62.billboardGui.Size = UDim2.new(0.4, 0, 0.4, 0)
    u62.billboardGui.SizeOffset = Vector2.new(0, 0.4)
    u62.maid:GiveTask(u8.Heartbeat:Connect(function() --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u63
            [2] = u65
            [3] = u64
            [4] = u62
        --]]
        local v66 = u64 + (u63:GetPivot().Position - u65) * 0.01
        local v67 = u62.currentCamera.CFrame.LookVector * -1
        u62.attachment.CFrame = CFrame.new(v66 + Vector3.new(0, 0, 0))
        local v68 = CFrame
        local v69 = v67 * 10
        u62.camera.CFrame = v68.lookAt(v66 + v69, v66)
        u62.camera.FieldOfView = u62.currentCamera.FieldOfView
        u62:updateWorldModel(v66 - u63:GetPivot().Position)
    end))
end
return {
    ["WorldModelHandler"] = u10,
    ["ModelSkybox"] = u44,
    ["ModelBillboard"] = u59
}