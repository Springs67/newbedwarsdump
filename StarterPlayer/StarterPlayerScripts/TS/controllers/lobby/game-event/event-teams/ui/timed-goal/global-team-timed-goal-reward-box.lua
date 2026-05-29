local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local function v43(p12, p13) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u4
        [4] = u11
        [5] = u7
        [6] = u9
        [7] = u5
        [8] = u3
    --]]
    local _ = p13.useState
    local v14 = p13.useEffect
    local _ = p13.useValue
    local _ = p12.Score >= p12.RewardData.globalTeamScoreRequired
    local v15 = u10.getRewardName(p12.RewardData.reward)
    local v16 = u10.getRewardType(p12.RewardData.reward)
    v14(function() --[[ Line: 47 ]] end, {})
    local v17 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundTransparency"] = p12.Claimed and 0.7 or 0
    }
    local v18
    if p12.Claimed then
        v18 = u4.darken(u11.backgroundPrimary, 0.1)
    else
        v18 = u11.backgroundPrimary
    end
    v17.BackgroundColor3 = v18
    local v19 = {
        u7.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.075, 0),
            ["PaddingRight"] = UDim.new(0.075, 0),
            ["PaddingTop"] = UDim.new(0.1, 0),
            ["PaddingBottom"] = UDim.new(0.1, 0)
        }),
        u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        }),
        u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        }),
        u7.createElement(u9, {
            ["Reward"] = p12.RewardData.reward,
            ["ImageButtonProps"] = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 1)
            },
            ["Transparency"] = p12.Claimed and 0.7 or 0
        })
    }
    local v20 = #v19
    local v21 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.8, 0.85)
    }
    local v22 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        }), u7.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(0.9, 0.22),
            ["Text"] = tostring(v16),
            ["TextColor3"] = u4.WHITE,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextTransparency"] = p12.Claimed and 0.7 or 0.4,
            ["TextXAlignment"] = Enum.TextXAlignment.Center
        }), u7.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["RichText"] = true,
            ["Size"] = UDim2.fromScale(0.9, 0.27),
            ["Text"] = "<b>" .. v15 .. "</b>",
            ["TextColor3"] = u4.WHITE,
            ["Font"] = Enum.Font.Roboto,
            ["TextTransparency"] = p12.Claimed and 0.7 or 0,
            ["TextXAlignment"] = Enum.TextXAlignment.Center
        }) }
    local v23 = #v22
    local v24 = {
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(1, 0.3)
    }
    local v25 = {}
    local v26 = #v25
    local v27
    if p12.RewardData.personalContributionScoreRequired == nil then
        v27 = false
    else
        local v28 = u7.createElement
        local v29 = "TextLabel"
        local v30 = {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.9),
            ["Size"] = UDim2.fromScale(1, 0.7)
        }
        local v31
        if p12.PersonalScoreContribution >= p12.RewardData.personalContributionScoreRequired then
            v31 = "Personal contribution met!"
        else
            local v32 = p12.PersonalScoreContribution
            local v33 = tostring(v32)
            local v34 = p12.RewardData.personalContributionScoreRequired
            v31 = v33 .. " / " .. tostring(v34) .. " contribution"
        end
        v30.Text = v31
        v30.TextColor3 = u4.WHITE
        v30.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v30.TextXAlignment = Enum.TextXAlignment.Center
        v27 = v28(v29, v30)
    end
    if v27 then
        v25[v26 + 1] = v27
    end
    v22[v23 + 1] = u7.createElement(u5, v24, v25)
    local v35 = v23 + 2
    local v36 = u7.createElement
    local v37 = u3
    local v38 = {
        ["LayoutOrder"] = 10,
        ["TextSize"] = 20,
        ["TextScaled"] = true,
        ["Size"] = UDim2.fromScale(0.8, 0.35)
    }
    local v39
    if p12.Claimed then
        v39 = u11.backgroundTertiaryCard
    else
        local v40
        if p12.RewardData.personalContributionScoreRequired == nil or p12.PersonalScoreContribution >= p12.RewardData.personalContributionScoreRequired then
            v40 = p12.Score >= p12.RewardData.globalTeamScoreRequired
        else
            v40 = false
        end
        if v40 then
            v39 = u11.backgroundSuccess
        else
            v39 = u11.backgroundError
        end
    end
    v38.BackgroundColor3 = v39
    v38.Disabled = p12.Claimed
    v38.OnClick = p12.OnClaimClick
    local v41
    if p12.Claimed then
        v41 = "Claimed"
    else
        local v42
        if p12.RewardData.personalContributionScoreRequired == nil or p12.PersonalScoreContribution >= p12.RewardData.personalContributionScoreRequired then
            v42 = p12.Score >= p12.RewardData.globalTeamScoreRequired
        else
            v42 = false
        end
        v41 = v42 and "CLAIM" or (p12.RewardData.personalContributionScoreRequired ~= nil and p12.PersonalScoreContribution < p12.RewardData.personalContributionScoreRequired and "Not enough contribution" or u6.formatPercentage(p12.Score, p12.RewardData.globalTeamScoreRequired, 0))
    end
    v38.Text = v41
    v38.TextColor3 = u4.WHITE
    v38.CornerRadius = UDim.new(0.2, 0)
    v22[v35] = v36(v37, v38)
    v19[v20 + 1] = u7.createElement(u5, v21, v22)
    return u7.createFragment({
        ["GlobalTeamRewardContainer"] = u7.createElement("Frame", v17, v19)
    })
end
v8.new(u7)(v43)
return {
    ["GlobalTeamTimedGoalRewardBox"] = v8.new(u7)(v43)
}