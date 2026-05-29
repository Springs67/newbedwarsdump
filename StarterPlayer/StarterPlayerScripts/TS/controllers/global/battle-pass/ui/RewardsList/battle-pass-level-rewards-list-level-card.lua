local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.CornerFiller
local v5 = v2.GetTarmacAsset
local u6 = v2.ImageId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent, "battle-pass-rewards-list-reward").BattlePassRewardsListReward
v5("CrownIcon")
local v15 = u8.Component:extend("BattlePassLevelRewardsListLevelCard")
function v15.init(_) --[[ Line: 20 ]] end
function v15.shouldUpdate(p16, p17, _) --[[ Line: 22 ]]
    if p16.props.BattlePass.experience ~= p17.BattlePass.experience and (p16.props.Level >= p16.props.BattlePass.level and p16.props.Level <= p17.BattlePass.level) then
        return true
    end
    if p16.props.Active == p17.Active then
        return false
    end
    local v18 = p16.props.LevelRewards
    local v19 = p17.Active
    local v20 = table.find(v18, v19) ~= nil
    local v21 = p16.props.LevelRewards
    local v22 = p16.props.Active
    return v20 or table.find(v21, v22) ~= nil
end
function v15.render(u23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u9
        [4] = u13
        [5] = u8
        [6] = u3
        [7] = u4
        [8] = u10
        [9] = u6
        [10] = u7
        [11] = u14
    --]]
    local v24 = u23.props.BattlePass.level == u23.props.Level
    local u25 = u23.props.BattlePass.level < u23.props.Level
    local v26 = 0
    local v27 = {}
    for v28, v29 in u23.props.LevelRewards do
        local _ = v28 - 1
        if not v29.paid == true then
            v26 = v26 + 1
            v27[v26] = v29
        end
    end
    local v30 = 0
    local v31 = {}
    for v32, v33 in u23.props.LevelRewards do
        local _ = v32 - 1
        if v33.paid == true then
            v30 = v30 + 1
            v31[v30] = v33
        end
    end
    local v34 = not u25
    local v35 = v34 and #v27 or v34
    local v36 = not u25
    if v36 then
        local v37 = u23.props.BattlePass.paid
        v36 = v37 and #v31 or v37
    end
    local v38 = u23.props.Level > 50
    local v66 = (function() --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u12
            [3] = u11
            [4] = u9
            [5] = u13
        --]]
        local u39 = false
        local u40 = false
        local u41 = false
        local u42 = false
        local u43 = false
        local u44 = false
        local v45 = u23.props.LevelRewards
        local function v57(p46) --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u39
                [3] = u40
                [4] = u41
                [5] = u42
                [6] = u11
                [7] = u43
                [8] = u44
            --]]
            local v47 = p46.kit ~= nil
            if not v47 then
                local v48 = p46.comingSoon
                if v48 ~= nil then
                    v48 = v48.rewardDisplayType
                end
                v47 = v48 == u12.KIT
            end
            if v47 then
                u39 = true
                return
            else
                local v49 = p46.kitSkin ~= nil
                if not v49 then
                    local v50 = p46.comingSoon
                    if v50 ~= nil then
                        v50 = v50.rewardDisplayType
                    end
                    v49 = v50 == u12.KIT_SKIN
                end
                if v49 then
                    u40 = true
                    return
                else
                    local v51 = p46.killEffect ~= nil
                    if not v51 then
                        local v52 = p46.comingSoon
                        if v52 ~= nil then
                            v52 = v52.rewardDisplayType
                        end
                        v51 = v52 == u12.KILL_EFFECT
                    end
                    if v51 then
                        u41 = true
                        return
                    else
                        local v53 = p46.lobbyGadget ~= nil
                        if not v53 then
                            local v54 = p46.comingSoon
                            if v54 ~= nil then
                                v54 = v54.rewardDisplayType
                            end
                            v53 = v54 == u12.LOBBY_GADGET
                        end
                        if v53 then
                            u42 = true
                        else
                            local v55 = p46.emote ~= nil
                            if not v55 then
                                local v56 = p46.comingSoon
                                if v56 ~= nil then
                                    v56 = v56.rewardDisplayType
                                end
                                v55 = v56 == u12.EMOTE
                            end
                            if v55 then
                                if p46.emote then
                                    if not u11[p46.emote].animation then
                                        return nil
                                    end
                                    u43 = true
                                    return
                                end
                            elseif p46.crate ~= nil then
                                u44 = true
                            end
                        end
                    end
                end
            end
        end
        local v58 = u44
        local v59 = u43
        local v60 = u42
        local v61 = u41
        local v62 = u40
        local v63 = u39
        for v64, v65 in v45 do
            v57(v65, v64 - 1, v45)
        end
        if v63 then
            return u9.kit.backgroundColor
        elseif v62 then
            return u9.kitSkin.backgroundColor
        elseif v61 then
            return u9.killEffect.backgroundColor
        elseif v60 then
            return u9.lobbyGadget.backgroundColor
        elseif v59 then
            return u9.emote.backgroundColor
        elseif v58 then
            return u9.crate.backgroundColor
        else
            return u13.backgroundTertiary
        end
    end)()
    local function v67() --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        if u23.props.Level == 51 then
            return ColorSequence.new(Color3.fromRGB(255, 210, 0), Color3.fromRGB(247, 151, 30))
        end
        if u23.props.Level == 52 then
            return ColorSequence.new(Color3.fromRGB(255, 210, 0), Color3.fromRGB(247, 151, 30))
        end
        if u23.props.Level == 53 then
            return ColorSequence.new(Color3.fromRGB(255, 210, 0), Color3.fromRGB(247, 151, 30))
        end
        if u23.props.Level == 54 then
            return ColorSequence.new(Color3.fromRGB(255, 210, 0), Color3.fromRGB(247, 151, 30))
        end
        if u23.props.Level == 55 then
            return ColorSequence.new(Color3.fromRGB(0, 158, 189), Color3.fromRGB(255, 153, 255))
        end
    end
    local v68 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0,
        ["Size"] = UDim2.new(u23.props.Size.X.Scale, u23.props.Size.X.Offset, u23.props.Size.Y.Scale, u23.props.Size.Y.Scale),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["BackgroundColor3"] = u13.backgroundSecondary,
        ["LayoutOrder"] = u23.props.LayoutOrder
    }
    local v69 = {}
    local v70 = #v69
    local v71
    if v24 then
        v71 = u8.createElement("UIStroke", {
            ["Thickness"] = 1,
            ["Color"] = u3.WHITE
        })
    else
        v71 = v24
    end
    if v71 then
        v69[v70 + 1] = v71
    end
    local v72 = #v69
    v69[v72 + 1] = u8.createElement("UISizeConstraint", {
        ["MinSize"] = Vector2.new(90, 0)
    })
    v69[v72 + 2] = u8.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Vertical,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 4)
    })
    local v73 = {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.1),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["BackgroundColor3"] = v66
    }
    local v74 = { u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }), u8.createElement(u4, {
            ["BottomRight"] = true,
            ["BottomLeft"] = true
        }) }
    local v75 = #v74
    local v76 = not u25
    if v76 then
        local v77 = u8.createFragment
        local v78 = {}
        local v79 = u8.createFragment
        local v80 = {}
        local v81 = u8.createElement
        local v82 = "Frame"
        local v83 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 100,
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0, 1)
        }
        local v84 = UDim2.new
        local v85
        if v24 then
            local v86 = u10.getCurrExperienceProgression(u23.props.BattlePass.experience, u23.props.BattlePass.level) / u10.getExperienceForLevel(u23.props.BattlePass.level + 1)
            v85 = math.min(v86, 1)
        else
            v85 = 1
        end
        v83.Size = v84(v85, 0, 0, 3)
        v83.BackgroundColor3 = u13.backgroundSuccess
        v80.BottomBorderProgress = v81(v82, v83, { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center
            }) })
        v78.BottomBorderProgress = v79(v80)
        v78.BottomBorderBG = u8.createFragment({
            ["BottomBorderBG"] = u8.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0.6,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 99,
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0, 1),
                ["Size"] = UDim2.new(1, 0, 0, 3),
                ["BackgroundColor3"] = u3.WHITE
            }, { u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                }) })
        })
        v76 = v77(v78)
    end
    if v76 then
        v74[v75 + 1] = v76
    end
    local v87 = #v74
    local v88
    if v38 then
        v88 = u8.createFragment({
            ["BattlePassIcon"] = u8.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Rotation"] = -25,
                ["Position"] = UDim2.fromOffset(-10, -12),
                ["Size"] = UDim2.fromOffset(28, 22.8),
                ["Image"] = u10.BATTLE_PASS_SEASON_ICON,
                ["ScaleType"] = Enum.ScaleType.Fit
            })
        })
    else
        v88 = v38
    end
    if v88 then
        v74[v87 + 1] = v88
    end
    local _ = #v74
    local v89 = u8.createElement
    local v90 = "TextLabel"
    local v91 = {
        ["BackgroundTransparency"] = 1,
        ["TextSize"] = 16,
        ["Size"] = UDim2.fromScale(0, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["TextTransparency"] = v38 and 0 or (u25 and 0.3 or 0)
    }
    local v92 = u23.props.Level
    v91.Text = (v38 and "EPILOGUE: " or "") .. tostring(v92)
    v91.TextXAlignment = Enum.TextXAlignment.Center
    v91.TextYAlignment = Enum.TextYAlignment.Center
    local v93
    if v38 then
        v93 = Color3.fromRGB(43, 43, 0)
    else
        v93 = u3.WHITE
    end
    v91.TextColor3 = v93
    v91.FontFace = Font.new(v38 and "RobotoMono" or "Roboto", Enum.FontWeight.Bold)
    v74.LevelText = v89(v90, v91)
    v69.LevelColumnHeader = u8.createElement("Frame", v73, v74)
    local v94 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.4),
        ["AutomaticSize"] = Enum.AutomaticSize.X
    }
    local v95
    if v38 then
        v95 = Color3.fromRGB(255, 255, 255)
    else
        v95 = u3.darken(u13.backgroundPrimary, 0.9)
    end
    v94.BackgroundColor3 = v95
    local v96 = {}
    local v97 = #v96
    local v98
    if v38 then
        v98 = u8.createElement("UIGradient", {
            ["Rotation"] = 245,
            ["Color"] = v67()
        })
    else
        v98 = v38
    end
    if v98 then
        v96[v97 + 1] = v98
    end
    local v99 = #v96
    v96[v99 + 1] = u8.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 5)
    })
    v96[v99 + 2] = u8.createElement("UIPadding", {
        ["PaddingLeft"] = UDim.new(0, 16),
        ["PaddingRight"] = UDim.new(0, 16)
    })
    local v100 = v99 + 3
    local v101 = u8.createElement
    local v102 = "ImageLabel"
    local v103 = {
        ["BackgroundTransparency"] = 1,
        ["ScaleType"] = "Fit",
        ["ZIndex"] = 200,
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.new(1, 0, 0, 8),
        ["Size"] = UDim2.fromOffset(16, 16)
    }
    local v104
    if u25 then
        v104 = u6.LOCK_SOLID
    elseif v35 == 0 or (v35 ~= v35 or not v35) then
        v104 = nil
    else
        v104 = u6.CHECK_CIRCLE_SOLID
    end
    v103.Image = v104
    v103.ImageTransparency = (v35 == 0 or (v35 ~= v35 or not v35)) and 0.4 or 0
    v96[v100] = v101(v102, v103)
    local function v110(p105, p106) --[[ Line: 338 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
            [3] = u8
            [4] = u14
            [5] = u23
            [6] = u25
        --]]
        local v107 = nil
        for v108, v109 in u7.values(u12) do
            local _ = v108 - 1
            if p105[v109] ~= nil == true then
                v107 = v109
                break
            end
        end
        return u8.createElement(u14, {
            ["Reward"] = p105,
            ["SetReward"] = u23.props.SetReward,
            ["RewardDisplayType"] = v107,
            ["SetActive"] = u23.props.SetActive,
            ["Active"] = u23.props.Active,
            ["LayoutOrder"] = p106,
            ["Locked"] = u25,
            ["GamepadShouldAutoSelect"] = u23.props.Level == p105.level
        })
    end
    local v111 = table.create(#v27)
    for v112, v113 in v27 do
        v111[v112] = v110(v113, v112 - 1, v27)
    end
    local v114 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v115 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }) }
    local v116 = #v115
    for v117, v118 in v111 do
        v115[v116 + v117] = v118
    end
    v96[v99 + 4] = u8.createElement("Frame", v114, v115)
    v69.FreePassRewards = u8.createElement("Frame", v94, v96)
    local v119 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0,
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.new(1, 0, 0.5, -8),
        ["AutomaticSize"] = Enum.AutomaticSize.X
    }
    local v120
    if v38 then
        v120 = Color3.fromRGB(255, 255, 255)
    else
        v120 = u13.backgroundPrimary
    end
    v119.BackgroundColor3 = v120
    local v121 = {}
    local v122 = #v121
    if v38 then
        v38 = u8.createElement("UIGradient", {
            ["Rotation"] = 245,
            ["Color"] = v67()
        })
    end
    if v38 then
        v121[v122 + 1] = v38
    end
    local v123 = #v121
    v121[v123 + 1] = u8.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 5)
    })
    v121[v123 + 2] = u8.createElement("UIPadding", {
        ["PaddingLeft"] = UDim.new(0, 16),
        ["PaddingRight"] = UDim.new(0, 16)
    })
    local v124 = v123 + 3
    local v125 = u8.createElement
    local v126 = "ImageLabel"
    local v127 = {
        ["BackgroundTransparency"] = 1,
        ["ScaleType"] = "Fit",
        ["ZIndex"] = 200,
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.new(1, 0, 0, 8),
        ["Size"] = UDim2.fromOffset(16, 16)
    }
    local v128
    if u25 or not u23.props.BattlePass.paid then
        v128 = u6.LOCK_SOLID
    elseif v36 == 0 or (v36 ~= v36 or not v36) then
        v128 = nil
    else
        v128 = u6.CHECK_CIRCLE_SOLID
    end
    v127.Image = v128
    v127.ImageTransparency = (v36 == 0 or (v36 ~= v36 or not v36)) and 0.4 or 0
    v121[v124] = v125(v126, v127)
    local function v134(p129, p130) --[[ Line: 424 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
            [3] = u8
            [4] = u14
            [5] = u23
            [6] = u25
        --]]
        local v131 = nil
        for v132, v133 in u7.values(u12) do
            local _ = v132 - 1
            if p129[v133] ~= nil == true then
                v131 = v133
                break
            end
        end
        return u8.createElement(u14, {
            ["Reward"] = p129,
            ["SetReward"] = u23.props.SetReward,
            ["RewardDisplayType"] = v131,
            ["SetActive"] = u23.props.SetActive,
            ["Active"] = u23.props.Active,
            ["LayoutOrder"] = p130,
            ["Locked"] = u25 or not u23.props.BattlePass.paid,
            ["GamepadShouldAutoSelect"] = u23.props.Level == p129.level
        })
    end
    local v135 = table.create(#v31)
    for v136, v137 in v31 do
        v135[v136] = v134(v137, v136 - 1, v31)
    end
    local v138 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v139 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }) }
    local v140 = #v139
    for v141, v142 in v135 do
        v139[v140 + v141] = v142
    end
    v121[v123 + 4] = u8.createElement("Frame", v138, v139)
    v69.BattlePassRewards = u8.createElement("Frame", v119, v121)
    return u8.createFragment({
        ["LevelRewardsCardContainer"] = u8.createElement("Frame", v68, v69)
    })
end
return {
    ["BattlePassLevelRewardsListLevelCard"] = v15
}