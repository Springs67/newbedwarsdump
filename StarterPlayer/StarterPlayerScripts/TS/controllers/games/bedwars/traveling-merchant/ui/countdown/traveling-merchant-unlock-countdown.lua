local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = {
    "<b>Preparing shop   </b>",
    "<b>Preparing shop.  </b>",
    "<b>Preparing shop.. </b>",
    "<b>Preparing shop...</b>"
}
return {
    ["TravelingMerchantUnlockCountdown"] = v3.new(u2)(function(p6, p7) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u4
        --]]
        local v8 = p7.useEffect
        local u9 = u2.createRef()
        local u10 = true
        local u11 = 0
        v8(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u10
                [3] = u5
                [4] = u11
            --]]
            local u12 = u9:getValue()
            if u12 then
                task.spawn(function() --[[ Line: 21 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u5
                        [3] = u11
                        [4] = u12
                    --]]
                    while u10 do
                        u12.Text = u5[u11 % #u5 + 1]
                        u11 = u11 + 1
                        task.wait(1)
                    end
                end)
            end
            return function() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10 = false
            end
        end)
        local u13 = u2.createRef()
        local u14 = TweenInfo.new(p6.shopOpensIn, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        v8(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u4
                [3] = u14
            --]]
            local v15 = u13:getValue()
            if v15 then
                u4:Create(v15, u14, {
                    ["Size"] = UDim2.fromScale(0, v15.Size.Y.Scale)
                }):Play()
            end
            return function() --[[ Line: 45 ]] end
        end)
        local v16 = u2.createFragment
        local v17 = {}
        local v18 = u2.createElement
        local v19 = {
            ["StudsOffset"] = Vector3.new(1.25, 5, 0),
            ["AlwaysOnTop"] = true,
            ["MaxDistance"] = 30,
            ["ResetOnSpawn"] = false,
            ["Size"] = UDim2.fromScale(6, 0.8),
            ["Adornee"] = p6.wagonInstance
        }
        local v20 = { (u2.createElement("TextLabel", {
                ["RichText"] = true,
                [u2.Ref] = u9,
                ["Text"] = u5[1],
                ["Font"] = Enum.Font.RobotoMono,
                ["Size"] = UDim2.fromOffset(300, 100),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 26,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }, { u2.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(-1.5, 0)
                }) })) }
        local v21 = u2.createElement
        local v22 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0.5,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v23 = {
            ["ClockIcon"] = u2.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://13417217968",
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.1, 0.5),
                ["Size"] = UDim2.fromScale(0.25, 0.75)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 0.87,
                    ["DominantAxis"] = Enum.DominantAxis.Height
                }) })
        }
        local v24 = u2.createElement
        local v25 = {
            ["BackgroundTransparency"] = 0.75,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.75, 0.6),
            ["Position"] = UDim2.fromScale(0.5725, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v26 = {
            ["OuterCountdownProgress"] = u2.createElement("Frame", {
                [u2.Ref] = u13,
                ["Size"] = UDim2.fromScale(0.95, 0.75),
                ["Position"] = UDim2.fromScale(0.025, 0.1),
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["BorderSizePixel"] = 0
            }),
            u2.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            })
        }
        v23.InnerCountdownProgress = v24("Frame", v25, v26)
        __set_list(v23, 1, {u2.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0, 8)
}), u2.createElement("UIStroke", {
    ["Thickness"] = 5,
    ["Color"] = Color3.fromRGB(255, 255, 255)
})})
        v20.CountdownContainer = v21("Frame", v22, v23)
        v17.TravelingMerchantCountdown = v18("BillboardGui", v19, v20)
        return v16(v17)
    end)
}