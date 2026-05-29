local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.Action
local u6 = v4.ButtonComponent
local u7 = v4.ColorUtil
local u8 = v4.DarkBackground
local u9 = v4.DeviceUtil
local u10 = v4.Empty
local u11 = v4.Padding
local u12 = v4.SliderComponent
local u13 = v4.StringUtil
local u14 = v4.getDefaultMobileLayoutDefinition
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mobile", "mobile-layout-definition-converter").MobileLayoutDefinitionConverter
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u23 = v1.import(script, script.Parent, "drag-window").DragWindow
local v24 = v1.import(script, script.Parent, "mobile-layout-customization-plane")
local u25 = v24.ButtonUpdateStartSignal
local u26 = v24.MobileLayoutCustomizationPlane
local u27 = v1.import(script, script.Parent, "mobile-layout-util").MobileLayoutUtil
local u28 = {
    "SwordSwing",
    "Sprint",
    "Jump",
    "Ping",
    "MoveMountDown",
    "MoveMountUp",
    "AutoBridge",
    "Interact",
    "BlockBreak",
    "Consume",
    "FireProjectile",
    "DropItem"
}
local u29 = {
    "KitPrimary",
    "KitSecondary",
    "KitTertiary",
    "ItemPrimary",
    "ItemSecondary",
    "MiscPrimary",
    "MiscSecondary",
    "Recall"
}
local u30 = nil
local u31 = nil
local u32 = nil
local function v146(_, p33) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u2
        [3] = u30
        [4] = u29
        [5] = u28
        [6] = u27
        [7] = u13
        [8] = u15
        [9] = u25
        [10] = u8
        [11] = u11
        [12] = u7
        [13] = u12
        [14] = u10
        [15] = u6
        [16] = u19
        [17] = u22
        [18] = u31
        [19] = u20
        [20] = u21
        [21] = u9
        [22] = u3
        [23] = u32
        [24] = u23
        [25] = u26
    --]]
    local v34 = p33.useState
    local v35 = p33.useValue
    local v36 = p33.useEffect
    local u37, u38 = v34(nil)
    local u39, _ = v34(u16.createRef())
    local u40, _ = v34(u16.createRef())
    local v41 = v35(u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController").mobileLayoutDefinition)
    local v42 = u30(v41.value, u29)
    local v43 = u30(v41.value, u28)
    local v44 = {}
    for _, v45 in v42 do
        v44[v45[1]] = v45[2]
    end
    local u46 = v35(v44)
    local v47 = {}
    for _, v48 in v43 do
        v47[v48[1]] = v48[2]
    end
    local u49 = v35(v47)
    local u50 = u27.ButtonMaxSize
    local function v52(p51) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38(p51)
    end
    local u53 = v35({})
    local u54 = v35({})
    local v55, u56 = v34(false)
    local v57, u58 = v34(false)
    local u59 = v35({})
    v36(function() --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u46
            [3] = u59
            [4] = u49
            [5] = u25
            [6] = u53
            [7] = u56
            [8] = u54
            [9] = u58
        --]]
        local u60 = u15.new()
        for v61, v62 in u46.value do
            u59.value[v61] = {
                ["size"] = v62.size,
                ["position"] = v62.position
            }
        end
        for v63, v64 in u49.value do
            u59.value[v63] = {
                ["size"] = v64.size,
                ["position"] = v64.position
            }
        end
        u60:GiveTask(u25:Connect(function(p65) --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u56
                [3] = u54
                [4] = u58
            --]]
            if not p65 then
                return nil
            end
            local v66 = u53.value
            local v67 = {
                {
                    ["ref"] = p65,
                    ["size"] = p65.Size,
                    ["position"] = p65.Position
                }
            }
            table.insert(v66, v67)
            u56(true)
            table.clear(u54.value)
            u58(false)
        end))
        return function() --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            u60:DoCleaning()
        end
    end, {})
    local v68 = {
        ["DisplayOrder"] = 100,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["ScreenInsets"] = "DeviceSafeInsets"
    }
    local v69 = { u16.createElement(u8, {
            ["AppId"] = "MobileCustomizationApp"
        }) }
    local _ = #v69
    local v70 = {
        ["DisplayOrder"] = 120,
        ["ResetOnSpawn"] = false
    }
    local v71 = {}
    local v72 = #v71
    local v73 = {
        ["WindowFrameProps"] = {
            ["ZIndex"] = 100,
            ["Size"] = UDim2.fromScale(0.3, 0.7)
        }
    }
    local v74 = { u16.createElement(u11, {
            ["Padding"] = UDim.new(0.04, 0)
        }), u16.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Bottom",
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v75 = #v74
    local v76 = {
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.fromScale(0, 0),
        ["Size"] = UDim2.fromScale(1, 0.05),
        ["TextColor3"] = u7.WHITE
    }
    local v77
    if u37 == nil then
        v77 = u37
    else
        v77 = string.split(u37.Name, "-")[2]
    end
    if v77 == nil then
        if u37 == nil then
            v77 = u37
        else
            v77 = u37.Name
        end
    end
    v76.Text = "Selected: <b>" .. tostring(v77) .. "</b>"
    v76.RichText = true
    v76.ZIndex = 100
    v74[v75 + 1] = u16.createElement("TextLabel", v76)
    local v78 = {
        ["LayoutOrder"] = 1,
        ["ZIndex"] = 100,
        ["Size"] = UDim2.fromScale(1, 0.175)
    }
    local v79 = { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Bottom",
            ["Padding"] = UDim.new(0.1, 0)
        }) }
    local v80 = #v79
    local v81 = {
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.fromScale(0, 0),
        ["Size"] = UDim2.fromScale(1, 0.3),
        ["TextColor3"] = u7.WHITE
    }
    local v82
    if u37 == nil then
        v82 = u37
    else
        v82 = u37.AbsoluteSize.X
    end
    local v83 = v82 == nil and 0 or v82
    local v84
    if u37 == nil then
        v84 = u37
    else
        v84 = u37.AbsoluteSize.Y
    end
    local _ = v84 == nil and 0 or v84
    v81.Text = "Scale: " .. u13.roundNumber(v83 / u50 * 100, 1) .. "%"
    v81.ZIndex = 100
    v81[u16.Ref] = u39
    v79[v80 + 1] = u16.createElement("TextLabel", v81)
    v79[v80 + 2] = u16.createElement(u12, {
        ["Max"] = 1,
        ["StepSize"] = 0.01,
        ["ZIndex"] = 110,
        ["Position"] = UDim2.fromScale(0, 0.3),
        ["Size"] = UDim2.fromScale(0.8, 0.35),
        ["InitialValue"] = not u37 and 0.5 or u37.AbsoluteSize.X / u50,
        ["Min"] = u27.ButtonMinSize / u27.ButtonMaxSize,
        ["ThemeColor"] = u7.WHITE,
        ["BarColor"] = Color3.fromRGB(43, 43, 43),
        ["OnChange"] = function(p85) --[[ Name: OnChange, Line 230 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u50
                [3] = u39
                [4] = u13
            --]]
            if u37 then
                u37.Size = UDim2.new(0, u50 * p85, 0, u50 * p85)
                local v86 = u39:getValue()
                if v86 then
                    local v87 = u37.AbsoluteSize.X
                    local _ = u37.AbsoluteSize.Y
                    v86.Text = "Scale: " .. u13.roundNumber(v87 / u50 * 100, 1) .. "%"
                end
            end
        end
    })
    v74.SizeSlider = u16.createElement(u10, v78, v79)
    local v88 = {
        ["LayoutOrder"] = 2,
        ["ZIndex"] = 100,
        ["Size"] = UDim2.fromScale(1, 0.45)
    }
    local v89 = {}
    local v90 = #v89
    local v91 = {
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.49),
        ["Size"] = UDim2.fromScale(0.45, 0.3),
        ["TextColor3"] = u7.WHITE
    }
    local v92
    if u37 == nil then
        v92 = u37
    else
        v92 = u37.AbsolutePosition.X
    end
    local v93 = v92 == nil and 0 or v92
    local v94
    if u37 == nil then
        v94 = u37
    else
        v94 = u37.AbsolutePosition.Y
    end
    local v95 = v94 == nil and 0 or v94
    v91.Text = "Position\n" .. u13.roundNumber(v93, 1) .. ", " .. u13.roundNumber(v95, 1)
    v91.ZIndex = 100
    v91[u16.Ref] = u40
    v89[v90 + 1] = u16.createElement("TextLabel", v91)
    v89.LeftArrow = u16.createElement(u6, {
        ["BackgroundTransparency"] = 0.3,
        ["ZIndex"] = 100,
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["Size"] = UDim2.fromScale(0.325, 0.325),
        ["BackgroundColor3"] = u7.BLACK,
        ["OnClick"] = function() --[[ Name: OnClick, Line 283 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u40
                [3] = u13
                [4] = u2
            --]]
            if u37 then
                u37.Position = u37.Position + UDim2.fromOffset(-1, 0)
                local v96 = u40:getValue()
                if v96 then
                    local v97 = u37.AbsolutePosition.X
                    local v98 = u37.AbsolutePosition.Y
                    v96.Text = "Position\n" .. u13.roundNumber(v97, 1) .. ", " .. u13.roundNumber(v98, 1)
                    return
                end
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "Tap on a button first"
                })
            end
        end
    }, { u16.createElement(u11, {
            ["Padding"] = UDim.new(0.1, 0)
        }), u16.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 100,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.7, 0.7),
            ["Image"] = u19.ARROW_LEFT
        }), u16.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    v89.TopArrow = u16.createElement(u6, {
        ["BackgroundTransparency"] = 0.3,
        ["Rotation"] = 90,
        ["ZIndex"] = 100,
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["Size"] = UDim2.fromScale(0.325, 0.325),
        ["BackgroundColor3"] = u7.BLACK,
        ["OnClick"] = function() --[[ Name: OnClick, Line 323 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u40
                [3] = u13
                [4] = u2
            --]]
            if u37 then
                u37.Position = u37.Position + UDim2.fromOffset(0, -1)
                local v99 = u40:getValue()
                if v99 then
                    local v100 = u37.AbsolutePosition.X
                    local v101 = u37.AbsolutePosition.Y
                    v99.Text = "Position\n" .. u13.roundNumber(v100, 1) .. ", " .. u13.roundNumber(v101, 1)
                    return
                end
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "Tap on a button first"
                })
            end
        end
    }, { u16.createElement(u11, {
            ["Padding"] = UDim.new(0.1, 0)
        }), u16.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 100,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.7, 0.7),
            ["Image"] = u19.ARROW_LEFT
        }), u16.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    v89.RightArrow = u16.createElement(u6, {
        ["BackgroundTransparency"] = 0.3,
        ["Rotation"] = 180,
        ["ZIndex"] = 100,
        ["AnchorPoint"] = Vector2.new(1, 0.5),
        ["Position"] = UDim2.fromScale(1, 0.5),
        ["Size"] = UDim2.fromScale(0.325, 0.325),
        ["BackgroundColor3"] = u7.BLACK,
        ["OnClick"] = function() --[[ Name: OnClick, Line 363 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u40
                [3] = u13
                [4] = u2
            --]]
            if u37 then
                u37.Position = u37.Position + UDim2.fromOffset(1, 0)
                local v102 = u40:getValue()
                if v102 then
                    local v103 = u37.AbsolutePosition.X
                    local v104 = u37.AbsolutePosition.Y
                    v102.Text = "Position\n" .. u13.roundNumber(v103, 1) .. ", " .. u13.roundNumber(v104, 1)
                    return
                end
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "Tap on a button first"
                })
            end
        end
    }, { u16.createElement(u11, {
            ["Padding"] = UDim.new(0.1, 0)
        }), u16.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 100,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.7, 0.7),
            ["Image"] = u19.ARROW_LEFT
        }), u16.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    v89.BottomArrow = u16.createElement(u6, {
        ["BackgroundTransparency"] = 0.3,
        ["Rotation"] = 270,
        ["ZIndex"] = 100,
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 1),
        ["Size"] = UDim2.fromScale(0.325, 0.325),
        ["BackgroundColor3"] = u7.BLACK,
        ["OnClick"] = function() --[[ Name: OnClick, Line 403 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u40
                [3] = u13
                [4] = u2
            --]]
            if u37 then
                u37.Position = u37.Position + UDim2.fromOffset(0, 1)
                local v105 = u40:getValue()
                if v105 then
                    local v106 = u37.AbsolutePosition.X
                    local v107 = u37.AbsolutePosition.Y
                    v105.Text = "Position\n" .. u13.roundNumber(v106, 1) .. ", " .. u13.roundNumber(v107, 1)
                    return
                end
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "Tap on a button first"
                })
            end
        end
    }, { u16.createElement(u11, {
            ["Padding"] = UDim.new(0.1, 0)
        }), u16.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 100,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.7, 0.7),
            ["Image"] = u19.ARROW_LEFT
        }), u16.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    v74.ArrowKeys = u16.createElement(u10, v88, v89)
    v74.UndoRedoButtons = u16.createElement(u10, {
        ["ZIndex"] = 100,
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(1, 0.1)
    }, { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["VerticalAlignment"] = "Bottom",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.03, 0)
        }), u16.createElement(u6, {
            ["Text"] = "Undo",
            ["LayoutOrder"] = 3,
            ["ZIndex"] = 100,
            ["OnClick"] = function() --[[ Name: OnClick, Line 450 ]]
                --[[
                Upvalues:
                    [1] = u53
                    [2] = u54
                    [3] = u58
                    [4] = u56
                --]]
                local v108 = u53.value
                local v109 = #v108
                local v110 = v108[v109]
                v108[v109] = nil
                if v110 then
                    local v111 = {}
                    for v112, v113 in v110 do
                        local _ = v112 - 1
                        local v114 = v113.ref
                        if v114 then
                            local v115 = {
                                ["ref"] = v113.ref,
                                ["size"] = v114.Size,
                                ["position"] = v114.Position
                            }
                            table.insert(v111, v115)
                            v114.Position = v113.position
                            v114.Size = v113.size
                        end
                    end
                    local v116 = u54.value
                    table.insert(v116, v111)
                    u58(true)
                    u56(#u53.value ~= 0)
                end
            end,
            ["BackgroundColor3"] = u22.backgroundSecondary,
            ["Position"] = UDim2.fromOffset(0, 0),
            ["Size"] = UDim2.fromScale(0.15, 1),
            ["Disabled"] = not v55
        }, { u16.createElement("UISizeConstraint", {
                ["MinSize"] = Vector2.new(40, 20),
                ["MaxSize"] = Vector2.new(120, 50)
            }) }), u16.createElement(u6, {
            ["Text"] = "Redo",
            ["LayoutOrder"] = 4,
            ["ZIndex"] = 100,
            ["OnClick"] = function() --[[ Name: OnClick, Line 495 ]]
                --[[
                Upvalues:
                    [1] = u54
                    [2] = u53
                    [3] = u56
                    [4] = u58
                --]]
                local v117 = u54.value
                local v118 = #v117
                local v119 = v117[v118]
                v117[v118] = nil
                if v119 then
                    local v120 = {}
                    for v121, v122 in v119 do
                        local _ = v121 - 1
                        local v123 = v122.ref
                        if v123 then
                            local v124 = {
                                ["ref"] = v122.ref,
                                ["size"] = v123.Size,
                                ["position"] = v123.Position
                            }
                            table.insert(v120, v124)
                            v123.Position = v122.position
                            v123.Size = v122.size
                        end
                    end
                    local v125 = u53.value
                    table.insert(v125, v120)
                    u56(true)
                    u58(#u54.value ~= 0)
                end
            end,
            ["BackgroundColor3"] = u22.backgroundSecondary,
            ["Position"] = UDim2.fromOffset(0, 0),
            ["Size"] = UDim2.fromScale(0.15, 1),
            ["Disabled"] = not v57
        }, { u16.createElement("UISizeConstraint", {
                ["MinSize"] = Vector2.new(40, 20),
                ["MaxSize"] = Vector2.new(120, 50)
            }) }) })
    v74.ActionButtons = u16.createElement(u10, {
        ["ZIndex"] = 100,
        ["LayoutOrder"] = 4,
        ["Size"] = UDim2.fromScale(1, 0.12)
    }, {
        u16.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["VerticalAlignment"] = "Bottom",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.03, 0)
        }),
        u16.createElement(u6, {
            ["Text"] = "Save",
            ["TextScaled"] = true,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 100,
            ["OnClick"] = function() --[[ Name: OnClick, Line 554 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u46
                    [3] = u49
                    [4] = u20
                    [5] = u2
                    [6] = u21
                --]]
                local v126 = u31(u46.value)
                local v127 = u31(u49.value)
                local v128 = u20
                local v129 = {}
                local v130 = #v129
                local v131 = #v126
                table.move(v126, 1, v131, v130 + 1, v129)
                local v132 = v130 + v131
                table.move(v127, 1, #v127, v132 + 1, v129)
                local v133 = v128.fromMobileButtonLayouts(v129)
                u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):registerMoblileLayoutDefinition(v133)
                u21.Client:Get("UpdateCustomMobileLayout"):SendToServer({
                    ["mobileLayoutDefinition"] = v133
                })
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "Saved mobile controls"
                })
            end,
            ["BackgroundColor3"] = u22.backgroundSuccess,
            ["Position"] = UDim2.fromOffset(0, 0),
            ["Size"] = UDim2.fromScale(0.3, 1)
        }, { u16.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u9.isSmallScreen() and 16 or 20
            }), u16.createElement("UISizeConstraint", {
                ["MinSize"] = Vector2.new(60, 20),
                ["MaxSize"] = Vector2.new(120, 50)
            }) }),
        u16.createElement(u6, {
            ["Text"] = "Reset",
            ["TextScaled"] = true,
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 100,
            ["OnClick"] = function() --[[ Name: OnClick, Line 590 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u46
                    [3] = u49
                    [4] = u53
                    [5] = u56
                    [6] = u32
                    [7] = u54
                    [8] = u58
                    [9] = u2
                --]]
                local v134 = {}
                local v135 = #v134
                local v136 = u3.keys(u46.value)
                local v137 = #v136
                table.move(v136, 1, v137, v135 + 1, v134)
                local v138 = v135 + v137
                local v139 = u3.keys(u49.value)
                table.move(v139, 1, #v139, v138 + 1, v134)
                local v140 = {}
                for v141, v142 in v134 do
                    local _ = v141 - 1
                    local v143 = v142:getValue()
                    if v143 then
                        local v144 = {
                            ["ref"] = v143,
                            ["size"] = v143.Size,
                            ["position"] = v143.Position
                        }
                        table.insert(v140, v144)
                    end
                end
                local v145 = u53.value
                table.insert(v145, v140)
                u56(true)
                u32(u46.value)
                u32(u49.value)
                table.clear(u54.value)
                u58(false)
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "Reset mobile controls"
                })
            end,
            ["BackgroundColor3"] = u22.backgroundError,
            ["Position"] = UDim2.fromOffset(0, 0),
            ["Size"] = UDim2.fromScale(0.3, 1)
        }, { u16.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u9.isSmallScreen() and 16 or 20
            }), u16.createElement("UISizeConstraint", {
                ["MinSize"] = Vector2.new(60, 20),
                ["MaxSize"] = Vector2.new(120, 50)
            }) }),
        u16.createElement(u6, {
            ["Text"] = "Close",
            ["TextScaled"] = true,
            ["LayoutOrder"] = 6,
            ["ZIndex"] = 100,
            ["OnClick"] = function() --[[ Name: OnClick, Line 641 ]]
                --[[
                Upvalues:
                    [1] = u2
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MobileCustomizationApp")
            end,
            ["BackgroundColor3"] = u22.backgroundSecondary,
            ["Position"] = UDim2.fromOffset(0, 0),
            ["Size"] = UDim2.fromScale(0.3, 1)
        }, { u16.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u9.isSmallScreen() and 16 or 20
            }), u16.createElement("UISizeConstraint", {
                ["MinSize"] = Vector2.new(40, 20),
                ["MaxSize"] = Vector2.new(120, 50)
            }) })
    })
    v71[v72 + 1] = u16.createElement(u23, v73, v74)
    v69.DragWindowScreenGui = u16.createElement("ScreenGui", v70, v71)
    v69.MobileLayoutCustomizationPlane = u16.createElement("ScreenGui", {
        ["DisplayOrder"] = 110,
        ["ResetOnSpawn"] = false
    }, { u16.createElement(u26, {
            ["currentlySelected"] = u37,
            ["setCurrentlySelected"] = v52,
            ["imageButtons"] = u49.value,
            ["textButtons"] = u46.value
        }) })
    return u16.createFragment({
        ["MobileLayoutCustomization"] = u16.createElement("ScreenGui", v68, v69)
    })
end
u30 = function(u147, p148) --[[ Name: getLayoutEntries, Line 676 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u16
    --]]
    local v149 = 0
    local v150 = {}
    for v151, v152 in u5.AllMobileActions do
        local _ = v151 - 1
        local v153 = u147[v152] ~= nil
        if v153 then
            v153 = table.find(p148, v152) ~= nil
        end
        if v153 == true then
            v149 = v149 + 1
            v150[v149] = v152
        end
    end
    local function v159(p154) --[[ Line: 697 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u147
        --]]
        local v155 = u16.createRef()
        local v156 = {
            ["buttonType"] = p154
        }
        for v157, v158 in u147[p154] do
            v156[v157] = v158
        end
        return { v155, v156 }
    end
    local v160 = table.create(#v150)
    for v161, v162 in v150 do
        v160[v161] = v159(v162, v161 - 1, v150)
    end
    return v160
end
u32 = function(p163) --[[ Name: resetButtonPositions, Line 715 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v164 = u14()
    for v165, v166 in p163 do
        local v167 = v165:getValue()
        local v168 = v164[v166.buttonType]
        if v167 and v168 then
            v167.Size = v168.size
            v167.Position = v168.position
        end
    end
    return nil
end
u31 = function(p169) --[[ Name: extractButtonLayouts, Line 731 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v170 = u3.entries(p169)
    local v171 = table.create(#v170)
    for v172, v173 in v170 do
        local _ = v172 - 1
        local v174 = v173[1]
        v171[v172] = {
            ["buttonType"] = v173[2].buttonType,
            ["size"] = v174:getValue().Size,
            ["position"] = v174:getValue().Position
        }
    end
    return v171
end
local v175 = v17.new(u16)(v146)
return {
    ["MobileLayoutCustomizationApp"] = v18.connect(function(_, p176) --[[ Line: 751 ]]
        local v177 = {}
        for v178, v179 in p176 do
            v177[v178] = v179
        end
        return v177
    end)(v175)
}