local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Countdown
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-list").RewardList
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata")
local u12 = v11.EventCurrencyType
local u13 = v11.EventType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "summer-2025", "summer-2025-constants").Summer2025Constants
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types")
local u17 = v16.GlobalTeamEventKey
local u18 = v16.GlobalTeamKey
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v1.import(script, script.Parent.Parent.Parent, "clan", "ui", "profile", "war-tab", "pill-counter").PillCounter
local u23 = v1.import(script, script.Parent.Parent, "event-teams", "ui", "timed-goal", "global-team-event-timed-goals-overview").GlobalTeamEventGoalsOverview
local u24 = v1.import(script, script.Parent.Parent, "event-teams", "ui", "timed-goal", "global-team-event-timed-goals-riddle-card").GlobalTeamEventTimedGoalsRiddleCard
local v50 = v8.new(u7)(function(u25, p26) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u19
        [4] = u17
        [5] = u6
        [6] = u18
        [7] = u7
        [8] = u4
        [9] = u5
        [10] = u23
        [11] = u24
        [12] = u21
        [13] = u3
        [14] = u22
        [15] = u20
        [16] = u14
        [17] = u10
        [18] = u12
    --]]
    local v27 = p26.useState
    local v28 = p26.useEffect
    local v29, u30 = v27(nil)
    local v31 = u25.eventDataProfile.events[u13.SUMMER_2025].summer2025CollectionData
    if v31 ~= nil then
        v31 = v31.dailyCollectionMap[u15.resetTime:getDailyResetId()]
    end
    local v32 = v31 == nil and 0 or v31
    v28(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u17
            [3] = u6
            [4] = u18
            [5] = u25
            [6] = u30
        --]]
        local v33 = u6
        local v34 = u19.getGlobalTeamEventMeta(u17.SUMMER_2025).timedGoals
        local v35 = u18.SUMMER_2025_TEAM
        local v36 = nil
        for v37, v38 in v33.values(v34[v35]) do
            local _ = v37 - 1
            if u19.isTimedGoalActive(v38) == true then
                v36 = v38
                break
            end
        end
        local v39 = u25.globalTeamDataMap[u17.SUMMER_2025]
        if v39 ~= nil then
            v39 = v39.globalTeams[u18.SUMMER_2025_TEAM]
        end
        if v39 and v36 then
            local v40 = v39.timedGoalsData
            if v40 ~= nil then
                v40 = v40[v36.key]
            end
            u30({
                ["timedGoal"] = v36,
                ["score"] = v40 == nil and 0 or v40
            })
        end
    end, {})
    local v41 = u7.createFragment
    local v42 = {}
    local v43 = u7.createElement
    local v44 = u4
    local v45 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v46 = {
        u7.createElement(u5, {
            ["Padding"] = UDim.new(0, 8)
        }),
        u7.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 8)
        }),
        ["SideBar"] = u7.createElement(u4, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.35, 1)
        }, { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            }), u7.createElement(u23, {
                ["CurrentTimedGoalData"] = v29,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 1
                }
            }), u7.createElement(u24, {
                ["CurrentTimedGoalData"] = v29,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 2
                }
            }) })
    }
    local v47 = u7.createElement
    local v48 = {
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(0.625, 0.35),
        ["Position"] = UDim2.fromScale(0.025, 0.05),
        ["AnchorPoint"] = Vector2.new(0, 0),
        ["BackgroundColor3"] = u21.backgroundTertiary
    }
    local v49 = {
        u7.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0),
            ["PaddingTop"] = UDim.new(0.075, 0),
            ["PaddingBottom"] = UDim.new(0.075, 0)
        }),
        u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        }),
        ["LeftSide"] = u7.createElement(u4, {
            ["Size"] = UDim2.fromScale(0.5, 1)
        }, {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.025, 0)
            }),
            ["Title"] = u7.createElement("TextLabel", {
                ["Text"] = "Daily",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }),
            u7.createElement(u3, {
                ["PreText"] = "Resets in: ",
                ["EndTime"] = u15.resetTime:getNextDailyResetTime(),
                ["TextLabel"] = {
                    ["LayoutOrder"] = 2,
                    ["TextTransparency"] = 0.3,
                    ["Size"] = UDim2.new(1, 0, 0.12, 0),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
                },
                ["CountdownConfig"] = {
                    ["minutes"] = true,
                    ["hours"] = true,
                    ["days"] = false
                }
            }),
            ["Description"] = u7.createElement("TextLabel", {
                ["Text"] = "Buy treasure maps in matches to find treasure chests",
                ["TextScaled"] = true,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.825, 0.19),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }),
            u7.createElement(u4, {
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.fromScale(1, 0.04)
            }),
            u7.createElement(u22, {
                ["Tooltip"] = "Treasure Chests",
                ["DisableCountAnimation"] = true,
                ["Icon"] = u20.PIRATE_MAP_TREASURE_CHEST,
                ["Amount"] = v32,
                ["MaxAmount"] = u14.dailyEventCurrencyTreasureLimit,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 5,
                    ["Size"] = UDim2.new(0.6, 0, 0.3, 0)
                }
            })
        }),
        ["RightSide"] = u7.createElement(u4, {
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }, {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.025, 0)
            }),
            ["Title"] = u7.createElement("TextLabel", {
                ["Text"] = "Rewards",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }),
            ["Description"] = u7.createElement("TextLabel", {
                ["Text"] = "Open treasure chests for a chance of event currency and in-match resources",
                ["TextScaled"] = true,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.95, 0.22),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }),
            u7.createElement(u4, {
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.new(1, 0, 0.09, 0)
            }),
            u7.createElement(u10, {
                ["Rewards"] = {
                    {
                        ["eventCurrency"] = {
                            ["amount"] = 500,
                            ["currency"] = u12.SUMMER_2025_CURRENCY
                        }
                    },
                    {
                        ["eventCurrency"] = {
                            ["amount"] = 750,
                            ["currency"] = u12.SUMMER_2025_CURRENCY
                        }
                    },
                    {
                        ["eventCurrency"] = {
                            ["amount"] = 1000,
                            ["currency"] = u12.SUMMER_2025_CURRENCY
                        }
                    }
                },
                ["FrameProps"] = {
                    ["LayoutOrder"] = 5
                },
                ["UIGridlayoutProps"] = {
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
                }
            })
        })
    }
    v46.DailyTreasureChests = v47("Frame", v48, v49)
    v42.Summer2025EventInfoPage = v43(v44, v45, v46)
    return v41(v42)
end)
return {
    ["Summer2025EventInfoPage"] = v9.connect(function(p51, p52) --[[ Line: 271 ]]
        local v53 = {}
        for v54, v55 in p52 do
            v53[v54] = v55
        end
        v53.eventDataProfile = p51.Event.profileData
        v53.globalTeamDataMap = p51.Event.globalTeamEventDataMap
        return v53
    end)(v50)
}