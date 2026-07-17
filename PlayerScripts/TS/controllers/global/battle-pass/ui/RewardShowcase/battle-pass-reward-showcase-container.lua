-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local BattlePassRewardInfoCard = RuntimeLib.import(script, script.Parent, "battle-pass-reward-info-card").BattlePassRewardInfoCard;
local BattlePassRewardShowcase = RuntimeLib.import(script, script.Parent, "battle-pass-reward-showcase").BattlePassRewardShowcase;

return {
    BattlePassRewardShowcaseContainer = v3.new(u2)(function(p4, p5) -- Line: 12
        -- upvalues: u2 (copy), u1 (copy), RunService (copy), BattlePassUtils (copy), Theme (copy), ColorUtil (copy), BattlePassRewardShowcase (copy), BattlePassRewardInfoCard (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        useEffect(function() -- Line: 16
            -- upvalues: u1 (ref), u6 (copy), RunService (ref)
            local u7 = u1.new();
            local u8 = u6:getValue();

            if u8 then
                u7:GiveTask(RunService.Heartbeat:Connect(function(p9) -- Line: 21
                    -- upvalues: u8 (copy)
                    u8.Rotation = (u8.Rotation + 45 * p9) % 360;
                end));
            end;

            return function() -- Line: 26
                -- upvalues: u7 (copy)
                u7:DoCleaning();
            end;
        end, {});
        local v10 = BattlePassUtils.getRewardThemeColor(p4.Reward) or Theme.backgroundPrimary;
        local v11;

        if v10 == Theme.backgroundPrimary or v10 == Theme.backgroundTertiary then
            v11 = ColorSequence.new({ ColorSequenceKeypoint.new(0, v10), ColorSequenceKeypoint.new(1, ColorUtil.brighten(v10, 0.2)) });
        else
            v11 = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.darken(v10, 0.6)), ColorSequenceKeypoint.new(1, ColorUtil.brighten(v10, 0.1)) });
        end;

        return u2.createElement("Frame", {
            BorderSizePixel = 0,
            Size = p4.Size or UDim2.new(0.32, -10, 1, 0),
            BackgroundColor3 = ColorUtil.WHITE
        }, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }),
            u2.createElement("UIStroke", {
                Thickness = 2,
                Color = ColorUtil.brighten(v10, 0.25)
            }, { u2.createElement("UIGradient", {
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.7, 0), NumberSequenceKeypoint.new(1, 1) }),
                    [u2.Ref] = u6
                }) }),
            u2.createElement("UIGradient", {
                Rotation = 45,
                Color = v11
            }),
            u2.createElement(BattlePassRewardShowcase, {
                LayoutOrder = 2,
                Reward = p4.Reward,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.4),
                Size = UDim2.new(0.8, 0, 0.8, 0)
            }),
            u2.createElement(BattlePassRewardInfoCard, {
                LayoutOrder = 3,
                Reward = p4.Reward,
                BattlePass = p4.BattlePass,
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.new(1, 0, 0.3, 0)
            })
        });
    end)
};