local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.GetUIScaleAncestors
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["BattlePassRewardsListPassTitles"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(u6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
        --]]
        local _ = p7.useState
        local v8 = p7.useEffect
        local u9 = u5.createRef()
        v8(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u4
                [3] = u6
            --]]
            local function u19() --[[ Line: 14 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u4
                    [3] = u6
                --]]
                local v10 = u9:getValue()
                local v11 = u4(v10)
                local v12 = table.create(#v11)
                for v13, v14 in v11 do
                    local _ = v13 - 1
                    v12[v13] = v14.Scale
                end
                local v15 = 1
                for v16 = 1, #v12 do
                    local v17 = v12[v16]
                    local _ = v16 - 1
                    v15 = v15 * v17
                end
                if v10 then
                    local v18 = v10.Parent.AbsoluteSize.Y * u6.Size.Y.Scale / v15
                    v10.Position = UDim2.new(0, (-v10.AbsoluteSize.X + 8) / 2 / v15, 0, (v18 - 11) / 2)
                    v10.Size = UDim2.new(0, v18, 0, 16)
                end
            end
            local u20 = u9:getValue():GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19()
            end)
            return function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20:Disconnect()
            end
        end, {})
        local v21 = u5.createFragment
        local v22 = {
            ["BattlePassTitles"] = u5.createElement("Frame", {
                ["Position"] = UDim2.fromScale(0, 0),
                ["Size"] = UDim2.new(0, 0, 1, 0),
                ["Rotation"] = -90,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = u6.LayoutOrder,
                [u5.Ref] = u9
            }, {
                u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 2)
                }),
                u5.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.new(0.1, 0, 0, 16)
                }),
                u5.createElement("TextLabel", {
                    ["Text"] = "Free Pass",
                    ["TextTransparency"] = 0.3,
                    ["TextSize"] = 16,
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(0.4, 0, 0, 16),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextColor3"] = u3.WHITE,
                    ["Font"] = Enum.Font.Roboto
                }),
                u5.createElement("TextLabel", {
                    ["Text"] = "Battle Pass",
                    ["TextSize"] = 16,
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(0.5, -8, 0, 16),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextColor3"] = u3.WHITE,
                    ["Font"] = Enum.Font.Roboto
                })
            })
        }
        return v21(v22)
    end)
}