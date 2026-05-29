local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["MissionProgressRow"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u5
        --]]
        local _ = p7.useState
        local v8 = u6.Mission
        local v9
        if u6.Completed then
            v9 = u6.Mission.goalProgress
        else
            v9 = u6.Mission.currProgress
        end
        v8.currProgress = v9
        local function v15() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u2
                [3] = u6
                [4] = u5
            --]]
            local v10 = u3.createFragment
            local v11 = {}
            local v12 = u3.createElement
            local v13 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.78, 0, 0, 12),
                ["AutomaticSize"] = Enum.AutomaticSize.Y,
                ["BackgroundColor3"] = u2.hexColor(5921943)
            }
            local v14 = {
                u3.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }),
                ["MissionProgressBar"] = u3.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 0,
                    ["Size"] = UDim2.new(u6.Mission.currProgress / u6.Mission.goalProgress, 0, 0, 12),
                    ["AutomaticSize"] = Enum.AutomaticSize.Y,
                    ["BackgroundColor3"] = u5.textPrimary
                }, { u3.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }) })
            }
            v11.MissionProgressBar = v12("Frame", v13, v14)
            return v10(v11)
        end
        local function v22() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u6
                [3] = u2
            --]]
            local v16 = u3.createFragment
            local v17 = {}
            local v18 = u3.createElement
            local v19 = {
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextSize"] = 16,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.XY
            }
            local v20 = u6.Mission.currProgress / u6.Mission.goalProgress * 100
            local v21 = math.floor(v20)
            v19.Text = "<b>" .. tostring(v21) .. "%</b>"
            v19.TextColor3 = u2.WHITE
            v19.Font = Enum.Font.Roboto
            v17.MissionProgressPercentage = v18("TextLabel", v19)
            return v16(v17)
        end
        local function v31() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u6
                [3] = u5
            --]]
            local v23 = u3.createFragment
            local v24 = {}
            local v25 = u3.createElement
            local v26 = {
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextSize"] = 16,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.XY
            }
            local v27 = u6.Mission.currProgress
            local v28 = math.floor(v27)
            local v29 = tostring(v28)
            local v30 = u6.Mission.goalProgress
            v26.Text = "<b>(<font color=\"#FFFFFF\">" .. v29 .. "</font>/" .. tostring(v30) .. ")</b>"
            v26.TextColor3 = u5.textSecondary
            v26.Font = Enum.Font.Roboto
            v24.MissionProgressValue = v25("TextLabel", v26)
            return v23(v24)
        end
        local v32 = u3.createFragment
        local v33 = {
            ["MissionProgressWrapper"] = u3.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.Y
            }, {
                u3.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["Padding"] = UDim.new(0, 10),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }),
                u3.createElement(v15),
                u3.createElement(v22),
                u3.createElement(v31)
            })
        }
        return v32(v33)
    end)
}