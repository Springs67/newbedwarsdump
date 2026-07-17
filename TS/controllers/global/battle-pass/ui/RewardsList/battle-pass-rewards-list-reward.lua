-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local EmptyButton = v1.EmptyButton;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v5.TweenService;
local UserInputService = v5.UserInputService;
local RewardTile = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile;
local BPRewardDisplayMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local LobbyTitleDefaults = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").LobbyTitleDefaults;
local RewardDisplayType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    BattlePassRewardsListReward = v4.new(u3)(function(u6, p7) -- Line: 19
        -- upvalues: ColorUtil (copy), u3 (copy), BPRewardDisplayMeta (copy), EmoteMeta (copy), u2 (copy), RewardDisplayType (copy), TweenService (copy), UserInputService (copy), UIUtil (copy), EmptyButton (copy), Theme (copy), LobbyTitleDefaults (copy), RewardTile (copy)
        local useEffect = p7.useEffect;
        local v8 = {
            name = "",
            borderColor = ColorUtil.darken(Color3.fromRGB(78, 80, 130), 0.8),
            backgroundColor = Color3.fromRGB(92, 94, 153),
            frameSize = UDim2.new(0, 75, 0, 75)
        };
        local u9 = v8;
        local comingSoon = u6.Reward.comingSoon;
        local u10 = u3.createRef();
        local u11 = u3.createRef();

        if u6.RewardDisplayType then
            local v12 = BPRewardDisplayMeta[u6.RewardDisplayType];

            if u6.Reward.emote and not EmoteMeta[u6.Reward.emote].animation then
                u9 = v8;
            else
                u9 = v12;
            end;
        elseif comingSoon then
            local function _(p13) -- Line: 42
                -- upvalues: comingSoon (copy)
                return comingSoon.rewardDisplayType == p13;
            end;

            local v14 = nil;

            for i, v in u2.values(RewardDisplayType) do
                local _ = i - 1;

                if comingSoon.rewardDisplayType == v == true then
                    v14 = v;
                    break;
                end;
            end;

            if v14 then
                u9 = BPRewardDisplayMeta[v14];
            end;
        end;

        useEffect(function() -- Line: 59
            -- upvalues: u11 (copy), u9 (ref), TweenService (ref)
            local v15 = u11:getValue();

            if v15 and u9.frameShine then
                TweenService:Create(v15, TweenInfo.new(2.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut, -1, true), {
                    Offset = Vector2.new(1, 0)
                }):Play();
            end;
        end, {});
        useEffect(function() -- Line: 68
            -- upvalues: u6 (copy), UserInputService (ref), UIUtil (ref), u10 (copy)
            if u6.GamepadShouldAutoSelect and UserInputService.GamepadEnabled then
                UIUtil:selectGui(u10:getValue());
            end;
        end, {});
        local createFragment = u3.createFragment;
        local v16 = {};
        local createElement = u3.createElement;
        local v17 = {
            Size = u9.frameSize or v8.frameSize,
            BackgroundTransparency = 0,
            BackgroundColor3 = Theme.backgroundSecondary,
            LayoutOrder = u6.LayoutOrder,

            [u3.Event.MouseEnter] = function() -- Line: 79
                -- upvalues: u6 (copy)
                u6.SetReward(u6.Reward);
                u6.SetActive(u6.Reward);
            end,

            Selectable = true,
            [u3.Ref] = u10
        };
        local v18 = {};
        local v19;

        if comingSoon then
            v19 = u3.createElement("TextLabel", {
                Text = "Coming Soon",
                TextScaled = true,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 0, 0, 40),
                TextColor3 = LobbyTitleDefaults.color,
                TextTransparency = u6.Locked and 0.6 or 0,
                Font = LobbyTitleDefaults.font,
                BackgroundColor3 = LobbyTitleDefaults.backgroundColor,
                BackgroundTransparency = LobbyTitleDefaults.backgroundTransparency
            }, { u3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 4),
                    PaddingRight = UDim.new(0, 6),
                    PaddingLeft = UDim.new(0, 6)
                }) });
        else
            v19 = u3.createElement(RewardTile, {
                Reward = u6.Reward
            });
        end;

        v18[1] = v19;
        v16.LevelRewardFrame = createElement(EmptyButton, v17, v18);

        return createFragment(v16);
    end)
};