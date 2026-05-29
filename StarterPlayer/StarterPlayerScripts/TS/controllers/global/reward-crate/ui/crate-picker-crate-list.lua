local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.AutoSizedText
local u5 = v2.ColorUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-type").QueueGroupType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta").CrateMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["CratePickerCrateList"] = v11.new(u10)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
            [3] = u10
            [4] = u9
            [5] = u13
            [6] = u5
            [7] = u6
            [8] = u7
            [9] = u4
            [10] = u12
            [11] = u3
        --]]
        local _ = p16.useState
        local v17 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.9),
                ["ScrollingDirection"] = Enum.ScrollingDirection.Y
            }
        }
        local v18 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 14)
            }) }
        local v19 = #v18
        local v20 = u9.entries(u15.crates)
        local function v42(p21) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u15
                [3] = u10
                [4] = u8
                [5] = u14
                [6] = u5
                [7] = u6
                [8] = u7
                [9] = u4
            --]]
            local u22 = p21[1]
            local v23 = p21[2]
            local v24 = u13[u22]
            local v25 = u22 == u15.selectedCrate
            local v27 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(154, 89, 89),
                ["BorderSizePixel"] = 0,
                ["ClipsDescendants"] = true,
                [u10.Event.Activated] = function() --[[ Line: 48 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u8
                        [3] = u14
                        [4] = u15
                    --]]
                    local v26 = u22
                    u8:playSound(u14.UI_CLICK_2)
                    u15.setSelectedCrate(v26)
                end,
                [u10.Event.MouseEnter] = function() --[[ Line: 51 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u14
                    --]]
                    u8:playSound(u14.UI_HOVER)
                end
            }
            local v28 = { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 10)
                }) }
            local v29 = #v28
            if v25 then
                v25 = u10.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Color"] = u5.WHITE
                })
            end
            if v25 then
                v28[v29 + 1] = v25
            end
            local _ = #v28
            v28.GradientOverlay = u10.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u5.WHITE
            }, { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 10)
                }), u10.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Color"] = ColorSequence.new(Color3.fromRGB(249, 194, 43), Color3.fromRGB(249, 194, 43)),
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(0.45, 1), NumberSequenceKeypoint.new(1, 1) })
                }) })
            v28.DarkOverlay = u10.createElement("Frame", {
                ["BackgroundTransparency"] = 0.8,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 9,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u5.BLACK
            }, { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 10)
                }) })
            v28.BackgroundImage = u10.createElement("ImageLabel", {
                ["ImageTransparency"] = 0.8,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 8,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v24.image,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 10)
                }) })
            local v30 = u10.createElement
            local v31 = u6
            local v32 = {
                ["ZIndex"] = 11,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v33 = { (u10.createElement(u7, {
                    ["Padding"] = UDim.new(0, 10)
                })) }
            local v34 = u10.createElement
            local v35 = u6
            local v36 = {
                ["Size"] = UDim2.new(1, 0, 0, 18)
            }
            local v37 = {}
            local v38 = u10.createElement
            local v39 = u4
            local v40 = {
                ["TextSize"] = 16,
                ["ZIndex"] = 11,
                ["Position"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(1, 0)
            }
            local v41 = #v23
            v40.Text = "x" .. tostring(v41)
            v40.Font = Enum.Font.SourceSansBold
            __set_list(v37, 1, {v38(v39, v40)})
            v33.CrateAmount = v34(v35, v36, v37)
            v33.CategoryIcon = u10.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 11,
                ["Image"] = v24.image,
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }, { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u10.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
            v33.CategoryText = u10.createElement(u6, {
                ["ZIndex"] = 11,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.98)
            }, { u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0, -2)
                }), u10.createElement(u4, {
                    ["TextSize"] = 24,
                    ["ZIndex"] = 11,
                    ["Text"] = string.upper(v24.displayName),
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Limits"] = Vector2.new(140, 30)
                }) })
            v28.Content = v30(v31, v32, v33)
            return u10.createFragment({
                ["LobbyPlayMenuSquareButton"] = u10.createElement("ImageButton", v27, v28)
            })
        end
        local v43 = table.create(#v20)
        for v44, v45 in v20 do
            v43[v44] = v42(v45, v44 - 1, v20)
        end
        local v46 = {
            ["AutomaticSize"] = "X",
            ["Size"] = UDim2.fromScale(0, 1),
            ["LayoutOrder"] = #u9.values(u12)
        }
        local v47 = { u10.createElement(u7, {
                ["Padding"] = {
                    ["Horizontal"] = 2,
                    ["Vertical"] = 2
                }
            }), u10.createElement("UIGridLayout", {
                ["FillDirectionMaxCells"] = 5,
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Top",
                ["HorizontalAlignment"] = "Center",
                ["CellSize"] = UDim2.fromOffset(140, 140),
                ["CellPadding"] = UDim2.fromOffset(14, 14)
            }) }
        local v48 = #v47
        for v49, v50 in v43 do
            v47[v48 + v49] = v50
        end
        v18[v19 + 1] = u10.createElement(u6, v46, v47)
        return u10.createFragment({
            ["CrateList"] = u10.createElement(u3, v17, v18)
        })
    end)
}