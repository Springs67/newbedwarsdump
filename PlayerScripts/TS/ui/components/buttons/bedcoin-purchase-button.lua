-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedCoinProductList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-product-list").BedCoinProductList;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local BasePurchaseButton = RuntimeLib.import(script, script.Parent.Parent, "base-purchase-button").BasePurchaseButton;

return {
    BedcoinPurchaseButton = v2.new(u1)(function(u3, p4) -- Line: 9
        -- upvalues: BedCoinProductList (copy), BedwarsImageId (copy), KnitClient (copy), u1 (copy), BasePurchaseButton (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = BedCoinProductList.getProductInfo(u3.BedcoinProductId);
        local v6 = {};

        if v5 ~= nil then
            v5 = v5.cost;
        end;

        v6.Price = v5 == nil and 0 or v5;
        v6.Icon = BedwarsImageId.BED_COIN_ICON;

        function v6.OnClick() -- Line: 24
            -- upvalues: KnitClient (ref), u3 (copy)
            KnitClient.Controllers.BedCoinProductPurchaseController:purchase({
                productId = u3.BedcoinProductId
            });
        end;

        v6.ButtonGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 199, 56)), ColorSequenceKeypoint.new(1, Color3.fromRGB(196, 150, 24)) });
        local PurchaseButtonProps = u3.PurchaseButtonProps;

        if PurchaseButtonProps then
            for i, v in PurchaseButtonProps do
                v6[i] = v;
            end;
        end;

        v6.GamepadShouldAutoSelect = u3.GamepadShouldAutoSelect;

        return u1.createElement(BasePurchaseButton, v6);
    end)
};