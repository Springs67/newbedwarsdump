local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-util").LassoWarsUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
return {
    ["LassoWarsUpgradeCard"] = v9.new(u8)(function(u13, p14) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u5
            [4] = u8
            [5] = u7
            [6] = u6
            [7] = u3
            [8] = u4
            [9] = u12
        --]]
        local v15 = p14.useState
        local _ = p14.useEffect
        local v16, u17 = v15(u11.getCurrentUpgradeLevelForPlayer(u10.LocalPlayer, u13.upgradeType))
        local v18 = u13.upgradeMeta.upgrades[v16 + 1 + 1]
        local v19 = false
        local v20
        if v18 == nil then
            v19 = true
            v20 = nil
        else
            local v21 = v18.price
            v20 = tostring(v21)
        end
        local v22 = #u13.upgradeMeta.upgrades - 1
        local v23 = u5.isSmallScreen()
        local v24 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = u13.cardSize,
            ["Position"] = UDim2.fromScale(0, 0),
            ["LayoutOrder"] = u13.LayoutOrder
        }
        local v25 = {}
        local _ = #v25
        local v27 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.85, 1),
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = Color3.fromHex("#D9D7C7"),
            ["ZIndex"] = 1,
            [u8.Event.MouseButton1Click] = function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u13
                    [3] = u17
                --]]
                local v26 = u7.Controllers.LassoWarsController:requestLassoUpgrade(u13.upgradeType)
                if v26 ~= 0 and (v26 == v26 and v26) then
                    u17(v26)
                end
            end
        }
        local v28 = {
            u8.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Color"] = Color3.fromHex("#AC714A")
            }),
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            ["UpgradeIcon"] = u8.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 4,
                ["Size"] = UDim2.fromScale(0.6, 0.3),
                ["Position"] = UDim2.fromScale(0.5, 0.25),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = u13.upgradeMeta.icon,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u8.createElement(u6, {}, { u8.createElement(u3, {
                        ["TextSize"] = 16,
                        ["Text"] = u13.upgradeMeta.displayName,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }), u8.createElement(u3, {
                        ["TextSize"] = 14,
                        ["Text"] = u13.upgradeMeta.description,
                        ["Font"] = Enum.Font.SourceSans,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }) }),
            ["OuterHexagonBorder"] = u8.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://10899316316",
                ["Rotation"] = 90,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(0.6, 0.3),
                ["Position"] = UDim2.fromScale(0.5, 0.25),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ImageColor3"] = Color3.fromHex("#AC714A")
            }, {
                u8.createElement("UIGradient", {
                    ["Rotation"] = 0,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(Color3.fromHex("#AC714A"), 0.9)), ColorSequenceKeypoint.new(1, u4.darken(Color3.fromHex("#AC714A"), 0.9)) })
                }),
                ["InnerHexagonBorder"] = u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = "rbxassetid://10899316316",
                    ["ZIndex"] = 3,
                    ["Size"] = UDim2.fromScale(0.715, 0.75),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["ImageColor3"] = Color3.fromHex("#3A160E")
                }, { u8.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(Color3.fromHex("#3A160E"), 0.9)), ColorSequenceKeypoint.new(1, u4.darken(Color3.fromHex("#3A160E"), 0.9)) })
                    }) })
            })
        }
        local v29 = u8.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextStrokeTransparency"] = 0.2,
            ["ZIndex"] = 10,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.48),
            ["Size"] = UDim2.fromScale(0.8, 0.2),
            ["Text"] = u13.upgradeMeta.displayName,
            ["TextSize"] = v23 and 14 or 20,
            ["TextColor3"] = u4.WHITE,
            ["Font"] = Enum.Font.SourceSansBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
        local v30 = u8.createElement
        local v31 = {
            ["BackgroundTransparency"] = 0,
            ["ZIndex"] = 5,
            ["Size"] = UDim2.fromScale(0.8, 0.15),
            ["Position"] = UDim2.fromScale(0.5, 0.66),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromHex("#AC714A")
        }
        local v32 = {
            u8.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Color"] = Color3.fromHex("#3A160E")
            }),
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            ["UpgradeLevelText"] = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextStrokeTransparency"] = 0.2,
                ["ZIndex"] = 6,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.8, 1),
                ["Text"] = tostring(v16) .. " / " .. tostring(v22),
                ["TextSize"] = v23 and 14 or 20,
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        }
        __set_list(v28, 3, {v29, v30("Frame", v31, v32)})
        local _ = #v28
        local v33 = {
            ["BackgroundTransparency"] = 0,
            ["ZIndex"] = 5,
            ["Size"] = UDim2.fromScale(0.6, 0.15),
            ["BackgroundColor3"] = Color3.fromHex("#178649"),
            ["Position"] = UDim2.fromScale(0.5, 0.88),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v34 = { u8.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Color"] = Color3.fromHex("#3A160E")
            }), u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 3)
            }) }
        local v35 = #v34
        local v36 = not v19
        if v36 then
            v36 = u8.createFragment({
                ["CoinIcon"] = u8.createElement("ImageLabel", {
                    ["LayoutOrder"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 6,
                    ["Size"] = UDim2.fromScale(0.3, 1),
                    ["Image"] = u12(u11.LASSO_WARS_COIN_ITEM).image,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            })
        end
        if v36 then
            v34[v35 + 1] = v36
        end
        local v37 = #v34
        local v38 = not v19
        if v38 then
            v38 = u8.createFragment({
                ["UpgradePrice"] = u8.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextStrokeTransparency"] = 0.2,
                    ["ZIndex"] = 6,
                    ["LayoutOrder"] = 2,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.3, 1),
                    ["Text"] = v20,
                    ["TextSize"] = v23 and 14 or 20,
                    ["TextColor3"] = Color3.fromHex("#DFCA3A"),
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            })
        end
        if v38 then
            v34[v37 + 1] = v38
        end
        local v39 = #v34
        if v19 then
            v19 = u8.createFragment({
                ["UpgradePrice"] = u8.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Text"] = "MAXED",
                    ["TextStrokeTransparency"] = 0.2,
                    ["ZIndex"] = 6,
                    ["LayoutOrder"] = 2,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextSize"] = v23 and 14 or 20,
                    ["TextColor3"] = Color3.fromHex("#DFCA3A"),
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            })
        end
        if v19 then
            v34[v39 + 1] = v19
        end
        v28.ItemPuchaseButton = u8.createElement("Frame", v33, v34)
        v25.InnerUpgradeFrame = u8.createElement("ImageButton", v27, v28)
        return u8.createFragment({
            ["OuterUpgradeFrame"] = u8.createElement("Frame", v24, v25)
        })
    end)
}