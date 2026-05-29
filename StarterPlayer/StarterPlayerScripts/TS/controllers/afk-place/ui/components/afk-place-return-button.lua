local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["AfkPlaceReturnButton"] = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u10
            [4] = u12
            [5] = u6
            [6] = u11
            [7] = u5
            [8] = u3
            [9] = u4
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(true)
        local u19 = u7.createRef()
        local u20 = u7.createRef()
        v16(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
                [3] = u13
                [4] = u18
                [5] = u9
                [6] = u10
            --]]
            local v21 = u19:getValue()
            local v22 = u20:getValue()
            if u13.ReturnButtonPressed and (v21 and v22) then
                u18(false)
                u9:Create(v21, TweenInfo.new(u10.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ["Transparency"] = 1
                }):Play()
                u9:Create(v22, TweenInfo.new(u10.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ["TextTransparency"] = 1,
                    ["TextStrokeTransparency"] = 1
                }):Play()
            end
        end, { u13.ReturnButtonPressed, v17 })
        local v23 = {
            [u7.Ref] = u19,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Size"] = UDim2.fromScale(0.2, 0.1),
            ["Position"] = UDim2.fromScale(0.85, 0.85),
            ["BackgroundColor3"] = u12.backgroundPrimary,
            ["BorderSizePixel"] = 0,
            ["Active"] = v17,
            [u7.Event.Activated] = function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u11
                    [3] = u13
                --]]
                u6:playSound(u11.UI_CLICK_2)
                u13.OnClick()
            end,
            ["ZIndex"] = 2
        }
        local v24 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local _ = #v24
        local v25 = {
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v26 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 3)
            }), u7.createElement(u5, {
                ["Padding"] = {
                    ["Vertical"] = 6,
                    ["Horizontal"] = 4
                }
            }) }
        local v27 = #v26
        local v28
        if u13.Icon == nil then
            v28 = false
        else
            v28 = u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 2,
                ["Image"] = u13.Icon,
                ["Size"] = UDim2.fromScale(1, 0.8)
            })
        end
        if v28 then
            v26[v27 + 1] = v28
        end
        v26[#v26 + 1] = u7.createElement("TextLabel", {
            [u7.Ref] = u20,
            ["Text"] = string.upper(u13.Text),
            ["Size"] = UDim2.fromScale(0.7, 0.7),
            ["FontFace"] = Font.fromName(u10.Theme.font.Name, Enum.FontWeight.Bold),
            ["TextColor3"] = u3.WHITE,
            ["TextScaled"] = true,
            ["TextYAlignment"] = "Center",
            ["Font"] = u10.Theme.font,
            ["TextStrokeTransparency"] = 1,
            ["TextSize"] = 14,
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 2
        })
        v24.Content = u7.createElement(u4, v25, v26)
        return u7.createFragment({
            ["LobbyButton"] = u7.createElement("ImageButton", v23, v24)
        })
    end)
}