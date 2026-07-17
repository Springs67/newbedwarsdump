-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local PlayerLevelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent, "reward", "ui", "reward-showcase").RewardShowcase;
local milestonesLayout = RuntimeLib.import(script, script.Parent, "milestones-config").milestonesLayout;

return {
    MilestonesReward = v3.new(u2)(function(u4, p5) -- Line: 20
        -- upvalues: RewardUtils (copy), DeviceUtil (copy), default (copy), milestonesLayout (copy), u2 (copy), Theme (copy), ColorUtil (copy), PlayerLevelUtil (copy), BedwarsImageId (copy), RewardShowcase (copy), Empty (copy), ButtonComponent (copy), SoundManager (copy), GameSound (copy), Button (copy)
        local useEffect = p5.useEffect;
        local v6 = u4.store.Bedwars.playerLevel >= u4.MilestoneRewardData.levelRequirement;

        local function _(p7) -- Line: 25
            -- upvalues: u4 (copy)
            return p7 == u4.MilestoneRewardData.id;
        end;

        local v8 = nil;

        for i, v in u4.store.Bedwars.milestoneRewardsClaimed do
            local _ = i - 1;

            if v == u4.MilestoneRewardData.id == true then
                v8 = v;
                break;
            end;
        end;

        local u9 = not v8;
        local displayTitle = u4.MilestoneRewardData.reward.displayTitle;

        if displayTitle == nil then
            displayTitle = RewardUtils.getRewardType(u4.MilestoneRewardData.reward);
        end;

        useEffect(function() -- Line: 43
            -- upvalues: u9 (copy), u4 (copy), DeviceUtil (ref), default (ref)
            if u9 and (u4.MilestoneRewardData.instantClaim and not DeviceUtil.isHoarceKat()) then
                default.Client:Get("ClaimMilestoneReward"):CallServer(u4.MilestoneRewardData.id);
            end;
        end, {});
        local v10 = {
            BorderSizePixel = 0,
            LayoutOrder = -1,
            BackgroundTransparency = 1,
            Size = UDim2.new(0, milestonesLayout.distanceX, 1, 0)
        };
        local v11 = { u2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v12 = #v11;
        local v13 = {
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.9, 0.9),
            BackgroundTransparency = v6 and 0 or 0.5,
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v14 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }), u2.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.2),
                BackgroundTransparency = v6 and 0.55 or 0.75,
                BackgroundColor3 = ColorUtil.BLACK
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u2.createElement("TextLabel", {
                    TextSize = 25,
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(1, 1),
                    Text = "Lv. " .. tostring(u4.MilestoneRewardData.levelRequirement),
                    TextColor3 = PlayerLevelUtil.getLevelColor(u4.MilestoneRewardData.levelRequirement),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextTransparency = v6 and 0 or 0.5,
                    TextXAlignment = Enum.TextXAlignment.Center
                }) }) };
        local v15 = #v14;
        local image = u4.MilestoneRewardData.reward.image;
        local v16;

        if image == "" or not image then
            v16 = u2.createElement(RewardShowcase, {
                ZIndex = 10,
                Reward = u4.MilestoneRewardData.reward,
                Position = UDim2.fromOffset(0, 0),
                Size = UDim2.fromScale(1, 1)
            });
        else
            local v17 = {
                Position = UDim2.fromOffset(0, 0),
                Size = UDim2.fromScale(1, 1)
            };
            local image2 = u4.MilestoneRewardData.reward.image;

            if image2 == nil then
                image2 = BedwarsImageId.FREE_KIT_SLOT;
            end;

            v17.Image = image2;
            v17.ScaleType = Enum.ScaleType.Fit;
            v17.BorderSizePixel = 0;
            v17.BackgroundTransparency = 1;
            v17.LayoutOrder = 2;
            v17.ZIndex = 10;
            v16 = u2.createElement("ImageLabel", v17);
        end;

        local v18 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.5)
        };
        local v19 = {
            u2.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 100,
                Position = UDim2.fromOffset(0, 0),
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Theme.backgroundPrimary,
                Transparency = v6 and not u9 and 1 or 0.5
            }),
            [#v19 + 1] = v16
        };
        v14[v15 + 1] = u2.createElement(Empty, v18, v19);
        local v20 = not u4.MilestoneRewardData.instantClaim;

        if v20 then
            if u9 then
                if v6 then
                    v20 = u2.createElement(ButtonComponent, {
                        LayoutOrder = 3,
                        Text = "CLAIM",
                        TextSize = 20,
                        Size = UDim2.fromScale(0.9, 0.2),
                        BackgroundColor3 = Theme.backgroundSuccess,

                        OnClick = function() -- Line: 151, Name: OnClick
                            -- upvalues: DeviceUtil (ref), default (ref), u4 (copy), SoundManager (ref), GameSound (ref)
                            if not DeviceUtil.isHoarceKat() and default.Client:Get("ClaimMilestoneReward"):CallServer(u4.MilestoneRewardData.id) then
                                SoundManager:playSound(GameSound.UI_REWARD);
                            end;
                        end,

                        TextColor3 = ColorUtil.WHITE
                    });
                else
                    v20 = v6;
                end;
            else
                v20 = u9;
            end;
        end;

        if v20 then
            v14[v15 + 2] = v20;
        end;

        local v21 = #v14;
        local v22 = not (u9 and v6) and u2.createElement(Button, {
            BorderSizePixel = 0,
            LayoutOrder = 3,
            Selectable = true,
            Size = UDim2.fromScale(0.9, 0.2),
            BackgroundTransparency = v6 and 0.55 or 0.75,
            BackgroundColor3 = ColorUtil.BLACK,

            OnClick = function() -- Line: 175, Name: OnClick
            end
        }, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            u2.createElement("TextLabel", {
                TextSize = 15,
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.4),
                Text = displayTitle,
                TextColor3 = Theme.textPrimary,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextTransparency = v6 and 0 or 0.5,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }),
            u2.createElement("TextLabel", {
                TextSize = 20,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.4),
                Text = u4.MilestoneRewardData.description,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextTransparency = v6 and 0 or 0.5,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });

        if v22 then
            v14[v21 + 1] = v22;
        end;

        v11[v12 + 1] = u2.createElement("Frame", v13, v14);
        v11[v12 + 2] = u2.createElement("ImageLabel", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.15, 0.075),
            AutomaticSize = Enum.AutomaticSize.Y,
            Image = BedwarsImageId.TRIANGLE_DOWN,
            ImageColor3 = Theme.backgroundPrimary,
            ImageTransparency = v6 and 0 or 0.5,
            ScaleType = Enum.ScaleType.Stretch
        });

        return u2.createFragment({
            MilestonesReward = u2.createElement("Frame", v10, v11)
        });
    end)
};