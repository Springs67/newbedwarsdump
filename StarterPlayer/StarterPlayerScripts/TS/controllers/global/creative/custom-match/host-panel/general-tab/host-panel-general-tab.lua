local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.DropdownComponent
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto")
local u14 = v13.HostPanelDropdown
local u15 = v13.HostPanelToggle
local u16 = v13.HostPanelToggleValue
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-types").LiveServerVisibilityMode
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u19 = v1.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting
local u20 = v1.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox
local u21 = UDim2.new(0.95, 0, 0, 50)
return {
    ["HostPanelGeneralTab"] = v8.new(u7)(function(p22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u12
            [3] = u11
            [4] = u6
            [5] = u15
            [6] = u7
            [7] = u19
            [8] = u21
            [9] = u10
            [10] = u9
            [11] = u16
            [12] = u17
            [13] = u18
            [14] = u20
            [15] = u5
            [16] = u14
            [17] = u3
        --]]
        local _ = p23.useState
        local _ = p23.useEffect
        local v24
        if u4.isHoarceKat() then
            v24 = u12(u11)
        else
            local v25 = u6.Controllers.MatchController:getCustomMatchConfig()
            local v26
            if v25 == nil then
                v26 = v25
            else
                v26 = v25.queueType
            end
            if v26 then
                v24 = u12(v25.queueType)
            else
                v24 = nil
            end
        end
        local v27
        if v24 == nil then
            v27 = v24
        else
            v27 = v24.customMatchConfig
            if v27 ~= nil then
                v27 = v27.hostPanel
                if v27 ~= nil then
                    local v28 = v27.disabledToggles
                    local v29 = u15.GameVisibilityMode
                    v27 = table.find(v28, v29) ~= nil
                end
            end
        end
        local v30 = not v27
        if v30 then
            v30 = u7.createElement(u19, {
                ["Name"] = "Visibility Mode",
                ["Hint"] = "(Let others find your game)",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.GameVisibilityMode],
                    ["OnChange"] = function(p31) --[[ Name: OnChange, Line 58 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.GameVisibilityMode, p31)
                    end
                }, { u7.createElement(u9, {
                        ["Value"] = u16.ON,
                        ["Text"] = string.upper(u17.PUBLIC)
                    }), u7.createElement(u9, {
                        ["Value"] = u16.OFF,
                        ["Text"] = string.upper(u17.PRIVATE),
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        local v32 = {
            ["AdditionalSpace"] = 150,
            ["ScrollingFrameProps"] = {
                ["Size"] = UDim2.new(1, 0, 1, 0)
            }
        }
        local v33 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0, 10)
            }), u7.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["Text"] = "<b>SERVER SETTINGS</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0),
                ["TextColor3"] = u18.textPrimary
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) }) }
        local v34 = #v33
        if v30 then
            v33[v34 + 1] = v30
        end
        local v35 = #v33
        local v36
        if v24 == nil then
            v36 = v24
        else
            v36 = v24.customMatchConfig
            if v36 ~= nil then
                v36 = v36.hostPanel
                if v36 ~= nil then
                    local v37 = v36.disabledToggles
                    local v38 = u15.LockServer
                    v36 = table.find(v37, v38) ~= nil
                end
            end
        end
        local v39 = not v36
        if v39 then
            v39 = u7.createElement(u19, {
                ["Name"] = "Lock Server",
                ["Hint"] = "(Blocks player joins)",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.LockServer],
                    ["OnChange"] = function(p40) --[[ Name: OnChange, Line 131 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.LockServer, p40)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v39 then
            v33[v35 + 1] = v39
        end
        local v41 = #v33
        local v42 = v41 + 1
        local v43 = u7.createElement
        local v44 = u19
        local v45 = {
            ["Name"] = "Server Max Players",
            ["Size"] = u21
        }
        local v46 = {}
        local v47 = u7.createElement
        local v48 = u20
        local v49 = {
            ["NumbersOnly"] = true
        }
        local v50 = p22.store.CustomMatch.serverMaxPlayers
        v49.Text = tostring(v50)
        local v51 = p22.store.CustomMatch.serverMaxPlayers
        v49.PlaceholderText = tostring(v51)
        function v49.OnFocusLost(p52) --[[ Line: 159 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            local v53 = tonumber(p52)
            if v53 ~= 0 and (v53 == v53 and v53) then
                u6.Controllers.CustomMatchController:setSeverMaxPlayers(v53)
            end
        end
        __set_list(v46, 1, {v47(v48, v49)})
        v33[v42] = v43(v44, v45, v46)
        local v54
        if v24 == nil then
            v54 = v24
        else
            v54 = v24.customMatchConfig
            if v54 ~= nil then
                v54 = v54.hostPanel
                if v54 ~= nil then
                    local v55 = v54.disabledToggles
                    local v56 = u15.TeamOverflow
                    v54 = table.find(v55, v56) ~= nil
                end
            end
        end
        local v57 = not v54
        if v57 then
            v57 = u7.createElement(u19, {
                ["Name"] = "Team Overflow",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.TeamOverflow],
                    ["OnChange"] = function(p58) --[[ Name: OnChange, Line 187 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.TeamOverflow, p58)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v57 then
            v33[v41 + 2] = v57
        end
        local v59 = #v33
        local v60
        if v24 == nil then
            v60 = v24
        else
            v60 = v24.customMatchConfig
            if v60 ~= nil then
                v60 = v60.hostPanel
                if v60 ~= nil then
                    local v61 = v60.disabledToggles
                    local v62 = u15.TeamSwitching
                    v60 = table.find(v61, v62) ~= nil
                end
            end
        end
        local v63 = not v60
        if v63 then
            v63 = u7.createElement(u19, {
                ["Name"] = "Team Switching",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.TeamSwitching],
                    ["OnChange"] = function(p64) --[[ Name: OnChange, Line 227 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.TeamSwitching, p64)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v63 then
            v33[v59 + 1] = v63
        end
        local v65 = #v33
        local v66
        if v24 == nil then
            v66 = v24
        else
            v66 = v24.customMatchConfig
            if v66 ~= nil then
                v66 = v66.hostPanel
                if v66 ~= nil then
                    local v67 = v66.disabledToggles
                    local v68 = u15.LateJoining
                    v66 = table.find(v67, v68) ~= nil
                end
            end
        end
        local v69 = not v66
        if v69 then
            v69 = u7.createElement(u19, {
                ["Name"] = "Late Joining",
                ["Hint"] = "(Allow players to join while the match is running)",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.LateJoining],
                    ["OnChange"] = function(p70) --[[ Name: OnChange, Line 268 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.LateJoining, p70)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v69 then
            v33[v65 + 1] = v69
        end
        local v71 = #v33
        local v72
        if v24 == nil then
            v72 = v24
        else
            v72 = v24.customMatchConfig
            if v72 ~= nil then
                v72 = v72.hostPanel
                if v72 ~= nil then
                    local v73 = v72.disabledToggles
                    local v74 = u15.LateJoining
                    v72 = table.find(v73, v74) ~= nil
                end
            end
        end
        local v75 = not v72
        if v75 then
            v75 = u7.createElement(u19, {
                ["Name"] = "Late Joiner Team",
                ["Hint"] = "(Team assignment for late joiners)",
                ["Size"] = u21
            }, { u7.createElement(u5, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["DefaultItem"] = {
                        ["text"] = p22.store.CustomMatch.dropdowns[u14.LateJoinTeam],
                        ["value"] = p22.store.CustomMatch.dropdowns[u14.LateJoinTeam]
                    },
                    ["PlaceholderText"] = u4.isHoarceKat() and "hi" or u6.Controllers.CustomMatchController:generateDropdownItems(u14.LateJoinTeam)[1].text,
                    ["Items"] = u4.isHoarceKat() and {
                        {
                            ["text"] = "hi",
                            ["value"] = "hi"
                        }
                    } or u6.Controllers.CustomMatchController:generateDropdownItems(u14.LateJoinTeam),
                    ["OnItemSelected"] = function(p76) --[[ Name: OnItemSelected, Line 318 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u6
                            [3] = u14
                        --]]
                        if not u4.isHoarceKat() then
                            u6.Controllers.CustomMatchController:setDropdown(u14.LateJoinTeam, p76)
                        end
                    end
                }) })
        end
        if v75 then
            v33[v71 + 1] = v75
        end
        local v77 = #v33
        local v78
        if v24 == nil then
            v78 = v24
        else
            v78 = v24.customMatchConfig
            if v78 ~= nil then
                v78 = v78.hostPanel
                if v78 ~= nil then
                    local v79 = v78.disabledToggles
                    local v80 = u15.AutoRestartGame
                    v78 = table.find(v79, v80) ~= nil
                end
            end
        end
        local v81 = not v78
        if v81 then
            v81 = u7.createElement(u19, {
                ["Name"] = "Auto Restart Game",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.AutoRestartGame],
                    ["OnChange"] = function(p82) --[[ Name: OnChange, Line 353 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.AutoRestartGame, p82)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v81 then
            v33[v77 + 1] = v81
        end
        local v83 = #v33
        v33[v83 + 1] = u7.createElement("TextLabel", {
            ["AutomaticSize"] = "Y",
            ["SizeConstraint"] = "RelativeXX",
            ["Text"] = "<b>GAME SETTINGS</b>",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0),
            ["TextColor3"] = u18.textPrimary
        }, { u7.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 20
            }) })
        local v84 = v83 + 2
        local v85 = u7.createElement
        local v86 = u19
        local v87 = {
            ["Name"] = "Deathmatch Time",
            ["Hint"] = "(Seconds into the match that the bed will automatically break)",
            ["Size"] = u21
        }
        local v88 = {}
        local v89 = u7.createElement
        local v90 = u20
        local v91 = {
            ["NumbersOnly"] = true
        }
        local v92 = p22.store.CustomMatch.deathmatchTime
        v91.Text = tostring(v92)
        local v93 = p22.store.CustomMatch.deathmatchTime
        v91.PlaceholderText = tostring(v93)
        function v91.OnFocusLost(p94) --[[ Line: 399 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            local v95 = tonumber(p94)
            if v95 ~= 0 and (v95 == v95 and v95) then
                u6.Controllers.CustomMatchController:setDeathmatchTime(v95)
            end
        end
        __set_list(v88, 1, {v89(v90, v91)})
        v33[v84] = v85(v86, v87, v88)
        local v96
        if v24 == nil then
            v96 = v24
        else
            v96 = v24.customMatchConfig
            if v96 ~= nil then
                v96 = v96.hostPanel
                if v96 ~= nil then
                    local v97 = v96.disabledToggles
                    local v98 = u15.Emotes
                    v96 = table.find(v97, v98) ~= nil
                end
            end
        end
        local v99 = not v96
        if v99 then
            v99 = u7.createElement(u19, {
                ["Name"] = "Emote Effects",
                ["Hint"] = "Toggles emote effects",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.Emotes],
                    ["OnChange"] = function(p100) --[[ Name: OnChange, Line 428 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.Emotes, p100)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v99 then
            v33[v83 + 3] = v99
        end
        local v101 = #v33
        local v102
        if v24 == nil then
            v102 = v24
        else
            v102 = v24.customMatchConfig
            if v102 ~= nil then
                v102 = v102.hostPanel
                if v102 ~= nil then
                    local v103 = v102.disabledToggles
                    local v104 = u15.BypassPlacementLimits
                    v102 = table.find(v103, v104) ~= nil
                end
            end
        end
        local v105 = not v102
        if v105 then
            v105 = u7.createElement(u19, {
                ["Name"] = "Bypass Placement Limits",
                ["Hint"] = "(Ex. Removes tesla placement limit)",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.BypassPlacementLimits],
                    ["OnChange"] = function(p106) --[[ Name: OnChange, Line 469 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.BypassPlacementLimits, p106)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v105 then
            v33[v101 + 1] = v105
        end
        local v107 = #v33
        local v108
        if v24 == nil then
            v108 = v24
        else
            v108 = v24.customMatchConfig
            if v108 ~= nil then
                v108 = v108.hostPanel
                if v108 ~= nil then
                    local v109 = v108.disabledToggles
                    local v110 = u15.PvP
                    v108 = table.find(v109, v110) ~= nil
                end
            end
        end
        local v111 = not v108
        if v111 then
            v111 = u7.createElement(u19, {
                ["Name"] = "PvP",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.PvP],
                    ["OnChange"] = function(p112) --[[ Name: OnChange, Line 509 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.PvP, p112)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }), u7.createElement(u9, {
                        ["Text"] = "Host Only",
                        ["Value"] = u16.HOST_ONLY
                    }) }) })
        end
        if v111 then
            v33[v107 + 1] = v111
        end
        local v113 = #v33
        local v114
        if v24 == nil then
            v114 = v24
        else
            v114 = v24.customMatchConfig
            if v114 ~= nil then
                v114 = v114.hostPanel
                if v114 ~= nil then
                    local v115 = v114.disabledToggles
                    local v116 = u15.BedBreaking
                    v114 = table.find(v115, v116) ~= nil
                end
            end
        end
        local v117 = not v114
        if v117 then
            v117 = u7.createElement(u19, {
                ["Name"] = "Bed Breaking",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.BedBreaking],
                    ["OnChange"] = function(p118) --[[ Name: OnChange, Line 553 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.BedBreaking, p118)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }), u7.createElement(u9, {
                        ["Text"] = "Host Only",
                        ["Value"] = u16.HOST_ONLY
                    }) }) })
        end
        if v117 then
            v33[v113 + 1] = v117
        end
        local v119 = #v33
        local v120
        if v24 == nil then
            v120 = v24
        else
            v120 = v24.customMatchConfig
            if v120 ~= nil then
                v120 = v120.hostPanel
                if v120 ~= nil then
                    local v121 = v120.disabledToggles
                    local v122 = u15.BlockBreaking
                    v120 = table.find(v121, v122) ~= nil
                end
            end
        end
        local v123 = not v120
        if v123 then
            v123 = u7.createElement(u19, {
                ["Name"] = "Block Breaking",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.BlockBreaking],
                    ["OnChange"] = function(p124) --[[ Name: OnChange, Line 597 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.BlockBreaking, p124)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }), u7.createElement(u9, {
                        ["Text"] = "Host Only",
                        ["Value"] = u16.HOST_ONLY
                    }) }) })
        end
        if v123 then
            v33[v119 + 1] = v123
        end
        local v125 = #v33
        local v126
        if v24 == nil then
            v126 = v24
        else
            v126 = v24.customMatchConfig
            if v126 ~= nil then
                v126 = v126.hostPanel
                if v126 ~= nil then
                    local v127 = v126.disabledToggles
                    local v128 = u15.BlockPlacing
                    v126 = table.find(v127, v128) ~= nil
                end
            end
        end
        local v129 = not v126
        if v129 then
            v129 = u7.createElement(u19, {
                ["Name"] = "Block Placing",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.BlockPlacing],
                    ["OnChange"] = function(p130) --[[ Name: OnChange, Line 641 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.BlockPlacing, p130)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }), u7.createElement(u9, {
                        ["Text"] = "Host Only",
                        ["Value"] = u16.HOST_ONLY
                    }) }) })
        end
        if v129 then
            v33[v125 + 1] = v129
        end
        local v131 = #v33
        local v132
        if v24 == nil then
            v132 = v24
        else
            v132 = v24.customMatchConfig
            if v132 ~= nil then
                v132 = v132.hostPanel
                if v132 ~= nil then
                    local v133 = v132.disabledToggles
                    local v134 = u15.HideAllNametags
                    v132 = table.find(v133, v134) ~= nil
                end
            end
        end
        local v135 = not v132
        if v135 then
            v135 = u7.createElement(u19, {
                ["Name"] = "Hide All Nametags",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.HideAllNametags],
                    ["OnChange"] = function(p136) --[[ Name: OnChange, Line 685 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.HideAllNametags, p136)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }), u7.createElement(u9, {
                        ["Text"] = "Host Only",
                        ["Value"] = u16.HOST_ONLY
                    }) }) })
        end
        if v135 then
            v33[v131 + 1] = v135
        end
        local v137 = #v33
        local v138
        if v24 == nil then
            v138 = v24
        else
            v138 = v24.customMatchConfig
            if v138 ~= nil then
                v138 = v138.hostPanel
                if v138 ~= nil then
                    local v139 = v138.disabledToggles
                    local v140 = u15.KeepInventoryOnDeath
                    v138 = table.find(v139, v140) ~= nil
                end
            end
        end
        local v141 = not v138
        if v141 then
            v141 = u7.createElement(u19, {
                ["Name"] = "Keep Inventory on Death",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.KeepInventoryOnDeath],
                    ["OnChange"] = function(p142) --[[ Name: OnChange, Line 729 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.KeepInventoryOnDeath, p142)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v141 then
            v33[v137 + 1] = v141
        end
        local v143 = #v33
        local v144
        if v24 == nil then
            v144 = v24
        else
            v144 = v24.customMatchConfig
            if v144 ~= nil then
                v144 = v144.hostPanel
                if v144 ~= nil then
                    local v145 = v144.disabledToggles
                    local v146 = u15.AllowRandomlySelectedShopItems
                    v144 = table.find(v145, v146) ~= nil
                end
            end
        end
        local v147 = not v144
        if v147 then
            v147 = u7.createElement(u19, {
                ["Name"] = "Allow Randomly Selected Shop Items",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.AllowRandomlySelectedShopItems],
                    ["OnChange"] = function(p148) --[[ Name: OnChange, Line 769 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.AllowRandomlySelectedShopItems, p148)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v147 then
            v33[v143 + 1] = v147
        end
        local v149 = #v33
        local v150
        if v24 == nil then
            v150 = v24
        else
            v150 = v24.customMatchConfig
            if v150 ~= nil then
                v150 = v150.hostPanel
                if v150 ~= nil then
                    local v151 = v150.disabledToggles
                    local v152 = u15.AllowRandomlySelectedShopItems
                    v150 = table.find(v151, v152) ~= nil
                end
            end
        end
        local v153 = not v150
        if v153 then
            local v154 = {
                ["Name"] = "Randomly Selected Shop Item Count",
                ["Hint"] = "",
                ["Size"] = u21
            }
            local v155 = {}
            local v156 = #v155
            local v157 = {}
            local v158 = p22.store.CustomMatch.randomlySelectedShopItemCount
            local v159 = v158 == nil and 0 or v158
            v157.Text = tostring(v159)
            local v160 = p22.store.CustomMatch.randomlySelectedShopItemCount
            local v161 = v160 == nil and 0 or v160
            v157.PlaceholderText = tostring(v161)
            v157.NumbersOnly = true
            function v157.OnFocusLost(p162) --[[ Line: 822 ]]
                --[[
                Upvalues:
                    [1] = u6
                --]]
                local v163 = tonumber(p162)
                if v163 ~= 0 and (v163 == v163 and v163) then
                    u6.Controllers.CustomMatchController:setRandomlySelectedShopItemCount(v163)
                end
            end
            v155[v156 + 1] = u7.createElement(u20, v157)
            v153 = u7.createElement(u19, v154, v155)
        end
        if v153 then
            v33[v149 + 1] = v153
        end
        local v164 = #v33
        v33[v164 + 1] = u7.createElement("TextLabel", {
            ["AutomaticSize"] = "Y",
            ["SizeConstraint"] = "RelativeXX",
            ["Text"] = "<b>FEATURE SETTINGS</b>",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0),
            ["TextColor3"] = u18.textPrimary
        }, { u7.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 20
            }) })
        local v165
        if v24 == nil then
            v165 = v24
        else
            v165 = v24.customMatchConfig
            if v165 ~= nil then
                v165 = v165.hostPanel
                if v165 ~= nil then
                    local v166 = v165.disabledToggles
                    local v167 = u15.SpawnOres
                    v165 = table.find(v166, v167) ~= nil
                end
            end
        end
        local v168 = not v165
        if v168 then
            v168 = u7.createElement(u19, {
                ["Name"] = "Spawn Ores",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.SpawnOres],
                    ["OnChange"] = function(p169) --[[ Name: OnChange, Line 872 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.SpawnOres, p169)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v168 then
            v33[v164 + 2] = v168
        end
        local v170 = #v33
        local v171
        if v24 == nil then
            v171 = v24
        else
            v171 = v24.customMatchConfig
            if v171 ~= nil then
                v171 = v171.hostPanel
                if v171 ~= nil then
                    local v172 = v171.disabledToggles
                    local v173 = u15.SpawnGuardians
                    v171 = table.find(v172, v173) ~= nil
                end
            end
        end
        local v174 = not v171
        if v174 then
            v174 = u7.createElement(u19, {
                ["Name"] = "Spawn Diamond Guardians",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.SpawnGuardians],
                    ["OnChange"] = function(p175) --[[ Name: OnChange, Line 912 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.SpawnGuardians, p175)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v174 then
            v33[v170 + 1] = v174
        end
        local v176 = #v33
        local v177
        if v24 == nil then
            v177 = v24
        else
            v177 = v24.customMatchConfig
            if v177 ~= nil then
                v177 = v177.hostPanel
                if v177 ~= nil then
                    local v178 = v177.disabledToggles
                    local v179 = u15.SpawnTitan
                    v177 = table.find(v178, v179) ~= nil
                end
            end
        end
        local v180 = not v177
        if v180 then
            v180 = u7.createElement(u19, {
                ["Name"] = "Spawn Titan",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.SpawnTitan],
                    ["OnChange"] = function(p181) --[[ Name: OnChange, Line 952 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.SpawnTitan, p181)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v180 then
            v33[v176 + 1] = v180
        end
        local v182 = #v33
        local v183
        if v24 == nil then
            v183 = v24
        else
            v183 = v24.customMatchConfig
            if v183 ~= nil then
                v183 = v183.hostPanel
                if v183 ~= nil then
                    local v184 = v183.disabledToggles
                    local v185 = u15.Recalling
                    v183 = table.find(v184, v185) ~= nil
                end
            end
        end
        local v186 = not v183
        if v186 then
            v186 = u7.createElement(u19, {
                ["Name"] = "Base Recalling",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.Recalling],
                    ["OnChange"] = function(p187) --[[ Name: OnChange, Line 992 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.Recalling, p187)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v186 then
            v33[v182 + 1] = v186
        end
        local v188 = #v33
        local v189
        if v24 == nil then
            v189 = v24
        else
            v189 = v24.customMatchConfig
            if v189 ~= nil then
                v189 = v189.hostPanel
                if v189 ~= nil then
                    local v190 = v189.disabledToggles
                    local v191 = u15.LateJoining
                    v189 = table.find(v190, v191) ~= nil
                end
            end
        end
        local v192 = not v189
        if v192 then
            v192 = u7.createElement(u19, {
                ["Name"] = "Weather Type",
                ["Hint"] = "",
                ["Size"] = u21
            }, { u7.createElement(u5, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["DefaultItem"] = {
                        ["text"] = p22.store.CustomMatch.dropdowns[u14.Weather],
                        ["value"] = p22.store.CustomMatch.dropdowns[u14.Weather]
                    },
                    ["PlaceholderText"] = u4.isHoarceKat() and "hi" or u6.Controllers.CustomMatchController:generateDropdownItems(u14.Weather)[1].text,
                    ["Items"] = u4.isHoarceKat() and {
                        {
                            ["text"] = "hi",
                            ["value"] = "hi"
                        }
                    } or u6.Controllers.CustomMatchController:generateDropdownItems(u14.Weather),
                    ["OnItemSelected"] = function(p193) --[[ Name: OnItemSelected, Line 1042 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u6
                            [3] = u14
                        --]]
                        if not u4.isHoarceKat() then
                            u6.Controllers.CustomMatchController:setDropdown(u14.Weather, p193)
                        end
                    end
                }) })
        end
        if v192 then
            v33[v188 + 1] = v192
        end
        local v194 = #v33
        local v195
        if v24 == nil then
            v195 = v24
        else
            v195 = v24.customMatchConfig
            if v195 ~= nil then
                v195 = v195.hostPanel
                if v195 ~= nil then
                    local v196 = v195.disabledToggles
                    local v197 = u15.PassiveWeatherEffectsEnabled
                    v195 = table.find(v196, v197) ~= nil
                end
            end
        end
        local v198 = not v195
        if v198 then
            v198 = u7.createElement(u19, {
                ["Name"] = "Passive Weather Effects",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.PassiveWeatherEffectsEnabled],
                    ["OnChange"] = function(p199) --[[ Name: OnChange, Line 1077 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.PassiveWeatherEffectsEnabled, p199)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v198 then
            v33[v194 + 1] = v198
        end
        local v200 = #v33
        if v24 ~= nil then
            v24 = v24.customMatchConfig
            if v24 ~= nil then
                v24 = v24.hostPanel
                if v24 ~= nil then
                    local v201 = v24.disabledToggles
                    local v202 = u15.WeatherEventsEnabled
                    v24 = table.find(v201, v202) ~= nil
                end
            end
        end
        local v203 = not v24
        if v203 then
            v203 = u7.createElement(u19, {
                ["Name"] = "Major Weather Events",
                ["Size"] = u21
            }, { u7.createElement(u10, {
                    ["Value"] = p22.store.CustomMatch.generalToggles[u15.WeatherEventsEnabled],
                    ["OnChange"] = function(p204) --[[ Name: OnChange, Line 1117 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u15
                        --]]
                        u6.Controllers.CustomMatchController:setToggle(u15.WeatherEventsEnabled, p204)
                    end
                }, { u7.createElement(u9, {
                        ["Text"] = "On",
                        ["Value"] = u16.ON
                    }), u7.createElement(u9, {
                        ["Text"] = "Off",
                        ["Value"] = u16.OFF,
                        ["ActiveColor"] = u18.backgroundError
                    }) }) })
        end
        if v203 then
            v33[v200 + 1] = v203
        end
        return u7.createElement(u3, v32, v33)
    end)
}