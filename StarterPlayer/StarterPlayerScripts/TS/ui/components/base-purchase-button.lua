local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.GetUIScaleAncestors
local u8 = v2.ImageId
local u9 = v2.ShineEffect
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["BasePurchaseButton"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u10)(function(u11, p12) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u4
            [4] = u5
            [5] = u9
            [6] = u8
            [7] = u6
            [8] = u3
        --]]
        local v13 = p12.useState
        local v14 = p12.useEffect
        local v15, u16 = v13(0)
        local v17 = u11.TextPositionScaleShift
        local v18, u19 = v13(v17 == nil and 0 or v17)
        local u20 = u10.createRef()
        v14(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u7
                [3] = u19
            --]]
            local v21 = u20:getValue()
            if v21 and #u7(v21) ~= 0 then
                u19(0.05)
            end
        end, {})
        v14(function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u11
            --]]
            u16(u11.Price)
        end, { u11.Price })
        local v22 = {
            ["Selectable"] = true,
            ["AutoButtonColor"] = true,
            ["AnchorPoint"] = u11.AnchorPoint or Vector2.new(0, 0),
            ["Position"] = u11.Position or UDim2.fromScale(0, 0),
            ["Size"] = u11.Size or UDim2.new(1, 0, 1, 0),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["OnClick"] = function() --[[ Name: OnClick, Line 40 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11.OnClick()
            end
        }
        local v23 = u11.LayoutOrder
        v22.LayoutOrder = v23 == nil and 4 or v23
        v22.CornerRadius = UDim.new(0, 3)
        local v24 = u11.ZIndex
        v22.ZIndex = (v24 == nil and 1 or v24) + 1
        local v25 = u11.ButtonProps
        if v25 then
            for v26, v27 in v25 do
                v22[v26] = v27
            end
        end
        v22.GamepadShouldAutoSelect = u11.GamepadShouldAutoSelect
        v22[u10.Ref] = u20
        local v28 = not u11.IgnoreAspectRatio
        if v28 then
            local v29 = {}
            local v30 = u11.AspectRatio
            v29.AspectRatio = v30 == nil and 3.1666666666666665 or v30
            v28 = u10.createElement("UIAspectRatioConstraint", v29)
        end
        local v31 = {}
        local v32 = #v31
        if v28 then
            v31[v32 + 1] = v28
        end
        local v33 = #v31
        v31[v33 + 1] = u10.createElement("UIGradient", {
            ["Rotation"] = 90,
            ["Color"] = u11.ButtonGradient or ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 206, 92)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 166, 76)) })
        })
        local v34 = {}
        local v35 = u11.ButtonGradient
        if v35 ~= nil then
            v35 = v35.Keypoints[1]
        end
        local v36
        if v35 then
            local v37 = u4
            local v38 = u11.ButtonGradient
            if v38 ~= nil then
                v38 = v38.Keypoints[1].Value
            end
            v36 = v37.brighten(v38, 0.2)
        else
            v36 = Color3.fromRGB(105, 242, 143)
        end
        v34.Color = v36
        v34.Thickness = u5.isSmallScreen() and 1 or 2
        v34.Transparency = 0.7
        v31[v33 + 2] = u10.createElement("UIStroke", v34)
        local v39 = u11.Effects
        if v39 ~= nil then
            v39 = v39.Shine
        end
        if v39 == nil then
            v39 = u10.createElement(u9, {
                ["Speed"] = 1
            })
        end
        if type(v39) == "table" then
            v31[v33 + 3] = v39
        end
        local v40 = #v31
        local v41 = {
            ["Size"] = UDim2.fromScale(1, u11.Discount == nil and 1 or 0.75),
            ["Position"] = UDim2.fromScale(v18, 0)
        }
        local v42 = u11.ZIndex
        v41.ZIndex = (v42 == nil and 1 or v42) + 1
        local v43 = v15 ~= -1
        if v43 then
            local v44 = {}
            local v45 = u11.Icon
            if v45 == nil then
                v45 = u8.ROBUX
            end
            v44.Image = v45
            v44.ImageColor3 = Color3.fromRGB(255, 255, 255)
            v44.BackgroundTransparency = 1
            v44.BorderSizePixel = 0
            v44.Size = UDim2.fromScale(0.6, 0.6)
            v44.ScaleType = "Fit"
            v44.SizeConstraint = "RelativeYY"
            v44.LayoutOrder = 1
            local v46 = u11.ZIndex
            v44.ZIndex = (v46 == nil and 1 or v46) + 1
            v43 = u10.createElement("ImageLabel", v44)
        end
        local v47 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.04, 0)
            }) }
        local v48 = #v47
        if v43 then
            v47[v48 + 1] = v43
        end
        local v49 = #v47
        local v50 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["AutoLocalize"] = false,
            ["LayoutOrder"] = 2
        }
        local v51 = v15 == -1 and "FREE" or v15
        v50.Text = tostring(v51)
        local v52
        if v15 == -1 then
            v52 = UDim2.fromScale(1, 0.65)
        else
            v52 = UDim2.fromScale(0, 0.65)
        end
        v50.Size = v52
        local v53
        if v15 == -1 then
            v53 = Enum.AutomaticSize.None
        else
            v53 = Enum.AutomaticSize.X
        end
        v50.AutomaticSize = v53
        v50.TextColor3 = Color3.fromRGB(255, 255, 255)
        local v54
        if v15 == -1 then
            v54 = Enum.TextXAlignment.Center
        else
            v54 = Enum.TextXAlignment.Left
        end
        v50.TextXAlignment = v54
        v50.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        local v55 = u11.ZIndex
        v50.ZIndex = (v55 == nil and 1 or v55) + 1
        v47[v49 + 1] = u10.createElement("TextLabel", v50)
        local v56 = u11[u10.Children]
        if v56 then
            for v57, v58 in v56 do
                if type(v57) == "number" then
                    v47[v49 + 1 + v57] = v58
                else
                    v47[v57] = v58
                end
            end
        end
        v31.Content = u10.createElement(u6, v41, v47)
        local v59 = u11.Discount
        if v59 then
            local v60 = {
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Position"] = UDim2.fromScale(0.05 + v18, 0.9),
                ["AnchorPoint"] = Vector2.new(0, 1)
            }
            local v61 = u11.ZIndex
            v60.ZIndex = (v61 == nil and 1 or v61) + 1
            local v62 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0.04, 0)
                }) }
            local v63 = #v62
            local v64 = {}
            local v65 = u11.Icon
            if v65 == nil then
                v65 = u8.ROBUX
            end
            v64.Image = v65
            v64.ImageColor3 = Color3.fromRGB(255, 71, 71)
            v64.BackgroundTransparency = 1
            v64.BorderSizePixel = 0
            v64.Size = UDim2.fromScale(0.95, 0.95)
            v64.ScaleType = "Fit"
            v64.SizeConstraint = "RelativeYY"
            v64.LayoutOrder = 1
            local v66 = u11.ZIndex
            v64.ZIndex = (v66 == nil and 1 or v66) + 1
            v62[v63 + 1] = u10.createElement("ImageLabel", v64)
            local v67 = {
                ["AutomaticSize"] = "X",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["AutoLocalize"] = false,
                ["TextXAlignment"] = "Left",
                ["LayoutOrder"] = 2
            }
            local v68 = u11.Discount.OriginalPrice
            v67.Text = "<s>" .. tostring(v68) .. "</s>"
            v67.Size = UDim2.fromScale(0, 1)
            v67.TextColor3 = Color3.fromRGB(255, 71, 71)
            v67.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            local v69 = u11.ZIndex
            v67.ZIndex = (v69 == nil and 1 or v69) + 1
            v62[v63 + 2] = u10.createElement("TextLabel", v67)
            v59 = u10.createFragment({
                ["Discount"] = u10.createElement(u6, v60, v62)
            })
        end
        if v59 then
            v31[v40 + 1] = v59
        end
        return u10.createElement(u3, v22, v31)
    end)
}