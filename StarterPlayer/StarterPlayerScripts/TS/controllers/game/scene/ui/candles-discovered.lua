local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["CandlesDiscovered"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v5 = p4.useState
        local v6 = p4.useEffect
        local v7, u8 = v5(0)
        v6(function() --[[ Line: 9 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u8
            --]]
            local u10 = u3.candlesDiscoveredSignal:Connect(function(p9) --[[ Line: 10 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                u8(p9)
            end)
            return function() --[[ Line: 13 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10:Disconnect()
            end
        end, {})
        local v11 = u2.createElement
        local v12 = {}
        local v13 = u2.createElement
        local v14 = {
            ["BorderSizePixel"] = 0,
            ["Transparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v15 = {
            ["CandlesDiscoveredContainer"] = u2.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Transparency"] = 1,
                ["Size"] = UDim2.fromOffset(125, 50),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0, 1)
            }, { u2.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                }), u2.createElement("ImageLabel", {
                    ["LayoutOrder"] = 1,
                    ["Image"] = "rbxassetid://15188466476",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.4, 1)
                }), u2.createElement("TextLabel", {
                    ["LayoutOrder"] = 2,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Text"] = tostring(v7) .. "/8",
                    ["Size"] = UDim2.fromScale(0.6, 1),
                    ["Font"] = Enum.Font.RobotoMono,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }) })
        }
        v12.ScreenContainer = v13("Frame", v14, v15)
        return v11("ScreenGui", {
            ["ResetOnSpawn"] = true
        }, v12)
    end)
}