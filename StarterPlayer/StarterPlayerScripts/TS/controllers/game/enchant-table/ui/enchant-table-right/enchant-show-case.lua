local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u7 = v1.import(script, script.Parent, "enchant-rune-wheel").EnchantRuneWheel
return {
    ["EnchantShowCase"] = v4.new(u3)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u5
            [4] = u2
            [5] = u7
        --]]
        local v10 = p9.useEffect
        local v11 = u6.ENCHANTING_TABLE
        local u12 = u3.createRef()
        v10(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u5
            --]]
            local v13 = u12:getValue()
            if v13 then
                u5:Create(v13, TweenInfo.new(1.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {
                    ["Position"] = UDim2.fromScale(0.5, 0.475)
                }):Play()
            end
        end, {})
        local v14 = u3.createElement
        local v15 = u2
        local v16 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = p8.Size,
            ["LayoutOrder"] = p8.LayoutOrder
        }
        local v17 = {
            u3.createElement(u7, {
                ["RuneTransparency"] = 0.4,
                ["Color"] = p8.ThemeColor,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }),
            ["EnchantTableRender"] = u3.createElement("ImageLabel", {
                ["Image"] = v11,
                ["Size"] = UDim2.fromScale(0.95, 0.95),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.525),
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                [u3.Ref] = u12
            })
        }
        return v14(v15, v16, v17)
    end)
}