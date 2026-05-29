local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-meta").getGameMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u16 = v1.import(script, script.Parent.Parent, "achievement-icon").AchievementIcon
local u17 = v1.import(script, script.Parent.Parent, "progress", "kit-variety", "kit-variety-progress").KitVarietyProgress
return {
    ["AchievementsSidebarCenter"] = v9.new(u8)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u8
            [4] = u16
            [5] = u5
            [6] = u4
            [7] = u13
            [8] = u3
            [9] = u7
            [10] = u14
            [11] = u15
            [12] = u12
            [13] = u17
            [14] = u6
        --]]
        local _ = p19.useState
        local v20 = u18.AchievementId
        local v21 = u18.AchievementMeta
        local v22 = ""
        if v20 then
            local v23 = u18.ProfileData.achievementProgressValues[v20]
            if v23 ~= 0 and (v23 == v23 and v23) then
                v22 = u11.getProgressString(v20, v23)
            end
        end
        local v24 = (u18.AchievementId == u10.KIT_VARIETY_1 or u18.AchievementId == u10.KIT_VARIETY_2) and true or u18.AchievementId == u10.KIT_VARIETY_3
        local v25 = {
            ["Size"] = UDim2.fromScale(1, 0.96)
        }
        local v26 = u18.FrameProps
        if v26 then
            for v27, v28 in v26 do
                v25[v27] = v28
            end
        end
        local v29 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["Padding"] = UDim.new(0.05, 0)
            }), u8.createElement(u16, {
                ["Darkened"] = false,
                ["Id"] = u18.AchievementId,
                ["Simple"] = u5.isSmallScreen(),
                ["FrameProps"] = {
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.4)
                }
            }) }
        local _ = #v29
        local v30
        if v21 == nil then
            v30 = v21
        else
            v30 = v21.title
        end
        local v31 = v30 ~= nil
        if v31 then
            local v32 = u8.createFragment
            local v33 = {
                ["AchievementTitle"] = u8.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextWrapped"] = true,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.2),
                    ["Text"] = v21.title,
                    ["FontFace"] = Font.fromName("LuckiestGuy", Enum.FontWeight.Regular),
                    ["TextColor3"] = u4.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center
                }, { u8.createElement("UISizeConstraint", {
                        ["MaxSize"] = Vector2.new((1 / 0), u5.isSmallScreen() and 20 or 35)
                    }) })
            }
            v31 = v32(v33)
        end
        local v34 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.55),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1)
        }
        local v35 = { u8.createElement("UIListLayout", {
                ["Padding"] = UDim.new(0.03, 0),
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }) }
        local v36 = #v35
        if v31 then
            v35[v36 + 1] = v31
        end
        local v37 = #v35
        local v38 = {
            ["Size"] = UDim2.fromScale(1, 0.3)
        }
        local v39
        if v21 == nil then
            v39 = v21
        else
            local v40 = v21.goal
            if v40 ~= nil then
                v40 = v40.value
            end
            local v41 = v40 == nil and 0 or v40
            v39 = v21.description(v41)
        end
        v38.Text = tostring(v39)
        v38.TextScaled = true
        v38.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v38.TextColor3 = u4.WHITE
        v38.BackgroundTransparency = 1
        v38.TextWrapped = true
        v38.TextXAlignment = Enum.TextXAlignment.Center
        v38.LayoutOrder = 1
        v35.AchievementDesc = u8.createElement("TextLabel", v38, { u8.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new((1 / 0), 60)
            }), u8.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u5.isSmallScreen() and 20 or 30
            }) })
        local v42
        if v21 == nil then
            v42 = v21
        else
            v42 = v21.details
        end
        local v43 = v42 ~= nil
        if v43 then
            local v44 = {
                ["Size"] = UDim2.fromScale(1, 0.2)
            }
            local v45
            if v21 == nil then
                v45 = v21
            else
                v45 = v21.details
            end
            v44.Text = v45
            v44.TextScaled = true
            v44.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
            v44.RichText = true
            v44.TextColor3 = u4.WHITE
            v44.TextTransparency = 0.3
            v44.BackgroundTransparency = 1
            v44.TextWrapped = true
            v44.TextXAlignment = Enum.TextXAlignment.Center
            v44.LayoutOrder = 2
            v43 = u8.createFragment({
                ["AchievementDetails"] = u8.createElement("TextLabel", v44)
            })
        end
        if v43 then
            v35[v37 + 1] = v43
        end
        local v46 = #v35
        local v47
        if v21 == nil then
            v47 = v21
        else
            v47 = v21.queues
        end
        local v48 = v47 ~= nil
        if not v48 then
            local v49
            if v21 == nil then
                v49 = v21
            else
                v49 = v21.games
            end
            v48 = v49 ~= nil
        end
        if v48 then
            local v50
            if v21 == nil then
                v50 = v21
            else
                v50 = v21.queues
            end
            local v51 = v50 ~= nil
            if v51 then
                local v52 = {}
                local v53 = #v52
                local v54 = {}
                local v55
                if v21 == nil then
                    v55 = v21
                else
                    local v56 = v21.queues
                    local v57 = table.create(#v56)
                    for v58, v59 in v56 do
                        local _ = v58 - 1
                        v57[v58] = u13(v59).title
                    end
                    v55 = table.concat(v57, ", ")
                end
                v54.Text = "Applicable queues: <b>" .. v55 .. "</b>"
                v54.Font = Enum.Font.SourceSans
                v54.RichText = true
                v54.TextSize = 16
                v54.Limits = Vector2.new(280, 60)
                v52[v53 + 1] = u8.createElement(u3, v54)
                v51 = u8.createElement(u7, {}, v52)
            end
            local v60 = {
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 0.3,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["Image"] = u14.INFO_ICON,
                ["ImageColor3"] = u15.textPrimary
            }
            local v61 = { u8.createElement("UISizeConstraint", {
                    ["MinSize"] = Vector2.new(0, 16)
                }), u8.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }
            local v62 = #v61
            if v51 then
                v61[v62 + 1] = v51
            end
            local v63 = #v61
            local v64
            if v21 == nil then
                v64 = v21
            else
                v64 = v21.games
            end
            local v65 = v64 ~= nil
            if v65 then
                local v66 = {}
                local v67 = #v66
                local v68 = {}
                local v69
                if v21 == nil then
                    v69 = v21
                else
                    local v70 = v21.games
                    local v71 = table.create(#v70)
                    for v72, v73 in v70 do
                        local _ = v72 - 1
                        v71[v72] = u12(v73).title
                    end
                    v69 = table.concat(v71, ", ")
                end
                v68.Text = "Applicable game modes: <b>" .. v69 .. "</b>"
                v68.Font = Enum.Font.SourceSans
                v68.RichText = true
                v68.TextSize = 16
                v68.Limits = Vector2.new(280, 60)
                v66[v67 + 1] = u8.createElement(u3, v68)
                v65 = u8.createElement(u7, {}, v66)
            end
            if v65 then
                v61[v63 + 1] = v65
            end
            v48 = u8.createFragment({
                ["AchievementGameQueueInfo"] = u8.createElement("ImageLabel", v60, v61)
            })
        end
        if v48 then
            v35[v46 + 1] = v48
        end
        local _ = #v35
        local v74 = {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.2)
        }
        local v75 = { u8.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new((1 / 0), 40)
            }) }
        local v76 = #v75
        if v24 then
            v24 = u8.createElement(u17, {
                ["FrameProps"] = {
                    ["Size"] = UDim2.fromScale(1, 1)
                },
                ["ProfileData"] = u18.ProfileData
            })
        end
        if v24 then
            v75[v76 + 1] = v24
        end
        local v77 = #v75
        local v78
        if v22 == "" then
            v78 = false
        else
            v78 = u8.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Text"] = v22,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Center
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) })
        end
        if v78 then
            v75[v77 + 1] = v78
        end
        local v79 = #v75
        local v80
        if v21 == nil then
            v80 = v21
        else
            v80 = v21.sub
        end
        if v80 then
            local v81 = v21.sub
            local function v102(p82, p83) --[[ Line: 321 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u18
                    [3] = u8
                    [4] = u14
                    [5] = u4
                    [6] = u6
                --]]
                local v84 = u11.getMeta(p82)
                local v85 = u18.ProfileData.achievements[p82]
                local v86 = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.new(1, 0, 0, 40),
                    ["LayoutOrder"] = p83
                }
                local v87 = { u8.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["Padding"] = UDim.new(0, 5),
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
                    }) }
                local v88 = #v87
                local v89 = {
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(0.15, 1)
                }
                local v90 = {}
                local v91 = #v90
                local v92 = {}
                local v93
                if v85 == nil then
                    v93 = v85
                else
                    v93 = v85.achieved
                end
                local v94
                if v93 then
                    v94 = UDim2.fromScale(0.7, 1)
                else
                    v94 = UDim2.fromScale(1, 1)
                end
                v92.Size = v94
                local v95
                if v85 == nil then
                    v95 = v85
                else
                    v95 = v85.achieved
                end
                local v96
                if v95 then
                    v96 = u14.CHECK_SOLID
                else
                    v96 = u14.X
                end
                v92.Image = v96
                local v97
                if v85 == nil then
                    v97 = v85
                else
                    v97 = v85.achieved
                end
                local v98
                if v97 then
                    v98 = u4.WHITE
                else
                    v98 = u4.BLACK
                end
                v92.ImageColor3 = v98
                if v85 ~= nil then
                    v85 = v85.achieved
                end
                v92.ImageTransparency = v85 and 0 or 0.5
                v92.BackgroundTransparency = 1
                v92.ScaleType = Enum.ScaleType.Fit
                v92.AnchorPoint = Vector2.new(0.5, 0.5)
                v92.Position = UDim2.fromScale(0.5, 0.5)
                v90[v91 + 1] = u8.createElement("ImageLabel", v92, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
                v87[v88 + 1] = u8.createElement(u6, v89, v90)
                local v99 = {
                    ["Size"] = UDim2.fromScale(0.85, 1) - UDim2.fromOffset(0, 5)
                }
                local v100 = v84.goal
                if v100 ~= nil then
                    v100 = v100.value
                end
                local v101 = v100 == nil and 0 or v100
                v99.Text = v84.description(v101)
                v99.TextScaled = true
                v99.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                v99.TextColor3 = u4.WHITE
                v99.BackgroundTransparency = 1
                v99.TextXAlignment = Enum.TextXAlignment.Left
                v99.LayoutOrder = 1
                v87[v88 + 2] = u8.createElement("TextLabel", v99)
                return u8.createElement("Frame", v86, v87)
            end
            local v103 = table.create(#v81)
            for v104, v105 in v81 do
                v103[v104] = v102(v105, v104 - 1, v81)
            end
            local v106 = {
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v107 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["Padding"] = UDim.new(0, 5),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
                }) }
            local v108 = #v107
            for v109, v110 in v103 do
                v107[v108 + v109] = v110
            end
            v80 = u8.createElement(u6, v106, v107)
        end
        if v80 then
            v75[v79 + 1] = v80
        end
        v35.AchievementProgress = u8.createElement(u6, v74, v75)
        v29.AchievementInfo = u8.createElement("Frame", v34, v35)
        return u8.createFragment({
            ["SidebarCenter"] = u8.createElement(u6, v25, v29)
        })
    end)
}