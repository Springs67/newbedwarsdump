local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.Button
local u6 = v3.ColorUtil
local u7 = v3.DeviceUtil
local u8 = v3.Empty
local u9 = v3.SliderComponent
local u10 = v3.TextInputComponent
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-constants").CustomKitConstants
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-types").CustomKitTypes
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u20 = u1.import(script, script.Parent, "custom-kit-creation-ability-property-dropdown-gui").CustomKitCreation_AbilityPropertyDropdownGUI
local u21 = u1.import(script, script.Parent, "custom-kit-creation-ability-property-level-gui").CustomKitCreation_AbilityPropertyLevelGUI
local u22 = u1.import(script, script.Parent, "custom-kit-creation-property-label").CustomKitCreation_PropertyLabel
return {
    ["CustomKitCreation_AbilityCustomizationGUI"] = v14.new(u13)(function(u23, p24) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u13
            [3] = u8
            [4] = u9
            [5] = u6
            [6] = u22
            [7] = u10
            [8] = u7
            [9] = u20
            [10] = u12
            [11] = u17
            [12] = u15
            [13] = u2
            [14] = u21
            [15] = u5
            [16] = u19
            [17] = u1
            [18] = u11
            [19] = u18
            [20] = u4
        --]]
        local v25 = p24.useState
        local _ = p24.useEffect
        local function u27(p26) --[[ Line: 27 ]]
            return Color3.fromRGB(p26.r, p26.g, p26.b)
        end
        local u28 = u23.Ability
        local u29, u30 = v25(u27(u28.color))
        local v31
        if u28.targetType == u16.TargetType.SELF then
            v31 = false
        else
            v31 = u28.targetType ~= u16.TargetType.PROJECTILE
        end
        local v32 = u28.targetType == u16.TargetType.PROJECTILE
        local function v33() --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23.UpdateCurrentAbility(u23.Ability)
            u23.OnPointsChanged(u23.CustomKit)
            u23.OnChangesMade()
        end
        local function v50(u34, p35) --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u29
                [3] = u13
                [4] = u8
                [5] = u9
                [6] = u30
                [7] = u27
                [8] = u23
                [9] = u6
            --]]
            local v36
            if u34 == "r" then
                v36 = u28.color.r
            elseif u34 == "g" then
                v36 = u28.color.g
            else
                v36 = u28.color.b
            end
            local v37
            if u34 == "r" then
                v37 = Color3.fromRGB(255, 70, 70)
            elseif u34 == "g" then
                v37 = Color3.fromRGB(70, 255, 70)
            else
                v37 = Color3.fromRGB(70, 70, 255)
            end
            local v38
            if u34 == "r" then
                v38 = u29.R
            elseif u34 == "g" then
                v38 = u29.G
            else
                v38 = u29.B
            end
            local v39 = u13.createElement
            local v40 = u8
            local v41 = {
                ["LayoutOrder"] = p35,
                ["Size"] = UDim2.new(1, 0, 0, 30)
            }
            local v42 = {}
            local v43 = u13.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })
            local v45 = u13.createElement(u8, {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.8, 1)
            }, { u13.createElement(u9, {
                    ["Min"] = 0,
                    ["Max"] = 255,
                    ["StepSize"] = 1,
                    ["Size"] = UDim2.fromScale(0.85, 0.5),
                    ["Position"] = UDim2.fromScale(0.97, 0.5),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["InitialValue"] = v36,
                    ["ThemeColor"] = v37,
                    ["BarColor"] = Color3.fromRGB(125, 125, 125),
                    ["OnChange"] = function(p44) --[[ Name: OnChange, Line 77 ]]
                        --[[
                        Upvalues:
                            [1] = u34
                            [2] = u28
                            [3] = u30
                            [4] = u27
                            [5] = u23
                        --]]
                        if u34 == "r" then
                            u28.color.r = p44
                        elseif u34 == "g" then
                            u28.color.g = p44
                        elseif u34 == "b" then
                            u28.color.b = p44
                        end
                        u30(u27(u28.color))
                        u23.OnChangesMade()
                    end
                }) })
            local v46 = u13.createElement
            local v47 = {
                ["TextSize"] = 24,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.2, 1),
                ["TextColor3"] = u6.WHITE,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["Font"] = Enum.Font.Roboto
            }
            local v48 = 255 * v38
            local v49 = math.floor(v48)
            v47.Text = tostring(v49)
            __set_list(v42, 1, {v43, v45, v46("TextLabel", v47)})
            return v39(v40, v41, v42)
        end
        local v51 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v52 = {}
        local v53 = #v52
        local v54 = {
            ["WaitForAbsoluteSize"] = true,
            ["AdditionalSpace"] = 150,
            ["ScrollingFrameProps"] = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["ScrollingDirection"] = Enum.ScrollingDirection.Y
            }
        }
        local v55 = {}
        local v56 = u13.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 10),
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        })
        local v57 = u13.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["Padding"] = UDim.new(0, 8),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        })
        local v58 = u13.createElement(u22, {
            ["Text"] = "NAME",
            ["LayoutOrder"] = 10
        })
        local v59 = u13.createElement
        local v60 = u8
        local v61 = {
            ["LayoutOrder"] = 11,
            ["Size"] = UDim2.new(1, 0, 0, 50)
        }
        local v62 = {}
        local v63 = u13.createElement
        local v64 = u10
        local v66 = {
            ["MaxCharacters"] = 20,
            ["TextBox"] = {
                ["PlaceholderText"] = "Ability Name",
                ["ClearTextOnFocus"] = false,
                ["Size"] = UDim2.new(1, 0, 0, 50),
                ["Text"] = u23.Ability.name,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextSize"] = u7.isSmallScreen() and 24 or 28
            },
            ["OnFocusLost"] = function(p65) --[[ Name: OnFocusLost, Line 145 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23.Ability.name = p65
                u23.OnPointsChanged(u23.CustomKit)
                u23.OnChangesMade()
            end
        }
        v62.CustomKitCreation_AbilityCustomization_NameInput = v63(v64, v66, { u13.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.02, 0),
                ["PaddingBottom"] = UDim.new(0.02, 0),
                ["PaddingLeft"] = UDim.new(0.02, 0),
                ["PaddingRight"] = UDim.new(0.02, 0)
            }) })
        __set_list(v55, 1, {v56, v57, v58, v59(v60, v61, v62), u13.createElement(u20, {
    ["Label"] = "Ability Type",
    ["LayoutOrder"] = 21,
    ["CustomAbilityProperty"] = u16.AbilityPropertyKey.TARGET_TYPE,
    ["CommonProps"] = {
        ["Ability"] = u28,
        ["Kit"] = u23.CustomKit,
        ["RefreshFunction"] = v33
    },
    ["DefaultValue"] = u28.targetType,
    ["OnItemChanged"] = function(p67) --[[ Name: OnItemChanged, Line 166 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u28
            [3] = u17
            [4] = u23
            [5] = u15
            [6] = u2
            [7] = u16
        --]]
        local v68 = u12.deepCopy(u28)
        v68.targetType = p67
        local v69 = u17.getTotalAbilityCost(v68)
        if u17.getTotalKitStatCost(u23.CustomKit) + v69 > u15.MaxKitPoints then
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = "You don\'t have enough points to change this ability type."
            })
            u23.UpdateCurrentAbility(u23.Ability)
            u23.OnPointsChanged(u23.CustomKit)
            u23.OnChangesMade()
            return nil
        end
        if p67 == u16.TargetType.SELF then
            u28.targetTeam = u16.TargetTeam.ALLY
        end
        u28.targetType = p67
        u23.UpdateCurrentAbility(u23.Ability)
        u23.OnPointsChanged(u23.CustomKit)
        u23.OnChangesMade()
    end
})})
        local v70 = #v55
        local v71
        if u28.targetType == u16.TargetType.SELF then
            v71 = false
        else
            v71 = u13.createElement(u20, {
                ["Label"] = "Target Team",
                ["LayoutOrder"] = 31,
                ["CustomAbilityProperty"] = u16.AbilityPropertyKey.TARGET_TEAM,
                ["CommonProps"] = {
                    ["Ability"] = u28,
                    ["Kit"] = u23.CustomKit,
                    ["RefreshFunction"] = v33
                },
                ["DefaultValue"] = u28.targetTeam,
                ["OnItemChanged"] = function(p72) --[[ Name: OnItemChanged, Line 195 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u23
                    --]]
                    if u28.targetTeam ~= p72 then
                        u28.statusEffect = nil
                    end
                    u28.targetTeam = p72
                    u23.UpdateCurrentAbility(u23.Ability)
                    u23.OnPointsChanged(u23.CustomKit)
                    u23.OnChangesMade()
                end
            })
        end
        if v71 then
            v55[v70 + 1] = v71
        end
        local v73 = #v55
        v55[v73 + 1] = u13.createElement(u20, {
            ["Label"] = "Status Effect",
            ["LayoutOrder"] = 41,
            ["CustomAbilityProperty"] = u16.AbilityPropertyKey.STATUS_EFFECT,
            ["CommonProps"] = {
                ["Ability"] = u28,
                ["Kit"] = u23.CustomKit,
                ["RefreshFunction"] = v33
            },
            ["DefaultValue"] = u28.statusEffect,
            ["OnItemChanged"] = function(p74) --[[ Name: OnItemChanged, Line 214 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u16
                    [3] = u17
                    [4] = u23
                    [5] = u15
                --]]
                if u28.statusEffect == u16.StatusEffectType.NONE and p74 ~= u16.StatusEffectType.NONE then
                    local v75 = u17.getRemainingKitPoints(u23.CustomKit)
                    if v75 <= 0 then
                        u23.UpdateCurrentAbility(u23.Ability)
                        u23.OnPointsChanged(u23.CustomKit)
                        u23.OnChangesMade()
                        return nil
                    end
                    if v75 < u15.StatusEffectCost then
                        u23.UpdateCurrentAbility(u23.Ability)
                        u23.OnPointsChanged(u23.CustomKit)
                        u23.OnChangesMade()
                        return nil
                    end
                    u17.setAbilityPropertyLevel(u28, u16.AbilityPropertyKey.STATUS_EFFECT_DURATION, 1)
                end
                u28.statusEffect = p74
                u23.UpdateCurrentAbility(u23.Ability)
                u23.OnPointsChanged(u23.CustomKit)
                u23.OnChangesMade()
            end
        })
        local v76
        if u28.statusEffect == nil or u28.statusEffect == u16.StatusEffectType.NONE then
            v76 = false
        else
            v76 = u13.createElement(u21, {
                ["LayoutOrder"] = 42,
                ["CustomAbilityProperty"] = u16.AbilityPropertyKey.STATUS_EFFECT_DURATION,
                ["CommonProps"] = {
                    ["Ability"] = u28,
                    ["Kit"] = u23.CustomKit,
                    ["RefreshFunction"] = v33
                }
            })
        end
        if v76 then
            v55[v73 + 2] = v76
        end
        local v77 = #v55
        local v78
        if u28.targetType == u16.TargetType.PROJECTILE then
            v78 = u13.createElement(u22, {
                ["Text"] = "PROJECTILE",
                ["LayoutOrder"] = 50
            })
        else
            v78 = false
        end
        if v78 then
            v55[v77 + 1] = v78
        end
        local v79 = #v55
        local v80
        if u28.targetType == u16.TargetType.PROJECTILE then
            v80 = u13.createElement(u21, {
                ["LayoutOrder"] = 51,
                ["CustomAbilityProperty"] = u16.AbilityPropertyKey.PROJECTILE_SPEED,
                ["CommonProps"] = {
                    ["Ability"] = u28,
                    ["Kit"] = u23.CustomKit,
                    ["RefreshFunction"] = v33
                }
            })
        else
            v80 = false
        end
        if v80 then
            v55[v79 + 1] = v80
        end
        local v81 = #v55
        local v82
        if v32 then
            v82 = u13.createElement(u21, {
                ["LayoutOrder"] = 52,
                ["CustomAbilityProperty"] = u16.AbilityPropertyKey.PROJECTILE_EXPLOSION_RADIUS,
                ["CommonProps"] = {
                    ["Ability"] = u28,
                    ["Kit"] = u23.CustomKit,
                    ["RefreshFunction"] = v33
                }
            })
        else
            v82 = v32
        end
        if v82 then
            v55[v81 + 1] = v82
        end
        local v83 = #v55
        if v32 then
            v32 = u13.createFragment({
                ["Projectile Button"] = u13.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 2,
                    ["LayoutOrder"] = 53,
                    ["Size"] = UDim2.new(1, 0, 0, 50),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }, {
                    u13.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    }),
                    ["ProjectileModel"] = u13.createElement(u5, {
                        ["Text"] = "<b>Projectile Model</b>",
                        ["LayoutOrder"] = 0,
                        ["Size"] = UDim2.fromScale(0.5, 1),
                        ["BackgroundColor3"] = u19.backgroundPrimary,
                        ["OnClick"] = u1.async(function() --[[ Line: 289 ]]
                            --[[
                            Upvalues:
                                [1] = u11
                                [2] = u17
                                [3] = u18
                                [4] = u28
                                [5] = u23
                            --]]
                            u11.Controllers.AutoCompleteDropdownController:openAutoCompleteDropdownMenu(u17.SUPPORTED_PROJECTILE_MODEL, function(p84) --[[ Line: 290 ]]
                                --[[
                                Upvalues:
                                    [1] = u18
                                --]]
                                local v85 = u18(p84)
                                return {
                                    ["actionDescription"] = "select",
                                    ["displayName"] = v85.displayName,
                                    ["aliases"] = { v85.displayName },
                                    ["image"] = v85.image
                                }
                            end, function(p86) --[[ Line: 298 ]]
                                --[[
                                Upvalues:
                                    [1] = u28
                                    [2] = u23
                                --]]
                                if p86 == "" or not p86 then
                                    return nil
                                end
                                u28.projectileModel = p86
                                u23.UpdateCurrentAbility(u23.Ability)
                                u23.OnPointsChanged(u23.CustomKit)
                                u23.OnChangesMade()
                            end)
                        end)
                    }),
                    u13.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["TextSize"] = 16,
                        ["Text"] = " " .. (u23.Ability.projectileModel or "Arrow"),
                        ["Size"] = UDim2.fromScale(0.5, 1),
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                    })
                })
            })
        end
        if v32 then
            v55[v83 + 1] = v32
        end
        local v87 = #v55
        local v88
        if u28.targetType == u16.TargetType.AOE then
            v88 = u13.createElement(u22, {
                ["Text"] = "AOE",
                ["LayoutOrder"] = 60
            })
        else
            v88 = false
        end
        if v88 then
            v55[v87 + 1] = v88
        end
        local v89 = #v55
        local v90
        if u28.targetType == u16.TargetType.AOE then
            v90 = u13.createElement(u21, {
                ["LayoutOrder"] = 61,
                ["CustomAbilityProperty"] = u16.AbilityPropertyKey.AOE_RADIUS,
                ["CommonProps"] = {
                    ["Ability"] = u28,
                    ["Kit"] = u23.CustomKit,
                    ["RefreshFunction"] = v33
                }
            })
        else
            v90 = false
        end
        if v90 then
            v55[v89 + 1] = v90
        end
        local v91 = #v55
        local v92
        if u28.targetType == u16.TargetType.AURA then
            v92 = u13.createElement(u22, {
                ["Text"] = "AURA",
                ["LayoutOrder"] = 70
            })
        else
            v92 = false
        end
        if v92 then
            v55[v91 + 1] = v92
        end
        local v93 = #v55
        local v94
        if u28.targetType == u16.TargetType.AURA then
            v94 = u13.createElement(u21, {
                ["LayoutOrder"] = 71,
                ["CustomAbilityProperty"] = u16.AbilityPropertyKey.AURA_RADIUS,
                ["CommonProps"] = {
                    ["Ability"] = u28,
                    ["Kit"] = u23.CustomKit,
                    ["RefreshFunction"] = v33
                }
            })
        else
            v94 = false
        end
        if v94 then
            v55[v93 + 1] = v94
        end
        local v95 = #v55
        local v96
        if u28.targetType == u16.TargetType.AURA then
            v96 = u13.createElement(u21, {
                ["LayoutOrder"] = 72,
                ["CustomAbilityProperty"] = u16.AbilityPropertyKey.AURA_DURATION,
                ["CommonProps"] = {
                    ["Ability"] = u28,
                    ["Kit"] = u23.CustomKit,
                    ["RefreshFunction"] = v33
                }
            })
        else
            v96 = false
        end
        if v96 then
            v55[v95 + 1] = v96
        end
        local v97 = #v55
        v55[v97 + 1] = u13.createElement(u22, {
            ["Text"] = "COMMON PROPERTIES",
            ["LayoutOrder"] = 80
        })
        v55[v97 + 2] = u13.createElement(u21, {
            ["LayoutOrder"] = 81,
            ["CustomAbilityProperty"] = u16.AbilityPropertyKey.COOLDOWN,
            ["CommonProps"] = {
                ["Ability"] = u28,
                ["Kit"] = u23.CustomKit,
                ["RefreshFunction"] = v33
            }
        })
        local v98 = v97 + 3
        local v99 = u13.createElement
        local v100 = u21
        local v101 = {
            ["LayoutOrder"] = 82
        }
        local v102
        if u28.targetTeam == u16.TargetTeam.ALLY then
            v102 = u16.AbilityPropertyKey.HEAL_POTENCY
        else
            v102 = u16.AbilityPropertyKey.DAMAGE_POTENCY
        end
        v101.CustomAbilityProperty = v102
        v101.CommonProps = {
            ["Ability"] = u28,
            ["Kit"] = u23.CustomKit,
            ["RefreshFunction"] = v33
        }
        v55[v98] = v99(v100, v101)
        local v103
        if v31 then
            v103 = u13.createElement(u22, {
                ["Text"] = "EFFECTS COLOR",
                ["LayoutOrder"] = 100
            })
        else
            v103 = v31
        end
        if v103 then
            v55[v97 + 4] = v103
        end
        local v104 = #v55
        if v31 then
            v31 = u13.createElement(u8, {
                ["LayoutOrder"] = 101,
                ["Size"] = UDim2.new(1, 0, 0, 120)
            }, {
                ["CustomKitCreation_AbilityCustomization_ColorFrame"] = u13.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(0.2, 0, 1, 0),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["BackgroundColor3"] = u29
                }, { u13.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }),
                ["SlidersWrapper"] = u13.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 1),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.fromScale(1, 0)
                }, {
                    u13.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    }),
                    v50("r", 0),
                    v50("g", 1),
                    v50("b", 2)
                })
            })
        end
        if v31 then
            v55[v104 + 1] = v31
        end
        v52[v53 + 1] = u13.createElement(u4, v54, v55)
        return u13.createFragment({
            ["CustomKitCreation_AbilityCustomization"] = u13.createElement(u8, v51, v52)
        })
    end)
}