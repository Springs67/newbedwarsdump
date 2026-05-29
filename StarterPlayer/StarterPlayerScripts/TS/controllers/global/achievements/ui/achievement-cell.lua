local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = v1.import(script, script.Parent, "achievement-icon").AchievementIcon
local v62 = v5.new(u4)(function(u13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u4
        [4] = u3
        [5] = u12
        [6] = u2
        [7] = u10
        [8] = u7
        [9] = u9
    --]]
    local _ = p14.useState
    local _ = p14.useEffect
    if u13.ViewingOnProfile then
        u13.Selected = false
    end
    local v15 = u8.getMeta(u13.Id)
    local v16 = u13.ProfileData.achievementProgressValues[u13.Id]
    local v17 = v16 == nil and 0 or v16
    if v17 ~= 0 and (v17 == v17 and v17) then
        u8.getProgressString(u13.Id, v17)
    end
    local v18 = u13.ProfileData.achievements[u13.Id]
    local v19
    if v18 == nil then
        v19 = v18
    else
        v19 = v18.achieved
    end
    if v19 == nil then
        v19 = false
    end
    local v20
    if v18 == nil then
        v20 = v18
    else
        v20 = v18.dateAchieved
    end
    local v21
    if v18 then
        v21 = u8.hasUnclaimedRewards(u13.Id, v18)
    else
        v21 = false
    end
    local v22 = 0
    local v23 = v15.sub
    if v23 ~= nil then
        for v24, v25 in v23 do
            local _ = v24 - 1
            local v26 = u13.ProfileData.achievements[v25]
            if v26 ~= nil then
                v26 = v26.achieved
            end
            if v26 then
                local v27 = v22 + 1
                v22 = v27
            end
        end
    end
    local v28 = v15.sub
    local v29 = v28 ~= nil and #v28 or v28
    local v30 = v29 == nil and 0 or v29
    if not u13.ViewingOnProfile and v30 <= 0 then
        local _ = v15.useProgressBar
    end
    if v22 ~= 0 and (v22 == v22 and v22) then
        local _ = v22 / v30
    end
    local _ = tostring(v22) .. "/" .. tostring(v30)
    if v15.useProgressBar and v15.goal then
        local v31 = u13.ProfileData.achievementProgressValues[u13.Id]
        if v31 ~= 0 and (v31 == v31 and v31) then
            local _ = v31 / v15.goal.value
        end
        local v32 = math
        local v33 = v31 == nil and 0 or v31
        local v34 = v15.goal.value
        local v35 = v32.min(v33, v34)
        local v36 = tostring(v35)
        local v37 = v15.goal.value
        local _ = v36 .. "/" .. tostring(v37)
    end
    local v38
    if v20 == nil then
        v38 = false
    elseif v19 then
        v38 = u13.ViewingOnProfile
    else
        v38 = v19
    end
    local v39 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v40
    if u13.ViewingOnProfile then
        v40 = u11.backgroundSecondary
    elseif v19 then
        v40 = u11.backgroundPrimary
    else
        v40 = u11.backgroundTertiaryCard
    end
    v39.BackgroundColor3 = v40
    v39.BorderSizePixel = 0
    v39.BackgroundTransparency = v19 and 0 or 0.3
    v39[u4.Event.Activated] = function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if not u13.ViewingOnProfile then
            u13.OnSelect()
        end
    end
    v39.AutoButtonColor = not u13.ViewingOnProfile
    local v41 = { u4.createElement("UIStroke", {
            ["Thickness"] = 1,
            ["Color"] = u3.WHITE,
            ["Transparency"] = u13.Selected and 0.5 or 1
        }), u4.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }), u4.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 8),
            ["PaddingBottom"] = UDim.new(0, 8),
            ["PaddingLeft"] = UDim.new(0, 8),
            ["PaddingRight"] = UDim.new(0, 8)
        }) }
    local v42 = #v41
    local v43 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v44 = { u4.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v45 = #v44
    local v46
    if v38 then
        v46 = u4.createFragment({
            ["AchievementDate"] = u4.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.3,
                ["LayoutOrder"] = 0,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(1, 0.08),
                ["Text"] = (v20 == "" or not v20) and "" or v20,
                ["Font"] = Enum.Font.Roboto,
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Right
            })
        })
    else
        v46 = v38
    end
    if v46 then
        v44[v45 + 1] = v46
    end
    local v47 = #v44
    v44[v47 + 1] = u4.createElement(u12, {
        ["Simple"] = true,
        ["Id"] = u13.Id,
        ["Darkened"] = not v19,
        ["FrameProps"] = {
            ["ZIndex"] = 2,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, v38 and 0.56 or 0.63)
        }
    })
    local v48 = {
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 12,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, v38 and 0.3 or 0.34),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 1)
    }
    local v49 = { (u4.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["Padding"] = UDim.new(0, 0),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
        })) }
    local v50 = u4.createElement
    local v51 = "TextLabel"
    local v52 = {
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["TextWrapped"] = true,
        ["LayoutOrder"] = 0,
        ["ZIndex"] = 12,
        ["Size"] = UDim2.fromScale(1, 0.4),
        ["Text"] = v15.title,
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
    }
    local v53
    if v19 then
        v53 = u3.WHITE
    else
        v53 = u11.textPrimary
    end
    v52.TextColor3 = v53
    v52.TextXAlignment = Enum.TextXAlignment.Center
    v49.AchievementTitle = v50(v51, v52, { u4.createElement("UISizeConstraint", {
            ["MaxSize"] = Vector2.new((1 / 0), 40)
        }), u4.createElement("UIStroke", {
            ["Thickness"] = 1,
            ["Transparency"] = 0.5,
            ["Color"] = u3.BLACK
        }) })
    local _ = #v49
    local v54 = {
        ["Size"] = UDim2.fromScale(1, 0.6)
    }
    local v55 = v15.goal
    if v55 ~= nil then
        v55 = v55.value
    end
    local v56 = v55 == nil and 0 or v55
    v54.Text = v15.description(v56)
    v54.TextScaled = true
    v54.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
    local v57
    if v19 then
        v57 = u3.WHITE
    else
        v57 = u11.textPrimary
    end
    v54.TextColor3 = v57
    v54.BackgroundTransparency = 1
    v54.TextTransparency = 0.3
    v54.TextWrapped = true
    v54.TextXAlignment = Enum.TextXAlignment.Center
    v54.LayoutOrder = 1
    v54.ZIndex = 12
    v49.AchievementDesc = u4.createElement("TextLabel", v54, { u4.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 18
        }) })
    v44[v47 + 2] = u4.createElement("Frame", v48, v49)
    v41[v42 + 1] = u4.createElement(u2, v43, v44)
    local v58 = v42 + 2
    local v59 = u4.createElement
    local v60 = "ImageButton"
    local v61 = {
        ["Size"] = UDim2.fromScale(0.2, 0.2),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.fromScale(1, 0),
        [u4.Event.Activated] = function() --[[ Line: 239 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u13
                [3] = u7
            --]]
            u10.Client:Get("ClaimAchievementRewards"):SendToServer({
                ["id"] = u13.Id
            })
            u7:dispatch({
                ["type"] = "LobbyClaimAchievementRewards",
                ["id"] = u13.Id
            })
        end,
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = Color3.fromRGB(255, 165, 20)
    }
    if v21 then
        v21 = not u13.ViewingOnProfile
    end
    v61.Visible = v21
    v61.ZIndex = 13
    v41[v58] = v59(v60, v61, {
        u4.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }),
        u4.createElement("UISizeConstraint", {
            ["MaxSize"] = Vector2.new(40, 40)
        }),
        u4.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 20)
        }),
        u4.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 14,
            ["Size"] = UDim2.fromScale(0.6, 0.6),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = u9.GIFT_SOLID
        })
    })
    return u4.createFragment({
        ["AchievementContainer"] = u4.createElement("ImageButton", v39, v41)
    })
end)
return {
    ["AchievementCell"] = v6.connect(function(p63, p64) --[[ Line: 276 ]]
        local v65 = {}
        for v66, v67 in p64 do
            v65[v66] = v67
        end
        v65.store = p63
        return v65
    end)(v62)
}