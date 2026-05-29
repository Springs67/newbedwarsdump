local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.EmptyButton
local u8 = v2.ShineEffect
local u9 = v2.ShineEffectVariation
local u10 = v2.TooltipContainer
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.TweenService
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-data-util").MapDataUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset
local function u28(p22) --[[ Line: 24 ]]
    local v23 = #p22
    if v23 == 0 then
        return nil
    end
    if v23 == 1 then
        return p22[1]
    end
    local v24 = p22[1]
    local v25 = false
    local v26 = 1
    while true do
        if v25 then
            v26 = v26 + 1
        else
            v25 = true
        end
        if v26 >= v23 then
            return v24
        end
        local v27
        if v26 == v23 - 1 then
            v27 = ", & " .. p22[v26 + 1]
        else
            v27 = ", " .. p22[v26 + 1]
        end
        v24 = v24 .. v27
    end
end
return {
    ["PregameVotingCard"] = v13.new(u12)(function(u29, p30) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u18
            [4] = u17
            [5] = u12
            [6] = u19
            [7] = u21
            [8] = u16
            [9] = u11
            [10] = u8
            [11] = u9
            [12] = u3
            [13] = u10
            [14] = u6
            [15] = u28
            [16] = u15
            [17] = u20
            [18] = u7
        --]]
        local v31 = p30.useState
        local v32 = p30.useEffect
        local v33 = p30.useMemo
        local u34, u35 = v31(u29.Selected ~= nil)
        local u36, u37 = v31((u5.isMobileControls() or u5.isSmallScreen()) and true or false)
        local v38, u39 = v31(u4.WHITE)
        local v40 = u29.voteState[u29.votingOptionIndex + 1]
        local u41 = v40.pregameVotingOption.mapName
        local u42 = u18(u41)
        local v43 = u17.getMapDisplayName(u41)
        local v44 = u17.getMapImage(u41)
        local v45 = u17.getMapCredits(u41)
        local v46 = v40.voterUserIds
        local u47 = u12.createRef()
        local u48 = u12.createRef()
        local u49 = u12.createRef()
        local u50 = u12.createRef()
        local v56 = v33(function() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u19
                [3] = u42
                [4] = u21
            --]]
            local v51 = {}
            if u41 == "to4_Halloween-Map-2025" then
                local v52 = {
                    ["image"] = u19.STAR_SOLID,
                    ["tooltip"] = {
                        ["name"] = "Special Event Map"
                    }
                }
                table.insert(v51, v52)
            end
            local v53 = u42
            if v53 ~= nil then
                v53 = v53.environment
                if v53 ~= nil then
                    v53 = v53.preset
                end
            end
            if v53 == u21.Night then
                local v54 = {
                    ["image"] = u19.CRESCENT_MOON_ICON,
                    ["tooltip"] = {
                        ["name"] = "Night Time"
                    }
                }
                table.insert(v51, v54)
                return v51
            end
            if v53 ~= u21.Winter then
                return v51
            end
            local v55 = {
                ["image"] = u19.SNOWFLAKE_ICON,
                ["tooltip"] = {
                    ["name"] = "Winter"
                }
            }
            table.insert(v51, v55)
            return v51
        end, { u42 })
        v32(function() --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u47
                [2] = u29
                [3] = u16
                [4] = u34
            --]]
            local v57 = u47:getValue()
            if not v57 then
                return nil
            end
            local v58 = u29.winHighlightIndex == u29.votingOptionIndex
            u16:Create(v57, TweenInfo.new(0.1, Enum.EasingStyle.Circular), {
                ["Transparency"] = v58 and 0 or (u29.winHighlightIndex == nil and (u34 and not u29.rouletteMode) and 0 or 1)
            }):Play()
        end, { u34, u29.winHighlightIndex, u29.rouletteMode })
        v32(function() --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u36
                [3] = u16
            --]]
            local v59 = u50:getValue()
            if v59 then
                if u36 then
                    u16:Create(v59, TweenInfo.new(0.3), {
                        ["Position"] = UDim2.fromScale(0, 0.7)
                    }):Play()
                else
                    u16:Create(v59, TweenInfo.new(0.3), {
                        ["Position"] = UDim2.fromScale(0, 1)
                    }):Play()
                end
            else
                return nil
            end
        end, { u36 })
        v32(function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u49
                [2] = u29
                [3] = u16
                [4] = u37
            --]]
            local v60 = u49:getValue()
            if not v60 then
                return nil
            end
            local v61 = u29.winHighlightIndex == u29.votingOptionIndex
            local v62 = u29.winHighlightIndex
            if v62 ~= 0 and (v62 == v62 and v62) then
                v62 = not v61
            end
            if v62 ~= 0 and (v62 == v62 and v62) then
                u16:Create(v60, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                    ["BackgroundTransparency"] = 0.7
                }):Play()
            end
            local v63 = u29.winHighlightIndex
            if v63 == 0 or v63 ~= v63 then
                v61 = v63
            elseif not v63 then
                v61 = v63
            end
            if v61 ~= 0 and (v61 == v61 and v61) then
                u37(true)
            end
        end, { u29.winHighlightIndex })
        v32(function() --[[ Line: 161 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u35
            --]]
            if not u29.Selected then
                u35(false)
            end
        end, { u29.Selected })
        v32(function() --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u29
                [3] = u39
            --]]
            local v64 = u4.WHITE
            if u29.winHighlightIndex == u29.votingOptionIndex then
                v64 = Color3.fromRGB(255, 227, 110)
            elseif u29.Selected then
                v64 = Color3.fromRGB(115, 255, 115)
            end
            u39(v64)
        end, { u29.winHighlightIndex, u29.votingOptionIndex, u29.Selected })
        local v66 = {
            [u12.Ref] = u49,
            ["LayoutOrder"] = u29.votingOptionIndex,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Selectable"] = true,
            [u12.Event.MouseButton1Click] = function() --[[ Line: 180 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u5
                    [3] = u11
                --]]
                if u29.rouletteMode then
                    return nil
                end
                local v65 = u29.OnClick
                if v65 ~= nil then
                    v65()
                end
                if not u5.isHoarceKat() then
                    u11.Controllers.PregameVotingController:voteForPregameOption(u29.votingOptionIndex)
                end
            end,
            [u12.Event.MouseEnter] = function() --[[ Line: 192 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u29
                    [3] = u35
                --]]
                u37(true)
                if u29.rouletteMode then
                    return nil
                end
                u35(true)
            end,
            [u12.Event.MouseLeave] = function() --[[ Line: 199 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u37
                    [3] = u35
                --]]
                if u29.winHighlightIndex ~= u29.votingOptionIndex then
                    u37(false)
                end
                if not (u29.Selected or u29.rouletteMode) then
                    u35(false)
                end
            end
        }
        local v67 = { u12.createElement(u8, {
                ["Loop"] = false,
                ["OnHover"] = true,
                ["Color"] = u4.WHITE,
                ["Variation"] = u9.solid
            }) }
        local v68 = #v67
        local v69 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.25),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v70 = {
            u12.createElement("UIListLayout", {
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["FillDirection"] = Enum.FillDirection.Horizontal
            }),
            u12.createElement("UIGradient", {
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 1) })
            }),
            u12.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 10)
            }),
            u12.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Size"] = UDim2.fromScale(0.7, 0.5),
                ["Text"] = v43,
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            })
        }
        local v71 = #v70
        local function v80(p72) --[[ Line: 247 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u3
                [3] = u10
            --]]
            local v73 = p72.tooltip ~= nil
            if v73 then
                local v74 = { u12.createElement(u3, {
                        ["TextSize"] = 26,
                        ["Text"] = p72.tooltip.name,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }
                local v75 = #v74
                local v76
                if p72.tooltip.description == nil then
                    v76 = false
                else
                    v76 = u12.createElement(u3, {
                        ["TextSize"] = 24,
                        ["Text"] = p72.tooltip.description,
                        ["Font"] = Enum.Font.SourceSans,
                        ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["Limits"] = Vector2.new(300, 150)
                    })
                end
                if v76 then
                    v74[v75 + 1] = v76
                end
                v73 = u12.createElement(u10, {}, v74)
            end
            local v77 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = p72.image,
                ["ImageColor3"] = p72.color,
                ["ScaleType"] = Enum.ScaleType.Fit
            }
            local v78 = { u12.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }
            local v79 = #v78
            if v73 then
                v78[v79 + 1] = v73
            end
            return u12.createElement("ImageLabel", v77, v78)
        end
        local v81 = table.create(#v56)
        for v82, v83 in v56 do
            v81[v82] = v80(v83, v82 - 1, v56)
        end
        local v84 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.3, 1)
        }
        local v85 = { u12.createElement("UIListLayout", {
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["Padding"] = UDim.new(0, 10)
            }), u12.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0, 10)
            }) }
        local v86 = #v85
        for v87, v88 in v81 do
            v85[v86 + v87] = v88
        end
        v70[v71 + 1] = u12.createElement(u6, v84, v85)
        v67.Header = u12.createElement("Frame", v69, v70)
        v67.BackgroundMapImage = u12.createElement("ImageLabel", {
            ["ZIndex"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = v44,
            ["ScaleType"] = Enum.ScaleType.Crop
        }, { u12.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = v38,
                [u12.Ref] = u47
            }, { u12.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                }) }) })
        local v89 = {
            ["Size"] = UDim2.fromScale(1, 0.08),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0, 0.98)
        }
        local v90 = { u12.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 10)
            }) }
        local _ = #v90
        local v91 = {
            ["Size"] = UDim2.fromScale(0.85, 1),
            ["Font"] = Enum.Font.Gotham,
            ["TextColor3"] = u4.WHITE
        }
        local v92
        if v45 then
            local v93 = table.create(#v45)
            for v94, v95 in v45 do
                local _ = v94 - 1
                v93[v94] = tostring(v95)
            end
            local v96 = u28(v93)
            v92 = "By " .. tostring(v96)
        else
            v92 = ""
        end
        v91.Text = v92
        v91.TextScaled = true
        v91.TextXAlignment = "Left"
        v91.TextTransparency = 0.2
        v91.BackgroundTransparency = 1
        v90.MapCredits = u12.createElement("TextLabel", v91)
        v67[v68 + 1] = u12.createElement(u6, v89, v90)
        local v97
        if u42 == nil then
            v97 = u42
        else
            v97 = u42.description
        end
        local v98 = v97 ~= nil
        if v98 then
            local v99 = {
                ["ClipsDescendants"] = true,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v100 = {}
            local v101 = #v100
            local v102 = {
                [u12.Ref] = u50,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["BackgroundColor3"] = u4.BLACK,
                ["BorderSizePixel"] = 0,
                ["Position"] = UDim2.fromScale(0, 1)
            }
            local v103 = { u12.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 1) })
                }), u12.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.1, 0),
                    ["PaddingRight"] = UDim.new(0.1, 0),
                    ["PaddingBottom"] = UDim.new(0.3, 0)
                }) }
            local v104 = #v103
            local v105 = {
                ["TextStrokeTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Font"] = Enum.Font.Gotham,
                ["TextColor3"] = u4.WHITE
            }
            if u42 ~= nil then
                u42 = u42.description
            end
            v105.Text = u42
            v105.BackgroundTransparency = 1
            v105.TextWrapped = true
            v105.TextScaled = true
            v103[v104 + 1] = u12.createElement("TextLabel", v105)
            v100[v101 + 1] = u12.createElement("Frame", v102, v103)
            v98 = u12.createFragment({
                ["MapDescriptionContainer"] = u12.createElement(u6, v99, v100)
            })
        end
        if v98 then
            v67[v68 + 2] = v98
        end
        local v106 = #v67
        local function v153(p107, p108, p109) --[[ Line: 428 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u5
                [3] = u15
                [4] = u12
                [5] = u4
                [6] = u48
                [7] = u20
            --]]
            local v110 = 0
            local v111 = {}
            for v112, v113 in u29.voteState do
                if v112 - 1 < u29.votingOptionIndex == true then
                    v110 = v110 + 1
                    v111[v110] = v113
                end
            end
            local v114 = table.create(#v111)
            for v115, v116 in v111 do
                local _ = v115 - 1
                v114[v115] = #v116.voterUserIds
            end
            local v117
            if #v114 > 0 then
                if #v114 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
                end
                v117 = v114[1]
                for v118 = 2, #v114 do
                    local v119 = v114[v118]
                    local _ = v118 - 1
                    v117 = v117 + v119
                end
            else
                v117 = 0
            end
            local v120 = 0
            local v121 = false
            local v122 = 0
            while true do
                if v121 then
                    v120 = v120 + 1
                else
                    v121 = true
                end
                if v120 >= #u29.voteState then
                    v120 = v122
                    break
                end
                local v123 = u29.voteState
                local v124 = table.create(#v123)
                for v125, v126 in v123 do
                    local _ = v125 - 1
                    v124[v125] = #v126.voterUserIds
                end
                if #v124 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
                end
                local v127 = v124[1]
                for v128 = 2, #v124 do
                    local v129 = v124[v128]
                    if v120 >= v128 - 1 then
                        v127 = v127 + v129
                    end
                end
                if u29.rouletteSelectedVoterIndex - v127 < 0 then
                    break
                end
            end
            local v130 = u29.rouletteSelectedVoterIndex - v117
            local v131 = #p109 > 11
            local v132 = #p109 - 11
            local v133
            if v131 then
                v133 = p108 == 10
            else
                v133 = v131
            end
            if v131 and p108 >= 11 then
                return nil
            end
            local v134
            if u5.isHoarceKat() then
                v134 = false
            else
                v134 = p107 == u15.LocalPlayer.UserId
            end
            local v135 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.10964912280701754, 1)
            }
            local v136 = { u12.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }
            local v137 = #v136
            local v138 = {
                ["BackgroundTransparency"] = 0.1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u4.WHITE
            }
            local v139
            if v133 then
                v139 = nil
            else
                v139 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(p107) .. "&w=48&h=48"
            end
            v138.Image = v139
            local v140 = { u12.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) }
            local v141 = #v140
            local v142 = not u29.rouletteMode
            if v142 then
                local v143 = u12.createElement
                local v144 = "UIStroke"
                local v145 = {
                    [u12.Ref] = u48,
                    ["Thickness"] = 2
                }
                local v146
                if v134 then
                    v146 = u20.mcGreen
                else
                    v146 = u4.WHITE
                end
                v145.Color = v146
                v145.Transparency = v134 and 0 or 0.3
                v142 = v143(v144, v145)
            end
            if v142 then
                v140[v141 + 1] = v142
            end
            local v147 = #v140
            local v148 = u29.Selected ~= nil and u29.rouletteMode
            if v148 then
                if (v130 == p108 or v130 >= 11 and (v130 < v132 + 11 and p108 == 10)) and v120 == u29.votingOptionIndex then
                    v148 = u12.createElement("UIStroke", {
                        [u12.Ref] = u48,
                        ["Thickness"] = 3,
                        ["Color"] = u4.BLACK,
                        ["Transparency"] = 0
                    })
                else
                    v148 = false
                end
            end
            if v148 then
                v140[v147 + 1] = v148
            end
            local v149 = #v140
            if v133 then
                local v150 = u12.createElement
                local v151 = {
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Font"] = "SourceSansBold",
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["TextColor3"] = u20.Gray
                }
                local v152 = #p109 - 11 + 1
                v151.Text = "+" .. tostring(v152)
                v133 = v150("TextLabel", v151)
            end
            if v133 then
                v140[v149 + 1] = v133
            end
            v136[v137 + 1] = u12.createElement("ImageLabel", v138, v140)
            return u12.createElement("Frame", v135, v136)
        end
        local v154 = 0
        local v155 = {}
        for v156, v157 in v46 do
            local v158 = v153(v157, v156 - 1, v46)
            if v158 ~= nil then
                v154 = v154 + 1
                v155[v154] = v158
            end
        end
        local v159 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.1),
            ["Position"] = UDim2.fromScale(0.9835886214442013, 0.99),
            ["AnchorPoint"] = Vector2.new(1, 0.5)
        }
        local v160 = { u12.createElement("UIListLayout", {
                ["SortOrder"] = "LayoutOrder",
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.03)
            }) }
        local v161 = #v160
        for v162, v163 in v155 do
            v160[v161 + v162] = v163
        end
        v67[v106 + 1] = u12.createElement("Frame", v159, v160)
        return u12.createFragment({
            ["PreGameVotingCard_" .. u41] = u12.createElement(u7, v66, v67)
        })
    end)
}