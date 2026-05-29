local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "milestones", "ui", "milestones-config").milestonesLayout
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v89 = v7.new(u6)(function(u12, p13) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u6
        [4] = u11
        [5] = u3
        [6] = u4
        [7] = u10
    --]]
    local _ = p13.useState
    local v14 = u5.values(u12.Milestones)
    table.sort(v14, function(p15, p16) --[[ Line: 16 ]]
        return p15.numRequired < p16.numRequired
    end)
    local function v80(p17, p18) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u9
            [3] = u6
            [4] = u11
            [5] = u3
            [6] = u4
            [7] = u10
        --]]
        local u19 = u12.Progress >= p17.numRequired
        local _ = p17.claimable == nil
        local v20 = p17.claimable
        if v20 ~= nil then
            v20 = v20.isClaimed
        end
        local u21 = #p17.rewards
        UDim2.fromScale(0.4, 0.4)
        UDim2.fromScale(0.05, 0.05)
        if u21 == 1 then
            UDim2.fromScale(1, 1)
            UDim2.fromScale(0, 0)
        elseif u21 == 2 then
            UDim2.fromScale(0.45, 1)
            UDim2.fromScale(0.05, 0)
        elseif u21 > 2 then
            UDim2.fromScale(0.45, 0.45)
            UDim2.fromScale(0.05, 0.05)
        end
        local v22 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(0, u21 * u9.distanceX, 1, 0),
            ["LayoutOrder"] = p18
        }
        local v23 = { u6.createElement("UIListLayout", {
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v24 = #v23
        local v25 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.95),
            ["BackgroundTransparency"] = u19 and 0 or 0.5,
            ["BackgroundColor3"] = u11.backgroundPrimary
        }
        local v26 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }) }
        local _ = #v26
        local v27 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["BackgroundColor3"] = p17.milestoneColor or Color3.fromRGB(181, 255, 161)
        }
        local v28 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local v29 = #v28
        local v30 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v31 = p17.requiredText
        if v31 ~= nil then
            v31 = v31.preText
        end
        local v32 = v31 == nil and "" or v31
        local v33 = p17.numRequired
        local v34 = p17.requiredText
        if v34 ~= nil then
            v34 = v34.postText
        end
        local v35 = v34 == nil and "" or v34
        v30.Text = "<b>" .. v32 .. tostring(v33) .. v35 .. "</b>"
        v30.TextColor3 = u3.WHITE
        v30.TextSize = 25
        v30.RichText = true
        v30.Font = Enum.Font.Roboto
        v30.BackgroundTransparency = 1
        v30.TextTransparency = 0
        v30.TextXAlignment = Enum.TextXAlignment.Center
        v30.LayoutOrder = 0
        v28[v29 + 1] = u6.createElement("TextLabel", v30)
        v26.MilestoneRequirementHeader = u6.createElement("Frame", v27, v28)
        local v36 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.9, 0.7)
        }
        local v37 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local _ = #v37
        local v38 = p17.rewards
        local function v52(p39) --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u6
                [3] = u4
                [4] = u21
                [5] = u3
            --]]
            local v40 = u12.Rewards[p39]
            local v41
            if v40 == nil then
                v41 = v40
            else
                v41 = v40.display
                if v41 ~= nil then
                    v41 = v41.image
                end
            end
            local v42
            if v41 == "" or not v41 then
                local v43 = v40.display
                if v43 ~= nil then
                    v43 = v43.text
                end
                if v43 == "" or not v43 then
                    v42 = u6.createFragment()
                else
                    local v44 = {
                        ["LayoutOrder"] = 2,
                        ["Position"] = UDim2.fromScale(0.5, 0.35),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1 / u21, 1)
                    }
                    local v45 = {}
                    local v46 = #v45
                    local v47 = {
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0.9, 0.5)
                    }
                    local v48 = v40.display
                    if v48 ~= nil then
                        v48 = v48.text
                    end
                    v47.Text = v48
                    v47.Font = Enum.Font.LuckiestGuy
                    v47.TextScaled = true
                    v47.RichText = true
                    v47.TextColor3 = u3.WHITE
                    v47.TextXAlignment = "Center"
                    v47.TextYAlignment = "Center"
                    v47.BackgroundTransparency = 1
                    v45[v46 + 1] = u6.createElement("TextLabel", v47)
                    v42 = u6.createFragment({
                        ["RewardTextDisplay"] = u6.createElement(u4, v44, v45)
                    })
                end
            else
                local v49 = u6.createFragment
                local v50 = {
                    ["RewardImage"] = u6.createElement(u4, {
                        ["LayoutOrder"] = 2,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1 / u21, 0.9)
                    }, { u6.createElement("ImageLabel", {
                            ["ImageTransparency"] = 0,
                            ["BorderSizePixel"] = 0,
                            ["BackgroundTransparency"] = 1,
                            ["LayoutOrder"] = 2,
                            ["Size"] = UDim2.fromScale(1, 0.9),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Image"] = v40.display.image,
                            ["ScaleType"] = Enum.ScaleType.Fit
                        }) })
                }
                v42 = v49(v50)
            end
            local v51 = {
                [#v51 + 1] = v42
            }
            return u6.createFragment(v51)
        end
        local v53 = table.create(#v38)
        for v54, v55 in v38 do
            v53[v54] = v52(v55, v54 - 1, v38)
        end
        local v56 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.75)
        }
        local v57 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 16)
            }) }
        local v58 = #v57
        for v59, v60 in v53 do
            v57[v58 + v59] = v60
        end
        v37.ImageList = u6.createElement(u4, v56, v57)
        local v61 = not (v20 and u19)
        if v61 then
            local v62 = p17.rewards
            local function v72(p63) --[[ Line: 238 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u11
                    [3] = u19
                    [4] = u6
                    [5] = u21
                    [6] = u3
                --]]
                local v64 = u12.Rewards[p63]
                local v65 = v64.display
                if v65 ~= nil then
                    v65 = v65.rewardTypeText
                end
                local v66 = v65 ~= nil
                if v66 then
                    local v67 = {
                        ["AutomaticSize"] = "Y",
                        ["Size"] = UDim2.fromScale(1, 0)
                    }
                    local v68 = v64.display
                    if v68 ~= nil then
                        v68 = string.upper(v68.rewardTypeText)
                    end
                    v67.Text = "<b>" .. v68 .. "</b>"
                    v67.TextColor3 = u11.textPrimary
                    v67.TextSize = 15
                    v67.RichText = true
                    v67.Font = Enum.Font.Roboto
                    v67.BackgroundTransparency = 1
                    v67.TextTransparency = u19 and 0 or 0.5
                    v67.TextXAlignment = Enum.TextXAlignment.Center
                    v67.TextYAlignment = Enum.TextYAlignment.Center
                    v67.LayoutOrder = 0
                    v66 = u6.createElement("TextLabel", v67)
                end
                local v69 = {
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(1 / u21, 1),
                    ["BackgroundTransparency"] = u19 and 0.55 or 0.75,
                    ["BackgroundColor3"] = u3.BLACK
                }
                local v70 = { u6.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }), u6.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["Padding"] = UDim.new(0.1, 0),
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    }) }
                local v71 = #v70
                if v66 then
                    v70[v71 + 1] = v66
                end
                v70[#v70 + 1] = u6.createElement("TextLabel", {
                    ["TextSize"] = 24,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.35),
                    ["Text"] = "<b>" .. v64.name .. "</b>",
                    ["TextColor3"] = u3.WHITE,
                    ["Font"] = Enum.Font.Roboto,
                    ["TextTransparency"] = u19 and 0 or 0.5,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
                return u6.createFragment({
                    ["RewardInfoCard"] = u6.createElement("Frame", v69, v70)
                })
            end
            v61 = table.create(#v62)
            for v73, v74 in v62 do
                v61[v73] = v72(v74, v73 - 1, v62)
            end
        end
        local v75 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.25)
        }
        local v76 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 16)
            }) }
        local v77 = #v76
        if v61 then
            for v78, v79 in v61 do
                v76[v77 + v78] = v79
            end
        end
        v37.RewardLabel = u6.createElement(u4, v75, v76)
        v26.RewardContet = u6.createElement(u4, v36, v37)
        v23[v24 + 1] = u6.createElement("Frame", v25, v26)
        v23[v24 + 2] = u6.createElement("ImageLabel", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.125, 0.025),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["Image"] = u10.TRIANGLE_DOWN,
            ["ImageColor3"] = u11.backgroundPrimary,
            ["ImageTransparency"] = u19 and 0 or 0.5,
            ["ScaleType"] = Enum.ScaleType.Stretch
        })
        return u6.createFragment({
            ["MilestonesReward"] = u6.createElement("Frame", v22, v23)
        })
    end
    local v81 = table.create(#v14)
    for v82, v83 in v14 do
        v81[v82] = v80(v83, v82 - 1, v14)
    end
    local v84 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = u12.Size or UDim2.fromScale(1, 1),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["BackgroundColor3"] = u3.WHITE
    }
    local v85 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 30)
        }) }
    local v86 = #v85
    for v87, v88 in v81 do
        v85[v86 + v87] = v88
    end
    return u6.createFragment({
        ["MilestonesRewardsContainer"] = u6.createElement("Frame", v84, v85)
    })
end)
return {
    ["EggHuntMilestoneRewardsList"] = v8.connect(function(_, p90) --[[ Line: 384 ]]
        local v91 = {}
        for v92, v93 in p90 do
            v91[v92] = v93
        end
        return v91
    end)(v89)
}