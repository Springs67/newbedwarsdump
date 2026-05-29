local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["StatusInfoList"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(u4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local _ = p5.useState
        local v6 = p5.useEffect
        local u7 = u3.createRef()
        v6(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u4
            --]]
            local v8 = u7:getValue()
            if v8 then
                u4.SetupRef(v8)
            end
        end, {})
        local v9 = u3.createFragment
        local v10 = {}
        local v11 = u3.createElement
        local v12 = "ScreenGui"
        local v13 = {
            ["ResetOnSpawn"] = false
        }
        local v14 = {}
        local v15 = u3.createElement
        local v16 = "Frame"
        local v17 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, u2.isSmallScreen() and 0.13 or 0.08),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, u2.isSmallScreen() and 0.95 or 0.99)
        }
        local v18 = { (u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 9
            })) }
        local v19 = u3.createElement
        local v20 = "Frame"
        local v21 = {
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0.08, -0.45),
            ["Size"] = UDim2.fromScale(1, 0.45),
            ["BackgroundTransparency"] = 1,
            [u3.Ref] = u7
        }
        local v22 = {}
        local v23 = u3.createElement
        local v24 = "UIListLayout"
        local v25 = {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder"
        }
        local v26
        if u2.isSmallScreen() then
            v26 = Enum.HorizontalAlignment.Left
        else
            v26 = Enum.HorizontalAlignment.Right
        end
        v25.HorizontalAlignment = v26
        v25.Padding = UDim.new(0, 2)
        __set_list(v22, 1, {v23(v24, v25)})
        v18.StatusInfoList = v19(v20, v21, v22)
        v14.FakeHotbar = v15(v16, v17, v18)
        v10.StatusInfoListGui = v11(v12, v13, v14)
        return v9(v10)
    end)
}