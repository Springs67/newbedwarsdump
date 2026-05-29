local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["BloodAssassinFrame"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local _ = p5.useState
        local v6 = {
            ["AutoButtonColor"] = false,
            ["Active"] = true,
            ["Modal"] = true,
            ["Size"] = p4.Size,
            ["Position"] = p4.Position,
            ["AnchorPoint"] = p4.AnchorPoint
        }
        local v7 = { u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            }), u3.createElement("UIGradient", {
                ["Rotation"] = 25,
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.25), NumberSequenceKeypoint.new(1, 0.7) }),
                ["Color"] = ColorSequence.new(u2.hexColor(1910065))
            }), u3.createElement("Frame", {
                ["BackgroundTransparency"] = 0.7,
                ["Size"] = UDim2.new(1, 0, 0, p4.HeaderSizePixels),
                ["BackgroundColor3"] = u2.BLACK
            }, { u3.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u3.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Text"] = p4.Title,
                    ["Size"] = UDim2.fromScale(1, 0.65),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["TextColor3"] = u2.hexColor(16729156),
                    ["Font"] = Enum.Font.ArialBold
                }) }) }
        local v8 = #v7
        local v9 = {
            ["Image"] = "rbxassetid://12504906446",
            ["BackgroundTransparency"] = 1,
            ["ImageTransparency"] = 0.9,
            ["Size"] = UDim2.new(1, 0, 1, -p4.HeaderSizePixels),
            ["Position"] = UDim2.fromOffset(0, p4.HeaderSizePixels)
        }
        local v10 = { u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local v11 = #v10
        local v12 = p4[u3.Children]
        if v12 then
            for v13, v14 in v12 do
                if type(v13) == "number" then
                    v10[v11 + v13] = v14
                else
                    v10[v13] = v14
                end
            end
        end
        v7[v8 + 1] = u3.createElement("ImageLabel", v9, v10)
        return u3.createElement("ImageButton", v6, v7)
    end)
}