local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.Button
local u6 = v3.ColorUtil
local u7 = v3.DeviceUtil
local u8 = v3.Empty
local u9 = v3.OfflinePlayerUtil
local u10 = v3.SlideIn
local u11 = v3.WidgetComponent
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u18 = v1.import(script, script.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting
local u19 = v1.import(script, script.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v121 = v15.new(u14)(function(u22, p23) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u17
        [3] = u9
        [4] = u12
        [5] = u14
        [6] = u21
        [7] = u8
        [8] = u6
        [9] = u5
        [10] = u13
        [11] = u2
        [12] = u19
        [13] = u18
        [14] = u20
        [15] = u4
        [16] = u11
        [17] = u10
    --]]
    local v24 = p23.useState
    local v25 = p23.useEffect
    local u26
    if u7.isHoarceKat() then
        u26 = { u9.Dummy.oiogy, u9.Dummy.spleenhook, u9.Dummy.SnickTrix }
    else
        local v27 = u17:GetPlayers()
        u26 = table.create(#v27)
        for v28, v29 in v27 do
            local _ = v28 - 1
            u26[v28] = u9.getOfflinePlayer(v29)
        end
    end
    local u30, u31 = v24(u26)
    local u32, u33 = v24(u22.AddedOfflinePlayers)
    local u34, u35 = v24(u22.RegionId)
    local function v45(p36, p37) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u26
        --]]
        if p36 == "" then
            return u31(u26)
        end
        local v38 = 0
        local v39 = {}
        for v40, v41 in u26 do
            local _ = v40 - 1
            local v42 = v41.displayName
            local v43 = table.find(p37, v42) ~= nil
            if not v43 then
                local v44 = v41.name
                v43 = table.find(p37, v44) ~= nil
            end
            if v43 == true then
                v38 = v38 + 1
                v39[v38] = v41
            end
        end
        u31(v39)
    end
    local u46 = nil
    local function v53(p47, p48) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        local v49 = {}
        for v50, v51 in p47 do
            local v52 = u46(v51, v50 - 1, p48)
            table.insert(v49, v52)
        end
        return v49
    end
    u46 = function(u54, p55, u56) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u14
            [3] = u21
            [4] = u8
            [5] = u6
            [6] = u5
            [7] = u32
            [8] = u33
        --]]
        local v57 = u12.Controllers.CustomMatchController.playerAvatarImages[u54.userId]
        local v58 = u14.createFragment
        local v59 = {}
        local v60 = u14.createElement
        local v61 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(1, 0, 0, 40),
            ["BackgroundColor3"] = u21.backgroundPrimary,
            ["LayoutOrder"] = p55
        }
        local v62 = {}
        local v63 = u14.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.12, 0)
        })
        local v64 = u14.createElement
        local v65 = u8
        local v66 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v67 = {}
        local v68 = u14.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.15, 0),
            ["PaddingBottom"] = UDim.new(0.15, 0),
            ["PaddingLeft"] = UDim.new(0.03, 0),
            ["PaddingRight"] = UDim.new(0.03, 0)
        })
        local v69 = u14.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 12)
        })
        local v70 = u14.createElement(u8, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.4, 1)
        }, { u14.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u14.createElement("ImageLabel", {
                ["LayoutOrder"] = 1,
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v57
            }, { u14.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(100, 0)
                }) }), u14.createElement(u8, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.76, 1)
            }, { u14.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.05, 0)
                }), u14.createElement(u8, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.55)
                }, { u14.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0.03, 0)
                    }), u14.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Left",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 2,
                        ["AutoLocalize"] = false,
                        ["Position"] = UDim2.fromScale(0, 0),
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Text"] = "<b>" .. u54.displayName .. "</b>",
                        ["TextColor3"] = u6.WHITE
                    }, { u14.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 18
                        }) }) }), u14.createElement("TextLabel", {
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
                    ["Text"] = "@" .. u54.name,
                    ["TextColor3"] = u6.WHITE
                }, { u14.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) }) }) })
        local v71 = u14.createElement
        local v72 = u8
        local v73 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.6, -12, 1, 0)
        }
        local v74 = { (u14.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            })) }
        local v75 = u14.createElement
        local v76 = u5
        local v81 = {
            ["Text"] = "Remove",
            ["ZIndex"] = 2,
            ["CornerRadius"] = UDim.new(0.12, 0),
            ["Size"] = UDim2.fromScale(0.4, 1),
            ["TextLabel"] = {
                ["ZIndex"] = 2,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(0.95, 0.65)
            },
            ["BackgroundColor3"] = Color3.fromRGB(212, 57, 59),
            ["OnClick"] = function() --[[ Name: OnClick, Line 217 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u56
                    [3] = u54
                    [4] = u32
                    [5] = u33
                --]]
                if u12.Controllers.WorldGuardController:requestRemovePlayer(u56, u54.userId) then
                    local v77 = 0
                    local v78 = {}
                    for v79, v80 in u32 do
                        local _ = v79 - 1
                        if v80.userId ~= u54.userId == true then
                            v77 = v77 + 1
                            v78[v77] = v80
                        end
                    end
                    u33(v78)
                end
            end
        }
        v74.RemoveButton = v75(v76, v81)
        __set_list(v67, 1, {v68, v69, v70, v71(v72, v73, v74)})
        __set_list(v62, 1, {v63, v64(v65, v66, v67)})
        v59.PlayerRow = v60("Frame", v61, v62)
        return v58(v59)
    end
    v25(function() --[[ Line: 243 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u13
            [3] = u17
            [4] = u2
            [5] = u22
        --]]
        if u7.isHoarceKat() then
            return nil
        end
        local u82 = u13.new()
        local u83 = true
        u82:GiveTask(function() --[[ Line: 249 ]]
            --[[
            Upvalues:
                [1] = u83
            --]]
            u83 = false
            return u83
        end)
        local u84 = u17.LocalPlayer.Character
        task.delay(0.1, function() --[[ Line: 255 ]]
            --[[
            Upvalues:
                [1] = u84
                [2] = u83
                [3] = u82
                [4] = u2
                [5] = u22
            --]]
            local v85 = u84
            if v85 ~= nil then
                v85 = v85:FindFirstChildWhichIsA("Humanoid")
            end
            if u83 and v85 then
                u82:GiveTask(v85:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 262 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u22
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u22.AppId)
                end))
            end
        end)
        task.delay(0.1, function() --[[ Line: 268 ]]
            --[[
            Upvalues:
                [1] = u84
                [2] = u83
                [3] = u2
                [4] = u22
            --]]
            local v86 = u84
            if v86 ~= nil then
                v86 = v86.PrimaryPart
                if v86 ~= nil then
                    v86 = v86.Position
                end
            end
            if not v86 then
                return nil
            end
            while true do
                local v87 = task.wait(0.05)
                if v87 ~= 0 and (v87 == v87 and v87) then
                    v87 = u83
                end
                if v87 == 0 or (v87 ~= v87 or not v87) then
                    return
                end
                local v88 = u84.PrimaryPart
                if v88 ~= nil then
                    v88 = v88.Position
                end
                if not v88 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u22.AppId)
                    return nil
                end
                if ((v88 - v86) * Vector3.new(1, 0.3, 1)).Magnitude > 1 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u22.AppId)
                    return nil
                end
            end
        end)
        return function() --[[ Line: 305 ]]
            --[[
            Upvalues:
                [1] = u82
            --]]
            u82:DoCleaning()
        end
    end)
    local v89 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u7.isSmallScreen()
    }
    local v90 = {}
    local v91 = #v90
    local v92 = {}
    local _ = #v92
    local v93 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.25, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.7, 0.5)
    }
    local v94 = {}
    local v95 = #v94
    local v96 = {
        ["ClipsDescendents"] = false,
        ["Title"] = "World Guard Menu",
        ["AppId"] = u22.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 334 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u22
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u22.AppId)
        end,
        ["ContentUIPadding"] = u14.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 5),
            ["PaddingLeft"] = UDim.new(0, 5),
            ["PaddingRight"] = UDim.new(0, 5)
        })
    }
    local v97 = {
        u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Left",
            ["Padding"] = UDim.new(0, 10)
        }),
        ["SpacerFrame"] = u14.createElement(u8, {
            ["LayoutOrder"] = 0
        })
    }
    local v98 = #v97
    local v99 = {
        ["Name"] = "Region Name",
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.11),
        ["LeftSize"] = UDim2.fromScale(0.27, 1),
        ["RightSize"] = UDim2.fromScale(0.73, 1)
    }
    local v100 = {}
    local v101 = #v100
    local v103 = {
        ["Text"] = u34,
        ["PlaceholderText"] = u34 == nil and "" or u34,
        ["NumbersOnly"] = false,
        ["MaxCharacters"] = 16,
        ["OnFocusLost"] = function(p102) --[[ Line: 375 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u34
                [3] = u35
            --]]
            if p102 == "" or #p102 < 2 then
                return nil
            end
            if u12.Controllers.WorldGuardController:requestRenameRegion(u34, p102) then
                u35(p102)
            end
        end
    }
    v100[v101 + 1] = u14.createElement(u19, v103)
    v100[v101 + 2] = u14.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0.12, 0)
    })
    v97["Region Name"] = u14.createElement(u18, v99, v100)
    local v104 = {
        ["Size"] = UDim2.fromScale(1, 0.11)
    }
    local v105 = {}
    for v106 = 1, #u26 do
        local v107 = u26[v106]
        local _ = v106 - 1
        local v108 = {
            ["key"] = v107.displayName,
            ["aliases"] = { v107.name }
        }
        table.insert(v105, v108)
    end
    v104.Items = v105
    v104.InputText = ""
    v104.OnTextChange = v45
    v104.PlaceHolderText = "Add Player"
    function v104.OnFocusLost(p109) --[[ Line: 412 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u2
            [3] = u12
            [4] = u34
            [5] = u32
            [6] = u33
        --]]
        if not p109 then
            return nil
        end
        if #u30 == 0 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = "[WG]: No online player was found."
            })
            return nil
        end
        local v110 = u30[1]
        if u12.Controllers.WorldGuardController:requestAddPlayer(u34, v110.userId) and table.find(u32, v110) == nil then
            local v111 = {}
            local v112 = #v111
            local v113 = #u32
            table.move(u32, 1, v113, v112 + 1, v111)
            v111[v112 + v113 + 1] = v110
            u33(v111)
        end
        u12.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu()
    end
    v104.LayoutOrder = 2
    v97.Searchbar = u14.createElement(u20, v104)
    local v114 = {
        ["AdditionalSpace"] = 40
    }
    local v115 = {
        ["LayoutOrder"] = 3
    }
    local v116
    if u7.isMobileControls() then
        v116 = UDim2.new(1, 0, 0.4, 0)
    else
        v116 = UDim2.new(1, 0, 0.52, 0)
    end
    v115.Size = v116
    v114.ScrollingFrameProps = v115
    local v117 = { u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["Padding"] = UDim.new(0, 4)
        }) }
    local v118 = #v117
    for v119, v120 in v53(u32, u34) do
        v117[v118 + v119] = v120
    end
    v97[v98 + 1] = u14.createElement(u4, v114, v117)
    v97["Delete Button"] = u14.createElement(u8, {
        ["LayoutOrder"] = 10,
        ["Size"] = UDim2.fromScale(0.3, 0.11),
        ["Position"] = UDim2.fromScale(0, 0)
    }, { u14.createElement(u5, {
            ["Text"] = "Delete Region",
            ["ZIndex"] = 2,
            ["CornerRadius"] = UDim.new(0.12, 0),
            ["Size"] = UDim2.fromScale(1, 1),
            ["TextLabel"] = {
                ["ZIndex"] = 2,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(0.95, 0.65)
            },
            ["BackgroundColor3"] = Color3.fromRGB(212, 57, 59),
            ["OnClick"] = function() --[[ Name: OnClick, Line 472 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u34
                    [3] = u2
                    [4] = u22
                --]]
                if u12.Controllers.WorldGuardController:requestRegionDeletion(u34) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u22.AppId)
                end
            end
        }) })
    v94[v95 + 1] = u14.createElement(u11, v96, v97)
    v92[u22.AppId] = u14.createElement("Frame", v93, v94)
    v90[v91 + 1] = u14.createElement(u10, {}, v92)
    return u14.createElement("ScreenGui", v89, v90)
end)
return {
    ["WorldGuardMenu"] = v16.connect(function(p122, p123) --[[ Line: 487 ]]
        local v124 = {
            ["store"] = p122
        }
        for v125, v126 in p123 do
            v124[v125] = v126
        end
        return v124
    end)(v121)
}