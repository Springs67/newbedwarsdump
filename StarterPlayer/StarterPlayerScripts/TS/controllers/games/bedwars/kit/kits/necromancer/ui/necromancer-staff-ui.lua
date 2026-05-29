local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["NecromancerStaffDisplay"] = v3.new(u2)(function(p5, p6) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local _ = p6.useState
        local v7 = u2.createElement
        local v8 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v9 = {}
        local v10 = u2.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.667
        })
        local v11 = u2.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 2)
        })
        local v12 = u2.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u4.SKULL_VECTOR_ICON
        }, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v13 = u2.createElement
        local v14 = {
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8)
        }
        local v15 = p5.skeletonStacks
        v14.Text = tostring(v15)
        v14.TextColor3 = Color3.fromRGB(255, 255, 255)
        __set_list(v9, 1, {v10, v11, v12, v13("TextLabel", v14, { u2.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1.3
    }) })})
        return v7("Frame", v8, v9)
    end)
}