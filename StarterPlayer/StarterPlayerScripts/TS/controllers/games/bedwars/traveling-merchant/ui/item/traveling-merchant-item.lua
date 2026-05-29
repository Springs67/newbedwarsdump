local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-meta").MerchantItemCategory
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-util").TravelingMerchantUtil
local u11 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
return {
    ["TravelingMerchantItemPopup"] = v4.new(u3)(function(u12, p13) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u3
            [4] = u2
            [5] = u9
            [6] = u5
            [7] = u11
            [8] = u6
            [9] = u8
        --]]
        local v14 = p13.useEffect
        local v15 = u7(u12.merchantItem.item)
        local v16 = u7(u12.merchantItem.purchaseCurrency)
        local u17 = u10:getStarCountByRarity(u12.merchantItem.rarity)
        local v18 = u10:getRarityColor(u12.merchantItem.rarity)
        local u19 = u3.createRef()
        local u20 = u2.new()
        local u21 = u3.createRef()
        local u22 = u12.merchantItem.category == u9.ITEM and true or u12.merchantItem.category == u9.DISCOUNT
        v14(function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u21
                [3] = u5
                [4] = u11
                [5] = u20
            --]]
            if u22 then
                local v23 = u21:getValue()
                if not v23 then
                    return nil
                end
                local v24 = u5:Create(v23, u11, {
                    ["Size"] = v23.Size + UDim2.fromScale(0.15, 0.15)
                })
                v24:Play()
                u20:GiveTask(v24)
            end
            return function() --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20:DoCleaning()
            end
        end)
        v14(function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u6
                [3] = u12
            --]]
            local v25 = u19:getValue()
            if not v25 then
                return nil
            end
            u6.TravelingMerchantBillboardMounted:fire(u12.merchantItem, v25)
            return function() --[[ Line: 63 ]] end
        end)
        local v26 = {
            ["Size"] = UDim2.fromScale(4, 5),
            ["StudsOffset"] = Vector3.new(0, 4, 0),
            [u3.Ref] = u19,
            ["AlwaysOnTop"] = true,
            ["Enabled"] = false,
            ["ResetOnSpawn"] = false,
            ["Adornee"] = u12.merchantItemInstance
        }
        local v27 = {}
        local _ = #v27
        local v28 = {
            ["Image"] = "rbxassetid://10667281451",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["ImageColor3"] = v18
        }
        local v29 = {}
        local _ = #v29
        local v30 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.6),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.7),
            ["BackgroundColor3"] = Color3.fromRGB(255, 0, 0)
        }
        local v31 = {}
        local v32 = #v31
        local v33 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["Size"] = UDim2.fromScale(1, 0.175)
        }
        local v34 = {}
        local _ = #v34
        local v35 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(0.015, 0),
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v36 = {}
        local v37 = #v36
        for v42, v43 in (function() --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u3
            --]]
            local v38 = false
            local v39 = 0
            local v40 = {}
            while true do
                if v38 then
                    v39 = v39 + 1
                else
                    v38 = true
                end
                if v39 >= u17 then
                    return v40
                end
                local v41 = u3.createElement("ImageLabel", {
                    ["Image"] = "rbxassetid://13406746654",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["Size"] = UDim2.fromScale(0.25, 1)
                }, { u3.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1.03
                    }) })
                table.insert(v40, v41)
            end
        end)() do
            v36[v37 + v42] = v43
        end
        v36[#v36 + 1] = u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["Padding"] = UDim.new(0, 5)
        })
        v34.RankContainer = u3.createElement("Frame", v35, v36)
        v34.NameContainer = u3.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(0.4, 0),
            ["Size"] = UDim2.fromScale(0.6, 1)
        }, { u3.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = Enum.Font.RobotoMono,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.525, 0.5),
                ["Size"] = UDim2.fromScale(1, 0.85),
                ["Text"] = not u22 and "TEAM BUFF" or "<b>" .. string.upper(v15.displayName) .. "</b>",
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }) })
        v31.RankNameContainer = u3.createElement("Frame", v33, v34)
        if u22 then
            local v44 = u3.createFragment
            local v45 = {}
            local v46 = u3.createElement
            local v47 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0.175),
                ["Size"] = UDim2.fromScale(1, 0.575)
            }
            local v48 = {}
            local v49 = u3.createElement
            local v50 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0.7,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.85, 0.85),
                ["BackgroundColor3"] = u8.Gray
            }
            local v51 = {
                ["ImageIcon"] = u3.createElement("ImageLabel", {
                    [u3.Ref] = u21,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.95, 0.95),
                    ["Image"] = v15.image
                }, { u3.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            }
            local v52 = u3.createElement
            local v53 = {
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true
            }
            local v54 = u12.merchantItem.quantity
            v53.Text = "<b>x" .. tostring(v54) .. "</b>"
            v53.TextColor3 = Color3.fromRGB(255, 255, 255)
            v53.Font = Enum.Font.RobotoMono
            v53.AnchorPoint = Vector2.new(1, 1)
            v53.Position = UDim2.fromScale(1, 1)
            v53.Size = UDim2.fromScale(0.25, 0.25)
            v51.ItemQuantity = v52("TextLabel", v53)
            __set_list(v51, 1, {u3.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0, 8)
}), u3.createElement("UIStroke", {
    ["Thickness"] = 1,
    ["Color"] = Color3.fromRGB(255, 255, 255)
})})
            v48.ItemFrame = v49("Frame", v50, v51)
            v45.ItemContainer = v46("Frame", v47, v48)
            u22 = v44(v45)
        end
        if u22 then
            v31[v32 + 1] = u22
        end
        local v55 = #v31
        local v56 = u12.merchantItem.category == u9.BUFF
        if v56 then
            local v57 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0.175),
                ["Size"] = UDim2.fromScale(1, 0.575)
            }
            local v58 = {}
            local _ = #v58
            local v59 = {
                ["RichText"] = true
            }
            local v60 = u10:getShopItemBuffDescription(u12.merchantItem.item)
            v59.Text = v60 == nil and "A buff will be applied to your team." or v60
            v59.TextColor3 = Color3.fromRGB(255, 255, 255)
            v59.Font = Enum.Font.RobotoMono
            v59.AnchorPoint = Vector2.new(0.5, 0.5)
            v59.Position = UDim2.fromScale(0.5, 0.5)
            v59.Size = UDim2.fromScale(0.9, 0.8)
            v59.BackgroundTransparency = 1
            v59.BorderSizePixel = 0
            v59.TextScaled = true
            v58.ItemQuantity = u3.createElement("TextLabel", v59)
            v56 = u3.createFragment({
                ["BuffContainer"] = u3.createElement("Frame", v57, v58)
            })
        end
        if v56 then
            v31[v55 + 1] = v56
        end
        local _ = #v31
        v31.CostPrefix = u3.createElement("TextLabel", {
            ["RichText"] = true,
            ["Text"] = "<b>Cost</b>",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextSize"] = 32,
            ["TextScaled"] = true,
            ["TextWrap"] = false,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Font"] = Enum.Font.RobotoMono,
            ["Position"] = UDim2.fromScale(0.01, 0.735),
            ["Size"] = UDim2.fromScale(0.4, 0.25)
        })
        local v61 = u3.createElement
        local v62 = {
            ["BackgroundTransparency"] = 0.7,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.67, 0.765),
            ["Size"] = UDim2.fromScale(0.5, 0.2),
            ["BackgroundColor3"] = u8.Gray
        }
        local v63 = {
            ["CurrencyImageIcon"] = u3.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v16.image
            }, { u3.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        }
        local v64 = u3.createElement
        local v65 = {
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true
        }
        local v66 = u12.merchantItem.cost
        v65.Text = "<b>" .. tostring(v66) .. "</b>"
        v65.TextColor3 = Color3.fromRGB(255, 255, 255)
        v65.Font = Enum.Font.RobotoMono
        v65.Size = UDim2.fromScale(0.5, 0.8)
        v63.ItemCost = v64("TextLabel", v65)
        __set_list(v63, 1, {u3.createElement("UIListLayout", {
    ["FillDirection"] = Enum.FillDirection.Horizontal,
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
    ["Padding"] = UDim.new(0, -8)
}), u3.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0, 8)
}), u3.createElement("UIStroke", {
    ["Thickness"] = 1,
    ["Color"] = Color3.fromRGB(255, 255, 255)
})})
        v31.PriceContainer = v61("Frame", v62, v63)
        v29.UsableArea = u3.createElement("Frame", v30, v31)
        v27.BillboardFrame = u3.createElement("ImageLabel", v28, v29)
        return u3.createFragment({
            ["TravelingMerchantItemPopup"] = u3.createElement("BillboardGui", v26, v27)
        })
    end)
}