local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.ProgressBar
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["KitDetailsButton"] = v7.new(u6)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u4
            [4] = u5
            [5] = u8
        --]]
        local _ = p10.useState
        local v11 = {}
        for v12, v13 in p9 do
            v11[v12] = v13
        end
        v11.Title = nil
        v11.Subtitle = nil
        v11.OnClick = nil
        v11.Progress = nil
        v11[u6.Children] = nil
        local v14 = {}
        for v15, v16 in v11 do
            v14[v15] = v16
        end
        local v17 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 3)
            }) }
        local v18 = #v17
        local v19 = {
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["BackgroundColor3"] = p9.ButtonColor3 or Color3.fromRGB(45, 45, 45),
            ["Text"] = "",
            [u6.Event.MouseButton1Click] = p9.OnClick
        }
        local v20 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            }), u6.createElement("Frame", {
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u3.WHITE
            }, { u6.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0.9) })
                }), u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) }), u6.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, {
                u6.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }),
                u6.createElement("UIPadding", {
                    ["PaddingRight"] = UDim.new(0.15, 0),
                    ["PaddingLeft"] = UDim.new(0.15, 0)
                }),
                u6.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["TextTransparency"] = 0.5,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Text"] = p9.Title,
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }),
                u6.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Text"] = p9.Subtitle,
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            }) }
        local v21 = #v20
        local v22 = p9[u6.Children]
        if v22 then
            for v23, v24 in v22 do
                if type(v23) == "number" then
                    v20[v21 + v23] = v24
                else
                    v20[v23] = v24
                end
            end
        end
        v17[v18 + 1] = u6.createElement("TextButton", v19, v20)
        local v25 = v18 + 2
        local v26
        if p9.Progress == nil then
            v26 = u6.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 0.1)
            })
        else
            v26 = u6.createElement(u5, {
                ["BarBackgroundTransparency"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["Progress"] = p9.Progress,
                ["BarCornerRadius"] = UDim.new(1, 0),
                ["BarColor"] = u8.mcGreen,
                ["BarBackgroundColor"] = Color3.fromRGB(45, 45, 45)
            }, { u6.createElement("Frame", {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = u3.WHITE
                }, { u6.createElement("UIGradient", {
                        ["Rotation"] = -90,
                        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0.9) })
                    }), u6.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 4)
                    }) }) })
        end
        v17[v25] = v26
        return u6.createElement(u4, v14, v17)
    end)
}