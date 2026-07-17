-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AchievementIcon = RuntimeLib.import(script, script.Parent, "achievement-icon").AchievementIcon;
local v38 = v2.new(u1)(function(u4, p5) -- Line: 14
    -- upvalues: AchievementUtil (copy), Theme (copy), u1 (copy), ColorUtil (copy), AchievementIcon (copy), Empty (copy), default (copy), ClientStore (copy), BedwarsImageId (copy)
    local _ = p5.useState;
    local _ = p5.useEffect;

    if u4.ViewingOnProfile then
        u4.Selected = false;
    end;

    local v6 = AchievementUtil.getMeta(u4.Id);
    local v7 = u4.ProfileData.achievementProgressValues[u4.Id];
    local v8 = v7 == nil and 0 or v7;

    if v8 ~= 0 and (v8 == v8 and v8) then
        AchievementUtil.getProgressString(u4.Id, v8);
    end;

    local v9 = u4.ProfileData.achievements[u4.Id];
    local v10;

    if v9 == nil then
        v10 = v9;
    else
        v10 = v9.achieved;
    end;

    if v10 == nil then
        v10 = false;
    end;

    local v11;

    if v9 == nil then
        v11 = v9;
    else
        v11 = v9.dateAchieved;
    end;

    local v12;

    if v9 then
        v12 = AchievementUtil.hasUnclaimedRewards(u4.Id, v9);
    else
        v12 = false;
    end;

    local u13 = 0;
    local sub = v6.sub;

    if sub ~= nil then
        local function _(p14) -- Line: 57
            -- upvalues: u4 (copy), u13 (ref)
            local v15 = u4.ProfileData.achievements[p14];

            if v15 ~= nil then
                v15 = v15.achieved;
            end;

            if v15 then
                u13 = u13 + 1;
            end;
        end;

        for i, v in sub do
            local _ = i - 1;
            local v16 = u4.ProfileData.achievements[v];

            if v16 ~= nil then
                v16 = v16.achieved;
            end;

            if v16 then
                u13 = u13 + 1;
            end;
        end;
    end;

    local sub2 = v6.sub;
    local v17 = sub2 ~= nil and #sub2 or sub2;
    local v18 = v17 == nil and 0 or v17;

    if not u4.ViewingOnProfile and v18 <= 0 then
        local _ = v6.useProgressBar;
    end;

    if u13 ~= 0 and (u13 == u13 and u13) then
        local _ = u13 / v18;
    end;

    local _ = tostring(u13) .. "/" .. tostring(v18);

    if v6.useProgressBar and v6.goal then
        local v19 = u4.ProfileData.achievementProgressValues[u4.Id];

        if v19 ~= 0 and (v19 == v19 and v19) then
            local _ = v19 / v6.goal.value;
        end;

        local v20 = math.min(v19 == nil and 0 or v19, v6.goal.value);
        local _ = tostring(v20) .. "/" .. tostring(v6.goal.value);
    end;

    local v21;

    if v11 == nil then
        v21 = false;
    elseif v10 then
        v21 = u4.ViewingOnProfile;
    else
        v21 = v10;
    end;

    local v22 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v23;

    if u4.ViewingOnProfile then
        v23 = Theme.backgroundSecondary;
    elseif v10 then
        v23 = Theme.backgroundPrimary;
    else
        v23 = Theme.backgroundTertiaryCard;
    end;

    v22.BackgroundColor3 = v23;
    v22.BorderSizePixel = 0;
    v22.BackgroundTransparency = v10 and 0 or 0.3;

    v22[u1.Event.Activated] = function() -- Line: 102
        -- upvalues: u4 (copy)
        if not u4.ViewingOnProfile then
            u4.OnSelect();
        end;
    end;

    v22.AutoButtonColor = not u4.ViewingOnProfile;
    local v24 = { u1.createElement("UIStroke", {
            Thickness = 1,
            Color = ColorUtil.WHITE,
            Transparency = u4.Selected and 0.5 or 1
        }), u1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }), u1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8)
        }) };
    local v25 = #v24;
    local v26 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v27 = { u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.03, 0)
        }) };
    local v28 = #v27;
    local v29;

    if v21 then
        v29 = u1.createFragment({
            AchievementDate = u1.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                TextTransparency = 0.3,
                LayoutOrder = 0,
                ZIndex = 10,
                Size = UDim2.fromScale(1, 0.08),
                Text = (v11 == "" or not v11) and "" or v11,
                Font = Enum.Font.Roboto,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Right
            })
        });
    else
        v29 = v21;
    end;

    if v29 then
        v27[v28 + 1] = v29;
    end;

    local v30 = #v27;
    v27[v30 + 1] = u1.createElement(AchievementIcon, {
        Simple = true,
        Id = u4.Id,
        Darkened = not v10,
        FrameProps = {
            ZIndex = 2,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, v21 and 0.56 or 0.63)
        }
    });
    local v31 = {
        BackgroundTransparency = 1,
        ZIndex = 12,
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, v21 and 0.3 or 0.34),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1)
    };
    local v32 = { (u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            Padding = UDim.new(0, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })) };
    local createElement = u1.createElement;
    local v33 = {
        TextScaled = true,
        BackgroundTransparency = 1,
        TextWrapped = true,
        LayoutOrder = 0,
        ZIndex = 12,
        Size = UDim2.fromScale(1, 0.4),
        Text = v6.title,
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
    };
    local v34;

    if v10 then
        v34 = ColorUtil.WHITE;
    else
        v34 = Theme.textPrimary;
    end;

    v33.TextColor3 = v34;
    v33.TextXAlignment = Enum.TextXAlignment.Center;
    v32.AchievementTitle = createElement("TextLabel", v33, { u1.createElement("UISizeConstraint", {
            MaxSize = Vector2.new((1 / 0), 40)
        }), u1.createElement("UIStroke", {
            Thickness = 1,
            Transparency = 0.5,
            Color = ColorUtil.BLACK
        }) });
    local _ = #v32;
    local v35 = {
        Size = UDim2.fromScale(1, 0.6)
    };
    local goal = v6.goal;

    if goal ~= nil then
        goal = goal.value;
    end;

    v35.Text = v6.description(goal == nil and 0 or goal);
    v35.TextScaled = true;
    v35.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular);
    local v36;

    if v10 then
        v36 = ColorUtil.WHITE;
    else
        v36 = Theme.textPrimary;
    end;

    v35.TextColor3 = v36;
    v35.BackgroundTransparency = 1;
    v35.TextTransparency = 0.3;
    v35.TextWrapped = true;
    v35.TextXAlignment = Enum.TextXAlignment.Center;
    v35.LayoutOrder = 1;
    v35.ZIndex = 12;
    v32.AchievementDesc = u1.createElement("TextLabel", v35, { u1.createElement("UITextSizeConstraint", {
            MaxTextSize = 18
        }) });
    v27[v30 + 2] = u1.createElement("Frame", v31, v32);
    v24[v25 + 1] = u1.createElement(Empty, v26, v27);
    local createElement2 = u1.createElement;
    local v37 = {
        Size = UDim2.fromScale(0.2, 0.2),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),

        [u1.Event.Activated] = function() -- Line: 239
            -- upvalues: default (ref), u4 (copy), ClientStore (ref)
            default.Client:Get("ClaimAchievementRewards"):SendToServer({
                id = u4.Id
            });
            ClientStore:dispatch({
                type = "LobbyClaimAchievementRewards",
                id = u4.Id
            });
        end,

        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 165, 20)
    };

    if v12 then
        v12 = not u4.ViewingOnProfile;
    end;

    v37.Visible = v12;
    v37.ZIndex = 13;
    v24[v25 + 2] = createElement2("ImageButton", v37, {
        u1.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }),
        u1.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(40, 40)
        }),
        u1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 20)
        }),
        u1.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 14,
            Size = UDim2.fromScale(0.6, 0.6),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Image = BedwarsImageId.GIFT_SOLID
        })
    });

    return u1.createFragment({
        AchievementContainer = u1.createElement("ImageButton", v22, v24)
    });
end);

return {
    AchievementCell = v3.connect(function(p39, p40) -- Line: 276
        local v41 = {};

        for i, v in p40 do
            v41[i] = v;
        end;

        v41.store = p39;

        return v41;
    end)(v38)
};