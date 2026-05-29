local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.RunService
local u5 = v3.Workspace
return {
    ["VisualDebugUtil"] = {
        ["createDebugPart"] = function(p6, p7) --[[ Name: createDebugPart, Line 10 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u5
                [3] = u2
            --]]
            local v8
            if p7 == nil then
                v8 = p7
            else
                v8 = p7.showOutsideOfStudio
            end
            local v9 = not v8
            if v9 then
                v9 = not u4:IsStudio()
            end
            if v9 then
                return nil
            end
            local v10 = {}
            local v11
            if p7 == nil then
                v11 = p7
            else
                v11 = p7.name
            end
            v10.Name = v11 == nil and "DebugPart" or v11
            v10.Anchored = true
            local v12
            if p7 == nil then
                v12 = p7
            else
                v12 = p7.color
            end
            if v12 == nil then
                v12 = Color3.fromRGB(255, 0, 0)
            end
            v10.Color = v12
            local v13
            if p7 == nil then
                v13 = p7
            else
                v13 = p7.shape
            end
            if v13 == nil then
                v13 = Enum.PartType.Ball
            end
            v10.Shape = v13
            local v14
            if p7 == nil then
                v14 = p7
            else
                v14 = p7.size
            end
            v10.Size = v14 == nil and Vector3.new(0.5, 0.5, 0.5) or v14
            v10.CanCollide = false
            v10.Parent = u5
            local v15
            if p7 == nil then
                v15 = p7
            else
                v15 = p7.transparency
            end
            v10.Transparency = v15
            v10.Position = p6
            local u16 = u2("Part", v10)
            local v17
            if p7 == nil then
                v17 = p7
            else
                v17 = p7.lifetime
            end
            if v17 ~= nil then
                local v18 = task
                if p7 ~= nil then
                    p7 = p7.lifetime
                end
                v18.delay(p7, function() --[[ Line: 84 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                    --]]
                    u16:Destroy()
                end)
            end
            return u16
        end,
        ["createDebugLine"] = function(p19, p20, p21) --[[ Name: createDebugLine, Line 91 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u2
                [3] = u5
            --]]
            local v22
            if p21 == nil then
                v22 = p21
            else
                v22 = p21.showOutsideOfStudio
            end
            local v23 = not v22
            if v23 then
                v23 = not u4:IsStudio()
            end
            if v23 then
                return nil
            end
            local v24 = {}
            local v25
            if p21 == nil then
                v25 = p21
            else
                v25 = p21.name
            end
            v24.Name = v25 == nil and "DebugLine" or v25
            v24.Attachment0 = u2("Attachment", {
                ["Position"] = p19
            })
            v24.Attachment1 = u2("Attachment", {
                ["Position"] = p20
            })
            v24.Parent = u5
            local v26
            if p21 == nil then
                v26 = p21
            else
                v26 = p21.color
            end
            if v26 == nil then
                v26 = Color3.fromRGB(255, 0, 0)
            end
            v24.Color = ColorSequence.new(v26)
            v24.FaceCamera = true
            v24.Segments = 2
            v24.Brightness = 1
            v24.Transparency = NumberSequence.new(0)
            v24.Width0 = 0.5
            v24.Width1 = 0.5
            local u27 = u2("Beam", v24)
            local v28 = task
            if p21 ~= nil then
                p21 = p21.lifetime
            end
            local v29 = p21 == nil and 5 or p21
            v28.delay(v29, function() --[[ Line: 147 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27:Destroy()
            end)
            return u27
        end
    }
}