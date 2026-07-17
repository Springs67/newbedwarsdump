-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;

return {
    MatchEndArmorTrimXp = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: getBedwarsKitMeta (copy), u1 (copy), ColorUtil (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local renderImage = getBedwarsKitMeta(p3.ArmorTrimXpEarned.kit).renderImage;
        local createElement = u1.createElement;
        local v5 = {
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 1)
        };
        local v6 = {
            u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.5
            }),
            u1.createElement("UISizeConstraint", {
                MaxSize = Vector2.new((1 / 0), 50)
            }),
            ArmorTrimKitImage = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.3, 0.9),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                Image = renderImage
            })
        };
        local createElement2 = u1.createElement;
        local v7 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.68, 1),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0)
        };
        local v8 = { (u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            })) };
        local createElement3 = u1.createElement;
        local v9 = {
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.6)
        };
        local v10 = math.ceil(p3.ArmorTrimXpEarned.xpEarned);
        v9.Text = "+" .. tostring(v10) .. " XP";
        v9.TextXAlignment = Enum.TextXAlignment.Left;
        v9.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v9.TextColor3 = ColorUtil.WHITE;
        v8.ArmorTrimXpEarnedAmount = createElement3("TextLabel", v9);
        v8.ArmorTrimXpLabel = u1.createElement("TextLabel", {
            Text = "ARMOR TRIM",
            TextTransparency = 0.5,
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.4),
            TextXAlignment = Enum.TextXAlignment.Left,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextColor3 = ColorUtil.WHITE
        });
        v6[3] = createElement2("Frame", v7, v8);

        return createElement("Frame", v5, v6);
    end)
};