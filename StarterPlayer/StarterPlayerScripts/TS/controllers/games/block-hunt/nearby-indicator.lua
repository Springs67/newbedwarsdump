local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-flipper", "src").useSpring
return {
    ["NearbyIndicator"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(u5, p6) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u3
        --]]
        local u7 = p6.useValue(4)
        local v8, u9 = u4(p6, 1)
        p6.useEffect(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u2
                [3] = u7
                [4] = u5
            --]]
            u9:onComplete(function() --[[ Line: 11 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u2
                    [3] = u7
                --]]
                if u9:getValue() == 0 then
                    u9:setGoal(u2.Spring.new(1, {
                        ["dampingRatio"] = 0.75,
                        ["frequency"] = u7.value
                    }))
                end
            end)
            local u11 = u5.activatedSignal:Connect(function(p10) --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u9
                    [3] = u2
                --]]
                u7.value = p10
                u9:setGoal(u2.Spring.new(0, {
                    ["dampingRatio"] = 0.75,
                    ["frequency"] = p10
                }))
            end)
            return function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11:Disconnect()
            end
        end)
        return u3.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Image"] = "rbxassetid://14915499193",
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["Position"] = UDim2.fromScale(0.5, 0.4),
            ["ImageTransparency"] = v8,
            ["ImageColor3"] = Color3.fromRGB(56, 168, 59)
        }, { u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end)
}