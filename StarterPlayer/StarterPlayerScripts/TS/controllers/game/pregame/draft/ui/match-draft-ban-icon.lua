local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
return {
    ["MatchDraftBanIcon"] = v6.new(u5)(function(p8) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u7
            [4] = u3
        --]]
        local v9 = {}
        for v10, v11 in p8 do
            v9[v10] = v11
        end
        v9.Kit = nil
        v9.imageLabelRef = nil
        if not p8.Kit then
            return u5.createFragment()
        end
        local v12 = {}
        for v13, v14 in v9 do
            v12[v13] = v14
        end
        local v15 = u5.createElement
        local v16 = u4
        local v17 = {
            u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }),
            u5.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 5),
                ["PaddingRight"] = UDim.new(0, 5)
            }),
            ["KitImage"] = u5.createElement("ImageLabel", {
                ["Image"] = u7[p8.Kit].renderImage,
                ["BorderSizePixel"] = 0,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["BackgroundTransparency"] = 1,
                ["BackgroundColor3"] = u3.BLACK,
                ["ImageTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, -1),
                [u5.Ref] = p8.imageLabelRef
            }, { u5.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }), u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }) })
        }
        return v15(v16, v12, v17)
    end)
}