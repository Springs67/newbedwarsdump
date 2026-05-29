local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-knight-balance")
local u10 = v9.getVoidKnightDefinitionForTier
local u11 = v9.VoidKnightBalance
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["VoidKnightSidebar"] = v8.new(u7)(function(u13, p14) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u11
            [4] = u6
            [5] = u3
            [6] = u4
            [7] = u12
            [8] = u5
        --]]
        local _ = p14.useState
        local _ = p14.useEffect
        local v15 = u7.createRef()
        local function v25(p16) --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u10
                [3] = u11
                [4] = u7
                [5] = u6
                [6] = u3
            --]]
            local v17 = p16 <= u13.tier
            local v18 = u10(p16)
            local v19 = ""
            if p16 ~= u11.ProgressTiers.BASE and p16 ~= u11.ProgressTiers.ENHANCED then
                v19 = p16 == u11.ProgressTiers.EMPOWERED and ": Unlocks Void Decay Passive" or (p16 == u11.ProgressTiers.CORRUPTED and ": Unlocks Void Shield Passive" or (p16 == u11.ProgressTiers.CHOSEN and ": Unlocks Void Ascension Ability" or v19))
            end
            local v20 = u7.createElement
            local v21 = "ImageLabel"
            local v22 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ScaleType"] = "Fit",
                ["LayoutOrder"] = 5 - p16,
                ["Image"] = v18.icon
            }
            local v23
            if p16 == u11.ProgressTiers.CHOSEN then
                v23 = UDim2.fromScale(1, 1)
            else
                v23 = UDim2.fromScale(0.9, 0.25)
            end
            v22.Size = v23
            local v24
            if v17 then
                v24 = Color3.fromRGB(255, 255, 255)
            else
                v24 = Color3.fromRGB(41, 41, 41)
            end
            v22.ImageColor3 = v24
            v22.ImageTransparency = v17 and 0 or 0.5
            return v20(v21, v22, { u7.createElement(u6, {}, { u7.createElement(u3, {
                        ["TextSize"] = 16,
                        ["Text"] = v18.name .. v19,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }) })
        end
        local function v48(p26) --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u11
                [3] = u10
                [4] = u7
            --]]
            local v27 = u13.tier == u11.ProgressTiers.CHOSEN
            local v28 = u10(p26).progressionRequirements
            if v28 ~= nil then
                v28 = v28.resourceCount
            end
            local v29 = v28 == nil and 1 or v28
            local v30 = u13.tier < p26
            local v31 = p26 < u13.tier and true or v27
            local v32 = u7.createFragment
            local v33 = {}
            local v34 = "OuterProgressBar_" .. tostring(p26)
            local v35 = u7.createElement
            local v36 = "Frame"
            local v37 = {
                ["Transparency"] = 0.2,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.3, 0.21875),
                ["Position"] = UDim2.fromScale(0.5, 0.52),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(33, 33, 33)
            }
            local v38 = { (u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                })) }
            local v39 = "InnerProgressBar_" .. tostring(p26)
            local v40 = u7.createElement
            local v41 = "Frame"
            local v42 = {
                ["Transparency"] = 0.1,
                ["BorderSizePixel"] = 0
            }
            local v43 = UDim2.fromScale
            local v44 = 0.5
            local v45
            if v30 then
                v45 = 0
            elseif v31 then
                v45 = 1
            else
                local v46 = u13.progress / v29
                v45 = math.clamp(v46, 0, 1)
            end
            v42.Size = v43(v44, v45 * 0.97)
            v42.Position = UDim2.fromScale(0.25, 0.985)
            v42.AnchorPoint = Vector2.new(0, 1)
            local v47
            if v27 then
                v47 = Color3.fromRGB(237, 171, 74)
            else
                v47 = Color3.fromRGB(220, 163, 255)
            end
            v42.BackgroundColor3 = v47
            v38[v39] = v40(v41, v42, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) })
            v33[v34] = v35(v36, v37, v38)
            return v32(v33)
        end
        local function v71(p49) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u11
                [3] = u10
                [4] = u7
            --]]
            local v50 = u13.tier == u11.ProgressTiers.CHOSEN
            local v51 = u10(p49).progressionRequirements
            if v51 ~= nil then
                v51 = v51.killsAssists
            end
            local v52 = v51 == nil and 1 or v51
            local v53 = u13.tier < p49
            local v54 = p49 < u13.tier and true or v50
            local v55 = u7.createFragment
            local v56 = {}
            local v57 = "OuterProgressBar_" .. tostring(p49)
            local v58 = u7.createElement
            local v59 = "Frame"
            local v60 = {
                ["Transparency"] = 0.2,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.3, 0.21875),
                ["Position"] = UDim2.fromScale(0.5, 0.52),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(33, 33, 33)
            }
            local v61 = { (u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                })) }
            local v62 = "InnerProgressBar_" .. tostring(p49)
            local v63 = u7.createElement
            local v64 = "Frame"
            local v65 = {
                ["Transparency"] = 0.1,
                ["BorderSizePixel"] = 0
            }
            local v66 = UDim2.fromScale
            local v67 = 0.5
            local v68
            if v53 then
                v68 = 0
            elseif v54 then
                v68 = 1
            else
                local v69 = u13.kills / v52
                v68 = math.clamp(v69, 0, 1)
            end
            v65.Size = v66(v67, v68 * 0.97)
            v65.Position = UDim2.fromScale(0.25, 0.985)
            v65.AnchorPoint = Vector2.new(0, 1)
            local v70
            if v50 then
                v70 = Color3.fromRGB(237, 171, 74)
            else
                v70 = Color3.fromRGB(220, 100, 100)
            end
            v65.BackgroundColor3 = v70
            v61[v62] = v63(v64, v65, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) })
            v56[v57] = v58(v59, v60, v61)
            return v55(v56)
        end
        local v72 = u7.createFragment
        local v73 = {
            ["VoidKnightSidebar"] = u7.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u7.createElement("Frame", {
                    ["Transparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.2, 0.34),
                    ["Position"] = UDim2.fromScale(0.025, u4.isMobileControls() and 0.25 or 0.3)
                }, {
                    ["OuterContainer"] = u7.createElement("ImageLabel", {
                        ["ImageTransparency"] = 0.3,
                        ["BorderSizePixel"] = 3,
                        ["BackgroundTransparency"] = 1,
                        ["ScaleType"] = "Crop",
                        ["Image"] = u12.VOID_BG,
                        ["ImageColor3"] = Color3.fromRGB(90, 27, 160),
                        ["Size"] = UDim2.fromScale(0.5, 1)
                    }, {
                        u7.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0, 8)
                        }),
                        u7.createElement("UIStroke", {
                            ["Thickness"] = 2,
                            ["Transparency"] = 0.1,
                            ["Color"] = Color3.fromRGB(63, 29, 101)
                        }),
                        u7.createElement("UIListLayout", {
                            ["FillDirection"] = Enum.FillDirection.Vertical,
                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                            ["Padding"] = UDim.new(0.02),
                            ["SortOrder"] = Enum.SortOrder.LayoutOrder
                        }),
                        u7.createElement(u5, {
                            ["Size"] = UDim2.fromScale(1, 0.15)
                        }, { v25(u11.ProgressTiers.CHOSEN) }),
                        u7.createElement(u5, {
                            ["Size"] = UDim2.fromScale(1, 0.8)
                        }, {
                            u7.createElement("UIListLayout", {
                                ["FillDirection"] = Enum.FillDirection.Horizontal,
                                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                                ["Padding"] = UDim.new(0.02),
                                ["SortOrder"] = Enum.SortOrder.LayoutOrder
                            }),
                            ["ContainerLeft"] = u7.createElement("Frame", {
                                ["LayoutOrder"] = 1,
                                [u7.Ref] = v15,
                                ["Size"] = UDim2.fromScale(0.5, 0.95),
                                ["BackgroundTransparency"] = 1,
                                ["BorderSizePixel"] = 0,
                                ["ClipsDescendants"] = false
                            }, {
                                u7.createElement("UICorner", {
                                    ["CornerRadius"] = UDim.new(0, 8)
                                }),
                                u7.createElement("UIListLayout", {
                                    ["FillDirection"] = Enum.FillDirection.Vertical,
                                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                                    ["Padding"] = UDim.new(0.02),
                                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                                }),
                                v25(u11.ProgressTiers.CORRUPTED),
                                v25(u11.ProgressTiers.EMPOWERED),
                                v25(u11.ProgressTiers.ENHANCED),
                                v25(u11.ProgressTiers.BASE)
                            }),
                            ["ContainerMiddle"] = u7.createElement("Frame", {
                                ["LayoutOrder"] = 2,
                                ["BackgroundTransparency"] = 1,
                                ["BorderSizePixel"] = 0,
                                ["ClipsDescendants"] = false,
                                ["Size"] = UDim2.fromScale(0.25, 0.99)
                            }, {
                                u7.createElement("UIListLayout", {
                                    ["FillDirection"] = Enum.FillDirection.Vertical,
                                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                                    ["Padding"] = UDim.new(0.03),
                                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                                }),
                                v48(u11.ProgressTiers.CORRUPTED),
                                v48(u11.ProgressTiers.EMPOWERED),
                                v48(u11.ProgressTiers.ENHANCED),
                                v48(u11.ProgressTiers.BASE)
                            }),
                            ["ContainerRight"] = u7.createElement("Frame", {
                                ["LayoutOrder"] = 3,
                                ["BackgroundTransparency"] = 1,
                                ["BorderSizePixel"] = 0,
                                ["ClipsDescendants"] = false,
                                ["Size"] = UDim2.fromScale(0.25, 0.99)
                            }, {
                                u7.createElement("UIListLayout", {
                                    ["FillDirection"] = Enum.FillDirection.Vertical,
                                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                                    ["Padding"] = UDim.new(0.03),
                                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                                }),
                                v71(u11.ProgressTiers.CORRUPTED),
                                v71(u11.ProgressTiers.EMPOWERED),
                                v71(u11.ProgressTiers.ENHANCED),
                                v71(u11.ProgressTiers.BASE)
                            })
                        })
                    }),
                    u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 0.75
                    })
                }) })
        }
        return v72(v73)
    end)
}