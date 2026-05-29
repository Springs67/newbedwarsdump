local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.ImageId
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["MissionDescriptionRow"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u7)(function(u8, _) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u5
            [4] = u4
            [5] = u6
        --]]
        local function v11() --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u8
                [3] = u3
            --]]
            local v9 = u7.createFragment
            local v10 = {
                ["MissionDescription"] = u7.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["RichText"] = true,
                    ["TextSize"] = 20,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.6, 0),
                    ["AutomaticSize"] = Enum.AutomaticSize.Y,
                    ["Text"] = "<b>" .. u8.Mission.description .. "</b>",
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextColor3"] = u3.WHITE,
                    ["Font"] = Enum.Font.Roboto
                })
            }
            return v9(v10)
        end
        local function v17() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u8
                [3] = u5
                [4] = u4
                [5] = u6
                [6] = u3
            --]]
            local v12 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.4, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.Y
            }
            local v13 = { u7.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["Padding"] = UDim.new(0, 6),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }) }
            local v14 = #v13
            local v15 = {}
            local v16 = u8.Mission.reward
            if v16 ~= nil then
                v16 = v16.icon
            end
            if v16 == nil then
                v16 = u5.TICKET
            end
            v15.Image = v16
            v15.Size = UDim2.fromOffset(20, 20)
            v15.ScaleType = "Fit"
            v15.BackgroundTransparency = 1
            v13[v14 + 1] = u7.createElement("ImageLabel", v15)
            v13.MissionReward = u7.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextSize"] = 20,
                ["Size"] = UDim2.new(0, u4.isSmallScreen() and 38 or 0, 0, 20),
                ["AutomaticSize"] = Enum.AutomaticSize.XY,
                ["Text"] = "<b>" .. u6.formatNumberWithCommas(u8.Mission.rewardAmount) .. "</b>",
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextColor3"] = u3.WHITE,
                ["Font"] = Enum.Font.Roboto
            })
            return u7.createFragment({
                ["MissionRewardWrapper"] = u7.createElement("Frame", v12, v13)
            })
        end
        local v18 = u7.createFragment
        local v19 = {
            ["MissionDescriptionWrapper"] = u7.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.Y
            }, { u7.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["Padding"] = UDim.new(0, 8),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }), u7.createElement(v11), u7.createElement(v17) })
        }
        return v18(v19)
    end)
}