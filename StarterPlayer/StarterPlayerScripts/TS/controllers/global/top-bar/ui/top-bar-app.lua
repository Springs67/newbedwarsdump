local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.SoundManager
local u8 = v3.TopBarButton
local u9 = v3.UILayers
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "lobby", "missions", "ui", "missions-app").MissionsApp
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role")
local u21 = v20.CustomMatchRole
local u22 = v20.CustomMatchRoleAttribute
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u31 = v1.import(script, script.Parent.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase
local u32 = v1.import(script, script.Parent.Parent.Parent, "map", "published-maps", "rate-map-modal").RateMapModal
local u33 = v1.import(script, script.Parent.Parent.Parent, "settings", "ui", "settings-app").SettingsApp
local u34 = v1.import(script, script.Parent, "game", "top-bar-game-app").TopBarGameApp
local u35 = v1.import(script, script.Parent, "top-bar-dropdown-item").TopBarDropdownItem
local v127 = v13.new(u12)(function(u36, p37) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u30
        [3] = u24
        [4] = u23
        [5] = u2
        [6] = u10
        [7] = u15
        [8] = u22
        [9] = u21
        [10] = u16
        [11] = u12
        [12] = u31
        [13] = u26
        [14] = u27
        [15] = u11
        [16] = u33
        [17] = u9
        [18] = u7
        [19] = u28
        [20] = u29
        [21] = u34
        [22] = u8
        [23] = u25
        [24] = u17
        [25] = u5
        [26] = u35
        [27] = u18
        [28] = u19
        [29] = u32
        [30] = u4
    --]]
    local v38 = p37.useState
    local v39 = p37.useEffect
    local v40 = u6.isMobileControls()
    local v41 = u30.isLobbyServer()
    local u42 = u30.isGameServer() or u36.ForceGameApp
    local v43
    if u6.isHoarceKat() then
        v43 = u24.SKYWARS_TO2
    else
        v43 = u36.QueueType or u24.BEDWARS_TEST
    end
    local v44
    if u6.isHoarceKat() then
        v44 = u23[v43]
    else
        v44 = u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v43)
    end
    local u45, u46 = v38(false)
    local v47, u48 = v38(false)
    local v49, u50 = v38(false)
    local v51, u52 = v38(false)
    local v53 = (v49 and 1 or 0) + 3 + (v51 and 1 or 0) + (v40 and 1 or 0) + (v44.rankCategory and 1 or 0)
    local v54 = u36.CustomMatchMapSaveInfoDto
    if v54 ~= nil then
        v54 = v54.isMapPublished
    end
    local v55 = v53 + (v54 and 1 or 0)
    local v56 = v55 * 32 + (v55 - 1) * 8
    v39(function() --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u42
            [3] = u30
            [4] = u10
            [5] = u52
            [6] = u50
            [7] = u15
            [8] = u22
            [9] = u21
        --]]
        if u6.isHoarceKat() or not u42 then
            return nil
        end
        local v57 = { "anticheat_mod", "admin", "artist" }
        if u30.isStaging() then
            table.insert(v57, "tester")
        end
        if not u10.Controllers.PermissionController:hasAnyPermissions(v57) then
            local u60 = u15.LocalPlayer:GetAttributeChangedSignal(u22):Connect(function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u22
                    [3] = u21
                    [4] = u50
                    [5] = u52
                --]]
                local v58 = u15.LocalPlayer:GetAttribute(u22)
                local v59 = v58 == u21.COHOST and true or v58 == u21.HOST
                u50(v59)
                u52(v59)
            end)
            return function() --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u60
                --]]
                u60:Disconnect()
            end
        end
        u52(true)
        u50(true)
        return nil
    end, {})
    v39(function() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u15
            [3] = u50
            [4] = u52
        --]]
        local v61 = u36.LocalPlayerId
        if v61 == nil then
            v61 = u15.LocalPlayer.UserId
        end
        if v61 == u36.CustomHostUserId then
            u50(true)
            u52(true)
        end
    end, { u36.CustomHostUserId })
    local function u81() --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u10
            [3] = u15
            [4] = u16
            [5] = u12
            [6] = u31
            [7] = u26
            [8] = u27
            [9] = u6
            [10] = u11
            [11] = u46
        --]]
        if u45 and u10.Controllers.RadialWheelController:isRadialWheelOpen() then
            u10.Controllers.RadialWheelController:closeRadialWheel()
        else
            local v62 = {}
            for v63, u64 in u15.LocalPlayer:GetAttributes() do
                if u16.startsWith(v63, "EmoteTypeSlot") and u64 ~= nil then
                    local v65 = u16.slice
                    local v66 = #v63 - 1
                    local v67 = tonumber(v65(v63, v66))
                    local v68 = {
                        ["element"] = u12.createElement(u31, {
                            ["Emote"] = u64
                        })
                    }
                    local v69 = u26[u64]
                    if v69 ~= nil then
                        v69 = v69.name
                    end
                    if v69 == nil then
                        local v70 = (v67 == nil and 0 or v67) + 1
                        v69 = "Slot " .. tostring(v70)
                    end
                    v68.title = v69
                    function v68.onSelect() --[[ Line: 131 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u64
                        --]]
                        u10.Controllers.EmoteController:emote(u64)
                        u10.Controllers.RadialWheelController:closeRadialWheel()
                    end
                    v62[v67] = v68
                end
            end
            local v71 = false
            local v72 = 1
            while true do
                if true then
                    if v71 then
                        v72 = v72 + 1
                    else
                        v71 = true
                    end
                end
                if v72 > 8 then
                    break
                end
                if v62[v72] == nil then
                    v62[v72] = {
                        ["title"] = "",
                        ["element"] = u12.createElement(u31, {
                            ["Emote"] = u27.NONE
                        }),
                        ["onSelect"] = function() --[[ Name: onSelect, Line 157 ]]
                            --[[
                            Upvalues:
                                [1] = u10
                            --]]
                            u10.Controllers.RadialWheelController:closeRadialWheel()
                        end
                    }
                end
            end
            local v73 = u6.isMobileControls() or u6.isGamepadControls()
            if not u6.isHoarceKat() then
                local v74 = u10.Controllers.RadialWheelController
                local v75 = u11.values(v62)
                local v76 = 8
                local v77 = nil
                local v78 = not v73
                local v79 = UDim2.fromScale(0.5, 0.5)
                local v80
                if v73 then
                    v80 = UDim2.fromScale(0.6, 0.6)
                else
                    v80 = nil
                end
                v74:openRadialWheel(v75, v76, v77, v78, v79, v80)
            end
        end
        u46(not u45)
    end
    local function u83() --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u33
            [3] = u9
            [4] = u7
            [5] = u28
        --]]
        local v82 = {
            ["appId"] = "SettingsApp",
            ["app"] = u33
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v82, {}, u9.MAIN)
        u7:playSound(u28.UI_OPEN_2)
    end
    local v84 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false
    }
    local v85 = {}
    local v86 = #v85
    local v87 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.1, 0.035),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["Position"] = UDim2.new(1, -10, 0, u29.topBarTopOffset)
    }
    local v88 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }) }
    local v89 = #v88
    local v90
    if u42 then
        v90 = u12.createElement(u34, {
            ["AppId"] = "TopBarGameApp",
            ["LocalPlayerId"] = u36.LocalPlayerId
        })
    else
        v90 = u42
    end
    if v90 then
        v88[v89 + 1] = v90
    end
    local v91 = #v88
    if v41 then
        local v92 = u12.createFragment
        local v93 = {}
        local v94 = {
            ["Text"] = "Patch Notes",
            ["LayoutOrder"] = 0,
            ["OnClick"] = function() --[[ Name: OnClick, Line 217 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10.Controllers.GameUpdatesController:openGameUpdateApp()
            end
        }
        __set_list(v93, 1, {u12.createElement(u8, v94), u12.createElement(u8, {
    ["ImageScale"] = 0.9,
    ["LayoutOrder"] = 1,
    ["ToolTip"] = "PROFILE",
    ["Image"] = u25.TOPBAR_PROFILE_ICON,
    ["OnClick"] = function() --[[ Name: OnClick, Line 225 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u15
        --]]
        u10.Controllers.PlayerProfileUIController:openPlayerProfile(u15.LocalPlayer)
    end
})})
        v41 = v92(v93)
    end
    if v41 then
        v88[v91 + 1] = v41
    end
    local v95 = #v88
    if v40 then
        v40 = u12.createElement(u8, {
            ["LayoutOrder"] = 50,
            ["ToolTip"] = "SHIFT LOCK",
            ["Image"] = u25.HUD_MOBILE_SHIFT_LOCK,
            ["OnClick"] = function(_, p96) --[[ Name: OnClick, Line 239 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                if u10.Controllers.MobileShiftLockController:isEnabled() then
                    u10.Controllers.MobileShiftLockController:disable()
                    p96(false)
                else
                    u10.Controllers.MobileShiftLockController:enable()
                    p96(true)
                end
            end
        })
    end
    if v40 then
        v88[v95 + 1] = v40
    end
    local v97 = #v88
    local v98 = not u42
    if v98 then
        v98 = u12.createElement(u8, {
            ["LayoutOrder"] = 51,
            ["ToolTip"] = "EMOTE",
            ["Image"] = u25.TOPBAR_EMOTE_ICON,
            ["OnClick"] = function() --[[ Name: OnClick, Line 257 ]]
                --[[
                Upvalues:
                    [1] = u81
                --]]
                u81()
            end
        })
    end
    if v98 then
        v88[v97 + 1] = v98
    end
    local v99 = #v88
    local v100 = not u42
    if v100 then
        v100 = u12.createElement(u8, {
            ["ToolTip"] = "SETTINGS",
            ["LayoutOrder"] = 53,
            ["Image"] = u25.GEAR_OULTINE_ICON,
            ["SelectedState"] = {
                ["Image"] = u25.GEAR_FILLED_ICON
            },
            ["OnClick"] = function(p101, u102) --[[ Name: OnClick, Line 271 ]]
                --[[
                Upvalues:
                    [1] = u83
                    [2] = u17
                --]]
                u83()
                u102(not p101)
                local u103 = nil
                u103 = u17.AppClose:connect(function(p104) --[[ Line: 276 ]]
                    --[[
                    Upvalues:
                        [1] = u102
                        [2] = u103
                    --]]
                    if p104.appId == "SettingsApp" then
                        u102(false)
                        u103:Destroy()
                    end
                end)
            end
        })
    end
    if v100 then
        v88[v99 + 1] = v100
    end
    local v105 = #v88
    if u42 then
        u42 = u12.createElement(u8, {
            ["LayoutOrder"] = 100,
            ["Image"] = u25.ELLIPSIS,
            ["OnClick"] = function(p106, p107) --[[ Name: OnClick, Line 292 ]]
                --[[
                Upvalues:
                    [1] = u48
                --]]
                p107(not p106)
                u48(not p106)
            end
        })
    end
    if u42 then
        v88[v105 + 1] = u42
    end
    v85.TopBarApp = u12.createElement("Frame", v87, v88)
    local v108 = {
        ["BackgroundTransparency"] = 0.4,
        ["Size"] = UDim2.new(0, 136, 0, v56 + 10),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.new(1, -10, 0, u29.topBarTopOffset + 32 + 10),
        ["BackgroundColor3"] = u5.BLACK,
        ["Visible"] = v47
    }
    local v109 = { u12.createElement("UISizeConstraint", {
            ["MaxSize"] = Vector2.new((1 / 0), 300)
        }), u12.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        }) }
    local v110 = #v109
    local v111 = {
        ["ScrollingFrameProps"] = {
            ["Size"] = UDim2.new(1, 0, 0, v56) - UDim2.fromOffset(10, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
    }
    local v112 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["Padding"] = UDim.new(0, 8)
        }), u12.createElement(u35, {
            ["Text"] = "Settings",
            ["LayoutOrder"] = 0,
            ["Image"] = u25.GEAR_OULTINE_ICON,
            ["OnClick"] = u83
        }), u12.createElement(u35, {
            ["Text"] = "Emote",
            ["LayoutOrder"] = 2,
            ["Image"] = u25.TOPBAR_EMOTE_ICON,
            ["OnClick"] = u81
        }) }
    local v113 = #v112
    local v114 = not (v44.disableMissionProgress or u36.IsCustom)
    if v114 then
        v114 = u12.createElement(u35, {
            ["Text"] = "Missions",
            ["LayoutOrder"] = 1,
            ["Image"] = u25.TOPBAR_MISSIONS_ICON,
            ["OnClick"] = function() --[[ Name: OnClick, Line 353 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u18
                    [3] = u19
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                    ["app"] = u18,
                    ["appId"] = u19.MISSIONS
                }, {
                    ["HideSidebar"] = true
                })
            end
        })
    end
    if v114 then
        v112[v113 + 1] = v114
    end
    local v115 = #v112
    if v49 then
        local v116 = {
            ["Text"] = "Host Panel",
            ["LayoutOrder"] = 10,
            ["OnClick"] = function() --[[ Name: OnClick, Line 369 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u19
                    [3] = u7
                    [4] = u28
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.CUSTOM_MATCH_HOST_PANEL, {})
                u7:playSound(u28.UI_OPEN_2)
            end
        }
        v49 = u12.createElement(u35, v116)
    end
    if v49 then
        v112[v115 + 1] = v49
    end
    local v117 = #v112
    if v51 then
        local v118 = {
            ["Text"] = "Scripts",
            ["LayoutOrder"] = 11,
            ["OnClick"] = function() --[[ Name: OnClick, Line 381 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u19
                    [3] = u7
                    [4] = u28
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.SCRIPT_EDITOR, {})
                u7:playSound(u28.UI_OPEN_2)
            end,
            ["Disabled"] = not v51
        }
        v51 = u12.createElement(u35, v118)
    end
    if v51 then
        v112[v117 + 1] = v51
    end
    local v119 = #v112
    local v120 = v44.rankCategory
    if v120 then
        v120 = u12.createElement(u35, {
            ["Text"] = "Report",
            ["LayoutOrder"] = 21,
            ["OnClick"] = function() --[[ Name: OnClick, Line 394 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u5
                    [3] = u29
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "Report a user with video proof at: <font color=\"" .. u5.richTextColor(u29.mcAqua) .. "\">easy.gg/report</font>"
                })
            end,
            ["Disabled"] = not v44.rankCategory
        })
    end
    if v120 then
        v112[v119 + 1] = v120
    end
    local v121 = #v112
    local v122 = u36.CustomMatchMapSaveInfoDto
    if v122 ~= nil then
        v122 = v122.isMapPublished
    end
    if v122 then
        local v126 = {
            ["Text"] = "Rate Map",
            ["LayoutOrder"] = 20,
            ["OnClick"] = function() --[[ Name: OnClick, Line 414 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u2
                    [3] = u32
                --]]
                if not u36.CustomMatchMapSaveInfoDto then
                    return nil
                end
                local v123 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v124 = {
                    ["appId"] = "RateMapModal",
                    ["app"] = u32
                }
                local v125 = {
                    ["mapData"] = {
                        ["mapId"] = u36.CustomMatchMapSaveInfoDto.mapId,
                        ["mapTitle"] = u36.CustomMatchMapSaveInfoDto.mapTitle,
                        ["creatorUserId"] = u36.CustomMatchMapSaveInfoDto.creatorUserId,
                        ["thumbnailImage"] = u36.CustomMatchMapSaveInfoDto.thumbnailImage
                    }
                }
                v123:openApp(v124, v125)
            end
        }
        v122 = u12.createElement(u35, v126)
    end
    if v122 then
        v112[v121 + 1] = v122
    end
    v109[v110 + 1] = u12.createElement(u4, v111, v112)
    v85[v86 + 1] = u12.createElement("Frame", v108, v109)
    return u12.createFragment({
        ["TopBarAppGui"] = u12.createElement("ScreenGui", v84, v85)
    })
end)
return {
    ["TopBarApp"] = v14.connect(function(p128, p129) --[[ Line: 442 ]]
        local v130 = {}
        for v131, v132 in p129 do
            v130[v131] = v132
        end
        v130.QueueType = p128.Game.queueType
        v130.CustomMatchMapSaveInfoDto = p128.CustomMatch.mapSaveData
        local v133 = p128.Game.customMatch
        if v133 ~= nil then
            v133 = v133.hostUserId
        end
        v130.CustomHostUserId = v133
        v130.IsCustom = p128.Game.customMatch ~= nil
        return v130
    end)(v127)
}