local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["PigsyUi"] = function(p2) --[[ Name: PigsyUi, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v3 = p2.store.Kit.pigsyResources.coin
        return u1.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.7, 0.1)
        }, { u1.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://10013673573",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0, 0),
                ["BorderColor3"] = Color3.fromRGB(255, 255, 255)
            }), u1.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextStrokeTransparency"] = 0,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Position"] = UDim2.fromScale(0.6, 0.35),
                ["Size"] = UDim2.fromScale(0.15, 0.75),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Font"] = Enum.Font.ArialBold,
                ["Text"] = tostring(v3)
            }) })
    end
}