-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local LabelledText = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "labelled-text", "labelled-text").LabelledText;
local BedwarsClass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass;
local getBedwarsClassMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    FavoriteKitCell = v2.new(u1)(function(p3, p4) -- Line: 10
        -- upvalues: u1 (copy), Theme (copy), ColorUtil (copy), BedwarsClass (copy), getBedwarsClassMeta (copy), LabelledText (copy)
        local _ = p4.useState;
        local v5 = {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Size = UDim2.fromScale(1, 1)
        };
        local v6 = { u1.createElement("ImageLabel", {
                Image = p3.KitMeta.renderImage,
                Size = UDim2.fromScale(1.5, 1.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.6),
                LayoutOrder = p3.LayoutOrder,
                ScaleType = Enum.ScaleType.Fit,
                BackgroundColor3 = Theme.backgroundSecondary
            }) };
        local v7 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1)
        };
        local v8 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Bottom,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.03, 0)
            }), u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Size = UDim2.fromScale(1, 0.16),
                Text = tostring(p3.Plays) .. " Plays",
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            }, { u1.createElement("UIStroke", {
                    Thickness = 2,
                    Color = ColorUtil.BLACK
                }) }) };
        local v9 = {
            BackgroundTransparency = 0.5,
            Size = UDim2.fromScale(1, 0.22),
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v10 = {};
        local v11 = {
            TextScale = 0.7,
            FrameProps = {
                Size = UDim2.fromScale(1, 0.9),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            },
            Text = "<b>" .. p3.KitMeta.name .. "</b>",
            TextProps = {
                RichText = true,
                Font = Enum.Font.Roboto,
                TextColor3 = ColorUtil.WHITE
            }
        };
        local kitClass = p3.KitMeta.kitClass;

        if kitClass == nil then
            kitClass = BedwarsClass.MISC;
        end;

        v11.Image = getBedwarsClassMeta(kitClass).imageId;
        v11.ImageLeft = true;
        v11.Padding = UDim.new(0.02, 0);
        v10[#v10 + 1] = u1.createElement(LabelledText, v11);
        v8[#v8 + 1] = u1.createElement("Frame", v9, v10);
        v6[#v6 + 1] = u1.createElement("Frame", v7, v8);

        return u1.createElement("Frame", v5, v6);
    end)
};