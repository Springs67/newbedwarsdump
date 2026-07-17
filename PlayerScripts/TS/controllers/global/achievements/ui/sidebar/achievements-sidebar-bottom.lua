-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RewardTile = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    AchievementsSidebarBottom = v3.new(u2)(function(p4, p5) -- Line: 15
        -- upvalues: AchievementUtil (copy), ColorUtil (copy), u2 (copy), Empty (copy), Theme (copy), BedwarsImageId (copy), RewardTile (copy), Button (copy), default (copy), ClientStore (copy)
        local _ = p5.useState;
        local AchievementId = p4.AchievementId;
        local AchievementMeta = p4.AchievementMeta;
        local AchievementData = p4.AchievementData;

        if AchievementMeta ~= nil then
            AchievementMeta = AchievementMeta.rewards;
        end;

        local v6;

        if AchievementId and AchievementData then
            v6 = AchievementUtil.hasUnclaimedRewards(AchievementId, AchievementData);
        else
            v6 = false;
        end;

        local u7;

        if AchievementData == nil then
            u7 = AchievementData;
        else
            u7 = AchievementData.rewardsClaimed;
        end;

        if u7 == nil then
            u7 = false;
        end;

        local v8 = {
            Size = UDim2.fromScale(1, 0.02)
        };
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v8[i] = v;
            end;
        end;

        v8.Visible = true;

        if AchievementMeta then
            local v9 = {
                LayoutOrder = 10,
                BackgroundTransparency = 0.7,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.8),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                BackgroundColor3 = ColorUtil.BLACK
            };
            local v10 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }), u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }) };
            local v11 = #v10;
            local v12 = not (v6 or u7) and u2.createElement(Empty, {
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.2)
            }, { u2.createElement("TextLabel", {
                    Text = "REWARDS",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = Theme.textPrimary,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }) });

            if v12 then
                v10[v11 + 1] = v12;
            end;

            local v13 = #v10;

            local function v20(p14) -- Line: 90
                -- upvalues: Theme (ref), AchievementData (copy), u2 (ref), BedwarsImageId (ref), ColorUtil (ref), RewardTile (ref), Empty (ref)
                local v15 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v16 = {};
                local v17 = #v16;
                local v18 = {
                    BackgroundTransparency = 0.5,
                    ZIndex = 2,
                    Size = UDim2.new(1, 4, 1, 4),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundColor3 = Theme.backgroundSecondary
                };
                local v19 = AchievementData;

                if v19 ~= nil then
                    v19 = v19.rewardsClaimed;
                end;

                v18.Visible = v19 ~= nil;
                v16[v17 + 1] = u2.createElement("Frame", v18, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 5)
                    }), u2.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ZIndex = 3,
                        Size = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        ScaleType = Enum.ScaleType.Fit,
                        Image = BedwarsImageId.CHECK_SOLID,
                        ImageColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }), u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
                v16[v17 + 2] = u2.createElement(RewardTile, {
                    ZIndex = 0,
                    Reward = p14
                });
                v16[v17 + 3] = u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                });

                return u2.createElement(Empty, v15, v16);
            end;

            local v21 = table.create(#AchievementMeta);

            for i, v in AchievementMeta do
                v21[i] = v20(v, i - 1, AchievementMeta);
            end;

            local v22 = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.7)
            };
            local v23 = { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 5),
                    PaddingRight = UDim.new(0, 5)
                }), u2.createElement("UIGridLayout", {
                    FillDirectionMaxCells = 5,
                    CellSize = UDim2.new(0.2, 0, 1, 0),
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }) };
            local v24 = #v23;

            for i, v in v21 do
                v23[v24 + i] = v;
            end;

            v10[v13 + 1] = u2.createElement(Empty, v22, v23);

            if v6 or u7 then
                if AchievementId then
                    local createFragment = u2.createFragment;
                    local v25 = {};
                    local createElement = u2.createElement;
                    local v26 = {
                        LayoutOrder = 99,
                        Size = UDim2.fromScale(1, 0.3),

                        OnClick = function() -- Line: 172, Name: OnClick
                            -- upvalues: u7 (copy), default (ref), AchievementId (copy), ClientStore (ref)
                            if u7 then
                                return nil;
                            end;

                            default.Client:Get("ClaimAchievementRewards"):SendToServer({
                                id = AchievementId
                            });
                            ClientStore:dispatch({
                                type = "LobbyClaimAchievementRewards",
                                id = AchievementId
                            });
                        end,

                        Text = u7 and "CLAIMED" or "CLAIM REWARDS"
                    };
                    local v27;

                    if u7 then
                        v27 = Color3.fromRGB(0, 0, 0);
                    else
                        v27 = Theme.backgroundSuccess;
                    end;

                    v26.BackgroundColor3 = v27;
                    v26.BackgroundTransparency = u7 and 0.5 or 0;
                    v26.CornerRadius = UDim.new(0, 10);
                    v26.TextLabel = {
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    };
                    v25.ClaimRewardsButton = createElement(Button, v26);
                    AchievementId = createFragment(v25);
                end;
            else
                AchievementId = u7;
            end;

            if AchievementId then
                v10[v13 + 2] = AchievementId;
            end;

            AchievementMeta = u2.createFragment({
                AchievementRewards = u2.createElement("Frame", v9, v10)
            });
        end;

        local v28 = { u2.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, 100)
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Bottom,
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }) };
        local v29 = #v28;

        if AchievementMeta then
            v28[v29 + 1] = AchievementMeta;
        end;

        return u2.createFragment({
            SidebarBottom = u2.createElement(Empty, v8, v28)
        });
    end)
};