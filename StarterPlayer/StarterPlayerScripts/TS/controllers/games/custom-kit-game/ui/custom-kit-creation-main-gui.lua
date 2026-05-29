local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.DividerComponent
local u8 = v3.Empty
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "ripple").Ripple
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-constants").CustomKitConstants
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, script.Parent, "custom-kit-creation-ability-customization-gui").CustomKitCreation_AbilityCustomizationGUI
local u18 = v1.import(script, script.Parent, "custom-kit-creation-kit-selection-gui").CustomKitCreation_KitSelectionGUI
local u19 = v1.import(script, script.Parent, "custom-kit-creation-kit-stats-gui").CustomKitCreation_KitStatsGUI
local v20 = {}
local u21 = setmetatable({}, {
    ["__index"] = v20
})
u21.KitSelection = "kit-selection"
v20["kit-selection"] = "KitSelection"
u21.KitStats = "kit-stats"
v20["kit-stats"] = "KitStats"
u21.AbilityCustomization = "ability-customization"
v20["ability-customization"] = "AbilityCustomization"
local function v120(u22, p23) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u9
        [3] = u13
        [4] = u14
        [5] = u15
        [6] = u5
        [7] = u2
        [8] = u10
        [9] = u4
        [10] = u6
        [11] = u12
        [12] = u8
        [13] = u16
        [14] = u7
        [15] = u18
        [16] = u19
        [17] = u17
    --]]
    local v24 = p23.useState
    local v25 = p23.useEffect
    local u26, u27 = v24(u21.KitSelection)
    local u28, u29 = v24(nil)
    local u30, u31 = v24(nil)
    local v32, u33 = v24(nil)
    local v34, u35 = v24("Custom Kit Creation")
    local v36, u37 = v24("")
    local v38, u39 = v24(false)
    local v40, u41 = v24(false)
    local u42, u43 = v24(false)
    local u44 = u9.new()
    v25(function() --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        return function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            u44:DoCleaning()
        end
    end, {})
    local u45 = nil
    local u46 = nil
    local function v48(p47) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u22
            [3] = u46
        --]]
        u45(u22.CustomKits[p47 + 1])
        u46(p47)
    end
    local u49 = nil
    local function v52() --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u13
            [3] = u14
            [4] = u31
            [5] = u29
            [6] = u35
            [7] = u27
            [8] = u21
            [9] = u39
            [10] = u49
            [11] = u41
            [12] = u15
        --]]
        if #u22.CustomKits >= u13.MaxKits then
            return nil
        end
        local v50 = u14.getNewKit()
        local v51 = u22.CustomKits
        table.insert(v51, v50)
        u31(v50)
        u29(v50)
        u35(v50.name)
        u27(u21.KitStats)
        u39(true)
        u49(v50)
        u41(true)
        u15.Client:Get("CustomKitCreation_SetKit"):SendToServer({
            ["customKit"] = v50
        })
    end
    local function v55(p53) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u41
        --]]
        local v54 = u22.CustomKits
        table.remove(v54, p53 + 1)
        u41(true)
    end
    u46 = function(p56) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u22
            [3] = u31
            [4] = u49
            [5] = u27
            [6] = u21
            [7] = u39
        --]]
        u35(u22.CustomKits[p56 + 1].name)
        u31(u22.CustomKits[p56 + 1])
        u49(u22.CustomKits[p56 + 1])
        u27(u21.KitStats)
        u39(true)
    end
    u49 = function(p57) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u14
            [3] = u37
            [4] = u5
            [5] = u13
        --]]
        if not (p57 or u30) then
            return nil
        end
        local v58 = u14.getTotalKitCost(p57 or u30)
        local v59 = u37
        local v60 = u5.richTextColor(Color3.fromRGB(255, 230, 69))
        local v61 = tostring(v58)
        local v62 = u13.MaxKitPoints
        v59("Points used: <font color=\"" .. v60 .. "\"><b>" .. v61 .. " / " .. tostring(v62) .. "</b></font>")
    end
    local function v66(p63) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u30
            [3] = u13
            [4] = u33
            [5] = u27
            [6] = u21
            [7] = u39
            [8] = u35
        --]]
        local v64 = u14.getAbilityInSlot(u30, p63)
        if not v64 then
            local v65 = u30
            if v65 ~= nil then
                v65 = v65.abilities
            end
            if v65 == nil then
                return nil
            end
            if #u30.abilities >= u13.MaxAbilities then
                return nil
            end
            v64 = u14.getNewAbility()
            u30.abilities[p63 + 1] = v64
        end
        u33(v64)
        u27(u21.AbilityCustomization)
        u39(true)
        u35(u30.name .. " > " .. v64.name)
    end
    local function v67(_) --[[ Line: 121 ]] end
    local function u69() --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u21
            [3] = u27
            [4] = u33
            [5] = u30
            [6] = u35
            [7] = u31
            [8] = u39
        --]]
        if u26 == u21.AbilityCustomization then
            u27(u21.KitStats)
            u33(nil)
            local v68 = u30
            if v68 ~= nil then
                v68 = v68.name
            end
            u35((tostring(v68)))
        elseif u26 == u21.KitStats then
            u27(u21.KitSelection)
            u31(nil)
            u35("Custom Kit Creation")
            u39(false)
        end
    end
    local function v71(p70) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35(p70.name)
    end
    local function v72() --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41(true)
    end
    u45 = function(p73) --[[ Line: 159 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u28
            [3] = u15
        --]]
        u29(p73)
        if u28 == nil then
            return nil
        end
        local v74 = {
            ["customKit"] = u28
        }
        u15.Client:Get("CustomKitCreation_SetKit"):SendToServer(v74)
    end
    local v75 = {
        ["DisplayOrder"] = 19,
        ["ResetOnSpawn"] = false
    }
    local v76 = {}
    local _ = #v76
    local v77 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.3, 0.9),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.new(0, 10, 0.5, 0),
        ["BackgroundColor3"] = u5.BLACK,
        ["Visible"] = not u42
    }
    local v78 = {}
    local v79 = #v78
    if v40 then
        v40 = u10.createFragment({
            ["CustomKitCreation_Main_SaveButton"] = u10.createElement(u4, {
                ["Text"] = "Save Changes",
                ["Selectable"] = true,
                ["ZIndex"] = 60,
                ["Size"] = UDim2.new(0.4, 0, 0, u6.isSmallScreen() and 25 or 40),
                ["Position"] = UDim2.new(1, 0, 0, 10),
                ["AnchorPoint"] = Vector2.new(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 170, 0),
                ["OnClick"] = function() --[[ Name: OnClick, Line 193 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u41
                        [3] = u30
                        [4] = u45
                        [5] = u28
                        [6] = u2
                    --]]
                    task.spawn(function() --[[ Line: 142 ]]
                        --[[
                        Upvalues:
                            [1] = u22
                            [2] = u41
                            [3] = u30
                            [4] = u45
                            [5] = u28
                            [6] = u2
                        --]]
                        if u22.OnSave() then
                            u41(false)
                            if u30 ~= nil then
                                u45(u28)
                                return
                            end
                        else
                            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                                ["message"] = "Couldn\'t save your kit changes. Make sure all of your kits are under the point limit."
                            })
                        end
                    end)
                end,
                ["TextLabel"] = {
                    ["ZIndex"] = 61,
                    ["Size"] = UDim2.fromScale(0.8, 0.55)
                }
            }, { u10.createElement("UISizeConstraint", {
                    ["MaxSize"] = Vector2.new(150, 9999)
                }), u10.createElement(u12) })
        })
    end
    if v40 then
        v78[v79 + 1] = v40
    end
    v78[#v78 + 1] = u10.createElement("UISizeConstraint", {
        ["MinSize"] = Vector2.new(300, 0)
    })
    v76.SaveButton_Container = u10.createElement(u8, v77, v78)
    local v80 = u10.createElement
    local v81 = u8
    local v82 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.3, 0.9),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.new(0, 10, 0.5, 0),
        ["BackgroundColor3"] = u5.BLACK
    }
    local v83 = {
        ["CustomKitCreation_Main_MinimizeButton"] = u10.createElement(u4, {
            ["Selectable"] = true,
            ["ZIndex"] = 60,
            ["Size"] = UDim2.new(0.4, 0, 0, u6.isSmallScreen() and 25 or 40),
            ["Position"] = UDim2.new(0, 0, 0, 10),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = u16.backgroundPrimary,
            ["Text"] = u42 and "SHOW" or "HIDE",
            ["OnClick"] = function() --[[ Name: OnClick, Line 231 ]]
                --[[
                Upvalues:
                    [1] = u43
                    [2] = u42
                --]]
                u43(not u42)
            end,
            ["TextLabel"] = {
                ["ZIndex"] = 61,
                ["Size"] = UDim2.fromScale(0.8, 0.55),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }
        }, { u10.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new(150, 9999)
            }) }),
        u10.createElement("UISizeConstraint", {
            ["MinSize"] = Vector2.new(300, 0)
        })
    }
    v76.MinimizeButton_Container = v80(v81, v82, v83)
    local v84 = {
        ["BackgroundTransparency"] = 0.2,
        ["BorderSizePixel"] = 0,
        ["ClipsDescendants"] = true,
        ["Size"] = UDim2.fromScale(0.3, 0.85),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.new(0, 10, 0.5, 10),
        ["BackgroundColor3"] = u5.BLACK,
        ["Visible"] = not u42
    }
    local v85 = {
        u10.createElement("UISizeConstraint", {
            ["MinSize"] = Vector2.new(300, 0)
        }),
        u10.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 8)
        }),
        u10.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }),
        u10.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.02, 0)
        })
    }
    local v86 = #v85
    local v87 = {
        ["LayoutOrder"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.07)
    }
    local v88 = {}
    local v89 = u10.createElement
    local v90 = "Frame"
    local v91 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.95, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v92 = {}
    local v93 = u10.createElement
    local v94 = "TextLabel"
    local v95 = {
        ["TextTransparency"] = 0,
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Text"] = v34,
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
    }
    local v96
    if u6.isSmallScreen() then
        v96 = Enum.FontSize.Size18
    else
        v96 = Enum.FontSize.Size28
    end
    v95.FontSize = v96
    v95.TextXAlignment = Enum.TextXAlignment.Left
    v92.CustomKitCreation_Main_Header_Text = v93(v94, v95)
    v88.CustomKitCreation_Main_Header_Frame = v89(v90, v91, v92)
    local v97 = #v88
    local v98
    if v38 then
        v98 = u10.createElement(u4, {
            ["Text"] = "Back",
            ["Selectable"] = true,
            ["ZIndex"] = 60,
            ["Size"] = UDim2.fromScale(0.2, 0.8),
            ["Position"] = UDim2.fromScale(0.99, 0.5),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["BackgroundColor3"] = u16.mcDarkGray,
            ["OnClick"] = function() --[[ Name: OnClick, Line 312 ]]
                --[[
                Upvalues:
                    [1] = u69
                --]]
                u69()
            end,
            ["TextLabel"] = {
                ["ZIndex"] = 61,
                ["Size"] = UDim2.fromScale(0.8, 0.55)
            }
        })
    else
        v98 = v38
    end
    if v98 then
        v88[v97 + 1] = v98
    end
    v85.CustomKitCreation_Main_Header = u10.createElement(u8, v87, v88)
    if v38 then
        local v99 = u10.createFragment
        local v100 = {}
        local v101 = u10.createElement
        local v102 = u8
        local v103 = {
            ["LayoutOrder"] = 10,
            ["Size"] = UDim2.fromScale(1, 0.06)
        }
        local v104 = {}
        local v105 = u10.createElement
        local v106 = "Frame"
        local v107 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.95, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v108 = {}
        local v109 = u10.createElement
        local v110 = "TextLabel"
        local v111 = {
            ["AutomaticSize"] = "X",
            ["TextTransparency"] = 0,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Text"] = v36,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Font"] = Enum.Font.Roboto
        }
        local v112
        if u6.isSmallScreen() then
            v112 = Enum.FontSize.Size18
        else
            v112 = Enum.FontSize.Size24
        end
        v111.FontSize = v112
        v111.TextXAlignment = Enum.TextXAlignment.Left
        v108.CustomKitCreation_Sub_Header_Text = v109(v110, v111)
        v104.CustomKitCreation_Sub_Header_Frame = v105(v106, v107, v108)
        v100.CustomKitCreation_Sub_Header = v101(v102, v103, v104)
        v38 = v99(v100)
    end
    if v38 then
        v85[v86 + 1] = v38
    end
    v85[#v85 + 1] = u10.createElement(u7, {
        ["LayoutOrder"] = 20,
        ["Size"] = UDim2.new(0.95, 0, 0, 10)
    })
    local v113 = {
        ["LayoutOrder"] = 100,
        ["Size"] = UDim2.fromScale(1, 0.9)
    }
    local v114 = {}
    local v115 = #v114
    local v116
    if u26 == u21.KitSelection then
        v116 = u10.createElement(u18, {
            ["CustomKits"] = u22.CustomKits,
            ["CurrentKit"] = u28,
            ["OnKitSlotClicked"] = v48,
            ["OnAddKitSlotClicked"] = v52,
            ["OnEditKitSlotClicked"] = u46,
            ["OnDeleteKitSlotClicked"] = v55
        })
    else
        v116 = false
    end
    if v116 then
        v114[v115 + 1] = v116
    end
    local v117 = #v114
    local v118
    if u26 == u21.KitStats then
        if u30 then
            v118 = u10.createElement(u19, {
                ["CurrentKit"] = u30,
                ["OnAbilityClicked"] = v66,
                ["OnDeleteAbilityClicked"] = v67,
                ["OnPointsChanged"] = u49,
                ["OnNameChanged"] = v71,
                ["OnChangesMade"] = v72
            })
        else
            v118 = u30
        end
    else
        v118 = false
    end
    if v118 then
        v114[v117 + 1] = v118
    end
    local v119 = #v114
    if u26 == u21.AbilityCustomization then
        if u30 then
            if v32 then
                v32 = u10.createElement(u17, {
                    ["CustomKit"] = u30,
                    ["Ability"] = v32,
                    ["UpdateCurrentAbility"] = u33,
                    ["OnPointsChanged"] = u49,
                    ["OnChangesMade"] = v72
                })
            end
        else
            v32 = u30
        end
    else
        v32 = false
    end
    if v32 then
        v114[v119 + 1] = v32
    end
    v85.CustomKitCreation_Main_Content = u10.createElement(u8, v113, v114)
    v76.CustomKitCreation_Main_Frame = u10.createElement("Frame", v84, v85)
    return u10.createFragment({
        ["CustomKitCreation_MainGui"] = u10.createElement("ScreenGui", v75, v76)
    })
end
return {
    ["CustomKitCreation_MainGUI"] = v11.new(u10)(v120)
}