-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getKitRentalBedCoinProduct = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitRentalBedCoinProduct;
local v11 = v3.new(u2)(function(u5, p6) -- Line: 14
    -- upvalues: u2 (copy), getKitRentalBedCoinProduct (copy), Button (copy), DeviceUtil (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy), getBedwarsKitMeta (copy)
    local _ = p6.useState;
    local v7 = u2.createRef();
    local v8 = getKitRentalBedCoinProduct(u5.SelectedKit);
    local v9;

    if v8 == nil then
        v9 = v8;
    else
        v9 = v8.purchaseData;
    end;

    local v10 = not v8;

    if not v10 then
        if v9 ~= nil then
            v9 = v9.productType;
        end;

        v10 = v9 ~= "RentKit";
    end;

    if v10 then
        return u2.createFragment();
    end;

    return u2.createFragment({
        RentKitButton = u2.createElement(Button, {
            Size = u5.Size,
            BackgroundTransparency = 1,
            Selectable = true,
            [u2.Ref] = v7,

            OnClick = function() -- Line: 40, Name: OnClick
                -- upvalues: u5 (copy)
                u5.OnClick();
            end,

            LayoutOrder = u5.LayoutOrder
        }, {
            u2.createElement("UIStroke", {
                Color = Color3.fromRGB(45, 147, 240),
                Thickness = DeviceUtil.isSmallScreen() and 1 or 2
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(1000, 0)
            }),
            u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                Image = BedwarsImageId.BED_COIN_ICON,
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(0.75, 0.75),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }),
            u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    Text = "Rent Kit",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }), u2.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = "Cost: " .. tostring(v8.cost) .. " BED COINS",
                    Font = Enum.Font.SourceSansSemibold,
                    Limits = Vector2.new(300, 500),
                    TextColor3 = Color3.fromRGB(255, 181, 41)
                }), u2.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = getBedwarsKitMeta(u5.SelectedKit).name,
                    Font = Enum.Font.SourceSans,
                    Limits = Vector2.new(300, 500)
                }) })
        })
    });
end);

return {
    KitShopRentKitBedCoinsButton = v4.connect(function(p12, p13) -- Line: 88
        local v14 = {};

        for i, v in p13 do
            v14[i] = v;
        end;

        v14.bedCoins = p12.Bedwars.bedCoins;

        return v14;
    end)(v11)
};