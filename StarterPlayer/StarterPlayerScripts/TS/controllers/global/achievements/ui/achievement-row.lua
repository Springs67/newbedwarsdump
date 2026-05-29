local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v1.import(script, script.Parent, "achievement-icon").AchievementIcon
local v82 = v7.new(u6)(function(u16, p17) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u6
        [4] = u5
        [5] = u15
        [6] = u12
        [7] = u9
        [8] = u4
        [9] = u3
        [10] = u13
        [11] = u10
    --]]
    local _ = p17.useState
    local _ = p17.useEffect
    if u16.ViewingOnProfile then
        u16.Selected = false
    end
    local v18 = u11.getMeta(u16.Id)
    local v19 = u16.ProfileData.achievementProgressValues[u16.Id]
    local v20 = v19 == nil and 0 or v19
    if v20 ~= 0 and (v20 == v20 and v20) then
        u11.getProgressString(u16.Id, v20)
    end
    local u21 = u16.ProfileData.achievements[u16.Id]
    local v22
    if u21 == nil then
        v22 = u21
    else
        v22 = u21.achieved
    end
    if v22 == nil then
        v22 = false
    end
    local v23
    if u21 == nil then
        v23 = u21
    else
        v23 = u21.dateAchieved
    end
    local v24
    if u21 then
        v24 = u11.hasUnclaimedRewards(u16.Id, u21)
    else
        v24 = false
    end
    local v25 = 0
    local v26 = v18.sub
    if v26 ~= nil then
        for v27, v28 in v26 do
            local _ = v27 - 1
            local v29 = u16.ProfileData.achievements[v28]
            if v29 ~= nil then
                v29 = v29.achieved
            end
            if v29 then
                local v30 = v25 + 1
                v25 = v30
            end
        end
    end
    local v31 = v18.sub
    local v32 = v31 ~= nil and #v31 or v31
    local v33 = v32 == nil and 0 or v32
    if not u16.ViewingOnProfile and v33 <= 0 then
        local _ = v18.useProgressBar
    end
    if v25 ~= 0 and (v25 == v25 and v25) then
        local _ = v25 / v33
    end
    local _ = tostring(v25) .. "/" .. tostring(v33)
    if v18.useProgressBar and v18.goal then
        local v34 = u16.ProfileData.achievementProgressValues[u16.Id]
        if v34 ~= 0 and (v34 == v34 and v34) then
            local _ = v34 / v18.goal.value
        end
        local v35 = math
        local v36 = v34 == nil and 0 or v34
        local v37 = v18.goal.value
        local v38 = v35.min(v36, v37)
        local v39 = tostring(v38)
        local v40 = v18.goal.value
        local _ = v39 .. "/" .. tostring(v40)
    end
    local v41 = v18.rewards
    local v42 = {
        ["Size"] = UDim2.new(1, 0, 0, 90)
    }
    local v43
    if u16.ViewingOnProfile then
        v43 = u14.backgroundSecondary
    elseif v22 then
        v43 = u14.backgroundPrimary
    else
        v43 = u14.backgroundTertiaryCard
    end
    v42.BackgroundColor3 = v43
    v42.BorderSizePixel = 0
    v42.BackgroundTransparency = v22 and 0 or 0.3
    v42[u6.Event.Activated] = function() --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if not u16.ViewingOnProfile then
            u16.OnSelect()
        end
    end
    v42.AutoButtonColor = not u16.ViewingOnProfile
    v42.LayoutOrder = u16.LayoutOrder
    local v44 = { u6.createElement("UIStroke", {
            ["Thickness"] = 1,
            ["Color"] = u5.WHITE,
            ["Transparency"] = u16.Selected and 0.5 or 1
        }), u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }), u6.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 8),
            ["PaddingBottom"] = UDim.new(0, 8),
            ["PaddingLeft"] = UDim.new(0, 8),
            ["PaddingRight"] = UDim.new(0, 8)
        }) }
    local v45 = #v44
    local v46 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v47 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["Padding"] = UDim.new(0.03, 0)
        }), (u6.createElement(u15, {
            ["Simple"] = true,
            ["Id"] = u16.Id,
            ["Darkened"] = not v22,
            ["FrameProps"] = {
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.1, 1)
            }
        })) }
    local v48 = u6.createElement
    local v49 = "TextLabel"
    local v50 = {
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["TextWrapped"] = true,
        ["LayoutOrder"] = 1,
        ["ZIndex"] = 12,
        ["Size"] = UDim2.fromScale(0.2, 1),
        ["Text"] = v18.title,
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
    }
    local v51
    if v22 then
        v51 = u5.WHITE
    else
        v51 = u14.textPrimary
    end
    v50.TextColor3 = v51
    v50.TextXAlignment = Enum.TextXAlignment.Center
    v47.AchievementTitle = v48(v49, v50, { u6.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 20
        }), u6.createElement("UIStroke", {
            ["Thickness"] = 1,
            ["Transparency"] = 0.5,
            ["Color"] = u5.BLACK
        }) })
    local v52 = #v47
    local v53 = {
        ["Size"] = UDim2.fromScale(0.45, 1)
    }
    local v54 = v18.goal
    if v54 ~= nil then
        v54 = v54.value
    end
    local v55 = v54 == nil and 0 or v54
    v53.Text = v18.description(v55)
    v53.TextScaled = true
    v53.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
    local v56
    if v22 then
        v56 = u5.WHITE
    else
        v56 = u14.textPrimary
    end
    v53.TextColor3 = v56
    v53.BackgroundTransparency = 1
    v53.TextTransparency = 0.3
    v53.TextWrapped = true
    v53.TextXAlignment = Enum.TextXAlignment.Center
    v53.LayoutOrder = 2
    v53.ZIndex = 12
    v47.AchievementDesc = u6.createElement("TextLabel", v53, { u6.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 18
        }) })
    if v41 then
        local v57 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.16, 1)
        }
        local v58 = {}
        local v59 = #v58
        local v60 = v18.rewards
        local v61
        if v60 == nil then
            v61 = v60
        else
            local function v74(p62) --[[ Line: 211 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u14
                    [3] = u6
                    [4] = u12
                    [5] = u5
                    [6] = u9
                    [7] = u4
                --]]
                local v63 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v64 = {}
                local v65 = #v64
                local v66 = {
                    ["Size"] = UDim2.new(1, 4, 1, 4),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }
                local v67 = u21
                if v67 ~= nil then
                    v67 = v67.rewardsClaimed
                end
                local v68
                if v67 then
                    v68 = u14.backgroundPrimary
                else
                    v68 = u14.backgroundSecondary
                end
                v66.BackgroundColor3 = v68
                local v69 = u21
                if v69 ~= nil then
                    v69 = v69.rewardsClaimed
                end
                v66.BackgroundTransparency = v69 and 0.5 or 0.8
                v66.ZIndex = 2
                local v70 = { u6.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 5)
                    }) }
                local v71 = #v70
                local v72 = {
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 3,
                    ["Size"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["Image"] = u12.CHECK_SOLID,
                    ["ImageColor3"] = u5.WHITE
                }
                local v73 = u21
                if v73 ~= nil then
                    v73 = v73.rewardsClaimed
                end
                v72.Visible = v73 == true
                v70[v71 + 1] = u6.createElement("ImageLabel", v72, { u6.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
                v70[v71 + 2] = u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                })
                v64[v65 + 1] = u6.createElement("Frame", v66, v70)
                v64[v65 + 2] = u6.createElement(u9, {
                    ["ZIndex"] = 0,
                    ["Reward"] = p62
                })
                return u6.createElement(u4, v63, v64)
            end
            v61 = table.create(#v60)
            for v75, v76 in v60 do
                v61[v75] = v74(v76, v75 - 1, v60)
            end
        end
        local v77 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Visible"] = not v24
        }
        local v78 = { u6.createElement("UIGridLayout", {
                ["FillDirectionMaxCells"] = 5,
                ["CellSize"] = UDim2.new(0.5, 0, 1, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center
            }) }
        local v79 = #v78
        if v61 then
            for v80, v81 in v61 do
                v78[v79 + v80] = v81
            end
        end
        v58[v59 + 1] = u6.createElement(u4, v77, v78)
        v58[v59 + 2] = u6.createElement(u3, {
            ["Text"] = "CLAIM REWARDS",
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 300 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u16
                    [3] = u10
                --]]
                u13.Client:Get("ClaimAchievementRewards"):SendToServer({
                    ["id"] = u16.Id
                })
                u10:dispatch({
                    ["type"] = "LobbyClaimAchievementRewards",
                    ["id"] = u16.Id
                })
            end,
            ["CornerRadius"] = UDim.new(0, 5),
            ["TextLabel"] = {
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            },
            ["Visible"] = v24,
            ["BackgroundColor3"] = u14.backgroundSuccess
        })
        v41 = u6.createElement(u4, v57, v58)
    end
    if v41 then
        v47[v52 + 1] = v41
    end
    v44[v45 + 1] = u6.createElement(u4, v46, v47)
    return u6.createFragment({
        ["AchievementContainer"] = u6.createElement("ImageButton", v42, v44)
    })
end)
return {
    ["AchievementRow"] = v8.connect(function(p83, p84) --[[ Line: 328 ]]
        local v85 = {}
        for v86, v87 in p84 do
            v85[v86] = v87
        end
        v85.store = p83
        return v85
    end)(v82)
}