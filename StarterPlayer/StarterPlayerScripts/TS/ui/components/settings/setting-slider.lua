local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SliderComponent
local u5 = v2.StringUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SettingSlider"] = v7.new(u6)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u5
            [4] = u3
            [5] = u4
        --]]
        local v11, u12 = p10.useState(u9.Value)
        local v13 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u8.backgroundTertiary
        }
        local v14 = u9.FrameProps
        if v14 then
            for v15, v16 in v14 do
                v13[v15] = v16
            end
        end
        local v17 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v18 = #v17
        local v19 = {
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v20 = u5
        local v21 = string.split
        local v22 = u9.StepSize
        local v23 = v21(tostring(v22), ".")[2]
        local v24 = v23 ~= nil and #v23 or v23
        local v25 = v24 == nil and 0 or v24
        v19.Text = v20.roundNumber(v11, v25)
        v19.BackgroundTransparency = 1
        v19.TextColor3 = u3.WHITE
        v19.TextXAlignment = "Left"
        v19.TextScaled = true
        v19.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v17[v18 + 1] = u6.createElement("TextLabel", v19, { u6.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        v17[v18 + 2] = u6.createElement(u4, {
            ["Size"] = UDim2.fromScale(0.5, 0.3),
            ["OnChange"] = function(p26) --[[ Name: OnChange, Line 58 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                u12(p26)
            end,
            ["OnInputEnd"] = function(p27) --[[ Name: OnInputEnd, Line 61 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                u9.SetValue(p27)
            end,
            ["InitialValue"] = u9.Value,
            ["ThemeColor"] = u9.ThemeColor or u8.textPrimary,
            ["BarColor"] = u8.backgroundSecondary,
            ["StepSize"] = u9.StepSize,
            ["Max"] = u9.Max,
            ["Min"] = u9.Min
        })
        return u6.createElement("Frame", v13, v17)
    end)
}