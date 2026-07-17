-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;

return {
    KitContractProgress = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: getBedwarsKitMeta (copy), BedwarsKit (copy), u2 (copy), u1 (copy), ColorUtil (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local renderImage = getBedwarsKitMeta(p4.EquippedKit or BedwarsKit.NONE).renderImage;
        local v6 = {
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 1)
        };
        local v7 = {
            u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.5
            }),
            u2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new((1 / 0), 50)
            }),
            KitRenderImage = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 10,
                Size = UDim2.fromScale(0.3, 0.9),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                Image = renderImage
            })
        };
        local v8 = u1.entries(p4.KitStatsDelta);

        local function v12(p9) -- Line: 37
            -- upvalues: u2 (ref), ColorUtil (ref)
            local v10 = p9[1];
            local v11 = p9[2];

            if v11 <= 0 then
                return nil;
            end;

            return u2.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                TextTransparency = 0.1,
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.4),
                Text = "+" .. tostring(v11) .. " " .. string.upper(v10),
                TextXAlignment = Enum.TextXAlignment.Left,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            });
        end;

        local v13 = 0;
        local v14 = {};

        for i, v in v8 do
            local v15 = v12(v, i - 1, v8);

            if v15 ~= nil then
                v13 = v13 + 1;
                v14[v13] = v15;
            end;
        end;

        local v16 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.68, 1),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0)
        };
        local v17 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }) };
        local v18 = #v17;

        for i, v in v14 do
            v17[v18 + i] = v;
        end;

        v7[#v7 + 1] = u2.createElement("Frame", v16, v17);

        return u2.createElement("Frame", v6, v7);
    end)
};