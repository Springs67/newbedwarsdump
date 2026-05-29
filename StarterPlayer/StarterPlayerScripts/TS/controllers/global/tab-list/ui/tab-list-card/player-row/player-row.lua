local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.OfflinePlayerUtil
local u9 = v3.Padding
local u10 = v3.UILayers
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local v17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render")
local u18 = v17.BWPlayerRender
local u19 = v17.PlayerRenderFallbackMode
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitArrayFromCommaSeparatedString
local u28 = v1.import(script, script.Parent, "player-name").PlayerName
local u29 = v1.import(script, script.Parent, "player-stats").PlayerStats
local v109 = v14.new(u13)(function(u30, p31) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u13
        [4] = u25
        [5] = u5
        [6] = u2
        [7] = u20
        [8] = u26
        [9] = u24
        [10] = u10
        [11] = u12
        [12] = u6
        [13] = u11
        [14] = u22
        [15] = u21
        [16] = u27
        [17] = u4
        [18] = u23
        [19] = u7
        [20] = u9
        [21] = u18
        [22] = u19
        [23] = u28
        [24] = u29
    --]]
    local v32 = p31.useState
    local v33 = p31.useEffect
    local u34, u35 = v32(false)
    local v36, u37 = v32(nil)
    local u38 = u16:GetPlayerByUserId(u30.Player.userId)
    local u39
    if u16.LocalPlayer then
        u39 = u30.Player.userId == u16.LocalPlayer.UserId
    else
        u39 = u30.Player.userId == u8.Dummy.oiogy.userId
    end
    local function v45(p40) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        local v41 = p40.BackgroundTransparency
        local v42 = p40.BackgroundColor3
        local v43 = u13.createFragment
        local v44 = {
            ["RowOverlay"] = u13.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundTransparency"] = v41,
                ["BackgroundColor3"] = v42
            })
        }
        return v43(v44)
    end
    local function v48() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u25
            [3] = u5
        --]]
        local v46 = u13.createFragment
        local v47 = {
            ["BottomDivider"] = u13.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, u25.rows.cards.card.playerRow.bottomBorderHeight),
                ["Position"] = UDim2.new(0, 0, 1, -1),
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["BackgroundTransparency"] = u25.bgTransparency.playerRow,
                ["BackgroundColor3"] = u5.hexColor(8159178)
            })
        }
        return v46(v47)
    end
    local function u53(u49) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u20
            [3] = u26
            [4] = u24
            [5] = u10
        --]]
        local v50 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        local v51 = u20.CONFIRMATION_MODAL
        local v52 = {
            ["Title"] = "Ban Player?",
            ["Body"] = "Are you sure you want to permanantly ban this player?",
            ["PrimaryBtnProps"] = {
                ["Text"] = "BAN",
                ["BackgroundColor3"] = u26.backgroundError
            },
            ["SecondaryBtnProps"] = {
                ["Text"] = "CANCEL"
            },
            ["OnPrimaryBtnClick"] = function() --[[ Name: OnPrimaryBtnClick, Line 74 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u49
                    [3] = u2
                --]]
                u24.Client:Get("BanPlayer"):CallServerAsync(u49)
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "Banned " .. u49.DisplayName
                })
            end,
            ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 80 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u10
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u10.OVERLAY)
            end
        }
        v50:openApp(v51, v52)
    end
    v33(function() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u6
            [3] = u11
            [4] = u22
            [5] = u21
            [6] = u16
            [7] = u30
            [8] = u27
            [9] = u37
        --]]
        local u54 = u12.new()
        u54:GiveTask(task.spawn(function() --[[ Line: 87 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u11
                [3] = u22
                [4] = u21
                [5] = u16
                [6] = u30
                [7] = u27
                [8] = u37
                [9] = u54
            --]]
            local v55 = u6.isHoarceKat() and { false, nil } or { u11.Controllers.MatchController:getQueueTypeAsync():await() }
            local v56 = v55[1]
            local v57 = v55[2]
            if v56 and v57 then
                if u22(v57).game == u21.COMBINED_KIT then
                    local u58 = u16:GetPlayerByUserId(u30.Player.userId)
                    if not u58 then
                        return nil
                    end
                    local v59 = u58:GetAttribute("PlayingAsKits")
                    if v59 ~= "" and v59 then
                        u37((u27(v59)))
                    end
                    u54:GiveTask(u58:GetAttributeChangedSignal("PlayingAsKits"):Connect(function() --[[ Line: 108 ]]
                        --[[
                        Upvalues:
                            [1] = u58
                            [2] = u27
                            [3] = u37
                        --]]
                        local v60 = u58:GetAttribute("PlayingAsKits")
                        if v60 ~= "" and v60 then
                            u37((u27(v60)))
                        end
                    end))
                else
                    u37(u30.PlayerKit and { u30.PlayerKit } or nil)
                end
            else
                return nil
            end
        end))
    end, { u30.PlayerKit })
    local function v98() --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u13
            [3] = u6
            [4] = u4
            [5] = u2
            [6] = u30
            [7] = u8
            [8] = u23
            [9] = u26
            [10] = u11
            [11] = u53
            [12] = u24
            [13] = u7
            [14] = u9
            [15] = u18
            [16] = u19
            [17] = u38
        --]]
        local v61 = not u39
        if v61 then
            local v62 = {
                ["AutomaticSize"] = "Y",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 30)
            }
            local v68 = {
                u13.createElement("UIListLayout", {
                    ["SortOrder"] = "LayoutOrder",
                    ["VerticalAlignment"] = "Center",
                    ["FillDirection"] = u6.isSmallScreen() and "Vertical" or "Horizontal",
                    ["Padding"] = UDim.new(0, 4)
                }),
                ["ReportPlayerButton"] = u13.createElement(u4, {
                    ["Text"] = "<b>REPORT</b>",
                    ["ZIndex"] = 20,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(u6.isSmallScreen() and 1 or 0.5, -4, 0, 30),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 134 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u30
                            [3] = u8
                            [4] = u23
                        --]]
                        if u2.resolveDependency("client/controllers/global/report/report-controller@ReportController"):reportPlayer(u30.Player.userId) then
                            local v63 = u8.getPlayer(u30.Player)
                            local v64 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                            local v65 = {}
                            local v66 = "Reported "
                            local v67
                            if v63 then
                                v67 = u23.getGamePlayer(v63):getDisplayName()
                            else
                                v67 = u30.Player.displayName
                            end
                            v65.message = v66 .. v67
                            v64:sendInfoNotification(v65)
                        end
                    end,
                    ["BackgroundColor3"] = u26.backgroundSecondary,
                    ["CornerRadius"] = UDim.new(0, 0)
                })
            }
            local v69 = #v68
            local v70 = not u6.isHoarceKat() and u11.Controllers.PermissionController:hasAnyPermissions({ "anticheat_mod", "admin", "artist" })
            if v70 then
                local v71 = u13.createFragment
                local v73 = {
                    ["BanPlayerButton"] = u13.createFragment({
                        ["BanPlayerButton"] = u13.createElement(u4, {
                            ["Text"] = "<b>BAN</b>",
                            ["ZIndex"] = 20,
                            ["LayoutOrder"] = 2,
                            ["Size"] = UDim2.new(u6.isSmallScreen() and 1 or 0.25, -4, 0, 30),
                            ["OnClick"] = function() --[[ Name: OnClick, Line 155 ]]
                                --[[
                                Upvalues:
                                    [1] = u8
                                    [2] = u30
                                    [3] = u53
                                --]]
                                local v72 = u8.getPlayer(u30.Player)
                                if v72 then
                                    u53(v72)
                                end
                            end,
                            ["BackgroundColor3"] = u26.mcRed,
                            ["CornerRadius"] = UDim.new(0, 0)
                        })
                    })
                }
                local v74 = u13.createFragment
                local v76 = {
                    ["KickPlayerButton"] = u13.createElement(u4, {
                        ["Text"] = "<b>KICK</b>",
                        ["ZIndex"] = 20,
                        ["LayoutOrder"] = 3,
                        ["Size"] = UDim2.new(u6.isSmallScreen() and 1 or 0.25, -4, 0, 30),
                        ["OnClick"] = function() --[[ Name: OnClick, Line 171 ]]
                            --[[
                            Upvalues:
                                [1] = u8
                                [2] = u30
                                [3] = u24
                            --]]
                            local v75 = u8.getPlayer(u30.Player)
                            if v75 then
                                u24.Client:Get("KickPlayer"):CallServerAsync(v75)
                            end
                        end,
                        ["BackgroundColor3"] = u26.mcGold,
                        ["CornerRadius"] = UDim.new(0, 0)
                    })
                }
                v73.KickPlayerButton = v74(v76)
                v70 = v71(v73)
            end
            if v70 then
                v68[v69 + 1] = v70
            end
            v61 = u13.createFragment({
                ["ActionButtonsRow"] = u13.createElement(u7, v62, v68)
            })
        end
        local v77 = {
            ["AutomaticSize"] = "Y",
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 20,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0, 40),
            ["Position"] = UDim2.fromScale(0, 1),
            ["BackgroundColor3"] = u26.backgroundTertiary
        }
        local v78 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            }), (u13.createElement(u9, {
                ["Padding"] = UDim.new(0, 8)
            })) }
        local v79 = u13.createElement
        local v80 = u7
        local v81 = {
            ["ZIndex"] = 20,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 30)
        }
        local v82 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 6)
            }), (u13.createElement(u18, {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 20,
                ["FallbackMode"] = u19.NONE,
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["PlayerUserId"] = u30.Player.userId
            })) }
        local v83 = u13.createElement
        local v84 = u7
        local v85 = {
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 20,
            ["Size"] = UDim2.new(0.5, 0, 1, 0)
        }
        local v86 = { (u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.15, 0)
            })) }
        local v87 = u13.createElement
        local v88 = u7
        local v89 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.65, 0)
        }
        local v90 = {
            u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder"
            }),
            ["@"] = u13.createElement("TextLabel", {
                ["Text"] = "@",
                ["BackgroundTransparency"] = 1,
                ["AutomaticSize"] = "X",
                ["BorderSizePixel"] = 0,
                ["AutoLocalize"] = false,
                ["TextSize"] = 16,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 20,
                ["Size"] = UDim2.new(0, 0, 1, 0),
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextColor3"] = Color3.fromRGB(0, 217, 255)
            })
        }
        local v91 = u13.createElement
        local v92 = "TextBox"
        local v93 = {
            ["PlaceholderText"] = ""
        }
        local v94
        if u38 then
            v94 = u23.getGamePlayer(u38):getUsername()
        else
            v94 = u30.Player.name
        end
        v93.Text = v94
        v93.BackgroundTransparency = 1
        v93.Size = UDim2.new(1, 0, 1, 0)
        v93.BorderSizePixel = 0
        v93.AutoLocalize = false
        v93.TextScaled = true
        v93.Font = Enum.Font.SourceSansBold
        v93.TextColor3 = Color3.fromRGB(0, 217, 255)
        v93.TextXAlignment = "Left"
        v93.LayoutOrder = 2
        v93.TextEditable = false
        v93.ClearTextOnFocus = false
        v93.ZIndex = 20
        v93[u13.Change.Text] = function(p95) --[[ Line: 279 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u23
                [3] = u30
            --]]
            local v96
            if u38 then
                v96 = u23.getGamePlayer(u38):getUsername()
            else
                v96 = u30.Player.name
            end
            p95.Text = v96
        end
        v90.PlayerUsername = v91(v92, v93)
        v86.PlayerUsername = v87(v88, v89, v90)
        v82.PlayerNames = v83(v84, v85, v86)
        v78.PlayerInfo = v79(v80, v81, v82)
        local v97 = #v78
        if v61 then
            v78[v97 + 1] = v61
        end
        return u13.createFragment({
            ["PlayerDropdown"] = u13.createElement("Frame", v77, v78)
        })
    end
    local v99 = {
        ["AutomaticSize"] = "Y",
        ["Size"] = UDim2.new(1, 0, 0, 0)
    }
    local v100
    if u30.IsEliminated then
        v100 = u30.LayoutOrder + 100
    else
        v100 = u30.LayoutOrder
    end
    v99.LayoutOrder = v100
    local v101 = {}
    local v102 = #v101
    local v103
    if u30.IsEliminated then
        v103 = u13.createElement(v45, {
            ["BackgroundTransparency"] = 0.3,
            ["BackgroundColor3"] = u5.BLACK
        })
    elseif u39 then
        v103 = u13.createElement(v45, {
            ["BackgroundTransparency"] = 0.3,
            ["BackgroundColor3"] = u5.WHITE
        })
    else
        v103 = nil
    end
    if v103 then
        v101[v102 + 1] = v103
    end
    local v104 = #v101
    local v105 = {
        ["AutomaticSize"] = "Y",
        ["Size"] = UDim2.new(1, 0, 0, 0)
    }
    local v106 = {
        u13.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 0)
        }),
        ["PlayerRow"] = u13.createElement("ImageButton", {
            ["Size"] = UDim2.new(1, 0, 0, u30.LastRow and 0 or -1),
            ["AutomaticSize"] = "Y",
            ["BackgroundTransparency"] = 1,
            ["AutoButtonColor"] = false,
            [u13.Event.Activated] = function(_) --[[ Line: 329 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u34
                --]]
                u35(not u34)
            end,
            ["LayoutOrder"] = 1
        }, {
            u13.createElement("UISizeConstraint", {
                ["MaxSize"] = u25.maxRowSize,
                ["MinSize"] = Vector2.new(0, 0)
            }),
            u13.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }),
            u13.createElement(u28, {
                ["Player"] = u30.Player,
                ["Kits"] = v36,
                ["IsEarlyLeave"] = u30.IsLeave,
                ["ContentTransparency"] = u30.IsEliminated and 0.6 or nil
            }),
            u13.createElement(u29, {
                ["Player"] = u30.Player,
                ["Team"] = u30.Team,
                ["Kills"] = u30.Kills,
                ["Eliminated"] = u30.IsEliminated,
                ["ShowStats"] = u30.GameType == u21.BEDWARS
            })
        })
    }
    local v107 = #v106
    if u34 then
        u34 = u13.createElement(v98)
    end
    if u34 then
        v106[v107 + 1] = u34
    end
    v101.Content = u13.createElement(u7, v105, v106)
    local v108 = not u30.LastRow
    if v108 then
        v108 = u13.createElement(v48)
    end
    if v108 then
        v101[v104 + 1] = v108
    end
    return u13.createFragment({
        ["PlayerRowContainer"] = u13.createElement(u7, v99, v101)
    })
end)
return {
    ["PlayerRow"] = v15.connect(function(p110, p111) --[[ Line: 375 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u22
            [3] = u16
        --]]
        local v112 = p110.Bedwars.finalDeaths[p111.Player.userId]
        local v113 = p110.Bedwars.kills[p111.Player.userId]
        local v114 = u21.BEDWARS
        local v115 = p110.Game.queueType
        if v115 then
            if u22(v115).disableTablistStats then
                v112 = false
                v113 = 0
            end
            v114 = u22(v115).game
        end
        local v116 = {}
        for v117, v118 in p111 do
            v116[v117] = v118
        end
        v116.IsEliminated = v112
        v116.IsLeave = not u16:GetPlayerByUserId(p111.Player.userId)
        v116.PlayerKit = p110.Bedwars.kits[p111.Player.userId]
        v116.Kills = v113
        v116.BedStatus = p110.Bedwars.teamBedStatus[p111.Team.id]
        v116.GameType = v114
        return v116
    end)(v109)
}