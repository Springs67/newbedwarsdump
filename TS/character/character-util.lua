local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animate-script-util").AnimateScriptUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
return {
    ["CharacterUtil"] = {
        ["getCharacterScale"] = function(p5) --[[ Name: getCharacterScale, Line 9 ]]
            return p5:WaitForChild("Humanoid").BodyDepthScale.Value
        end,
        ["getHumanoidCameraFocusPosition"] = function(p6) --[[ Name: getHumanoidCameraFocusPosition, Line 14 ]]
            local v7
            if p6 == nil then
                v7 = p6
            else
                v7 = p6.RootPart
            end
            if not v7 then
                return nil
            end
            local v8 = p6.RootPart.Size.Y / 2 + 0.5
            local v9 = Vector3.new(0, v8, 0)
            if p6 ~= nil then
                p6 = p6.RootPart.Position + v9
            end
            return p6
        end,
        ["getPlayerCameraFocusPosition"] = function(p10) --[[ Name: getPlayerCameraFocusPosition, Line 30 ]]
            local v11 = p10.Character
            if v11 ~= nil then
                v11 = v11:FindFirstChildOfClass("Humanoid")
            end
            if not v11 then
                return nil
            end
            local v12
            if v11 == nil then
                v12 = v11
            else
                v12 = v11.RootPart
            end
            if not v12 then
                return nil
            end
            local v13 = v11.RootPart.Size.Y / 2 + 0.5
            local v14 = Vector3.new(0, v13, 0)
            if v11 ~= nil then
                v11 = v11.RootPart.Position + v14
            end
            return v11
        end,
        ["getHumanoidCameraFocusOffsetHeight"] = function(p15) --[[ Name: getHumanoidCameraFocusOffsetHeight, Line 42 ]]
            local v16
            if p15 == nil then
                v16 = p15
            else
                v16 = p15.RootPart
            end
            if v16 then
                return p15.RootPart.Size.Y / 2 + 0.5
            else
                return nil
            end
        end,
        ["getPlayerCameraFocusOffsetHeight"] = function(p17) --[[ Name: getPlayerCameraFocusOffsetHeight, Line 53 ]]
            local v18 = p17.Character
            if v18 ~= nil then
                v18 = v18:FindFirstChildOfClass("Humanoid")
            end
            if v18 then
                local v19
                if v18 == nil then
                    v19 = v18
                else
                    v19 = v18.RootPart
                end
                if v19 then
                    return v18.RootPart.Size.Y / 2 + 0.5
                else
                    return nil
                end
            else
                return nil
            end
        end,
        ["sanitizeBedwarsChar"] = function(p20, p21, p22) --[[ Name: sanitizeBedwarsChar, Line 76 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u4
                [3] = u3
            --]]
            local v23
            if p21 == nil then
                v23 = p21
            else
                v23 = p21:GetAttribute("UsingKitSkinModel")
            end
            if v23 == nil then
                v23 = false
            end
            if p21 and (not p21:HasAppearanceLoaded() and (v23 == 0 or (v23 ~= v23 or (v23 == "" or not v23)))) then
                p21.CharacterAppearanceLoaded:Wait()
            end
            local v24 = p20:WaitForChild("Humanoid")
            local v25
            if p22 == nil then
                v25 = p22
            else
                v25 = p22.ignoreScale
            end
            if not v25 then
                if not v24:FindFirstChild("BodyHeightScale") then
                    u2("NumberValue", {
                        ["Name"] = "BodyHeightScale",
                        ["Value"] = 1,
                        ["Parent"] = v24
                    })
                end
                if not v24:FindFirstChild("BodyWidthScale") then
                    u2("NumberValue", {
                        ["Name"] = "BodyWidthScale",
                        ["Value"] = 1,
                        ["Parent"] = v24
                    })
                end
                if not v24:FindFirstChild("BodyDepthScale") then
                    u2("NumberValue", {
                        ["Name"] = "BodyDepthScale",
                        ["Value"] = 1,
                        ["Parent"] = v24
                    })
                end
                if not v24:FindFirstChild("HeadScale") then
                    u2("NumberValue", {
                        ["Name"] = "HeadScale",
                        ["Value"] = 1,
                        ["Parent"] = v24
                    })
                end
            end
            v24.BreakJointsOnDeath = false
            v24.RequiresNeck = false
            if v23 == true then
                return nil
            end
            local v26 = v24:GetAppliedDescription()
            v26.Torso = 0
            v26.RightLeg = 0
            v26.LeftLeg = 0
            v26.RightArm = 0
            v26.LeftArm = 0
            local v27
            if p22 == nil then
                v27 = p22
            else
                v27 = p22.ignoreScale
            end
            if not v27 then
                v26.HeadScale = 1
                v26.DepthScale = 1
                v26.WidthScale = 0.95
                v26.HeightScale = 1
                v26.BodyTypeScale = 0
                v26.ProportionScale = 1
            end
            local v28 = u4:getEntity(p20)
            if v28 ~= nil then
                v28 = v28:getInstance()
            end
            if v28 then
                u3.validateAnimations(v28)
            end
            if p22 ~= nil then
                p22 = p22.ignoreScale
            end
            if not p22 then
                v24:ApplyDescription(v26)
            end
            for _, v29 in p20:GetDescendants() do
                if v29:IsA("ParticleEmitter") or v29:IsA("Smoke") then
                    v29:Destroy()
                end
            end
            local v30 = {}
            for _, v31 in p20:GetChildren() do
                if v31:IsA("Accessory") and v31.Name ~= "HatAttachment" then
                    local v32 = v31:FindFirstChildOfClass("MeshPart")
                    if v32 then
                        local v33 = { v32.Size.X, v32.Size.Y, v32.Size.Z }
                        table.sort(v33, function(p34, p35) --[[ Line: 190 ]]
                            return p35 < p34
                        end)
                        local v36 = v33[1]
                        local v37 = 3.5
                        local v38 = false
                        local v39 = nil
                        for v40, v41 in v31:GetDescendants() do
                            local _ = v40 - 1
                            if v41:IsA("WrapLayer") == true then
                                v39 = v41
                                break
                            end
                        end
                        if v39 then
                            local v42 = v30[v31.AccessoryType]
                            local _ = v42 == "" or not v42
                            v37 = 3
                            v38 = true
                        end
                        if v37 < v36 and true or v38 then
                            v31:Destroy()
                        elseif v39 then
                            v30[v31.AccessoryType] = v31.Name
                        end
                    end
                end
            end
        end
    }
}