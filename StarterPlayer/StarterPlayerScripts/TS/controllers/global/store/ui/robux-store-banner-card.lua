local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ConfettiGroup
local u4 = v2.Countdown
local u5 = v2.Empty
local u6 = v2.Padding
local u7 = v2.ShineEffect
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.MarketplaceService
local u12 = v10.Players
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "ripple").Ripple
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "base-purchase-button").BasePurchaseButton
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "gift-purchase-button").GiftPurchaseButton
local v17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "gradient")
local u18 = v17.Gradient
local u19 = v17.GradientAnimationType
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile
return {
    ["RobuxStoreBannerCard"] = v9.new(u8)(function(u21, p22) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u11
            [3] = u12
            [4] = u8
            [5] = u19
            [6] = u18
            [7] = u13
            [8] = u7
            [9] = u3
            [10] = u6
            [11] = u4
            [12] = u5
            [13] = u20
            [14] = u16
            [15] = u15
        --]]
        local _ = p22.useState
        local _ = p22.useEffect
        local v23 = u21.Contents
        if v23 ~= nil then
            local v24 = v23.Rewards
            v23 = v24 ~= nil and #v24 or v24
        end
        local v25 = v23 == nil and 0 or v23
        local v26 = (v25 > 6 and 0.75 or 1) * 0.2
        local v27 = (v25 > 6 and 0.75 or 1) * 0.1
        local v28 = (v25 > 6 and 0.75 or 1) * 0.22
        local v29 = v25 > 6 and 2.2884615384615383 or 2.975
        local v30 = (v25 > 6 and 1.33 or 1) * 0.41
        local function v31() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u14
                [3] = u11
                [4] = u12
            --]]
            if u21.EndTime == nil or os.time() <= u21.EndTime then
                if u21.Product.ProductType == u14.GamePass then
                    u11:PromptGamePassPurchase(u12.LocalPlayer, u21.Product.ProductId)
                elseif u21.Product.ProductType == u14.DevProduct then
                    u11:PromptProductPurchase(u12.LocalPlayer, u21.Product.ProductId)
                end
            else
                return nil
            end
        end
        local v33 = {
            ["Size"] = u21.Size or UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = u21.LayoutOrder,
            ["ClipsDescendants"] = true,
            [u8.Event.Activated] = function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                local v32 = u21.OnClick
                if v32 ~= nil then
                    v32()
                end
            end,
            ["Selectable"] = false
        }
        local v34 = {}
        local v35 = #v34
        local v36 = {}
        local v37 = u21.AspectRatio
        if v37 == nil then
            v37 = v29
        end
        v36.AspectRatio = v37
        v34[v35 + 1] = u8.createElement("UIAspectRatioConstraint", v36)
        v34[v35 + 2] = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        })
        local v38 = {
            ["Color"] = u21.BackgroundGradient or ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 44, 59)) })
        }
        local v39 = u21.Effects
        if v39 ~= nil then
            v39 = v39.DisableBGGradientAnim
        end
        local v40
        if v39 then
            v40 = nil
        else
            v40 = u19.ROTATE
        end
        v38.Animation = v40
        v38.Rotation = 90
        v34[v35 + 3] = u8.createElement(u18, v38)
        local v41 = u21[u8.Children]
        if v41 then
            for v42, v43 in v41 do
                if type(v42) == "number" then
                    v34[v35 + 3 + v42] = v43
                else
                    v34[v42] = v43
                end
            end
        end
        local v44 = #v34
        local v45 = u21.BackgroundImage
        if v45 then
            local v46 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u21.BackgroundImage.Image
            }
            local v47 = u21.BackgroundImage.Transparency
            v46.ImageTransparency = v47 == nil and 0.95 or v47
            v46.BackgroundTransparency = 1
            v46.ScaleType = Enum.ScaleType.Crop
            v45 = u8.createFragment({
                ["BackgroundImage"] = u8.createElement("ImageLabel", v46, { u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 3)
                    }) })
            })
        end
        if v45 then
            v34[v44 + 1] = v45
        end
        local v48 = #v34
        local v49 = u21.Effects
        if v49 ~= nil then
            v49 = v49.Ripple
        end
        if v49 then
            v49 = u8.createElement(u13)
        end
        if v49 then
            v34[v48 + 1] = v49
        end
        local v50 = #v34
        local v51 = u21.Effects
        if v51 ~= nil then
            v51 = v51.ShineEffect
        end
        if v51 then
            v51 = u8.createElement(u7)
        end
        if v51 then
            v34[v50 + 1] = v51
        end
        local v52 = #v34
        local v53 = u21.Effects
        if v53 ~= nil then
            v53 = v53.Confetti
        end
        if v53 then
            v53 = u8.createElement(u3, {
                ["Lifetime"] = 10,
                ["ConfettiSizeScale"] = 0.01,
                ["Direction"] = UDim2.new(0, 0, 0.6, 0)
            })
        end
        if v53 then
            v34[v52 + 1] = v53
        end
        local v54 = #v34
        local v55 = u21.Discount
        if v55 ~= nil then
            v55 = v55.OriginalPrice
        end
        local v56 = v55 ~= nil
        if v56 then
            local v57 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.25, 0.18),
                ["Position"] = UDim2.fromScale(0.95, 0),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            }
            local v58 = {
                u8.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 2.193548387096774
                }),
                u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 2)
                }),
                u8.createElement(u6, {
                    ["Padding"] = {
                        ["Horizontal"] = 8,
                        ["Vertical"] = 4
                    }
                }),
                ["UIGradientTest"] = u8.createElement(u18, {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 34, 34)), ColorSequenceKeypoint.new(1, Color3.fromRGB(191, 28, 28)) })
                })
            }
            local v59 = #v58
            local v60
            if u21.Discount.OriginalPrice == nil then
                v60 = false
            else
                local v61 = u8.createFragment
                local v62 = {}
                local v63 = u8.createElement
                local v64 = {
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Center",
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(0.95, 0.95),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v65 = (u21.Discount.OriginalPrice - u21.Product.Price) / u21.Discount.OriginalPrice * 100
                local v66 = math.round(v65)
                v64.Text = "-" .. tostring(v66) .. "%"
                v64.TextColor3 = Color3.fromRGB(255, 255, 255)
                v64.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                __set_list(v62, 1, {v63("TextLabel", v64, { u8.createElement("UIStroke", {
        ["Transparency"] = 0.45,
        ["Thickness"] = 1.5,
        ["Color"] = Color3.fromRGB(0, 0, 0)
    }) })})
                v60 = v61(v62)
            end
            if v60 then
                v58[v59 + 1] = v60
            end
            v56 = u8.createFragment({
                ["DiscountContainer"] = u8.createElement("Frame", v57, v58)
            })
        end
        if v56 then
            v34[v54 + 1] = v56
        end
        local _ = #v34
        local v67 = {
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v68 = { u8.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.055, 0),
                ["PaddingRight"] = UDim.new(0.055, 0),
                ["PaddingBottom"] = UDim.new(v25 > 6 and 0.06 or 0.08, 0),
                ["PaddingTop"] = UDim.new(v25 > 6 and 0.06 or 0.08, 0)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Bottom",
                ["SortOrder"] = "LayoutOrder",
                ["VerticalFlex"] = Enum.UIFlexAlignment.SpaceAround
            }) }
        local v69 = #v68
        local v70
        if u21.Title == nil then
            v70 = false
        else
            v70 = u8.createFragment({
                ["Title"] = u8.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Left",
                    ["TextScaled"] = true,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, v26),
                    ["Text"] = u21.Title,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }, {
                    ["UIGradientTest"] = u8.createElement(u18, {
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 231, 159)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 63)) })
                    })
                })
            })
        end
        if v70 then
            v68[v69 + 1] = v70
        end
        local v71 = #v68
        local v72
        if u21.EndTime == nil then
            v72 = false
        else
            v72 = u8.createElement(u4, {
                ["EndTime"] = u21.EndTime,
                ["PreText"] = "<font transparency=\"" .. tostring(0.2) .. "\">\226\140\155 Expires In: </font>",
                ["TextLabel"] = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0, v27),
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }
            })
        end
        if v72 then
            v68[v71 + 1] = v72
        end
        local v73 = #v68
        local v74 = {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, v30 + (u21.EndTime ~= nil and 0 or v27))
        }
        local v75 = {}
        local v76 = #v75
        local v77 = {}
        local v78 = u21.Contents
        if v78 ~= nil then
            v78 = v78.Description
        end
        v77.FillDirection = v78 and "Horizontal" or "Vertical"
        v77.SortOrder = "LayoutOrder"
        v77.Padding = UDim.new(0, 12)
        v75[v76 + 1] = u8.createElement("UIListLayout", v77)
        local v79 = u21.Contents
        if v79 ~= nil then
            v79 = v79.Description
        end
        if v79 then
            local v80 = {}
            local v81 = u21.Contents
            if v81 ~= nil then
                v81 = v81.Rewards
            end
            v80.Size = UDim2.new(v81 and 0.45 or 1, 0, 1, 0)
            v80.LayoutOrder = 2
            local v82 = u21.Contents
            if v82 ~= nil then
                local v83 = v82.Description
                if v83 == nil then
                    v82 = v83
                else
                    local function v90(p84, p85) --[[ Line: 314 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u21
                        --]]
                        local v86 = u8.createElement
                        local v87 = {
                            ["BackgroundTransparency"] = 1,
                            ["TextXAlignment"] = "Left",
                            ["RichText"] = true,
                            ["TextScaled"] = true,
                            ["LineHeight"] = 1.25
                        }
                        local v88 = UDim2.fromScale
                        local v89 = 1 / #u21.Contents.Description
                        v87.Size = v88(1, (math.max(v89, 0.2)))
                        v87.Text = p84
                        v87.TextColor3 = Color3.fromRGB(255, 255, 255)
                        v87.FontFace = Font.fromName("Roboto", Enum.FontWeight.Medium)
                        v87.LayoutOrder = p85
                        return v86("TextLabel", v87, { u8.createElement("UITextSizeConstraint", {
                                ["MaxTextSize"] = 24
                            }) })
                    end
                    v82 = table.create(#v83)
                    for v91, v92 in v83 do
                        v82[v91] = v90(v92, v91 - 1, v83)
                    end
                end
            end
            local v93 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 8)
                }) }
            local v94 = #v93
            for v95, v96 in v82 do
                v93[v94 + v95] = v96
            end
            v79 = u8.createElement(u5, v80, v93)
        end
        if v79 then
            v75[v76 + 2] = v79
        end
        local v97 = #v75
        local v98 = u21.Contents
        if v98 ~= nil then
            v98 = v98.Rewards
        end
        if v98 then
            local v99 = u21.Contents
            local v100
            if (v99 ~= nil and #v99.Rewards or v99) > 6 then
                local v101 = {}
                local v102 = u21.Contents
                if v102 ~= nil then
                    v102 = v102.Description
                end
                local v103 = v102 and 0.55 or 1
                local v104 = u21.Contents
                if v104 ~= nil then
                    v104 = v104.Description
                end
                v101.Size = UDim2.new(v103, 0, 1, v104 and -6 or 0)
                v101.LayoutOrder = 2
                v101.BorderSizePixel = 0
                v101.BackgroundTransparency = 1
                v101.AutomaticCanvasSize = Enum.AutomaticSize.Y
                v101.CanvasSize = UDim2.fromScale(1, 1)
                v101.ScrollBarThickness = 3
                v101.ScrollBarImageTransparency = 0.3
                v101.ScrollingDirection = Enum.ScrollingDirection.Y
                local v105 = {}
                local v106 = #v105
                local v107 = {}
                local v108 = u21.AspectRatio
                v107.PaddingRight = UDim.new(0, (v108 == 0 or (v108 ~= v108 or not v108)) and 16 or u21.AspectRatio / 2.5 * 16)
                v107.PaddingLeft = UDim.new(0, 2)
                v107.PaddingTop = UDim.new(0, 6)
                v105[v106 + 1] = u8.createElement("UIPadding", v107)
                local v109 = {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Top",
                    ["SortOrder"] = "LayoutOrder",
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
                }
                local v110 = u21.Contents
                if v110 ~= nil then
                    v110 = v110.Description
                end
                v109.FillDirectionMaxCells = v110 and 5 or 6
                v109.CellSize = UDim2.new(0, 76, 0, 76)
                v109.CellPadding = UDim2.new(0, 10, 0, 10)
                local v111 = u21.Contents.UIGridLayout
                if v111 then
                    for v112, v113 in v111 do
                        v109[v112] = v113
                    end
                end
                v105[v106 + 2] = u8.createElement("UIGridLayout", v109)
                local v114 = u21.Contents
                if v114 ~= nil then
                    local v115 = v114.Rewards
                    if v115 == nil then
                        v114 = v115
                    else
                        v114 = table.create(#v115)
                        for v116, v117 in v115 do
                            local _ = v116 - 1
                            v114[v116] = u8.createElement(u20, {
                                ["Reward"] = v117
                            })
                        end
                    end
                end
                for v118, v119 in v114 do
                    v105[v106 + 2 + v118] = v119
                end
                v100 = u8.createElement("ScrollingFrame", v101, v105)
            else
                local v120 = {}
                local v121 = u21.Contents
                if v121 ~= nil then
                    v121 = v121.Description
                end
                local v122 = v121 and 0.55 or 1
                local v123 = u21.Contents
                if v123 ~= nil then
                    v123 = v123.Description
                end
                v120.Size = UDim2.new(v122, 0, 1, v123 and -6 or 0)
                v120.LayoutOrder = 2
                local v124 = {}
                local v125 = #v124
                local v126 = {}
                local v127 = u21.AspectRatio
                v126.PaddingRight = UDim.new(0, (v127 == 0 or (v127 ~= v127 or not v127)) and 16 or u21.AspectRatio / 2.5 * 16)
                v124[v125 + 1] = u8.createElement("UIPadding", v126)
                local v128 = {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Top",
                    ["SortOrder"] = "LayoutOrder",
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
                }
                local v129 = u21.Contents
                if v129 ~= nil then
                    v129 = v129.Description
                end
                v128.FillDirectionMaxCells = v129 and 5 or 6
                v128.CellSize = UDim2.new(0, 76, 0, 76)
                v128.CellPadding = UDim2.new(0, 10, 0, 10)
                local v130 = u21.Contents.UIGridLayout
                if v130 then
                    for v131, v132 in v130 do
                        v128[v131] = v132
                    end
                end
                v124[v125 + 2] = u8.createElement("UIGridLayout", v128)
                local v133 = u21.Contents
                if v133 ~= nil then
                    local v134 = v133.Rewards
                    if v134 == nil then
                        v133 = v134
                    else
                        v133 = table.create(#v134)
                        for v135, v136 in v134 do
                            local _ = v135 - 1
                            v133[v135] = u8.createElement(u20, {
                                ["Reward"] = v136
                            })
                        end
                    end
                end
                for v137, v138 in v133 do
                    v124[v125 + 2 + v137] = v138
                end
                v100 = u8.createElement(u5, v120, v124)
            end
            local v139 = {
                [#v139 + 1] = v100
            }
            v98 = u8.createFragment(v139)
        end
        if v98 then
            v75[v97 + 1] = v98
        end
        v68[v73 + 1] = u8.createElement(u5, v74, v75)
        v68[v73 + 2] = u8.createElement(u5, {
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(1, 0.01)
        })
        local v140 = {
            ["LayoutOrder"] = 10,
            ["Size"] = UDim2.fromScale(1, v28)
        }
        local v141 = {}
        local v142 = #v141
        local v143 = {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Right",
            ["SortOrder"] = "LayoutOrder"
        }
        local v144 = u21.AspectRatio
        v143.Padding = UDim.new(0, (v144 == 0 or (v144 ~= v144 or not v144)) and 16 or u21.AspectRatio / 2.5 * 16)
        v141[v142 + 1] = u8.createElement("UIListLayout", v143)
        local v145 = u21.Product.GiftType
        if v145 then
            local v146 = u8.createElement
            local v147 = u16
            local v148 = {
                ["ZIndex"] = 2,
                ["GiftType"] = u21.Product.GiftType
            }
            local v149 = u21.IsOwned
            if v149 then
                v149 = u21.GamepadShouldAutoSelect
            end
            v148.GamepadShouldAutoSelect = v149
            v145 = v146(v147, v148)
        end
        if v145 then
            v141[v142 + 2] = v145
        end
        local v150 = #v141
        local v151
        if u21.IsOwned then
            v151 = u8.createElement("TextLabel", {
                ["Text"] = "OWNED",
                ["TextXAlignment"] = "Center",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
        else
            local v152 = {
                ["Price"] = u21.Product.Price,
                ["OnClick"] = v31
            }
            local v153
            if u21.Discount then
                v153 = {}
                local v154 = u21.Discount
                if v154 ~= nil then
                    v154 = v154.OriginalPrice
                end
                v153.OriginalPrice = v154
            else
                v153 = nil
            end
            v152.Discount = v153
            v152.ZIndex = 2
            v152.TextPositionScaleShift = 0.05
            v152.Effects = {
                ["Shine"] = true
            }
            v152.GamepadShouldAutoSelect = u21.GamepadShouldAutoSelect
            v151 = u8.createElement(u15, v152)
        end
        v141[v150 + 1] = v151
        v68.PurchaseButtons = u8.createElement(u5, v140, v141)
        v34.Content = u8.createElement(u5, v67, v68)
        return u8.createFragment({
            ["Card"] = u8.createElement("ImageButton", v33, v34)
        })
    end)
}