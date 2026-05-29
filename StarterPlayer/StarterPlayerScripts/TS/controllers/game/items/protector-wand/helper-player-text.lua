local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["HelperPlayerText"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(p6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
        --]]
        local v8 = p7.useEffect
        local v9 = u5.createRef()
        v8(function() --[[ Line: 11 ]] end, {})
        return u5.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u5.createElement(u4, {
                ["Position"] = UDim2.fromScale(0.5, 0.6),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.5, 0.35),
                [u5.Ref] = v9
            }, { u5.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }), u5.createElement("Frame", {
                    ["AutomaticSize"] = "X",
                    ["BackgroundTransparency"] = 0.3,
                    ["ZIndex"] = 3,
                    ["Size"] = UDim2.fromScale(0.75, 0.18),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.85),
                    ["BackgroundColor3"] = u3.BLACK
                }, { u5.createElement("UIPadding", {
                        ["PaddingLeft"] = UDim.new(0.005, 0),
                        ["PaddingRight"] = UDim.new(0.005, 0)
                    }), u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 8)
                    }), u5.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["ZIndex"] = 4,
                        ["Size"] = UDim2.fromScale(1, 0.8),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Font"] = Enum.Font.FredokaOne,
                        ["Text"] = p6.HelperText,
                        ["TextColor3"] = u3.WHITE
                    }, { u5.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 16
                        }) }) }) }) })
    end)
}