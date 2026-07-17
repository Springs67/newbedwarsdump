-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    GlobalTeamEventRewardEntryProgressRow = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), ColorUtil (copy), Theme (copy), StringUtil (copy)
        local _ = p5.useState;

        local function _() -- Line: 11
            -- upvalues: u4 (copy)
            return math.clamp(u4.Score / u4.Reward.globalTeamScoreRequired, 0, 1);
        end;

        local function v6() -- Line: 15
            -- upvalues: u2 (ref), ColorUtil (ref), u4 (copy), Theme (ref)
            return u2.createFragment({
                GlobalTeamEventRewardProgressBar = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0,
                    LayoutOrder = 1,
                    Size = UDim2.new(0.78, 0, 0, 12),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = ColorUtil.hexColor(5921943)
                }, {
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    MissionProgressBar = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 0,
                        Size = UDim2.new(math.clamp(u4.Score / u4.Reward.globalTeamScoreRequired, 0, 1), 0, 0, 12),
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = Theme.textPrimary
                    }, { u2.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) })
                })
            });
        end;

        local function v11() -- Line: 42
            -- upvalues: u2 (ref), u4 (copy), ColorUtil (ref)
            local createFragment = u2.createFragment;
            local v7 = {};
            local createElement = u2.createElement;
            local v8 = {
                BackgroundTransparency = 1,
                RichText = true,
                TextSize = 16,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY
            };
            local v9 = math.clamp(u4.Score / u4.Reward.globalTeamScoreRequired, 0, 1) * 100;
            local v10 = math.floor(v9);
            v8.Text = "<b>" .. tostring(v10) .. "%</b>";
            v8.TextColor3 = ColorUtil.WHITE;
            v8.Font = Enum.Font.Roboto;
            v7.MissionProgressPercentage = createElement("TextLabel", v8);

            return createFragment(v7);
        end;

        local function v12() -- Line: 57
            -- upvalues: u2 (ref), StringUtil (ref), u4 (copy), Theme (ref)
            return u2.createFragment({
                MissionProgressValue = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextSize = 16,
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(0, 0),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Text = "<b>(" .. StringUtil.formatNumberWithCommas(u4.Reward.globalTeamScoreRequired) .. ")</b>",
                    TextColor3 = Theme.textSecondary,
                    Font = Enum.Font.Roboto
                })
            });
        end;

        return u2.createFragment({
            MissionProgressWrapper = u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0),
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    Padding = UDim.new(0, 10),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                u2.createElement(v6),
                u2.createElement(v11),
                u2.createElement(v12)
            })
        });
    end)
};