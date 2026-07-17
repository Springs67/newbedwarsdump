-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TrackType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType;
local StatTrackingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AdvancedStats = RuntimeLib.import(script, script.Parent, "advanced-stats").AdvancedStats;
local SectionTitle = RuntimeLib.import(script, script.Parent, "section-title").SectionTitle;

return {
    GlobalStats = v3.new(u2)(function(p4, p5) -- Line: 12
        -- upvalues: StatTrackingUtil (copy), u1 (copy), u2 (copy), Theme (copy), SectionTitle (copy), Empty (copy), AdvancedStats (copy), TrackType (copy)
        local v6, u7 = p5.useState(false);
        local v8 = p4.GlobalStats or p4.store.Leaderboard.globalStats;
        local Honor = p4.Honor;

        if Honor == nil then
            Honor = p4.store.Lobby.profileData;

            if Honor ~= nil then
                Honor = Honor.honor;
            end;
        end;

        local v9 = StatTrackingUtil.getAccumulatedQueueStats(u1.entries(p4.Queues or p4.store.Leaderboard.queues));

        if v8 ~= nil then
            v8 = v8.wins;
        end;

        local v10;

        if Honor == nil then
            v10 = Honor;
        else
            v10 = Honor.honorPointsReceived;
        end;

        if Honor ~= nil then
            Honor = Honor.honorPointsGiven;
        end;

        local _ = Honor == nil and 0 or Honor;

        local function u14(p11, p12, p13) -- Line: 50
            -- upvalues: u2 (ref), Theme (ref)
            return u2.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.new(0.24, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Theme.backgroundSecondary,
                LayoutOrder = p13
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                }),
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0.075, 0),
                    PaddingRight = UDim.new(0.075, 0)
                }),
                u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextSize = 15,
                    TextTransparency = 0.4,
                    Text = p11,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Position = UDim2.new(0, 10, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextColor3 = Theme.textPrimary
                }),
                u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextSize = 19,
                    Text = tostring(p12),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Position = UDim2.new(0, 10, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
            });
        end;

        local v15 = {
            Wins = {
                layoutOrder = 1,
                value = v8
            },
            ["Bed Breaks"] = {
                layoutOrder = 2,
                value = v9.bedBreaks
            },
            ["Final Kills"] = {
                layoutOrder = 3,
                value = v9.finalKills
            },
            Honor = {
                layoutOrder = 4,
                value = v10 == nil and 0 or v10
            }
        };
        local v16 = {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v18 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12)
            }), u2.createElement(SectionTitle, {
                title = "Global Totals",
                SectionDivider = true,
                Checkbox = {
                    Text = "Show Advanced Stats",
                    Value = v6,

                    SetValue = function(p17) -- Line: 135, Name: SetValue
                        -- upvalues: u7 (copy)
                        u7(p17);
                    end
                }
            }) };
        local v19 = {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v20 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }) };
        local v21 = #v20;
        local v22 = u1.entries(v15);

        local function _(p23) -- Line: 157
            -- upvalues: u14 (copy)
            local v24 = p23[2];
            local value = v24.value;

            return u14(p23[1], value == nil and 0 or value, v24.layoutOrder);
        end;

        local v25 = table.create(#v22);

        for i, v in v22 do
            local _ = i - 1;
            local v26 = v[2];
            local value = v26.value;
            v25[i] = u14(v[1], value == nil and 0 or value, v26.layoutOrder);
        end;

        local v27 = {
            LayoutOrder = 0,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v28 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }) };
        local v29 = #v28;

        for i, v in v25 do
            v28[v29 + i] = v;
        end;

        v20[v21 + 1] = u2.createElement(Empty, v27, v28);
        v20[v21 + 2] = u2.createElement(AdvancedStats, {
            Global = true,
            FrameProps = {
                LayoutOrder = 2,
                Visible = v6
            },
            QueueStats = v9,
            Exclude = { TrackType.FINALKILLS, TrackType.BEDBREAKS }
        });
        v18[#v18 + 1] = u2.createElement(Empty, v19, v20);

        return u2.createElement(Empty, v16, v18);
    end)
};