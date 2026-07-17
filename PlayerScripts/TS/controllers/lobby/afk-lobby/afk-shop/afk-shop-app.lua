-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local Empty = v1.Empty;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local AfkShopUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AfkShopAppNavbar = RuntimeLib.import(script, script.Parent, "afk-navbar", "afk-shop-app-navbar").AfkShopAppNavbar;
local AfkShopComponent = RuntimeLib.import(script, script.Parent, "afk-shop-component", "afk-shop-component").AfkShopComponent;
local v19 = v3.new(u2)(function(p5, p6) -- Line: 15
    -- upvalues: u2 (copy), DarkBackground (copy), Theme (copy), ScaleComponent (copy), AfkShopAppNavbar (copy), Padding (copy), AfkShopUtils (copy), AfkShopComponent (copy), Empty (copy)
    local v7, v8 = p6.useState("shop");
    local v9 = {
        DisplayOrder = 20,
        ResetOnSpawn = false
    };
    local v10 = { u2.createElement(DarkBackground, {
            AppId = p5.AppId
        }) };
    local _ = #v10;
    local v11 = {
        BackgroundTransparency = 0.05,
        Selectable = false,
        AutoButtonColor = false,
        Active = true,
        Modal = true,
        Size = UDim2.fromOffset(690, 480),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Theme.backgroundSecondary,
        ScaleType = Enum.ScaleType.Crop
    };
    local v12 = {
        u2.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(1035, 720),
            ScreenPadding = Vector2.new(80, 80)
        }),
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }),
        u2.createElement(AfkShopAppNavbar, {
            AfkDataProfile = p5.afkDataProfile,
            Page = v7,
            SetPage = v8
        })
    };
    local _ = #v12;
    local v13 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.9)
    };
    local v14 = {
        u2.createElement(Padding, {
            Padding = {
                Vertical = 8,
                Horizontal = 14
            }
        }),
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.02, 0)
        }),
        PageDescription = u2.createElement("TextLabel", {
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextTransparency = 0.3,
            TextXAlignment = "Left",
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.04),
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1),
            Text = "Gain " .. AfkShopUtils.currencyName .. " from the AFK Area!",
            TextColor3 = Color3.fromRGB(255, 255, 255)
        })
    };
    local v15 = {
        LayoutOrder = 3,
        Size = UDim2.fromScale(1, 0.94)
    };
    local v16 = {};
    local v17 = #v16;
    local v18;

    if string.lower(v7) == "shop" then
        v18 = u2.createElement(AfkShopComponent, {
            ShopItems = AfkShopUtils.shop.items,
            AfkShopItemsPurchased = p5.afkDataProfile.afkCurrency.itemsPurchased
        });
    else
        v18 = false;
    end;

    if v18 then
        v16[v17 + 1] = v18;
    end;

    v14[#v14 + 1] = u2.createElement(Empty, v15, v16);
    v12.Content = u2.createElement(Empty, v13, v14);
    v10.AfkShopApp = u2.createElement("ImageButton", v11, v12);

    return u2.createFragment({
        AfkShop = u2.createElement("ScreenGui", v9, v10)
    });
end);

return {
    AfkShopApp = v4.connect(function(p20, p21) -- Line: 113
        local v22 = {};

        for i, v in p21 do
            v22[i] = v;
        end;

        v22.afkDataProfile = p20.Afk.profileData;

        return v22;
    end)(v19)
};