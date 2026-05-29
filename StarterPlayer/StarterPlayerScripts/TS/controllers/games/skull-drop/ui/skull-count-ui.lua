local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["SkullBillBoard"] = v3.new(u2)(function(p5, p6) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local _ = p6.useState
        local v7 = u2.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u4.PIRATE_SKULL_ICON,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v8 = Color3.fromRGB(255, 255, 255)
        if p5.amount > 9 then
            v8 = Color3.fromRGB(255, 0, 0)
        elseif p5.amount > 4 then
            v8 = Color3.fromRGB(252, 135, 0)
        end
        local v9 = u2.createElement
        local v10 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v11 = {}
        local v12 = u2.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["CellSize"] = UDim2.fromScale(0.45, 0.9),
            ["CellPadding"] = UDim2.fromScale(0.02)
        })
        local v13 = u2.createElement
        local v14 = {
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1
        }
        local v15 = p5.amount
        v14.Text = tostring(v15)
        v14.TextColor3 = v8
        v14.Size = UDim2.fromScale(0.95, 0.3)
        v14.Position = UDim2.fromScale(0.5, 0.9)
        v14.AnchorPoint = Vector2.new(0.5, 0.5)
        __set_list(v11, 1, {v12, v7, v13("TextLabel", v14, { u2.createElement("UIStroke", {
        ["Thickness"] = 2
    }), u2.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1
    }) })})
        return v9("Frame", v10, v11)
    end)
}