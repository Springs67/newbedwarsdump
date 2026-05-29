local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["WorldToolPositionHUD"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, _) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local v5 = u3.createFragment
        local v6 = {}
        local v7 = u3.createElement
        local v8 = {}
        local v9 = u3.createElement
        local v10 = {
            ["BackgroundTransparency"] = 0.35,
            ["Size"] = UDim2.fromScale(0.1, 0.1),
            ["Position"] = UDim2.fromScale(1, 0.8),
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v11 = {
            u3.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.02, 0),
                ["PaddingRight"] = UDim.new(0.02, 0)
            }),
            u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            }),
            ["Label"] = u3.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Left",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Text"] = p4.Label,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["Position"] = UDim2.fromScale(0, 0),
                ["AnchorPoint"] = Vector2.new(0, 0)
            }, { u3.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) })
        }
        local v12 = u3.createElement
        local v13 = {
            ["BackgroundTransparency"] = 1,
            ["TextXAlignment"] = "Left",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v14 = u2.richTextColor(p4.Pos1Color)
        local v15 = p4.Pos1 or "Unset"
        v13.Text = "<font color=\"" .. v14 .. "\">POS1:</font> (" .. tostring(v15) .. ")"
        v13.Font = Enum.Font.Arial
        v13.Size = UDim2.fromScale(1, 0.25)
        v13.Position = UDim2.fromScale(0, 0.25)
        v13.AnchorPoint = Vector2.new(0, 0)
        v11.Pos1Display = v12("TextLabel", v13, { u3.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        local v16 = u3.createElement
        local v17 = {
            ["BackgroundTransparency"] = 1,
            ["TextXAlignment"] = "Left",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v18 = u2.richTextColor(p4.Pos2Color)
        local v19 = p4.Pos2 or "Unset"
        v17.Text = "<font color=\"" .. v18 .. "\">POS2:</font> (" .. tostring(v19) .. ")"
        v17.Font = Enum.Font.Arial
        v17.Size = UDim2.fromScale(1, 0.25)
        v17.Position = UDim2.fromScale(0, 0.5)
        v17.AnchorPoint = Vector2.new(0, 0)
        v11.Pos2Display = v16("TextLabel", v17, { u3.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        local v20 = u3.createElement
        local v21 = {
            ["BackgroundTransparency"] = 1,
            ["TextXAlignment"] = "Left",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v22 = u2.richTextColor(p4.SizeColor)
        local v23 = p4.Size or "Unset"
        v21.Text = "<font color=\"" .. v22 .. "\">SIZE:</font> (" .. tostring(v23) .. ")"
        v21.Font = Enum.Font.Arial
        v21.Size = UDim2.fromScale(1, 0.25)
        v21.Position = UDim2.fromScale(0, 0.75)
        v21.AnchorPoint = Vector2.new(0, 0)
        v11.SizeDisplay = v20("TextLabel", v21, { u3.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        v8.WorldEditPositionFrame = v9("Frame", v10, v11)
        v6.WorldEditPositionGUI = v7("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, v8)
        return v5(v6)
    end)
}