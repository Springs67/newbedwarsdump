local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "slime-tamer", "slime-util")
local u11 = v10.SlimeMeta
local u12 = v10.SlimeType
local u13 = Color3.fromRGB(122, 207, 69)
return {
    ["SlimeTamerSidebar"] = v9.new(u8)(function(u14, p15) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u5
            [4] = u12
            [5] = u11
            [6] = u4
            [7] = u13
            [8] = u6
            [9] = u3
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local u18 = u8.createRef()
        local u19, u20 = v16(0)
        local u21, u22 = v16(0)
        local u23, u24 = v16(0)
        local u25, u26 = v16(0)
        local u27, u28 = v16(0)
        local u29, u30 = v16(0)
        local u31, u32 = v16(0)
        local u33, u34 = v16(0)
        v17(function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u7
                [3] = u5
                [4] = u14
                [5] = u12
                [6] = u22
                [7] = u20
                [8] = u24
                [9] = u26
                [10] = u30
                [11] = u28
                [12] = u32
                [13] = u34
            --]]
            if not u18:getValue() then
                return nil
            end
            local u35 = u7.new()
            if not u5.isHoarceKat() then
                for _, u36 in u14.tamedSlimeData do
                    local u37 = u36:GetAttribute("SlimeType")
                    local v38 = u36:GetAttribute("Friendship")
                    if u37 == u12.VOID then
                        u22(v38)
                    elseif u37 == u12.HEALING then
                        u20(v38)
                    elseif u37 == u12.STICKY then
                        u24(v38)
                    elseif u37 == u12.FROSTY then
                        u26(v38)
                    end
                    u35:GiveTask(u36:GetAttributeChangedSignal("Friendship"):Connect(function() --[[ Line: 61 ]]
                        --[[
                        Upvalues:
                            [1] = u36
                            [2] = u37
                            [3] = u12
                            [4] = u22
                            [5] = u20
                            [6] = u24
                            [7] = u26
                        --]]
                        local v39 = u36:GetAttribute("Friendship")
                        if u37 == u12.VOID then
                            u22(v39)
                            return
                        elseif u37 == u12.HEALING then
                            u20(v39)
                            return
                        elseif u37 == u12.STICKY then
                            u24(v39)
                            return
                        elseif u37 == u12.FROSTY then
                            u26(v39)
                        end
                    end))
                    local v40 = u36:GetAttribute("Buff")
                    if u37 == u12.VOID then
                        u30(v40)
                    elseif u37 == u12.HEALING then
                        u28(v40)
                    elseif u37 == u12.STICKY then
                        u32(v40)
                    elseif u37 == u12.FROSTY then
                        u34(v40)
                    end
                    u35:GiveTask(u36:GetAttributeChangedSignal("Buff"):Connect(function() --[[ Line: 103 ]]
                        --[[
                        Upvalues:
                            [1] = u36
                            [2] = u37
                            [3] = u12
                            [4] = u30
                            [5] = u28
                            [6] = u32
                            [7] = u34
                        --]]
                        local v41 = u36:GetAttribute("Buff")
                        if u37 == u12.VOID then
                            u30(v41)
                            return
                        elseif u37 == u12.HEALING then
                            u28(v41)
                            return
                        elseif u37 == u12.STICKY then
                            u32(v41)
                            return
                        elseif u37 == u12.FROSTY then
                            u34(v41)
                        end
                    end))
                end
            end
            return function() --[[ Line: 127 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u35
                --]]
                if not u5.isHoarceKat() then
                    u35:DoCleaning()
                end
            end
        end, {})
        local v42 = {}
        local v43 = #v42
        local v44 = {
            ["Transparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.2, 0.34),
            ["Position"] = UDim2.fromScale(0.025, u5.isMobileControls() and 0.25 or 0.3)
        }
        local v45 = {}
        local v46 = #v45
        local v47 = {
            ["Image"] = "rbxassetid://15185871843",
            ["ImageTransparency"] = 0.3,
            ["BorderSizePixel"] = 3,
            ["BackgroundTransparency"] = 1,
            ["ScaleType"] = "Crop",
            ["ImageColor3"] = Color3.fromRGB(63, 128, 59),
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v48 = { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }), u8.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Transparency"] = 0.1,
                ["Color"] = Color3.fromRGB(50, 104, 49)
            }) }
        local _ = #v48
        local v49 = {
            [u8.Ref] = u18,
            ["Size"] = UDim2.fromScale(1, 0.95),
            ["Position"] = UDim2.fromScale(0.5, 0.495),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = false
        }
        local v50 = { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.3333333333333333
            }), u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0.02)
            }) }
        local v51 = #v50
        local v52 = {
            ["ResetOnSpawn"] = false
        }
        for v120, v121 in (function() --[[ Line: 189 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u21
                [3] = u23
                [4] = u25
                [5] = u27
                [6] = u29
                [7] = u31
                [8] = u33
                [9] = u11
                [10] = u14
                [11] = u8
                [12] = u4
                [13] = u13
                [14] = u6
                [15] = u3
            --]]
            local v53 = {
                u19,
                u21,
                u23,
                u25
            }
            local v54 = {
                u27,
                u29,
                u31,
                u33
            }
            local v55 = false
            local v56 = 0
            local v57 = {}
            while true do
                if v55 then
                    v56 = v56 + 1
                else
                    v55 = true
                end
                if v56 >= 4 then
                    return v57
                end
                local v58 = v53[v56 + 1]
                local v59 = v54[v56 + 1]
                local v60 = u11[v56]
                local v61 = u14.tamedSlimes
                local v62 = table.find(v61, v56) ~= nil
                if v62 then
                    local v63 = u8.createFragment
                    local v64 = {}
                    local v65 = "SlotDetails_" .. tostring(v56)
                    local v66 = u8.createElement
                    local v67 = "Frame"
                    local v68 = {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["AnchorPoint"] = Vector2.new(0, 0),
                        ["Position"] = UDim2.fromScale(1.05, 0),
                        ["Size"] = UDim2.fromScale(0.4, 1)
                    }
                    local v69 = {}
                    local v70 = "Outline_" .. tostring(v56)
                    local v71 = u8.createElement
                    local v72 = "ImageLabel"
                    local v73 = {
                        ["Image"] = "rbxassetid://15310207144",
                        ["ImageTransparency"] = 0.1,
                        ["BorderSizePixel"] = 0,
                        ["BackgroundTransparency"] = 1,
                        ["ZIndex"] = 12
                    }
                    local v74
                    if v58 == 100 then
                        v74 = Color3.fromRGB(171, 41, 28)
                    else
                        v74 = Color3.fromRGB(50, 104, 49)
                    end
                    v73.ImageColor3 = v74
                    v73.ScaleType = Enum.ScaleType.Fit
                    v73.AnchorPoint = Vector2.new(0.5, 0)
                    v73.Position = UDim2.fromScale(0.5, 0.5)
                    v73.Size = UDim2.fromScale(1, 0.5)
                    v69[v70] = v71(v72, v73)
                    local v75 = "SlimeFriendship_" .. tostring(v56)
                    local v76 = u8.createElement
                    local v77 = "ImageLabel"
                    local v78 = {
                        ["Image"] = "rbxassetid://15293239499",
                        ["ImageTransparency"] = 0.15,
                        ["BorderSizePixel"] = 0,
                        ["BackgroundTransparency"] = 1,
                        ["ZIndex"] = 11,
                        ["ImageColor3"] = u4.WHITE,
                        ["ScaleType"] = Enum.ScaleType.Fit,
                        ["AnchorPoint"] = Vector2.new(0.5, 0),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1, 0.5)
                    }
                    local v79 = {}
                    local v80 = u8.createElement
                    local v81 = "UIGradient"
                    local v82 = {
                        ["Rotation"] = -90
                    }
                    local v83
                    if v58 == 100 then
                        v83 = ColorSequence.new(Color3.fromRGB(194, 52, 39))
                    else
                        v83 = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, u4.WHITE),
                            ColorSequenceKeypoint.new(0.5, u4.WHITE),
                            ColorSequenceKeypoint.new(0.5001, Color3.fromRGB(20, 20, 20)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
                        })
                    end
                    v82.Color = v83
                    v82.Offset = Vector2.new(0, 0.5 - v58 / 100)
                    __set_list(v79, 1, {v80(v81, v82)})
                    v69[v75] = v76(v77, v78, v79)
                    v64[v65] = v66(v67, v68, v69)
                    v62 = v63(v64)
                end
                local v84 = {
                    ["BackgroundTransparency"] = 0.3,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.75, 0.24),
                    ["BackgroundColor3"] = Color3.fromRGB(20, 20, 20)
                }
                local v85 = {}
                local v86 = u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 8)
                })
                local v87 = u8.createElement
                local v88 = "UIStroke"
                local v89 = {
                    ["Transparency"] = 0.1,
                    ["Thickness"] = u14.selectedSlimeType == v56 and 2 or 1
                }
                local v90
                if u14.selectedSlimeType == v56 then
                    v90 = u13
                else
                    v90 = Color3.fromRGB(50, 104, 49)
                end
                v89.Color = v90
                __set_list(v85, 1, {v86, v87(v88, v89)})
                local v91 = #v85
                if v62 then
                    v85[v91 + 1] = v62
                end
                local _ = #v85
                local v92 = v60 ~= nil
                if v92 then
                    local v93 = {}
                    local v94 = v60.image
                    v93.Image = v94 == nil and "" or v94
                    local v95 = u14.tamedSlimes
                    local v96
                    if table.find(v95, v56) == nil then
                        v96 = u4.BLACK
                    else
                        v96 = nil
                    end
                    v93.ImageColor3 = v96
                    local v97 = u14.tamedSlimes
                    v93.ImageTransparency = table.find(v97, v56) == nil and 0.6 or 0
                    v93.ScaleType = Enum.ScaleType.Fit
                    v93.AnchorPoint = Vector2.new(0.5, 0.5)
                    v93.Position = UDim2.fromScale(0.5, 0.5)
                    v93.Size = UDim2.fromScale(0.9, 0.9)
                    v93.BorderSizePixel = 0
                    v93.BackgroundTransparency = 1
                    v93.ZIndex = 11
                    local v98 = u8.createFragment
                    local v99 = {}
                    local v100 = u8.createElement
                    local v101 = {}
                    local v102 = u8.createElement
                    local v103 = u6
                    local v104 = {}
                    local v105 = u8.createElement(u3, {
                        ["TextSize"] = 16,
                        ["Text"] = v60.name,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["TextColor3"] = v60.color,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["Limits"] = Vector2.new(300, 60)
                    })
                    local v106 = u8.createElement(u3, {
                        ["TextSize"] = 14,
                        ["Text"] = v60.description,
                        ["Font"] = Enum.Font.SourceSansSemibold,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["Limits"] = Vector2.new(300, 60)
                    })
                    local v107 = u8.createElement
                    local v108 = u3
                    local v109 = {
                        ["TextSize"] = 14
                    }
                    local v110 = v60.buffDescription
                    local v111 = v59 * 100
                    local v112 = math.round(v111)
                    local v113 = tostring(v112)
                    local v114 = v60.maxBuffPercent * 100
                    local v115 = math.round(v114)
                    v109.Text = v110 .. ": " .. v113 .. "% (Max: " .. tostring(v115) .. "%)"
                    v109.Font = Enum.Font.SourceSansSemibold
                    v109.TextXAlignment = Enum.TextXAlignment.Left
                    v109.Limits = Vector2.new(300, 60)
                    __set_list(v104, 1, {v105, v106, v107(v108, v109)})
                    __set_list(v101, 1, {v102(v103, {}, v104)})
                    v99.SlimeImage = v100("ImageLabel", v93, v101)
                    v92 = v98(v99)
                end
                local v116 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v117 = { u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 4)
                    }) }
                local v118 = #v117
                if v92 then
                    v117[v118 + 1] = v92
                end
                v85["SlotContent_" .. tostring(v56)] = u8.createElement("Frame", v116, v117)
                local v119 = u8.createFragment({
                    ["Slot_" .. tostring(v56)] = u8.createElement("Frame", v84, v85)
                })
                table.insert(v57, v119)
            end
        end)() do
            v50[v51 + v120] = v121
        end
        v48.SlimeContainer = u8.createElement("Frame", v49, v50)
        v45.OuterContainer = u8.createElement("ImageLabel", v47, v48)
        v45[v46 + 1] = u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 0.75
        })
        v42[v43 + 1] = u8.createElement("Frame", v44, v45)
        return u8.createFragment({
            ["SlimeTamerGUI"] = u8.createElement("ScreenGui", v52, v42)
        })
    end)
}