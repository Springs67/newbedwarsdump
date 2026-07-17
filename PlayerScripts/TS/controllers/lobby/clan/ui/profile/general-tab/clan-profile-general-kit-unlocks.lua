-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local CountdownComponent = RuntimeLib.import(script, script.Parent.Parent, "shop-tab", "countdown-component").CountdownComponent;

return {
    ClanProfileGeneralKitUnlocks = v4.new(u3)(function(p5, p6) -- Line: 14
        -- upvalues: u3 (copy), ColorUtil (copy), u2 (copy), getBedwarsKitMeta (copy), Empty (copy), KitViewport (copy), CountdownComponent (copy), TooltipContainer (copy), AutoSizedText (copy)
        local _ = p6.useState;
        local v7 = {};

        for i, v in p5 do
            v7[i] = v;
        end;

        v7.KitShopUnlocks = nil;
        v7[u3.Children] = nil;
        local v8 = {};

        for i, v in v7 do
            v8[i] = v;
        end;

        local v9 = { u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.1, 0)
            }), u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }), u3.createElement("TextLabel", {
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                Font = "Roboto",
                Text = "<b>Kit Shop Unlocks</b>",
                TextXAlignment = "Left",
                TextYAlignment = "Top",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0),
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) }) };
        local v10 = u2.entries(p5.KitShopUnlocks);

        local function v15(p11) -- Line: 60
            -- upvalues: getBedwarsKitMeta (ref), u3 (ref), Empty (ref), KitViewport (ref), CountdownComponent (ref), ColorUtil (ref), TooltipContainer (ref), AutoSizedText (ref)
            local v12 = p11[1];
            local v13 = p11[2];
            local v14 = getBedwarsKitMeta(v12);

            return u3.createElement(Empty, {
                Size = UDim2.fromScale(0.21, 0.8)
            }, { u3.createElement(KitViewport, {
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Kit = v12
                }), u3.createElement(CountdownComponent, {
                    BackgroundTransparency = 1,
                    TextXAlignment = "Center",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    EndTime = v13.endTime
                }, { u3.createElement("UIStroke", {
                        Thickness = 1,
                        Color = ColorUtil.BLACK
                    }) }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                        TextSize = 16,
                        Text = v14.name,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }) }) });
        end;

        local v16 = table.create(#v10);

        for i, v in v10 do
            v16[i] = v15(v, i - 1, v10);
        end;

        local v17 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.8)
        };
        local v18 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v19 = #v18;

        for i, v in v16 do
            v18[v19 + i] = v;
        end;

        v9[#v9 + 1] = u3.createElement(Empty, v17, v18);

        return u3.createElement("Frame", v8, v9);
    end)
};