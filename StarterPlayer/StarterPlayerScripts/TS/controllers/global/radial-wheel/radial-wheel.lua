local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "radial-wheel", "radial-wheel-type").SLICE_META
return {
    ["RadialWheel"] = v8.new(u7)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u6
            [4] = u9
            [5] = u5
            [6] = u3
            [7] = u4
        --]]
        local v13 = p12.useEffect
        local u14, u15 = p12.useState(-1)
        local u16 = u7.createRef()
        local u17 = u11.numSlices
        local u18 = u10[u17]
        if not u18 then
            return u7.createFragment()
        end
        local u19 = 250 - u18.imageSize.X
        local u20 = 360 / u17 - 1
        local u21 = u18.image
        local v22 = false
        local v23 = 0
        local v24 = {}
        while true do
            if v22 then
                v23 = v23 + 1
            else
                v22 = true
            end
            if v23 >= u17 then
                v13(function() --[[ Line: 42 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u16
                        [3] = u9
                        [4] = u19
                        [5] = u15
                        [6] = u11
                        [7] = u20
                        [8] = u17
                    --]]
                    local u25 = u6.new()
                    local u26 = u16:getValue()
                    local u27 = { Enum.UserInputType.MouseMovement }
                    u25:GiveTask(u9.InputChanged:Connect(function(p28) --[[ Line: 47 ]]
                        --[[
                        Upvalues:
                            [1] = u27
                            [2] = u26
                            [3] = u19
                            [4] = u15
                            [5] = u11
                            [6] = u20
                            [7] = u17
                        --]]
                        local v29 = p28.UserInputType
                        if table.find(u27, v29) == nil then
                            return nil
                        end
                        local v30 = { Enum.UserInputState.Begin, Enum.UserInputState.Change }
                        local v31 = p28.UserInputState
                        if table.find(v30, v31) == nil then
                            return nil
                        end
                        local v32 = u26
                        if v32 ~= nil then
                            v32 = v32.Parent
                        end
                        if not v32 then
                            return nil
                        end
                        local v33 = (Vector2.new(p28.Position.X, p28.Position.Y) - u26.AbsolutePosition) / u26.AbsoluteSize - Vector2.new(0.5, 0.5)
                        if v33.Magnitude < u19 / 250 / 2 then
                            u15(-1)
                            return nil
                        end
                        if u11.limitHoverDistance and v33.Magnitude > 0.5 then
                            u15(-1)
                            return nil
                        end
                        local v34 = v33.Y
                        local v35 = v33.X
                        local v36 = math.atan2(v34, v35)
                        local v37 = math
                        local v38 = math.deg(v36)
                        local v39 = u11.angleOffset
                        local v40 = (v38 - (v39 == nil and 0 or v39)) / (u20 + 1)
                        u15(v37.floor(v40) % u17)
                    end))
                    return function() --[[ Line: 94 ]]
                        --[[
                        Upvalues:
                            [1] = u25
                            [2] = u11
                        --]]
                        u25:DoCleaning()
                        local v41 = u11.onClose
                        if v41 ~= nil then
                            v41()
                        end
                    end
                end, {})
                v13(function() --[[ Line: 102 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u9
                        [3] = u11
                        [4] = u14
                        [5] = u5
                    --]]
                    local u42 = u6.new()
                    u42:GiveTask(u9.InputEnded:Connect(function(p43) --[[ Line: 105 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u14
                            [3] = u5
                        --]]
                        if p43 ~= u11.inputObject then
                            return nil
                        end
                        if u14 >= 0 then
                            u11.entries[u14 + 1].onSelect()
                        end
                        u5.Controllers.RadialWheelController:closeRadialWheel()
                    end))
                    return function() --[[ Line: 114 ]]
                        --[[
                        Upvalues:
                            [1] = u42
                        --]]
                        u42:DoCleaning()
                    end
                end, { u14 })
                v13(function() --[[ Line: 137 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u6
                        [3] = u16
                        [4] = u9
                        [5] = u19
                        [6] = u20
                        [7] = u17
                    --]]
                    if not u11.enableClickToSelect then
                        return nil
                    end
                    local u44 = u6.new()
                    local u45 = u16:getValue()
                    u44:GiveTask(u9.InputEnded:Connect(function(p46) --[[ Line: 143 ]]
                        --[[
                        Upvalues:
                            [1] = u45
                            [2] = u19
                            [3] = u11
                            [4] = u20
                            [5] = u17
                        --]]
                        if p46.UserInputType ~= Enum.UserInputType.MouseButton1 and p46.UserInputType ~= Enum.UserInputType.Touch and p46.KeyCode ~= Enum.KeyCode.ButtonR2 then
                            return nil
                        end
                        local v47 = u45
                        if v47 ~= nil then
                            v47 = v47.Parent
                        end
                        if not v47 then
                            return nil
                        end
                        local v48 = (Vector2.new(p46.Position.X, p46.Position.Y) - u45.AbsolutePosition) / u45.AbsoluteSize - Vector2.new(0.5, 0.5)
                        if v48.Magnitude < u19 / 250 / 2 then
                            return nil
                        end
                        if u11.limitHoverDistance and v48.Magnitude > 0.5 then
                            return nil
                        end
                        local v49 = v48.Y
                        local v50 = v48.X
                        local v51 = math.atan2(v49, v50)
                        local v52 = math
                        local v53 = math.deg(v51)
                        local v54 = u11.angleOffset
                        local v55 = (v53 - (v54 == nil and 0 or v54)) / (u20 + 1)
                        local v56 = v52.floor(v55) % u17
                        u11.entries[v56 + 1].onSelect()
                    end))
                    return function() --[[ Line: 181 ]]
                        --[[
                        Upvalues:
                            [1] = u44
                        --]]
                        u44:DoCleaning()
                    end
                end, { u14 })
                local v57 = {
                    ["Size"] = u11.Size or UDim2.fromScale(1, 1),
                    ["Position"] = u11.Position,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["BackgroundTransparency"] = 1,
                    [u7.Ref] = u16
                }
                local v58 = { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }
                local v59 = #v58
                local v60
                if u14 == -1 then
                    v60 = false
                else
                    v60 = (function() --[[ Line: 198 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u14
                            [3] = u7
                            [4] = u3
                        --]]
                        local v61
                        if u14 < #u11.entries then
                            v61 = u11.entries[u14 + 1]
                        else
                            v61 = nil
                        end
                        if not v61 then
                            return u7.createFragment()
                        end
                        local v62 = {
                            ["BackgroundTransparency"] = 0.45,
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Size"] = UDim2.fromScale(0.528, 0.528),
                            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
                        }
                        local v63 = {}
                        local v64 = #v63
                        local v65 = {
                            ["Text"] = v61.title
                        }
                        local v66 = UDim2
                        local v67 = v61.description
                        v65.Position = v66.fromScale(0.5, (v67 == "" or not v67) and 0.5 or 0.15)
                        local v68 = v61.description
                        v65.AnchorPoint = Vector2.new(0.5, (v68 == "" or not v68) and 0.5 or 0)
                        v65.Size = UDim2.fromScale(0.75, 0.2)
                        v65.FontFace = Font.new("Roboto", Enum.FontWeight.SemiBold)
                        v65.TextScaled = true
                        v65.BackgroundTransparency = 1
                        v65.TextColor3 = Color3.fromRGB(255, 255, 255)
                        v63[v64 + 1] = u7.createElement("TextLabel", v65)
                        local v69
                        if v61.description == nil then
                            v69 = false
                        else
                            v69 = u7.createElement("TextLabel", {
                                ["TextScaled"] = true,
                                ["BackgroundTransparency"] = 1,
                                ["Text"] = v61.description,
                                ["Position"] = UDim2.fromScale(0.5, 0.37),
                                ["AnchorPoint"] = Vector2.new(0.5, 0),
                                ["Size"] = UDim2.fromScale(0.925, 0.45),
                                ["Font"] = Enum.Font.Roboto,
                                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                            }, { u7.createElement("UITextSizeConstraint", {
                                    ["MaxTextSize"] = u3.isSmallScreen() and 16 or 22
                                }) })
                        end
                        if v69 then
                            v63[v64 + 2] = v69
                        end
                        v63[#v63 + 1] = u7.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        })
                        return u7.createElement("Frame", v62, v63)
                    end)()
                end
                if v60 then
                    v58[v59 + 1] = v60
                end
                local v70 = #v58
                local function v84(u71) --[[ Line: 253 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u20
                        [3] = u19
                        [4] = u18
                        [5] = u21
                        [6] = u14
                        [7] = u7
                        [8] = u3
                        [9] = u4
                    --]]
                    local v72
                    if u71 < #u11.entries then
                        v72 = u11.entries[u71 + 1]
                    else
                        v72 = nil
                    end
                    local v73 = u11.angleOffset
                    local v74 = (v73 == nil and 0 or v73) + 0.5 + u71 + u20 * u71 + u20 / 2
                    local v75 = math.rad(v74)
                    local v76 = 0.5 + math.cos(v75) * (u19 / 250 / 2 + u18.imageSize.X / 2 / 500)
                    local v77 = 0.5 + math.sin(v75) * (u19 / 250 / 2 + u18.imageSize.X / 2 / 500)
                    local v78 = UDim2.fromScale(u18.imageSize.X / 500, u18.imageSize.Y / 500)
                    local v79 = UDim2.fromScale((192 - (250 - u18.imageSize.X)) / u18.imageSize.X, 0.5)
                    local v80 = {
                        ["Image"] = u21,
                        ["Position"] = UDim2.fromScale(v76, v77),
                        ["Rotation"] = v74,
                        ["Size"] = v78,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["BackgroundTransparency"] = 1
                    }
                    local v81
                    if u11.highlightSlice == u71 then
                        v81 = Color3.fromRGB(255, 255, 255)
                    else
                        v81 = Color3.fromRGB(0, 0, 0)
                    end
                    v80.ImageColor3 = v81
                    v80.ImageTransparency = u14 == u71 and 0.05 or (u11.highlightSlice == u71 and 0.15 or 0.45)
                    v80.ScaleType = Enum.ScaleType.Fit
                    v80[u7.Event.Activated] = function() --[[ Line: 275 ]]
                        --[[
                        Upvalues:
                            [1] = u3
                            [2] = u11
                            [3] = u71
                        --]]
                        if u3.isGamepadControls() then
                            u11.entries[u71 + 1].onSelect()
                        end
                    end
                    local v82 = { u7.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = u18.imageSize.X / u18.imageSize.Y
                        }) }
                    local v83 = #v82
                    if v72 then
                        v72 = u7.createElement(u4, {
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(0.174 / v78.X.Scale, 0.174 / v78.Y.Scale),
                            ["Rotation"] = -v74,
                            ["Position"] = v79,
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                        }, { u7.createElement("UIAspectRatioConstraint", {
                                ["AspectRatio"] = 1
                            }), v72.element })
                    end
                    if v72 then
                        v82[v83 + 1] = v72
                    end
                    return u7.createElement("ImageButton", v80, v82)
                end
                local v85 = table.create(#v24)
                for v86, v87 in v24 do
                    v85[v86] = v84(v87, v86 - 1, v24)
                end
                for v88, v89 in v85 do
                    v58[v70 + v88] = v89
                end
                return u7.createElement("Frame", v57, v58)
            end
            table.insert(v24, v23)
        end
    end)
}