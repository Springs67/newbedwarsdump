local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["FisherMinigameGameOver"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local _ = p5.useState
        local v6 = string.split(p4.fishType, "_")
        local v7 = #v6
        local v8 = v6[v7]
        v6[v7] = nil
        local v9 = u3.createFragment
        local v10 = {}
        local v11 = u3.createElement
        local v12 = "TextLabel"
        local v13 = {
            ["AutomaticSize"] = "X",
            ["BackgroundTransparency"] = 0.6,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0, 0.1),
            ["BackgroundColor3"] = u2.BLACK,
            ["TextColor3"] = u2.WHITE,
            ["Font"] = Enum.Font.Roboto
        }
        local v14
        if p4.win then
            v14 = "You caught a <b>" .. tostring(v8) .. " fish</b>!"
        else
            v14 = "The <b>" .. tostring(v8) .. " fish</b> got away"
        end
        v13.Text = v14
        v10.GameOverScreen = v11(v12, v13, { u3.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0),
                ["PaddingLeft"] = UDim.new(0, 6),
                ["PaddingRight"] = UDim.new(0, 6)
            }), u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }), u3.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 20
            }) })
        return v9(v10)
    end)
}