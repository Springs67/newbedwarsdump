-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MilestoneRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards;
local MilestonesReward = RuntimeLib.import(script, script.Parent, "milestones-reward").MilestonesReward;

return {
    MilestonesRewardsContainer = v3.new(u2)(function(u4, p5) -- Line: 10
        -- upvalues: u2 (copy), MilestonesReward (copy), MilestoneRewards (copy), ColorUtil (copy), Empty (copy)
        local v6 = {
            Size = u4.Size
        };
        local v7 = {};
        local _ = #v7;

        local function _(p8) -- Line: 16
            -- upvalues: u2 (ref), MilestonesReward (ref), u4 (copy)
            return u2.createElement(MilestonesReward, {
                store = u4.store,
                MilestoneRewardData = p8
            });
        end;

        local v9 = table.create(#MilestoneRewards);

        for i, v in MilestoneRewards do
            local _ = i - 1;
            v9[i] = u2.createElement(MilestonesReward, {
                store = u4.store,
                MilestoneRewardData = v
            });
        end;

        local v10 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = ColorUtil.WHITE,
            LayoutOrder = u4.LayoutOrder
        };
        local v11 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v12 = #v11;

        for i, v in v9 do
            v11[v12 + i] = v;
        end;

        v7.MilestonesRewardsContainer = u2.createElement("Frame", v10, v11);

        return u2.createElement(Empty, v6, v7);
    end)
};