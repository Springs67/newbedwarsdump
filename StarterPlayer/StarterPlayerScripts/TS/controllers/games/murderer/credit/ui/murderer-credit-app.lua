local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v20 = v6.new(u5)(function(_, p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u2
        [4] = u3
    --]]
    local v9 = p8.useState
    local v10 = p8.useEffect
    local v11, u12 = v9(12)
    local u13 = u5.createRef()
    v10(function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u4
            [3] = u12
        --]]
        local u14 = u13:getValue()
        if not u14 then
            return nil
        end
        local u15 = u4.new()
        u15:GiveTask(u14:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u12
            --]]
            u12(12 * (u14.AbsoluteSize.X / 357))
        end))
        u12(12 * (u14.AbsoluteSize.X / 357))
        return function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            u15:DoCleaning()
        end
    end, {})
    local v16 = u5.createFragment
    local v17 = {}
    local v18 = u5.createElement
    local v19 = {
        ["CreditContainer"] = u5.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.4, 0.125),
            ["Position"] = UDim2.fromScale(0.5, 0.72),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["BackgroundColor3"] = u2.hexColor(11512224)
        }, {
            u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u5.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://12740963468",
                ["LayoutOrder"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.19, 1)
            }, { u5.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }), u5.createElement("ImageButton", {
                    ["Position"] = UDim2.fromScale(0.5, 0.71),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["BackgroundTransparency"] = 0.33,
                    ["Size"] = UDim2.fromScale(0.65, 0.21),
                    ["BorderSizePixel"] = 0,
                    ["BackgroundColor3"] = u2.hexColor(5329233),
                    [u5.Event.MouseButton1Click] = function() --[[ Line: 63 ]]
                        --[[
                        Upvalues:
                            [1] = u3
                        --]]
                        u3.Controllers.MurdererCreditController:teleportToMurderMystery2()
                    end
                }, { u5.createElement("UIStroke", {
                        ["Thickness"] = 1,
                        ["Color"] = u2.WHITE
                    }), u5.createElement("TextLabel", {
                        ["Text"] = "<b>PLAY</b>",
                        ["BackgroundTransparency"] = 1,
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0.8, 0.5),
                        ["TextColor3"] = u2.WHITE,
                        ["Font"] = Enum.Font.Roboto
                    }) }) }),
            u5.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 2,
                ["BackgroundColor3"] = u2.WHITE,
                ["Size"] = UDim2.fromScale(0.8, 1)
            }, { u5.createElement("UIGradient", {
                    ["Color"] = ColorSequence.new(u2.hexColor(9242728), u2.hexColor(16738041)),
                    ["Transparency"] = NumberSequence.new(0.35, 1)
                }), u5.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Color"] = u2.WHITE
                }, { u5.createElement("UIGradient", {
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u2.hexColor(2415599)), ColorSequenceKeypoint.new(0.6, u2.hexColor(16711818)), ColorSequenceKeypoint.new(1, u2.hexColor(16711818)) }),
                        ["Transparency"] = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.01, 0),
                            NumberSequenceKeypoint.new(0.6, 0),
                            NumberSequenceKeypoint.new(1, 1)
                        })
                    }) }), u5.createElement("TextLabel", {
                    [u5.Ref] = u13,
                    ["Size"] = UDim2.fromScale(0.78, 0.8),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["BackgroundTransparency"] = 1,
                    ["Position"] = UDim2.fromScale(0.025, 0.5),
                    ["TextColor3"] = u2.WHITE,
                    ["Text"] = "This limited mode was inspired by <b>Murder Mystery 2</b>!",
                    ["RichText"] = true,
                    ["TextSize"] = v11,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextWrapped"] = true
                }) }),
            u5.createElement("Frame", {}, { u5.createElement("UIGradient") })
        })
    }
    v17.MurdererCredit = v18("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 9
    }, v19)
    return v16(v17)
end)
return {
    ["MurdererCreditApp"] = v7.connect(function(_, p21) --[[ Line: 125 ]]
        local v22 = {}
        for v23, v24 in p21 do
            v22[v23] = v24
        end
        return v22
    end)(v20)
}