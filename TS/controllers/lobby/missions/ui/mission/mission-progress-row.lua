-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    MissionProgressRow = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: u1 (copy), ColorUtil (copy), Theme (copy)
        local _ = p4.useState;
        local v5;

        if u3.Completed then
            v5 = u3.Mission.goalProgress;
        else
            v5 = u3.Mission.currProgress;
        end;

        u3.Mission.currProgress = v5;

        local function v6() -- Line: 10
            -- upvalues: u1 (ref), ColorUtil (ref), u3 (copy), Theme (ref)
            return u1.createFragment({
                MissionProgressBar = u1.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0,
                    LayoutOrder = 1,
                    Size = UDim2.new(0.78, 0, 0, 12),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = ColorUtil.hexColor(5921943)
                }, {
                    u1.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    MissionProgressBar = u1.createElement("Frame", {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 0,
                        Size = UDim2.new(u3.Mission.currProgress / u3.Mission.goalProgress, 0, 0, 12),
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = Theme.textPrimary
                    }, { u1.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) })
                })
            });
        end;

        local function v10() -- Line: 37
            -- upvalues: u1 (ref), u3 (copy), ColorUtil (ref)
            local createFragment = u1.createFragment;
            local v7 = {};
            local createElement = u1.createElement;
            local v8 = {
                BackgroundTransparency = 1,
                RichText = true,
                TextSize = 16,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY
            };
            local v9 = math.floor(u3.Mission.currProgress / u3.Mission.goalProgress * 100);
            v8.Text = "<b>" .. tostring(v9) .. "%</b>";
            v8.TextColor3 = ColorUtil.WHITE;
            v8.Font = Enum.Font.Roboto;
            v7.MissionProgressPercentage = createElement("TextLabel", v8);

            return createFragment(v7);
        end;

        local function v14() -- Line: 52
            -- upvalues: u1 (ref), u3 (copy), Theme (ref)
            local createFragment = u1.createFragment;
            local v11 = {};
            local createElement = u1.createElement;
            local v12 = {
                BackgroundTransparency = 1,
                RichText = true,
                TextSize = 16,
                LayoutOrder = 3,
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY
            };
            local v13 = math.floor(u3.Mission.currProgress);
            v12.Text = "<b>(<font color=\"#FFFFFF\">" .. tostring(v13) .. "</font>/" .. tostring(u3.Mission.goalProgress) .. ")</b>";
            v12.TextColor3 = Theme.textSecondary;
            v12.Font = Enum.Font.Roboto;
            v11.MissionProgressValue = createElement("TextLabel", v12);

            return createFragment(v11);
        end;

        return u1.createFragment({
            MissionProgressWrapper = u1.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0),
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                u1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    Padding = UDim.new(0, 10),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                u1.createElement(v6),
                u1.createElement(v10),
                u1.createElement(v14)
            })
        });
    end)
};