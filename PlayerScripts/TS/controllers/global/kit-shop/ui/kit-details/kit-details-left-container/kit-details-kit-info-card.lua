-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local getBedwarsClassMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    KitDetailsKitInfoCard = v3.new(u2)(function(p4, p5) -- Line: 14
        -- upvalues: getBedwarsKitMeta (copy), BedwarsKitSkinMeta (copy), BundleMeta (copy), getBedwarsClassMeta (copy), BedwarsKitSkin (copy), ColorUtil (copy), BedwarsImageId (copy), u2 (copy), Empty (copy)
        local _ = p5.useState;
        local v6;

        if p4.SelectedKit then
            v6 = getBedwarsKitMeta(p4.SelectedKit);
        else
            v6 = nil;
        end;

        local v7;

        if p4.SelectedKitSkin then
            v7 = BedwarsKitSkinMeta[p4.SelectedKitSkin];
        else
            v7 = nil;
        end;

        local v8;

        if p4.SelectedKitBundle then
            v8 = BundleMeta[p4.SelectedKitBundle];
        else
            v8 = nil;
        end;

        local v9 = "";
        local v10 = "";
        local v11 = "";
        local u12 = nil;
        local v13 = "";

        if v6 then
            local kitClass = v6.kitClass;

            if kitClass ~= 0 and (kitClass == kitClass and kitClass) then
                v9 = getBedwarsClassMeta(v6.kitClass).imageId;
                v10 = getBedwarsClassMeta(v6.kitClass).display;
            end;

            if p4.SelectedKitSkin and p4.SelectedKitSkin ~= BedwarsKitSkin.DEFAULT then
                if v7 ~= nil then
                    v7 = v7.name;
                end;

                v11 = tostring(v7) .. " <font color=\"" .. ColorUtil.richTextColor(ColorUtil.darken(ColorUtil.WHITE, 0.5)) .. "\">(Skin)</font>";
            elseif v6 == nil then
                v11 = v6;
            else
                v11 = v6.name;
            end;

            u12 = v6.difficulty;
            v13 = v6.description;
        elseif v8 then
            v9 = BedwarsImageId.STAR_SOLID;
            v10 = "Bundle";

            if v8.kitShopBundle then
                v11 = v8.kitShopBundle.name;
                v13 = v8.kitShopBundle.description;
            end;
        else
            v9 = BedwarsImageId.SCROLL_SOLID;
            v11 = "";
            v10 = "Miscellaneous";
        end;

        local v14 = {};

        for i, v in p4 do
            v14[i] = v;
        end;

        v14.SelectedKit = nil;
        v14.SelectedKitSkin = nil;
        v14.SelectedKitBundle = nil;
        local v15 = {};

        for i, v in v14 do
            v15[i] = v;
        end;

        local v16 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 3)
            }) };
        local v17 = #v16;
        local v18 = {
            Size = UDim2.fromScale(1, 0.125)
        };
        local v19 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 5)
            }) };
        local v20 = #v19;
        local v21;

        if v9 == "" then
            v21 = false;
        else
            v21 = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.15, 1),
                Image = v9
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        end;

        if v21 then
            v19[v20 + 1] = v21;
        end;

        v19[#v19 + 1] = u2.createElement(Empty, {
            Size = UDim2.fromScale(0.75, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0.025, 0)
            }), u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextTransparency = 0.5,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = string.upper(v10),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center
            }) });
        v16[v17 + 1] = u2.createElement(Empty, v18, v19);
        v16[v17 + 2] = u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.15)
        }, { u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                RichText = true,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = v11,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center
            }) });
        local v22;

        if u12 == nil then
            v22 = false;
        else
            v22 = u12 > 0;
        end;

        if v22 then
            local v23 = {
                Size = UDim2.fromScale(1, 0.15)
            };
            local v24 = { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.15, 0),
                    PaddingBottom = UDim.new(0.15, 0)
                }), u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Text = "DIFFICULTY",
                    TextTransparency = 0.25,
                    Size = UDim2.fromScale(1, 0.5),
                    Position = UDim2.fromScale(0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0),
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center
                }) };
            local v25 = table.create(3, "");

            local function v31(p26, p27) -- Line: 175
                -- upvalues: u12 (ref), u2 (ref), ColorUtil (ref)
                local v28 = p27 < u12;
                local createElement = u2.createElement;
                local v29 = {
                    Size = UDim2.fromScale(0.075, 1)
                };
                local v30;

                if v28 then
                    v30 = Color3.fromRGB(255, 235, 133);
                else
                    v30 = ColorUtil.WHITE;
                end;

                v29.BackgroundColor3 = v30;
                v29.BackgroundTransparency = v28 and 0 or 0.5;

                return createElement("Frame", v29, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) });
            end;

            local v32 = table.create(#v25);

            for i, v in v25 do
                v32[i] = v31(v, i - 1, v25);
            end;

            local v33 = {
                Size = UDim2.fromScale(1, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0)
            };
            local v34 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 5)
                }), u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.15, 0),
                    PaddingBottom = UDim.new(0.15, 0)
                }) };
            local v35 = #v34;

            for i, v in v32 do
                v34[v35 + i] = v;
            end;

            v24[#v24 + 1] = u2.createElement(Empty, v33, v34);
            v22 = u2.createElement(Empty, v23, v24);
        end;

        if v22 then
            v16[v17 + 3] = v22;
        end;

        v16[#v16 + 1] = u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.575)
        }, { u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                RichText = true,
                TextTransparency = 0.25,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = v13,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 28,
                    MinTextSize = 8
                }) }) });

        return u2.createElement(Empty, v15, v16);
    end)
};