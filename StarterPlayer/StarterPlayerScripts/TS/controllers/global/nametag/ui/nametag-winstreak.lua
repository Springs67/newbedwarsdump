local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["NameTagWinStreak"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local _ = p4.useState
        local v5 = {}
        for v6, v7 in p3 do
            v5[v6] = v7
        end
        v5.WinStreak = nil
        local v8 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Visible"] = true,
            ["LayoutOrder"] = 3
        }
        for v9, v10 in v5 do
            v8[v9] = v10
        end
        local v11 = u2.createFragment
        local v12 = {}
        local v13 = u2.createElement
        local v14 = {
            ["WinStreakFire"] = u2.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://7101948108",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["ScaleType"] = Enum.ScaleType.Fit
            })
        }
        local v15 = u2.createElement
        local v16 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 2,
            ["TextStrokeTransparency"] = 0.5,
            ["AutoLocalize"] = false
        }
        local v17 = p3.WinStreak
        v16.Text = tostring(v17)
        v16.AnchorPoint = Vector2.new(0.5, 0)
        v16.Position = UDim2.fromScale(0.5, 0.375)
        v16.Size = UDim2.fromScale(0.8, 0.9)
        v16.TextColor3 = Color3.fromRGB(255, 255, 255)
        v16.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v16.TextXAlignment = Enum.TextXAlignment.Center
        v14.WinStreakValue = v15("TextLabel", v16)
        v12.WinStreakCounter = v13("Frame", v8, v14)
        return v11(v12)
    end)
}