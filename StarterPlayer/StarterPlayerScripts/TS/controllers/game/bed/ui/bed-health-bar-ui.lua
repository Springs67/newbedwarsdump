local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Empty
local u5 = v3.ProgressBar
local u6 = v3.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.TweenService
local u12 = v10.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["BedHealthBarUi"] = v9.new(u8)(function(u18, p19) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u6
            [3] = u8
            [4] = u16
            [5] = u17
            [6] = u2
            [7] = u13
            [8] = u14
            [9] = u11
            [10] = u7
            [11] = u5
            [12] = u4
            [13] = u15
        --]]
        local v20 = p19.useState
        local v21 = p19.useEffect
        local v22 = u18.BedBlock:GetAttribute("TeamId")
        local u23 = u8.createRef()
        local v24 = u18.PlatingExpireTime
        local v25 = (v24 == nil and 0 or v24) - u12:GetServerTimeNow()
        local v26 = math.max(0, v25)
        local v27
        if v26 == 0 then
            v27 = nil
        else
            v27 = u6.formatCountdownTime(v26, {
                ["hours"] = false,
                ["days"] = false,
                ["seperator"] = ":"
            })
        end
        local v28, u29 = v20(v27)
        local v30 = u18.ShieldExpireTime
        local v31 = (v30 == nil and 0 or v30) - u12:GetServerTimeNow()
        local v32 = math.max(0, v31)
        local v33
        if v32 == 0 then
            v33 = nil
        else
            v33 = u6.formatCountdownTime(v32, {
                ["hours"] = false,
                ["days"] = false,
                ["seperator"] = ":"
            })
        end
        local v34, u35 = v20(v33)
        local v36 = u18.BedBlock:GetAttribute("BedPlatingAmount")
        local v37, u38 = v20(v36 == nil and 0 or v36)
        local v39 = u18.BedBlock:GetAttribute("MaxHealth")
        if v39 == nil then
            local v40 = u16(u17.BED).block
            if v40 ~= nil then
                v40 = v40.health
            end
            v39 = v40 == nil and 18 or v40
        end
        local v41 = u18.BedBlock:GetAttribute("Health")
        local v42 = u2:getStore():getBlockData(u2:getBlockPosition(u18.BedBlock.Position))
        if v42 then
            v41 = v42:GetAttribute("Health")
        end
        if v41 == 0 or (v41 ~= v41 or not v41) then
            v41 = v39
        end
        local v43, u44 = v20(v41 == nil and 0 or v41)
        u13:dispatch({
            ["type"] = "SetBedHealth",
            ["teamId"] = v22,
            ["bedHealth"] = v43,
            ["maxBedHealth"] = v39
        })
        local v45 = u18.BedBlock:GetAttribute("BedPlatingTotal")
        if v45 == nil then
            v45 = u14.BED_PLATING_AMOUNT
        end
        v21(function() --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u18
                [3] = u11
            --]]
            local v46 = u23:getValue()
            if not v46 then
                return nil
            end
            if u18.ShieldExpireTime == nil then
                return nil
            end
            local u47 = u11:Create(v46, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Transparency"] = 0.85
            })
            local u48 = u11:Create(v46, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Transparency"] = 0
            })
            u47:Play()
            u47.Completed:Connect(function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u48
                --]]
                u48:Play()
            end)
            u48.Completed:Connect(function() --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u47
                --]]
                u47:Play()
            end)
            return function() --[[ Line: 110 ]]
                --[[
                Upvalues:
                    [1] = u47
                    [2] = u48
                --]]
                u47:Destroy()
                u48:Destroy()
            end
        end, { u18.ShieldExpireTime })
        v21(function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u18
                [3] = u38
                [4] = u2
                [5] = u44
                [6] = u29
                [7] = u12
                [8] = u6
                [9] = u35
            --]]
            local u49 = true
            local u50 = u7.new()
            u50:GiveTask(u18.BedBlock:GetAttributeChangedSignal("BedPlatingAmount"):Connect(function() --[[ Line: 118 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u38
                --]]
                local v51 = u18.BedBlock:GetAttribute("BedPlatingAmount")
                if v51 ~= 0 and (v51 == v51 and v51) then
                    u38(v51)
                end
            end))
            task.spawn(function() --[[ Line: 124 ]]
                --[[
                Upvalues:
                    [1] = u49
                    [2] = u2
                    [3] = u18
                    [4] = u44
                    [5] = u50
                --]]
                local v52 = false
                while true do
                    local v53 = task.wait(0.25)
                    if v53 ~= 0 and (v53 == v53 and v53) then
                        v53 = u49
                        if v53 then
                            v53 = not v52
                        end
                    end
                    if v53 == 0 or (v53 ~= v53 or not v53) then
                        return
                    end
                    local u54 = u2:getStore():getBlockData(u2:getBlockPosition(u18.BedBlock.Position))
                    if u54 then
                        v52 = true
                        local v55 = u54:GetAttribute("Health")
                        if v55 ~= 0 and (v55 == v55 and v55) then
                            u44(v55)
                        end
                        u50:GiveTask(u54:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 141 ]]
                            --[[
                            Upvalues:
                                [1] = u54
                                [2] = u44
                            --]]
                            local v56 = u54:GetAttribute("Health")
                            if v56 ~= 0 and (v56 == v56 and v56) then
                                u44(v56)
                            end
                        end))
                    end
                end
            end)
            task.spawn(function() --[[ Line: 150 ]]
                --[[
                Upvalues:
                    [1] = u49
                    [2] = u18
                    [3] = u29
                    [4] = u12
                    [5] = u6
                --]]
                while true do
                    local v57 = task.wait(1)
                    if v57 ~= 0 and (v57 == v57 and v57) then
                        v57 = u49
                    end
                    if v57 == 0 or (v57 ~= v57 or not v57) then
                        return
                    end
                    local v58 = u18.PlatingExpireTime
                    local v59 = u29
                    local v60 = (v58 == nil and 0 or v58) - u12:GetServerTimeNow()
                    local v61 = math.max(0, v60)
                    local v62
                    if v61 == 0 then
                        v62 = nil
                    else
                        v62 = u6.formatCountdownTime(v61, {
                            ["hours"] = false,
                            ["days"] = false,
                            ["seperator"] = ":"
                        })
                    end
                    v59(v62)
                end
            end)
            task.spawn(function() --[[ Line: 166 ]]
                --[[
                Upvalues:
                    [1] = u49
                    [2] = u18
                    [3] = u35
                    [4] = u12
                    [5] = u6
                --]]
                while true do
                    local v63 = task.wait(1)
                    if v63 ~= 0 and (v63 == v63 and v63) then
                        v63 = u49
                    end
                    if v63 == 0 or (v63 ~= v63 or not v63) then
                        return
                    end
                    local v64 = u18.ShieldExpireTime
                    local v65 = u35
                    local v66 = (v64 == nil and 0 or v64) - u12:GetServerTimeNow()
                    local v67 = math.max(0, v66)
                    local v68
                    if v67 == 0 then
                        v68 = nil
                    else
                        v68 = u6.formatCountdownTime(v67, {
                            ["hours"] = false,
                            ["days"] = false,
                            ["seperator"] = ":"
                        })
                    end
                    v65(v68)
                end
            end)
            return function() --[[ Line: 182 ]]
                --[[
                Upvalues:
                    [1] = u49
                    [2] = u50
                --]]
                u49 = false
                u50:DoCleaning()
            end
        end, { u18.PlatingExpireTime, u18.ShieldExpireTime })
        local v69 = u18.ShieldExpireTime ~= nil and true or u18.PlatingExpireTime ~= nil
        local v70 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 4.5, 1.5),
            ["ResetOnSpawn"] = false,
            ["MaxDistance"] = 150,
            ["Adornee"] = u18.BedBlock,
            ["Size"] = UDim2.fromScale(8, 2)
        }
        local v71 = {}
        local v72 = #v71
        if v69 then
            local v73 = {
                ["Size"] = UDim2.fromScale(1, 0.4)
            }
            local v74 = {}
            local _ = #v74
            local v75 = {
                ["Size"] = UDim2.fromScale(0.88, 1)
            }
            local v76 = {}
            local v77
            if u18.ShieldExpireTime == nil then
                v77 = u8.createFragment({
                    ["PlatingBar"] = u8.createElement(u5, {
                        ["GradientRotation"] = 0,
                        ["AcceptZero"] = true,
                        ["AutoLocalize"] = false,
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["Position"] = UDim2.fromScale(0, 0.5),
                        ["Size"] = UDim2.fromScale(1, 0.8),
                        ["Progress"] = v37 / v45,
                        ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(59, 125, 196)), ColorSequenceKeypoint.new(1, Color3.fromRGB(88, 213, 253)) }),
                        ["BarCornerRadius"] = UDim.new(0.1),
                        ["BarOnlyChildren"] = { u8.createElement(u4, {
                                ["ZIndex"] = 4,
                                ["AnchorPoint"] = Vector2.new(0, 0.5),
                                ["Position"] = UDim2.fromScale(0, 0.5),
                                ["Size"] = UDim2.new(1, -2, 1, -4)
                            }, { u8.createElement("UICorner", {
                                    ["CornerRadius"] = UDim.new(0.1)
                                }), u8.createElement("UIStroke", {
                                    ["Transparency"] = 0.55,
                                    ["Thickness"] = 2,
                                    ["Color"] = Color3.fromRGB(255, 255, 255)
                                }) }) }
                    })
                })
            else
                v77 = u8.createElement(u4, {
                    [u8.Ref] = u23,
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["Size"] = UDim2.fromScale(1, 0.85),
                    ["BackgroundColor3"] = Color3.fromRGB(88, 213, 253)
                }, { u8.createElement("UIStroke", {
                        ["Thickness"] = 2,
                        ["Color"] = Color3.fromRGB(88, 213, 253)
                    }), u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1)
                    }) })
            end
            __set_list(v76, 1, {v77})
            local v78 = #v76
            local v79
            if u18.PlatingExpireTime == nil or v28 == nil then
                v79 = false
            else
                v79 = u8.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["TextStrokeTransparency"] = 0,
                    ["ZIndex"] = 60,
                    ["Text"] = v28,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["FontFace"] = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
                })
            end
            if v79 then
                v76[v78 + 1] = v79
            end
            local v80 = #v76
            local v81
            if u18.ShieldExpireTime == nil or v34 == nil then
                v81 = false
            else
                v81 = u8.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["TextStrokeTransparency"] = 0,
                    ["ZIndex"] = 60,
                    ["Text"] = v34,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["FontFace"] = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
                })
            end
            if v81 then
                v76[v80 + 1] = v81
            end
            v74.ShieldBarWrapper = u8.createElement(u4, v75, v76)
            v74.BarIcon = u8.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 6,
                ["Image"] = u15.BED_PLATING_ICON,
                ["ImageColor3"] = Color3.fromRGB(88, 213, 253),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            })
            v69 = u8.createFragment({
                ["ShieldAndPlatingContainer"] = u8.createElement(u4, v73, v74)
            })
        end
        local v82 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0, 0)
        }
        local v83 = {}
        local v84 = #v83
        if v69 then
            v83[v84 + 1] = v69
        end
        local _ = #v83
        local v85 = u8.createElement
        local v86 = u4
        local v87 = {
            ["Position"] = UDim2.fromScale(0, 0.4),
            ["Size"] = UDim2.fromScale(1, 0.4)
        }
        local v88 = {
            ["HealthBarWrapper"] = u8.createElement(u4, {
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["Size"] = UDim2.fromScale(0.88, 1)
            }, {
                ["HealthBar"] = u8.createElement(u5, {
                    ["GradientRotation"] = 0,
                    ["AcceptZero"] = true,
                    ["AutoLocalize"] = false,
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["Size"] = UDim2.fromScale(1, 0.8),
                    ["Progress"] = v43 / v39,
                    ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 161, 45)), ColorSequenceKeypoint.new(1, Color3.fromRGB(53, 238, 49)) }),
                    ["BarCornerRadius"] = UDim.new(0.1),
                    ["BarOnlyChildren"] = { u8.createElement(u4, {
                            ["ZIndex"] = 4,
                            ["AnchorPoint"] = Vector2.new(0, 0.5),
                            ["Position"] = UDim2.fromScale(0, 0.5),
                            ["Size"] = UDim2.new(1, -2, 1, -4)
                        }, { u8.createElement("UICorner", {
                                ["CornerRadius"] = UDim.new(0.1)
                            }), u8.createElement("UIStroke", {
                                ["Transparency"] = 0.55,
                                ["Thickness"] = 2,
                                ["Color"] = Color3.fromRGB(255, 255, 255)
                            }) }) }
                })
            }),
            ["BarIcon"] = u8.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 6,
                ["Image"] = u15.BED_HEALTH_ICON,
                ["ImageColor3"] = Color3.fromRGB(53, 238, 49),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            })
        }
        v83.HealthContainer = v85(v86, v87, v88)
        v71[v72 + 1] = u8.createElement(u4, v82, v83)
        return u8.createFragment({
            ["BedHealthBillboard"] = u8.createElement("BillboardGui", v70, v71)
        })
    end)
}