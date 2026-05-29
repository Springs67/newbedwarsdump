local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ImageId
local u5 = v2.StringUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["KitShopPurchaseButton"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u6
            [4] = u3
            [5] = u9
            [6] = u5
        --]]
        local _ = p11.useState
        local v12 = ""
        if u10.PurchaseButtonType == "Robux" then
            v12 = u4.ROBUX
        elseif u10.PurchaseButtonType == "BedCoin" then
            v12 = u8.BED_COIN_ICON
        end
        return u6.createElement(u3, {
            ["Selectable"] = true,
            ["Size"] = u10.Size,
            ["Position"] = UDim2.fromScale(0.5, 0.895),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["BackgroundColor3"] = u9.backgroundSuccess,
            ["OnClick"] = function() --[[ Name: OnClick, Line 25 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10.Purchase()
            end,
            ["LayoutOrder"] = u10.LayoutOrder
        }, { u6.createElement("UIListLayout", {
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["Padding"] = UDim.new(0.05, 0)
            }), u6.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["SizeConstraint"] = "RelativeYY",
                ["Image"] = v12,
                ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(1, 0.7),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.34, 0.5)
            }, { u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }), u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["AutomaticSize"] = "X",
                ["TextXAlignment"] = "Left",
                ["Text"] = u5.formatNumberWithCommas(u10.Price),
                ["Size"] = UDim2.fromScale(0, 0.45),
                ["Position"] = UDim2.fromScale(0.505, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }) })
    end)
}