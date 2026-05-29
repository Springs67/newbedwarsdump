local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank")
local u12 = v11.ArmorTrimEffectRank
local u13 = v11.ArmorTrimEffectRankMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "progress", "armor-trim-progress-util").ArmorTrimProgressUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ArmorTrimProgressBar"] = v9.new(u8)(function(p17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u7
            [3] = u12
            [4] = u8
            [5] = u4
            [6] = u16
            [7] = u5
            [8] = u10
            [9] = u15
            [10] = u6
            [11] = u3
            [12] = u13
        --]]
        local _ = p18.useState
        local _ = p18.useEffect
        local v19 = u14.getTier(p17.xp)
        local v20 = #u7.values(u12) - 1
        local v21 = math.min(v19, v20)
        local v22 = u14.getTierProgress(p17.xp)
        local v23 = #u7.values(u12) - 1
        local v24 = math.min(v22, v23)
        local v25 = v24 - v21
        local v26 = u7.values(u12)
        table.sort(v26, function(p27, p28) --[[ Line: 26 ]]
            return p27 < p28
        end)
        local v29 = #v26 + 1
        local v30 = u14.getXpAtTier(v21 + 1)
        local v31 = u14.getXpAtTier
        local v32 = u14.getMaxTier
        local v33 = math.min(v30, v31(v32()))
        local v34 = false
        local v35 = 0
        local v36 = {}
        while true do
            if v34 then
                v35 = v35 + 1
            else
                v34 = true
            end
            if v35 >= v29 then
                local v37 = {}
                for v38, v39 in p17 do
                    v37[v38] = v39
                end
                v37.xp = nil
                v37.unlocked = nil
                v37.ArmorTrimType = nil
                v37.SelectedKit = nil
                local v40 = {}
                for v41, v42 in v37 do
                    v40[v41] = v42
                end
                v40.BackgroundTransparency = 1
                v40.BorderSizePixel = 0
                local v43 = {}
                local v44 = #v43
                local v45 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v46 = {}
                local v47 = #v46
                local v48 = not p17.unlocked
                if v48 then
                    v48 = u8.createElement("Frame", {
                        ["ZIndex"] = 100,
                        ["Transparency"] = 0.4,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["BackgroundColor3"] = u4.BLACK
                    }, { u8.createElement("UIGradient", {
                            ["Transparency"] = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.1, 0),
                                NumberSequenceKeypoint.new(0.5, 0),
                                NumberSequenceKeypoint.new(0.9, 0),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        }), u8.createElement("TextLabel", {
                            ["Text"] = "Equip a trim to view",
                            ["Transparency"] = 0.1,
                            ["BackgroundTransparency"] = 1,
                            ["TextScaled"] = true,
                            ["ZIndex"] = 100,
                            ["Size"] = UDim2.fromScale(1, 0.4),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["TextColor3"] = u4.WHITE,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["TextXAlignment"] = Enum.TextXAlignment.Center,
                            ["TextYAlignment"] = Enum.TextYAlignment.Center
                        }) })
                end
                if v48 then
                    v46[v47 + 1] = v48
                end
                local v49 = #v46
                local v50 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v51 = { u8.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    }) }
                local v52 = #v51
                for v53, v54 in v36 do
                    v51[v52 + v53] = v54
                end
                v46[v49 + 1] = u8.createElement(u5, v50, v51)
                v43[v44 + 1] = u8.createElement(u5, v45, v46)
                return u8.createFragment({
                    ["ArmorTrimProgress"] = u8.createElement("Frame", v40, v43)
                })
            end
            local v55 = v35 == v29 - 1
            local v56 = {
                ["Size"] = UDim2.fromScale(1 / v29, 1),
                ["LayoutOrder"] = v35
            }
            local v57 = {}
            local v58 = #v57
            local v59
            if v35 == u14.NEXT_ARMOR_TRIM_TIER_UNLOCK then
                v59 = u8.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.1, 1),
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["BackgroundColor3"] = u4.brighten(u16.backgroundSecondary, 0.3)
                }, { u8.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Transparency"] = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.15, 1),
                            NumberSequenceKeypoint.new(0.45, 0),
                            NumberSequenceKeypoint.new(0.5, 0),
                            NumberSequenceKeypoint.new(0.55, 0),
                            NumberSequenceKeypoint.new(0.85, 1),
                            NumberSequenceKeypoint.new(1, 1)
                        })
                    }) })
            else
                v59 = false
            end
            if v59 then
                v57[v58 + 1] = v59
            end
            local v60 = #v57
            local v61
            if v35 == v21 + 1 then
                local v62 = u8.createElement
                local v63 = "TextLabel"
                local v64 = {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Position"] = UDim2.fromScale(v35 == #v26 and 0 or 1, 0.33),
                    ["Size"] = UDim2.fromScale(1, 0.1),
                    ["AnchorPoint"] = Vector2.new(0.5, 1)
                }
                local v65 = p17.xp
                local v66
                if v65 > 1000 then
                    local v67 = math.round(v65) / 1000
                    v66 = tostring(v67) .. "k"
                else
                    local v68 = math.round(v65)
                    v66 = tostring(v68)
                end
                local v69 = "/"
                local v70
                if v33 > 1000 then
                    local v71 = math.round(v33) / 1000
                    v70 = tostring(v71) .. "k"
                else
                    local v72 = math.round(v33)
                    v70 = tostring(v72)
                end
                v64.Text = v66 .. v69 .. v70 .. " XP"
                v64.TextColor3 = u4.WHITE
                v64.Font = Enum.Font.SourceSansBold
                v64.TextXAlignment = Enum.TextXAlignment.Center
                v64.TextYAlignment = Enum.TextYAlignment.Bottom
                v61 = v62(v63, v64, { u8.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 26,
                        ["MinTextSize"] = 8
                    }) })
            else
                v61 = false
            end
            if v61 then
                v57[v60 + 1] = v61
            end
            local v73 = #v57
            local v74 = {
                ["Size"] = UDim2.new(1, 0, 0, 12),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }
            local v75 = {}
            local v76 = #v75
            local v77
            if v35 == 0 or v55 then
                v77 = u8.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = u16.Gray
                }, { u8.createElement("UIGradient", {
                        ["Rotation"] = v55 and 180 or 0,
                        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                    }) })
            else
                v77 = v55
            end
            if v77 then
                v75[v76 + 1] = v77
            end
            local v78 = #v75 + 1
            local v79 = u8.createElement
            local v80 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u16.Gray
            }
            local v81 = {}
            local v82 = u8.createElement
            local v83 = {
                ["BorderSizePixel"] = 0
            }
            local v84 = UDim2.fromScale
            local v85 = (v21 + 1 > v35 or v35 > v24 + 1) and (v35 <= v24 + 1 and 1 or (v35 == #v26 and v35 <= v24 + 1 and 1 or 0)) or v25
            v83.Size = v84(math.min(v85, 1), 1)
            v83.BackgroundColor3 = u16.backgroundSuccess
            __set_list(v81, 1, {v82("Frame", v83)})
            v75[v78] = v79("Frame", v80, v81)
            v57[v73 + 1] = u8.createElement(u5, v74, v75)
            local v86 = not v55
            if v86 then
                local v87 = u8.createElement
                local v88 = "Frame"
                local v89 = {
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.new(0, 20, 0, 20),
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v90
                if v21 <= v35 and v35 <= v24 then
                    v90 = u16.backgroundSuccess
                elseif v35 <= v24 then
                    v90 = u16.backgroundSuccess
                elseif v35 == #v26 - 1 and v35 <= v24 then
                    v90 = u16.backgroundSuccess
                elseif v35 == 0 then
                    v90 = u16.backgroundSuccess
                else
                    v90 = u16.Gray
                end
                v89.BackgroundColor3 = v90
                v86 = v87(v88, v89, { u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }) })
            end
            if v86 then
                v57[v73 + 2] = v86
            end
            local v91 = #v57
            local v92 = v35 < v29 - 1
            if v92 then
                local v93 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v94 = {}
                local v95 = #v94
                local v96 = {
                    ["Size"] = UDim2.fromScale(0.4, 0.4),
                    ["Position"] = UDim2.fromScale(1, 0.825),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v97 = {}
                local v98 = #v97
                local v99 = p17.ArmorTrimType ~= nil
                if v99 then
                    local v100 = u10[p17.ArmorTrimType].effects
                    if v100 ~= nil then
                        v100 = v100.tierOverrides
                    end
                    local v101 = v100 == nil and { -1 } or v100
                    v99 = table.find(v101, v35) ~= nil
                    if v99 then
                        v99 = u8.createElement(u5, {
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                        }, { u8.createElement("UIAspectRatioConstraint", {
                                ["AspectRatio"] = 1
                            }), u8.createElement("ImageLabel", {
                                ["ZIndex"] = 2,
                                ["BackgroundTransparency"] = 1,
                                ["Size"] = UDim2.fromScale(0.3, 0.3),
                                ["Position"] = UDim2.fromScale(1.1, 0.9),
                                ["AnchorPoint"] = Vector2.new(1, 1),
                                ["Image"] = u15.STAR_SOLID
                            }), u8.createElement(u6, {}, { u8.createElement(u3, {
                                    ["Text"] = "Special Effect",
                                    ["TextSize"] = 26,
                                    ["Font"] = Enum.Font.SourceSansBold,
                                    ["Limits"] = Vector2.new(300, 60)
                                }) }) })
                    end
                end
                local v102 = {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Text"] = u13[v26[v35 + 1]].text,
                    ["TextColor3"] = u4.brighten(u13[v26[v35 + 1]].color, 0.65),
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Bottom
                }
                local v103 = {}
                local v104 = #v103
                if v99 then
                    v103[v104 + 1] = v99
                end
                v97[v98 + 1] = u8.createElement("TextLabel", v102, v103)
                v94[v95 + 1] = u8.createElement(u5, v96, v97)
                local v105 = v35 == u14.NEXT_ARMOR_TRIM_TIER_UNLOCK and not u14.isNextArmorTrimUnlockable(p17.xp)
                if v105 then
                    v105 = u8.createElement(u5, {
                        ["Size"] = UDim2.fromScale(0.4, 0.4),
                        ["Position"] = UDim2.fromScale(1, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                    }, { u8.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }), u8.createElement("ImageLabel", {
                            ["ZIndex"] = 2,
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(0.6, 0.6),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Image"] = u15.LOCK_SOLID
                        }), u8.createElement(u6, {}, { u8.createElement(u3, {
                                ["Text"] = "Next Trim Unlock",
                                ["TextSize"] = 26,
                                ["Font"] = Enum.Font.SourceSansBold,
                                ["Limits"] = Vector2.new(300, 60)
                            }) }) })
                end
                if v105 then
                    v94[v95 + 2] = v105
                end
                v92 = u8.createElement(u5, v93, v94)
            end
            if v92 then
                v57[v91 + 1] = v92
            end
            local v106 = u8.createElement(u5, v56, v57)
            table.insert(v36, v106)
        end
    end)
}