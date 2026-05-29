local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CircularSpinner
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.GetTarmacAsset
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = v1.import(script, script.Parent, "map-browser", "tag-pill-list").TagPillList
local u12 = v1.import(script, script.Parent, "server-browser", "server-health-icon").ServerHealthIcon
return {
    ["VerticalListMapListing"] = v9.new(u8)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u10
            [4] = u4
            [5] = u5
            [6] = u12
            [7] = u11
            [8] = u6
            [9] = u3
        --]]
        local v15, u16 = p14.useState(false)
        local v17 = Color3.fromRGB(72, 168, 120)
        if u13.Disabled then
            v17 = Color3.fromRGB(66, 66, 66)
        end
        if v15 then
            v17 = Color3.fromRGB(255, 196, 69)
        end
        local v18 = u13.ThumbnailAssetId
        local v19
        if v18 == "" or not v18 then
            v19 = u7("NoImage").Image
        else
            v19 = "rbxassetid://" .. string.gsub(u13.ThumbnailAssetId, "rbxassetid://", "")
        end
        local v20 = {
            ["Size"] = UDim2.new(1, 0, 0, 60)
        }
        local v21 = u13.FrameProps
        if v21 then
            for v22, v23 in v21 do
                v20[v22] = v23
            end
        end
        local v24 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.02, 0)
            }) }
        local _ = #v24
        local v25 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0.9, 0, 1, 0),
            ["BackgroundColor3"] = u10.backgroundTertiaryCard
        }
        local v26 = {
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }),
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder"
            }),
            ["Thumbnail"] = u8.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Crop",
                ["BackgroundTransparency"] = 0.75,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v19,
                ["BackgroundColor3"] = u4.BLACK
            }, { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u8.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        }
        local _ = #v26
        local v27 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v28 = {
            u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.11, 0),
                ["PaddingBottom"] = UDim.new(0.11, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0, 0)
            }),
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0)
            }),
            ["Title"] = u8.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Left",
                ["AutoLocalize"] = false,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.55),
                ["Text"] = u13.Title,
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextTruncate"] = Enum.TextTruncate.AtEnd
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MinTextSize"] = u5.isSmallScreen() and 14 or 18
                }) })
        }
        local v29 = #v28
        local v30 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.4)
        }
        local v31 = {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 4)
            }),
            ["Creator"] = u8.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["TextScaled"] = true,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Left",
                ["AutoLocalize"] = false,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0, 1),
                ["Text"] = u13.Creator,
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MinTextSize"] = 8,
                    ["MaxTextSize"] = 14
                }) })
        }
        local v32 = #v31
        local v33
        if u13.ServerHealthState == nil then
            v33 = false
        else
            v33 = u8.createElement(u12, {
                ["layoutOrder"] = 2,
                ["serverHealthState"] = u13.ServerHealthState
            })
        end
        if v33 then
            v31[v32 + 1] = v33
        end
        local v34 = #v31
        local v35 = u13.ExtraTextInfo
        local v36
        if v35 == nil then
            v36 = v35
        else
            local function v41(p37, p38) --[[ Line: 150 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u4
                --]]
                local v39 = u8.createFragment
                local v40 = {
                    ["TextInfo"] = u8.createElement("TextLabel", {
                        ["AutomaticSize"] = "X",
                        ["TextScaled"] = true,
                        ["TextTransparency"] = 0.3,
                        ["BackgroundTransparency"] = 1,
                        ["TextXAlignment"] = "Left",
                        ["AutoLocalize"] = false,
                        ["Size"] = UDim2.fromScale(0, 1),
                        ["Text"] = p37,
                        ["TextColor3"] = u4.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["LayoutOrder"] = 3 + p38
                    }, { u8.createElement("UITextSizeConstraint", {
                            ["MinTextSize"] = 8,
                            ["MaxTextSize"] = 12
                        }) })
                }
                return v39(v40)
            end
            v36 = table.create(#v35)
            for v42, v43 in v35 do
                v36[v42] = v41(v43, v42 - 1, v35)
            end
        end
        if v36 then
            for v44, v45 in v36 do
                v31[v34 + v44] = v45
            end
        end
        local v46 = #v31
        local v47 = #u13.Tags ~= 0
        if v47 then
            v47 = u8.createElement(u11, {
                ["Tags"] = u13.Tags,
                ["FrameProps"] = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
            })
        end
        if v47 then
            v31[v46 + 1] = v47
        end
        v28[v29 + 1] = u8.createElement(u6, v30, v31)
        v26.Info = u8.createElement(u6, v27, v28)
        local v48 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.26, 1)
        }
        local v49 = { u8.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.02, 0),
                ["PaddingRight"] = UDim.new(0.02, 0)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 4)
            }) }
        local v50 = #v49
        local v51
        if u13.Stat.Icon == nil then
            v51 = false
        else
            v51 = u8.createFragment({
                ["StatIcon"] = u8.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.5, 0.4),
                    ["Image"] = u13.Stat.Icon,
                    ["ImageColor3"] = u10.textPrimary
                }, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        end
        if v51 then
            v49[v50 + 1] = v51
        end
        local _ = #v49
        v49.StatValue = u8.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 0.6),
            ["Text"] = u13.Stat.Value,
            ["TextColor3"] = u4.WHITE,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
        })
        v26.StatWrapper = u8.createElement(u6, v48, v49)
        v24.MapCard = u8.createElement("Frame", v25, v26)
        local v52
        if v15 then
            v52 = u8.createElement(u6, {
                ["LayoutOrder"] = 3,
                ["ZIndex"] = 1,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.5, 0.5)
            }, { u8.createElement(u3, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) })
        else
            local v53 = {
                ["SizeConstraint"] = "RelativeXX",
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.5, 0.5)
            }
            local v54 = u13.ActionButton
            if v54 ~= nil then
                v54 = v54.Icon
            end
            v53.Image = v54
            local v55
            if u13 == nil then
                v55 = u13
            else
                v55 = u13.Disabled
            end
            local v56
            if v55 then
                v56 = Color3.fromRGB(130, 130, 130)
            else
                v56 = Color3.fromRGB(99, 255, 143)
            end
            v53.ImageColor3 = v56
            v53.ScaleType = "Fit"
            v53.BackgroundTransparency = 1
            v52 = u8.createElement("ImageLabel", v53)
        end
        local v59 = {
            ["Size"] = UDim2.new(0.08, 0, 1, 0),
            ["BackgroundColor3"] = v17,
            ["LayoutOrder"] = 2,
            ["AutoButtonColor"] = not u13.Disabled,
            [u8.Event.Activated] = function() --[[ Line: 288 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u16
                --]]
                local v57 = u13
                if v57 ~= nil then
                    v57 = v57.Disabled
                end
                if v57 then
                    return nil
                end
                u16(true)
                local v58 = u13.ActionButton
                if v58 ~= nil then
                    v58.OnClick():andThen(function() --[[ Line: 300 ]]
                        --[[
                        Upvalues:
                            [1] = u16
                        --]]
                        u16(false)
                    end)
                end
            end
        }
        local v60 = {
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }),
            [#v60 + 1] = v52
        }
        v24.ActionButton = u8.createElement("ImageButton", v59, v60)
        return u8.createFragment({
            ["MapListing"] = u8.createElement(u6, v20, v24)
        })
    end)
}