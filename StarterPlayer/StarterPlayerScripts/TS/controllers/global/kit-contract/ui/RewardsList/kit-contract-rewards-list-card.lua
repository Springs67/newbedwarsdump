local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.ImageId
local u7 = v2.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "reward", "ui", "reward-showcase").RewardShowcase
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["KitContractRewardsListCard"] = v9.new(u8)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u13
            [3] = u8
            [4] = u4
            [5] = u15
            [6] = u10
            [7] = u11
            [8] = u14
            [9] = u3
            [10] = u7
            [11] = u6
            [12] = u5
        --]]
        local _ = p17.useState
        local _ = p17.useEffect
        local v18 = u12[u16.SelectedKit].rewards
        local v19 = u13.getProgressBarPercentage(u16.Reward.tier, u16.SelectedKit, u16.KitStats)
        local v20 = u13.getRewardFromTier(v18, u16.Reward.tier)
        if v20 ~= nil then
            v20 = v20.requiresPurchaseUnlock
        end
        local v21 = u16.KitContractProfile.purchasedUnlock
        local v22
        if v19 > 0 then
            v22 = v19 < 1
        else
            v22 = false
        end
        local v23
        if v19 >= 1 then
            v23 = not v20 and true or v21
        else
            v23 = false
        end
        local v24 = {}
        for v25, v26 in u16 do
            v24[v25] = v26
        end
        v24.store = nil
        v24.Reward = nil
        v24.KitStats = nil
        v24.KitContractProfile = nil
        v24.SelectedKit = nil
        v24.OnSelectCard = nil
        v24.ActiveCard = nil
        local v27 = {}
        for v28, v29 in v24 do
            v27[v28] = v29
        end
        local v30 = {}
        local v31 = #v30
        local v32 = {
            ["Size"] = UDim2.fromScale(1, 0.95),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v33 = { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top
            }) }
        local v34 = #v33
        local v35
        if u16.ActiveCard.tier == u16.Reward.tier then
            v35 = u8.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = u4.WHITE
            })
        else
            v35 = false
        end
        if v35 then
            v33[v34 + 1] = v35
        end
        local _ = #v33
        local v36 = u8.createElement
        local v37 = {
            ["LayoutOrder"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["BackgroundColor3"] = u15.backgroundTertiary
        }
        local v38 = {
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }),
            ["ProgressBar"] = u8.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0, 1),
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["BackgroundColor3"] = u15.textPrimary
            }, {
                ["Bar"] = u8.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["AnchorPoint"] = Vector2.new(0, 1),
                    ["Position"] = UDim2.fromScale(0, 1),
                    ["Size"] = UDim2.fromScale(v19, 1),
                    ["BackgroundColor3"] = u13.ProgressColor
                }),
                u8.createElement("Frame")
            })
        }
        local v39 = u8.createElement
        local v40 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["TextWrapped"] = true,
            ["Size"] = UDim2.fromScale(1, 0.75)
        }
        local v41 = u16.Reward.tier
        v40.Text = tostring(v41)
        v40.TextColor3 = u4.WHITE
        v40.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v38.Tier = v39("TextLabel", v40, { u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 2)
            }) })
        v33.KitContractRewardCardHeader = v36("Frame", v37, v38)
        local v42 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.8)
        }
        local v43 = {}
        local v44 = #v43
        local v45 = u16.Reward.requiresPurchaseUnlock
        if v45 then
            local v46 = u8.createFragment
            local v47 = {
                ["DarkOverlay"] = u8.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 10,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = u4.BLACK,
                    ["BackgroundTransparency"] = v22 and 0.8 or 0.5
                })
            }
            v45 = v46(v47)
        end
        if v45 then
            v43[v44 + 1] = v45
        end
        local _ = #v43
        local v48 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u15.backgroundPrimary
        }
        local v49 = {}
        local v50 = u8.createElement
        local v51 = "ImageButton"
        local v54 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["ImageTransparency"] = 1,
            ["BackgroundColor3"] = u4.darken(u15.backgroundPrimary, 0.6),
            ["BorderSizePixel"] = 0,
            [u8.Event.MouseButton1Click] = function() --[[ Line: 142 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16.OnSelectCard(u16.Reward.tier)
            end,
            [u8.Event.MouseEnter] = function(p52) --[[ Line: 145 ]]
                p52.BackgroundTransparency = 0.5
            end,
            [u8.Event.MouseLeave] = function(p53) --[[ Line: 148 ]]
                p53.BackgroundTransparency = 0.4
            end,
            ["BackgroundTransparency"] = 0.5
        }
        local v55 = {}
        local v56 = u8.createElement
        local v57 = u10
        local v58 = {
            ["Size"] = UDim2.fromScale(0.95, 0.95),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Reward"] = u16.Reward
        }
        local v59
        if v20 then
            v59 = not v21
        else
            v59 = v20
        end
        v58.DisableTooltip = v59
        v58.GroupTransparency = v22 and 0 or 0.4
        __set_list(v55, 1, {v56(v57, v58)})
        __set_list(v49, 1, {v50(v51, v54, v55)})
        local _ = #v49
        local v60
        if v20 and not v21 then
            local v61 = {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 11,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u11.LOCK_ART,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }
            local v62 = {}
            local v63 = #v62
            local v64 = {}
            local v65 = #v64
            local v66 = {}
            local v67 = u16.Reward.comingSoonReward
            if v67 ~= nil then
                v67 = v67.text
            end
            if v67 == nil then
                local v68 = u14.getRewardName(u16.Reward)
                v67 = v68 == nil and "" or v68
            end
            v66.Text = v67
            v66.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            v66.TextSize = 16
            v66.Limits = Vector2.new(300, 60)
            v64[v65 + 1] = u8.createElement(u3, v66)
            local v69 = {}
            local v70 = u14.getRewardType(u16.Reward)
            v69.Text = v70 == nil and "" or v70
            v69.FontFace = Font.fromName("Roboto")
            v69.TextColor3 = Color3.fromRGB(191, 191, 191)
            v69.TextSize = 14
            v69.Limits = Vector2.new(300, 60)
            v64[v65 + 2] = u8.createElement(u3, v69)
            v64[v65 + 3] = u8.createElement(u3, {
                ["Text"] = "* Purchase unlock for tiers 5-10 to obtain rewards!",
                ["TextSize"] = 14,
                ["FontFace"] = Font.fromName("Roboto"),
                ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                ["Limits"] = Vector2.new(300, 60)
            })
            v62[v63 + 1] = u8.createElement(u7, {}, v64)
            v60 = u8.createElement("ImageLabel", v61, v62)
        else
            local v71 = {}
            local v72 = #v71
            if v23 then
                v23 = u8.createFragment({
                    ["RewardStatusImage"] = u8.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["AnchorPoint"] = Vector2.new(1, 0.5),
                        ["Position"] = UDim2.fromScale(0.9, 0.5),
                        ["Size"] = UDim2.fromScale(0.9, 0.9),
                        ["Image"] = u6.CHECK_CIRCLE_SOLID,
                        ["ImageColor3"] = u13.ProgressColor
                    }, { u8.createElement("UIPadding", {
                            ["PaddingRight"] = UDim.new(0, 10),
                            ["PaddingTop"] = UDim.new(0, 10)
                        }), u8.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) })
                })
            end
            if v23 then
                v71[v72 + 1] = v23
            end
            v71[#v71 + 1] = u8.createElement("TextLabel", {
                ["Text"] = "FREE",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["TextColor3"] = u4.WHITE,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }, { u8.createElement("UIStroke", {
                    ["Transparency"] = 0.3,
                    ["Color"] = u4.BLACK
                }) })
            v60 = u8.createFragment(v71)
        end
        local v73 = {
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["Position"] = UDim2.fromScale(0.5, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 1)
        }
        local v74 = {
            [#v74 + 1] = v60
        }
        v49.BottomSection = u8.createElement(u5, v73, v74)
        v43.KitContractRewardListCardShowcase = u8.createElement("Frame", v48, v49)
        v33.KitContractRewardListCardShowcaseContainer = u8.createElement(u5, v42, v43)
        v30[v31 + 1] = u8.createElement(u5, v32, v33)
        local v75 = u8.createFragment
        local v76 = {}
        local v77 = u16.Reward.tier
        v76["KitContractRewardsListCard" .. tostring(v77)] = u8.createElement(u5, v27, v30)
        return v75(v76)
    end)
}