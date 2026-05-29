local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.StringUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["GlobalTeamEventRewardEntryProgressRow"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u7
            [4] = u4
        --]]
        local _ = p9.useState
        local function v19() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u3
                [3] = u8
                [4] = u7
            --]]
            local v10 = u5.createFragment
            local v11 = {}
            local v12 = u5.createElement
            local v13 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.78, 0, 0, 12),
                ["AutomaticSize"] = Enum.AutomaticSize.Y,
                ["BackgroundColor3"] = u3.hexColor(5921943)
            }
            local v14 = { (u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                })) }
            local v15 = u5.createElement
            local v16 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0
            }
            local v17 = UDim2.new
            local v18 = u8.Score / u8.Reward.globalTeamScoreRequired
            v16.Size = v17(math.clamp(v18, 0, 1), 0, 0, 12)
            v16.AutomaticSize = Enum.AutomaticSize.Y
            v16.BackgroundColor3 = u7.textPrimary
            v14.MissionProgressBar = v15("Frame", v16, { u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) })
            v11.GlobalTeamEventRewardProgressBar = v12("Frame", v13, v14)
            return v10(v11)
        end
        local function v27() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
                [3] = u3
            --]]
            local v20 = u5.createFragment
            local v21 = {}
            local v22 = u5.createElement
            local v23 = {
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextSize"] = 16,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.XY
            }
            local v24 = u8.Score / u8.Reward.globalTeamScoreRequired
            local v25 = math.clamp(v24, 0, 1) * 100
            local v26 = math.floor(v25)
            v23.Text = "<b>" .. tostring(v26) .. "%</b>"
            v23.TextColor3 = u3.WHITE
            v23.Font = Enum.Font.Roboto
            v21.MissionProgressPercentage = v22("TextLabel", v23)
            return v20(v21)
        end
        local function v30() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u4
                [3] = u8
                [4] = u7
            --]]
            local v28 = u5.createFragment
            local v29 = {
                ["MissionProgressValue"] = u5.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["RichText"] = true,
                    ["TextSize"] = 16,
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(0, 0),
                    ["AutomaticSize"] = Enum.AutomaticSize.XY,
                    ["Text"] = "<b>(" .. u4.formatNumberWithCommas(u8.Reward.globalTeamScoreRequired) .. ")</b>",
                    ["TextColor3"] = u7.textSecondary,
                    ["Font"] = Enum.Font.Roboto
                })
            }
            return v28(v29)
        end
        local v31 = u5.createFragment
        local v32 = {
            ["MissionProgressWrapper"] = u5.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.Y
            }, {
                u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["Padding"] = UDim.new(0, 10),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }),
                u5.createElement(v19),
                u5.createElement(v27),
                u5.createElement(v30)
            })
        }
        return v31(v32)
    end)
}