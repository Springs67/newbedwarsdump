local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Lighting
local u6 = v4.Players
local u7 = v4.StarterGui
local u8 = v4.Workspace
local v9 = {}
local function u16(p10, p11) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u5
    --]]
    local v12 = u3("Camera", {
        ["FieldOfView"] = u8.CurrentCamera.FieldOfView,
        ["CFrame"] = u8.CurrentCamera.CFrame
    })
    local v13 = u3("ViewportFrame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = Vector2.new(0, 0),
        ["Position"] = UDim2.fromScale(0, 0),
        ["LightColor"] = Color3.fromRGB(255, 255, 255),
        ["LightDirection"] = u5:GetSunDirection(),
        ["CurrentCamera"] = v12
    })
    local v14 = u3("WorldModel", {
        ["Parent"] = v13
    })
    v12.Parent = v13
    if not p11 then
        return {
            ["undefined"] = nil,
            ["viewportFrame"] = v13,
            ["worldModel"] = v14,
            ["camera"] = v12
        }
    end
    p11.Archivable = true
    local v15 = p11:Clone()
    v15:PivotTo(p10)
    v15.Parent = v14
    return {
        ["viewportFrame"] = v13,
        ["clone"] = v15,
        ["worldModel"] = v14,
        ["camera"] = v12
    }
end
v9.createViewportSetup = u16
local function u29(p17) --[[ Line: 52 ]]
    local v18 = p17.Adornee
    if v18 == nil then
        return nil
    end
    local v19 = Vector3.FromNormalId(p17.Face) * -1
    local v20 = v19.Y
    local v21
    if math.abs(v20) == 1 then
        local v22 = v19.Y
        v21 = Vector3.new(v22, 0, 0)
    else
        v21 = Vector3.new(0, 1, 0)
    end
    local v23 = CFrame.fromAxisAngle(v21, 1.5707963267948966) * v19
    local v24 = v19:Cross(v23).Unit
    local v25 = v18.CFrame
    local v26 = CFrame
    local v27 = v19 * -1
    local v28 = v18.Size / 2
    return {
        ["cf"] = v25 * v26.fromMatrix(v27 * v28, v23, v24, v19),
        ["size"] = Vector2.new((v18.Size * v23).Magnitude, (v18.Size * v24).Magnitude)
    }
end
v9.getSurfaceInfo = u29
function v9.createFaces(p30, p31, p32) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u3
        [3] = u2
        [4] = u7
        [5] = u6
    --]]
    if p32 == nil then
        p32 = Enum.NormalId:GetEnumItems()
    end
    local v33 = {}
    for _, v34 in p32 do
        local v35
        if p31 == nil then
            v35 = p31
        else
            v35 = p31:GetPivot()
        end
        if v35 == nil then
            v35 = p30:GetPivot()
        end
        local v36 = u16(v35, p31)
        local v37 = {}
        local v38 = u3
        local v39 = "SurfaceGui"
        local v40 = {
            ["ResetOnSpawn"] = false,
            ["LightInfluence"] = 1,
            ["ClipsDescendants"] = true,
            ["Adornee"] = p30,
            ["Face"] = v34,
            ["SizingMode"] = Enum.SurfaceGuiSizingMode.FixedSize,
            ["CanvasSize"] = Vector2.new(800, 800),
            ["Children"] = { v36.viewportFrame }
        }
        local v41
        if u2.isHoarceKat() then
            v41 = u7
        else
            v41 = u6.LocalPlayer:FindFirstChildOfClass("PlayerGui")
        end
        v40.Parent = v41
        v37.surfaceGui = v38(v39, v40)
        v37.slice = v36
        v33[v34] = v37
    end
    return v33
end
function v9.update(p42, p43) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u29
    --]]
    local v44 = u8.CurrentCamera.CFrame
    local v45 = u29(p42)
    if v45 == nil then
        return nil
    end
    if v45.cf:PointToObjectSpace(v44.Position).Z > 0 then
        return nil
    end
    local v46 = v45.cf.YVector:Cross(v44.ZVector)
    local v47
    if v46:Dot(v46) > 0 then
        v47 = v46.Unit
    else
        v47 = v44.XVector
    end
    local v48 = CFrame.fromMatrix(v44.Position, v47, v45.cf.YVector)
    local v49 = v45.cf
    local v50 = v45.size.Y / 2
    local v51 = v49 * Vector3.new(0, v50, 0)
    local v52 = v45.cf
    local v53 = -v45.size.Y / 2
    local v54 = v52 * Vector3.new(0, v53, 0)
    local v55 = v48:PointToObjectSpace(v51)
    local v56 = v48:PointToObjectSpace(v54)
    local v57 = (v55 * Vector3.new(0, 1, 1)).Unit
    local v58 = (v56 * Vector3.new(0, 1, 1)).Unit
    local v59 = v57.Y
    local v60 = math.sign(v59)
    local v61 = -v57.Z
    local v62 = v60 * math.acos(v61)
    local v63 = v58.Y
    local v64 = math.sign(v63)
    local v65 = -v58.Z
    local v66 = v64 * math.acos(v65)
    local v67 = u8.CurrentCamera.FieldOfView / 2
    local v68 = math.rad(v67)
    local v69 = math.tan(v68) * 2
    local v70 = (math.tan(v62) - math.tan(v66)) / v69
    local v71 = v45.cf:VectorToObjectSpace(v45.cf.Position - v44.Position)
    local v72 = (v71 * Vector3.new(1, 0, 1)).Unit
    local v73 = v71 * Vector3.new(0, 1, 1)
    local v74 = -v72.Z
    local v75 = (v45.cf:VectorToObjectSpace(v44.LookVector) * Vector3.new(1, 0, 1)).Unit:Dot(v72) / v74
    local v76 = 1 - v74 * v74
    local v77 = math.sqrt(v76) / v74
    local v78 = v45.size.X / v45.size.Y
    local v79 = v71.X * v71.Z
    local v80 = math.sign(v79) * v77
    local v81 = v73.Y / v73.Z * v78
    local v82 = v75 * v70 * v78
    local v83 = math.abs(v82)
    local v84 = v45.cf
    local v85 = v45.cf.Position
    local v86 = CFrame.fromEulerAnglesXYZ(0, 3.141592653589793, 0)
    local v87 = CFrame.new(0, 0, 0, 1, 0, 0, 0, v78, 0, v80, v81, v83)
    local v88 = {}
    local v89 = 0
    for v90, v91 in { ((v84 - v85) * v86 * v87):GetComponents() } do
        v88[v90] = v91
    end
    for _, v92 in v88 do
        local v93 = math.abs(v92)
        v89 = math.max(v89, v93)
    end
    for v94, v95 in ipairs(v88) do
        v88[v94 - 1 + 1] = v95 / v89
    end
    local v96 = CFrame.new(unpack(v88)) + v44.Position
    p43.camera.FieldOfView = u8.CurrentCamera.FieldOfView
    p43.camera.CFrame = v96
end
return v9