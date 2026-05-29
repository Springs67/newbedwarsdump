local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["RageBladeWinCount"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v4 = u2.createFragment
        local v5 = {}
        local v6 = u2.createElement
        local v7 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(1.5, 0.4, 0),
            ["Size"] = UDim2.fromScale(6, 3),
            ["Adornee"] = p3.Adornee
        }
        local v8 = {}
        local v9 = u2.createElement
        local v10 = {
            ["TextXAlignment"] = "Center",
            ["TextYAlignment"] = "Center",
            ["TextStrokeTransparency"] = 0,
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v11 = p3.WinCount
        v10.Text = "\240\159\148\165" .. tostring(v11)
        v10.Font = Enum.Font.Roboto
        v10.Size = UDim2.fromScale(0.5, 0.5)
        v10.Position = UDim2.fromScale(0.5, 0.5)
        v10.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        v10.TextColor3 = Color3.fromRGB(237, 82, 26)
        v8.WinCount = v9("TextLabel", v10)
        v5.RageBladeEmoteGui = v6("BillboardGui", v7, v8)
        return v4(v5)
    end)
}