local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["LoreReaderToolbar"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u5
        --]]
        local _ = p7.useState
        local v8 = u3.createElement
        local v9 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = p6.Size,
            ["BackgroundColor3"] = u2.hexColor(3092550)
        }
        local v10 = {
            ["GoBackIcon"] = u3.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(0.75, 0.75),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.new(0, 15, 0.5, 0),
                ["Image"] = u5.ARROW_LEFT,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ImageTransparency"] = 0.2,
                ["BackgroundTransparency"] = 1,
                [u3.Event.Activated] = p6.OnBack
            })
        }
        return v8("Frame", v9, v10)
    end)
}