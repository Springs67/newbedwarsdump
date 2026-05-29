local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["PlayerProfileEmpty"] = v6.new(u5)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
            [4] = u7
        --]]
        local _ = p9.useState
        return u5.createElement(u4, {
            ["LayoutOrder"] = 2,
            ["Size"] = p8.Size
        }, { u5.createElement("Frame", {
                ["BackgroundTransparency"] = 0.7,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundColor3"] = u3.BLACK
            }, { u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.05, 0)
                }), u5.createElement("TextLabel", {
                    ["TextSize"] = 18,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Text"] = p8.Text,
                    ["TextColor3"] = u7.textPrimary,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }) }) })
    end)
}