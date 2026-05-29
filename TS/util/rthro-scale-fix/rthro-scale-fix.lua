local function u6(p1, p2) --[[ Line: 11 ]]
    for _, v3 in pairs(p1:GetChildren()) do
        if v3:IsA("Attachment") and not p2:FindFirstChild(v3.Name) then
            local v4 = Instance.new("Vector3Value")
            v4.Name = v3.Name
            v4.Value = v3.Position
            v4.Parent = p2
        end
    end
    local v5 = p1:FindFirstChild("AvatarPartScaleType")
    if v5 and not p2:FindFirstChild("AvatarPartScaleType") then
        v5:Clone().Parent = p2
    end
end
local function u19(p7) --[[ Line: 27 ]]
    local v8 = p7.RootPart
    local v9 = p7.Parent
    local v10 = v9.UpperTorso
    local v11 = v9.Head
    local v12 = v9.LowerTorso.Root
    local v13 = v10.Waist
    local v14 = v11.Neck
    local v15 = v12.C0 * v12.C1:Inverse() * v13.C0 * v13.C1:Inverse()
    local v16 = v15 * v14.C0 * v14.C1:Inverse()
    local v17 = v15.Y + v10.Size.Y / 2
    local v18 = v16.Y + v11.Size.Y / 2
    return math.max(v17, v18) + v8.Size.Y / 2 + p7.HipHeight
end
return function(p20) --[[ Name: rthroScaleFix, Line 51 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u6
    --]]
    local v21 = p20.Humanoid
    local v22 = v21.RootPart
    local v23 = v22.CFrame * CFrame.new(0, -(v22.Size.Y / 2 + v21.HipHeight), 0)
    local v24 = 5 / u19(v21)
    local v25 = v21:FindFirstChild("BodyHeightScale")
    local v26 = v24 * (not v25 and 1 or v25.Value)
    local v27 = p20.Head
    local v28 = v27:FindFirstChildWhichIsA("SpecialMesh")
    local v29 = v28.MeshType == Enum.MeshType.FileMesh
    local v30 = {}
    for _, v31 in pairs(p20:GetChildren()) do
        if v31:IsA("Accessory") then
            v31:FindFirstChildWhichIsA("BasePart"):FindFirstChild("AccessoryWeld"):Destroy()
            v31.Parent = nil
            v30[v31] = true
        end
    end
    u6(v27, v28)
    for _, v32 in pairs(p20:GetDescendants()) do
        if v32:IsA("Motor6D") then
            local v33 = v32.C0.Position
            local v34 = v32.C1.Position
            v32.C0 = v32.C0 - v33 + v33 * v26
            v32.C1 = v32.C1 - v34 + v34 * v26
        elseif v32:IsA("Attachment") then
            v32.Position = v32.Position * v26
            v32.OriginalPosition.Value = v32.OriginalPosition.Value * v26
        elseif v32.Name == "OriginalSize" then
            local v35 = v32.Parent
            if v35:IsA("BasePart") then
                v35.Size = v35.Size * v26
                v32.Value = v32.Value * v26
            elseif v35 == v28 then
                for _, v36 in pairs(v35:GetChildren()) do
                    if v36:IsA("Vector3Value") and v36 ~= v32 then
                        v36.Value = v36.Value * v26
                    end
                end
                if v29 then
                    v35.Scale = v35.Scale * v26
                    v32.Value = v32.Value * v26
                end
            end
        end
    end
    for v37, _ in pairs(v30) do
        local v38 = v37:FindFirstChildWhichIsA("BasePart")
        v38.OriginalSize.Value = v38.OriginalSize.Value * v26
        v21:AddAccessory(v37)
    end
    v21.HipHeight = v21.HipHeight * v26
    v22.CFrame = v23 * CFrame.new(0, v22.Size.Y / 2 + v21.HipHeight, 0)
end