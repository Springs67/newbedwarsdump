local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
return {
    ["ItemSkinViewport"] = v4.new(u3)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
            [4] = u6
            [5] = u7
        --]]
        local _ = p9.useState
        local v10 = p9.useEffect
        local v11 = p9.useBinding
        local u12 = u3.createRef()
        local u13, _ = v11(u3.createRef())
        local u14, u15 = v11(false)
        local u16 = u5(u8.ItemSkin)
        local v17 = u16.renderImage
        v10(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u14
                [3] = u13
                [4] = u2
                [5] = u6
                [6] = u16
                [7] = u8
                [8] = u7
                [9] = u15
            --]]
            local v18 = u12:getValue()
            if not v18 then
                return nil
            end
            if not u14:getValue() then
                v18.Ambient = Color3.fromRGB(162, 162, 162)
                v18.LightColor = Color3.fromRGB(255, 255, 255)
                v18.LightDirection = Vector3.new(0, -1, 0)
                v18.CurrentCamera = u13:getValue():getValue()
            end
            (function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u2
                    [3] = u6
                    [4] = u16
                    [5] = u8
                    [6] = u7
                    [7] = u13
                --]]
                local v19 = u12:getValue()
                if v19 == nil then
                    return nil
                end
                local v20 = v19:FindFirstChildWhichIsA("Model")
                if v20 ~= nil then
                    v20:Destroy()
                end
                local u21 = v19:FindFirstChildWhichIsA("WorldModel") or u2("WorldModel", {
                    ["Name"] = "ItemSkin",
                    ["Parent"] = v19
                })
                local u22 = u6.createItemInstance(u16.itemType, 1, u8.ItemSkin)
                if not u22 then
                    return nil
                end
                for v23, v24 in u22:GetDescendants() do
                    local _ = v23 - 1
                    if v24:IsA("BasePart") then
                        v24.Anchored = false
                    end
                    local v25 = v24:GetAttribute("DisableInPlayerViewport")
                    if v25 ~= 0 and (v25 == v25 and (v25 ~= "" and v25)) then
                        v24:Destroy()
                    end
                end
                for v26, v27 in u22:GetDescendants() do
                    local _ = v26 - 1
                    if v27:IsA("LocalScript") then
                        v27:Destroy()
                    end
                end
                task.defer(function() --[[ Line: 95 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u21
                        [3] = u7
                        [4] = u13
                    --]]
                    if not u22 then
                        return nil
                    end
                    u22.Parent = u21
                    local v28 = u22:FindFirstChild("Handle")
                    if v28 then
                        v28:PivotTo(CFrame.new() * CFrame.Angles(0, -0.3490658503988659, 0))
                    else
                        warn("No primary part found")
                    end
                    task.wait(0.01)
                    local v29 = u7
                    local v30 = v28.CFrame
                    local v31 = 0
                    local v32 = {}
                    for v33, v34 in u22:GetDescendants() do
                        local _ = v33 - 1
                        if v34:IsA("BasePart") == true then
                            v31 = v31 + 1
                            v32[v31] = v34
                        end
                    end
                    local v35 = 0
                    local v36 = {}
                    for v37, v38 in u22:GetDescendants() do
                        local _ = v37 - 1
                        if v38:IsA("Attachment") == true then
                            v35 = v35 + 1
                            v36[v35] = v38
                        end
                    end
                    local v39 = v29.computeBoundingBox(v30, v32, v36)
                    local v40 = v39[1]
                    local v41 = v39[2]
                    local v42 = v41.X
                    local v43 = v41.Y
                    local v44 = v41.Z
                    local v45 = (math.max(v42, v43, v44) * -1 / 1.3 - 3) * 50
                    local v46 = 0.8 * 50
                    local v47 = v28.CFrame * v40
                    local v48 = v47 + Vector3.new(0, v46, v45)
                    local v49 = u13:getValue():getValue()
                    if v49 then
                        v49.CFrame = CFrame.new(v48, v47)
                    end
                end)
            end)()
            u15(true)
        end, { u8.ItemSkin })
        local v50 = u3.createElement
        local v51 = "Frame"
        local v52 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v53 = {}
        local v54
        if v17 == nil then
            local v55 = u3.createFragment
            local v56 = {
                ["Viewport"] = u3.createElement("ViewportFrame", {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = u8.ViewportTransparency,
                    [u3.Ref] = u12
                }, { u3.createElement("Camera", {
                        ["FieldOfView"] = 1,
                        [u3.Ref] = u13:getValue()
                    }) })
            }
            v54 = v55(v56)
        else
            v54 = u3.createElement("ImageLabel", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = v17
            })
        end
        __set_list(v53, 1, {v54})
        return v50(v51, v52, v53)
    end)
}