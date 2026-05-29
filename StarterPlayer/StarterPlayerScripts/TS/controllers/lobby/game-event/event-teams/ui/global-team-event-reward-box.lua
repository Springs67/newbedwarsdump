local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local function v41(p11, p12) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u10
        [4] = u7
        [5] = u5
        [6] = u4
        [7] = u3
    --]]
    local _ = p12.useState
    local v13 = p12.useEffect
    local _ = p11.Score >= p11.RewardData.globalTeamScoreRequired
    local v14 = u9.getRewardName(p11.RewardData.reward)
    local v15 = u9.getRewardType(p11.RewardData.reward)
    v13(function() --[[ Line: 45 ]] end, {})
    local v16 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u10.backgroundPrimary
    }
    local v17 = { u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.2, 0)
        }), u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        }), u7.createElement(u5, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.3, 1)
        }, { u7.createElement("ImageLabel", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u9.getRewardImageId(p11.RewardData.reward),
                ["ScaleType"] = Enum.ScaleType.Fit
            }) }) }
    local v18 = #v17
    local v19 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.7, 0.9)
    }
    local v20 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        }), u7.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0.4,
            ["LayoutOrder"] = 1,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(0.9, 0.15),
            ["Text"] = tostring(v15),
            ["TextColor3"] = u4.WHITE,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Center
        }), u7.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0,
            ["LayoutOrder"] = 2,
            ["RichText"] = true,
            ["Size"] = UDim2.fromScale(0.9, 0.25),
            ["Text"] = "<b>" .. v14 .. "</b>",
            ["TextColor3"] = u4.WHITE,
            ["Font"] = Enum.Font.Roboto,
            ["TextXAlignment"] = Enum.TextXAlignment.Center
        }) }
    local v21 = #v20
    local v22 = {
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(1, 0.3)
    }
    local v23 = {}
    local v24 = #v23
    local v25
    if p11.RewardData.personalContributionScoreRequired == nil then
        v25 = false
    else
        local v26 = u7.createElement
        local v27 = "TextLabel"
        local v28 = {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.9),
            ["Size"] = UDim2.fromScale(1, 0.7)
        }
        local v29
        if p11.PersonalScoreContribution >= p11.RewardData.personalContributionScoreRequired then
            v29 = "Personal contribution met!"
        else
            local v30 = p11.PersonalScoreContribution
            local v31 = tostring(v30)
            local v32 = p11.RewardData.personalContributionScoreRequired
            v29 = v31 .. " / " .. tostring(v32) .. " contribution"
        end
        v28.Text = v29
        v28.TextColor3 = u4.WHITE
        v28.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v28.TextXAlignment = Enum.TextXAlignment.Center
        v25 = v26(v27, v28)
    end
    if v25 then
        v23[v24 + 1] = v25
    end
    v20[v21 + 1] = u7.createElement(u5, v22, v23)
    local v33 = v21 + 2
    local v34 = u7.createElement
    local v35 = u3
    local v36 = {
        ["LayoutOrder"] = 10,
        ["TextSize"] = 20,
        ["TextScaled"] = true,
        ["Size"] = UDim2.fromScale(0.6, 0.25)
    }
    local v37
    if p11.Claimed then
        v37 = Color3.fromRGB(150, 150, 150)
    else
        local v38
        if p11.RewardData.personalContributionScoreRequired == nil or p11.PersonalScoreContribution >= p11.RewardData.personalContributionScoreRequired then
            v38 = p11.Score >= p11.RewardData.globalTeamScoreRequired
        else
            v38 = false
        end
        if v38 then
            v37 = u10.backgroundSuccess
        else
            v37 = u10.backgroundError
        end
    end
    v36.BackgroundColor3 = v37
    v36.OnClick = p11.OnClaimClick
    local v39
    if p11.Claimed then
        v39 = "Claimed"
    else
        local v40
        if p11.RewardData.personalContributionScoreRequired == nil or p11.PersonalScoreContribution >= p11.RewardData.personalContributionScoreRequired then
            v40 = p11.Score >= p11.RewardData.globalTeamScoreRequired
        else
            v40 = false
        end
        v39 = v40 and "CLAIM" or (p11.RewardData.personalContributionScoreRequired ~= nil and p11.PersonalScoreContribution < p11.RewardData.personalContributionScoreRequired and "Not enough contribution" or u6.formatPercentage(p11.Score, p11.RewardData.globalTeamScoreRequired, 0))
    end
    v36.Text = v39
    v36.TextColor3 = u4.WHITE
    v36.CornerRadius = UDim.new(0.2, 0)
    v20[v33] = v34(v35, v36)
    v17[v18 + 1] = u7.createElement(u5, v19, v20)
    return u7.createFragment({
        ["GlobalTeamRewardContainer"] = u7.createElement("Frame", v16, v17)
    })
end
v8.new(u7)(v41)
return {
    ["GlobalTeamEventRewardBox"] = v8.new(u7)(v41)
}