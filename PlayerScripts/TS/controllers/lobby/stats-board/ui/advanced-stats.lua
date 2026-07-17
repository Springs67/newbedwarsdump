-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking");
local CATEGORY_TO_ICON = v4.CATEGORY_TO_ICON;
local STAT_TO_CATEGORY = v4.STAT_TO_CATEGORY;
local STAT_TO_DESCRIPTION = v4.STAT_TO_DESCRIPTION;
local TYPE_PRIORITY = v4.TYPE_PRIORITY;
local TrackType = v4.TrackType;
local StatTrackingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    AdvancedStats = v3.new(u2)(function(u5, p6) -- Line: 18
        -- upvalues: Theme (copy), BedwarsImageId (copy), u2 (copy), ColorUtil (copy), StatTrackingUtil (copy), CATEGORY_TO_ICON (copy), STAT_TO_CATEGORY (copy), STAT_TO_DESCRIPTION (copy), TrackType (copy), TYPE_PRIORITY (copy), GameType (copy), Empty (copy)
        local u7 = 0;

        local function u12(p8) -- Line: 20
            -- upvalues: u7 (ref), Theme (ref), BedwarsImageId (ref), u2 (ref), ColorUtil (ref)
            local layoutOrder = p8.layoutOrder;
            local icon = p8.icon;
            local title = p8.title;
            local value = p8.value;
            u7 = u7 + 1;
            local v9 = {
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundTransparency = u7 % 2 == 0 and 0.5 or 1,
                BackgroundColor3 = Theme.backgroundTertiary,
                LayoutOrder = layoutOrder
            };
            local v10 = {};
            local v11 = {
                Size = UDim2.fromScale(0.1, 0.8),
                Position = UDim2.fromScale(0.01, 0.5),
                AnchorPoint = Vector2.new(0, 0.5)
            };

            if icon == nil then
                icon = BedwarsImageId.STAR_SOLID;
            end;

            v11.Image = icon;
            v11.BackgroundTransparency = 1;
            v11.BorderSizePixel = 0;
            v11.ScaleType = Enum.ScaleType.Fit;
            v10[#v10 + 1] = u2.createElement("ImageLabel", v11, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
            v10.StatTitle = u2.createElement("TextLabel", {
                TextSize = 14,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.9, 1),
                Position = UDim2.fromScale(0.1, 0),
                Text = title,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            });
            v10.StatValue = u2.createElement("TextLabel", {
                TextSize = 14,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.97, 1),
                Text = value,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Right,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            });

            return u2.createElement("Frame", v9, v10);
        end;

        local v13 = {
            Size = UDim2.new(1, 0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.Y
        };

        for i, v in u5.FrameProps do
            v13[i] = v;
        end;

        local function v25(p14, p15) -- Line: 83
            -- upvalues: u5 (copy), StatTrackingUtil (ref), CATEGORY_TO_ICON (ref), STAT_TO_CATEGORY (ref), STAT_TO_DESCRIPTION (ref), TrackType (ref), u12 (copy)
            if not u5.QueueStats then
                return nil;
            end;

            if table.find(StatTrackingUtil.PROFILE_EXCLUDE, p14) ~= nil then
                return nil;
            end;

            local Exclude = u5.Exclude;

            if Exclude ~= nil then
                Exclude = table.find(Exclude, p14) ~= nil;
            end;

            if Exclude then
                return nil;
            end;

            local v16 = CATEGORY_TO_ICON[STAT_TO_CATEGORY[p14]];
            local v17 = STAT_TO_DESCRIPTION[p14];
            local v18 = 0;
            local v19 = "";

            if p14 == TrackType.PLAYTIME then
                local v20 = math.floor(u5.QueueStats.totalPlayTime / 3600);
                local v21 = math.floor(u5.QueueStats.totalPlayTime / 60 - v20 * 60);
                local v22 = math.floor(u5.QueueStats.totalPlayTime - v21 * 60 - v20 * 3600);
                v19 = tostring(v20) .. "h " .. tostring(v21) .. "m " .. tostring(v22) .. "s";
            else
                local v23 = u5.QueueStats[p14];
                v18 = math.ceil(v23 == nil and 0 or v23);
            end;

            local v24 = {
                layoutOrder = p15,
                title = v17
            };

            if p14 ~= TrackType.PLAYTIME then
                v19 = tostring(v18);
            end;

            v24.value = v19;
            v24.icon = v16;

            return u12(v24);
        end;

        local v26 = 0;
        local v27 = {};

        for i, v in TYPE_PRIORITY do
            local v28 = v25(v, i - 1, TYPE_PRIORITY);

            if v28 ~= nil then
                v26 = v26 + 1;
                v27[v26] = v28;
            end;
        end;

        local v29 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }) };
        local v30 = #v29;

        for i, v in v27 do
            v29[v30 + i] = v;
        end;

        local v31 = #v29;
        local v32 = u5.GameType == GameType.SKYWARS and true or u5.Global;

        if v32 then
            local v33 = {
                layoutOrder = 100,
                title = "Chests Opened" .. (u5.Global and " (Skywars)" or "")
            };
            local extra = u5.QueueStats.extra;

            if extra ~= nil then
                extra = extra.skywars;

                if extra ~= nil then
                    extra = extra.chestsOpened;
                end;
            end;

            v33.value = tostring(extra == nil and 0 or extra);
            v32 = u12(v33);
        end;

        if v32 then
            v29[v31 + 1] = v32;
        end;

        local v34 = #v29;
        local v35 = u5.GameType == GameType.PVP_ARENA and true or u5.Global;

        if v35 then
            local v36 = {
                layoutOrder = 100,
                title = "Gold Earned" .. (u5.Global and " (Arena Duels)" or "")
            };
            local extra = u5.QueueStats.extra;

            if extra ~= nil then
                extra = extra.pvpArena;

                if extra ~= nil then
                    extra = extra.goldEarned;
                end;
            end;

            v36.value = tostring(extra == nil and 0 or extra);
            v35 = u12(v36);
        end;

        if v35 then
            v29[v34 + 1] = v35;
        end;

        return u2.createFragment({
            AdvancedStats = u2.createElement(Empty, v13, v29)
        });
    end)
};