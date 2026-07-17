-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function v23(u4, p5) -- Line: 12
    -- upvalues: RewardUtils (copy), StringUtil (copy), Theme (copy), u2 (copy), Empty (copy), ColorUtil (copy), ButtonComponent (copy)
    local _ = p5.useState;
    local useEffect = p5.useEffect;
    local _ = u4.Score >= u4.RewardData.globalTeamScoreRequired;
    local v6 = RewardUtils.getRewardName(u4.RewardData.reward);
    local v7 = RewardUtils.getRewardType(u4.RewardData.reward);

    local function _() -- Line: 19
        -- upvalues: u4 (copy)
        if u4.RewardData.personalContributionScoreRequired == nil or u4.PersonalScoreContribution >= u4.RewardData.personalContributionScoreRequired then
            return u4.Score >= u4.RewardData.globalTeamScoreRequired;
        end;

        return false;
    end;

    local function _() -- Line: 30
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

    useEffect(function() -- Line: 45
    end, {});
    local v9 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local v10 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.2, 0)
        }), u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), u2.createElement(Empty, {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.3, 1)
        }, { u2.createElement("ImageLabel", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                ZIndex = 10,
                Size = UDim2.fromScale(1, 1),
                Image = RewardUtils.getRewardImageId(u4.RewardData.reward),
                ScaleType = Enum.ScaleType.Fit
            }) }) };
    local v11 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.7, 0.9)
    };
    local v12 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextTransparency = 0.4,
            LayoutOrder = 1,
            TextScaled = true,
            Size = UDim2.fromScale(0.9, 0.15),
            Text = tostring(v7),
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Center
        }), u2.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            TextTransparency = 0,
            LayoutOrder = 2,
            RichText = true,
            Size = UDim2.fromScale(0.9, 0.25),
            Text = "<b>" .. v6 .. "</b>",
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto,
            TextXAlignment = Enum.TextXAlignment.Center
        }) };
    local v13 = #v12;
    local v14 = {
        LayoutOrder = 3,
        Size = UDim2.fromScale(1, 0.3)
    };
    local v15 = {};
    local v16 = #v15;
    local v17;

    if u4.RewardData.personalContributionScoreRequired == nil then
        v17 = false;
    else
        v17 = u2.createElement("TextLabel", {
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

    if v17 then
        v15[v16 + 1] = v17;
    end;

    v12[v13 + 1] = u2.createElement(Empty, v14, v15);
    local createElement = u2.createElement;
    local v18 = {
        LayoutOrder = 10,
        TextSize = 20,
        TextScaled = true,
        Size = UDim2.fromScale(0.6, 0.25)
    };
    local v19;

    if u4.Claimed then
        v19 = Color3.fromRGB(150, 150, 150);
    else
        local v20;

        if u4.RewardData.personalContributionScoreRequired == nil or u4.PersonalScoreContribution >= u4.RewardData.personalContributionScoreRequired then
            v20 = u4.Score >= u4.RewardData.globalTeamScoreRequired;
        else
            v20 = false;
        end;

        if v20 then
            v19 = Theme.backgroundSuccess;
        else
            v19 = Theme.backgroundError;
        end;
    end;

    v18.BackgroundColor3 = v19;
    v18.OnClick = u4.OnClaimClick;
    local v21;

    if u4.Claimed then
        v21 = "Claimed";
    else
        local v22;

        if u4.RewardData.personalContributionScoreRequired == nil or u4.PersonalScoreContribution >= u4.RewardData.personalContributionScoreRequired then
            v22 = u4.Score >= u4.RewardData.globalTeamScoreRequired;
        else
            v22 = false;
        end;

        v21 = v22 and "CLAIM" or (u4.RewardData.personalContributionScoreRequired ~= nil and u4.PersonalScoreContribution < u4.RewardData.personalContributionScoreRequired and "Not enough contribution" or StringUtil.formatPercentage(u4.Score, u4.RewardData.globalTeamScoreRequired, 0));
    end;

    v18.Text = v21;
    v18.TextColor3 = ColorUtil.WHITE;
    v18.CornerRadius = UDim.new(0.2, 0);
    v12[v13 + 2] = createElement(ButtonComponent, v18);
    v10[#v10 + 1] = u2.createElement(Empty, v11, v12);

    return u2.createFragment({
        GlobalTeamRewardContainer = u2.createElement("Frame", v9, v10)
    });
end;

v3.new(u2)(v23);

return {
    GlobalTeamEventRewardBox = v3.new(u2)(v23)
};