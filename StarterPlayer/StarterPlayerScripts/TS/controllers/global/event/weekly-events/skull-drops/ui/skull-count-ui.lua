local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["SkullCountDisplay"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local _ = p4.useState
        local v5 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v6 = { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.667
            }), u2.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 2)
            }) }
        local v7 = #v6
        local v8 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v9 = p3.icon
        v8.Image = v9 == nil and "rbxassetid://15186577197" or v9
        v8.BackgroundTransparency = 1
        v6[v7 + 1] = u2.createElement("ImageLabel", v8, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v10 = v7 + 2
        local v11 = u2.createElement
        local v12 = {
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8)
        }
        local v13 = p3.count
        v12.Text = tostring(v13)
        v12.TextColor3 = Color3.fromRGB(255, 255, 255)
        v6[v10] = v11("TextLabel", v12, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.3
            }) })
        return u2.createElement("Frame", v5, v6)
    end)
}