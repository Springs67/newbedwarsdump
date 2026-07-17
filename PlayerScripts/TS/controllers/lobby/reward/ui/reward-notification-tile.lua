-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local RewardTile = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile;
local Ripple = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "ripple").Ripple;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local RewardConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-constants").RewardConstants;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = {
    GameSound.BUBBLE_POP1,
    GameSound.BUBBLE_POP2,
    GameSound.BUBBLE_POP3,
    GameSound.BUBBLE_POP4,
    GameSound.BUBBLE_POP5,
    GameSound.BUBBLE_POP6
};

return {
    RewardNotificationTile = v3.new(u2)(function(u5, p6) -- Line: 20
        -- upvalues: u2 (copy), DeviceUtil (copy), KnitClient (copy), UIUtil (copy), RandomUtil (copy), u4 (copy), SoundManager (copy), TweenService (copy), RewardConstants (copy), ClientStore (copy), Button (copy), Empty (copy), RewardTile (copy), Ripple (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u2.createRef();
        local u8 = u2.createRef();
        useEffect(function() -- Line: 27
            -- upvalues: u7 (copy), u8 (copy), u5 (copy), DeviceUtil (ref), KnitClient (ref), UIUtil (ref), RandomUtil (ref), u4 (ref), SoundManager (ref), TweenService (ref), RewardConstants (ref), ClientStore (ref)
            local u9 = u7:getValue();
            local u10 = u8:getValue();
            local v11 = 0.15 * u5.Index;

            if not u10 then
                return nil;
            end;

            local u12;

            if DeviceUtil.isHoarceKat() then
                u12 = true;
            else
                local v13 = KnitClient.Controllers.RewardNotificationController:getRewardsDisplayed();
                local v14 = table.find(v13, u5.Reward) ~= nil;
                u12 = not v14;
            end;

            local u15;

            if u12 then
                u15 = UIUtil:setContainerTransparency(u10, 1, {
                    onCleanUpTweenInfo = TweenInfo.new(0.35),
                    durationTillCleanUp = v11
                });
            else
                u15 = nil;
            end;

            task.delay(v11, function() -- Line: 50
                -- upvalues: u12 (copy), DeviceUtil (ref), KnitClient (ref), u5 (ref), RandomUtil (ref), u4 (ref), SoundManager (ref), u15 (ref), TweenService (ref), u10 (copy), u9 (copy), RewardConstants (ref), UIUtil (ref), ClientStore (ref)
                if not u12 then
                    return nil;
                end;

                task.spawn(function() -- Line: 54
                    -- upvalues: DeviceUtil (ref), KnitClient (ref), u5 (ref), RandomUtil (ref), u4 (ref), SoundManager (ref), u15 (ref), TweenService (ref), u10 (ref), u9 (ref), RewardConstants (ref), UIUtil (ref), ClientStore (ref)
                    if not DeviceUtil.isHoarceKat() then
                        KnitClient.Controllers.RewardNotificationController:addRewardDisplayed(u5.Reward);
                    end;

                    SoundManager:playSound(RandomUtil.fromList(unpack(u4)), {
                        looped = false
                    });
                    local v16 = u15;

                    if v16 ~= nil then
                        v16:DoCleaning();
                    end;

                    TweenService:Create(u10, TweenInfo.new(0.35, Enum.EasingStyle.Cubic), {
                        Size = UDim2.fromScale(1, 1)
                    }):Play();
                    TweenService:Create(u10, TweenInfo.new(0.35, Enum.EasingStyle.Cubic), {
                        Position = UDim2.fromScale(0.5, 0.5)
                    }):Play();

                    if u9 then
                        task.delay(RewardConstants.REWARD_NOTIFICATION_LIFETIME - 0.3, function() -- Line: 76
                            -- upvalues: UIUtil (ref), u9 (ref)
                            UIUtil:setContainerTransparency(u9, 1, {
                                onSetTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Cubic)
                            });
                        end);
                        task.delay(RewardConstants.REWARD_NOTIFICATION_LIFETIME, function() -- Line: 81
                            -- upvalues: ClientStore (ref), u5 (ref), u9 (ref)
                            ClientStore:dispatch({
                                type = "LobbyRemoveRewardToDisplay",
                                rerender = true,
                                reward = u5.Reward
                            });
                            u9:Destroy();
                        end);
                    end;
                end);
            end);
        end);

        return u2.createElement(Button, {
            [u2.Ref] = u7,

            OnClick = function() -- Line: 95, Name: OnClick
                -- upvalues: ClientStore (ref), u5 (copy)
                ClientStore:dispatch({
                    type = "LobbyRemoveRewardToDisplay",
                    rerender = true,
                    reward = u5.Reward
                });
            end,

            BackgroundTransparency = 1,
            DisableDefaultSound = true,
            LayoutOrder = u5.Index,
            ZIndex = 2
        }, { u2.createElement(Empty, {
                [u2.Ref] = u8,
                Size = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.2)
            }, { u2.createElement(RewardTile, {
                    Simple = true,
                    DisablePreview = true,
                    Reward = u5.Reward
                }) }), u2.createElement(Ripple) });
    end)
};