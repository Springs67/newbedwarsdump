local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.Button
local u5 = v2.DeviceUtil
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitRentalBedCoinProduct
local v36 = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
        [3] = u4
        [4] = u5
        [5] = u11
        [6] = u6
        [7] = u3
        [8] = u10
    --]]
    local _ = p14.useState
    local v15 = u7.createRef()
    local v16 = u12(u13.SelectedKit)
    local v17
    if v16 == nil then
        v17 = v16
    else
        v17 = v16.purchaseData
    end
    local v18 = not v16
    if not v18 then
        if v17 ~= nil then
            v17 = v17.productType
        end
        v18 = v17 ~= "RentKit"
    end
    if v18 then
        return u7.createFragment()
    end
    local v19 = u7.createFragment
    local v20 = {}
    local v21 = u7.createElement
    local v22 = u4
    local v23 = {
        ["Size"] = u13.Size,
        ["BackgroundTransparency"] = 1,
        ["Selectable"] = true,
        [u7.Ref] = v15,
        ["OnClick"] = function() --[[ Name: OnClick, Line 40 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.OnClick()
        end,
        ["LayoutOrder"] = u13.LayoutOrder
    }
    local v24 = {}
    local v25 = u7.createElement("UIStroke", {
        ["Color"] = Color3.fromRGB(45, 147, 240),
        ["Thickness"] = u5.isSmallScreen() and 1 or 2
    })
    local v26 = u7.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(1000, 0)
    })
    local v27 = u7.createElement("ImageLabel", {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["ScaleType"] = "Fit",
        ["SizeConstraint"] = "RelativeYY",
        ["Image"] = u11.BED_COIN_ICON,
        ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
        ["Size"] = UDim2.fromScale(0.75, 0.75),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    })
    local v28 = u7.createElement
    local v29 = u6
    local v30 = {}
    local v31 = u7.createElement(u3, {
        ["Text"] = "Rent Kit",
        ["TextSize"] = 16,
        ["Font"] = Enum.Font.SourceSansBold,
        ["Limits"] = Vector2.new(300, 60)
    })
    local v32 = u7.createElement
    local v33 = u3
    local v34 = {
        ["TextSize"] = 14
    }
    local v35 = v16.cost
    v34.Text = "Cost: " .. tostring(v35) .. " BED COINS"
    v34.Font = Enum.Font.SourceSansSemibold
    v34.Limits = Vector2.new(300, 500)
    v34.TextColor3 = Color3.fromRGB(255, 181, 41)
    __set_list(v30, 1, {v31, v32(v33, v34), u7.createElement(u3, {
    ["TextSize"] = 14,
    ["Text"] = u10(u13.SelectedKit).name,
    ["Font"] = Enum.Font.SourceSans,
    ["Limits"] = Vector2.new(300, 500)
})})
    __set_list(v24, 1, {v25, v26, v27, v28(v29, {}, v30)})
    v20.RentKitButton = v21(v22, v23, v24)
    return v19(v20)
end)
return {
    ["KitShopRentKitBedCoinsButton"] = v9.connect(function(p37, p38) --[[ Line: 88 ]]
        local v39 = {}
        for v40, v41 in p38 do
            v39[v40] = v41
        end
        v39.bedCoins = p37.Bedwars.bedCoins
        return v39
    end)(v36)
}