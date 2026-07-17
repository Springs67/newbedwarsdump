-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MapBrowserTags = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-tags").MapBrowserTags;
local MapSaveUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    MapBrowserTagsGrid = v4.new(u3)(function(u5, p6) -- Line: 13
        -- upvalues: u2 (copy), MapBrowserTags (copy), u3 (copy), ColorUtil (copy), Theme (copy), MapSaveUtil (copy), Padding (copy), Empty (copy)
        local useState = p6.useState;
        local u7, u8 = useState(u5.DefaultTags or {});
        local u9, u10 = useState(false);
        local v11 = {
            LayoutOrder = 2,
            ZIndex = 100,
            Size = UDim2.new(1, 0, 0.35, 0)
        };
        local FrameProps = u5.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v11[i] = v;
            end;
        end;

        local v12 = u2.values(MapBrowserTags);
        table.sort(v12, function(p13, p14) -- Line: 29
            return p13 < p14;
        end);

        local function v32(u15, p16) -- Line: 33
            -- upvalues: u7 (copy), u3 (ref), ColorUtil (ref), Theme (ref), u8 (copy), u5 (copy), MapSaveUtil (ref), Padding (ref)
            local u17 = table.find(u7, u15) ~= nil;
            local createFragment = u3.createFragment;
            local v18 = {};
            local createElement = u3.createElement;
            local v19 = {
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = "X",
                Position = UDim2.new(0.5, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = string.upper(u15),
                TextSize = 9,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
            };
            local v20;

            if u17 then
                v20 = Theme.mcGold;
            else
                v20 = ColorUtil.BLACK;
            end;

            v19.BackgroundColor3 = v20;
            v19.BackgroundTransparency = 0.3;
            v19.BorderSizePixel = 0;

            v19[u3.Event.MouseEnter] = function(p21) -- Line: 49
            end;

            v19[u3.Event.MouseLeave] = function(p22) -- Line: 50
            end;

            v19[u3.Event.Activated] = function(p23) -- Line: 51
                -- upvalues: u17 (copy), u15 (copy), u7 (ref), u8 (ref), u5 (ref), MapSaveUtil (ref)
                if not u17 then
                    local MaxTags = u5.MaxTags;

                    if MaxTags == nil then
                        MaxTags = MapSaveUtil.MAP_MAX_TAGS;
                    end;

                    if MaxTags <= #u7 then
                        return nil;
                    end;

                    local v24 = {};
                    local v25 = #v24;
                    local v26 = #u7;
                    table.move(u7, 1, v26, v25 + 1, v24);
                    v24[v25 + v26 + 1] = u15;
                    u8(v24);
                    local v27 = {};
                    local v28 = #v27;
                    local v29 = #u7;
                    table.move(u7, 1, v29, v28 + 1, v27);
                    v27[v28 + v29 + 1] = u15;
                    u5.OnChange(u15, true, v27);

                    return;
                end;

                local function _(p30) -- Line: 53
                    -- upvalues: u15 (ref)
                    return p30 == u15;
                end;

                local v31 = -1;

                for i, v in u7 do
                    local _ = i - 1;

                    if v == u15 == true then
                        v31 = i - 1;
                        break;
                    end;
                end;

                table.remove(u7, v31 + 1);
                u8(u7);
                u5.OnChange(u15, false, u7);
            end;

            v19.LayoutOrder = p16;
            v18.TagPill = createElement("TextButton", v19, { u3.createElement(Padding, {
                    Padding = {
                        Horizontal = 8,
                        Vertical = 4
                    }
                }), u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }) });

            return createFragment(v18);
        end;

        local v33 = table.create(#v12);

        for i, v in v12 do
            v33[i] = v32(v, i - 1, v12);
        end;

        local v34 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4)
            }) };
        local v35 = #v34;

        for i, v in v33 do
            v34[v35 + i] = v;
        end;

        local v36 = #v34;
        local Featured = u5.Featured;

        if Featured then
            local createFragment = u3.createFragment;
            local v37 = {};
            local createElement = u3.createElement;
            local v38 = {
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = "X",
                Position = UDim2.new(0.5, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = "⭐ FEATURED",
                TextSize = 9,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
            };
            local v39;

            if u9 then
                v39 = Theme.mcGold;
            else
                v39 = ColorUtil.BLACK;
            end;

            v38.BackgroundColor3 = v39;
            v38.BackgroundTransparency = 0.3;
            v38.BorderSizePixel = 0;

            v38[u3.Event.Activated] = function(p40) -- Line: 143
                -- upvalues: u9 (copy), u10 (copy), u5 (copy)
                if u9 then
                    u10(false);

                    if u5.OnSelectFeatured then
                        u5.OnSelectFeatured(false);
                    end;
                else
                    u10(true);

                    if u5.OnSelectFeatured then
                        u5.OnSelectFeatured(true);
                    end;
                end;
            end;

            v38.LayoutOrder = #u2.values(MapBrowserTags) + 1;
            v37.FeaturedTagPill = createElement("TextButton", v38, { u3.createElement(Padding, {
                    Padding = {
                        Horizontal = 8,
                        Vertical = 4
                    }
                }), u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }) });
            Featured = createFragment(v37);
        end;

        if Featured then
            v34[v36 + 1] = Featured;
        end;

        return u3.createFragment({
            TagsContainer = u3.createElement(Empty, v11, v34)
        });
    end)
};