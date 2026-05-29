local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["SquareImageButton"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local _ = p5.useState
        local v6 = {}
        for v7, v8 in p4 do
            v6[v7] = v8
        end
        v6.Image = nil
        v6.OnClick = nil
        local v9 = {
            ["ImageTransparency"] = 1,
            ["BackgroundColor3"] = u2.BLACK,
            ["BorderSizePixel"] = 0,
            [u3.Event.Activated] = p4.OnClick
        }
        for v10, v11 in v6 do
            v9[v10] = v11
        end
        return u3.createElement("ImageButton", v9, { u3.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundColor3"] = u2.BLACK
            }, { u3.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }), u3.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
                }) }), u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }), u3.createElement("ImageLabel", {
                ["LayoutOrder"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.6, 0.6),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = p4.Image,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u3.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }) })
    end)
}