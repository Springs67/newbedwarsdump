local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Padding
local u6 = v2.StringUtil
local u7 = v2.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils
return {
    ["AfkShopAppCurrencyPill"] = v10.new(u9)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u11
            [3] = u8
            [4] = u6
            [5] = u5
            [6] = u12
            [7] = u7
            [8] = u3
            [9] = u4
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local u17, u18 = v15(0)
        local u19 = u9.createRef()
        v16(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            if not u19:getValue() then
                return nil
            end
        end, {})
        local u20 = u9.createRef()
        v16(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u11
                [3] = u8
                [4] = u6
                [5] = u17
                [6] = u13
                [7] = u18
            --]]
            local u21 = u20:getValue()
            if not u21 then
                return nil
            end
            u11(0.5, u8, function(p22) --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u6
                --]]
                local v23 = u21
                local v24 = u6.formatNumberWithCommas
                local v25 = u6.roundNumber
                v23.Text = "<b>" .. v24((tonumber(v25(p22, 0)))) .. "</b>"
            end, u17, u13.CurrAmount)
            u18(u13.CurrAmount)
        end, { u13.CurrAmount })
        local v26 = u9.createFragment
        local v27 = {
            ["CurrencyAmountPill"] = u9.createElement("Frame", {
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["BackgroundColor3"] = Color3.fromHex("#39385A"),
                ["BackgroundTransparency"] = 0.3,
                ["BorderSizePixel"] = 0,
                [u9.Ref] = u19
            }, {
                u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.5, 0)
                }),
                u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0, 6)
                }),
                u9.createElement(u5, {
                    ["Padding"] = {
                        ["Vertical"] = 5,
                        ["Horizontal"] = 6
                    }
                }),
                u9.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u12.currencyIcon
                }, { u9.createElement(u7, {}, { u9.createElement(u3, {
                            ["TextSize"] = 16,
                            ["Text"] = u12.name,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["Limits"] = Vector2.new(300, 60)
                        }) }) }),
                u9.createElement("TextLabel", {
                    ["Size"] = UDim2.fromScale(0.7, 1),
                    ["Text"] = "<b>0</b>",
                    ["TextColor3"] = u4.WHITE,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["TextXAlignment"] = "Left",
                    ["Font"] = "Roboto",
                    ["BackgroundTransparency"] = 1,
                    [u9.Ref] = u20
                })
            })
        }
        return v26(v27)
    end)
}