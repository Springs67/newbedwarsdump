local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.Padding
local u7 = v2.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["PillText"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u8)(function(p9, p10) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u3
            [4] = u5
            [5] = u6
            [6] = u4
        --]]
        local _ = p10.useState
        local v11 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(0, 100, 0, 25),
            ["BackgroundColor3"] = Color3.fromHex("#39385A")
        }
        local v12 = p9.FrameProps
        if v12 then
            for v13, v14 in v12 do
                v11[v13] = v14
            end
        end
        local v15 = { u8.createElement("UIStroke", {
                ["Color"] = Color3.fromHex("#5D5F92")
            }), u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }) }
        local v16 = #v15
        local v17 = {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = p9.Icon
        }
        local v18 = {}
        local v19 = #v18
        local v20
        if p9.Tooltip == nil then
            v20 = false
        else
            v20 = u8.createElement(u7, {}, { u8.createElement(u3, {
                    ["TextSize"] = 16,
                    ["Text"] = p9.Tooltip,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) })
        end
        if v20 then
            v18[v19 + 1] = v20
        end
        v15[v16 + 1] = u8.createElement("ImageLabel", v17, v18)
        local v21 = u8.createElement
        local v22 = u5
        local v23 = {
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(1, 0),
            ["Size"] = UDim2.fromScale(0.8, 1)
        }
        local v24 = {
            u8.createElement(u6, {
                ["Padding"] = {
                    ["Vertical"] = 4,
                    ["Horizontal"] = 8
                }
            }),
            ["Text"] = u8.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Right",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Text"] = p9.Text,
                ["TextColor3"] = u4.WHITE
            })
        }
        v15.ScoreContainer = v21(v22, v23, v24)
        return u8.createFragment({
            ["ScorePill"] = u8.createElement("Frame", v11, v15)
        })
    end)
}