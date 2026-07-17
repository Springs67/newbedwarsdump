-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local Empty = v1.Empty;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local RewardTile = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AchievementIcon = RuntimeLib.import(script, script.Parent, "achievement-icon").AchievementIcon;
local v52 = v3.new(u2)(function(u5, p6) -- Line: 17
    -- upvalues: AchievementUtil (copy), Theme (copy), u2 (copy), ColorUtil (copy), AchievementIcon (copy), BedwarsImageId (copy), RewardTile (copy), Empty (copy), Button (copy), default (copy), ClientStore (copy)
    local _ = p6.useState;
    local _ = p6.useEffect;

    if u5.ViewingOnProfile then
        u5.Selected = false;
    end;

    local v7 = AchievementUtil.getMeta(u5.Id);
    local v8 = u5.ProfileData.achievementProgressValues[u5.Id];
    local v9 = v8 == nil and 0 or v8;

    if v9 ~= 0 and (v9 == v9 and v9) then
        AchievementUtil.getProgressString(u5.Id, v9);
    end;

    local u10 = u5.ProfileData.achievements[u5.Id];
    local v11;

    if u10 == nil then
        v11 = u10;
    else
        v11 = u10.achieved;
    end;

    if v11 == nil then
        v11 = false;
    end;

    local v12;

    if u10 == nil then
        v12 = u10;
    else
        v12 = u10.dateAchieved;
    end;

    local v13;

    if u10 then
        v13 = AchievementUtil.hasUnclaimedRewards(u5.Id, u10);
    else
        v13 = false;
    end;

    local u14 = 0;
    local sub = v7.sub;

    if sub ~= nil then
        local function _(p15) -- Line: 60
            -- upvalues: u5 (copy), u14 (ref)
            local v16 = u5.ProfileData.achievements[p15];

            if v16 ~= nil then
                v16 = v16.achieved;
            end;

            if v16 then
                u14 = u14 + 1;
            end;
        end;

        for i, v in sub do
            local _ = i - 1;
            local v17 = u5.ProfileData.achievements[v];

            if v17 ~= nil then
                v17 = v17.achieved;
            end;

            if v17 then
                u14 = u14 + 1;
            end;
        end;
    end;

    local sub2 = v7.sub;
    local v18 = sub2 ~= nil and #sub2 or sub2;
    local v19 = v18 == nil and 0 or v18;

    if not u5.ViewingOnProfile and v19 <= 0 then
        local _ = v7.useProgressBar;
    end;

    if u14 ~= 0 and (u14 == u14 and u14) then
        local _ = u14 / v19;
    end;

    local _ = tostring(u14) .. "/" .. tostring(v19);

    if v7.useProgressBar and v7.goal then
        local v20 = u5.ProfileData.achievementProgressValues[u5.Id];

        if v20 ~= 0 and (v20 == v20 and v20) then
            local _ = v20 / v7.goal.value;
        end;

        local v21 = math.min(v20 == nil and 0 or v20, v7.goal.value);
        local _ = tostring(v21) .. "/" .. tostring(v7.goal.value);
    end;

    local rewards = v7.rewards;
    local v22 = {
        Size = UDim2.new(1, 0, 0, 90)
    };
    local v23;

    if u5.ViewingOnProfile then
        v23 = Theme.backgroundSecondary;
    elseif v11 then
        v23 = Theme.backgroundPrimary;
    else
        v23 = Theme.backgroundTertiaryCard;
    end;

    v22.BackgroundColor3 = v23;
    v22.BorderSizePixel = 0;
    v22.BackgroundTransparency = v11 and 0 or 0.3;

    v22[u2.Event.Activated] = function() -- Line: 105
        -- upvalues: u5 (copy)
        if not u5.ViewingOnProfile then
            u5.OnSelect();
        end;
    end;

    v22.AutoButtonColor = not u5.ViewingOnProfile;
    v22.LayoutOrder = u5.LayoutOrder;
    local v24 = { u2.createElement("UIStroke", {
            Thickness = 1,
            Color = ColorUtil.WHITE,
            Transparency = u5.Selected and 0.5 or 1
        }), u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }), u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8)
        }) };
    local v25 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v26 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0.03, 0)
        }), (u2.createElement(AchievementIcon, {
            Simple = true,
            Id = u5.Id,
            Darkened = not v11,
            FrameProps = {
                ZIndex = 2,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.1, 1)
            }
        })) };
    local createElement = u2.createElement;
    local v27 = {
        TextScaled = true,
        BackgroundTransparency = 1,
        TextWrapped = true,
        LayoutOrder = 1,
        ZIndex = 12,
        Size = UDim2.fromScale(0.2, 1),
        Text = v7.title,
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
    };
    local v28;

    if v11 then
        v28 = ColorUtil.WHITE;
    else
        v28 = Theme.textPrimary;
    end;

    v27.TextColor3 = v28;
    v27.TextXAlignment = Enum.TextXAlignment.Center;
    v26.AchievementTitle = createElement("TextLabel", v27, { u2.createElement("UITextSizeConstraint", {
            MaxTextSize = 20
        }), u2.createElement("UIStroke", {
            Thickness = 1,
            Transparency = 0.5,
            Color = ColorUtil.BLACK
        }) });
    local v29 = #v26;
    local v30 = {
        Size = UDim2.fromScale(0.45, 1)
    };
    local goal = v7.goal;

    if goal ~= nil then
        goal = goal.value;
    end;

    v30.Text = v7.description(goal == nil and 0 or goal);
    v30.TextScaled = true;
    v30.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular);
    local v31;

    if v11 then
        v31 = ColorUtil.WHITE;
    else
        v31 = Theme.textPrimary;
    end;

    v30.TextColor3 = v31;
    v30.BackgroundTransparency = 1;
    v30.TextTransparency = 0.3;
    v30.TextWrapped = true;
    v30.TextXAlignment = Enum.TextXAlignment.Center;
    v30.LayoutOrder = 2;
    v30.ZIndex = 12;
    v26.AchievementDesc = u2.createElement("TextLabel", v30, { u2.createElement("UITextSizeConstraint", {
            MaxTextSize = 18
        }) });

    if rewards then
        local v32 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.16, 1)
        };
        local v33 = {};
        local v34 = #v33;
        local rewards2 = v7.rewards;
        local v35;

        if rewards2 == nil then
            v35 = rewards2;
        else
            local function v48(p36) -- Line: 211
                -- upvalues: u10 (copy), Theme (ref), u2 (ref), BedwarsImageId (ref), ColorUtil (ref), RewardTile (ref), Empty (ref)
                local v37 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v38 = {};
                local v39 = #v38;
                local v40 = {
                    Size = UDim2.new(1, 4, 1, 4),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5)
                };
                local v41 = u10;

                if v41 ~= nil then
                    v41 = v41.rewardsClaimed;
                end;

                local v42;

                if v41 then
                    v42 = Theme.backgroundPrimary;
                else
                    v42 = Theme.backgroundSecondary;
                end;

                v40.BackgroundColor3 = v42;
                local v43 = u10;

                if v43 ~= nil then
                    v43 = v43.rewardsClaimed;
                end;

                v40.BackgroundTransparency = v43 and 0.5 or 0.8;
                v40.ZIndex = 2;
                local v44 = { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 5)
                    }) };
                local v45 = #v44;
                local v46 = {
                    BackgroundTransparency = 1,
                    ZIndex = 3,
                    Size = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    ScaleType = Enum.ScaleType.Fit,
                    Image = BedwarsImageId.CHECK_SOLID,
                    ImageColor3 = ColorUtil.WHITE
                };
                local v47 = u10;

                if v47 ~= nil then
                    v47 = v47.rewardsClaimed;
                end;

                v46.Visible = v47 == true;
                v44[v45 + 1] = u2.createElement("ImageLabel", v46, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
                v44[v45 + 2] = u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                });
                v38[v39 + 1] = u2.createElement("Frame", v40, v44);
                v38[v39 + 2] = u2.createElement(RewardTile, {
                    ZIndex = 0,
                    Reward = p36
                });

                return u2.createElement(Empty, v37, v38);
            end;

            v35 = table.create(#rewards2);

            for i, v in rewards2 do
                v35[i] = v48(v, i - 1, rewards2);
            end;
        end;

        local v49 = {
            Size = UDim2.fromScale(1, 1),
            Visible = not v13
        };
        local v50 = { u2.createElement("UIGridLayout", {
                FillDirectionMaxCells = 5,
                CellSize = UDim2.new(0.5, 0, 1, 0),
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center
            }) };
        local v51 = #v50;

        if v35 then
            for i, v in v35 do
                v50[v51 + i] = v;
            end;
        end;

        v33[v34 + 1] = u2.createElement(Empty, v49, v50);
        v33[v34 + 2] = u2.createElement(Button, {
            Text = "CLAIM REWARDS",
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),

            OnClick = function() -- Line: 300, Name: OnClick
                -- upvalues: default (ref), u5 (copy), ClientStore (ref)
                default.Client:Get("ClaimAchievementRewards"):SendToServer({
                    id = u5.Id
                });
                ClientStore:dispatch({
                    type = "LobbyClaimAchievementRewards",
                    id = u5.Id
                });
            end,

            CornerRadius = UDim.new(0, 5),
            TextLabel = {
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            },
            Visible = v13,
            BackgroundColor3 = Theme.backgroundSuccess
        });
        rewards = u2.createElement(Empty, v32, v33);
    end;

    if rewards then
        v26[v29 + 1] = rewards;
    end;

    v24[#v24 + 1] = u2.createElement(Empty, v25, v26);

    return u2.createFragment({
        AchievementContainer = u2.createElement("ImageButton", v22, v24)
    });
end);

return {
    AchievementRow = v4.connect(function(p53, p54) -- Line: 328
        local v55 = {};

        for i, v in p54 do
            v55[i] = v;
        end;

        v55.store = p53;

        return v55;
    end)(v52)
};