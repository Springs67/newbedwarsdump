local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ButtonComponent
local u5 = v2.ColorUtil
local u6 = v2.Countdown
local u7 = v2.DarkBackground
local u8 = v2.Empty
local u9 = v2.Padding
local u10 = v2.ScaleComponent
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-event-meta").GlobalTeamEvents
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v1.import(script, script.Parent, "event-checkin", "ui", "event-checkin-page").EventCheckinPage
local u23 = v1.import(script, script.Parent, "event-info-page", "summer-2025-event-info-page").Summer2025EventInfoPage
local u24 = v1.import(script, script.Parent, "event-missions", "ui", "event-missions").EventMissions
local u25 = v1.import(script, script.Parent, "event-navbar", "event-app-navbar").EventAppNavbar
local u26 = v1.import(script, script.Parent, "event-shop", "ui", "event-shop").EventShop
local u27 = v1.import(script, script.Parent, "event-teams", "ui", "event-teams").EventTeams
local u28 = v1.import(script, script.Parent, "event-teams", "ui", "global-team-event-rewards-gui").GlobalTeamEventRewardsGUI
local u29 = v1.import(script, script.Parent, "event-teams", "ui", "timed-goal", "global-team-event-timed-goals-gui").GlobalTeamTimedGoalsGUI
local v103 = v14.new(u13)(function(u30, p31) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u16
        [3] = u20
        [4] = u12
        [5] = u13
        [6] = u7
        [7] = u21
        [8] = u10
        [9] = u25
        [10] = u9
        [11] = u3
        [12] = u5
        [13] = u8
        [14] = u4
        [15] = u11
        [16] = u6
        [17] = u19
        [18] = u18
        [19] = u23
        [20] = u27
        [21] = u26
        [22] = u24
        [23] = u28
        [24] = u29
        [25] = u22
    --]]
    local v32 = p31.useState
    local u33 = u17[u30.event]
    local v34 = u30.eventDataProfile.events[u30.event]
    local u35 = os.time() > u33.endDate
    local u36 = #u33.shops ~= 0
    local u37 = u33.customPagesConfig
    if u37 ~= nil then
        u37 = u37.infoPage
    end
    local u38 = u33.customPagesConfig
    if u38 ~= nil then
        u38 = u38.setTeamPage
    end
    local u39 = #u33.missionGenerators ~= 0
    local v40
    if u33.globalTeamEventKey == nil then
        v40 = nil
    else
        v40 = u16:getState().Event.profileData.events[u30.event]
        if v40 ~= nil then
            v40 = v40.globalTeamKey
        end
    end
    local u41, v42 = v32(function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u38
            [3] = u35
            [4] = u39
            [5] = u36
            [6] = u37
            [7] = u33
            [8] = u20
        --]]
        return u30.tab == nil and (u38 and not u35 and "team" or ((u35 or not u39) and u36 and "shop" or (u37 and "info" or (u33.checkInSystem and "checkin" or (u33.globalTeamEventKey and (u20[u33.globalTeamEventKey].timedGoals and "global-team-timed-goals" or "global-team-milestones") or "missions"))))) or u30.tab
    end)
    local v46 = (function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u33
        --]]
        local v43 = string.lower(u41)
        if v43 == "shop" then
            local v44 = u33.shopPageDesc
            return v44 == nil and "The shop will stay open for a week after the event ends." or v44
        end
        if v43 ~= "missions" then
            return v43 == "checkin" and "Don\226\128\153t miss out! Swing by every day for something awesome \240\159\142\129" or ""
        end
        local v45 = u33.missionPageDesc
        return v45 == nil and "Complete Missions to earn currency to spend in the Event Shop!" or v45
    end)()
    local v47 = u12.values(u30.eventDataProfile.events)
    local function v55(p48, p49) --[[ Line: 104 ]]
        local v50 = {}
        local v51 = #v50
        local v52 = #p48
        table.move(p48, 1, v52, v51 + 1, v50)
        local v53 = v51 + v52
        local v54 = p49.itemsPurchased
        table.move(v54, 1, #v54, v53 + 1, v50)
        return v50
    end
    local v56 = {}
    for v57 = 1, #v47 do
        v56 = v55(v56, v47[v57], v57 - 1, v47)
    end
    local v58 = {
        ["DisplayOrder"] = 21,
        ["ResetOnSpawn"] = false
    }
    local v59 = { u13.createElement(u7, {
            ["AppId"] = u30.AppId
        }) }
    local _ = #v59
    local v60 = {
        ["BackgroundTransparency"] = 0.05,
        ["Selectable"] = false,
        ["AutoButtonColor"] = false,
        ["Active"] = true,
        ["Modal"] = true,
        ["Size"] = UDim2.fromOffset(690, 480),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundColor3"] = u21.backgroundSecondary,
        ["ScaleType"] = Enum.ScaleType.Crop
    }
    local v61 = {
        u13.createElement(u10, {
            ["MaximumSize"] = Vector2.new(1035, 720),
            ["ScreenPadding"] = Vector2.new(80, 80)
        }),
        u13.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 8)
        }),
        u13.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }),
        u13.createElement(u25, {
            ["EventDataProfile"] = u30.eventDataProfile,
            ["EventType"] = u30.event,
            ["Page"] = u41,
            ["SetPage"] = v42
        })
    }
    local _ = #v61
    local v62 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.9)
    }
    local v63 = {}
    local v64 = u13.createElement
    local v65 = u9
    local v66 = {
        ["Padding"] = {
            ["Vertical"] = string.lower(u41) == "team" and 0 or 8,
            ["Horizontal"] = string.lower(u41) == "team" and 0 or 8
        }
    }
    __set_list(v63, 1, {v64(v65, v66), u13.createElement("UIListLayout", {
    ["FillDirection"] = "Vertical",
    ["SortOrder"] = "LayoutOrder",
    ["Padding"] = UDim.new(0.02, 0)
})})
    local v67 = #v63
    local v68
    if v46 == "" then
        v68 = false
    else
        v68 = u13.createFragment({
            ["PageDescription"] = u13.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextTransparency"] = 0.3,
                ["TextXAlignment"] = "Left",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.04),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0, 1),
                ["Text"] = v46,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        })
    end
    if v68 then
        v63[v67 + 1] = v68
    end
    local v69 = #v63
    if v34 then
        local v70 = string.lower(u41) == "info"
        if v70 then
            local v71 = u33.customPagesConfig
            if v71 ~= nil then
                v71 = v71.infoPage
                if v71 ~= nil then
                    v71 = v71.description
                end
            end
            local v72 = v71 ~= nil
            if v72 then
                local v73 = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 0, 70)
                }
                local v74 = { u13.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["VerticalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0, 10)
                    }), u13.createElement(u3, {
                        ["Text"] = "Event Info",
                        ["TextSize"] = 20,
                        ["BackgroundTransparency"] = 1,
                        ["ZIndex"] = 2,
                        ["LayoutOrder"] = 1,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["TextColor3"] = u5.WHITE,
                        ["TextYAlignment"] = Enum.TextYAlignment.Top,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left
                    }) }
                local v75 = #v74
                local v76 = {}
                local v77 = u33.customPagesConfig
                if v77 ~= nil then
                    v77 = v77.infoPage
                    if v77 ~= nil then
                        v77 = v77.description
                    end
                end
                v76.Text = v77
                v76.Font = Enum.Font.SourceSans
                v76.TextColor3 = u5.WHITE
                v76.Limits = Vector2.new(690, 600)
                v76.TextSize = 16
                v76.TextYAlignment = Enum.TextYAlignment.Top
                v76.TextXAlignment = Enum.TextXAlignment.Left
                v76.BackgroundTransparency = 1
                v76.ZIndex = 2
                v76.LayoutOrder = 2
                v74[v75 + 1] = u13.createElement(u3, v76)
                v72 = u13.createElement(u8, v73, v74)
            end
            local v78 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v79 = { u13.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 16)
                }) }
            local v80 = #v79
            if v72 then
                v79[v80 + 1] = v72
            end
            local v81 = #v79
            local v82 = u33.customPagesConfig
            if v82 ~= nil then
                v82 = v82.infoPage
                if v82 ~= nil then
                    v82 = v82.playButtonQueue
                end
            end
            if v82 then
                local v83 = {
                    ["Text"] = "Play Event Queue",
                    ["LayoutOrder"] = 3,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 288 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u33
                        --]]
                        u11.Controllers.QueueController:joinQueue(u33.customPagesConfig.infoPage.playButtonQueue)
                    end
                }
                v82 = u13.createElement(u4, v83)
            end
            if v82 then
                v79[v81 + 1] = v82
            end
            local v84 = #v79
            local v85 = u33.customPagesConfig
            if v85 ~= nil then
                v85 = v85.infoPage
                if v85 ~= nil then
                    v85 = v85.LNYEnvelopes
                end
            end
            local v86 = v85 ~= nil
            if v86 then
                v86 = u13.createElement(u8, {
                    ["LayoutOrder"] = 4,
                    ["Size"] = UDim2.new(1, 0, 0, 240)
                }, { u13.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["VerticalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0, 10)
                    }), u13.createElement(u3, {
                        ["Text"] = "Daily Envelope Collection",
                        ["TextSize"] = 20,
                        ["BackgroundTransparency"] = 1,
                        ["ZIndex"] = 2,
                        ["LayoutOrder"] = 1,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["TextColor3"] = u5.WHITE,
                        ["Limits"] = Vector2.new(300, 60),
                        ["TextYAlignment"] = Enum.TextYAlignment.Top,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left
                    }), u13.createElement(u6, {
                        ["PreText"] = "Resets in: ",
                        ["EndTime"] = u19.resetTime:getNextDailyResetTime(),
                        ["TextLabel"] = {
                            ["LayoutOrder"] = 2,
                            ["Size"] = UDim2.new(1, 0, 0, 18),
                            ["TextXAlignment"] = Enum.TextXAlignment.Left,
                            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Regular)
                        },
                        ["CountdownConfig"] = {
                            ["minutes"] = true,
                            ["hours"] = true,
                            ["days"] = false
                        }
                    }) })
            end
            if v86 then
                v79[v84 + 1] = v86
            end
            local v87 = #v79
            local v88
            if u30.event == u18.SUMMER_2025 then
                v88 = u13.createElement(u23, {
                    ["AppId"] = "Summer2025EventInfoPage"
                })
            else
                v88 = false
            end
            if v88 then
                v79[v87 + 1] = v88
            end
            v70 = u13.createFragment({
                ["EventInfo"] = u13.createElement(u8, v78, v79)
            })
        end
        local v89 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, v46 == "" and 1 or 0.94)
        }
        local v90 = {}
        local v91 = #v90
        if v70 then
            v90[v91 + 1] = v70
        end
        local v92 = #v90
        local v93 = string.lower(u41) == "team" and not u35
        if v93 then
            v93 = u13.createElement(u27, {
                ["EventType"] = u30.event
            })
        end
        if v93 then
            v90[v92 + 1] = v93
        end
        local v94 = #v90
        local v95
        if string.lower(u41) == "shop" then
            v95 = u13.createElement(u26, {
                ["Shop"] = u33.shops[1],
                ["EventShopItemsPurchased"] = v34.itemsPurchased,
                ["AllTimeItemsPurchased"] = v56,
                ["EventType"] = u30.event
            })
        else
            v95 = false
        end
        if v95 then
            v90[v94 + 1] = v95
        end
        local v96 = #v90
        local v97 = not u35 and (string.lower(u41) == "missions" and u30.activeMissions)
        if v97 then
            v97 = u13.createElement(u24, {
                ["MissionsMap"] = u30.activeMissions,
                ["ClaimedMissions"] = v34.missionsClaimed,
                ["EventType"] = u30.event
            })
        end
        if v97 then
            v90[v96 + 1] = v97
        end
        local v98 = #v90
        local v99
        if string.lower(u41) == "global-team-milestones" then
            v99 = u13.createElement(u28, {
                ["EventType"] = u30.event,
                ["GlobalTeamKey"] = v40
            })
        else
            v99 = false
        end
        if v99 then
            v90[v98 + 1] = v99
        end
        local v100 = #v90
        if string.lower(u41) == "global-team-timed-goals" then
            if v40 then
                v40 = u13.createElement(u29, {
                    ["EventType"] = u30.event,
                    ["GlobalTeamKey"] = v40
                })
            end
        else
            v40 = false
        end
        if v40 then
            v90[v100 + 1] = v40
        end
        local v101 = #v90
        local v102 = string.lower(u41) == "checkin" and u33.checkInSystem
        if v102 then
            v102 = u13.createElement(u22, {
                ["AppId"] = "EventCheckinPage",
                ["CheckInSystem"] = u33.checkInSystem,
                ["EventType"] = u30.event
            })
        end
        if v102 then
            v90[v101 + 1] = v102
        end
        v34 = u13.createElement(u8, v89, v90)
    end
    if v34 then
        v63[v69 + 1] = v34
    end
    v61.Content = u13.createElement(u8, v62, v63)
    v59.EventApp = u13.createElement("ImageButton", v60, v61)
    return u13.createFragment({
        ["EventShop"] = u13.createElement("ScreenGui", v58, v59)
    })
end)
return {
    ["EventApp"] = v15.connect(function(p104, p105) --[[ Line: 432 ]]
        local v106 = {}
        for v107, v108 in p105 do
            v106[v107] = v108
        end
        v106.eventDataProfile = p104.Event.profileData
        v106.activeMissions = p104.Event.activeMissions[p105.event]
        return v106
    end)(v103)
}