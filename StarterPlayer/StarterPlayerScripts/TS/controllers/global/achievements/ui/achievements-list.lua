local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DropdownComponent
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-category").AchievementCategory
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-meta").AchievementsMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent, "achievement-cell").AchievementCell
local u19 = v1.import(script, script.Parent, "achievement-row").AchievementRow
local v164 = v9.new(u8)(function(u20, p21) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
        [3] = u14
        [4] = u15
        [5] = u12
        [6] = u8
        [7] = u5
        [8] = u4
        [9] = u11
        [10] = u6
        [11] = u16
        [12] = u17
        [13] = u18
        [14] = u3
        [15] = u19
    --]]
    local v22 = p21.useState
    local u23, u24 = v22(u20.ViewingOnProfile and "complete" or "all")
    local u25 = u20.ProfileData
    local u26 = {
        u13.BEDWARS_NO_ARMOR,
        u13.BEDWARS_TO4_NO_ARMOR,
        u13.BEDWARS_TO2_NO_ARMOR,
        u13.BEDWARS_TO1_NO_ARMOR,
        u13.BEDWARS_5V5_NO_ARMOR,
        u13.BEDWARS_DUELS_NO_ARMOR,
        u13.BEDWARS_LB_NO_ARMOR,
        u13.BEDWARS_NO_SWORD,
        u13.BEDWARS_TO4_NO_SWORD,
        u13.BEDWARS_TO2_NO_SWORD,
        u13.BEDWARS_TO1_NO_SWORD,
        u13.BEDWARS_5V5_NO_SWORD,
        u13.BEDWARS_DUELS_NO_SWORD,
        u13.BEDWARS_LB_NO_SWORD,
        u13.BEDWARS_NO_DEATHS,
        u13.BEDWARS_TO4_NO_DEATHS,
        u13.BEDWARS_TO2_NO_DEATHS,
        u13.BEDWARS_TO1_NO_DEATHS,
        u13.BEDWARS_5V5_NO_DEATHS,
        u13.BEDWARS_DUELS_NO_DEATHS,
        u13.BEDWARS_LB_NO_DEATHS,
        u13.BEDWARS_NO_DAMAGE,
        u13.BEDWARS_TO4_NO_DAMAGE,
        u13.BEDWARS_TO2_NO_DAMAGE,
        u13.BEDWARS_TO1_NO_DAMAGE,
        u13.BEDWARS_5V5_NO_DAMAGE,
        u13.BEDWARS_DUELS_NO_DAMAGE,
        u13.BEDWARS_LB_NO_DAMAGE
    }
    local v27 = u7.entries(u14)
    table.sort(v27, function(p28, p29) --[[ Line: 37 ]]
        return p28[1] < p29[1]
    end)
    local v30 = table.create(#v27)
    local v31 = {
        {
            ["text"] = "All",
            ["value"] = "all"
        },
        {
            ["text"] = "Incomplete",
            ["value"] = "incomplete"
        },
        {
            ["text"] = "Complete",
            ["value"] = "complete"
        }
    }
    for v32, v33 in v27 do
        local _ = v32 - 1
        v30[v32] = v33[2].title
    end
    local u34, u35 = v22(v30)
    local v36 = 0
    local v37 = {}
    for v38, v39 in v27 do
        local _ = v38 - 1
        local v40
        if u25 == nil then
            v40 = u25
        else
            v40 = u25.achievements[v39[1]]
            if v40 ~= nil then
                v40 = v40.achieved
            end
        end
        if v40 then
            v40 = not v39[2].disabled
        end
        if v40 == true then
            v36 = v36 + 1
            v37[v36] = v39
        end
    end
    local v41 = #v37
    local v42 = 0
    local v43 = {}
    for v44, v45 in v27 do
        local _ = v44 - 1
        if not v45[2].disabled == true then
            v42 = v42 + 1
            v43[v42] = v45
        end
    end
    local u46 = #v43
    local function v54(p47) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u26
            [3] = u34
            [4] = u25
            [5] = u23
        --]]
        local v48 = p47[1]
        local v49 = u15.getMeta(v48)
        if v49.disabled then
            return false
        end
        if table.find(u26, v48) == nil then
            return false
        end
        local v50 = v49.title
        if table.find(u34, v50) == nil then
            return false
        end
        local v51 = u25
        if v51 ~= nil then
            v51 = v51.achievements[v48]
        end
        local v52 = u23 == "incomplete"
        if v52 then
            if v51 == nil then
                v52 = v51
            else
                v52 = v51.achieved
            end
        end
        if v52 then
            return false
        end
        local v53 = u23 == "complete"
        if v53 then
            if v51 ~= nil then
                v51 = v51.achieved
            end
            v53 = not v51
        end
        return not v53
    end
    local v55 = 0
    local v56 = {}
    for v57, v58 in v27 do
        if v54(v58, v57 - 1, v27) == true then
            v55 = v55 + 1
            v56[v55] = v58
        end
    end
    local function v66(p59) --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u26
            [3] = u12
            [4] = u34
            [5] = u25
            [6] = u23
        --]]
        local v60 = p59[1]
        local v61 = u15.getMeta(v60)
        if v61.disabled then
            return false
        end
        if table.find(u26, v60) ~= nil then
            return false
        end
        if v61.category == u12.EVENT then
            return false
        end
        local v62 = v61.title
        if table.find(u34, v62) == nil then
            return false
        end
        local v63 = u25
        if v63 ~= nil then
            v63 = v63.achievements[v60]
        end
        local v64 = u23 == "incomplete"
        if v64 then
            if v63 == nil then
                v64 = v63
            else
                v64 = v63.achieved
            end
        end
        if v64 then
            return false
        end
        local v65 = u23 == "complete"
        if v65 then
            if v63 ~= nil then
                v63 = v63.achieved
            end
            v65 = not v63
        end
        return not v65
    end
    local v67 = 0
    local v68 = {}
    for v69, v70 in v27 do
        if v66(v70, v69 - 1, v27) == true then
            v67 = v67 + 1
            v68[v67] = v70
        end
    end
    local function v78(p71) --[[ Line: 204 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u26
            [3] = u12
            [4] = u34
            [5] = u25
            [6] = u23
        --]]
        local v72 = p71[1]
        local v73 = u15.getMeta(v72)
        if v73.disabled then
            return false
        end
        if table.find(u26, v72) ~= nil then
            return false
        end
        if v73.category ~= u12.EVENT then
            return false
        end
        local v74 = v73.title
        if table.find(u34, v74) == nil then
            return false
        end
        local v75 = u25
        if v75 ~= nil then
            v75 = v75.achievements[v72]
        end
        local v76 = u23 == "incomplete"
        if v76 then
            if v75 == nil then
                v76 = v75
            else
                v76 = v75.achieved
            end
        end
        if v76 then
            return false
        end
        local v77 = u23 == "complete"
        if v77 then
            if v75 ~= nil then
                v75 = v75.achieved
            end
            v77 = not v75
        end
        return not v77
    end
    local v79 = 0
    local v80 = {}
    for v81, v82 in v27 do
        if v78(v82, v81 - 1, v27) == true then
            v79 = v79 + 1
            v80[v79] = v82
        end
    end
    local v83 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v84 = u20.FrameProps
    if v84 then
        for v85, v86 in v84 do
            v83[v85] = v86
        end
    end
    local v87 = not u20.ViewingOnProfile
    if v87 then
        local v88 = {
            ["LayoutOrder"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.1)
        }
        local v89 = { u8.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new((1 / 0), 35)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 10),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v90 = #v89
        local v92 = {
            ["DefaultItem"] = v31[1],
            ["Items"] = v31,
            ["OnItemSelected"] = function(p91) --[[ Name: OnItemSelected, Line 293 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24(p91)
            end,
            ["Size"] = UDim2.fromScale(0.3, 1) - UDim2.fromOffset(10, 0),
            ["LayoutOrder"] = 0,
            ["BorderSizePixel"] = 0
        }
        v89[v90 + 1] = u8.createElement(u5, v92)
        local v93 = {
            ["BarTransparency"] = 0.5,
            ["Size"] = UDim2.fromScale(0.6, 1),
            ["BarColor"] = u4.BLACK,
            ["CornerRadius"] = UDim.new(0, 5)
        }
        local v94 = table.create(#v27)
        for v95, v96 in v27 do
            local _ = v95 - 1
            v94[v95] = {
                ["key"] = v96[2].title
            }
        end
        v93.Items = v94
        v93.InputText = ""
        function v93.OnTextChange(_, p97) --[[ Line: 322 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            u35(p97)
        end
        v93.PlaceHolderText = "Search Achievements"
        v89[v90 + 2] = u8.createElement(u11, v93)
        local v98 = {
            ["Size"] = UDim2.fromScale(0.1, 1) - UDim2.fromOffset(10, 0),
            ["LayoutOrder"] = 2
        }
        v89.AchievementsCompletedCount = u8.createElement(u6, v98, { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 5),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u8.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.3, 0, 0.7, 0),
                ["Image"] = u16.CIRCLE_CHECK_SOLID,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ImageColor3"] = u17.textPrimary
            }, { u8.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }), u8.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.7, 1),
                ["Text"] = tostring(v41) .. "/" .. tostring(u46),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u17.textPrimary,
                ["TextXAlignment"] = Enum.TextXAlignment.Right
            }) })
        v87 = u8.createFragment({
            ["AchievementFilters"] = u8.createElement("Frame", v88, v89)
        })
    end
    local v99 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }) }
    local v100 = #v99
    if v87 then
        v99[v100 + 1] = v87
    end
    local v101 = #v99
    local v102 = u20.ViewingOnProfile
    if v102 then
        local v103
        if u25 then
            local function v111(p104) --[[ Line: 385 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u34
                    [3] = u25
                    [4] = u23
                    [5] = u8
                    [6] = u18
                    [7] = u20
                --]]
                local u105 = p104[1]
                local v106 = u15.getMeta(u105)
                if v106.disabled then
                    return nil
                else
                    local v107 = v106.title
                    if table.find(u34, v107) == nil then
                        return nil
                    else
                        u15.getTierGroup(u105)
                        local v108 = u25.achievements[u105]
                        local v109 = u23 == "incomplete"
                        if v109 then
                            if v108 == nil then
                                v109 = v108
                            else
                                v109 = v108.achieved
                            end
                        end
                        if v109 then
                            return nil
                        else
                            local v110 = u23 == "complete"
                            if v110 then
                                if v108 ~= nil then
                                    v108 = v108.achieved
                                end
                                v110 = not v108
                            end
                            if v110 then
                                return nil
                            else
                                return u8.createElement(u18, {
                                    ["Id"] = u105,
                                    ["ProfileData"] = u25,
                                    ["OnSelect"] = function() --[[ Name: OnSelect, Line 423 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u20
                                            [2] = u105
                                        --]]
                                        return u20.OnSelect(u105)
                                    end,
                                    ["Selected"] = u20.Selected == u105,
                                    ["ViewingOnProfile"] = u20.ViewingOnProfile
                                })
                            end
                        end
                    end
                end
            end
            local v112 = 0
            v103 = {}
            for v113, v114 in v27 do
                local v115 = v111(v114, v113 - 1, v27)
                if v115 ~= nil then
                    v112 = v112 + 1
                    v103[v112] = v115
                end
            end
        else
            v103 = u25
        end
        local v116 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.9)
            }
        }
        local v117 = { u8.createElement("UIGridLayout", {
                ["CellSize"] = UDim2.new(u20.ViewingOnProfile and 0.24 or 0.32, 0, 0, 200),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["FillDirectionMaxCells"] = u20.ViewingOnProfile and 4 or 3
            }), u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 2),
                ["PaddingBottom"] = UDim.new(0, 2),
                ["PaddingLeft"] = UDim.new(0, 1),
                ["PaddingRight"] = UDim.new(0, 1)
            }) }
        local v118 = #v117
        if v103 then
            for v119, v120 in v103 do
                v117[v118 + v119] = v120
            end
        end
        v102 = u8.createFragment({
            ["AchievementsGridView"] = u8.createElement(u3, v116, v117)
        })
    end
    if v102 then
        v99[v101 + 1] = v102
    end
    local v121 = #v99
    local v122 = not u20.ViewingOnProfile
    if v122 then
        local v123 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.9)
            }
        }
        local v124 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0, 5),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u8.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 1),
                ["PaddingRight"] = UDim.new(0, 8),
                ["PaddingTop"] = UDim.new(0, 1),
                ["PaddingBottom"] = UDim.new(0, 1)
            }) }
        local v125 = #v124
        local v126
        if #v68 + #v56 > 0 then
            v126 = u8.createElement("TextLabel", {
                ["Text"] = "Challenges",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 45),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) })
        else
            v126 = false
        end
        if v126 then
            v124[v125 + 1] = v126
        end
        local v127 = #v124
        local v128
        if u25 then
            local function v132(p129, p130) --[[ Line: 522 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u19
                    [3] = u25
                    [4] = u20
                --]]
                local u131 = p129[1]
                return u8.createElement(u19, {
                    ["Id"] = u131,
                    ["ProfileData"] = u25,
                    ["OnSelect"] = function() --[[ Name: OnSelect, Line 527 ]]
                        --[[
                        Upvalues:
                            [1] = u20
                            [2] = u131
                        --]]
                        return u20.OnSelect(u131)
                    end,
                    ["Selected"] = u20.Selected == u131,
                    ["ViewingOnProfile"] = u20.ViewingOnProfile,
                    ["LayoutOrder"] = p130 + 1
                })
            end
            local v133 = 0
            v128 = {}
            for v134, v135 in v68 do
                local v136 = v132(v135, v134 - 1, v68)
                if v136 ~= nil then
                    v133 = v133 + 1
                    v128[v133] = v136
                end
            end
        else
            v128 = u25
        end
        if v128 then
            for v137, v138 in v128 do
                v124[v127 + v137] = v138
            end
        end
        local v139 = #v124
        local v140
        if u25 then
            local function v144(p141, p142) --[[ Line: 556 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u19
                    [3] = u25
                    [4] = u20
                    [5] = u46
                --]]
                local u143 = p141[1]
                return u8.createElement(u19, {
                    ["Id"] = u143,
                    ["ProfileData"] = u25,
                    ["OnSelect"] = function() --[[ Name: OnSelect, Line 561 ]]
                        --[[
                        Upvalues:
                            [1] = u20
                            [2] = u143
                        --]]
                        return u20.OnSelect(u143)
                    end,
                    ["Selected"] = u20.Selected == u143,
                    ["ViewingOnProfile"] = u20.ViewingOnProfile,
                    ["LayoutOrder"] = u46 + p142 + 10
                })
            end
            local v145 = 0
            v140 = {}
            for v146, v147 in v56 do
                local v148 = v144(v147, v146 - 1, v56)
                if v148 ~= nil then
                    v145 = v145 + 1
                    v140[v145] = v148
                end
            end
        else
            v140 = u25
        end
        if v140 then
            for v149, v150 in v140 do
                v124[v139 + v149] = v150
            end
        end
        local v151 = #v124
        local v152
        if #v80 > 0 then
            v152 = u8.createElement("TextLabel", {
                ["Text"] = "Event",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 45),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["LayoutOrder"] = u46 * 2 + 10
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) })
        else
            v152 = false
        end
        if v152 then
            v124[v151 + 1] = v152
        end
        local v153 = #v124
        if u25 then
            local function v157(p154, p155) --[[ Line: 609 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u19
                    [3] = u25
                    [4] = u20
                    [5] = u46
                --]]
                local u156 = p154[1]
                return u8.createElement(u19, {
                    ["Id"] = u156,
                    ["ProfileData"] = u25,
                    ["OnSelect"] = function() --[[ Name: OnSelect, Line 614 ]]
                        --[[
                        Upvalues:
                            [1] = u20
                            [2] = u156
                        --]]
                        return u20.OnSelect(u156)
                    end,
                    ["Selected"] = u20.Selected == u156,
                    ["ViewingOnProfile"] = u20.ViewingOnProfile,
                    ["LayoutOrder"] = u46 * 2 + p155 + 10
                })
            end
            local v158 = 0
            u25 = {}
            for v159, v160 in v80 do
                local v161 = v157(v160, v159 - 1, v80)
                if v161 ~= nil then
                    v158 = v158 + 1
                    u25[v158] = v161
                end
            end
        end
        if u25 then
            for v162, v163 in u25 do
                v124[v153 + v162] = v163
            end
        end
        v122 = u8.createFragment({
            ["AchievementsListView"] = u8.createElement(u3, v123, v124)
        })
    end
    if v122 then
        v99[v121 + 1] = v122
    end
    return u8.createElement(u6, v83, v99)
end)
return {
    ["AchievementsList"] = v10.connect(function(p165, p166) --[[ Line: 650 ]]
        local v167 = {}
        for v168, v169 in p166 do
            v167[v168] = v169
        end
        v167.store = p165
        return v167
    end)(v164)
}