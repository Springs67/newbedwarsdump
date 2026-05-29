local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.ColorUtil
local u6 = v3.Countdown
local u7 = v3.DeviceUtil
local u8 = v3.Empty
local u9 = v3.EmptyButton
local u10 = v3.Padding
local u11 = v3.ResetTime
local u12 = v3.SlideIn
local u13 = v3.SoundManager
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-list").RewardList
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-meta").getQueueGroupMeta
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta")
local u27 = v26.getQueueMeta
local u28 = v26.QueueMeta
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-playlist", "playlist")
local u30 = v29.PLAYLIST_QUEUES_ENABLED
local u31 = v29.queuePlaylistManager
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-meta").KeyMeta
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v37 = v1.import(script, script.Parent, "lobby-play-menu-pages")
local u38 = v37.getFilteredQueueVariant
local u39 = v37.getLobbyPlayMenuPage
local u40 = v37.getLobbyPlayMenuPageMeta
local u41 = v37.LobbyPlayMenuPage
local u42 = v37.mapQueueVariants
local u43 = v37.QueueVariantType
local u44 = v1.import(script, script.Parent, "play-menu-card-container").PlayMenuCardContainer
local v218 = v17.new(u16)(function(u45, p46) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u41
        [2] = u16
        [3] = u15
        [4] = u19
        [5] = u13
        [6] = u36
        [7] = u2
        [8] = u23
        [9] = u35
        [10] = u40
        [11] = u7
        [12] = u22
        [13] = u5
        [14] = u8
        [15] = u20
        [16] = u33
        [17] = u24
        [18] = u42
        [19] = u43
        [20] = u25
        [21] = u39
        [22] = u38
        [23] = u31
        [24] = u27
        [25] = u14
        [26] = u32
        [27] = u11
        [28] = u10
        [29] = u4
        [30] = u6
        [31] = u30
        [32] = u28
        [33] = u34
        [34] = u44
        [35] = u9
        [36] = u12
        [37] = u21
    --]]
    local v47 = p46.useState
    local v48 = p46.useEffect
    local v49 = p46.useMemo
    local v50, u51 = v47(nil)
    local u52, u53 = v47(u45.Page or u41.GAME_SELECT)
    local u54 = u16.createRef()
    local u55 = u16.createRef()
    v48(function() --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        u51(nil)
    end, { u52 })
    v48(function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u55
            [3] = u15
            [4] = u19
        --]]
        local u56 = u54:getValue()
        local u57 = u55:getValue()
        local u58 = u15.new()
        if u56 then
            u56.Position = UDim2.fromScale(0.3, 0.6)
            u56.TextTransparency = 1
            task.delay(0.1, function() --[[ Line: 65 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u56
                    [3] = u58
                --]]
                local u59 = UDim2.fromScale(0.5, 0.6)
                local u60 = u19:Create(u56, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ["TextTransparency"] = 0,
                    ["Position"] = u59
                })
                u60:Play()
                u58:GiveTask(function() --[[ Line: 72 ]]
                    --[[
                    Upvalues:
                        [1] = u60
                        [2] = u56
                        [3] = u59
                    --]]
                    u60:Cancel()
                    u60:Destroy()
                    u56.Position = u59
                end)
            end)
        end
        if u57 then
            u57.Position = UDim2.fromScale(0.3, 1)
            u57.TextTransparency = 1
            local u61 = UDim2.fromScale(0.5, 1)
            local u62 = u19:Create(u57, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                ["TextTransparency"] = 0,
                ["Position"] = u61
            })
            u62:Play()
            u58:GiveTask(function() --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u62
                    [2] = u57
                    [3] = u61
                --]]
                u62:Cancel()
                u62:Destroy()
                u57.Position = u61
            end)
        end
        return function() --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u58
            --]]
            u58:DoCleaning()
        end
    end, { u52 })
    local u63 = nil
    local function v64() --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u63
            [2] = u53
            [3] = u13
            [4] = u36
        --]]
        if u63.parentPage then
            u53(u63.parentPage)
        end
        u13:playSound(u36.UI_CLOSE_2)
    end
    local function v65() --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u23
            [3] = u13
            [4] = u36
            [5] = u52
            [6] = u41
            [7] = u35
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u23.LOBBY_PLAY_MENU_APP)
        u13:playSound(u36.UI_CLOSE_2)
        if u52 == u41.WELCOME then
            u35.Client:Get("RespondedToTutorialPrompt"):CallServer(false)
        end
    end
    u63 = u40(u52)
    local v66 = u63.HorizontalAlignment or Enum.HorizontalAlignment.Left
    local v67 = u63.maxCellCount
    local v68 = v67 == nil and 5 or v67
    local v69 = u7.isSmallScreen()
    local u70 = u63
    local v71 = {}
    local v72 = {}
    for v73, v74 in u22.BACKGROUND_BLUR_PRESET do
        v71[v73] = v74
    end
    v71.OnClick = v65
    v72.Background = v71
    v72.ExitButton = {
        ["OnClick"] = v65
    }
    v72.BackButton = {
        ["ShouldShow"] = u70.parentPage ~= nil,
        ["OnClick"] = v64
    }
    local v75 = {}
    local v76 = #v75
    local v77 = {}
    local _ = #v77
    local v78 = {
        ["Size"] = UDim2.fromScale(0.9, 0.85),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v79 = {}
    local _ = #v79
    local v80 = {
        ["Size"] = UDim2.fromScale(1, v69 and 0.25 or 0.2)
    }
    local v81 = {}
    local v82 = #v81
    local v83
    if u70.subtitle == nil then
        v83 = false
    else
        local v84 = u16.createFragment
        local v85 = {}
        local v86 = u16.createElement
        local v87 = "TextLabel"
        local v88 = {
            [u16.Ref] = u54,
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.6),
            ["Size"] = UDim2.fromScale(1, 0.65),
            ["Text"] = u70.subtitle.Text,
            ["TextScaled"] = true,
            ["TextColor3"] = u70.subtitle.Color3 or u5.WHITE
        }
        local v89
        if v66 == Enum.HorizontalAlignment.Left then
            v89 = Enum.TextXAlignment.Left
        elseif v66 == Enum.HorizontalAlignment.Center then
            v89 = Enum.TextXAlignment.Center
        else
            v89 = Enum.TextXAlignment.Right
        end
        v88.TextXAlignment = v89
        v88.TextYAlignment = Enum.TextYAlignment.Center
        v88.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v88.BackgroundTransparency = 1
        v88.TextTransparency = 0
        v85.HeaderSubtitle = v86(v87, v88, { u16.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
            }) })
        v83 = v84(v85)
    end
    if v83 then
        v81[v82 + 1] = v83
    end
    local _ = #v81
    local v90 = u16.createElement
    local v91 = "TextLabel"
    local v92 = {
        [u16.Ref] = u55,
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 1),
        ["Size"] = UDim2.fromScale(1, 0.75),
        ["Text"] = u70.title,
        ["TextScaled"] = true,
        ["TextColor3"] = u5.WHITE
    }
    local v93
    if v66 == Enum.HorizontalAlignment.Left then
        v93 = Enum.TextXAlignment.Left
    elseif v66 == Enum.HorizontalAlignment.Center then
        v93 = Enum.TextXAlignment.Center
    else
        v93 = Enum.TextXAlignment.Right
    end
    v92.TextXAlignment = v93
    v92.TextYAlignment = Enum.TextYAlignment.Center
    v92.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v92.BackgroundTransparency = 1
    v92.TextTransparency = 0
    v81.HeaderTitle = v90(v91, v92, { u16.createElement("UIGradient", {
            ["Rotation"] = 90,
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u5.WHITE), ColorSequenceKeypoint.new(1, u5.darken(u5.WHITE, 0.6)) }),
            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
        }) })
    v79.Header = u16.createElement(u8, v80, v81)
    local v94 = {
        ["Size"] = UDim2.fromScale(1, 0.775),
        ["Position"] = UDim2.fromScale(0, v69 and 0.25 or 0.2)
    }
    local v95 = {}
    local v96 = #v95
    local v97 = {
        ["Size"] = UDim2.fromScale(1, v69 and 0.9 or 0.7)
    }
    local v98 = {}
    local v99 = #v98
    local v100
    if u52 == u41.WELCOME then
        v100 = u16.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["Transparency"] = 0.5,
            ["Size"] = UDim2.fromScale(0.25, 1),
            ["BackgroundColor3"] = u5.BLACK
        }, { u16.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 2)
            }), u16.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingRight"] = UDim.new(0.1, 0),
                ["PaddingTop"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0)
            }), u16.createElement(u8, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u16.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.03, 0),
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                }), u16.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["LineHeight"] = 1.05,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.45),
                    ["Text"] = "Complete Tutorial for <font color=\"" .. u5.richTextColor(Color3.fromRGB(255, 222, 64)) .. "\"><b>FREE</b></font> rewards!",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }), u16.createElement(u8, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.5)
                }, { u16.createElement(u20, {
                        ["CellSize"] = UDim2.new(0, 68, 0, 68),
                        ["CellPadding"] = UDim2.new(0, 12, 0, 12),
                        ["Rewards"] = {
                            {
                                ["title"] = u33.SCHOLAR
                            },
                            {
                                ["consumable"] = {
                                    ["amount"] = 1,
                                    ["consumableType"] = u24.KIT_RENTAL_BEGINNER
                                }
                            }
                        }
                    }) }) }) })
    else
        v100 = false
    end
    if v100 then
        v98[v99 + 1] = v100
    end
    local _ = #v98
    local v101 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v102 = { u16.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.05),
            ["PaddingBottom"] = UDim.new(0.05)
        }), u16.createElement("UIGridLayout", {
            ["CellSize"] = UDim2.fromScale((1 - 0.015 * (v68 - 1)) / v68, 1),
            ["CellPadding"] = UDim2.fromScale(0.015, 0),
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["FillDirectionMaxCells"] = v68,
            ["HorizontalAlignment"] = v66
        }) }
    local v103 = #v102
    for v215, v216 in v49(function() --[[ Line: 285 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u70
            [3] = u5
            [4] = u43
            [5] = u25
            [6] = u39
            [7] = u40
            [8] = u38
            [9] = u31
            [10] = u27
            [11] = u53
            [12] = u14
            [13] = u32
            [14] = u45
            [15] = u11
            [16] = u16
            [17] = u10
            [18] = u4
            [19] = u6
            [20] = u30
            [21] = u28
            [22] = u7
            [23] = u34
            [24] = u13
            [25] = u36
            [26] = u51
            [27] = u52
            [28] = u44
        --]]
        local u104 = 0
        local v105 = u42(u70.queueCardVariants)
        local function v211(p106) --[[ Line: 288 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u43
                [3] = u25
                [4] = u39
                [5] = u40
                [6] = u38
                [7] = u31
                [8] = u27
                [9] = u53
                [10] = u14
                [11] = u32
                [12] = u45
                [13] = u11
                [14] = u16
                [15] = u10
                [16] = u4
                [17] = u6
                [18] = u30
                [19] = u28
                [20] = u7
                [21] = u34
                [22] = u13
                [23] = u36
                [24] = u51
                [25] = u104
                [26] = u52
                [27] = u44
            --]]
            local function v204(p107, _) --[[ Line: 291 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u43
                    [3] = u25
                    [4] = u39
                    [5] = u40
                    [6] = u38
                    [7] = u31
                    [8] = u27
                    [9] = u53
                    [10] = u14
                    [11] = u32
                    [12] = u45
                    [13] = u11
                    [14] = u16
                    [15] = u10
                    [16] = u4
                    [17] = u6
                    [18] = u30
                    [19] = u28
                    [20] = u7
                    [21] = u34
                    [22] = u13
                    [23] = u36
                    [24] = u51
                    [25] = u104
                --]]
                local v108 = {}
                local u109 = {
                    ["CardData"] = v108
                }
                local v110 = nil
                local v111 = nil
                local function v132(p112) --[[ Line: 298 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                    --]]
                    local v113 = p112.description
                    if v113 ~= nil then
                        v113 = v113.overridePlayMenuDescription
                    end
                    if v113 then
                        return p112.description.text
                    end
                    local v114
                    if #p112.teams > 0 then
                        v114 = p112.teams[1].maxPlayers
                    else
                        v114 = nil
                    end
                    local v115 = #p112.teams
                    local v116 = tostring(v115)
                    local v117 = "<font color=\"" .. u5.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. v116 .. "</font>"
                    local v118 = v114 ~= nil
                    if v118 then
                        v118 = true
                        for v119, v120 in p112.teams do
                            local _ = v119 - 1
                            if v120.maxPlayers ~= v114 then
                                v118 = false
                                break
                            end
                        end
                    end
                    local v121
                    if v118 then
                        local v122 = p112.teams[1].maxPlayers
                        local v123 = tostring(v122)
                        v121 = "\n\240\159\153\141\226\128\141\226\153\130\239\184\143 Players Per Team: " .. "<font color=\"" .. u5.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. v123 .. "</font>"
                    else
                        v121 = ""
                    end
                    local v124 = p112.queueSize.max
                    local v125 = tostring(v124)
                    local v126 = "<font color=\"" .. u5.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. v125 .. "</font>"
                    local v127 = p112.teams
                    local v128 = 0
                    for v129 = 1, #v127 do
                        local v130 = v127[v129]
                        local _ = v129 - 1
                        v128 = v128 + v130.maxPlayers
                    end
                    local v131 = tostring(v128)
                    return "\240\159\165\138 Teams: " .. v117 .. v121 .. "\n\240\159\142\137 Max Party Size: " .. v126 .. "\n\240\159\143\152\239\184\143 Max Players: " .. ("<font color=\"" .. u5.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. v131 .. "</font>") .. (p112.description == nil and "" or "\n" .. p112.description.text)
                end
                if p107.queueVariantType == u43.QUEUE_GROUP_TYPE then
                    local v133 = u25(p107.queueGroupType)
                    v111 = v133.helperIcons
                    local v134 = 0
                    local v135 = {}
                    for v136, v137 in u40((u39(p107.queueGroupType))).queueCardVariants do
                        local _ = v136 - 1
                        local v138 = u38(v137)
                        if v138 ~= nil then
                            v134 = v134 + 1
                            v135[v134] = v138
                        end
                    end
                    local function v145(p139, p140) --[[ Line: 368 ]]
                        --[[
                        Upvalues:
                            [1] = u31
                            [2] = u27
                        --]]
                        local v141 = nil
                        if p140.queueType then
                            v141 = p140.queueType
                        elseif p140.queuePlaylistId then
                            v141 = u31:getPlaylists()[p140.queuePlaylistId]:getCurrQueue()
                        end
                        if not v141 then
                            return p139
                        end
                        local v142 = u27(v141).backgroundImageRender
                        if v142 ~= nil then
                            for v143, v144 in v142 do
                                local _ = v143 - 1
                                if table.find(p139, v144) == nil then
                                    table.insert(p139, v144)
                                end
                            end
                        end
                        return p139
                    end
                    local v146 = {}
                    for v147 = 1, #v135 do
                        v146 = v145(v146, v135[v147], v147 - 1, v135)
                    end
                    v108.title = v133.title
                    local v148 = #v135
                    v108.subtitle = tostring(v148) .. " QUEUES"
                    v108.description = v133.description
                    v108.backgroundImages = v146
                    function u109.OnClick(p149, _) --[[ Line: 410 ]]
                        --[[
                        Upvalues:
                            [1] = u39
                            [2] = u53
                        --]]
                        local v150 = u39(p149.queueGroupType)
                        if v150 then
                            u53(v150)
                        end
                    end
                elseif p107.queueVariantType == u43.QUEUE_TYPE then
                    local v151 = u27(p107.queueType)
                    v110 = v151.playerLevelReq
                    v111 = v151.helperIcons
                    v108.title = string.upper(v151.title)
                    v108.description = v132(v151)
                    v108.backgroundImages = v151.backgroundImageRender
                    function u109.OnClick(p152, _) --[[ Line: 428 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                        --]]
                        u14.Controllers.QueueController:joinQueue(p152.queueType)
                    end
                    local v153 = v151.requiredKeys
                    if v153 ~= nil then
                        v153 = v153[1]
                    end
                    if v153 then
                        local v154 = u32[v153.keyType]
                        local v155 = u45.KeysData[v153.keyType]
                        v155 = v155
                        if v155 ~= nil then
                            local v156 = v155.keyRegenStartTime
                        end
                        local v157 = nil
                        local v158
                        if v156 == 0 or (v156 ~= v156 or not v156) then
                            v158 = v156
                        else
                            v158 = v154.keyRegen
                        end
                        if v158 ~= 0 and (v158 == v158 and v158) then
                            v157 = u11.new(v156):getNextResetTime(v154.keyRegen.cooldown)
                        end
                        local v159 = {
                            ["BackgroundTransparency"] = 0.2,
                            ["BorderSizePixel"] = 0,
                            ["ZIndex"] = 10,
                            ["Size"] = UDim2.new(1, 0, 0, 20),
                            ["Position"] = UDim2.fromScale(0.5, 0.98),
                            ["AnchorPoint"] = Vector2.new(0.5, 0),
                            ["BackgroundColor3"] = u5.BLACK
                        }
                        local v160 = { u16.createElement("UICorner", {
                                ["CornerRadius"] = UDim.new(0, 10)
                            }), u16.createElement(u10, {
                                ["Padding"] = UDim.new(0, 4)
                            }), u16.createElement("UIListLayout", {
                                ["FillDirection"] = "Horizontal",
                                ["HorizontalAlignment"] = "Center",
                                ["VerticalAlignment"] = "Center",
                                ["Padding"] = UDim.new(0, 0)
                            }) }
                        local v161 = #v160
                        local v162 = {}
                        if v155 ~= nil then
                            v155 = v155.amount
                        end
                        local v163 = v155 == nil and 0 or v155
                        local v164 = v154.maxAmount
                        local v165 = tostring(v163)
                        local v166
                        if v164 == 0 or (v164 ~= v164 or not v164) then
                            v166 = ""
                        else
                            local v167 = v154.maxAmount
                            v166 = "/" .. tostring(v167) .. " "
                        end
                        v162.Text = v165 .. v166 .. " KEYS "
                        v162.TextSize = 14
                        v162.Font = Enum.Font.SourceSansBold
                        v162.TextYAlignment = Enum.TextYAlignment.Top
                        v162.TextColor3 = Color3.fromRGB(250, 254, 16)
                        v162.ZIndex = 12
                        v160[v161 + 1] = u16.createElement(u4, v162)
                        local v168
                        if v157 == nil then
                            v168 = false
                        else
                            v168 = u16.createElement(u6, {
                                ["PreText"] = "<b>| IN: </b>",
                                ["EndTime"] = v157,
                                ["TextLabel"] = {
                                    ["ZIndex"] = 12,
                                    ["Size"] = UDim2.fromScale(0.45, 1)
                                },
                                ["CountdownConfig"] = {
                                    ["days"] = false
                                }
                            })
                        end
                        if v168 then
                            v160[v161 + 2] = v168
                        end
                        v108.AbsolutePosElements = { u16.createFragment({
                                ["NextQueue"] = u16.createElement("Frame", v159, v160)
                            }) }
                    end
                    local v169 = v151.endTime
                    if v169 ~= 0 and (v169 == v169 and v169) then
                        v108.AbsolutePosElements = { u16.createFragment({
                                ["NextQueue"] = u16.createElement("Frame", {
                                    ["BackgroundTransparency"] = 0.2,
                                    ["BorderSizePixel"] = 0,
                                    ["ZIndex"] = 10,
                                    ["Size"] = UDim2.new(1, 0, 0, 20),
                                    ["Position"] = UDim2.fromScale(0.5, 0.1),
                                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                                    ["BackgroundColor3"] = u5.BLACK
                                }, { u16.createElement(u10, {
                                        ["Padding"] = UDim.new(0, 3)
                                    }), u16.createElement(u6, {
                                        ["PreText"] = "<font transparency=\".3\">Closes in: </font>",
                                        ["OnCompleteText"] = "Queue Closed",
                                        ["EndTime"] = v151.endTime,
                                        ["CountdownConfig"] = {
                                            ["seperator"] = ":",
                                            ["days"] = true,
                                            ["hours"] = true,
                                            ["minutes"] = true,
                                            ["seconds"] = true
                                        },
                                        ["TextLabel"] = {
                                            ["ZIndex"] = 12,
                                            ["Size"] = UDim2.fromScale(1, 1)
                                        }
                                    }) })
                            }) }
                    end
                elseif p107.queueVariantType == u43.QUEUE_PLAYLIST then
                    if not u30 then
                        return nil
                    end
                    local v170 = u31:getPlaylists()[p107.queuePlaylistId]
                    local v171 = v170:getCurrQueue()
                    local v172 = v170:getConfig()
                    if v172 ~= nil then
                        v172 = v172.name
                    end
                    local v173 = u28[v171]
                    local v174 = ""
                    local v175 = v174
                    for v176, v177 in v170:getQueues() do
                        local _ = v176 - 1
                        v174 = v175 .. u28[v177].title .. "\n"
                        v175 = v174
                    end
                    v110 = v173.playerLevelReq
                    v111 = v173.helperIcons
                    v108.title = v173.title
                    v108.subtitle = v172 == nil and "LTM" or v172
                    v108.description = v132(v173)
                    v108.backgroundImages = v173.backgroundImageRender
                    function u109.OnClick(p178, _) --[[ Line: 586 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                        --]]
                        u14.Controllers.QueuePlaylistController:queueForPlaylist(p178.queuePlaylistId)
                    end
                    v108.AbsolutePosElements = { u16.createFragment({
                            ["NextQueue"] = u16.createElement("Frame", {
                                ["BackgroundTransparency"] = 0.2,
                                ["BorderSizePixel"] = 0,
                                ["ZIndex"] = 10,
                                ["Size"] = UDim2.new(1, 0, 0, 20),
                                ["Position"] = UDim2.fromScale(0.5, 0.98),
                                ["AnchorPoint"] = Vector2.new(0.5, 0),
                                ["BackgroundColor3"] = u5.BLACK
                            }, {
                                u16.createElement("UICorner", {
                                    ["CornerRadius"] = UDim.new(0, 10)
                                }),
                                u16.createElement(u10, {
                                    ["Padding"] = UDim.new(0, 4)
                                }),
                                u16.createElement("UIListLayout", {
                                    ["FillDirection"] = "Horizontal",
                                    ["HorizontalAlignment"] = "Center",
                                    ["VerticalAlignment"] = "Center",
                                    ["Padding"] = UDim.new(0, 0)
                                }),
                                u16.createElement(u6, {
                                    ["EndTime"] = v170:getNextRotationTime(),
                                    ["TextLabel"] = {
                                        ["ZIndex"] = 12,
                                        ["Size"] = UDim2.fromScale(0.9, 1)
                                    },
                                    ["PreText"] = u28[v170:getNextQueue()].title .. " in: ",
                                    ["CountdownConfig"] = {
                                        ["days"] = false,
                                        ["hours"] = true,
                                        ["minutes"] = true,
                                        ["seconds"] = true
                                    }
                                })
                            })
                        }) }
                end
                local u179 = p107.cardProps or {}
                local v180
                if u179 == nil then
                    v180 = u179
                else
                    v180 = u179.CardData
                end
                local v181 = v180 == nil and {} or v180
                if v110 ~= nil then
                    local v182
                    if u7.isHoarceKat() then
                        v182 = 0
                    else
                        local v183 = u14.Controllers.PlayerLevelController:getPlayerLevel()
                        v182 = v183 == nil and 0 or v183
                    end
                    if v182 < v110 then
                        if p107.queueType ~= u34.activeRankMeta.queueType then
                            function u179.OnClick(_) --[[ Line: 654 ]]
                                --[[
                                Upvalues:
                                    [1] = u13
                                    [2] = u36
                                --]]
                                u13:playSound(u36.UI_ERROR)
                                return nil
                            end
                        end
                    else
                        v110 = nil
                    end
                end
                function u109.OnHover(_, p184) --[[ Line: 664 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                        [2] = u5
                    --]]
                    local v185
                    if p184 == nil then
                        v185 = p184
                    else
                        v185 = p184.description
                    end
                    if v185 == "" then
                        v185 = false
                    end
                    local v186 = not v185
                    if not v186 then
                        local v187 = p184.title
                        if v187 == "" then
                            v187 = false
                        end
                        v186 = not v187
                    end
                    if v186 then
                        u51(nil)
                        return nil
                    end
                    u51("<b><font color=\"" .. u5.richTextColor(Color3.fromRGB(255, 222, 64)) .. "\">" .. p184.title .. "</font></b>\n" .. p184.description)
                end
                local v188
                if v181 == nil then
                    v188 = v181
                else
                    v188 = v181.backgroundImages
                end
                if v188 == nil then
                    v188 = v108.backgroundImages
                end
                local v189 = {}
                local v190 = {}
                local v191 = {}
                local v192
                if v181 == nil then
                    v192 = v181
                else
                    v192 = v181.title
                end
                if v192 == nil then
                    v192 = v108.title
                end
                v191.title = v192
                local v193
                if v181 == nil then
                    v193 = v181
                else
                    v193 = v181.subtitle
                end
                if v193 == nil then
                    v193 = v108.subtitle
                end
                v191.subtitle = v193
                local v194
                if v181 == nil then
                    v194 = v181
                else
                    v194 = v181.description
                end
                if v194 == nil then
                    v194 = v108.description
                end
                v191.description = v194
                v191.backgroundImages = (v188 == nil or #v188 < 1) and { "rbxassetid://100438919893865" } or v188
                v191.helperIcons = v111
                if v181 ~= nil then
                    v181 = v181.AbsolutePosElements
                end
                if v181 == nil then
                    v181 = v108.AbsolutePosElements
                end
                v191.AbsolutePosElements = v181
                v190.CardData = v191
                v190.Tag = p107.Tag
                v190.PlayerLevelReq = v110
                function v190.OnClick(p195, p196) --[[ Line: 739 ]]
                    --[[
                    Upvalues:
                        [1] = u179
                        [2] = u109
                    --]]
                    local v197 = u179
                    if v197 ~= nil then
                        v197 = v197.OnClick
                    end
                    if v197 then
                        local v198 = u179
                        if v198 ~= nil then
                            v198.OnClick(p195, p196)
                        end
                        return nil
                    end
                    if u109.OnClick then
                        u109.OnClick(p195, p196)
                        return nil
                    end
                end
                function v190.OnHover(p199, p200) --[[ Line: 756 ]]
                    --[[
                    Upvalues:
                        [1] = u179
                        [2] = u109
                    --]]
                    local v201 = u179
                    if v201 ~= nil then
                        v201 = v201.OnHover
                    end
                    if v201 then
                        local v202 = u179
                        if v202 ~= nil then
                            v202.OnHover(p199, p200)
                        end
                        return nil
                    end
                    if u109.OnHover then
                        u109.OnHover(p199, p200)
                        return nil
                    end
                end
                v189.props = v190
                local v203 = u104
                u104 = u104 + 1
                v189.Index = v203
                v189.QueueVariant = p107
                return v189
            end
            local v205 = 0
            local v206 = {}
            local v207 = {}
            for v208, v209 in p106 do
                local v210 = v204(v209, v208 - 1, p106)
                if v210 ~= nil then
                    v205 = v205 + 1
                    v206[v205] = v210
                end
            end
            v207.Cards = v206
            v207.Page = u52
            return u16.createElement(u44, v207)
        end
        local v212 = table.create(#v105)
        for v213, v214 in v105 do
            v212[v213] = v211(v214, v213 - 1, v105)
        end
        return v212
    end, { u52 }) do
        v102[v103 + v215] = v216
    end
    v98.CardContainerInner = u16.createElement(u8, v101, v102)
    v95.CardContainer = u16.createElement(u9, v97, v98)
    local v217 = not v69
    if v217 then
        if v50 == nil then
            v217 = false
        else
            v217 = u16.createFragment({
                ["Description"] = u16.createElement("ImageButton", {
                    ["BorderSizePixel"] = 0,
                    ["Transparency"] = 0.5,
                    ["AutoButtonColor"] = false,
                    ["Selectable"] = false,
                    ["Size"] = UDim2.fromScale(0.4, 0.25),
                    ["Position"] = UDim2.fromScale(0.5, 0.725),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["BackgroundColor3"] = u5.BLACK
                }, { u16.createElement("UIPadding", {
                        ["PaddingLeft"] = UDim.new(0.05, 0),
                        ["PaddingRight"] = UDim.new(0.05, 0),
                        ["PaddingTop"] = UDim.new(0.05, 0),
                        ["PaddingBottom"] = UDim.new(0.05, 0)
                    }), u16.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["TextTransparency"] = 0,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Text"] = v50,
                        ["TextColor3"] = u5.darken(u5.WHITE, 0.8),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Regular)
                    }) })
            })
        end
    end
    if v217 then
        v95[v96 + 1] = v217
    end
    v79.Body = u16.createElement(u8, v94, v95)
    v77.LobbyPlayMenuAppContainer = u16.createElement(u8, v78, v79)
    v75[v76 + 1] = u16.createElement(u12, {}, v77)
    return u16.createElement(u21, v72, v75)
end)
return {
    ["LobbyPlayMenuApp"] = v18.connect(function(p219, p220) --[[ Line: 847 ]]
        local v221 = {}
        for v222, v223 in p220 do
            v221[v222] = v223
        end
        v221.KeysData = p219.Keys.keysData
        return v221
    end)(v218)
}