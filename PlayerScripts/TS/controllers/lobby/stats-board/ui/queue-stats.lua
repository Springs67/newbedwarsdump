-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getGameMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-meta").getGameMeta;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local TrackType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AdvancedStats = RuntimeLib.import(script, script.Parent, "advanced-stats").AdvancedStats;
local SectionTitle = RuntimeLib.import(script, script.Parent, "section-title").SectionTitle;

return {
    QueueStatsDisplay = v3.new(u2)(function(p4, p5) -- Line: 14
        -- upvalues: getQueueMeta (copy), getGameMeta (copy), TrackType (copy), u2 (copy), Theme (copy), ColorUtil (copy), SectionTitle (copy), Empty (copy), AdvancedStats (copy)
        local v6, u7 = p5.useState(false);
        local v8 = p4.Queues or p4.store.Leaderboard.queues;
        local v9 = getQueueMeta(p4.QueueType);
        local title = v9.title;
        local v10 = v8[p4.QueueType];
        local v11;

        if v10 == nil then
            v11 = v10;
        else
            v11 = v10.wins;
        end;

        local v12;

        if v10 == nil then
            v12 = v10;
        else
            v12 = v10.bedBreaks;
        end;

        local v13;

        if v10 == nil then
            v13 = v10;
        else
            v13 = v10.finalKills;
        end;

        local v14;

        if v10 == nil then
            v14 = v10;
        else
            v14 = v10.highestWinStreak;
        end;

        local v15;

        if v10 == nil then
            v15 = v10;
        else
            v15 = v10.currentWinStreak;
        end;

        local v16 = getGameMeta(v9.game);
        local v17 = {};
        local v18 = #v17;
        local v19 = v9.excludedStats or {};
        local v20 = #v19;
        table.move(v19, 1, v20, v18 + 1, v17);
        local v21 = v16.excludedStats or {};
        table.move(v21, 1, #v21, v18 + v20 + 1, v17);
        local v22 = table.find(v17, TrackType.BEDBREAKS) ~= nil;
        local disabledFeatures = v9.disabledFeatures;

        if disabledFeatures ~= nil then
            disabledFeatures = disabledFeatures.disableTitan;
        end;

        if disabledFeatures then
            table.insert(v17, TrackType.TITANKILLS);
        end;

        local disabledFeatures2 = v9.disabledFeatures;

        if disabledFeatures2 ~= nil then
            disabledFeatures2 = disabledFeatures2.disableDiamondGuardians;
        end;

        if disabledFeatures2 then
            table.insert(v17, TrackType.DIAMONDGUARDIANKILLS);
        end;

        local disabledFeatures3 = v9.disabledFeatures;

        if disabledFeatures3 ~= nil then
            disabledFeatures3 = disabledFeatures3.disableEnchantTable;
        end;

        if disabledFeatures3 then
            table.insert(v17, TrackType.ENCHANTS);
        end;

        local function v27(p23, p24, p25, p26) -- Line: 85
            -- upvalues: u2 (ref), Theme (ref)
            return u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextSize = 16,
                RichText = true,
                Text = p23 .. "  <b>" .. p24 .. ":</b> <font color=\"" .. Theme.textPrimaryRichText .. "\">" .. tostring(p25) .. "</font>",
                AutomaticSize = Enum.AutomaticSize.XY,
                Font = Enum.Font.Roboto,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                LayoutOrder = p26
            });
        end;

        local function v34(p28) -- Line: 98
            -- upvalues: ColorUtil (ref), u2 (ref)
            local statElements = p28.statElements;
            local xSize = p28.xSize;
            local layoutOrder = p28.layoutOrder;
            local minSize = p28.minSize;

            local function _(p29) -- Line: 103
                return p29;
            end;

            local v30 = table.create(#statElements);

            for i, v in statElements do
                local _ = i - 1;
                v30[i] = v;
            end;

            local v31 = {
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                Size = UDim2.new(xSize, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = ColorUtil.hexColor(7567033),
                LayoutOrder = layoutOrder
            };
            local v32 = {
                u2.createElement("UISizeConstraint", {
                    MinSize = minSize
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 12)
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                }),
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12),
                    PaddingBottom = UDim.new(0, 12),
                    PaddingLeft = UDim.new(0, 16),
                    PaddingRight = UDim.new(0, 16)
                })
            };
            local v33 = #v32;

            for i, v in v30 do
                v32[v33 + i] = v;
            end;

            return u2.createElement("Frame", v31, v32);
        end;

        local v35 = {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = p4.LayoutOrder
        };
        local v37 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }), u2.createElement(SectionTitle, {
                title = title,
                Checkbox = {
                    Text = "Show Advanced Stats",
                    Value = v6,

                    SetValue = function(p36) -- Line: 165, Name: SetValue
                        -- upvalues: u7 (copy)
                        u7(p36);
                    end
                }
            }) };
        local v38 = {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v39 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }) };
        local v40 = #v39;
        local v41 = not v22 and u2.createElement(v34, {
            xSize = 1,
            layoutOrder = 0,
            statElements = { v27("🏆", "Wins", v11, 1) }
        });

        if v41 then
            v39[v40 + 1] = v41;
        end;

        local v42 = #v39;
        local createElement = u2.createElement;
        local v43 = {
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v44 = {};
        local v45 = u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        });
        local createElement2 = u2.createElement;
        local v46 = {
            xSize = 0.491,
            layoutOrder = 1
        };
        local v47;

        if v22 then
            v47 = { v27("🏆", "Wins", v11, 1), v27("🎖️", "Final Kills", v13, 2) };
        else
            v47 = { v27("🛏️", "Bed Breaks", v12, 1), v27("🎖️", "Final Kills", v13, 2) };
        end;

        v46.statElements = v47;
        v44[1], v44[2], v44[3] = v45, createElement2(v34, v46), u2.createElement(v34, {
    xSize = 0.491,
    layoutOrder = 1,
    statElements = { v27("🔥", "Highest", v14, 1), v27("🔥", "Current", v15, 2) }
});
        v39[v42 + 1] = createElement(Empty, v43, v44);

        if v10 then
            local v48 = {
                FrameProps = {
                    LayoutOrder = 2,
                    Visible = v6
                },
                QueueStats = v10,
                GameType = v9.game
            };
            local v49 = {};
            local v50 = #v49;
            local v51 = #v17;
            table.move(v17, 1, v51, v50 + 1, v49);
            local v52 = v50 + v51;
            v49[v52 + 1] = TrackType.BEDBREAKS;
            v49[v52 + 2] = TrackType.FINALKILLS;
            v48.Exclude = v49;
            v10 = u2.createElement(AdvancedStats, v48);
        end;

        if v10 then
            v39[v42 + 2] = v10;
        end;

        v37[#v37 + 1] = u2.createElement(Empty, v38, v39);

        return u2.createElement(Empty, v35, v37);
    end)
};