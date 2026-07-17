-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "reward", "ui", "reward-showcase").RewardShowcase;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KitContractRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards;
local KitContractUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    KitContractRewardsListCard = v3.new(u2)(function(u4, p5) -- Line: 17
        -- upvalues: KitContractRewards (copy), KitContractUtils (copy), u2 (copy), ColorUtil (copy), Theme (copy), RewardShowcase (copy), BedwarsImageId (copy), RewardUtils (copy), AutoSizedText (copy), TooltipContainer (copy), ImageId (copy), Empty (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local rewards = KitContractRewards[u4.SelectedKit].rewards;
        local v6 = KitContractUtils.getProgressBarPercentage(u4.Reward.tier, u4.SelectedKit, u4.KitStats);
        local v7 = KitContractUtils.getRewardFromTier(rewards, u4.Reward.tier);

        if v7 ~= nil then
            v7 = v7.requiresPurchaseUnlock;
        end;

        local purchasedUnlock = u4.KitContractProfile.purchasedUnlock;
        local v8;

        if v6 > 0 then
            v8 = v6 < 1;
        else
            v8 = false;
        end;

        local v9;

        if v6 >= 1 then
            v9 = not v7 and true or purchasedUnlock;
        else
            v9 = false;
        end;

        local v10 = {};

        for i, v in u4 do
            v10[i] = v;
        end;

        v10.store = nil;
        v10.Reward = nil;
        v10.KitStats = nil;
        v10.KitContractProfile = nil;
        v10.SelectedKit = nil;
        v10.OnSelectCard = nil;
        v10.ActiveCard = nil;
        local v11 = {};

        for i, v in v10 do
            v11[i] = v;
        end;

        local v12 = {};
        local v13 = {
            Size = UDim2.fromScale(1, 0.95),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v14 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.05, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top
            }) };
        local v15 = #v14;
        local v16;

        if u4.ActiveCard.tier == u4.Reward.tier then
            v16 = u2.createElement("UIStroke", {
                Thickness = 2,
                Color = ColorUtil.WHITE
            });
        else
            v16 = false;
        end;

        if v16 then
            v14[v15 + 1] = v16;
        end;

        local _ = #v14;
        v14.KitContractRewardCardHeader = u2.createElement("Frame", {
            LayoutOrder = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.2),
            BackgroundColor3 = Theme.backgroundTertiary
        }, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }),
            ProgressBar = u2.createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.fromScale(1, 0.2),
                BackgroundColor3 = Theme.textPrimary
            }, {
                Bar = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.fromScale(0, 1),
                    Size = UDim2.fromScale(v6, 1),
                    BackgroundColor3 = KitContractUtils.ProgressColor
                }),
                u2.createElement("Frame")
            }),
            Tier = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextWrapped = true,
                Size = UDim2.fromScale(1, 0.75),
                Text = tostring(u4.Reward.tier),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }, { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 2)
                }) })
        });
        local v17 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.8)
        };
        local v18 = {};
        local v19 = #v18;
        local v20 = u4.Reward.requiresPurchaseUnlock and u2.createFragment({
            DarkOverlay = u2.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 10,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.BLACK,
                BackgroundTransparency = v8 and 0.8 or 0.5
            })
        });

        if v20 then
            v18[v19 + 1] = v20;
        end;

        local _ = #v18;
        local v21 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v22 = {};
        local createElement = u2.createElement;
        local v25 = {
            Size = UDim2.fromScale(1, 1),
            ImageTransparency = 1,
            BackgroundColor3 = ColorUtil.darken(Theme.backgroundPrimary, 0.6),
            BorderSizePixel = 0,

            [u2.Event.MouseButton1Click] = function() -- Line: 142
                -- upvalues: u4 (copy)
                u4.OnSelectCard(u4.Reward.tier);
            end,

            [u2.Event.MouseEnter] = function(p23) -- Line: 145
                p23.BackgroundTransparency = 0.5;
            end,

            [u2.Event.MouseLeave] = function(p24) -- Line: 148
                p24.BackgroundTransparency = 0.4;
            end,

            BackgroundTransparency = 0.5
        };
        local v26 = {};
        local createElement2 = u2.createElement;
        local v27 = {
            Size = UDim2.fromScale(0.95, 0.95),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Reward = u4.Reward
        };
        local v28;

        if v7 then
            v28 = not purchasedUnlock;
        else
            v28 = v7;
        end;

        v27.DisableTooltip = v28;
        v27.GroupTransparency = v8 and 0 or 0.4;
        v26[1] = createElement2(RewardShowcase, v27);
        v22[1] = createElement("ImageButton", v25, v26);
        local _ = #v22;
        local v29;

        if v7 and not purchasedUnlock then
            local v30 = {
                BackgroundTransparency = 1,
                ZIndex = 11,
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.LOCK_ART,
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            };
            local v31 = {};
            local v32 = {};
            local v33 = #v32;
            local v34 = {};
            local comingSoonReward = u4.Reward.comingSoonReward;

            if comingSoonReward ~= nil then
                comingSoonReward = comingSoonReward.text;
            end;

            if comingSoonReward == nil then
                local v35 = RewardUtils.getRewardName(u4.Reward);
                comingSoonReward = v35 == nil and "" or v35;
            end;

            v34.Text = comingSoonReward;
            v34.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
            v34.TextSize = 16;
            v34.Limits = Vector2.new(300, 60);
            v32[v33 + 1] = u2.createElement(AutoSizedText, v34);
            local v36 = {};
            local v37 = RewardUtils.getRewardType(u4.Reward);
            v36.Text = v37 == nil and "" or v37;
            v36.FontFace = Font.fromName("Roboto");
            v36.TextColor3 = Color3.fromRGB(191, 191, 191);
            v36.TextSize = 14;
            v36.Limits = Vector2.new(300, 60);
            v32[v33 + 2] = u2.createElement(AutoSizedText, v36);
            v32[v33 + 3] = u2.createElement(AutoSizedText, {
                Text = "* Purchase unlock for tiers 5-10 to obtain rewards!",
                TextSize = 14,
                FontFace = Font.fromName("Roboto"),
                TextColor3 = Color3.fromRGB(191, 191, 191),
                Limits = Vector2.new(300, 60)
            });
            v31[#v31 + 1] = u2.createElement(TooltipContainer, {}, v32);
            v29 = u2.createElement("ImageLabel", v30, v31);
        else
            local v38 = {};
            local v39 = #v38;

            if v9 then
                v9 = u2.createFragment({
                    RewardStatusImage = u2.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.fromScale(0.9, 0.5),
                        Size = UDim2.fromScale(0.9, 0.9),
                        Image = ImageId.CHECK_CIRCLE_SOLID,
                        ImageColor3 = KitContractUtils.ProgressColor
                    }, { u2.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, 10),
                            PaddingTop = UDim.new(0, 10)
                        }), u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) })
                });
            end;

            if v9 then
                v38[v39 + 1] = v9;
            end;

            v38[#v38 + 1] = u2.createElement("TextLabel", {
                Text = "FREE",
                TextScaled = true,
                TextXAlignment = "Center",
                BackgroundTransparency = 1,
                TextColor3 = ColorUtil.WHITE,
                Size = UDim2.fromScale(0.9, 0.9),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }, { u2.createElement("UIStroke", {
                    Transparency = 0.3,
                    Color = ColorUtil.BLACK
                }) });
            v29 = u2.createFragment(v38);
        end;

        local v40 = {
            Size = UDim2.fromScale(1, 0.2),
            Position = UDim2.fromScale(0.5, 0.9),
            AnchorPoint = Vector2.new(0.5, 1)
        };
        local v41 = {
            [#v41 + 1] = v29
        };
        v22.BottomSection = u2.createElement(Empty, v40, v41);
        v18.KitContractRewardListCardShowcase = u2.createElement("Frame", v21, v22);
        v14.KitContractRewardListCardShowcaseContainer = u2.createElement(Empty, v17, v18);
        v12[#v12 + 1] = u2.createElement(Empty, v13, v14);

        return u2.createFragment({
            ["KitContractRewardsListCard" .. tostring(u4.Reward.tier)] = u2.createElement(Empty, v11, v12)
        });
    end)
};