local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.SoundManager
local u9 = v2.TooltipContainer
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["LobbyHudLargeButton"] = v11.new(u10)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u5
            [3] = u4
            [4] = u10
            [5] = u8
            [6] = u12
            [7] = u9
            [8] = u3
            [9] = u7
            [10] = u6
        --]]
        local _ = p15.useState
        local v16 = u14.FrameProps
        if v16 ~= nil then
            v16 = v16.BackgroundColor3
        end
        if v16 == nil then
            v16 = u13.backgroundPrimary
        end
        local v17
        if u5.isSmallScreen() then
            v17 = UDim2.fromOffset(70, 70)
        else
            v17 = UDim2.fromOffset(80, 80)
        end
        local v18 = Enum.FillDirection.Vertical
        local v19 = UDim.new(0.1, 0)
        local v20 = Enum.HorizontalAlignment.Center
        local v21 = UDim2.fromScale(0.8, 0.5)
        local v22 = UDim2.fromScale(1, 0.2)
        local v23 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = v17,
            ["BackgroundColor3"] = u4.WHITE,
            ["Image"] = u14.BackgroundImage,
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["BackgroundTransparency"] = u14.RemoveBackgroundColoring and 1 or 0
        }
        local v24 = u14.FrameProps
        if v24 then
            for v25, v26 in v24 do
                v23[v25] = v26
            end
        end
        v23[u10.Event.Activated] = function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u12
                [3] = u14
            --]]
            u8:playSound(u12.UI_CLICK_2)
            u14.OnClick()
        end
        local v27 = { u10.createElement(u9, {}, { u10.createElement(u3, {
                    ["TextSize"] = 16,
                    ["Text"] = u14.Text,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }), u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }) }
        local v28 = #v27
        local v29 = not u14.RemoveBackgroundColoring
        if v29 then
            v29 = u10.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = u14.BackgroundGradient or ColorSequence.new(v16, Color3.fromRGB(76, 78, 132))
            })
        end
        if v29 then
            v27[v28 + 1] = v29
        end
        local v30 = #v27
        local v31 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v32 = { u10.createElement("UIListLayout", {
                ["VerticalAlignment"] = "Center",
                ["FillDirection"] = v18,
                ["HorizontalAlignment"] = v20,
                ["Padding"] = v19
            }) }
        local v33 = #v32
        local v34 = {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Image"] = u14.Icon,
            ["Size"] = v21
        }
        local v35 = u14.IconProps
        if v35 then
            for v36, v37 in v35 do
                v34[v36] = v37
            end
        end
        v32[v33 + 1] = u10.createElement("ImageLabel", v34, { u10.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v38 = {
            ["RichText"] = true,
            ["Font"] = "GothamBold",
            ["BackgroundTransparency"] = 1,
            ["Text"] = "<b>" .. string.upper(u14.Text) .. "</b>",
            ["Size"] = v22,
            ["TextColor3"] = u4.WHITE,
            ["TextSize"] = u5.isSmallScreen() and 18 or 24
        }
        local v39 = u14.TextLabelProps
        if v39 then
            for v40, v41 in v39 do
                v38[v40] = v41
            end
        end
        v32[v33 + 2] = u10.createElement("TextLabel", v38)
        local v42 = {}
        local v43 = u14.ButtonPadding
        local v44 = v43 == nil and 8 or v43
        v42.Padding = UDim.new(0, v44)
        v32[v33 + 3] = u10.createElement(u7, v42)
        v27.Container = u10.createElement(u6, v31, v32)
        local v45 = u14[u10.Children]
        if v45 then
            for v46, v47 in v45 do
                if type(v46) == "number" then
                    v27[v30 + v46] = v47
                else
                    v27[v46] = v47
                end
            end
        end
        return u10.createFragment({
            ["LobbyHudSideButton_" .. u14.Text] = u10.createElement("ImageButton", v23, v27)
        })
    end)
}