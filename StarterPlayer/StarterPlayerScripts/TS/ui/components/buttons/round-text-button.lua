local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, script.Parent, "round-button").RoundButton
return {
    ["RoundTextButton"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u8
            [4] = u9
            [5] = u4
            [6] = u3
        --]]
        local v12, u13 = p11.useState(false)
        local v14 = {}
        for v15, v16 in u10 do
            v14[v15] = v16
        end
        v14.Text = nil
        v14.Image = nil
        v14.OnClick = nil
        v14[u6.Children] = nil
        local v17 = {}
        for v18, v19 in v14 do
            v17[v18] = v19
        end
        v17.AutomaticSize = "X"
        v17.SizeConstraint = "RelativeYY"
        v17.BackgroundTransparency = 1
        v17[u6.Event.MouseButton1Click] = function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            if u10.OnClick then
                u10.OnClick()
            end
        end
        v17[u6.Event.MouseEnter] = function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
                [3] = u13
            --]]
            u5:playSound(u8.UI_HOVER)
            u13(true)
        end
        v17[u6.Event.MouseLeave] = function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13(false)
        end
        v17.Selectable = true
        local v20 = {}
        local v21 = #v20
        local v22 = u10[u6.Children]
        if v22 then
            for v23, v24 in v22 do
                if type(v23) == "number" then
                    v20[v21 + v23] = v24
                else
                    v20[v23] = v24
                end
            end
        end
        local v25 = #v20
        v20[v25 + 1] = u6.createElement("UIListLayout", {
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["Padding"] = UDim.new(0, 6)
        })
        v20[v25 + 2] = u6.createElement(u9, {
            ["Size"] = UDim2.fromScale(0.4, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = u10.Image,
            ["Hovered"] = v12,
            ["OnClick"] = u10.OnClick,
            ["ZIndex"] = v14.ZIndex,
            ["LayoutOrder"] = u10.Text.TextMode == "LEFT" and 1 or 0,
            ["ImageButtonProps"] = {
                ["Selectable"] = false
            }
        }, { u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1,
                ["DominantAxis"] = "Height",
                ["AspectType"] = u4.isSmallScreen() and "FitWithinMaxSize" or "ScaleWithParentSize"
            }) })
        local v26 = v25 + 3
        local v27 = u6.createElement
        local v28 = "TextLabel"
        local v29 = {
            ["AutomaticSize"] = "X",
            ["SizeConstraint"] = "RelativeYY",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Text"] = u10.Text.Text,
            ["TextColor3"] = u3.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        }
        local v30 = Font.new
        local v31 = "Roboto"
        local v32
        if u10.Text.Bold then
            v32 = Enum.FontWeight.Bold
        else
            v32 = Enum.FontWeight.Regular
        end
        v29.FontFace = v30(v31, v32)
        v29.LayoutOrder = u10.Text.TextMode == "LEFT" and 0 or 1
        v29.ZIndex = v14.ZIndex
        v20[v26] = v27(v28, v29)
        return u6.createElement("ImageButton", v17, v20)
    end)
}