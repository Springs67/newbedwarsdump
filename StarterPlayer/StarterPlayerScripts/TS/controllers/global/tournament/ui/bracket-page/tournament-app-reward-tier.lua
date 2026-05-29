local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-rewards").TournamentRewards
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-types").TournamentDivision
local u9 = v1.import(script, script.Parent, "tournament-app-reward-tile").TournamentAppRewardTile
return {
    ["TournamentAppRewardTier"] = v4.new(u3)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u7
            [4] = u3
            [5] = u6
            [6] = u9
            [7] = u2
        --]]
        local _ = p11.useState
        local _ = p11.useEffect
        local v12 = p10.currentWins < p10.rewardTier
        local v13 = u5:getState().Tournament.myTeamDivision or u8.Division_I
        local v14 = u7.getRewardsByDivisionWins(v13, p10.rewardTier)
        local v15 = p10.rewardTier == 3 and p10.currentLosses >= 1 and true or p10.rewardTier == 2 and p10.currentLosses >= 2
        local v16 = {
            ["Size"] = UDim2.fromScale(1, 0.45)
        }
        local v17 = {}
        local v18 = #v17
        local v19
        if p10.currentWins == p10.rewardTier then
            v19 = u3.createFragment({
                ["TierIconHighlighted"] = u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u6.REWARD_TIER_UI_HIGHLIGHT,
                    ["ImageTransparency"] = v15 and 0.7 or 0
                })
            })
        else
            v19 = false
        end
        if v19 then
            v17[v18 + 1] = v19
        end
        local v20 = #v17
        local v21
        if p10.currentWins == p10.rewardTier then
            v21 = false
        else
            v21 = u3.createFragment({
                ["TierIconNoHighlight"] = u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u6.REWARD_TIER_UI,
                    ["ImageTransparency"] = v15 and 0.7 or 0
                })
            })
        end
        if v21 then
            v17[v20 + 1] = v21
        end
        local v22 = #v17
        local v23 = u3.createElement
        local v24 = {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Font"] = "Roboto",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.1),
            ["Position"] = UDim2.fromScale(0, 0.15)
        }
        local v25 = p10.rewardTier
        v24.Text = "<b>" .. tostring(v25) .. " Wins</b>"
        v24.TextColor3 = Color3.fromRGB(255, 255, 255)
        v24.TextXAlignment = Enum.TextXAlignment.Center
        v24.TextYAlignment = Enum.TextYAlignment.Center
        v17.RewardAmount = v23("TextLabel", v24)
        local v26
        if v12 then
            if v15 then
                v26 = u3.createFragment({
                    ["RewardStatus"] = u3.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["ZIndex"] = 2,
                        ["Size"] = UDim2.fromScale(0.1, 0.1),
                        ["Position"] = UDim2.fromScale(0.8, 0.7),
                        ["Image"] = u6.X,
                        ["ImageColor3"] = Color3.fromRGB(255, 0, 0),
                        ["ImageTransparency"] = v15 and 0.7 or 0
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) })
                })
            else
                v26 = v15
            end
        else
            v26 = v12
        end
        if v26 then
            v17[v22 + 1] = v26
        end
        local v27 = #v17
        local v28 = v12 and not v15
        if v28 then
            v28 = u3.createFragment({
                ["RewardStatus"] = u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(0.1, 0.1),
                    ["Position"] = UDim2.fromScale(0.8, 0.7),
                    ["Image"] = u6.LOCK_SOLID,
                    ["ImageTransparency"] = v15 and 0.7 or 0
                }, { u3.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        end
        if v28 then
            v17[v27 + 1] = v28
        end
        local v29 = #v17
        local v30 = not v12
        if v30 then
            v30 = u3.createFragment({
                ["RewardStatus"] = u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(0.1, 0.1),
                    ["Position"] = UDim2.fromScale(0.8, 0.7),
                    ["Image"] = u6.CHECK_SOLID,
                    ["ImageColor3"] = Color3.fromRGB(0, 255, 0),
                    ["ImageTransparency"] = v15 and 0.7 or 0
                }, { u3.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        end
        if v30 then
            v17[v29 + 1] = v30
        end
        local _ = #v17
        local v31 = table.create(#v14)
        for v32, v33 in v14 do
            local v34 = v32 - 1
            v31[v32] = u3.createElement(u9, {
                ["reward"] = v33,
                ["LayoutOrder"] = v34,
                ["unWinnable"] = v15,
                ["rewardTier"] = p10.rewardTier
            })
        end
        local v35 = {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 2,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.5)
        }
        local v36 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v37 = #v36
        for v38, v39 in v31 do
            v36[v37 + v38] = v39
        end
        v17.RewardsShowcase = u3.createElement("Frame", v35, v36)
        return u3.createFragment({
            ["RewardTierArea"] = u3.createElement(u2, v16, v17)
        })
    end)
}