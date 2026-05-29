local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v3.ScaleComponent
local u8 = v3.SoundManager
local u9 = v3.StringUtil
local u10 = v3.WidgetComponent
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-tab").HostPanelTab
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "script-editor-util").ScriptEditorUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u23 = v1.import(script, script.Parent, "audit-log-tab", "host-panel-audit-log-tab").HostPanelAuditLogTab
local u24 = v1.import(script, script.Parent, "custom-match-host-panel-tabs").CustomMatchHostPanelTab
local u25 = v1.import(script, script.Parent, "general-tab", "host-panel-general-tab").HostPanelGeneralTab
local u26 = v1.import(script, script.Parent, "generators-tab", "host-panel-ore-generators-tab").HostPanelOreGeneratorsTab
local u27 = v1.import(script, script.Parent, "items-tab", "host-panel-items-tab").HostPanelItemsTab
local u28 = v1.import(script, script.Parent, "kits-tab", "host-panel-kits-tab").HostPanelKitsTab
local u29 = v1.import(script, script.Parent, "map-tab", "host-panel-map-tab").HostPanelMapTab
local u30 = v1.import(script, script.Parent, "players-tab", "host-panel-players-tab").HostPanelPlayersTab
return {
    ["CustomMatchHostPanel"] = v14.new(u13)(function(u31, p32) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u5
            [3] = u17
            [4] = u16
            [5] = u11
            [6] = u8
            [7] = u21
            [8] = u22
            [9] = u13
            [10] = u7
            [11] = u2
            [12] = u12
            [13] = u20
            [14] = u15
            [15] = u9
            [16] = u24
            [17] = u4
            [18] = u19
            [19] = u25
            [20] = u28
            [21] = u27
            [22] = u30
            [23] = u26
            [24] = u29
            [25] = u23
            [26] = u6
            [27] = u10
        --]]
        local v33 = p32.useState
        local v34 = p32.useEffect
        local u35, u36 = v33(u18.GENERAL)
        local v37
        if u5.isHoarceKat() then
            v37 = u17(u16)
        else
            local v38 = u11.Controllers.MatchController:getCustomMatchConfig()
            local v39
            if v38 == nil then
                v39 = v38
            else
                v39 = v38.queueType
            end
            if v39 then
                v37 = u17(v38.queueType)
            else
                v37 = nil
            end
        end
        v34(function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u21
            --]]
            return function() --[[ Line: 48 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u21
                --]]
                u8:playSound(u21.UI_CLOSE_2)
            end
        end, {})
        v34(function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u18
                [3] = u11
            --]]
            if u35 == u18.SCRIPTS then
                u11.Controllers.ScriptEditorController:openScriptEditor()
            end
        end, { u35 })
        local v40 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = u22.widgetSize
        }
        local v41 = { u13.createElement(u7, {
                ["MaximumSize"] = u22.widgetScaleComponentMaxSize,
                ["ScreenPadding"] = u22.widgetScaleComponentScreenPadding
            }) }
        local v42 = #v41
        local v43 = {
            ["ClipsDescendents"] = false,
            ["AppId"] = u31.AppId,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v44 = u31.store.Game.customMatch
        if v44 ~= nil then
            v44 = v44.joinCode
        end
        v43.Title = "Host Panel: " .. tostring(v44)
        function v43.OnClose() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u31
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u31.AppId)
        end
        v43.ContentUIPadding = u13.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 0),
            ["PaddingLeft"] = UDim.new(0, 0),
            ["PaddingRight"] = UDim.new(0, 0)
        })
        local v45 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder"
            }) }
        local v46 = #v45
        local v47 = u12.entries(u18)
        local function v56(p48) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u20
                [3] = u15
                [4] = u9
                [5] = u35
                [6] = u36
                [7] = u13
                [8] = u24
            --]]
            local v49 = p48[1]
            local v50 = p48[2]
            if v50 == u18.SCRIPTS and not u20:hasScriptEditorPermission(u15.LocalPlayer) then
                return nil
            end
            local v51 = string.split(v49, "_")
            local v52 = table.create(#v51)
            local v53 = {}
            for v54, v55 in v51 do
                local _ = v54 - 1
                v52[v54] = u9.capitalizeFirstLetter(v55)
            end
            v53.Name = table.concat(v52, " ")
            v53.Tab = v50
            v53.ActiveTab = u35
            v53.SetTab = u36
            v53.LayoutOrder = v50
            return u13.createElement(u24, v53)
        end
        local v57 = 0
        local v58 = {}
        for v59, v60 in v47 do
            local v61 = v56(v60, v59 - 1, v47)
            if v61 ~= nil then
                v57 = v57 + 1
                v58[v57] = v61
            end
        end
        local v62 = {
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.15, 1),
            ["BackgroundColor3"] = u22.backgroundTertiary
        }
        local v63 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 10)
            }), u13.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 15)
            }) }
        local v64 = #v63
        for v65, v66 in v58 do
            v63[v64 + v65] = v66
        end
        v63[#v63 + 1] = u13.createElement("TextButton", {
            ["Size"] = UDim2.new(0.8, 0, 0, 30),
            ["BackgroundColor3"] = Color3.fromRGB(255, 0, 0),
            ["BackgroundTransparency"] = 0.9,
            ["Font"] = "Roboto",
            ["Text"] = "<b>Restart</b>",
            ["TextColor3"] = u4.WHITE,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextTransparency"] = 0,
            ["TextXAlignment"] = "Center",
            ["TextYAlignment"] = "Center",
            [u13.Event.Activated] = function() --[[ Line: 168 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u21
                    [3] = u19
                    [4] = u2
                --]]
                u8:playSound(u21.UI_CLICK)
                u19.Client:GetNamespace("CustomMatches"):Get("RestartCustomMatch"):CallServerAsync():expect()
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "Restarting match..."
                })
            end,
            ["LayoutOrder"] = 99
        }, { u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }), u13.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.15, 0),
                ["PaddingRight"] = UDim.new(0.15, 0)
            }), u13.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        v45[v46 + 1] = u13.createElement("Frame", v62, v63)
        local v67 = u35 == u18.GENERAL
        if v67 then
            local v68
            if v37 == nil then
                v68 = v37
            else
                v68 = v37.customMatchConfig
                if v68 ~= nil then
                    v68 = v68.hostPanel
                    if v68 ~= nil then
                        local v69 = v68.disabledPanelTabs
                        local v70 = u18.GENERAL
                        v68 = table.find(v69, v70) ~= nil
                    end
                end
            end
            v67 = not v68
            if v67 then
                v67 = u13.createElement(u25, {
                    ["store"] = u31.store
                })
            end
        end
        local v71 = {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 1)
        }
        local v72 = { u13.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 5),
                ["PaddingLeft"] = UDim.new(0.075, 0),
                ["PaddingRight"] = UDim.new(0.075, 0)
            }) }
        local v73 = #v72
        if v67 then
            v72[v73 + 1] = v67
        end
        local v74 = #v72
        local v75 = u35 == u18.KITS
        if v75 then
            local v76
            if v37 == nil then
                v76 = v37
            else
                v76 = v37.customMatchConfig
                if v76 ~= nil then
                    v76 = v76.hostPanel
                    if v76 ~= nil then
                        local v77 = v76.disabledPanelTabs
                        local v78 = u18.KITS
                        v76 = table.find(v77, v78) ~= nil
                    end
                end
            end
            v75 = not v76
            if v75 then
                v75 = u13.createElement(u28, {
                    ["store"] = u31.store
                })
            end
        end
        if v75 then
            v72[v74 + 1] = v75
        end
        local v79 = #v72
        local v80 = u35 == u18.ITEMS
        if v80 then
            local v81
            if v37 == nil then
                v81 = v37
            else
                v81 = v37.customMatchConfig
                if v81 ~= nil then
                    v81 = v81.hostPanel
                    if v81 ~= nil then
                        local v82 = v81.disabledPanelTabs
                        local v83 = u18.ITEMS
                        v81 = table.find(v82, v83) ~= nil
                    end
                end
            end
            v80 = not v81
            if v80 then
                v80 = u13.createElement(u27, {
                    ["store"] = u31.store
                })
            end
        end
        if v80 then
            v72[v79 + 1] = v80
        end
        local v84 = #v72
        local v85 = u35 == u18.PLAYERS
        if v85 then
            local v86
            if v37 == nil then
                v86 = v37
            else
                v86 = v37.customMatchConfig
                if v86 ~= nil then
                    v86 = v86.hostPanel
                    if v86 ~= nil then
                        local v87 = v86.disabledPanelTabs
                        local v88 = u18.PLAYERS
                        v86 = table.find(v87, v88) ~= nil
                    end
                end
            end
            v85 = not v86
            if v85 then
                v85 = u13.createElement(u30, {
                    ["store"] = u31.store
                })
            end
        end
        if v85 then
            v72[v84 + 1] = v85
        end
        local v89 = #v72
        local v90 = u35 == u18.GENERATORS
        if v90 then
            local v91
            if v37 == nil then
                v91 = v37
            else
                v91 = v37.customMatchConfig
                if v91 ~= nil then
                    v91 = v91.hostPanel
                    if v91 ~= nil then
                        local v92 = v91.disabledPanelTabs
                        local v93 = u18.GENERATORS
                        v91 = table.find(v92, v93) ~= nil
                    end
                end
            end
            v90 = not v91
            if v90 then
                v90 = u13.createElement(u26, {
                    ["store"] = u31.store
                })
            end
        end
        if v90 then
            v72[v89 + 1] = v90
        end
        local v94 = #v72
        local v95 = u35 == u18.MAP
        if v95 then
            local v96
            if v37 == nil then
                v96 = v37
            else
                v96 = v37.customMatchConfig
                if v96 ~= nil then
                    v96 = v96.hostPanel
                    if v96 ~= nil then
                        local v97 = v96.disabledPanelTabs
                        local v98 = u18.MAP
                        v96 = table.find(v97, v98) ~= nil
                    end
                end
            end
            v95 = not v96
            if v95 then
                v95 = u13.createElement(u29, {
                    ["store"] = u31.store
                })
            end
        end
        if v95 then
            v72[v94 + 1] = v95
        end
        local v99 = #v72
        local v100 = u35 == u18.AUDIT_LOG
        if v100 then
            if v37 ~= nil then
                v37 = v37.customMatchConfig
                if v37 ~= nil then
                    v37 = v37.hostPanel
                    if v37 ~= nil then
                        local v101 = v37.disabledPanelTabs
                        local v102 = u18.AUDIT_LOG
                        v37 = table.find(v101, v102) ~= nil
                    end
                end
            end
            v100 = not v37
            if v100 then
                v100 = u13.createElement(u23, {
                    ["AppId"] = "HostPanelAuditLogTab"
                })
            end
        end
        if v100 then
            v72[v99 + 1] = v100
        end
        v45[v46 + 2] = u13.createElement(u6, v71, v72)
        v41[v42 + 1] = u13.createElement(u10, v43, v45)
        return u13.createElement("Frame", v40, v41)
    end)
}