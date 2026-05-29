local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
return {
    ["CFrameUtil"] = {
        ["setPosition"] = function(p2, p3) --[[ Name: setPosition, Line 7 ]]
            local v4 = CFrame.new(p3) * p2:GetPivot().Rotation
            p2:PivotTo(v4)
            return v4
        end,
        ["setPositionAndGlobalRotationRadians"] = function(p5, p6, p7) --[[ Name: setPositionAndGlobalRotationRadians, Line 15 ]]
            local v8 = CFrame.new(p6) * CFrame.fromEulerAnglesYXZ(p7.X, p7.Y, p7.Z)
            p5:PivotTo(v8)
            return v8
        end,
        ["setPositionAndGlobalRotationDegrees"] = function(p9, p10, p11) --[[ Name: setPositionAndGlobalRotationDegrees, Line 23 ]]
            local v12 = p11.X
            local v13 = math.rad(v12)
            local v14 = p11.Y
            local v15 = math.rad(v14)
            local v16 = p11.Z
            local v17 = math.rad(v16)
            local v18 = Vector3.new(v13, v15, v17)
            local v19 = CFrame.new(p10) * CFrame.fromEulerAnglesYXZ(v18.X, v18.Y, v18.Z)
            p9:PivotTo(v19)
            return v19
        end,
        ["setGlobalRotationRadians"] = function(p20, p21, p22, p23) --[[ Name: setGlobalRotationRadians, Line 28 ]]
            local v24 = p20:GetPivot()
            local v25 = v24.Position
            if p21 == nil then
                p21 = v24.Rotation.X
            end
            if p22 == nil then
                p22 = v24.Rotation.Y
            end
            if p23 == nil then
                p23 = v24.Rotation.Z
            end
            local v26 = CFrame.new(v25) * CFrame.Angles(p21, p22, p23)
            p20:PivotTo(v26)
            return v26
        end,
        ["setGlobalRotationDegrees"] = function(p27, p28, p29, p30) --[[ Name: setGlobalRotationDegrees, Line 47 ]]
            local v31 = p27:GetPivot()
            local v32 = v31.Position
            if p28 == nil then
                local v33 = v31.Rotation.X
                p28 = math.deg(v33)
            end
            if p29 == nil then
                local v34 = v31.Rotation.Y
                p29 = math.deg(v34)
            end
            if p30 == nil then
                local v35 = v31.Rotation.Z
                p30 = math.deg(v35)
            end
            local v36 = CFrame.new(v32) * CFrame.Angles(math.rad(p28), math.rad(p29), (math.rad(p30)))
            p27:PivotTo(v36)
            return v36
        end,
        ["rotateLocalRadians"] = function(p37, p38) --[[ Name: rotateLocalRadians, Line 66 ]]
            local v39 = p37:GetPivot() * CFrame.fromEulerAnglesYXZ(p38.X, p38.Y, p38.Z)
            p37:PivotTo(v39)
            return v39
        end,
        ["rotateLocalDegrees"] = function(p40, p41) --[[ Name: rotateLocalDegrees, Line 74 ]]
            local v42 = p41.X
            local v43 = math.rad(v42)
            local v44 = p41.Y
            local v45 = math.rad(v44)
            local v46 = p41.Z
            local v47 = math.rad(v46)
            local v48 = Vector3.new(v43, v45, v47)
            local v49 = p40:GetPivot() * CFrame.fromEulerAnglesYXZ(v48.X, v48.Y, v48.Z)
            p40:PivotTo(v49)
            return v49
        end,
        ["rotateCframeLocalRadians"] = function(p50, p51) --[[ Name: rotateCframeLocalRadians, Line 79 ]]
            return p50 * CFrame.fromEulerAnglesYXZ(p51.X, p51.Y, p51.Z)
        end,
        ["rotateCframeLocalDegrees"] = function(p52, p53) --[[ Name: rotateCframeLocalDegrees, Line 86 ]]
            local v54 = p53.X
            local v55 = math.rad(v54)
            local v56 = p53.Y
            local v57 = math.rad(v56)
            local v58 = p53.Z
            local v59 = math.rad(v58)
            local v60 = Vector3.new(v55, v57, v59)
            return p52 * CFrame.fromEulerAnglesYXZ(v60.X, v60.Y, v60.Z)
        end,
        ["setCframePositionWithoutChangingRotation"] = function(p61, p62) --[[ Name: setCframePositionWithoutChangingRotation, Line 91 ]]
            return CFrame.new(p62) * p61.Rotation
        end,
        ["billboardOnYAxis"] = function(p63, _, p64) --[[ Name: billboardOnYAxis, Line 98 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            local v65 = p64 == nil and 0 or p64
            local v66 = u1.CurrentCamera
            if not v66 then
                return nil
            end
            local v67 = p63:GetPivot().Position
            local v68 = (v66.CFrame.Position - v67).Unit
            local v69 = v68.X
            local v70 = v68.Z
            local v71 = math.atan2(v69, v70)
            p63:PivotTo(CFrame.new(v67) * CFrame.Angles(0, v71 + math.rad(v65), 0))
        end,
        ["billboardToCameraOnlyOnYAxis"] = function(p72, p73) --[[ Name: billboardToCameraOnlyOnYAxis, Line 116 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            local v74 = p73 == nil and 0 or p73
            local v75 = u1.CurrentCamera
            if not v75 then
                return nil
            end
            local v76 = p72:GetPivot().Position
            local v77 = (v75.CFrame.Position - v76).Unit
            local v78 = v77.X
            local v79 = v77.Z
            local v80 = math.atan2(v78, v79)
            p72:PivotTo(CFrame.new(v76) * CFrame.Angles(0, v80 + math.rad(v74), 0))
        end,
        ["setXSize"] = function(p81, p82) --[[ Name: setXSize, Line 134 ]]
            local v83 = p81.Size
            local v84 = v83.Y
            local v85 = v83.Z
            p81.Size = Vector3.new(p82, v84, v85)
        end,
        ["setYSize"] = function(p86, p87) --[[ Name: setYSize, Line 139 ]]
            local v88 = p86.Size
            local v89 = v88.X
            local v90 = v88.Z
            p86.Size = Vector3.new(v89, p87, v90)
        end,
        ["setZSize"] = function(p91, p92) --[[ Name: setZSize, Line 144 ]]
            local v93 = p91.Size
            local v94 = v93.X
            local v95 = v93.Y
            p91.Size = Vector3.new(v94, v95, p92)
        end,
        ["multiplyXSize"] = function(p96, p97) --[[ Name: multiplyXSize, Line 149 ]]
            local v98 = p96.Size
            local v99 = v98.X * p97
            local v100 = v98.Y
            local v101 = v98.Z
            p96.Size = Vector3.new(v99, v100, v101)
        end,
        ["multiplyYSize"] = function(p102, p103) --[[ Name: multiplyYSize, Line 154 ]]
            local v104 = p102.Size
            local v105 = v104.X
            local v106 = v104.Y * p103
            local v107 = v104.Z
            p102.Size = Vector3.new(v105, v106, v107)
        end,
        ["multiplyZSize"] = function(p108, p109) --[[ Name: multiplyZSize, Line 159 ]]
            local v110 = p108.Size
            local v111 = v110.X
            local v112 = v110.Y
            local v113 = v110.Z * p109
            p108.Size = Vector3.new(v111, v112, v113)
        end
    }
}