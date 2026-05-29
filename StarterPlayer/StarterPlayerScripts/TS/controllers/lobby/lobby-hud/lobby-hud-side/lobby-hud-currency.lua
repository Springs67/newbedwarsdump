local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.TooltipContainer
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "number-counter").NumberCounter
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["LobbyHudCurrency"] = v10.new(u9)(function(p14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u12
            [3] = u13
            [4] = u4
            [5] = u9
            [6] = u8
            [7] = u3
            [8] = u7
            [9] = u11
            [10] = u6
        --]]
        local _ = p15.useState
        local v16
        if u5.isSmallScreen() then
            v16 = UDim2.fromOffset(170, 25)
        else
            v16 = UDim2.fromOffset(170, 30)
        end
        local v17 = UDim.new(0.05, 0)
        local v18 = UDim2.fromScale(0.2, 0.8)
        local v19 = UDim2.fromScale(0.7, 0.7)
        local v20 = u12.BED_COIN_ICON
        local v21 = Color3.fromRGB(76, 78, 132)
        local v22 = u13.backgroundPrimary
        local v23 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = v16,
            ["BackgroundColor3"] = u4.WHITE
        }
        local v24 = p14.FrameProps
        if v24 then
            for v25, v26 in v24 do
                v23[v25] = v26
            end
        end
        local v27 = { u9.createElement(u8, {}, { u9.createElement(u3, {
                    ["Text"] = "Bed Coins",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }), u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }), u9.createElement("UIGradient", {
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v21), ColorSequenceKeypoint.new(1, v22) })
            }) }
        local v28 = #v27
        local v29 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v30 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = v17
            }), u9.createElement(u7, {
                ["Padding"] = UDim.new(0.03, 0)
            }), u9.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Image"] = v20,
                ["Size"] = v18,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u9.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }) }
        local _ = #v30
        local v31 = {}
        local v32 = p14.BedCoins
        v31.Value = v32 == nil and 0 or v32
        local v33 = {}
        local v34 = p14.BedCoins
        local v35 = v34 == nil and 0 or v34
        v33.Text = tostring(v35)
        v33.Size = v19
        v33.TextColor3 = u4.WHITE
        v33.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v33.TextScaled = true
        v33.BackgroundTransparency = 1
        v33.TextXAlignment = Enum.TextXAlignment.Left
        v31.TextLabelProps = v33
        v30.CurrencyAmount = u9.createElement(u11, v31)
        v27.Container = u9.createElement(u6, v29, v30)
        local v36 = p14[u9.Children]
        if v36 then
            for v37, v38 in v36 do
                if type(v37) == "number" then
                    v27[v28 + v37] = v38
                else
                    v27[v37] = v38
                end
            end
        end
        return u9.createFragment({
            ["LobbyHudCurrency"] = u9.createElement("Frame", v23, v27)
        })
    end)
}