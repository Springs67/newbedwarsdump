local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["BedCoinShowcase"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
        --]]
        local _ = p7.useEffect
        local v8 = {
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["Image"] = u5.BED_COIN_ICON,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = p6.Size or UDim2.fromScale(1, 1),
            ["ImageTransparency"] = p6.Transparency,
            ["LayoutOrder"] = p6.LayoutOrder,
            ["ZIndex"] = p6.ZIndex
        }
        local v9 = {}
        local v10 = #v9
        local v11 = p6.showText
        if v11 then
            local v12 = u3.createFragment
            local v13 = {}
            local v14 = u3.createElement
            local v15 = {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextStrokeTransparency"] = 0.7
            }
            local v16 = p6.amount
            v15.Text = tostring(v16)
            v15.AnchorPoint = Vector2.new(1, 1)
            v15.Position = UDim2.fromScale(1, 1)
            v15.Size = UDim2.fromScale(1, 0.25)
            v15.Font = Enum.Font.LuckiestGuy
            v15.TextColor3 = u2.WHITE
            v15.TextTransparency = p6.Transparency
            v15.ZIndex = p6.ZIndex
            v13.BedCoinAmount = v14("TextLabel", v15)
            v11 = v12(v13)
        end
        if v11 then
            v9[v10 + 1] = v11
        end
        return u3.createFragment({
            ["RewardShowcase"] = u3.createElement("ImageLabel", v8, v9)
        })
    end)
}