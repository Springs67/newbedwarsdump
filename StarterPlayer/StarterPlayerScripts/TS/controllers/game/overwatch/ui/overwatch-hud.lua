local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.ColorUtil
local u6 = v3.Empty
local u7 = v3.Padding
local u8 = v3.ScaleComponent
local u9 = v3.UILayers
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "report", "report").ReportTicketResult
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v1.import(script, script.Parent.Parent.Parent, "spectate", "spectate-controller").SpectateMode
local v120 = v13.new(u12)(function(u23, p24) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u17
        [3] = u2
        [4] = u15
        [5] = u21
        [6] = u10
        [7] = u20
        [8] = u19
        [9] = u5
        [10] = u9
        [11] = u12
        [12] = u8
        [13] = u6
        [14] = u7
        [15] = u18
        [16] = u16
        [17] = u4
        [18] = u11
    --]]
    local v25 = p24.useState
    local v26, u27 = v25(false)
    local u28, u29 = v25(u22.PLAYER)
    local v30 = UDim2.fromOffset(750, 100)
    local v31 = u17.NONE
    local v32 = u23.SuspectInfo
    if v32 ~= nil then
        v32 = v32.kit
    end
    if v32 then
        v31 = u23.SuspectInfo
        if v31 ~= nil then
            v31 = v31.kit
        end
    end
    local function u40() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
            [3] = u21
            [4] = u10
            [5] = u22
            [6] = u20
            [7] = u27
            [8] = u19
            [9] = u5
            [10] = u23
            [11] = u9
        --]]
        local v33 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        local v34 = u15.CONFIRMATION_MODAL
        local v39 = {
            ["Title"] = "Ban Player?",
            ["Body"] = "Are you sure you want to permanantly ban this player?",
            ["PrimaryBtnProps"] = {
                ["Text"] = "BAN",
                ["BackgroundColor3"] = u21.backgroundError
            },
            ["SecondaryBtnProps"] = {
                ["Text"] = "CANCEL"
            },
            ["OnPrimaryBtnClick"] = function() --[[ Name: OnPrimaryBtnClick, Line 52 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u22
                    [3] = u2
                    [4] = u20
                    [5] = u27
                    [6] = u19
                    [7] = u5
                    [8] = u21
                    [9] = u23
                --]]
                u10.Controllers.SpectateController:setSpectateMode(u22.ALL)
                u2.resolveDependency("client/controllers/global/report/report-controller@ReportController"):resolveCurrentTicket(u20.BANNED)
                u27(true)
                local v35 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                local v36 = {
                    ["image"] = u19.EASY_GAMES_LOGO
                }
                local v37 = u5.richTextColor(u21.mcAqua)
                local v38 = u23.SuspectInfo
                if v38 ~= nil then
                    v38 = v38.displayName
                end
                v36.message = "<b>Resolved <font color=\"" .. v37 .. "\">" .. tostring(v38) .. "</font> as <font color=\"" .. u5.richTextColor(Color3.fromRGB(255, 34, 34)) .. "\">BANNED</font></b>"
                v35:sendInfoNotification(v36)
            end,
            ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 69 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u9
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u9.OVERLAY)
            end
        }
        v33:openApp(v34, v39)
    end
    local function v46(p41) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
        --]]
        local v42 = p41.Title
        local v43 = p41.Value
        local v44 = u12.createFragment
        local v45 = {
            ["SuspectInfo"] = u12.createElement("TextLabel", {
                ["RichText"] = true,
                ["TextSize"] = 12,
                ["TextXAlignment"] = "Left",
                ["BackgroundTransparency"] = 1,
                ["Text"] = "<b>" .. v42 .. ":</b> <font transparency=\".3\">" .. v43 .. "</font>",
                ["Font"] = Enum.Font.Roboto,
                ["TextColor3"] = u5.WHITE
            })
        }
        return v44(v45)
    end
    local function v54(p47) --[[ Line: 89 ]]
        local v48 = p47 / 86400
        local v49 = math.floor(v48)
        local v50 = p47 % 86400 / 3600
        local v51 = math.floor(v50)
        local v52 = p47 % 3600 / 60
        local v53 = math.floor(v52)
        return (v49 <= 0 and "" or tostring(v49) .. "d ") .. (v51 <= 0 and "" or tostring(v51) .. "h ") .. (v53 <= 0 and "" or tostring(v53) .. "m ")
    end
    local v55 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 1001
    }
    local v56 = {}
    local _ = #v56
    local v57 = {
        ["Size"] = v30,
        ["Position"] = UDim2.fromScale(0.5, 0.01),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v58 = { u12.createElement(u8, {
            ["PowerRelationshipPastMaximum"] = 0.6,
            ["MaximumSize"] = Vector2.new(v30.X.Offset * 1.2, v30.Y.Offset * 1.2),
            ["ScreenPadding"] = Vector2.new(30, 30)
        }), u12.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local _ = #v58
    local v59 = {
        ["Size"] = UDim2.fromScale(1, 0.7)
    }
    local v60 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }) }
    local _ = #v60
    local v61 = {
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.25, 1),
        ["BackgroundColor3"] = Color3.fromRGB(24, 24, 24)
    }
    local v62 = {}
    local v63 = u12.createElement("UIListLayout", {
        ["FillDirection"] = "Horizontal",
        ["SortOrder"] = "LayoutOrder",
        ["Padding"] = UDim.new(0, 8)
    })
    local v64 = u12.createElement
    local v65 = {
        ["SizeConstraint"] = "RelativeYY",
        ["ScaleType"] = "Fit",
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v66 = u23.ReportTicket.reported
    v65.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v66) .. "&w=150&h=150"
    __set_list(v62, 1, {v63, v64("ImageLabel", v65)})
    local v67 = #v62
    local v68 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.2, 1)
    }
    local v69 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder"
        }) }
    local _ = #v69
    local v70 = {
        ["AutomaticSize"] = "Y",
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v71 = u23.SuspectInfo
    if v71 ~= nil then
        v71 = v71.team
        if v71 ~= nil then
            v71 = string.upper(v71.name)
        end
    end
    v70.Text = tostring(v71) .. " TEAM"
    v70.RichText = true
    v70.TextSize = 10
    v70.Font = Enum.Font.Roboto
    local v72 = u23.SuspectInfo
    if v72 ~= nil then
        v72 = v72.team
        if v72 ~= nil then
            v72 = v72.color
        end
    end
    v70.TextColor3 = v72
    v70.TextXAlignment = "Left"
    v70.BackgroundTransparency = 1
    v70.LayoutOrder = 1
    v69.Tag = u12.createElement("TextLabel", v70)
    local v73 = {
        ["AutomaticSize"] = "Y",
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v74 = u23.SuspectInfo
    if v74 ~= nil then
        v74 = v74.displayName
    end
    v73.Text = "<b>" .. tostring(v74) .. "</b>"
    v73.RichText = true
    v73.TextSize = 14
    v73.Font = Enum.Font.Roboto
    v73.TextColor3 = u5.WHITE
    v73.TextXAlignment = "Left"
    v73.BackgroundTransparency = 1
    v73.LayoutOrder = 2
    v69.DisplayName = u12.createElement("TextLabel", v73)
    local v75 = {
        ["AutomaticSize"] = "Y",
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v76 = u23.SuspectInfo
    if v76 ~= nil then
        v76 = v76.username
    end
    v75.Text = "@" .. tostring(v76)
    v75.RichText = true
    v75.TextSize = 10
    v75.Font = Enum.Font.Roboto
    v75.TextColor3 = u5.WHITE
    v75.TextTransparency = 0.3
    v75.TextXAlignment = "Left"
    v75.BackgroundTransparency = 1
    v75.LayoutOrder = 3
    v69.Username = u12.createElement("TextLabel", v75)
    v62[v67 + 1] = u12.createElement(u6, v68, v69)
    v60.SuspectInfo = u12.createElement("Frame", v61, v62)
    local v77 = {
        ["BackgroundTransparency"] = 0.2,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.75, 1),
        ["BackgroundColor3"] = Color3.fromRGB(24, 24, 24)
    }
    local v78 = {}
    local v79 = u12.createElement(u7, {
        ["Padding"] = {
            ["Vertical"] = 8,
            ["Horizontal"] = 12
        }
    })
    local v80 = u12.createElement("UIGridLayout", {
        ["FillDirection"] = "Vertical",
        ["FillDirectionMaxCells"] = 4,
        ["VerticalAlignment"] = "Center",
        ["CellSize"] = UDim2.new(0.33, 0, 0.25, 0),
        ["CellPadding"] = UDim2.fromOffset(0, 0)
    })
    local v81 = u12.createElement
    local v82 = {
        ["Title"] = "# Reports"
    }
    local v83 = u23.ReportTicket.reports
    v82.Value = tostring(v83)
    local v84 = v81(v46, v82)
    local v85 = u12.createElement
    local v86 = {
        ["Title"] = "# Priority Reports"
    }
    local v87 = u23.ReportTicket.priorityReports
    v86.Value = tostring(v87)
    __set_list(v78, 1, {v79, v80, v84, v85(v46, v86)})
    local v88 = #v78
    local v89 = {
        ["Title"] = "# Punishments"
    }
    local v90 = u23.SuspectInfo
    if v90 ~= nil then
        v90 = v90.numPunishments
    end
    local v91 = v90 == nil and 0 or v90
    v89.Value = tostring(v91)
    v78[v88 + 1] = u12.createElement(v46, v89)
    v78[v88 + 2] = u12.createElement(v46, {
        ["Title"] = "Kit",
        ["Value"] = u18[v31].name
    })
    local v92 = {
        ["Title"] = "# Wins"
    }
    local v93 = u23.SuspectInfo
    if v93 ~= nil then
        v93 = v93.wins
    end
    v92.Value = tostring(v93)
    v78[v88 + 3] = u12.createElement(v46, v92)
    local v94 = {
        ["Title"] = "# Matches"
    }
    local v95 = u23.SuspectInfo
    if v95 ~= nil then
        v95 = v95.numMatchesPlayed
    end
    v94.Value = tostring(v95)
    v78[v88 + 4] = u12.createElement(v46, v94)
    local v96 = {
        ["Title"] = "W/L"
    }
    local v97 = u23.SuspectInfo
    if v97 ~= nil then
        v97 = v97.wlRatio
    end
    v96.Value = tostring(v97)
    v78[v88 + 5] = u12.createElement(v46, v96)
    local v98 = {
        ["Title"] = "K/D"
    }
    local v99 = u23.SuspectInfo
    if v99 ~= nil then
        v99 = v99.kdRatio
    end
    v98.Value = tostring(v99)
    v78[v88 + 6] = u12.createElement(v46, v98)
    local v100 = u23.QueueType
    if v100 then
        v100 = u12.createElement(v46, {
            ["Title"] = "QueueType",
            ["Value"] = u16[u23.QueueType].title
        })
    end
    if v100 then
        v78[v88 + 7] = v100
    end
    local v101 = #v78
    local v102 = u23.SuspectInfo
    if v102 then
        v102 = u12.createElement(v46, {
            ["Title"] = "BW Age",
            ["Value"] = v54(u23.SuspectInfo.bwAccAge)
        })
    end
    if v102 then
        v78[v101 + 1] = v102
    end
    local v103 = #v78
    v78[v103 + 1] = u12.createElement(v46, {
        ["Title"] = "First Reported",
        ["Value"] = DateTime.fromUnixTimestampMillis(u23.ReportTicket.firstReported):FormatUniversalTime("lll", "en-us")
    })
    v78[v103 + 2] = u12.createElement(v46, {
        ["Title"] = "Last Reported",
        ["Value"] = DateTime.fromUnixTimestampMillis(u23.ReportTicket.lastReported):FormatUniversalTime("lll", "en-us")
    })
    v60.SuspectStats = u12.createElement("Frame", v77, v78)
    v58.TopHudContainer = u12.createElement(u6, v59, v60)
    local v104 = u12.createElement
    local v105 = u6
    local v106 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.3)
    }
    local v107 = {}
    local v108 = u12.createElement("UIListLayout", {
        ["FillDirection"] = "Horizontal",
        ["HorizontalAlignment"] = "Center",
        ["VerticalAlignment"] = "Center",
        ["Padding"] = UDim.new(0.03, 0)
    })
    local v109
    if v26 then
        v109 = u12.createElement(u4, {
            ["Text"] = "<b>NEXT REPORT</b>",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.3, 1),
            ["BackgroundColor3"] = Color3.fromRGB(8, 224, 33),
            ["OnClick"] = function() --[[ Name: OnClick, Line 414 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u19
                --]]
                u2.resolveDependency("client/controllers/global/report/report-controller@ReportController"):getNextTicket()
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "<b>Retrieving next report ticket</b>",
                    ["image"] = u19.EASY_GAMES_LOGO
                })
            end
        })
    else
        v109 = u12.createFragment({ u12.createElement(u4, {
                ["Text"] = "<b>BAN</b>",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["BackgroundColor3"] = Color3.fromRGB(255, 34, 34),
                ["OnClick"] = function() --[[ Name: OnClick, Line 358 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                    --]]
                    u40()
                end
            }), u12.createElement(u4, {
                ["Text"] = "<b>SKIP</b>",
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["BackgroundColor3"] = Color3.fromRGB(35, 149, 255),
                ["OnClick"] = function() --[[ Name: OnClick, Line 367 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u22
                        [3] = u2
                        [4] = u20
                        [5] = u19
                        [6] = u5
                        [7] = u21
                        [8] = u23
                        [9] = u27
                    --]]
                    u10.Controllers.SpectateController:setSpectateMode(u22.ALL)
                    u2.resolveDependency("client/controllers/global/report/report-controller@ReportController"):resolveCurrentTicket(u20.PENDING)
                    local v110 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                    local v111 = {
                        ["image"] = u19.EASY_GAMES_LOGO
                    }
                    local v112 = u5.richTextColor(Color3.fromRGB(35, 149, 255))
                    local v113 = u5.richTextColor(u21.mcAqua)
                    local v114 = u23.SuspectInfo
                    if v114 ~= nil then
                        v114 = v114.displayName
                    end
                    v111.message = "<b><font color=\"" .. v112 .. "\">SKIPPED</font> <font color=\"" .. v113 .. "\">" .. tostring(v114) .. "</font></b>"
                    v110:sendInfoNotification(v111)
                    u27(true)
                end
            }), u12.createElement(u4, {
                ["Text"] = "<b>INNOCENT</b>",
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["BackgroundColor3"] = Color3.fromRGB(8, 224, 33),
                ["OnClick"] = function() --[[ Name: OnClick, Line 391 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u22
                        [3] = u2
                        [4] = u20
                        [5] = u19
                        [6] = u5
                        [7] = u21
                        [8] = u23
                        [9] = u27
                    --]]
                    u10.Controllers.SpectateController:setSpectateMode(u22.ALL)
                    u2.resolveDependency("client/controllers/global/report/report-controller@ReportController"):resolveCurrentTicket(u20.AQUITTED)
                    local v115 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                    local v116 = {
                        ["image"] = u19.EASY_GAMES_LOGO
                    }
                    local v117 = u5.richTextColor(u21.mcAqua)
                    local v118 = u23.SuspectInfo
                    if v118 ~= nil then
                        v118 = v118.displayName
                    end
                    v116.message = "<b>Resolved <font color=\"" .. v117 .. "\">" .. tostring(v118) .. "</font> as <font color=\"" .. u5.richTextColor(Color3.fromRGB(8, 224, 33)) .. "\">INNOCENT</font></b>"
                    v115:sendInfoNotification(v116)
                    u27(true)
                end
            }) })
    end
    __set_list(v107, 1, {v108, v109})
    v107.SpectateModeToggle = u12.createElement("ImageButton", {
        ["Size"] = UDim2.fromScale(0.1, 1),
        [u12.Event.Activated] = function() --[[ Line: 425 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u11
                [3] = u22
                [4] = u10
                [5] = u29
            --]]
            local v119 = (u28 + 1) % #u11.keys(u22)
            u10.Controllers.SpectateController:setSpectateMode(v119)
            u29(v119)
        end,
        ["BackgroundColor3"] = u21.mcGold,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 1
    }, {
        u12.createElement(u7, {
            ["Padding"] = {
                ["Horizontal"] = 10,
                ["Vertical"] = 6
            }
        }),
        u12.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        }),
        u12.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 4)
        }),
        u12.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.8),
            ["Image"] = u19.EYE_REGULAR
        }),
        u12.createElement("TextLabel", {
            ["AutomaticSize"] = "X",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Font"] = "Roboto",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0, 0.8),
            ["Text"] = "<b>" .. u22[u28] .. "</b>",
            ["TextColor3"] = u5.WHITE
        })
    })
    v58.ActionButtons = v104(v105, v106, v107)
    v56.OverwatchHud = u12.createElement(u6, v57, v58)
    return u12.createFragment({
        ["OverwatchHudGui"] = u12.createElement("ScreenGui", v55, v56)
    })
end)
return {
    ["OverwatchHud"] = v14.connect(function(p121, p122) --[[ Line: 474 ]]
        local v123 = {}
        for v124, v125 in p122 do
            v123[v124] = v125
        end
        v123.QueueType = p121.Game.queueType
        return v123
    end)(v120)
}