local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.DividerComponent
local u6 = v2.Empty
local u7 = v2.StringUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta")
local u11 = v10.ClanUpgradeMeta
local u12 = v10.ClanUpgradeTypeMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanProfileUpgradeDetails"] = v9.new(u8)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u12
            [3] = u8
            [4] = u13
            [5] = u4
            [6] = u5
            [7] = u6
            [8] = u3
            [9] = u7
        --]]
        local _ = p15.useState
        local u16
        if u14.SelectedUpgrade then
            u16 = u11[u14.SelectedUpgrade]
        else
            u16 = nil
        end
        local u17
        if u16 then
            local v18 = u12
            local v19
            if u16 == nil then
                v19 = u16
            else
                v19 = u16.type
            end
            u17 = v18[v19]
        else
            u17 = nil
        end
        local v20
        if u17 == nil then
            v20 = u17
        else
            v20 = u17.disabled
        end
        if not v20 then
            if u17 == nil then
                v20 = u17
            else
                v20 = u17.tempDisabled
            end
        end
        local v21 = u14.NoUpgradePermission
        local v22 = false
        local v23 = false
        if u16 then
            local v24 = u14.Clan.upgrades
            local v25
            if u16 == nil then
                v25 = u16
            else
                v25 = u16.type
            end
            local v26 = v24[v25]
            v22 = v26 and u11[v26].level >= u16.level and true or v22
        end
        local v27
        if u16 == nil then
            v27 = u16
        else
            v27 = u16.currency
        end
        local v28
        if v27 == "ClanWarCoin" then
            local v29 = u14.Clan.clanWarCoins
            v28 = v29 == nil and 0 or v29
        else
            v28 = u14.Clan.coins
        end
        local u30 = u16 and v28 < u16.cost and true or v23
        if u16 then
            local v31 = u16.prerequisites
            if v31 ~= nil then
                v31 = true
                for v32, v33 in v31 do
                    local _ = v32 - 1
                    local v34 = u11[v33]
                    local v35 = u14.Clan.upgrades[v34.type]
                    local v36
                    if v35 then
                        v36 = u11[v35].level >= v34.level
                    else
                        v36 = false
                    end
                    if not v36 then
                        v31 = false
                        break
                    end
                end
            end
            if u16.prerequisites and not v31 then
                u30 = true
            end
        end
        local function v48(p37) --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u16
                [3] = u8
                [4] = u13
                [5] = u4
                [6] = u5
            --]]
            if not (u17 and u16) then
                return u8.createFragment()
            end
            local v38 = u8.createFragment
            local v39 = {}
            local v40 = u8.createElement
            local v41 = {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = p37.Size,
                ["BackgroundColor3"] = u13.backgroundPrimary
            }
            local v42 = { u8.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.06, 0),
                    ["PaddingRight"] = UDim.new(0.06, 0)
                }), (u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.05, 0)
                })) }
            local v43 = u8.createElement
            local v44 = {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 24)
            }
            local v45 = u17.name
            local v46 = u4.richTextColor(u13.mcYellow)
            local v47 = u16.level
            v44.Text = "<b>" .. v45 .. " <font color=\"" .. v46 .. "\">Lv." .. tostring(v47) .. "</font></b>"
            v44.TextColor3 = u4.WHITE
            v42.UpgradeName = v43("TextLabel", v44, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) })
            __set_list(v42, 3, {(u8.createElement(u5, {
    ["LayoutOrder"] = 2,
    ["LengthScale"] = 0.85,
    ["Margin"] = 0
}))})
            v42.UpgradeDescription = u8.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(1, 0, 0, 32),
                ["Text"] = "<b>" .. u16.description .. "</b>",
                ["TextColor3"] = u4.WHITE
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) })
            v39.Header = v40("Frame", v41, v42)
            return v38(v39)
        end
        local function v66(p49) --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u16
                [3] = u8
                [4] = u4
                [5] = u5
                [6] = u6
            --]]
            if not (u17 and u16) then
                return u8.createFragment()
            end
            local v50 = {
                ["LayoutOrder"] = 2,
                ["Size"] = p49.Size
            }
            local v51 = {
                u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Top",
                    ["HorizontalAlignment"] = "Left",
                    ["SortOrder"] = "LayoutOrder"
                }),
                ["RewardTitle"] = u8.createElement("TextLabel", {
                    ["AutomaticSize"] = "XY",
                    ["SizeConstraint"] = "RelativeXY",
                    ["Text"] = "<b>Rewards</b>",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0, 0),
                    ["TextColor3"] = u4.WHITE
                }, { u8.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) }),
                u8.createElement(u5, {
                    ["LayoutOrder"] = 2,
                    ["Margin"] = 0
                })
            }
            local v52 = #v51
            local v53 = u16.rewards
            local function v57(p54) --[[ Line: 203 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u4
                --]]
                local v55 = u8.createFragment
                local v56 = {
                    ["Reward"] = u8.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Left",
                        ["TextTransparency"] = 0.2,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0, 16),
                        ["Text"] = "<b>\226\128\162 " .. p54 .. "</b>",
                        ["TextColor3"] = u4.WHITE
                    }, { u8.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 16
                        }) })
                }
                return v55(v56)
            end
            local v58 = table.create(#v53)
            for v59, v60 in v53 do
                v58[v59] = v57(v60, v59 - 1, v53)
            end
            local v61 = {
                ["LayoutOrder"] = 3,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.7, 0)
            }
            local v62 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Top",
                    ["Padding"] = UDim.new(0.05, 0)
                }) }
            local v63 = #v62
            for v64, v65 in v58 do
                v62[v63 + v64] = v65
            end
            v51[v52 + 1] = u8.createElement(u6, v61, v62)
            return u8.createFragment({
                ["Rewards"] = u8.createElement(u6, v50, v51)
            })
        end
        local function v98(p67) --[[ Line: 249 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u16
                [3] = u8
                [4] = u4
                [5] = u5
                [6] = u11
                [7] = u12
                [8] = u14
                [9] = u13
                [10] = u6
            --]]
            if not (u17 and u16) then
                return u8.createFragment()
            end
            local v68 = {
                ["LayoutOrder"] = 3,
                ["Size"] = p67.Size
            }
            local v69 = {
                u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Top",
                    ["HorizontalAlignment"] = "Left",
                    ["SortOrder"] = "LayoutOrder"
                }),
                ["PreReqTitle"] = u8.createElement("TextLabel", {
                    ["AutomaticSize"] = "XY",
                    ["SizeConstraint"] = "RelativeXY",
                    ["Text"] = "<b>Prerequisites</b>",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0, 0),
                    ["TextColor3"] = u4.WHITE
                }, { u8.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) }),
                u8.createElement(u5, {
                    ["LayoutOrder"] = 2,
                    ["Margin"] = 0
                })
            }
            local v70 = #v69
            local v71 = u16.prerequisites
            local v72
            if v71 == nil then
                v72 = v71
            else
                local function v90(p73) --[[ Line: 289 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u12
                        [3] = u14
                        [4] = u8
                        [5] = u4
                        [6] = u13
                    --]]
                    local v74 = u11[p73]
                    local v75 = u12[v74.type]
                    local v76 = u14.Clan.upgrades[v74.type]
                    local v77
                    if v76 then
                        v77 = u11[v76].level >= v74.level
                    else
                        v77 = false
                    end
                    local v78 = u8.createFragment
                    local v79 = {}
                    local v80 = u8.createElement
                    local v81 = "TextLabel"
                    local v82 = {
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Left",
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0, 16)
                    }
                    local v83 = "<b>\226\128\162 "
                    local v84 = v75.name
                    local v85 = " Lv."
                    local v86 = v74.level
                    local v87 = tostring(v86)
                    local v88 = "</b>"
                    local v89
                    if v77 then
                        v89 = "<font color=\"" .. u4.richTextColor(u13.mcGreen) .. "\">  (Completed)</font>"
                    else
                        v89 = "<font color=\"" .. u4.richTextColor(u13.mcRed) .. "\">  (Not Completed)</font>"
                    end
                    v82.Text = v83 .. v84 .. v85 .. v87 .. v88 .. v89
                    v82.TextColor3 = u4.WHITE
                    v82.TextTransparency = v77 and 0 or 0.2
                    v79.PreReqEntry = v80(v81, v82, { u8.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 16
                        }) })
                    return v78(v79)
                end
                v72 = table.create(#v71)
                for v91, v92 in v71 do
                    v72[v91] = v90(v92, v91 - 1, v71)
                end
            end
            local v93 = {
                ["LayoutOrder"] = 3,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.7, 0)
            }
            local v94 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Top",
                    ["Padding"] = UDim.new(0.05, 0)
                }) }
            local v95 = #v94
            if v72 then
                for v96, v97 in v72 do
                    v94[v95 + v96] = v97
                end
            end
            v69[v70 + 1] = u8.createElement(u6, v93, v94)
            return u8.createFragment({
                ["PreReqs"] = u8.createElement(u6, v68, v69)
            })
        end
        local v99
        if u16 and u17 then
            local v100 = { u8.createElement(v48, {
                    ["Size"] = UDim2.fromScale(1, 0.3)
                }) }
            local _ = #v100
            local v101 = {
                ["LayoutOrder"] = 2,
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.fromScale(0, 0.3),
                ["Size"] = UDim2.fromScale(1, 0.7)
            }
            local v102 = { u8.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.05, 0),
                    ["PaddingBottom"] = UDim.new(0.05, 0),
                    ["PaddingLeft"] = UDim.new(0.06, 0),
                    ["PaddingRight"] = UDim.new(0.06, 0)
                }), u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.05, 0)
                }) }
            local v103 = #v102
            local v104 = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.8)
            }
            local v105 = {}
            local v106 = u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            })
            local v107 = u16.rewards
            if v107 then
                v107 = u8.createElement(v66, {
                    ["Size"] = UDim2.fromScale(1, 0.45)
                })
            end
            __set_list(v105, 1, {v106, v107})
            local v108 = #v105
            local v109 = u16.prerequisites
            if v109 then
                v109 = u8.createElement(v98, {
                    ["Size"] = UDim2.fromScale(1, 0.45)
                })
            end
            if v109 then
                v105[v108 + 1] = v109
            end
            v102.Body = u8.createElement(u6, v104, v105)
            local v110 = v103 + 1
            local v111
            if v22 then
                v111 = u8.createElement(u3, {
                    ["Disabled"] = true,
                    ["LayoutOrder"] = 2,
                    ["AnchorPoint"] = Vector2.new(0.5, 1),
                    ["Position"] = UDim2.fromScale(0.5, 1),
                    ["Size"] = UDim2.fromScale(1, 0.15),
                    ["BackgroundColor3"] = u13.backgroundPrimary,
                    ["Text"] = "Purchased" .. (u16.nextUpgrade and "" or " - Max Level Reached"),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 424 ]] end
                })
            else
                local v112 = u8.createElement
                local v113 = u3
                local v114 = {
                    ["LayoutOrder"] = 2,
                    ["AnchorPoint"] = Vector2.new(0.5, 1),
                    ["Position"] = UDim2.fromScale(0.5, 1),
                    ["Size"] = UDim2.fromScale(1, 0.15),
                    ["Text"] = (v20 and "(Temporarily Disabled)" or (v21 and "(Insufficient Permission)" or "")) .. " " .. u7.formatNumberWithCommas(u16.cost) .. " " .. (u16.currency == "ClanCoin" and "coins" or "war crystals")
                }
                local v115
                if u30 then
                    v115 = u13.backgroundError
                else
                    v115 = u13.backgroundSuccess
                end
                v114.BackgroundColor3 = v115
                function v114.OnClick() --[[ Line: 408 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u14
                    --]]
                    if u30 or u14.Loading then
                        return nil
                    end
                    u14.OnUpgrade()
                end
                v114.Disabled = v20 or v21
                v114.Loading = u14.Loading
                v111 = v112(v113, v114)
            end
            v102[v110] = v111
            v100.Content = u8.createFragment({
                ["Content"] = u8.createElement(u6, v101, v102)
            })
            v99 = u8.createFragment(v100)
        else
            v99 = u8.createElement("TextLabel", {
                ["Text"] = "<b><font transparency=\"0.3\" size=\"16\">Select an upgrade from the list on the left</font></b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["TextColor3"] = u4.WHITE
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) })
        end
        local v116 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.6, 0, 1, 0),
            ["BackgroundColor3"] = u13.backgroundTertiary
        }
        local v117 = {
            [#v117 + 1] = v99
        }
        return u8.createFragment({
            ["UpgradeDetails"] = u8.createElement("Frame", v116, v117)
        })
    end)
}