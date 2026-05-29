local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v3.preloadImages
local u7 = v3.ScaleComponent
local u8 = v3.ShineEffect
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").countUnclaimedMilestones
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-config").UgcConfig
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-meta").UgcMeta
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-type").UgcType
local u29 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "badge").Badge
local u30 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "store", "ui", "new-player-bundle-util-client").NewPlayerBundleClientUtil
local u31 = v1.import(script, script.Parent, "bundle", "bundle-lobby-side-button").BundleSideButton
local u32 = v1.import(script, script.Parent, "lobby-hud-currency").LobbyHudCurrency
local v33 = v1.import(script, script.Parent, "lobby-hud-side-button")
local u34 = v33.LobbyHudSideButton
local u35 = v33.LobbyHudSideButtonVariant
local _ = { v28.VOID_KNIGHT_KIT_SHOULDER_BUDDY, v28.YUZI_KIT_SHOULDER_BUDDY }
local v122 = v11.new(u10)(function(u36, p37) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u30
        [3] = u24
        [4] = u15
        [5] = u4
        [6] = u10
        [7] = u21
        [8] = u27
        [9] = u6
        [10] = u9
        [11] = u25
        [12] = u17
        [13] = u18
        [14] = u13
        [15] = u7
        [16] = u5
        [17] = u32
        [18] = u31
        [19] = u20
        [20] = u2
        [21] = u14
        [22] = u34
        [23] = u8
        [24] = u16
        [25] = u22
        [26] = u19
        [27] = u23
        [28] = u29
        [29] = u35
    --]]
    local v38 = p37.useState
    local v39 = p37.useEffect
    local v40, _ = v38(false)
    local _, u41 = v38(u26.UGC_TO_CYCLE[math.random(0, #u26.UGC_TO_CYCLE - 1) + 1])
    local u42, u43 = v38((u30.shouldShowNewPlayerBundle()))
    local v44 = u24(u36.playerLevel, u36.milestoneRewardsClaimed)
    local v45 = v44 == nil and 0 or v44
    local v46 = not u36.achievements and 0 or u15.countUnclaimedRewards(u36.achievements)
    local v47 = u4.isSmallScreen() and 175 or 185
    u4.isSmallScreen()
    local v48 = 0.03
    u4.isSmallScreen()
    local v49 = 3
    local v50 = u4.isSmallScreen() and 1.5 or 1
    local v51 = u4.isSmallScreen() and 0.8 or 0.95
    u4.isSmallScreen()
    local v52 = 0.9
    local u53 = u10.createRef()
    local v54 = 0
    local v55 = {}
    for v56, v57 in u21.getActiveEvents() do
        local _ = v56 - 1
        if u21.isEventRunning(v57) == true then
            v54 = v54 + 1
            v55[v54] = v57
        end
    end
    local u58 = v55[1]
    v39(function() --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u42
            [3] = u26
            [4] = u27
            [5] = u6
            [6] = u9
            [7] = u25
            [8] = u17
            [9] = u18
            [10] = u30
            [11] = u43
            [12] = u13
            [13] = u41
        --]]
        local u59 = u53:getValue()
        if not u59 then
            return nil
        end
        local u60 = u42
        local v61 = u26.UGC_TO_CYCLE
        local v62 = table.create(#v61)
        local v63 = {}
        for v64, v65 in v61 do
            local _ = v64 - 1
            v62[v64] = u27[v65].image
        end
        for v66, v67 in v62 do
            local _ = v66 - 1
            local v68 = v67.render
            table.insert(v63, v68)
            local v69 = v67.stroke
            if v69 ~= "" and v69 then
                local v70 = v67.stroke
                table.insert(v63, v70)
            end
        end
        u6(v63)
        local u71 = u9.new()
        local u72 = true
        u71:GiveTask(function() --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u72
            --]]
            u72 = false
        end)
        u71:GiveTask(u25.Client:Get("RobuxPurchaseSuccess"):Connect(function(p73) --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u18
                [3] = u60
                [4] = u30
                [5] = u43
            --]]
            if p73.devProductId == u17[u18.NEW_PLAYER_BUNDLE].devProductId and u60 then
                local v74 = u30.shouldShowNewPlayerBundle()
                u43(v74)
                if not v74 then
                    u60 = false
                end
            end
        end))
        local u75 = 0
        task.spawn(function() --[[ Line: 138 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u72
                [3] = u60
                [4] = u30
                [5] = u43
                [6] = u13
                [7] = u59
                [8] = u71
                [9] = u75
                [10] = u41
            --]]
            while true do
                local v76 = task.wait(u26.CYCLE_TIME_SECONDS)
                if v76 == 0 or (v76 ~= v76 or not (v76 and u72)) then
                    break
                end
                if u60 then
                    local v77 = u30.shouldShowNewPlayerBundle()
                    u43(v77)
                    if not v77 then
                        u60 = false
                    end
                else
                    local v78 = u13:Create(u59, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                        ["Size"] = UDim2.fromScale(0, 0)
                    })
                    v78:Play()
                    u71:GiveTask(v78.Completed:Once(function() --[[ Line: 159 ]]
                        --[[
                        Upvalues:
                            [1] = u26
                            [2] = u75
                            [3] = u41
                            [4] = u13
                            [5] = u59
                        --]]
                        local v79 = u26.UGC_TO_CYCLE
                        u75 = u75 + 1
                        u41(v79[u75 % #u26.UGC_TO_CYCLE + 1])
                        u13:Create(u59, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            ["Size"] = UDim2.fromScale(1, 1)
                        }):Play()
                    end))
                end
            end
        end)
        return function() --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u71
            --]]
            u71:DoCleaning()
        end
    end, {})
    local v80 = {
        ["ResetOnSpawn"] = false,
        ["Enabled"] = not v40
    }
    local v81 = {}
    local _ = #v81
    local v82 = {
        ["Size"] = UDim2.fromOffset(v47, 600),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.fromScale(0.01, u4.isSmallScreen() and 0.39 or 0.43)
    }
    local v83 = {
        u10.createElement(u7, {
            ["MaximumSize"] = Vector2.new(v47, 600)
        }),
        u10.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 8)
        }),
        u10.createElement(u5, {
            ["LayoutOrder"] = 2
        }),
        ["LobbyHudCurrency"] = u10.createElement(u5, {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0)
        }, { u10.createElement(u32, {
                ["FrameProps"] = {
                    ["LayoutOrder"] = 2
                },
                ["BedCoins"] = u36.bedCoins
            }) })
    }
    local _ = #v83
    local v84
    if u42 then
        local v85 = {
            ["Size"] = UDim2.new(u4.isSmallScreen() and 0.9 or 1, 0, 0, 80),
            ["LayoutOrder"] = u4.isSmallScreen() and 2 or 1
        }
        local v86 = {}
        local v87 = #v86
        local v88 = {
            [u10.Ref] = u53,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v89 = {}
        local v90 = #v89
        local v91 = {
            ["BundleType"] = u18.NEW_PLAYER_BUNDLE
        }
        local v92 = u36.newPlayerBundleData
        if v92 ~= nil then
            v92 = v92.firstJoinTime
        end
        local v93
        if v92 == nil then
            v93 = u30.getNewPlayerBundleExpireTime()
        else
            v93 = u30.getNewPlayerBundleExpireTimeFromJoin(u36.newPlayerBundleData.firstJoinTime)
        end
        v91.EndTime = v93
        v89[v90 + 1] = u10.createElement(u31, v91)
        v86[v87 + 1] = u10.createElement(u5, v88, v89)
        v84 = u10.createFragment({
            ["BundleWrapper"] = u10.createElement(u5, v85, v86)
        })
    else
        v84 = u10.createFragment()
    end
    local v94 = {
        ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 70 or 145)
    }
    local v95 = {
        u10.createElement("UIListLayout", {
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["FillDirection"] = u4.isSmallScreen() and "Horizontal" or "Vertical",
            ["VerticalAlignment"] = u4.isSmallScreen() and "Center" or "Bottom",
            ["Padding"] = UDim.new(0, 8)
        }),
        [#v95 + 1] = v84
    }
    local v96 = #v95
    if u58 then
        local v97 = {}
        local v98 = u20[u58].lobbyButtonConfig
        if v98 ~= nil then
            v98 = v98.icon
        end
        if v98 == nil then
            local v99 = u20[u58].navbarImage
            v98 = v99 == nil and "" or v99
        end
        v97.Icon = v98
        local v100 = u20[u58].lobbyButtonConfig
        if v100 ~= nil then
            v100 = v100.bannerImage
        end
        v97.BackgroundImage = v100 == nil and "" or v100
        v97.Text = u20[u58].name
        function v97.OnClick() --[[ Line: 285 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u14
                [3] = u58
            --]]
            local v101 = {
                ["event"] = u58
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.EVENT_APP, v101)
        end
        local v102 = u20[u58].lobbyButtonConfig
        if v102 ~= nil then
            v102 = v102.backgroundGradient
        end
        if v102 == nil then
            v102 = ColorSequence.new(Color3.fromRGB(0, 251, 255), Color3.fromRGB(0, 119, 245))
        end
        v97.BackgroundGradient = v102
        v97.FrameProps = {
            ["LayoutOrder"] = 1,
            ["ImageTransparency"] = 0.6,
            ["Size"] = UDim2.new(0.9, 0, 0, 60)
        }
        v97.TextLabelProps = {
            ["TextSize"] = 18,
            ["Size"] = UDim2.fromScale(1, 0.4)
        }
        v97.IconProps = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.75)
        }
        u58 = u10.createElement(u34, v97, { u10.createElement("UIStroke", {
                ["Transparency"] = 0.3,
                ["Thickness"] = 4,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }), u10.createElement(u8, {
                ["Loop"] = true
            }) })
    end
    v95[v96 + 1] = u58
    v83.ExtraButtons = u10.createElement(u5, v94, v95)
    local v103 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(v50 * 1, 0)
    }
    local v104 = { u10.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["CellSize"] = UDim2.fromOffset(v47 * v50 / v49 * v51, v47 * v50 / v49 * v51),
            ["CellPadding"] = UDim2.new(0, v47 * v50 / v49 * (1 - (1 - v48)) * v49, 0, v47 * v50 / v49 * (1 - (1 - v48)) * v49),
            ["FillDirectionMaxCells"] = v49
        }) }
    local v105 = #v104
    local v106 = u16.isActiveBattlePass()
    if v106 then
        v106 = u10.createElement(u34, {
            ["Text"] = "BattlePass",
            ["Icon"] = u16.BATTLE_PASS_SEASON_ICON,
            ["OnClick"] = function() --[[ Name: OnClick, Line 345 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u14
                    [3] = u16
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.BATTLEPASS, {
                    ["battlepass"] = u16.BATTLE_PASS_SEASON
                })
            end,
            ["FrameProps"] = {
                ["LayoutOrder"] = 2
            },
            ["BackgroundGradient"] = ColorSequence.new(Color3.fromRGB(247, 209, 89), Color3.fromRGB(245, 143, 8))
        }, { u10.createElement("UISizeConstraint", {
                ["MinSize"] = Vector2.new(v47 * v50 / v49 * v51 * 1.85, v47 * v50 / v49 * v51 * 0.9)
            }), u10.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromRGB(255, 230, 138)
            }) })
    end
    if v106 then
        v104[v105 + 1] = v106
    end
    local v107 = #v104
    v104[v107 + 1] = u10.createElement(u34, {
        ["Text"] = "Missions",
        ["Icon"] = u22.MISSION,
        ["OnClick"] = function() --[[ Name: OnClick, Line 370 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u14
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.MISSIONS, {})
        end,
        ["FrameProps"] = {
            ["LayoutOrder"] = 3
        }
    })
    v104[v107 + 2] = u10.createElement(u34, {
        ["Text"] = "Locker",
        ["LevelLocked"] = 2,
        ["Icon"] = u22.MIRROR_KILL_EFFECT,
        ["PlayerLevel"] = u36.playerLevel,
        ["OnClick"] = function() --[[ Name: OnClick, Line 382 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u14
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.LOCKER, {})
        end,
        ["FrameProps"] = {
            ["LayoutOrder"] = 4
        }
    })
    v104[v107 + 3] = u10.createElement(u34, {
        ["Text"] = "Clan",
        ["LevelLocked"] = 2,
        ["Icon"] = u22.CLAN,
        ["PlayerLevel"] = u36.playerLevel,
        ["OnClick"] = function() --[[ Name: OnClick, Line 394 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u2
                [3] = u14
            --]]
            local v108 = u36.myClanId
            if v108 == "" or not v108 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.CLAN_MENU, {})
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.CLAN_PROFILE, {
                    ["ClanId"] = u36.myClanId
                })
            end
        end,
        ["FrameProps"] = {
            ["LayoutOrder"] = 5
        }
    })
    local v109 = {}
    local v110 = u19(u23.LUCKY_GIFT)
    v109.Icon = v110 == nil and "" or v110
    v109.Text = "Store"
    v109.PlayerLevel = u36.playerLevel
    function v109.OnClick() --[[ Line: 416 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.STORE_MENU_APP, {
            ["AppId"] = u14.STORE_MENU_APP
        })
    end
    v109.FrameProps = {
        ["LayoutOrder"] = 6
    }
    v104[v107 + 4] = u10.createElement(u34, v109, { u10.createElement(u8) })
    v83.SquareButtons = u10.createElement(u5, v103, v104)
    local v111 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 6,
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v112 = { u10.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["FillDirectionMaxCells"] = 2,
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["CellSize"] = UDim2.fromOffset(v47 / 2 * v52, v47 / 2 * (u4.isSmallScreen() and 0.45 or 0.42)),
            ["CellPadding"] = UDim2.new(0, v47 / 2 * 0.050000000000000044 * 2, 0, v47 / 2 * 0.050000000000000044 * 2)
        }) }
    local v113 = #v112
    local v114 = {
        ["Icon"] = "rbxassetid://12508915374",
        ["Text"] = "Milestones",
        ["OnClick"] = function() --[[ Name: OnClick, Line 448 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u14
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.MILESTONES, {})
        end,
        ["FrameProps"] = {
            ["LayoutOrder"] = 6
        }
    }
    local v115 = {}
    local v116 = #v115
    local v117
    if v45 > 0 then
        v117 = u10.createElement(u29, {
            ["Text"] = tostring(v45)
        })
    else
        v117 = false
    end
    if v117 then
        v115[v116 + 1] = v117
    end
    v112[v113 + 1] = u10.createElement(u34, v114, v115)
    v112[v113 + 2] = u10.createElement(u34, {
        ["Text"] = "Tournament",
        ["LevelLocked"] = 2,
        ["Icon"] = u22.TOURNAMENT_QUEUE_ICON,
        ["PlayerLevel"] = u36.playerLevel,
        ["Variant"] = u35.SHORT,
        ["OnClick"] = function() --[[ Name: OnClick, Line 470 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u14
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.TOURNAMENT_APP, {})
        end,
        ["FrameProps"] = {
            ["LayoutOrder"] = 7
        }
    })
    v112[v113 + 3] = u10.createElement(u34, {
        ["Text"] = "Social",
        ["Icon"] = u22.FRIENDS_ICON_SOLID,
        ["Variant"] = u35.SHORT,
        ["OnClick"] = function() --[[ Name: OnClick, Line 481 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u14
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.SOCIAL_APP, {})
        end,
        ["FrameProps"] = {
            ["LayoutOrder"] = 8
        }
    })
    local v118 = {
        ["Text"] = "Achievements",
        ["Icon"] = u22.ACHIEVEMENT_DEFAULT_ICON,
        ["Variant"] = u35.SHORT,
        ["OnClick"] = function() --[[ Name: OnClick, Line 492 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u14
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.ACHIEVEMENTS, {})
        end,
        ["FrameProps"] = {
            ["LayoutOrder"] = 1
        }
    }
    local v119 = {}
    local v120 = #v119
    local v121
    if v46 > 0 then
        v121 = u10.createElement(u29, {
            ["Text"] = tostring(v46)
        })
    else
        v121 = false
    end
    if v121 then
        v119[v120 + 1] = v121
    end
    v112[v113 + 4] = u10.createElement(u34, v118, v119)
    v83.ShortButtons = u10.createElement(u5, v111, v112)
    v81.LobbyHudSide = u10.createElement(u5, v82, v83)
    return u10.createFragment({
        ["LobbyHudSideGui"] = u10.createElement("ScreenGui", v80, v81)
    })
end)
return {
    ["LobbyHudSide"] = v12.connect(function(p123, p124) --[[ Line: 515 ]]
        local v125 = {}
        for v126, v127 in p124 do
            v125[v126] = v127
        end
        v125.myClanId = p123.Clans.myClanId
        v125.playerLevel = p123.Bedwars.playerLevel
        v125.milestoneRewardsClaimed = p123.Bedwars.milestoneRewardsClaimed
        v125.bedCoins = p123.Bedwars.bedCoins
        v125.achievements = p123.Lobby.achievements
        v125.newPlayerBundleData = p123.Lobby.robuxStore.newPlayerBundleData
        return v125
    end)(v122)
}