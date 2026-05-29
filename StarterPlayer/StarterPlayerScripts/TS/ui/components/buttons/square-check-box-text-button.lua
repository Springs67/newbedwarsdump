local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, script.Parent, "square-check-box-button").SquareCheckBoxButton
return {
    ["SquareCheckBoxTextButton"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u8
            [4] = u4
            [5] = u9
            [6] = u3
        --]]
        local v12 = p11.useState
        local _ = p11.useEffect
        local _, u13 = v12(false)
        local v14 = u10.Checked
        if v14 == nil then
            v14 = false
        end
        local u15, u16 = v12(v14)
        local v17 = {}
        for v18, v19 in u10 do
            v17[v18] = v19
        end
        v17.Text = nil
        v17.Checked = nil
        v17.OnChecked = nil
        v17.UIListLayoutProps = nil
        v17[u6.Children] = nil
        local v20 = {}
        for v21, v22 in v17 do
            v20[v21] = v22
        end
        v20.BackgroundTransparency = 1
        v20[u6.Event.Activated] = function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u15
                [3] = u10
            --]]
            u16(not u15)
            if u10.OnChecked then
                u10.OnChecked(not u15)
            end
        end
        v20[u6.Event.MouseEnter] = function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
                [3] = u13
            --]]
            u5:playSound(u8.UI_HOVER)
            u13(true)
        end
        v20[u6.Event.MouseLeave] = function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13(false)
        end
        local v23 = {}
        local v24 = #v23
        local v25 = u10[u6.Children]
        if v25 then
            for v26, v27 in v25 do
                if type(v26) == "number" then
                    v23[v24 + v26] = v27
                else
                    v23[v26] = v27
                end
            end
        end
        local v28 = #v23
        local v29 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v30 = {}
        local v31 = #v30
        local v32 = {
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["Padding"] = UDim.new(0, 2)
        }
        local v33 = u10.UIListLayoutProps
        if v33 then
            for v34, v35 in v33 do
                v32[v34] = v35
            end
        end
        v30[v31 + 1] = u6.createElement("UIListLayout", v32)
        v30[v31 + 2] = u6.createElement(u4, {
            ["Size"] = UDim2.fromScale(0.4, 1),
            ["LayoutOrder"] = u10.Text.TextMode == "LEFT" and 1 or 0
        }, { u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u6.createElement(u9, {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["OnChecked"] = function(p36) --[[ Name: OnChecked, Line 93 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u10
                    --]]
                    u16(not p36)
                    if u10.OnChecked then
                        u10.OnChecked(not p36)
                    end
                end,
                ["Checked"] = u15
            }, { u6.createElement("UIStroke", {
                    ["Transparency"] = 0.5,
                    ["Thickness"] = 1,
                    ["Color"] = u3.WHITE
                }) }) })
        local v37 = v31 + 3
        local v38 = u6.createElement
        local v39 = u4
        local v40 = {
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v41 = {}
        local v42 = u6.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        })
        local v43 = u6.createElement
        local v44 = "TextLabel"
        local v45 = {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Text"] = u10.Text.Text,
            ["TextColor3"] = u3.WHITE,
            ["TextXAlignment"] = u10.Text.TextXAlignment or Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        }
        local v46 = Font.new
        local v47 = "Roboto"
        local v48
        if u10.Text.Bold then
            v48 = Enum.FontWeight.Bold
        else
            v48 = Enum.FontWeight.Regular
        end
        v45.FontFace = v46(v47, v48)
        v45.LayoutOrder = u10.Text.TextMode == "LEFT" and 0 or 1
        __set_list(v41, 1, {v42, v43(v44, v45)})
        v30[v37] = v38(v39, v40, v41)
        v23[v28 + 1] = u6.createElement(u4, v29, v30)
        return u6.createElement("ImageButton", v20, v23)
    end)
}