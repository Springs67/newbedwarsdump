local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Empty
local u6 = v3.StringUtil
local u7 = v3.UILayers
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "menu", "menu-component").MenuComponent
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-mission-pool-factory").ClanWarMissionPoolFactory
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u19 = v1.import(script, script.Parent, "clan-member-display").ClanMemberDisplay
return {
    ["ClanProfileMembersRow"] = v11.new(u10)(function(u20, p21) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u9
            [3] = u14
            [4] = u8
            [5] = u2
            [6] = u13
            [7] = u4
            [8] = u18
            [9] = u7
            [10] = u10
            [11] = u19
            [12] = u17
            [13] = u5
            [14] = u6
            [15] = u16
            [16] = u12
        --]]
        local v22 = p21.useState
        local v23 = p21.useEffect
        local v24 = (#u20.Columns - 1) * 0.05 / #u20.Columns
        local v25, u26 = v22(0)
        local v27, u28 = v22(0)
        local v29, u30 = v22("--")
        local v31, u32 = v22(nil)
        local v33, u34 = v22("--")
        v23(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u15
                [3] = u26
                [4] = u9
                [5] = u28
            --]]
            local v35 = u20.store.Clans.myClan
            if v35 ~= nil then
                v35 = v35.clanContribution
            end
            if not v35 then
                return nil
            end
            local v36 = u15.getContributionDayId()
            local v37 = v35.dailyMemberContributions[v36]
            if v37 ~= nil then
                local v38 = u20.ClanMember.offlinePlayer.userId
                v37 = v37[tostring(v38)]
            end
            if v37 ~= 0 and (v37 == v37 and v37) then
                u26(v37)
            end
            local v39 = 0
            local v40 = v39
            for v41, v42 in u9.entries(v35.dailyMemberContributions) do
                local _ = v41 - 1
                local v43 = v42[1]
                local v44 = v42[2]
                if v36 >= v43 then
                    local v45 = u20.ClanMember.offlinePlayer.userId
                    local v46 = v44[tostring(v45)]
                    if v46 ~= 0 and (v46 == v46 and v46) then
                        v39 = v40 + v46
                        v40 = v39
                    end
                end
            end
            u28(v40)
        end, { u20.ClanMember.contribution })
        v23(function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u30
                [3] = u32
                [4] = u34
            --]]
            if not u20.ClanMember.stats then
                return nil
            end
            local v47 = u30
            local v48 = u20.ClanMember.stats.level
            v47((tostring(v48)))
            u32(u20.ClanMember.stats.seasonRank)
            local v49 = u34
            local v50 = u20.ClanMember.stats.totalWins
            v49((tostring(v50)))
        end, { u20.ClanMember.stats })
        local v51 = {}
        local v52 = u20.store.Clans.myClanMember
        if u20.AdminView and (v52 and v52.rank > u20.ClanMember.rank) then
            if u20.ClanMember.rank < u14.ADMIN then
                local v56 = {
                    ["text"] = "Promote",
                    ["callback"] = function(u53) --[[ Name: callback, Line 89 ]]
                        --[[
                        Upvalues:
                            [1] = u20
                            [2] = u8
                        --]]
                        local v54 = u20.store.Clans.myClanId
                        if v54 == "" or not v54 then
                            return nil
                        end
                        u53(true)
                        u8.Controllers.ClanController:promoteMember(u20.ClanMember, u20.store.Clans.myClanId):andThen(function(p55) --[[ Line: 96 ]]
                            --[[
                            Upvalues:
                                [1] = u53
                            --]]
                            u53(false)
                            return p55
                        end)
                    end
                }
                table.insert(v51, v56)
            end
            if u20.ClanMember.rank > u14.MEMBER then
                local v60 = {
                    ["text"] = "Demote",
                    ["callback"] = function(u57) --[[ Name: callback, Line 109 ]]
                        --[[
                        Upvalues:
                            [1] = u20
                            [2] = u8
                        --]]
                        local v58 = u20.store.Clans.myClanId
                        if v58 == "" or not v58 then
                            return nil
                        end
                        u57(true)
                        u8.Controllers.ClanController:demoteMember(u20.ClanMember, u20.store.Clans.myClanId):andThen(function(p59) --[[ Line: 116 ]]
                            --[[
                            Upvalues:
                                [1] = u57
                            --]]
                            u57(false)
                            return p59
                        end)
                    end
                }
                table.insert(v51, v60)
            end
            local v64 = {
                ["text"] = "Kick",
                ["callback"] = function(u61) --[[ Name: callback, Line 128 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u8
                    --]]
                    local v62 = u20.store.Clans.myClanId
                    if v62 == "" or not v62 then
                        return nil
                    end
                    u61(true)
                    u8.Controllers.ClanController:kickPlayer(u20.ClanMember, u20.store.Clans.myClanId):andThen(function(p63) --[[ Line: 135 ]]
                        --[[
                        Upvalues:
                            [1] = u61
                        --]]
                        u61(false)
                        return p63
                    end)
                end
            }
            table.insert(v51, v64)
            if v52.rank == u14.LEADER then
                local v72 = {
                    ["text"] = "Transfer Leadership",
                    ["dangerous"] = true,
                    ["callback"] = function(p65) --[[ Name: callback, Line 146 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u13
                            [3] = u4
                            [4] = u18
                            [5] = u20
                            [6] = u8
                            [7] = u7
                        --]]
                        p65(true)
                        local v66 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                        local v67 = u13.CONFIRMATION_MODAL
                        local v71 = {
                            ["Title"] = "Transfer Leadership?",
                            ["Body"] = "Are you sure you want to transfer the leadership of this clan to <font transparency=\"0\" color=\"" .. u4.richTextColor(u18.mcAqua) .. "\"><b>[" .. u20.ClanMember.offlinePlayer.displayName .. "]</b></font>?",
                            ["PrimaryBtnProps"] = {
                                ["Text"] = "Transfer",
                                ["BackgroundColor3"] = u18.backgroundError
                            },
                            ["SecondaryBtnProps"] = {
                                ["Text"] = "Cancel"
                            },
                            ["OnPrimaryBtnClick"] = function(u68) --[[ Name: OnPrimaryBtnClick, Line 158 ]]
                                --[[
                                Upvalues:
                                    [1] = u20
                                    [2] = u8
                                --]]
                                local v69 = u20.store.Clans.myClanId
                                if v69 == "" or not v69 then
                                    return nil
                                end
                                u8.Controllers.ClanController:transferLeadership(u20.ClanMember, u20.store.Clans.myClanId):andThen(function(p70) --[[ Line: 164 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u68
                                    --]]
                                    u68(false)
                                    return p70
                                end)
                            end,
                            ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 170 ]]
                                --[[
                                Upvalues:
                                    [1] = u2
                                    [2] = u7
                                --]]
                                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u7.OVERLAY)
                            end
                        }
                        v66:openApp(v67, v71)
                    end
                }
                table.insert(v51, v72)
            end
        end
        local v73 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(0.95, 0, 0, 40),
            ["BackgroundColor3"] = u18.backgroundPrimary,
            ["LayoutOrder"] = u20.Index
        }
        local v74 = {}
        local v75 = #v74
        local v76 = u20.IsMyClanMemberRow
        if v76 then
            v76 = u10.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Color"] = u18.textPrimary
            })
        end
        if v76 then
            v74[v75 + 1] = v76
        end
        local v77 = #v74
        v74[v77 + 1] = u10.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v78 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v79 = { u10.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.03, 0),
                ["PaddingRight"] = UDim.new(0.03, 0)
            }), u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 12)
            }) }
        local v80 = #v79
        local v81
        if u20.DisplayDataType == u19.STATS then
            local v82 = {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(u20.Columns[4].width - v24, 0, 1, 0)
            }
            local v83 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.03, 0)
                }) }
            local v84 = #v83
            local v85
            if v31 == 0 then
                v85 = false
            elseif v31 == v31 then
                v85 = v31
            else
                v85 = false
            end
            local v86 = v85 and true or false
            if v86 then
                v86 = u10.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.new(0.45, 0, 1, 0),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                    ["Image"] = u17[v31].image,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            end
            if v86 then
                v83[v84 + 1] = v86
            end
            local v87 = #v83
            local v88 = {
                ["Size"] = UDim2.new(0.45, 0, 1, 0)
            }
            local v89
            if v31 == 0 or (v31 ~= v31 or not v31) then
                v89 = "--"
            else
                local v90 = u17[v31].shortName
                v89 = v90 == nil and "--" or v90
            end
            v88.Text = v89
            v88.TextScaled = true
            v88.RichText = true
            v88.Font = "Roboto"
            v88.TextColor3 = u4.WHITE
            v88.TextXAlignment = "Left"
            v88.TextYAlignment = "Center"
            v88.TextTransparency = 0.3
            v88.BackgroundTransparency = 1
            v88.LayoutOrder = 1
            v83[v87 + 1] = u10.createElement("TextLabel", v88, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) })
            v81 = u10.createElement(u5, v82, v83)
        elseif u20.DisplayDataType == u19.CONTRIBUTION then
            v81 = u10.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(u20.Columns[4].width - v24, 0, 1, 0),
                ["Text"] = u6.formatNumberWithCommas((math.floor(v25))),
                ["TextColor3"] = u4.WHITE
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) })
        else
            v81 = nil
        end
        local v91 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v92 = {}
        local v93 = u10.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v94 = u10.createElement(u5, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(u20.Columns[1].width - v24, 0, 1, 0)
        }, { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u10.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["AutoLocalize"] = false,
                ["Size"] = UDim2.fromScale(1, 0.55),
                ["Text"] = "<b>" .. u20.ClanMember.offlinePlayer.displayName .. "</b>",
                ["TextColor3"] = u4.WHITE
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) }), u10.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["AutoLocalize"] = false,
                ["Size"] = UDim2.fromScale(1, 0.4),
                ["Text"] = "@" .. u20.ClanMember.offlinePlayer.name,
                ["TextColor3"] = u4.WHITE
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) }) })
        local v95 = u10.createElement
        local v96 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(u20.Columns[2].width - v24, 0, 1, 0)
        }
        local v97 = u6.capitalizeFirstLetter
        local v98 = string.lower
        local v99 = u14[u20.ClanMember.rank]
        v96.Text = v97(v98((tostring(v99))))
        v96.TextColor3 = u4.WHITE
        local v100 = v95("TextLabel", v96, { u10.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        local v101 = u10.createElement
        local v102 = "TextLabel"
        local v103 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(u20.Columns[3].width - v24, 0, 1, 0)
        }
        if u20.DisplayDataType ~= u19.STATS then
            if u20.DisplayDataType == u19.CLAN_WAR then
                local v104 = u20.missionProgressCount
                local v105 = tostring(v104)
                local v106 = u16.TWO_MEMBER_MISSION_COUNT + u16.MANY_MEMBER_MISSION_COUNT
                v29 = v105 .. " / " .. tostring(v106)
            else
                local v107 = u6.formatNumberWithCommas
                local v108 = u20.ClanMember.contribution
                v29 = v107((math.floor(v108)))
            end
        end
        v103.Text = v29
        v103.TextColor3 = u4.WHITE
        __set_list(v92, 1, {v93, v94, v100, v101(v102, v103, { u10.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 16
    }) })})
        local v109 = #v92
        if v81 then
            v92[v109 + 1] = v81
        end
        local v110 = #v92
        local v111 = v110 + 1
        local v112 = u10.createElement
        local v113 = "TextLabel"
        local v114 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.new(u20.Columns[5].width - v24, 0, 1, 0)
        }
        if u20.DisplayDataType ~= u19.STATS then
            v33 = u20.DisplayDataType ~= u19.CONTRIBUTION and "" or u6.formatNumberWithCommas((math.floor(v27)))
        end
        v114.Text = v33
        v114.TextColor3 = u4.WHITE
        v92[v111] = v112(v113, v114, { u10.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        local v115 = u20.AdminView
        if v115 then
            if #v51 > 0 then
                v115 = u10.createElement(u12, {
                    ["ButtonText"] = "Actions",
                    ["LayoutOrder"] = 5,
                    ["Items"] = v51,
                    ["Size"] = UDim2.new(u20.Columns[6].width - v24, 0, 1, 0)
                })
            else
                v115 = false
            end
        end
        if v115 then
            v92[v110 + 2] = v115
        end
        v79[v80 + 1] = u10.createElement(u5, v91, v92)
        v74[v77 + 2] = u10.createElement(u5, v78, v79)
        return u10.createElement("Frame", v73, v74)
    end)
}