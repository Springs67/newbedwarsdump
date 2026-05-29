local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-spring", "src").useSpring
return {
    ["EnemyHealthbar"] = v3.new(u2)(function(u5, p6) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
        --]]
        local u7 = p6.useMemo(function() --[[ Line: 7 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            return u5.health / u5.maxHealth
        end, { u5.health, u5.maxHealth })
        local v8 = p6.useMemo(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            return 1 / u7
        end, { u7 })
        local v9 = u4
        local v10 = {
            ["config"] = {
                ["tension"] = 440,
                ["friction"] = 26,
                ["mass"] = 0.6
            },
            ["to"] = {
                ["size1"] = UDim2.fromScale(u7, 1),
                ["size2"] = UDim2.fromScale(v8, 1)
            }
        }
        local v11 = v9(p6, v10, { u7, v8 })
        local v12 = u2.createElement
        local v13 = {
            ["BackgroundTransparency"] = 0.7,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v14 = {}
        local v15 = u2.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 7.138613861386139
        })
        local v16 = u2.createElement("UIStroke", {
            ["Thickness"] = 4,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        })
        local v17 = u2.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        })
        local v18 = u2.createElement("UISizeConstraint", {
            ["MaxSize"] = Vector2.new(150, 150)
        })
        local v19 = u2.createElement("Frame", {
            ["ClipsDescendants"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = v11.size1,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5)
        }, { u2.createElement("Frame", {
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Size"] = v11.size2,
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(238, 114, 0)
            }, { u2.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) }) })
        local v20 = u2.createElement
        local v21 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["Font"] = "RobotoCondensed",
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v22 = u5.health
        local v23 = math.round(v22)
        local v24 = tostring(v23)
        local v25 = u5.maxHealth
        local v26 = math.round(v25)
        v21.Text = "<b>" .. v24 .. "/" .. tostring(v26) .. "</b>"
        v21.TextColor3 = Color3.fromRGB(255, 255, 255)
        __set_list(v14, 1, {v15, v16, v17, v18, v19, v20("TextLabel", v21)})
        return v12("Frame", v13, v14)
    end)
}