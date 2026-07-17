-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "reward", "ui", "reward-showcase").RewardShowcase;

return {
    BattlePassRewardShowcase = v2.new(u1)(function(p3, p4) -- Line: 6
        -- upvalues: u1 (copy), RewardShowcase (copy)
        if p3.Reward.comingSoon then
            return u1.createFragment({
                RewardShowcase = u1.createElement("Frame", {
                    BackgroundTransparency = 1,
                    Size = p3.Size,
                    LayoutOrder = p3.LayoutOrder
                })
            });
        end;

        local v5 = {};

        for i, v in p3 do
            v5[i] = v;
        end;

        v5.Reward = nil;
        local v6 = {
            Reward = p3.Reward
        };

        for i, v in v5 do
            v6[i] = v;
        end;

        return u1.createElement(RewardShowcase, v6);
    end)
};