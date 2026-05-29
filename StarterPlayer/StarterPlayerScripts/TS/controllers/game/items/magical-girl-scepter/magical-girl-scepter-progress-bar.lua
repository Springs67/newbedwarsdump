local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["MagicalGirlScepterProgressBar"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        local v8 = p7.useEffect
        local u9 = u3.createRef()
        local u10 = u3.createRef()
        local u11 = u3.createRef()
        v8(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u9
                [3] = u10
                [4] = u6
                [5] = u11
            --]]
            u5:Create(u9:getValue(), TweenInfo.new(0.12), {
                ["Size"] = UDim2.fromScale(0.18, 0.1)
            }):Play()
            u5:Create(u10:getValue(), TweenInfo.new(u6.chargeTime, Enum.EasingStyle.Linear), {
                ["Size"] = UDim2.fromScale(1, 1)
            }):Play()
            if u6.noBar then
                u5:Create(u11:getValue(), TweenInfo.new(u6.chargeTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    ["TextTransparency"] = 1
                }):Play()
            end
        end, {})
        return u3.createFragment({ u3.createElement("Frame", {
                [u3.Ref] = u9,
                ["Size"] = UDim2.fromScale(0, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.7),
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["BackgroundTransparency"] = u6.noBar and 1 or 0.7,
                ["BorderSizePixel"] = 0
            }, { u3.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 10.95890410958904,
                    ["DominantAxis"] = "Height"
                }), u3.createElement("Frame", {
                    [u3.Ref] = u10,
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = u6.noBar and 1 or 0
                }, { u3.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new(Color3.fromRGB(112, 219, 255), u2.darken(Color3.fromRGB(112, 219, 255), 0.93))
                    }) }) }) })
    end)
}