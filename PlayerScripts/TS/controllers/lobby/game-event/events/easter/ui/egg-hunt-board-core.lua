-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EggHuntMilestoneProgress = RuntimeLib.import(script, script.Parent, "egg-hunt-milestone-progress").EggHuntMilestoneProgress;
local EggHuntMilestoneRewardsList = RuntimeLib.import(script, script.Parent, "egg-hunt-milestone-rewards-list").EggHuntMilestoneRewardsList;

return {
    EggHuntBoardCore = v3.new(u2)(function(p4, p5) -- Line: 12
        -- upvalues: u2 (copy), Theme (copy), Padding (copy), ColorUtil (copy), Empty (copy), EggHuntMilestoneRewardsList (copy), EggHuntMilestoneProgress (copy)
        local _ = p5.useState;

        return u2.createElement("Frame", {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundSecondary
        }, {
            u2.createElement(Padding, {
                Padding = {
                    Horizontal = 16,
                    Vertical = 10
                }
            }),
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 16)
            }),
            u2.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                TextXAlignment = "Left",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.1),
                Text = "🥚🐇 EGG HUNT REWARDS: (<font color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\">" .. tostring(p4.numEggsCollected) .. "</font>/" .. tostring(18) .. " eggs found)",
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.GothamBlack
            }, { u2.createElement("UIStroke", {
                    Thickness = 2,
                    Color = ColorUtil.BLACK
                }) }),
            u2.createElement("ScrollingFrame", {
                ScrollBarThickness = 6,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Selectable = false,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0.9, -16),
                AutomaticCanvasSize = Enum.AutomaticSize.XY,
                ScrollingDirection = Enum.ScrollingDirection.X
            }, { u2.createElement(Empty, {
                    Size = UDim2.new(1, 0, 0.95, 0)
                }, { u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 10)
                    }), u2.createElement(EggHuntMilestoneRewardsList, {
                        AppId = "EasterProgressList",
                        Milestones = p4.milestoneMeta,
                        Rewards = p4.milestoneRewardsMeta,
                        Progress = p4.numEggsCollected,
                        Size = UDim2.new(1, 0, 0.9, -10)
                    }), u2.createElement(EggHuntMilestoneProgress, {
                        LayoutOrder = 2,
                        Milestones = p4.milestoneMeta,
                        Progress = p4.numEggsCollected,
                        Size = UDim2.fromScale(1, 0.1)
                    }) }) })
        });
    end)
};