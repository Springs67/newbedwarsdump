local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["IngredientBox"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local _ = p5.useState
        local v6 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.3, 1)
        }
        local v7 = { u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u3.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = u2.WHITE
            }), u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }) }
        local v8 = #v7
        local v9
        if p4.Image == nil then
            v9 = false
        else
            v9 = u3.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = p4.Image,
                ["Size"] = UDim2.fromScale(0.8, 0.8)
            })
        end
        if v9 then
            v7[v8 + 1] = v9
        end
        local v10 = #v7
        local v11
        if p4.Amount == nil then
            v11 = false
        else
            local v12 = u3.createElement
            local v13 = {
                ["SizeConstraint"] = "RelativeYY",
                ["TextXAlignment"] = "Right",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["AnchorPoint"] = Vector2.new(1, 1),
                ["Position"] = UDim2.fromScale(0.9, 0.95)
            }
            local v14 = p4.Amount
            v13.Text = "<b>" .. tostring(v14) .. "</b>"
            v13.TextColor3 = u2.WHITE
            v11 = v12("TextLabel", v13)
        end
        if v11 then
            v7[v10 + 1] = v11
        end
        return u3.createFragment({
            ["IngredientBox"] = u3.createElement("Frame", v6, v7)
        })
    end)
}