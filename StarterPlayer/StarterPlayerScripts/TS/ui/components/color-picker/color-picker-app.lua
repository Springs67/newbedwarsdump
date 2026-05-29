local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.DarkBackground
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.ScaleComponent
local u9 = v2.SlideIn
local u10 = v2.WidgetComponent
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local function u21(p17) --[[ Line: 18 ]]
    local v18 = string.gsub(p17, "%s", "")
    if v18 == "" then
        return nil
    else
        local v19
        if string.sub(v18, 1, 1) == "#" then
            v19 = string.sub(v18, 2)
        else
            v19 = v18
        end
        local v20 = #v19
        if v20 == 3 or v20 == 6 then
            if #string.gsub(v19, "[^0-9A-Fa-f]", "") == v20 then
                return Color3.fromHex(v18)
            else
                return nil
            end
        else
            return nil
        end
    end
end
local function u25(p22) --[[ Line: 37 ]]
    local v23 = string.gsub(p22, "[^#0-9A-Fa-f]", "")
    local v24 = string.upper((string.gsub(v23, "#", "")))
    if #v24 > 6 then
        v24 = string.sub(v24, 1, 6)
    end
    return "#" .. v24
end
local function u39(p26, p27, p28, p29) --[[ Line: 43 ]]
    local v30 = p26.AbsoluteSize.X
    local v31 = p26.AbsoluteSize.Y
    if v30 == 0 or v31 == 0 then
        return nil
    end
    local v32 = p26.AbsoluteSize.X / 2
    local v33 = math.clamp(p28, 0, 1)
    local v34 = math.clamp(p29, 0, 1)
    local v35 = v33 * 3.141592653589793 * 2
    local v36 = v34 * v32
    local v37 = -1 * v36 * math.cos(v35)
    local v38 = v36 * math.sin(v35)
    p27.Position = UDim2.fromScale(0.5 + v37 / v30, 0.5 + v38 / v31)
end
local v268 = v13.new(u12)(function(u40, p41) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u4
        [4] = u39
        [5] = u15
        [6] = u6
        [7] = u5
        [8] = u8
        [9] = u7
        [10] = u3
        [11] = u16
        [12] = u25
        [13] = u21
        [14] = u10
        [15] = u9
    --]]
    local v42 = p41.useEffect
    local v43 = p41.useMemo
    local v44 = p41.useState
    local u45 = v43(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        return u40.Color or Color3.fromRGB(255, 255, 255)
    end, { u40.Color })
    local u46, u47, u48 = v43(function() --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        return Color3.toHSV(u45)
    end, { u45 })
    local u50, u51 = v44(function() --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        local v49 = u45.R * 255
        return math.round(v49)
    end)
    local u53, u54 = v44(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        local v52 = u45.G * 255
        return math.round(v52)
    end)
    local u56, u57 = v44(function() --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        local v55 = u45.B * 255
        return math.round(v55)
    end)
    local v58, u59 = v44(false)
    local v67, u68 = v44(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        local v60 = string.upper
        local v61 = Color3.fromRGB
        local v62 = u45.R * 255
        local v63 = math.round(v62)
        local v64 = u45.G * 255
        local v65 = math.round(v64)
        local v66 = u45.B * 255
        return "#" .. v60(v61(v63, v65, (math.round(v66))):ToHex())
    end)
    local u69 = v43(function() --[[ Line: 82 ]]
        return {
            ["current"] = false
        }
    end, {})
    local v70 = v43(function() --[[ Line: 87 ]]
        return { "R", "G", "B" }
    end, {})
    local u71 = v43(function() --[[ Line: 90 ]]
        return {
            ["current"] = nil
        }
    end, {})
    local u73 = v43(function() --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u47
            [3] = u48
        --]]
        local v72 = {
            ["current"] = {
                ["h"] = u46,
                ["s"] = u47,
                ["v"] = u48
            }
        }
        return v72
    end, { u46, u47, u48 })
    local u74 = v43(function() --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        return {
            ["current"] = u40.OnUpdateColor
        }
    end, {})
    u74.current = u40.OnUpdateColor
    local u75 = v43(function() --[[ Line: 110 ]]
        return {
            ["current"] = false
        }
    end, {})
    local u76 = u12.createRef()
    local u77 = u12.createRef()
    local u78 = u12.createRef()
    local u79 = u12.createRef()
    local u80 = u12.createRef()
    local u81 = u12.createRef()
    local u82 = u12.createRef()
    v42(function() --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u76
            [2] = u77
            [3] = u78
            [4] = u79
            [5] = u80
            [6] = u81
            [7] = u82
            [8] = u11
            [9] = u75
            [10] = u73
            [11] = u74
            [12] = u4
            [13] = u39
            [14] = u51
            [15] = u54
            [16] = u57
            [17] = u71
            [18] = u15
        --]]
        local u83 = u76:getValue()
        local u84 = u77:getValue()
        local u85 = u78:getValue()
        local u86 = u79:getValue()
        local u87 = u80:getValue()
        local u88 = u81:getValue()
        local u89 = u82:getValue()
        if not (u83 and (u84 and (u85 and (u86 and (u87 and (u88 and u89)))))) then
            return nil
        end
        local u90 = u11.new()
        local u91 = false
        local u92 = false
        local function u109() --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u75
                [2] = u73
                [3] = u74
                [4] = u88
                [5] = u89
                [6] = u4
                [7] = u87
                [8] = u39
                [9] = u83
                [10] = u84
                [11] = u86
                [12] = u51
                [13] = u54
                [14] = u57
            --]]
            u75.current = true
            local v93 = u73.current
            local v94 = v93.h
            local v95 = v93.s
            local v96 = v93.v
            local v97 = Color3.fromHSV(math.clamp(v94, 0, 1), math.clamp(v95, 0, 1), (math.clamp(v96, 0, 1)))
            local v98 = Color3.fromHSV(math.clamp(v94, 0, 1), math.clamp(v95, 0, 1), 1)
            local v99 = u74.current
            if v99 ~= nil then
                v99(v97)
            end
            u88.BackgroundColor3 = v97
            u89.Color = u4.darken(v97, 0.5)
            u87.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v98), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) })
            u39(u83, u84, v94, v95)
            u86.Position = UDim2.fromScale(0.5, 1 - v96)
            local v100 = u51
            local v101 = v97.R * 255
            local v102 = math.round(v101)
            v100((math.clamp(v102, 0, 255)))
            local v103 = u54
            local v104 = v97.G * 255
            local v105 = math.round(v104)
            v103((math.clamp(v105, 0, 255)))
            local v106 = u57
            local v107 = v97.B * 255
            local v108 = math.round(v107)
            v106((math.clamp(v108, 0, 255)))
            task.defer(function() --[[ Line: 156 ]]
                --[[
                Upvalues:
                    [1] = u75
                --]]
                u75.current = false
            end)
        end
        function u71.current(p110, p111, p112) --[[ Line: 160 ]]
            --[[
            Upvalues:
                [1] = u75
                [2] = u73
                [3] = u39
                [4] = u83
                [5] = u84
                [6] = u86
                [7] = u87
                [8] = u74
                [9] = u88
                [10] = u89
                [11] = u4
                [12] = u51
                [13] = u54
                [14] = u57
            --]]
            if u75.current then
                return nil
            end
            local v113 = Color3.fromHSV
            local v114 = u73.current.h
            local v115 = math.clamp(v114, 0, 1)
            local v116 = u73.current.s
            local v117 = math.clamp(v116, 0, 1)
            local v118 = u73.current.v
            local v119 = v113(v115, v117, (math.clamp(v118, 0, 1)))
            local v120 = v119.R * 255
            local v121 = math.round(v120)
            local v122 = v119.G * 255
            local v123 = math.round(v122)
            local v124 = v119.B * 255
            local v125 = math.round(v124)
            if p110 == v121 and (p111 == v123 and p112 == v125) then
                return nil
            end
            local v126 = Color3.fromRGB(p110, p111, p112)
            local v127, v128, v129 = Color3.toHSV(v126)
            u73.current.h = math.clamp(v127, 0, 1)
            u73.current.s = math.clamp(v128, 0, 1)
            u73.current.v = math.clamp(v129, 0, 1)
            u39(u83, u84, v127, v128)
            u86.Position = UDim2.fromScale(0.5, 1 - v129)
            local v130 = Color3.fromHSV(math.clamp(v127, 0, 1), math.clamp(v128, 0, 1), 1)
            u87.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v130), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) })
            local v131 = u74.current
            if v131 ~= nil then
                v131(v126)
            end
            u88.BackgroundColor3 = v126
            u89.Color = u4.darken(v126, 0.5)
            u51(p110)
            u54(p111)
            u57(p112)
        end
        local function u145(p132) --[[ Line: 199 ]]
            --[[
            Upvalues:
                [1] = u83
                [2] = u73
                [3] = u84
                [4] = u109
            --]]
            local v133 = p132 - (u83.AbsolutePosition + u83.AbsoluteSize / 2)
            local v134 = u83.AbsoluteSize.X / 2
            if v134 < v133.Magnitude then
                v133 = v133.Unit * v134
            end
            local v135 = v133.Magnitude / v134
            local v136 = Vector2.new(-1 * v133.X, v133.Y)
            local v137 = v136.Y
            local v138 = v136.X
            local v139 = math.atan2(v137, v138)
            if v139 < 0 then
                v139 = v139 + 6.283185307179586
            end
            local v140 = v139 / 6.283185307179586
            local v141 = math.clamp(v140, 0, 1)
            local v142 = math.clamp(v135, 0, 1)
            u73.current.h = v141
            u73.current.s = v142
            local v143 = u83.AbsoluteSize.X
            local v144 = u83.AbsoluteSize.Y
            if v143 ~= 0 and v144 ~= 0 then
                u84.Position = UDim2.fromScale(0.5 + v133.X / v143, 0.5 + v133.Y / v144)
            end
            u109()
        end
        u90:GiveTask(u15.InputBegan:Connect(function(p146) --[[ Line: 236 ]]
            --[[
            Upvalues:
                [1] = u83
                [2] = u91
                [3] = u145
                [4] = u85
                [5] = u92
                [6] = u73
                [7] = u86
                [8] = u109
            --]]
            if p146.UserInputType == Enum.UserInputType.MouseButton1 or p146.UserInputType == Enum.UserInputType.Touch then
                local v147 = Vector2.new(p146.Position.X, p146.Position.Y)
                local v148 = u83
                local v149 = v148.AbsolutePosition
                local v150 = v148.AbsoluteSize
                local v151
                if v150.X == 0 or v150.Y == 0 or (v147.X < v149.X or (v147.X > v149.X + v150.X or v147.Y < v149.Y)) then
                    v151 = false
                else
                    v151 = v147.Y <= v149.Y + v150.Y
                end
                if v151 then
                    u91 = true
                    u145(v147)
                else
                    local v152 = u85
                    local v153 = v152.AbsolutePosition
                    local v154 = v152.AbsoluteSize
                    local v155
                    if v154.X == 0 or v154.Y == 0 or (v147.X < v153.X or (v147.X > v153.X + v154.X or v147.Y < v153.Y)) then
                        v155 = false
                    else
                        v155 = v147.Y <= v153.Y + v154.Y
                    end
                    if v155 then
                        u92 = true
                        local v156 = (v147.Y - u85.AbsolutePosition.Y) / u85.AbsoluteSize.Y
                        local v157 = math.clamp(v156, 0, 1)
                        local v158 = u73.current
                        local v159 = 1 - v157
                        v158.v = math.clamp(v159, 0, 1)
                        u86.Position = UDim2.fromScale(0.5, v157)
                        u109()
                    end
                end
            else
                return nil
            end
        end))
        u90:GiveTask(u15.InputEnded:Connect(function(p160) --[[ Line: 249 ]]
            --[[
            Upvalues:
                [1] = u91
                [2] = u92
            --]]
            if p160.UserInputType ~= Enum.UserInputType.MouseButton1 and p160.UserInputType ~= Enum.UserInputType.Touch then
                return nil
            end
            u91 = false
            u92 = false
        end))
        u90:GiveTask(u15.InputChanged:Connect(function(p161) --[[ Line: 256 ]]
            --[[
            Upvalues:
                [1] = u91
                [2] = u92
                [3] = u145
                [4] = u85
                [5] = u73
                [6] = u86
                [7] = u109
            --]]
            if not (u91 or u92) then
                return nil
            end
            if p161.UserInputType ~= Enum.UserInputType.MouseMovement and p161.UserInputType ~= Enum.UserInputType.Touch then
                return nil
            end
            if u91 then
                u145(Vector2.new(p161.Position.X, p161.Position.Y))
            end
            if u92 then
                local v162 = (p161.Position.Y - u85.AbsolutePosition.Y) / u85.AbsoluteSize.Y
                local v163 = math.clamp(v162, 0, 1)
                local v164 = u73.current
                local v165 = 1 - v163
                v164.v = math.clamp(v165, 0, 1)
                u86.Position = UDim2.fromScale(0.5, v163)
                u109()
            end
        end))
        u109()
        return function() --[[ Line: 271 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u90
            --]]
            u71.current = nil
            u90:DoCleaning()
        end
    end, {})
    local v166 = Color3.fromHSV
    local v167 = u73.current.h
    local v168 = math.clamp(v167, 0, 1)
    local v169 = u73.current.s
    local v170 = math.clamp(v169, 0, 1)
    local v171 = u73.current.v
    local v172 = v166(v168, v170, (math.clamp(v171, 0, 1)))
    local u173 = v43(function() --[[ Line: 277 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u53
            [3] = u56
        --]]
        return "#" .. string.upper(Color3.fromRGB(u50, u53, u56):ToHex())
    end, { u50, u53, u56 })
    local v174 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }
    local v175 = { u12.createElement(u5, {
            ["BackgroundTransparency"] = 0.4,
            ["AppId"] = u40.AppId
        }) }
    local v176 = #v175
    local v177 = {}
    local v178 = #v177
    local v179 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset((u40.Children and 2 or 1) * 350, 400)
    }
    local v180 = { u12.createElement(u8, {
            ["PowerRelationshipPastMaximum"] = 0.6,
            ["MaximumSize"] = Vector2.new((u40.Children and 2 or 1) * 350, 400),
            ["ScreenPadding"] = Vector2.new(12, 12)
        }) }
    local v181 = #v180
    local v183 = {
        ["Title"] = "Color Picker",
        ["AppId"] = u40.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 313 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            local v182 = u40.OnClose
            if v182 ~= nil then
                v182 = v182()
            end
            return v182
        end
    }
    local v184 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        }) }
    local v185 = #v184
    local v186 = u40.Children
    if v186 then
        v186 = u12.createElement(u7, {
            ["Size"] = UDim2.fromScale(0.5, 1)
        }, { u12.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u40.Children })
    end
    if v186 then
        v184[v185 + 1] = v186
    end
    local v187 = #v184
    local v188 = {
        ["Size"] = UDim2.fromScale(u40.Children and 0.5 or 1, 1)
    }
    local v189 = {
        u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        }),
        u12.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.05, 0)
        }),
        ["ColorPickerContainer"] = u12.createElement(u7, {
            ["Size"] = UDim2.new(1, 0, 0, 250)
        }, {
            ["ColorWheelContainer"] = u12.createElement(u7, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, {
                u12.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["Padding"] = UDim.new(0, 16),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }),
                ["ColorWheel"] = u12.createElement("ImageButton", {
                    [u12.Ref] = u76,
                    ["Size"] = UDim2.fromOffset(250, 250),
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = "rbxassetid://6020299385",
                    ["LayoutOrder"] = 1
                }, { u12.createElement("Frame", {
                        [u12.Ref] = u77,
                        ["Size"] = UDim2.new(0, 10, 0, 10),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
                    }, { u12.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        }), u12.createElement("UIStroke", {
                            ["Thickness"] = 2,
                            ["Color"] = u4.BLACK
                        }) }) }),
                ["Slider"] = u12.createElement("ImageButton", {
                    [u12.Ref] = u78,
                    ["Size"] = UDim2.new(0, 20, 0, 250),
                    ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 2
                }, { u12.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.25, 0)
                    }), u12.createElement("UIGradient", {
                        [u12.Ref] = u80,
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHSV(math.clamp(u46, 0, 1), math.clamp(u47, 0, 1), 1)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) })
                    }), u12.createElement("Frame", {
                        [u12.Ref] = u79,
                        ["Size"] = UDim2.new(1, 10, 0, 10),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["BackgroundColor3"] = u4.WHITE
                    }, { u12.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0.5, 0)
                        }), u12.createElement("UIStroke", {
                            ["Thickness"] = 2,
                            ["Color"] = u4.BLACK
                        }) }) })
            })
        })
    }
    local _ = #v189
    local v190 = {
        ["Size"] = UDim2.new(1, 0, 0, 80)
    }
    local v198 = {
        u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["Padding"] = UDim.new(0, 8),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }),
        u12.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 16)
        }),
        ["PreviewContainerInner"] = u12.createElement(u7, {
            ["Size"] = UDim2.new(1, 0, 0, 28)
        }, {
            u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 16),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["SelectButtonContainer"] = u12.createElement(u7, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.8, 1)
            }, { u12.createElement(u3, {
                    ["Text"] = "Select Color",
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 453 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                            [2] = u73
                        --]]
                        local v191 = u40.OnSelect
                        if v191 ~= nil then
                            local v192 = Color3.fromHSV
                            local v193 = u73.current.h
                            local v194 = math.clamp(v193, 0, 1)
                            local v195 = u73.current.s
                            local v196 = math.clamp(v195, 0, 1)
                            local v197 = u73.current.v
                            v191(v192(v194, v196, (math.clamp(v197, 0, 1))))
                        end
                    end
                }) }),
            ["Preview"] = u12.createElement("Frame", {
                [u12.Ref] = u81,
                ["Size"] = UDim2.fromScale(0.2, 1),
                ["BackgroundColor3"] = v172,
                ["LayoutOrder"] = 2
            }, { u12.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.2, 0)
                }), u12.createElement("UIStroke", {
                    [u12.Ref] = u82,
                    ["Thickness"] = 3
                }), u12.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        })
    }
    local v199 = #v198
    local v200 = {
        ["Size"] = UDim2.new(1, 0, 0, 28)
    }
    local v201 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 16)
        }) }
    local v202 = #v201
    local function v223(p203, u204) --[[ Line: 494 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u53
            [3] = u56
            [4] = u12
            [5] = u7
            [6] = u4
            [7] = u16
            [8] = u71
        --]]
        local u205
        if u204 == 0 then
            u205 = u50
        elseif u204 == 1 then
            u205 = u53
        else
            u205 = u56
        end
        local v206 = tostring(u205)
        return u12.createElement(u7, {
            ["Size"] = UDim2.fromScale(0.3, 1)
        }, { u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 5)
            }), u12.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["Text"] = p203,
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            }), u12.createElement("TextBox", {
                ["Size"] = UDim2.fromScale(0.7, 1),
                ["Text"] = v206,
                ["PlaceholderText"] = "255",
                ["MaxVisibleGraphemes"] = 3,
                ["PlaceholderColor3"] = Color3.fromRGB(166, 166, 186),
                ["ClearTextOnFocus"] = false,
                ["TextColor3"] = u4.WHITE,
                ["TextTransparency"] = 0.5,
                ["TextScaled"] = true,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["BackgroundColor3"] = u16.backgroundTertiary,
                ["BackgroundTransparency"] = 0.5,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                [u12.Event.Focused] = function(u207) --[[ Line: 534 ]]
                    --[[
                    Upvalues:
                        [1] = u205
                    --]]
                    if u205 ~= 0 then
                        return nil
                    end
                    task.defer(function() --[[ Line: 538 ]]
                        --[[
                        Upvalues:
                            [1] = u207
                        --]]
                        if not u207.Parent then
                            return nil
                        end
                        local v208 = #u207.Text
                        if v208 == 0 then
                            return nil
                        end
                        u207.SelectionStart = 1
                        u207.CursorPosition = v208 + 1
                    end)
                end,
                [u12.Event.FocusLost] = function(p209) --[[ Line: 550 ]]
                    --[[
                    Upvalues:
                        [1] = u204
                        [2] = u50
                        [3] = u53
                        [4] = u56
                        [5] = u71
                    --]]
                    if string.gsub(p209.Text, "[^0-9]", "") ~= "" then
                        return nil
                    end
                    local v210 = u204 == 0 and 0 or u50
                    local v211 = u204 == 1 and 0 or u53
                    local v212 = u204 == 2 and 0 or u56
                    p209.Text = "0"
                    local v213 = u71.current
                    if v213 ~= nil then
                        v213(v210, v211, v212)
                    end
                end,
                [u12.Change.Text] = function(p214) --[[ Line: 564 ]]
                    --[[
                    Upvalues:
                        [1] = u204
                        [2] = u50
                        [3] = u53
                        [4] = u56
                        [5] = u71
                    --]]
                    local v215 = p214.Text
                    local v216 = string.gsub(v215, "[^0-9]", "")
                    if v216 == "" then
                        return nil
                    end
                    if #v216 > 3 then
                        v216 = string.sub(v216, 0, 3)
                    end
                    local v217 = tonumber(v216)
                    if v217 == nil then
                        return nil
                    end
                    local v218 = math.clamp(v217, 0, 255)
                    local v219 = tostring(v218)
                    if v219 ~= p214.Text then
                        p214.Text = v219
                    end
                    local v220
                    if u204 == 0 then
                        v220 = v218
                    else
                        v220 = u50
                    end
                    local v221
                    if u204 == 1 then
                        v221 = v218
                    else
                        v221 = u53
                    end
                    if u204 ~= 2 then
                        v218 = u56
                    end
                    local v222 = u71.current
                    if v222 ~= nil then
                        v222(v220, v221, v218)
                    end
                end,
                ["LayoutOrder"] = 2
            }, { u12.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                }) }) })
    end
    local v224 = table.create(#v70)
    for v225, v226 in v70 do
        v224[v225] = v223(v226, v225 - 1, v70)
    end
    local v227 = {
        ["Size"] = UDim2.fromScale(0.5, 1),
        ["BackgroundColor3"] = u4.WHITE
    }
    local v228 = { u12.createElement("UIListLayout", {
            ["HorizontalFlex"] = "SpaceBetween",
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v229 = #v228
    for v230, v231 in v224 do
        v228[v229 + v230] = v231
    end
    v201[v202 + 1] = u12.createElement(u7, v227, v228)
    local v232 = v202 + 2
    local v233 = u12.createElement
    local v234 = "Frame"
    local v235 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.4, 1)
    }
    local v236 = {}
    local v237 = u12.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 5)
    })
    local v238 = u12.createElement("TextLabel", {
        ["Text"] = "Hex",
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.28, 1),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["TextColor3"] = u4.WHITE,
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextYAlignment"] = Enum.TextYAlignment.Center,
        ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    })
    local v239 = u12.createElement
    local v240 = "TextBox"
    local v241 = {
        ["Size"] = UDim2.fromScale(0.72, 1)
    }
    if not v58 then
        v67 = u173
    end
    v241.Text = v67
    v241.PlaceholderText = "#FFFFFF"
    v241.MaxVisibleGraphemes = 7
    v241.PlaceholderColor3 = Color3.fromRGB(166, 166, 186)
    v241.ClearTextOnFocus = false
    v241.TextColor3 = u4.WHITE
    v241.TextTransparency = 0.5
    v241.TextScaled = true
    v241.TextXAlignment = Enum.TextXAlignment.Left
    v241.TextYAlignment = Enum.TextYAlignment.Center
    v241.BackgroundColor3 = u16.backgroundTertiary
    v241.BackgroundTransparency = 0.5
    v241.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    v241[u12.Event.Focused] = function(u242) --[[ Line: 661 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u173
            [3] = u59
            [4] = u68
        --]]
        u69.current = true
        local u243 = u173
        u59(true)
        u68(u243)
        task.defer(function() --[[ Line: 666 ]]
            --[[
            Upvalues:
                [1] = u242
                [2] = u243
            --]]
            if not u242.Parent then
                return nil
            end
            local v244 = #u243
            if v244 <= 1 then
                return nil
            end
            u242.SelectionStart = 2
            u242.CursorPosition = v244 + 1
        end)
    end
    v241[u12.Event.FocusLost] = function(p245) --[[ Line: 678 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u21
            [3] = u68
            [4] = u173
            [5] = u59
            [6] = u69
            [7] = u71
        --]]
        local v246 = u21((u25((string.gsub(p245.Text, "%s", "")))))
        if v246 == nil then
            u68(u173)
            u59(false)
            u69.current = false
            return nil
        end
        local v247 = u71.current
        if v247 ~= nil then
            local v248 = v246.R * 255
            local v249 = math.round(v248)
            local v250 = math.clamp(v249, 0, 255)
            local v251 = v246.G * 255
            local v252 = math.round(v251)
            local v253 = math.clamp(v252, 0, 255)
            local v254 = v246.B * 255
            local v255 = math.round(v254)
            v247(v250, v253, (math.clamp(v255, 0, 255)))
        end
        u59(false)
        u69.current = false
    end
    v241[u12.Change.Text] = function(p256) --[[ Line: 694 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u25
            [3] = u68
            [4] = u21
            [5] = u71
        --]]
        if not u69.current then
            return nil
        end
        local v257 = u25(p256.Text)
        if v257 ~= p256.Text then
            p256.Text = v257
        end
        u68(v257)
        local v258 = u21(v257)
        if v258 == nil then
            return nil
        end
        local v259 = u71.current
        if v259 ~= nil then
            local v260 = v258.R * 255
            local v261 = math.round(v260)
            local v262 = math.clamp(v261, 0, 255)
            local v263 = v258.G * 255
            local v264 = math.round(v263)
            local v265 = math.clamp(v264, 0, 255)
            local v266 = v258.B * 255
            local v267 = math.round(v266)
            v259(v262, v265, (math.clamp(v267, 0, 255)))
        end
    end
    v241.LayoutOrder = 2
    __set_list(v236, 1, {v237, v238, v239(v240, v241, { u12.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 3)
    }) })})
    v201[v232] = v233(v234, v235, v236)
    v198[v199 + 1] = u12.createElement(u7, v200, v201)
    v189.PreviewContainer = u12.createElement(u7, v190, v198)
    v184[v187 + 1] = u12.createElement(u7, v188, v189)
    v180[v181 + 1] = u12.createElement(u10, v183, v184)
    v177[v178 + 1] = u12.createElement("Frame", v179, v180)
    v175[v176 + 1] = u12.createElement(u9, {}, v177)
    return u12.createElement("ScreenGui", v174, v175)
end)
return {
    ["ColorPickerApp"] = v14.connect(function(_, p269) --[[ Line: 728 ]]
        local v270 = {}
        for v271, v272 in p269 do
            v270[v271] = v272
        end
        return v270
    end)(v268)
}