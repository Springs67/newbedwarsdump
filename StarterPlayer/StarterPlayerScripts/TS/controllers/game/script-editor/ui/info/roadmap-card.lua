local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["RoadmapCard"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local _ = p5.useState
        local v6 = {
            ["BackgroundColor3"] = u2.hexColor(2763567),
            ["Size"] = UDim2.fromScale(1, 1),
            ["LayoutOrder"] = p4.LayoutOrder
        }
        local v7 = {
            u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }),
            u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.608
            }),
            ["RoadmapIcon"] = u3.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.12147505422993492, 0.5),
                ["Size"] = UDim2.fromScale(0.1951219512195122, 0.704),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Image"] = p4.image
            }, { u3.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }),
            ["RoadmapTitle"] = u3.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Position"] = UDim2.fromScale(0.28159645232815966, 0.04),
                ["Size"] = UDim2.fromScale(0.656319290465632, 0.304),
                ["Text"] = p4.title,
                ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                ["TextSize"] = 36 * p4.fontSizeScale,
                ["TextColor3"] = u2.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }),
            ["RoadmapDescription"] = u3.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextWrapped"] = true,
                ["Position"] = UDim2.fromScale(0.28159645232815966, 0.36),
                ["Size"] = UDim2.fromScale(0.656319290465632, 0.64),
                ["Text"] = p4.description,
                ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                ["TextSize"] = 26 * p4.fontSizeScale,
                ["TextColor3"] = u2.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            })
        }
        local v8 = #v7
        local v9
        if p4.released == true then
            local v10 = u3.createFragment
            local v11 = {
                ["ReleasedIndicator"] = u3.createElement("TextLabel", {
                    ["Text"] = "Released",
                    ["BackgroundTransparency"] = 1,
                    ["Position"] = UDim2.fromScale(0.9822616407982262, 0.064),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Size"] = UDim2.fromScale(0.656319290465632, 0.472),
                    ["TextXAlignment"] = Enum.TextXAlignment.Right,
                    ["TextYAlignment"] = Enum.TextYAlignment.Top,
                    ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                    ["TextSize"] = 24 * p4.fontSizeScale,
                    ["TextColor3"] = u2.hexColor(7864161)
                })
            }
            v9 = v10(v11)
        else
            v9 = false
        end
        if v9 then
            v7[v8 + 1] = v9
        end
        return u3.createElement("Frame", v6, v7)
    end)
}