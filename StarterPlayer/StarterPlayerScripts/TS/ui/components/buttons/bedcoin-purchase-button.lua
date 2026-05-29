local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-product-list").BedCoinProductList
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u7 = v1.import(script, script.Parent.Parent, "base-purchase-button").BasePurchaseButton
return {
    ["BedcoinPurchaseButton"] = v4.new(u3)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u2
            [4] = u3
            [5] = u7
        --]]
        local _ = p9.useState
        local _ = p9.useEffect
        local v10 = u5.getProductInfo(u8.BedcoinProductId)
        local v11 = {}
        if v10 ~= nil then
            v10 = v10.cost
        end
        v11.Price = v10 == nil and 0 or v10
        v11.Icon = u6.BED_COIN_ICON
        function v11.OnClick() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u8
            --]]
            u2.Controllers.BedCoinProductPurchaseController:purchase({
                ["productId"] = u8.BedcoinProductId
            })
        end
        v11.ButtonGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 199, 56)), ColorSequenceKeypoint.new(1, Color3.fromRGB(196, 150, 24)) })
        local v12 = u8.PurchaseButtonProps
        if v12 then
            for v13, v14 in v12 do
                v11[v13] = v14
            end
        end
        v11.GamepadShouldAutoSelect = u8.GamepadShouldAutoSelect
        return u3.createElement(u7, v11)
    end)
}