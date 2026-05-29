local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["StarCollectorDisplay"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local _ = p4.useState
        local v5 = u2.createElement
        local v6 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v7 = {}
        local v8 = u2.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.667
        })
        local v9 = u2.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 2)
        })
        local v10 = u2.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://9871799391",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v11 = u2.createElement
        local v12 = {
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8)
        }
        local v13 = p3.greenStars
        v12.Text = tostring(v13)
        v12.TextColor3 = Color3.fromRGB(255, 255, 255)
        local v14 = v11("TextLabel", v12, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.3
            }) })
        local v15 = u2.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://9871798596",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v16 = u2.createElement
        local v17 = {
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8)
        }
        local v18 = p3.yellowStars
        v17.Text = tostring(v18)
        v17.TextColor3 = Color3.fromRGB(255, 255, 255)
        __set_list(v7, 1, {v8, v9, v10, v14, v15, v16("TextLabel", v17, { u2.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1.3
    }) })})
        return v5("Frame", v6, v7)
    end)
}