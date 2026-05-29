local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["BridgeDuelTouchdownBillboardUI"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        return u3.createElement(u2, {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0, 0)
        }, { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0.02, 0)
            }), u3.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["TextStrokeTransparency"] = 0,
                ["Text"] = "<b>" .. p4.team.name .. " Goal</b>",
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["Font"] = Enum.Font.JosefinSans,
                ["TextColor3"] = p4.team.color,
                ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
            }), u3.createElement("TextLabel", {
                ["Text"] = "<b>Fall in to score!</b>",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["TextStrokeTransparency"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.4),
                ["Font"] = Enum.Font.JosefinSans,
                ["TextColor3"] = Color3.fromRGB(245, 245, 220),
                ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
            }) })
    end)
}