-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local v3 = u2.Component:extend("ShopDisruptionPrice");

function v3.init(p4) -- Line: 13
end;

function v3.render(p5) -- Line: 15
    -- upvalues: BedwarsShop (copy), Players (copy), u2 (copy), ColorUtil (copy), ItemUtil (copy), Empty (copy)
    local v6 = BedwarsShop.getShopItemBase(p5.props.SelectedItem.itemType, Players.LocalPlayer, {
        shopId = p5.props.ShopID
    });
    local v7;

    if v6 then
        v7 = v6.price;
    else
        v7 = nil;
    end;

    local v8 = {
        Size = UDim2.fromScale(0.9, 0.038),
        Position = UDim2.fromScale(0.5, 0.894),
        AnchorPoint = Vector2.new(0.558, 1)
    };
    local v9 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.02, 0)
        }) };
    local v10 = #v9;
    local v11;

    if v7 == nil then
        v11 = false;
    else
        v11 = u2.createElement("TextLabel", {
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Font = "Roboto",
            TextScaled = true,
            RichText = true,
            Text = "<b>" .. tostring(v7) .. "</b>",
            Size = UDim2.fromScale(1, 1),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            Strikethrough = u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 3),
                Position = UDim2.fromScale(0, 0.35),
                BackgroundColor3 = ColorUtil.hexColor(16737380)
            })
        });
    end;

    if v11 then
        v9[v10 + 1] = v11;
    end;

    v9[#v9 + 1] = u2.createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = "Roboto",
        TextScaled = true,
        RichText = true,
        Text = "<b>" .. tostring(p5.props.SelectedItem.price) .. " " .. ItemUtil.getDisplayName(p5.props.SelectedItem.currency) .. "</b>",
        AutomaticSize = Enum.AutomaticSize.XY,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = ColorUtil.hexColor(16737380)
    }, { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 1)
        }) });

    return u2.createElement(Empty, v8, v9);
end;

return {
    ShopDisruptionPrice = v3
};