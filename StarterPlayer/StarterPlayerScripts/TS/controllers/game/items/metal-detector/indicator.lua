local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-flipper", "src").useSpring
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset
return {
    ["Indicator"] = v5.new(u3)(function(u7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u6
            [4] = u3
        --]]
        local u9 = p8.useValue(4)
        local v10, u11 = u4(p8, 1)
        p8.useEffect(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u2
                [3] = u9
                [4] = u7
            --]]
            u11:onComplete(function() --[[ Line: 12 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u2
                    [3] = u9
                --]]
                if u11:getValue() == 0 then
                    u11:setGoal(u2.Spring.new(1, {
                        ["dampingRatio"] = 0.75,
                        ["frequency"] = u9.value
                    }))
                end
            end)
            local u13 = u7.activatedSignal:Connect(function(p12) --[[ Line: 20 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u11
                    [3] = u2
                --]]
                u9.value = p12
                u11:setGoal(u2.Spring.new(0, {
                    ["dampingRatio"] = 0.75,
                    ["frequency"] = p12
                }))
            end)
            return function() --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                u13:Disconnect()
            end
        end)
        local v14 = u6("Indicator")
        return u3.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.05, 0.05),
            ["Position"] = u7.position,
            ["Rotation"] = u7.rotation:map(function(p15) --[[ Line: 37 ]]
                return p15 + 90
            end),
            ["ImageTransparency"] = v10,
            ["Image"] = v14.Image,
            ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
            ["ImageRectOffset"] = v14.ImageRectOffset,
            ["ImageRectSize"] = v14.ImageRectSize
        }, { u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end)
}