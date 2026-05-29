local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.SoundManager
local u9 = v2.TooltipContainer
local u10 = v2.UIUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "play-menu", "play-menu-tag-meta").getPlayMenuCardTagMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["PlayMenuCard"] = v13.new(u12)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u10
            [4] = u11
            [5] = u14
            [6] = u4
            [7] = u16
            [8] = u8
            [9] = u17
            [10] = u6
            [11] = u15
            [12] = u7
            [13] = u9
            [14] = u3
        --]]
        local v20 = p19.useEffect
        local v21 = p19.useState
        local u22, u23 = v21(false)
        local v24, u25 = v21(nil)
        local u26 = u12.createRef()
        local u27 = u12.createRef()
        local u28 = u12.createRef()
        local u29 = u12.createRef()
        local u30 = u12.createRef()
        local u31 = u12.createRef()
        v20(function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u5
                [3] = u28
                [4] = u10
            --]]
            if u18.GamepadShouldAutoSelect and u5.isGamepadControls() then
                u10:selectGui((u28:getValue()))
            end
        end, { u18.GamepadShouldAutoSelect })
        v20(function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u27
                [3] = u28
                [4] = u11
                [5] = u10
                [6] = u18
                [7] = u14
            --]]
            local u32 = u26:getValue()
            local v33 = u27:getValue()
            local v34 = u28:getValue()
            if not (u32 and (v33 and v34)) then
                return nil
            end
            local u35 = u11.new()
            u32.Position = UDim2.fromScale(0.5, -0.5)
            local u36 = u10:setContainerTransparency(u32, 1, {
                ["onSetTweenInfo"] = TweenInfo.new(0)
            })
            u35:GiveTask(u36)
            v33.Transparency = 1
            v33.BackgroundTransparency = 1
            v33.ImageTransparency = 1
            v34.Transparency = 1
            v34.BackgroundTransparency = 1
            v34.ImageTransparency = 1
            u35:GiveTask(task.delay(u18.Index * 0.1 + 0.1, function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u14
                    [3] = u32
                    [4] = u35
                --]]
                u36:DoCleaning()
                local u37 = u14:Create(u32, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                })
                u37:Play()
                u35:GiveTask(function() --[[ Line: 61 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                    --]]
                    u37:Cancel()
                    u37:Destroy()
                end)
            end))
            return function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u35
                --]]
                u35:DoCleaning()
            end
        end, { u18.Page })
        local function v48() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u27
                [3] = u28
                [4] = u25
                [5] = u11
                [6] = u14
            --]]
            local v38 = u18.CardData
            if v38 ~= nil then
                v38 = v38.backgroundImages
            end
            if v38 == nil then
                return nil
            end
            if #u18.CardData.backgroundImages == 0 then
                return nil
            end
            local v39 = u27:getValue()
            local u40 = u28:getValue()
            if #u18.CardData.backgroundImages == 1 or not (v39 and u40) then
                u25(u18.CardData.backgroundImages[1])
                return nil
            end
            u25(u18.CardData.backgroundImages[1])
            local u41 = u11.new()
            u41:GiveTask(task.spawn(function() --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u40
                    [3] = u14
                    [4] = u41
                    [5] = u25
                --]]
                task.wait(u18.Index)
                local v42 = 0
                while true do
                    local v43 = u18.CardData.backgroundImages
                    local v44 = v42 + 1
                    local u45 = v43[v42 % #u18.CardData.backgroundImages + 1]
                    u40.Image = u45
                    u40.ImageTransparency = 1
                    local u46 = u14:Create(u40, TweenInfo.new(1), {
                        ["ImageTransparency"] = 0
                    })
                    u46:Play()
                    u41:GiveTask(u46.Completed:Once(function() --[[ Line: 105 ]]
                        --[[
                        Upvalues:
                            [1] = u25
                            [2] = u45
                            [3] = u46
                        --]]
                        u25(u45)
                        u46:Destroy()
                    end))
                    u41:GiveTask(function() --[[ Line: 109 ]]
                        --[[
                        Upvalues:
                            [1] = u46
                        --]]
                        u46:Cancel()
                        u46:Destroy()
                    end)
                    local v47 = task.wait(5)
                    if v47 == 0 or (v47 ~= v47 or not v47) then
                        break
                    end
                    v42 = v44
                end
            end))
            return function() --[[ Line: 117 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                u41:Destroy()
            end
        end
        local v49 = u18.CardData
        if v49 ~= nil then
            v49 = v49.backgroundImages
        end
        v20(v48, { v49 })
        v20(function() --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u18
            --]]
            if u22 and u18.OnHover then
                u18.OnHover(u18.QueueVariant, u18.CardData)
            end
        end, { u22 })
        v20(function() --[[ Line: 131 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u28
                [3] = u27
                [4] = u29
                [5] = u30
                [6] = u31
                [7] = u11
                [8] = u14
                [9] = u22
                [10] = u4
            --]]
            local v50 = u26:getValue()
            local v51 = u28:getValue()
            local v52 = u27:getValue()
            local v53 = u29:getValue()
            local v54 = u30:getValue()
            local v55 = u31:getValue()
            local u56 = u11.new()
            if v50 then
                local u57 = u14:Create(v50, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                    ["Size"] = UDim2.fromScale(u22 and 1.05 or 1, u22 and 1.05 or 1)
                })
                u57:Play()
                u56:GiveTask(function() --[[ Line: 144 ]]
                    --[[
                    Upvalues:
                        [1] = u57
                    --]]
                    u57:Cancel()
                    u57:Destroy()
                end)
            end
            if v51 then
                local u58 = u14:Create(v51, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                    ["Size"] = UDim2.fromScale(u22 and 1.15 or 1, u22 and 1.15 or 1)
                })
                u58:Play()
                u56:GiveTask(function() --[[ Line: 154 ]]
                    --[[
                    Upvalues:
                        [1] = u58
                    --]]
                    u58:Cancel()
                    u58:Destroy()
                end)
            end
            if v52 then
                local u59 = u14:Create(v52, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                    ["Size"] = UDim2.fromScale(u22 and 1.15 or 1, u22 and 1.15 or 1)
                })
                u59:Play()
                u56:GiveTask(function() --[[ Line: 164 ]]
                    --[[
                    Upvalues:
                        [1] = u59
                    --]]
                    u59:Cancel()
                    u59:Destroy()
                end)
            end
            if v53 then
                local v60 = u14
                local v61 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)
                local v62 = {}
                local v63
                if u22 then
                    v63 = u4.WHITE
                else
                    v63 = u4.BLACK
                end
                v62.BackgroundColor3 = v63
                local u64 = v60:Create(v53, v61, v62)
                u64:Play()
                u56:GiveTask(function() --[[ Line: 174 ]]
                    --[[
                    Upvalues:
                        [1] = u64
                    --]]
                    u64:Cancel()
                    u64:Destroy()
                end)
            end
            if v54 then
                local v65 = u14
                local v66 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)
                local v67 = {}
                local v68
                if u22 then
                    v68 = u4.brighten(u4.BLACK, 0.15)
                else
                    v68 = u4.WHITE
                end
                v67.TextColor3 = v68
                local u69 = v65:Create(v54, v66, v67)
                u69:Play()
                u56:GiveTask(function() --[[ Line: 184 ]]
                    --[[
                    Upvalues:
                        [1] = u69
                    --]]
                    u69:Cancel()
                    u69:Destroy()
                end)
            end
            if v55 then
                local v70 = u14
                local v71 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)
                local v72 = {}
                local v73
                if u22 then
                    v73 = u4.brighten(u4.BLACK, 0.15)
                else
                    v73 = u4.WHITE
                end
                v72.TextColor3 = v73
                local u74 = v70:Create(v55, v71, v72)
                u74:Play()
                u56:GiveTask(function() --[[ Line: 194 ]]
                    --[[
                    Upvalues:
                        [1] = u74
                    --]]
                    u74:Cancel()
                    u74:Destroy()
                end)
            end
            return function() --[[ Line: 199 ]]
                --[[
                Upvalues:
                    [1] = u56
                --]]
                u56:DoCleaning()
            end
        end, { u22 })
        v20(function() --[[ Line: 203 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23(false)
        end, { u18.Page })
        local v75 = {}
        for v76, v77 in u18 do
            v75[v76] = v77
        end
        v75.CardData = nil
        v75.Index = nil
        v75.Page = nil
        v75.Tag = nil
        v75.PlayerLevelReq = nil
        v75.QueueVariant = nil
        v75.OnHover = nil
        v75.OnClick = nil
        v75.GamepadShouldAutoSelect = nil
        local v78
        if u18.Tag then
            v78 = u16(u18.Tag)
        else
            v78 = nil
        end
        local v79 = {}
        for v80, v81 in v75 do
            v79[v80] = v81
        end
        local v82 = {}
        local _ = #v82
        local v83 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            [u12.Ref] = u26
        }
        local v84 = {}
        local v85 = #v84
        local v86 = {
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v87 = { u12.createElement("ImageLabel", {
                [u12.Ref] = u27,
                ["Image"] = v24,
                ["ScaleType"] = Enum.ScaleType.Crop,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ImageTransparency"] = u18.PlayerLevelReq == nil and 0 or 0.5
            }), u12.createElement("ImageButton", {
                [u12.Ref] = u28,
                ["Image"] = v24,
                ["ScaleType"] = Enum.ScaleType.Crop,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                [u12.Event.Activated] = function() --[[ Line: 262 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u17
                        [3] = u18
                    --]]
                    u8:playSound(u17.UI_CLICK)
                    if u18.OnClick then
                        u18.OnClick(u18.QueueVariant, u18.CardData)
                    end
                end,
                [u12.Event.MouseEnter] = function() --[[ Line: 268 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u17
                        [3] = u23
                    --]]
                    u8:playSound(u17.UI_HOVER)
                    u23(true)
                end,
                [u12.Event.MouseLeave] = function() --[[ Line: 272 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23(false)
                end,
                [u12.Event.MouseButton1Click] = function() --[[ Line: 275 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23(false)
                end
            }) }
        local v88 = #v87
        if u22 then
            u22 = u12.createElement("UIStroke", {
                ["Transparency"] = 0,
                ["Thickness"] = 3,
                ["Color"] = Color3.fromRGB(255, 240, 69)
            }, { u12.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
                }) })
        end
        if u22 then
            v87[v88 + 1] = u22
        end
        local v89 = #v87
        local v90 = {
            ["Size"] = UDim2.fromScale(1, 0.1)
        }
        local v91 = {}
        local v92 = #v91
        local v93
        if v78 == nil then
            v93 = false
        else
            v93 = u12.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["TextTransparency"] = 0,
                ["Size"] = UDim2.fromScale(v78.sizeXScale, 1),
                ["Text"] = u18.Tag,
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["BackgroundColor3"] = v78.backgroundColor3
            }, { u12.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.05),
                    ["PaddingRight"] = UDim.new(0.05)
                }) })
        end
        if v93 then
            v91[v92 + 1] = v93
        end
        v87.CardHeader = u12.createElement(u6, v90, v91)
        local v94 = {
            ["Size"] = UDim2.fromScale(1, 0.25),
            ["Position"] = UDim2.fromScale(0, 0.75),
            ["BackgroundColor3"] = u4.BLACK,
            ["Transparency"] = 0.5,
            ["BorderSizePixel"] = 0,
            [u12.Ref] = u29
        }
        local v95 = {}
        local v96 = #v95
        local v97 = {
            ["Size"] = UDim2.fromScale(0.98, 0.6)
        }
        local v98 = UDim2
        local v99 = u18.CardData
        if v99 ~= nil then
            v99 = v99.subtitle
        end
        v97.Position = v98.fromScale(0.5, v99 == nil and 0.5 or 0.1)
        local v100 = u18.CardData
        if v100 ~= nil then
            v100 = v100.subtitle
        end
        v97.AnchorPoint = Vector2.new(0.5, v100 == nil and 0.5 or 0)
        local v101 = u18.CardData
        if v101 ~= nil then
            v101 = v101.title
        end
        v97.Text = v101
        v97.TextScaled = true
        v97.TextColor3 = u4.WHITE
        v97.TextXAlignment = Enum.TextXAlignment.Center
        v97.TextYAlignment = Enum.TextYAlignment.Center
        v97.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v97.BackgroundTransparency = 1
        v97.TextTransparency = 0
        v97[u12.Ref] = u30
        v95[v96 + 1] = u12.createElement("TextLabel", v97)
        local v102 = u18.CardData
        if v102 ~= nil then
            v102 = v102.subtitle
        end
        local v103 = v102 ~= nil
        if v103 then
            v103 = u12.createElement("TextLabel", {
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Position"] = UDim2.fromScale(0.5, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Text"] = u18.CardData.subtitle,
                ["TextScaled"] = true,
                ["TextColor3"] = u4.WHITE,
                ["Transparency"] = 0.3,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0,
                [u12.Ref] = u31
            })
        end
        if v103 then
            v95[v96 + 2] = v103
        end
        v87.CardFooter = u12.createElement("Frame", v94, v95)
        local v104
        if u18.PlayerLevelReq == nil then
            v104 = false
        else
            local v105 = u12.createElement
            local v106 = {
                ["Transparency"] = 0.2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u4.BLACK
            }
            local v107 = {}
            local v108 = u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center
            })
            local v109 = u12.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.15),
                ["Image"] = u15.LOCK_ART
            }, { u12.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
            local v110 = u12.createElement
            local v111 = {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0,
                ["Size"] = UDim2.fromScale(0.7, 0.15)
            }
            local v112 = u4.richTextColor(u4.WHITE)
            local v113 = u18.PlayerLevelReq
            v111.Text = "PLAYER LEVEL <font color=\"" .. v112 .. "\">" .. tostring(v113) .. "</font>"
            v111.TextColor3 = u4.darken(u4.WHITE, 0.68)
            v111.TextXAlignment = Enum.TextXAlignment.Center
            v111.TextYAlignment = Enum.TextYAlignment.Center
            v111.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            __set_list(v107, 1, {v108, v109, v110("TextLabel", v111)})
            v104 = v105("Frame", v106, v107)
        end
        if v104 then
            v87[v89 + 1] = v104
        end
        v84.ClippedInnerCardContainer = u12.createElement(u6, v86, v87)
        local v114 = u18.CardData.helperIcons
        if v114 then
            local v115 = {
                ["Size"] = UDim2.fromScale(1, 0.65),
                ["Position"] = UDim2.fromScale(0, 0.1)
            }
            local v116 = { u12.createElement(u7, {
                    ["Padding"] = UDim.new(0, 10)
                }) }
            local _ = #v116
            local v117 = u18.CardData.helperIcons.text
            local v118
            if v117 == nil then
                v118 = v117
            else
                local function v120(p119) --[[ Line: 437 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u4
                        [3] = u9
                        [4] = u3
                    --]]
                    return u12.createElement("TextLabel", {
                        ["TextSize"] = 14,
                        ["BackgroundTransparency"] = 0.25,
                        ["ZIndex"] = 10,
                        ["Text"] = p119[1],
                        ["Size"] = UDim2.new(0, 14, 0, 14),
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center,
                        ["BackgroundColor3"] = u4.BLACK,
                        ["Font"] = Enum.Font.SourceSansBold
                    }, { u12.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        }), u12.createElement(u9, {}, { u12.createElement(u3, {
                                ["TextSize"] = 14,
                                ["Text"] = p119[2],
                                ["Font"] = Enum.Font.SourceSansBold,
                                ["Limits"] = Vector2.new(300, 120)
                            }) }) })
                end
                v118 = table.create(#v117)
                for v121, v122 in v117 do
                    v118[v121] = v120(v122, v121 - 1, v117)
                end
            end
            local v123 = {
                ["Size"] = UDim2.new(1, 0, 0, 16),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 1)
            }
            local v124 = { u12.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["Padding"] = UDim.new(0, 4)
                }) }
            local v125 = #v124
            if v118 then
                for v126, v127 in v118 do
                    v124[v125 + v126] = v127
                end
            end
            local v128 = #v124
            local v129 = u18.CardData.helperIcons.images
            local v130
            if v129 == nil then
                v130 = v129
            else
                local function v135(p131) --[[ Line: 490 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u4
                        [3] = u9
                        [4] = u3
                    --]]
                    local v132 = u12.createElement
                    local v133 = {
                        ["BackgroundTransparency"] = 0.25,
                        ["ZIndex"] = 10,
                        ["Size"] = UDim2.new(0, 20, 0, 20),
                        ["BackgroundColor3"] = u4.BLACK
                    }
                    local v134 = {
                        ["HelperIconImage"] = u12.createElement("ImageLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["ZIndex"] = 10,
                            ["Size"] = UDim2.new(0, 14, 0, 14),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Image"] = p131[1],
                            ["ScaleType"] = Enum.ScaleType.Fit
                        }, { u12.createElement(u9, {}, { u12.createElement(u3, {
                                    ["TextSize"] = 14,
                                    ["Text"] = p131[2],
                                    ["Font"] = Enum.Font.SourceSansBold,
                                    ["Limits"] = Vector2.new(300, 60)
                                }) }) })
                    }
                    return v132("Frame", v133, v134)
                end
                v130 = table.create(#v129)
                for v136, v137 in v129 do
                    v130[v136] = v135(v137, v136 - 1, v129)
                end
            end
            if v130 then
                for v138, v139 in v130 do
                    v124[v128 + v138] = v139
                end
            end
            v116.HelperIconsList = u12.createElement(u6, v123, v124)
            v114 = u12.createElement(u6, v115, v116)
        end
        if v114 then
            v84[v85 + 1] = v114
        end
        local v140 = #v84
        local v141 = u18.CardData
        if v141 ~= nil then
            v141 = v141.AbsolutePosElements
        end
        if v141 then
            for v142, v143 in v141 do
                v84[v140 + v142] = v143
            end
        end
        v82.InnerCardContainer = u12.createElement(u6, v83, v84)
        return u12.createElement(u6, v79, v82)
    end)
}