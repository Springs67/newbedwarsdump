local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u5 = v1.import(script, script.Parent, "promo-card-bottom-section").GameUpdateKitCardBottom
local u6 = v1.import(script, script.Parent, "promo-card-top-section").GameUpdateKitCardTop
return {
    ["GameUpdatePromoCard"] = v3.new(u2)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u6
            [4] = u5
        --]]
        local _ = p8.useState
        local _ = p8.useEffect
        local v9 = UDim.new(0.06787330316742081, 0)
        local v10 = UDim.new(0.1188118811881188, 0)
        local v11 = {
            ["AutomaticSize"] = "Y",
            ["BorderSizePixel"] = 0,
            ["Size"] = p7.Size or UDim2.fromScale(0.95, 0),
            ["BackgroundColor3"] = u4.backgroundTertiary,
            ["LayoutOrder"] = p7.LayoutOrder
        }
        local v12 = { u2.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u2.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }) }
        local v13 = #v12
        local v14
        if p7.PromoCard.Description == nil then
            v14 = false
        else
            v14 = u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.9866071428571429,
                ["AspectType"] = "ScaleWithParentSize"
            })
        end
        if v14 then
            v12[v13 + 1] = v14
        end
        local v15 = #v12
        v12[v15 + 1] = u2.createElement(u6, {
            ["store"] = p7.store,
            ["PromoCard"] = p7.PromoCard,
            ["PaddingHorizontal"] = v9,
            ["PaddingVertical"] = v10
        })
        local v16
        if p7.PromoCard.Description == nil then
            v16 = false
        else
            v16 = u2.createElement(u5, {
                ["Description"] = p7.PromoCard.Description,
                ["PaddingHorizontal"] = v9,
                ["PaddingVertical"] = v10
            })
        end
        if v16 then
            v12[v15 + 2] = v16
        end
        return u2.createFragment({
            ["ActionButtonKitPurchase"] = u2.createElement("ImageLabel", v11, v12)
        })
    end)
}