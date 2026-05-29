local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.ImageId
local u7 = v2.ShineEffect
local u8 = v2.ShineEffectVariation
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["GameUpdateKitCardTop"] = v10.new(u9)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u9
            [3] = u6
            [4] = u3
            [5] = u11
            [6] = u4
            [7] = u7
            [8] = u8
            [9] = u5
        --]]
        local _ = p14.useState
        local v15 = p14.useEffect
        local u16 = p13.PromoCard
        local function v26() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u12
                [3] = u9
                [4] = u6
                [5] = u3
            --]]
            local v17 = {
                ["LayoutOrder"] = 4,
                ["ZIndex"] = 4,
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0, 0.98),
                ["Size"] = UDim2.new(1, 0, 0.35, 0)
            }
            local v18
            if u16.isOwned then
                v18 = u12.backgroundError
            else
                v18 = u12.backgroundSuccess
            end
            v17.BackgroundColor3 = v18
            function v17.OnClick() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                if u16.OnClick then
                    u16.OnClick()
                end
            end
            v17.CornerRadius = UDim.new(0.2, 0)
            local v19 = { u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0.04, 0)
                }) }
            local v20 = #v19
            local v21 = not u16.isOwned
            if v21 then
                v21 = u9.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["LayoutOrder"] = 1,
                    ["ZIndex"] = 4,
                    ["Image"] = u6.ROBUX,
                    ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Size"] = UDim2.fromScale(0.65, 0.65)
                })
            end
            if v21 then
                v19[v20 + 1] = v21
            end
            local v22 = #v19 + 1
            local v23 = u9.createElement
            local v24 = {
                ["AutomaticSize"] = "X",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["AutoLocalize"] = false,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 4
            }
            local v25 = u16.isOwned and "PURCHASED" or u16.Price
            v24.Text = "<b>" .. tostring(v25) .. "</b>"
            v24.Size = UDim2.fromScale(0, 0.45)
            v24.TextColor3 = Color3.fromRGB(255, 255, 255)
            v19[v22] = v23("TextLabel", v24)
            return u9.createElement(u3, v17, v19)
        end
        local u27 = u9.createRef()
        v15(function() --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u11
            --]]
            local u28 = u27:getValue()
            u28.MouseEnter:Connect(function() --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u11
                --]]
                local v29 = TweenInfo.new(0.3, Enum.EasingStyle.Circular)
                u11:Create(u28:WaitForChild("ImageBackground"), v29, {
                    ["Size"] = UDim2.fromScale(1.6, 1.6)
                }):Play()
                u11:Create(u28:WaitForChild("ImageBlackOverlay"), v29, {
                    ["Transparency"] = 1
                }):Play()
            end)
            u28.MouseLeave:Connect(function() --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u11
                --]]
                local v30 = TweenInfo.new(0.3, Enum.EasingStyle.Circular)
                u11:Create(u28:WaitForChild("ImageBackground"), v30, {
                    ["Size"] = UDim2.fromScale(1.75, 1.75)
                }):Play()
                u11:Create(u28:WaitForChild("ImageBlackOverlay"), v30, {
                    ["Transparency"] = 0.7
                }):Play()
            end)
        end, {})
        local v31 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundTransparency"] = 1,
            ["ClipsDescendants"] = true,
            [u9.Ref] = u27,
            [u9.Event.Activated] = u16.OnClick
        }
        local v32 = {
            u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }),
            u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 2.0849056603773586
            }),
            ["ImageBackground"] = u9.createElement("ImageLabel", {
                ["AutomaticSize"] = "Y",
                ["ImageTransparency"] = 0.7,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["Image"] = u16.BannerImage
            }, { u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }) }),
            ["ImageBlackOverlay"] = u9.createElement("Frame", {
                ["BackgroundTransparency"] = 0.7,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u4.BLACK
            }, { u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }) }),
            u9.createElement(u7, {
                ["Speed"] = 0.55,
                ["Loop"] = false,
                ["OnHover"] = true,
                ["ZIndex"] = 3,
                ["Variation"] = u8.solid
            })
        }
        local v33 = #v32
        local v34 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v35 = { u9.createElement("UIPadding", {
                ["PaddingTop"] = p13.PaddingVertical,
                ["PaddingBottom"] = p13.PaddingVertical,
                ["PaddingLeft"] = p13.PaddingHorizontal,
                ["PaddingRight"] = p13.PaddingHorizontal
            }), u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v36 = #v35
        local v37 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v38 = { u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1,
                ["AspectType"] = "ScaleWithParentSize"
            }) }
        local v39 = #v38
        local v40
        if u16.PromoItemImage == nil then
            v40 = false
        else
            v40 = u9.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = u16.PromoItemImage
            })
        end
        if v40 then
            v38[v39 + 1] = v40
        end
        local v41 = #v38
        local v42 = u16.PromoItemImageElement
        if v42 then
            v42 = u16.PromoItemImageElement
        end
        if v42 then
            v38[v41 + 1] = v42
        end
        v35[v36 + 1] = u9.createElement("ImageLabel", v37, v38)
        local v43 = {
            ["Size"] = UDim2.new(0.5499999999999999, 0, 1, 0)
        }
        local v44 = {}
        local v45 = #v44
        local v46 = {
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0),
            ["Size"] = UDim2.new(1, 0, 0.15, 0),
            ["Font"] = Enum.Font.Roboto,
            ["TextColor3"] = u4.WHITE
        }
        local v47 = u16.ItemType
        if v47 ~= nil then
            v47 = string.upper(v47)
        end
        v46.Text = "<b>" .. v47 .. "</b>"
        v46.AutoLocalize = false
        v46.LayoutOrder = 1
        v46.ZIndex = 4
        v44[v45 + 1] = u9.createElement("TextLabel", v46)
        v44[v45 + 2] = u9.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["AutoLocalize"] = false,
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 4,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0.18),
            ["Size"] = UDim2.new(1, 0, 0.3, 0),
            ["Font"] = Enum.Font.Roboto,
            ["TextColor3"] = u12.textPrimary,
            ["Text"] = "<b>" .. u16.Name .. "</b>"
        })
        local v48
        if p13.PromoCard.Price == nil or p13.PromoCard.Price <= 0 then
            v48 = false
        else
            v48 = u9.createElement(v26)
        end
        if v48 then
            v44[v45 + 3] = v48
        end
        v35[v36 + 2] = u9.createElement(u5, v43, v44)
        v32[v33 + 1] = u9.createElement("Frame", v34, v35)
        return u9.createFragment({
            ["TopHalf"] = u9.createElement("ImageButton", v31, v32)
        })
    end)
}