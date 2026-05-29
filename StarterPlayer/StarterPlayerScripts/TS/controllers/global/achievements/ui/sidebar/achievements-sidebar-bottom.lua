local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["AchievementsSidebarBottom"] = v7.new(u6)(function(p14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u6
            [4] = u5
            [5] = u13
            [6] = u11
            [7] = u8
            [8] = u3
            [9] = u12
            [10] = u9
        --]]
        local _ = p15.useState
        local u16 = p14.AchievementId
        local v17 = p14.AchievementMeta
        local u18 = p14.AchievementData
        if v17 ~= nil then
            v17 = v17.rewards
        end
        local v19
        if u16 and u18 then
            v19 = u10.hasUnclaimedRewards(u16, u18)
        else
            v19 = false
        end
        local u20
        if u18 == nil then
            u20 = u18
        else
            u20 = u18.rewardsClaimed
        end
        if u20 == nil then
            u20 = false
        end
        local v21 = {
            ["Size"] = UDim2.fromScale(1, 0.02)
        }
        local v22 = p14.FrameProps
        if v22 then
            for v23, v24 in v22 do
                v21[v23] = v24
            end
        end
        v21.Visible = true
        if v17 then
            local v25 = {
                ["LayoutOrder"] = 10,
                ["BackgroundTransparency"] = 0.7,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.8),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["BackgroundColor3"] = u4.BLACK
            }
            local v26 = { u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 10)
                }), u6.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
                }) }
            local v27 = #v26
            local v28 = not (v19 or u20)
            if v28 then
                v28 = u6.createElement(u5, {
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.2)
                }, { u6.createElement("TextLabel", {
                        ["Text"] = "REWARDS",
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextColor3"] = u13.textPrimary,
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }) })
            end
            if v28 then
                v26[v27 + 1] = v28
            end
            local v29 = #v26
            local function v36(p30) --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u18
                    [3] = u6
                    [4] = u11
                    [5] = u4
                    [6] = u8
                    [7] = u5
                --]]
                local v31 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v32 = {}
                local v33 = #v32
                local v34 = {
                    ["BackgroundTransparency"] = 0.5,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.new(1, 4, 1, 4),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["BackgroundColor3"] = u13.backgroundSecondary
                }
                local v35 = u18
                if v35 ~= nil then
                    v35 = v35.rewardsClaimed
                end
                v34.Visible = v35 ~= nil
                v32[v33 + 1] = u6.createElement("Frame", v34, { u6.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 5)
                    }), u6.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["ZIndex"] = 3,
                        ["Size"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["ScaleType"] = Enum.ScaleType.Fit,
                        ["Image"] = u11.CHECK_SOLID,
                        ["ImageColor3"] = u4.WHITE
                    }, { u6.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) }), u6.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
                v32[v33 + 2] = u6.createElement(u8, {
                    ["ZIndex"] = 0,
                    ["Reward"] = p30
                })
                v32[v33 + 3] = u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                })
                return u6.createElement(u5, v31, v32)
            end
            local v37 = table.create(#v17)
            for v38, v39 in v17 do
                v37[v38] = v36(v39, v38 - 1, v17)
            end
            local v40 = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.7)
            }
            local v41 = { u6.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 8),
                    ["PaddingBottom"] = UDim.new(0, 8),
                    ["PaddingLeft"] = UDim.new(0, 5),
                    ["PaddingRight"] = UDim.new(0, 5)
                }), u6.createElement("UIGridLayout", {
                    ["FillDirectionMaxCells"] = 5,
                    ["CellSize"] = UDim2.new(0.2, 0, 1, 0),
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                }) }
            local v42 = #v41
            for v43, v44 in v37 do
                v41[v42 + v43] = v44
            end
            v26[v29 + 1] = u6.createElement(u5, v40, v41)
            if v19 or u20 then
                if u16 then
                    local v45 = u6.createFragment
                    local v46 = {}
                    local v47 = u6.createElement
                    local v48 = u3
                    local v50 = {
                        ["LayoutOrder"] = 99,
                        ["Size"] = UDim2.fromScale(1, 0.3),
                        ["OnClick"] = function() --[[ Name: OnClick, Line 172 ]]
                            --[[
                            Upvalues:
                                [1] = u20
                                [2] = u12
                                [3] = u16
                                [4] = u9
                            --]]
                            if u20 then
                                return nil
                            end
                            local v49 = {
                                ["id"] = u16
                            }
                            u12.Client:Get("ClaimAchievementRewards"):SendToServer(v49)
                            u9:dispatch({
                                ["type"] = "LobbyClaimAchievementRewards",
                                ["id"] = u16
                            })
                        end,
                        ["Text"] = u20 and "CLAIMED" or "CLAIM REWARDS"
                    }
                    local v51
                    if u20 then
                        v51 = Color3.fromRGB(0, 0, 0)
                    else
                        v51 = u13.backgroundSuccess
                    end
                    v50.BackgroundColor3 = v51
                    v50.BackgroundTransparency = u20 and 0.5 or 0
                    v50.CornerRadius = UDim.new(0, 10)
                    v50.TextLabel = {
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }
                    v46.ClaimRewardsButton = v47(v48, v50)
                    u16 = v45(v46)
                end
            else
                u16 = u20
            end
            if u16 then
                v26[v29 + 2] = u16
            end
            v17 = u6.createFragment({
                ["AchievementRewards"] = u6.createElement("Frame", v25, v26)
            })
        end
        local v52 = { u6.createElement("UISizeConstraint", {
                ["MinSize"] = Vector2.new(0, 100)
            }), u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }) }
        local v53 = #v52
        if v17 then
            v52[v53 + 1] = v17
        end
        return u6.createFragment({
            ["SidebarBottom"] = u6.createElement(u5, v21, v52)
        })
    end)
}