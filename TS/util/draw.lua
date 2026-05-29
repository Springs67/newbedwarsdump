local u1 = game:GetService("Workspace")
local u2 = game:GetService("RunService")
local u3 = game:GetService("TextService")
local u4 = u1.Terrain
local u5 = Color3.new(1, 0, 0)
local u92 = {
    ["_defaultColor"] = u5,
    ["setColor"] = function(p6) --[[ Name: setColor, Line 17 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        u92._defaultColor = p6
    end,
    ["resetColor"] = function() --[[ Name: resetColor, Line 21 ]]
        --[[
        Upvalues:
            [1] = u92
            [2] = u5
        --]]
        u92._defaultColor = u5
    end,
    ["setRandomColor"] = function() --[[ Name: setRandomColor, Line 26 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        u92.setColor(Color3.fromHSV(math.random(), 0.5 + 0.5 * math.random(), 1))
    end,
    ["ray"] = function(p7, p8, p9, p10, p11) --[[ Name: ray, Line 36 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        local v12 = typeof(p7) == "Ray"
        assert(v12, "Bad typeof(ray) for Ray")
        local v13 = p8 or u92._defaultColor
        local v14 = p9 or u92.getDefaultParent()
        local v15 = p10 or 0.2
        local v16 = p11 or 0.2
        local v17 = p7.Origin + p7.Direction / 2
        local v18 = Instance.new("Part")
        v18.Material = Enum.Material.ForceField
        v18.Anchored = true
        v18.Archivable = false
        v18.CanCollide = false
        v18.CastShadow = false
        v18.CFrame = CFrame.new(v17, p7.Origin + p7.Direction) * CFrame.Angles(1.5707963267948966, 0, 0)
        v18.Color = v13
        v18.Name = "DebugRay"
        v18.Shape = Enum.PartType.Cylinder
        local v19 = p7.Direction.Magnitude
        v18.Size = Vector3.new(v16, v19, v16)
        v18.TopSurface = Enum.SurfaceType.Smooth
        v18.Transparency = 0.5
        local v20 = Instance.new("Part")
        v20.Name = "RotatedPart"
        v20.Anchored = true
        v20.Archivable = false
        v20.CanCollide = false
        v20.CastShadow = false
        v20.CFrame = CFrame.new(p7.Origin, p7.Origin + p7.Direction)
        v20.Transparency = 1
        v20.Size = Vector3.new(1, 1, 1)
        v20.Parent = v18
        local v21 = Instance.new("LineHandleAdornment")
        v21.Name = "DrawRayLineHandleAdornment"
        v21.Length = p7.Direction.Magnitude
        v21.Thickness = 5 * v16
        v21.ZIndex = 3
        v21.Color3 = v13
        v21.AlwaysOnTop = true
        v21.Transparency = 0
        v21.Adornee = v20
        v21.Parent = v20
        local v22 = Instance.new("SpecialMesh")
        v22.Name = "DrawRayMesh"
        v22.Scale = Vector3.new(0, 1, 0) + Vector3.new(v15, 0, v15) / v16
        v22.Parent = v18
        v18.Parent = v14
        return v18
    end,
    ["updateRay"] = function(p23, p24, p25) --[[ Name: updateRay, Line 92 ]]
        local v26 = p25 or p23.Color
        local v27 = p23.Size.x
        local v28 = p24.Origin + p24.Direction / 2
        p23.CFrame = CFrame.new(v28, p24.Origin + p24.Direction) * CFrame.Angles(1.5707963267948966, 0, 0)
        local v29 = p24.Direction.Magnitude
        p23.Size = Vector3.new(v27, v29, v27)
        p23.Color = v26
        local v30 = p23:FindFirstChild("RotatedPart")
        if v30 then
            v30.CFrame = CFrame.new(p24.Origin, p24.Origin + p24.Direction)
        end
        if v30 then
            v30 = v30:FindFirstChild("DrawRayLineHandleAdornment")
        end
        if v30 then
            v30.Length = p24.Direction.Magnitude
            v30.Thickness = 5 * v27
            v30.Color3 = v26
        end
    end,
    ["text"] = function(p31, p32, p33) --[[ Name: text, Line 115 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u92
        --]]
        if typeof(p31) == "Vector3" then
            local v34 = Instance.new("Attachment")
            v34.WorldPosition = p31
            v34.Parent = u4
            v34.Name = "DebugTextAttachment"
            u92._textOnAdornee(v34, p32, p33)
            return v34
        end
        if typeof(p31) == "Instance" then
            return u92._textOnAdornee(p31, p32, p33)
        end
        error("Bad adornee")
    end,
    ["_textOnAdornee"] = function(p35, p36, p37) --[[ Name: _textOnAdornee, Line 132 ]]
        --[[
        Upvalues:
            [1] = u92
            [2] = u3
        --]]
        local v38 = Instance.new("BillboardGui")
        v38.Name = "DebugBillboardGui"
        v38.SizeOffset = Vector2.new(0, 0.5)
        v38.ExtentsOffset = Vector3.new(0, 1, 0)
        v38.AlwaysOnTop = true
        v38.Adornee = p35
        v38.StudsOffset = Vector3.new(0, 0, 0.01)
        local v39 = Instance.new("Frame")
        v39.Name = "Background"
        v39.Size = UDim2.new(1, 0, 1, 0)
        v39.Position = UDim2.new(0.5, 0, 1, 0)
        v39.AnchorPoint = Vector2.new(0.5, 1)
        v39.BackgroundTransparency = 0.3
        v39.BorderSizePixel = 0
        v39.BackgroundColor3 = p37 or u92._defaultColor
        v39.Parent = v38
        local v40 = Instance.new("TextLabel")
        v40.Text = tostring(p36)
        v40.TextScaled = true
        v40.TextSize = 32
        v40.BackgroundTransparency = 1
        v40.BorderSizePixel = 0
        v40.TextColor3 = Color3.new(1, 1, 1)
        v40.Size = UDim2.new(1, 0, 1, 0)
        v40.Parent = v39
        if tonumber(p36) then
            v40.Font = Enum.Font.Code
        else
            v40.Font = Enum.Font.GothamSemibold
        end
        local v41 = u3:GetTextSize(v40.Text, v40.TextSize, v40.Font, Vector2.new(1024, 1000000))
        local v42 = v41.y / v40.TextSize
        local v43 = v40.TextSize * 0.5
        local v44 = v41.y + 2 * v43
        local v45 = v41.x + 2 * v43
        local v46 = v45 / v44
        local v47 = Instance.new("UIAspectRatioConstraint")
        v47.AspectRatio = v46
        v47.Parent = v39
        local v48 = Instance.new("UIPadding")
        v48.PaddingBottom = UDim.new(v43 / v44, 0)
        v48.PaddingTop = UDim.new(v43 / v44, 0)
        v48.PaddingLeft = UDim.new(v43 / v45, 0)
        v48.PaddingRight = UDim.new(v43 / v45, 0)
        v48.Parent = v39
        local v49 = Instance.new("UICorner")
        v49.CornerRadius = UDim.new(v43 / v44 / 2, 0)
        v49.Parent = v39
        local v50 = v42 * 2 * 2 * 0.5
        v38.Size = UDim2.new(v50 * v46, 0, v50, 0)
        v38.Parent = p35
        return v38
    end,
    ["sphere"] = function(p51, p52, p53, p54) --[[ Name: sphere, Line 206 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        return u92.point(p51, p53, p54, p52 * 2)
    end,
    ["point"] = function(p55, p56, p57, p58) --[[ Name: point, Line 215 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        if typeof(p55) == "CFrame" then
            p55 = p55.p
        end
        local v59 = typeof(p55) == "Vector3"
        assert(v59, "Bad vector3")
        local v60 = p56 or u92._defaultColor
        local v61 = p57 or u92.getDefaultParent()
        local v62 = p58 or 1
        local v63 = Instance.new("Part")
        v63.Material = Enum.Material.ForceField
        v63.Anchored = true
        v63.Archivable = false
        v63.BottomSurface = Enum.SurfaceType.Smooth
        v63.CanCollide = false
        v63.CastShadow = false
        v63.CFrame = CFrame.new(p55)
        v63.Color = v60
        v63.Name = "DebugPoint"
        v63.Shape = Enum.PartType.Ball
        v63.Size = Vector3.new(v62, v62, v62)
        v63.TopSurface = Enum.SurfaceType.Smooth
        v63.Transparency = 0.5
        local v64 = Instance.new("SphereHandleAdornment")
        v64.Archivable = false
        v64.Radius = v62 / 4
        v64.Color3 = v60
        v64.AlwaysOnTop = true
        v64.Adornee = v63
        v64.ZIndex = 2
        v64.Parent = v63
        v63.Parent = v61
        return v63
    end,
    ["labelledPoint"] = function(p65, p66, p67, p68) --[[ Name: labelledPoint, Line 255 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        if typeof(p65) == "CFrame" then
            p65 = p65.p
        end
        local v69 = u92.point(p65, p67, p68)
        u92.text(v69, p66, p67)
        return v69
    end,
    ["cframe"] = function(p70) --[[ Name: cframe, Line 267 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        local v71 = Instance.new("Model")
        v71.Name = "DebugCFrame"
        local v72 = p70.Position
        u92.point(v72, nil, v71, 0.1)
        u92.ray(Ray.new(v72, p70.XVector), Color3.new(0.75, 0.25, 0.25), v71, 0.1).Name = "XVector"
        u92.ray(Ray.new(v72, p70.YVector), Color3.new(0.25, 0.75, 0.25), v71, 0.1).Name = "YVector"
        u92.ray(Ray.new(v72, p70.ZVector), Color3.new(0.25, 0.25, 0.75), v71, 0.1).Name = "ZVector"
        v71.Parent = u92.getDefaultParent()
        return v71
    end,
    ["box"] = function(p73, p74, p75) --[[ Name: box, Line 297 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        local v76 = typeof(p74) == "Vector3"
        assert(v76, "Bad size")
        local v77 = p75 or u92._defaultColor
        if typeof(p73) == "Vector3" then
            p73 = CFrame.new(p73) or p73
        end
        local v78 = Instance.new("Part")
        v78.Color = v77
        v78.Material = Enum.Material.ForceField
        v78.Name = "DebugPart"
        v78.Anchored = true
        v78.CanCollide = false
        v78.CastShadow = false
        v78.Archivable = false
        v78.BottomSurface = Enum.SurfaceType.Smooth
        v78.TopSurface = Enum.SurfaceType.Smooth
        v78.Transparency = 0.75
        v78.Size = p74
        v78.CFrame = p73
        local v79 = Instance.new("BoxHandleAdornment")
        v79.Adornee = v78
        v79.Size = p74
        v79.Color3 = v77
        v79.AlwaysOnTop = true
        v79.Transparency = 0.75
        v79.ZIndex = 1
        v79.Parent = v78
        v78.Parent = u92.getDefaultParent()
        return v78
    end,
    ["region3"] = function(p80, p81) --[[ Name: region3, Line 331 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        return u92.box(p80.CFrame, p80.Size, p81)
    end,
    ["terrainCell"] = function(p82, p83) --[[ Name: terrainCell, Line 335 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u92
        --]]
        local v84 = u4:WorldToCell(p82)
        local v85 = u4:CellCenterToWorld(v84.x, v84.y, v84.z)
        local v86 = u92.box(CFrame.new(v85), Vector3.new(4, 4, 4), p83)
        v86.Name = "DebugTerrainCell"
        return v86
    end,
    ["vector"] = function(p87, p88, p89, p90, p91) --[[ Name: vector, Line 347 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        return u92.ray(Ray.new(p87, p88), p89, p90, p91)
    end,
    ["getDefaultParent"] = function() --[[ Name: getDefaultParent, Line 351 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
        --]]
        if u2:IsRunning() then
            return u2:IsServer() and u1 or u1.CurrentCamera
        else
            return u1.CurrentCamera
        end
    end
}
return u92