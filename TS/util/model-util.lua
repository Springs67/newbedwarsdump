local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
return {
    ["ModelUtil"] = {
        ["scaleModel"] = function(p6, p7) --[[ Name: scaleModel, Line 11 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            local v8 = p6:GetPivot().Position
            for _, v9 in p6:GetDescendants() do
                if v9:IsA("BasePart") then
                    v9.Position = v8:Lerp(v9.Position, p7)
                    v9.Size = v9.Size * p7
                end
            end
            u5:scaleEffect({ p6 }, p7)
        end,
        ["tweenModelSize"] = v1.async(function(u10, p11, p12, u13) --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u2
            --]]
            local v14 = u10:GetDescendants()
            local function v16(p15) --[[ Line: 26 ]]
                if p15:IsA("BasePart") then
                    return {
                        p15,
                        {
                            ["size"] = p15.Size,
                            ["position"] = p15.Position
                        }
                    }
                end
            end
            local v17 = 0
            local v18 = {}
            for v19, v20 in v14 do
                local v21 = v16(v20, v19 - 1, v14)
                if v21 ~= nil then
                    v17 = v17 + 1
                    v18[v17] = v21
                end
            end
            local u22 = {}
            for _, v23 in v18 do
                u22[v23[1]] = v23[2]
            end
            local u24 = u10:GetPivot().Position
            u4(p11, p12, function(p25) --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u22
                    [3] = u2
                    [4] = u13
                    [5] = u24
                --]]
                for _, v26 in u10:GetDescendants() do
                    if v26:IsA("BasePart") then
                        local v27 = u22[v26]
                        if v27 ~= nil then
                            local v28 = u2(p25, 1, u13 - 1, 1)
                            v26.Position = u24:Lerp(v27.position, v28)
                            v26.Size = v27.size * v28
                        end
                    end
                end
            end, 0, 1):Wait()
        end),
        ["tweenModelSizeScaleTo"] = v1.async(function(u29, p30, p31, p32) --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            u4(p30, p31, function(p33) --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                if p33 == 0 then
                    u29:ScaleTo(0.0001)
                else
                    u29:ScaleTo(p33)
                end
            end, u29:GetScale(), p32):Wait()
        end),
        ["setModelTransparency"] = function(p34, u35) --[[ Name: setModelTransparency, Line 76 ]]
            local v36 = p34:GetDescendants()
            local function v38(p37) --[[ Line: 78 ]]
                --[[
                Upvalues:
                    [1] = u35
                --]]
                if p37:IsA("BasePart") or (p37:IsA("MeshPart") or (p37:IsA("Decal") or (p37:IsA("Texture") or p37:IsA("GuiObject")))) then
                    p37.Transparency = u35
                end
                if p37:IsA("ParticleEmitter") then
                    p37.Transparency = NumberSequence.new(u35)
                end
            end
            for v39, v40 in v36 do
                v38(v40, v39 - 1, v36)
            end
        end,
        ["tweenModelTransparency"] = function(u41, u42, p43, p44) --[[ Name: tweenModelTransparency, Line 91 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u4
            --]]
            if p44 == nil then
                p44 = u2
            end
            u4(p43, p44, function(u45) --[[ Line: 95 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u42
                --]]
                local v46 = u41:GetDescendants()
                local function v49(p47) --[[ Line: 97 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                        [2] = u45
                    --]]
                    if (p47:IsA("BasePart") or (p47:IsA("MeshPart") or (p47:IsA("Decal") or (p47:IsA("Texture") or p47:IsA("GuiObject"))))) and u42 ~= p47.Transparency then
                        local v48 = u42 > p47.Transparency
                        if v48 and u45 > p47.Transparency then
                            p47.Transparency = u45
                        elseif not v48 and u45 < p47.Transparency then
                            p47.Transparency = u45
                        end
                    end
                    if p47:IsA("ParticleEmitter") then
                        p47.Transparency = NumberSequence.new(u45)
                    end
                end
                for v50, v51 in v46 do
                    v49(v51, v50 - 1, v46)
                end
            end, 0, u42)
        end,
        ["computeBoundingBox"] = function(p52, p53, p54) --[[ Name: computeBoundingBox, Line 129 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            local v55 = p52:Inverse()
            local v56 = u3.Terrain
            local v57 = (1 / 0)
            local v58 = (-1 / 0)
            local v59 = (1 / 0)
            local v60 = (-1 / 0)
            local v61 = (1 / 0)
            local v62 = (-1 / 0)
            for _, v63 in p53 do
                if v63 ~= v56 then
                    local v64 = v63.CFrame
                    local v65 = v63.Size
                    local v66 = v65.X
                    local v67 = v65.Y
                    local v68 = v65.Z
                    local v69 = v55 * v64
                    local _, _, _, v70, v71, v72, v73, v74, v75, v76, v77, v78 = v69:GetComponents()
                    local v79 = v66 * v70
                    local v80 = math.abs(v79)
                    local v81 = v67 * v71
                    local v82 = v80 + math.abs(v81)
                    local v83 = v68 * v72
                    local v84 = (v82 + math.abs(v83)) * 0.5
                    local v85 = v66 * v73
                    local v86 = math.abs(v85)
                    local v87 = v67 * v74
                    local v88 = v86 + math.abs(v87)
                    local v89 = v68 * v75
                    local v90 = (v88 + math.abs(v89)) * 0.5
                    local v91 = v66 * v76
                    local v92 = math.abs(v91)
                    local v93 = v67 * v77
                    local v94 = v92 + math.abs(v93)
                    local v95 = v68 * v78
                    local v96 = (v94 + math.abs(v95)) * 0.5
                    local v97 = v69.X
                    local v98 = v69.Y
                    local v99 = v69.Z
                    local v100 = v97 - v84
                    v57 = math.min(v57, v100)
                    local v101 = v97 + v84
                    v58 = math.max(v58, v101)
                    local v102 = v98 - v90
                    v59 = math.min(v59, v102)
                    local v103 = v98 + v90
                    v60 = math.max(v60, v103)
                    local v104 = v99 - v96
                    v61 = math.min(v61, v104)
                    local v105 = v99 + v96
                    v62 = math.max(v62, v105)
                end
            end
            for _, v106 in p54 do
                local v107 = p52:PointToObjectSpace(v106.WorldPosition)
                local v108 = v107.X
                local v109 = v107.Y
                local v110 = v107.Z
                v57 = math.min(v57, v108)
                v58 = math.max(v58, v108)
                v59 = math.min(v59, v109)
                v60 = math.max(v60, v109)
                v61 = math.min(v61, v110)
                v62 = math.max(v62, v110)
            end
            local v111 = 0.5 * (v57 + v58)
            local v112 = 0.5 * (v59 + v60)
            local v113 = 0.5 * (v61 + v62)
            local v114 = Vector3.new(v111, v112, v113)
            local v115 = v58 - v57
            local v116 = v60 - v59
            local v117 = v62 - v61
            return { v114, (Vector3.new(v115, v116, v117)) }
        end
    }
}