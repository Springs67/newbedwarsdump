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
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta
return {
    ["EventAppCurrencyPill"] = v10.new(u9)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u9
            [3] = u12
            [4] = u11
            [5] = u8
            [6] = u6
            [7] = u5
            [8] = u7
            [9] = u3
            [10] = u4
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local v18 = u13[u14.Currency]
        local u19, u20 = v16(0)
        local u21 = u9.createRef()
        v17(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u12
                [3] = u14
            --]]
            local u22 = u21:getValue()
            if not u22 then
                return nil
            end
            task.spawn(function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u14
                    [3] = u22
                --]]
                task.wait()
                local v23 = u12
                local v24 = {
                    ["type"] = "SetEventPartial"
                }
                local v25 = {}
                local v26 = u12:getState().Event.currencyGuiLocations
                v26[u14.Currency] = u22.AbsolutePosition
                v25.currencyGuiLocations = v26
                v24.data = v25
                v23:dispatch(v24)
            end)
        end, {})
        local u27 = u9.createRef()
        v17(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u11
                [3] = u8
                [4] = u6
                [5] = u19
                [6] = u14
                [7] = u20
            --]]
            local u28 = u27:getValue()
            if not u28 then
                return nil
            end
            u11(0.5, u8, function(p29) --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u6
                --]]
                local v30 = u28
                local v31 = u6.formatNumberWithCommas
                local v32 = u6.roundNumber
                v30.Text = "<b>" .. v31((tonumber(v32(p29, 0)))) .. "</b>"
            end, u19, u14.CurrAmount)
            u20(u14.CurrAmount)
        end, { u14.CurrAmount })
        local v33 = u9.createFragment
        local v34 = {
            ["CurrencyAmountPill"] = u9.createElement("Frame", {
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["BackgroundColor3"] = Color3.fromHex("#39385A"),
                ["BackgroundTransparency"] = 0.3,
                ["BorderSizePixel"] = 0,
                [u9.Ref] = u21
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
                    ["Image"] = v18.icon
                }, { u9.createElement(u7, {}, { u9.createElement(u3, {
                            ["TextSize"] = 16,
                            ["Text"] = v18.name,
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
                    [u9.Ref] = u27
                })
            })
        }
        return v33(v34)
    end)
}