local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "device-util").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v8.ReplicatedStorage
local u12 = v8.TweenService
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").AccessoriesCovered
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local function u21(p15, p16) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v17 = u11.Assets.ArmorTrims
    for _, v18 in p15:GetDescendants() do
        if v18:IsA("Accessory") and (v18:GetAttribute("PlayerViewportPreviewAccessory") == true and v17:FindFirstChild(v18.Name, true) ~= nil) then
            for v19, v20 in v18:GetDescendants() do
                local _ = v19 - 1
                if v20:IsA("BasePart") then
                    v20.Color = p16
                end
            end
        end
    end
end
return {
    ["PlayerViewport"] = v7.new(u6)(function(u22, p23) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u10
            [4] = u3
            [5] = u9
            [6] = u2
            [7] = u11
            [8] = u14
            [9] = u4
            [10] = u13
            [11] = u21
            [12] = u12
        --]]
        local v24 = p23.useEffect
        local v25 = p23.useBinding
        local u26 = u6.createRef()
        local u27, _ = v25(u6.createRef())
        local u28 = nil
        local function u94() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u5
                [3] = u10
                [4] = u3
                [5] = u9
                [6] = u2
                [7] = u11
                [8] = u22
                [9] = u14
                [10] = u4
                [11] = u13
                [12] = u21
                [13] = u27
                [14] = u28
            --]]
            local v29 = u26:getValue()
            if v29 == nil then
                return nil
            end
            local v30 = v29:FindFirstChild("Kit")
            if v30 ~= nil then
                v30:Destroy()
            end
            local u31 = u5("WorldModel", {
                ["Name"] = "Kit",
                ["Parent"] = v29
            })
            local u37 = (function() --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u3
                    [3] = u9
                    [4] = u2
                    [5] = u11
                --]]
                local v32 = nil
                local v33 = u10.LocalPlayer
                if v33 ~= nil then
                    v33 = v33.Character
                end
                if v33 == nil then
                    if u2.isHoarceKat() then
                        v32 = u11.Assets.BaseR15Rig
                        if v32 ~= nil then
                            v32 = v32:Clone()
                        end
                    end
                else
                    u10.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                    u10.LocalPlayer.Character.Archivable = true
                    local v34 = u3.Controllers.CharacterTransparencyController:getCharacterWithoutModifiers(u10.LocalPlayer.Character)
                    v32 = v34
                    for v35, v36 in u9:GetTags(v34) do
                        local _ = v35 - 1
                        if v32 then
                            u9:RemoveTag(v32, v36)
                        end
                    end
                end
                return v32
            end)()
            if not u37 then
                return nil
            end
            for v38, v39 in u37:GetDescendants() do
                local _ = v38 - 1
                if v39:IsA("BasePart") then
                    v39.Anchored = false
                end
                local v40 = v39:GetAttribute("DisableInPlayerViewport")
                if v40 ~= 0 and (v40 == v40 and (v40 ~= "" and v40)) then
                    v39:Destroy()
                end
            end
            for v41, v42 in u37:GetDescendants() do
                local _ = v41 - 1
                if v42:IsA("LocalScript") then
                    v42:Destroy()
                end
            end
            local v43 = u22.Animation
            if v43 ~= "" and v43 then
                u37.AncestryChanged:Connect(function(_, p44) --[[ Line: 124 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u5
                        [3] = u22
                    --]]
                    if p44 ~= nil and p44:IsDescendantOf(game) then
                        local v45 = u37
                        if v45 ~= nil then
                            v45 = v45:FindFirstChild("Humanoid")
                            if v45 ~= nil then
                                v45 = v45:FindFirstChild("Animator")
                            end
                        end
                        if not v45 then
                            local v46 = {}
                            local v47 = u37
                            if v47 ~= nil then
                                v47 = v47:FindFirstChild("Humanoid")
                            end
                            v46.Parent = v47
                            v45 = u5("Animator", v46)
                        end
                        local v48 = v45:LoadAnimation(u5("Animation", {
                            ["AnimationId"] = u22.Animation
                        }))
                        if u22.AnimationSpeed ~= nil then
                            v48:AdjustSpeed(u22.AnimationSpeed)
                        end
                        v48.Looped = true
                        v48:Play()
                    end
                end)
            end
            task.defer(function() --[[ Line: 155 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u31
                    [3] = u22
                    [4] = u11
                    [5] = u14
                    [6] = u4
                    [7] = u13
                    [8] = u21
                    [9] = u27
                    [10] = u28
                --]]
                if not u37 then
                    return nil
                end
                u37.Name = "Kit"
                u37.Parent = u31
                if u37.PrimaryPart then
                    u37:PivotTo(CFrame.new() * CFrame.Angles(0, -0.3490658503988659, 0))
                else
                    warn("No primary part found when mounting kit model. Are your assets out of date?")
                end
                if u22.PreviewItemTypes then
                    for _, v49 in u22.PreviewItemTypes do
                        local v50 = u11:FindFirstChild("Items")
                        if v50 ~= nil then
                            v50 = v50:FindFirstChild(v49)
                            if v50 ~= nil then
                                v50 = v50:Clone()
                            end
                        end
                        if v50 then
                            v50.Parent = u37
                        end
                    end
                    u14:weldCharacterAccessories(u37)
                end
                if u22.PreviewAccessories then
                    local v51 = {}
                    for _, v52 in u22.PreviewAccessories do
                        local v53 = v52:Clone()
                        if v53 then
                            v53:SetAttribute("PlayerViewportPreviewAccessory", true)
                            v53.Parent = u37
                        end
                        local u54 = {}
                        local v55 = u4.values(u13)
                        local function v60(p56) --[[ Line: 195 ]]
                            --[[
                            Upvalues:
                                [1] = u54
                            --]]
                            for v57, v58 in p56 do
                                local _ = v57 - 1
                                local v59 = u54
                                table.insert(v59, v58)
                            end
                        end
                        for v61, v62 in v55 do
                            v60(v62, v61 - 1, v55)
                        end
                        local v63 = v52:FindFirstChild("Handle")
                        local u64
                        if v63 == nil then
                            u64 = v63
                        else
                            u64 = v63:FindFirstChildOfClass("Attachment")
                        end
                        if v63 and u64 then
                            local function v69(p65) --[[ Line: 215 ]]
                                --[[
                                Upvalues:
                                    [1] = u54
                                    [2] = u64
                                --]]
                                for _, v66 in u54 do
                                    if p65 == v66 then
                                        local v67 = string.lower(u64.Name)
                                        local v68 = string.lower(v66)
                                        return string.match(v67, v68) ~= nil
                                    end
                                end
                            end
                            local v70 = 0
                            local v71 = {}
                            for v72, v73 in u54 do
                                if v69(v73, v72 - 1, u54) == true then
                                    v70 = v70 + 1
                                    v71[v70] = v73
                                end
                            end
                            for v74, v75 in v71 do
                                local _ = v74 - 1
                                v51[v75] = true
                            end
                        end
                    end
                    u14:weldCharacterAccessories(u37)
                    local v76 = u37:FindFirstChildWhichIsA("Humanoid")
                    if v76 ~= nil then
                        v76 = v76:GetAccessories()
                    end
                    for _, v77 in v76 == nil and {} or v76 do
                        local v78 = v77:FindFirstChild("Handle")
                        local v79
                        if v78 == nil then
                            v79 = v78
                        else
                            v79 = v78:FindFirstChildOfClass("Attachment")
                        end
                        if v78 and (v79 and (not u11.Assets.Armor:FindFirstChild(v77.Name, true) and (not u11.Assets.ArmorTrims:FindFirstChild(v77.Name, true) and v77:GetAttribute("NoArmorHide") ~= true))) then
                            local v80 = false
                            for v81 in v51 do
                                local v82 = string.lower(v79.Name)
                                local v83 = string.lower(v81)
                                v80 = string.match(v82, v83) ~= nil
                                if v80 then
                                    break
                                end
                            end
                            if v80 then
                                v77:Destroy()
                            end
                        end
                    end
                    if u22.PreviewAccessoryTint ~= nil then
                        u21(u31, u22.PreviewAccessoryTint)
                    end
                end
                task.wait(0.01)
                local v84, v85 = u37:GetBoundingBox()
                local v86 = v85.X
                local v87 = v85.Y
                local v88 = v85.Z
                local v89 = (math.max(v86, v87, v88) * -1 / 1.3 - 3) * 50
                local v90 = 0.8 * 50
                local v91 = v84.Position
                local v92 = v91 + Vector3.new(0, v90, v89)
                local v93 = u27:getValue():getValue()
                if v93 then
                    v93.CFrame = CFrame.new(v92, v91)
                end
                if u22.Rotate then
                    u28(u37)
                end
            end)
        end
        u28 = function(p95) --[[ Line: 320 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            if not p95.PrimaryPart then
                return nil
            end
            local v96 = TweenInfo.new(3, Enum.EasingStyle.Linear)
            local u97 = u12:Create(p95.PrimaryPart, v96, {
                ["CFrame"] = p95.PrimaryPart.CFrame * CFrame.Angles(0, 2.0943951023931953, 0)
            })
            local u98 = u12:Create(p95.PrimaryPart, v96, {
                ["CFrame"] = p95.PrimaryPart.CFrame * CFrame.Angles(0, 4.1887902047863905, 0)
            })
            local u99 = u12:Create(p95.PrimaryPart, v96, {
                ["CFrame"] = p95.PrimaryPart.CFrame * CFrame.Angles(0, 6.283185307179586, 0)
            })
            u97:Play()
            u97.Completed:Connect(function() --[[ Line: 350 ]]
                --[[
                Upvalues:
                    [1] = u98
                --]]
                u98:Play()
            end)
            u98.Completed:Connect(function() --[[ Line: 353 ]]
                --[[
                Upvalues:
                    [1] = u99
                --]]
                u99:Play()
            end)
            u99.Completed:Connect(function() --[[ Line: 356 ]]
                --[[
                Upvalues:
                    [1] = u97
                --]]
                u97:Play()
            end)
        end
        v24(function() --[[ Line: 360 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u27
                [3] = u94
            --]]
            local v100 = u26:getValue()
            v100.Ambient = Color3.fromRGB(162, 162, 162)
            v100.LightColor = Color3.fromRGB(255, 255, 255)
            v100.LightDirection = Vector3.new(0, -1, 0)
            v100.CurrentCamera = u27:getValue():getValue()
            u94()
        end, {})
        v24(function() --[[ Line: 368 ]]
            --[[
            Upvalues:
                [1] = u94
            --]]
            u94()
        end, { u22.Animation, u22.Mode, u22.PreviewAccessories })
        v24(function() --[[ Line: 371 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u26
                [3] = u21
            --]]
            if u22.PreviewAccessoryTint == nil then
                return nil
            end
            local v101 = u26:getValue()
            if not v101 then
                return nil
            end
            local u102 = v101:FindFirstChild("Kit")
            if not u102 then
                return nil
            end
            task.defer(function() --[[ Line: 383 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u21
                    [3] = u102
                --]]
                if u22.PreviewAccessoryTint == nil then
                    return nil
                end
                u21(u102, u22.PreviewAccessoryTint)
            end)
        end, { u22.PreviewAccessoryTint })
        local v103 = {}
        for v104, v105 in u22 do
            v103[v104] = v105
        end
        v103[u6.Children] = nil
        v103.PreviewItemTypes = nil
        v103.PreviewAccessories = nil
        v103.PreviewAccessoryTint = nil
        v103.Animation = nil
        v103.AnimationSpeed = nil
        v103.Rotate = nil
        v103.Mode = nil
        v103.Kit = nil
        local v106 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v107 = u22.BackgroundTransparency
        v106.BackgroundTransparency = v107 == nil and 1 or v107
        local v108 = u22.ImageTransparency
        v106.ImageTransparency = v108 == nil and 0 or v108
        v106[u6.Ref] = u26
        for v109, v110 in v103 do
            v106[v109] = v110
        end
        local v111 = { u6.createElement("Camera", {
                ["FieldOfView"] = 1,
                [u6.Ref] = u27:getValue()
            }) }
        local v112 = #v111
        local v113 = u22[u6.Children]
        if v113 then
            for v114, v115 in v113 do
                if type(v114) == "number" then
                    v111[v112 + v114] = v115
                else
                    v111[v114] = v115
                end
            end
        end
        return u6.createFragment({
            ["PlayerViewport"] = u6.createElement("ViewportFrame", v106, v111)
        })
    end)
}