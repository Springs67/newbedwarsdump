-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BattlePassRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards;
local BattlePassRewardShowcaseContainer = RuntimeLib.import(script, script.Parent, "RewardShowcase", "battle-pass-reward-showcase-container").BattlePassRewardShowcaseContainer;
local BattlePassRewardsList = RuntimeLib.import(script, script.Parent, "RewardsList", "battle-pass-rewards-list").BattlePassRewardsList;
local BattlePassPurchaseButtons = RuntimeLib.import(script, script.Parent, "SeasonInfo", "battle-pass-purchase-buttons").BattlePassPurchaseButtons;
local BattlePassInfoCard = RuntimeLib.import(script, script.Parent, "SeasonInfo", "Card", "battle-pass-season-info-card").BattlePassInfoCard;

return {
    BattlePassCore = v3.new(u2)(function(u4, p5) -- Line: 17
        -- upvalues: BattlePassRewards (copy), Flamework (copy), u2 (copy), BattlePassRewardsList (copy), ScaleComponent (copy), DeviceUtil (copy), Empty (copy), BattlePassInfoCard (copy), BattlePassPurchaseButtons (copy), BattlePassRewardShowcaseContainer (copy), WidgetComponent (copy), SlideIn (copy)
        local useMemo = p5.useMemo;
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(nil);
        useEffect(function() -- Line: 22
            -- upvalues: BattlePassRewards (ref), u4 (copy), u7 (copy)
            local function _(p8) -- Line: 24
                return p8.level == 1;
            end;

            local v9 = nil;

            for i, v in BattlePassRewards[u4.battlepass] do
                local _ = i - 1;

                if v.level == 1 == true then
                    v9 = v;
                    break;
                end;
            end;

            u7(v9);
        end, { u4.battlepass });

        local function v10() -- Line: 38
            -- upvalues: Flamework (ref), u4 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u4.AppId);
        end;

        useMemo(function() -- Line: 41
            -- upvalues: u2 (ref), BattlePassRewardsList (ref), u4 (copy), u7 (copy)
            return u2.createElement(BattlePassRewardsList, {
                LayoutOrder = 2,
                store = u4.store,
                battlepass = u4.battlepass,
                Size = UDim2.new(1, 0, 0.5, -10),
                SetReward = u7
            });
        end, { u4.store.BattlePass });
        local v11 = {};
        local _ = #v11;
        local v12 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(1200, 545)
        };
        local v13 = {};
        local createElement = u2.createElement;
        local v14 = {
            MaximumSize = Vector2.new(1500, 720)
        };
        local v15;

        if DeviceUtil.isSmallScreen() then
            v15 = Vector2.new(48, 48);
        else
            v15 = Vector2.new(24, 24);
        end;

        v14.ScreenPadding = v15;
        v13[1] = createElement(ScaleComponent, v14);
        local v16 = {
            Title = "Battle Pass",
            AppId = u4.AppId,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            OnClose = v10
        };
        local v17 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 20)
            }), u2.createElement(Empty, {
                Size = UDim2.new(0.73, -10, 1, 0)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 10)
                }),
                TopFrameRow = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.new(1, 0, 0.3, -5)
                }, {
                    u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24)
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 8)
                    }),
                    u2.createElement(BattlePassInfoCard, {
                        store = u4.store,
                        battlepass = u4.battlepass,
                        Size = UDim2.new(0.4, -4, 1, 0)
                    }),
                    u2.createElement(BattlePassPurchaseButtons, {
                        LayoutOrder = 2,
                        store = u4.store,
                        battlepass = u4.battlepass,
                        Size = UDim2.new(0.4, -4, 1, 0)
                    })
                }),
                u2.createElement(BattlePassRewardsList, {
                    LayoutOrder = 2,
                    store = u4.store,
                    battlepass = u4.battlepass,
                    Size = UDim2.new(1, 0, 0.7, -5),
                    SetReward = u7
                })
            }) };
        local v18 = #v17;

        if v6 then
            v6 = u2.createElement(BattlePassRewardShowcaseContainer, {
                BattlePass = u4.store.BattlePass,
                Reward = v6,
                Size = UDim2.new(0.27, -10, 1, 0)
            });
        end;

        if v6 then
            v17[v18 + 1] = v6;
        end;

        v13[#v13 + 1] = u2.createElement(WidgetComponent, v16, v17);
        v11.BattlePassApp = u2.createElement("Frame", v12, v13);

        return u2.createElement(SlideIn, {}, v11);
    end)
};