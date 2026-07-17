-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RewardTile = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function v24(u4, p5) -- Line: 13
    -- upvalues: RewardUtils (copy), StringUtil (copy), ColorUtil (copy), Theme (copy), u2 (copy), RewardTile (copy), Empty (copy), ButtonComponent (copy)
    local _ = p5.useState;
    local useEffect = p5.useEffect;
    local _ = p5.useValue;
    local _ = u4.Score >= u4.RewardData.globalTeamScoreRequired;
    local v6 = RewardUtils.getRewardName(u4.RewardData.reward);
    local v7 = RewardUtils.getRewardType(u4.RewardData.reward);

    local function _() -- Line: 21
        -- upvalues: u4 (copy)
        if u4.RewardData.personalContributionScoreRequired == nil or u4.PersonalScoreContribution >= u4.RewardData.personalContributionScoreRequired then
            return u4.Score >= u4.RewardData.globalTeamScoreRequired;
        end;

        return false;
    end;

    local function _() -- Line: 32
        -- upvalues: u4 (copy), StringUtil (ref)
        if u4.Claimed then
            return "Claimed";
        end;

        local v8;

        if u4.RewardData.personalContributionScoreRequired == nil or u4.PersonalScoreContribution >= u4.RewardData.personalContributionScoreRequired then
            v8 = u4.Score >= u4.RewardData.globalTeamScoreRequired;
        else
            v8 = false;
        end;

        return v8 and "CLAIM" or (u4.RewardData.personalContributionScoreRequired ~= nil and u4.PersonalScoreContribution < u4.RewardData.personalContributionScoreRequired and "Not enough contribution" or StringUtil.formatPercentage(u4.Score, u4.RewardData.globalTeamScoreRequired, 0));
    end;

    useEffect(function() -- Line: 47
    end, {});
    local v9 = {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = u4.Claimed and 0.7 or 0
    };
    local v10;

    if u4.Claimed then
        v10 = ColorUtil.darken(Theme.backgroundPrimary, 0.1);
    else
        v10 = Theme.backgroundPrimary;
    end;

    v9.BackgroundColor3 = v10;
    local v11 = {
        u2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.075, 0),
            PaddingRight = UDim.new(0.075, 0),
            PaddingTop = UDim.new(0.1, 0),
            PaddingBottom = UDim.new(0.1, 0)
        }),
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        }),
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center
        }),
        u2.createElement(RewardTile, {
            Reward = u4.RewardData.reward,
            ImageButtonProps = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.3, 1)
            },
            Transparency = u4.Claimed and 0.7 or 0
        })
    };
    local v12 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.8, 0.85)
    };
    local v13 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            TextScaled = true,
            Size = UDim2.fromScale(0.9, 0.22),
            Text = tostring(v7),
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextTransparency = u4.Claimed and 0.7 or 0.4,
            TextXAlignment = Enum.TextXAlignment.Center
        }), u2.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            RichText = true,
            Size = UDim2.fromScale(0.9, 0.27),
            Text = "<b>" .. v6 .. "</b>",
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto,
            TextTransparency = u4.Claimed and 0.7 or 0,
            TextXAlignment = Enum.TextXAlignment.Center
        }) };
    local v14 = #v13;
    local v15 = {
        LayoutOrder = 3,
        Size = UDim2.fromScale(1, 0.3)
    };
    local v16 = {};
    local v17 = #v16;
    local v18;

    if u4.RewardData.personalContributionScoreRequired == nil then
        v18 = false;
    else
        v18 = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextTransparency = 0,
            TextScaled = true,
            LayoutOrder = 1,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 0.9),
            Size = UDim2.fromScale(1, 0.7),
            Text = u4.PersonalScoreContribution >= u4.RewardData.personalContributionScoreRequired and "Personal contribution met!" or tostring(u4.PersonalScoreContribution) .. " / " .. tostring(u4.RewardData.personalContributionScoreRequired) .. " contribution",
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Center
        });
    end;

    if v18 then
        v16[v17 + 1] = v18;
    end;

    v13[v14 + 1] = u2.createElement(Empty, v15, v16);
    local createElement = u2.createElement;
    local v19 = {
        LayoutOrder = 10,
        TextSize = 20,
        TextScaled = true,
        Size = UDim2.fromScale(0.8, 0.35)
    };
    local v20;

    if u4.Claimed then
        v20 = Theme.backgroundTertiaryCard;
    else
        local v21;

        if u4.RewardData.personalContributionScoreRequired == nil or u4.PersonalScoreContribution >= u4.RewardData.personalContributionScoreRequired then
            v21 = u4.Score >= u4.RewardData.globalTeamScoreRequired;
        else
            v21 = false;
        end;

        if v21 then
            v20 = Theme.backgroundSuccess;
        else
            v20 = Theme.backgroundError;
        end;
    end;

    v19.BackgroundColor3 = v20;
    v19.Disabled = u4.Claimed;
    v19.OnClick = u4.OnClaimClick;
    local v22;

    if u4.Claimed then
        v22 = "Claimed";
    else
        local v23;

        if u4.RewardData.personalContributionScoreRequired == nil or u4.PersonalScoreContribution >= u4.RewardData.personalContributionScoreRequired then
            v23 = u4.Score >= u4.RewardData.globalTeamScoreRequired;
        else
            v23 = false;
        end;

        v22 = v23 and "CLAIM" or (u4.RewardData.personalContributionScoreRequired ~= nil and u4.PersonalScoreContribution < u4.RewardData.personalContributionScoreRequired and "Not enough contribution" or StringUtil.formatPercentage(u4.Score, u4.RewardData.globalTeamScoreRequired, 0));
    end;

    v19.Text = v22;
    v19.TextColor3 = ColorUtil.WHITE;
    v19.CornerRadius = UDim.new(0.2, 0);
    v13[v14 + 2] = createElement(ButtonComponent, v19);
    v11[#v11 + 1] = u2.createElement(Empty, v12, v13);

    return u2.createFragment({
        GlobalTeamRewardContainer = u2.createElement("Frame", v9, v11)
    });
end;

v3.new(u2)(v24);

return {
    GlobalTeamTimedGoalRewardBox = v3.new(u2)(v24)
};