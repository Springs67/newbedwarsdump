-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local SectionTitle = RuntimeLib.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "section-title").SectionTitle;
local FavoriteKitCell = RuntimeLib.import(script, script.Parent, "favorite-kit-cell").FavoriteKitCell;

return {
    FavoriteKits = v4.new(u3)(function(u5, p6) -- Line: 13
        -- upvalues: u3 (copy), Padding (copy), SectionTitle (copy), u2 (copy), getBedwarsKitMeta (copy), FavoriteKitCell (copy), AutoCanvasScrollingFrame (copy), Empty (copy)
        local _ = p6.useState;
        local v7 = {
            Size = u5.Size or UDim2.fromScale(1, 1),
            LayoutOrder = u5.LayoutOrder
        };
        local v8 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 5)
            }), u3.createElement(Padding, {
                Padding = UDim.new(0, 10)
            }), u3.createElement(SectionTitle, {
                title = "Favorite Kit(s)",
                SectionDivider = true
            }) };
        local v9 = u2.keys(u5.ProfileData.favoriteKitData);

        local function v14(p10, p11) -- Line: 38
            -- upvalues: getBedwarsKitMeta (ref), u5 (copy), u3 (ref), FavoriteKitCell (ref)
            local v12 = getBedwarsKitMeta(p10);
            local v13 = u5.ProfileData.favoriteKitData[p10];

            return u3.createElement(FavoriteKitCell, {
                KitMeta = v12,
                Plays = v13 == nil and 0 or v13,
                LayoutOrder = p11
            });
        end;

        local v15 = table.create(#v9);

        for i, v in v9 do
            v15[i] = v14(v, i - 1, v9);
        end;

        local v16 = {
            ScrollingFrameProps = {
                Size = UDim2.fromScale(1, 0.93)
            }
        };
        local v17 = { u3.createElement("UIGridLayout", {
                FillDirectionMaxCells = 2,
                CellSize = UDim2.fromOffset(110, 110),
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }) };
        local v18 = #v17;

        for i, v in v15 do
            v17[v18 + i] = v;
        end;

        v8[#v8 + 1] = u3.createElement(AutoCanvasScrollingFrame, v16, v17);

        return u3.createElement(Empty, v7, v8);
    end)
};