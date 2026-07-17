-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SliderComponent = v1.SliderComponent;
local TextInputComponent = v1.TextInputComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CustomKitConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-constants").CustomKitConstants;
local CustomKitTypes = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-types").CustomKitTypes;
local CustomKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local CustomKitCreation_AbilityPropertyDropdownGUI = RuntimeLib.import(script, script.Parent, "custom-kit-creation-ability-property-dropdown-gui").CustomKitCreation_AbilityPropertyDropdownGUI;
local CustomKitCreation_AbilityPropertyLevelGUI = RuntimeLib.import(script, script.Parent, "custom-kit-creation-ability-property-level-gui").CustomKitCreation_AbilityPropertyLevelGUI;
local CustomKitCreation_PropertyLabel = RuntimeLib.import(script, script.Parent, "custom-kit-creation-property-label").CustomKitCreation_PropertyLabel;

return {
    CustomKitCreation_AbilityCustomizationGUI = v4.new(u3)(function(u5, p6) -- Line: 24
        -- upvalues: CustomKitTypes (copy), u3 (copy), Empty (copy), SliderComponent (copy), ColorUtil (copy), CustomKitCreation_PropertyLabel (copy), TextInputComponent (copy), DeviceUtil (copy), CustomKitCreation_AbilityPropertyDropdownGUI (copy), u2 (copy), CustomKitUtil (copy), CustomKitConstants (copy), Flamework (copy), CustomKitCreation_AbilityPropertyLevelGUI (copy), Button (copy), Theme (copy), RuntimeLib (copy), KnitClient (copy), getItemMeta (copy), AutoCanvasScrollingFrame (copy)
        local _ = p6.useEffect;

        local function u8(p7) -- Line: 27
            return Color3.fromRGB(p7.r, p7.g, p7.b);
        end;

        local Ability = u5.Ability;
        local u9, u10 = p6.useState(u8(Ability.color));
        local v11;

        if Ability.targetType == CustomKitTypes.TargetType.SELF then
            v11 = false;
        else
            v11 = Ability.targetType ~= CustomKitTypes.TargetType.PROJECTILE;
        end;

        local v12 = Ability.targetType == CustomKitTypes.TargetType.PROJECTILE;

        local function u13() -- Line: 34
            -- upvalues: u5 (copy)
            u5.UpdateCurrentAbility(u5.Ability);
            u5.OnPointsChanged(u5.CustomKit);
            u5.OnChangesMade();
        end;

        local function _() -- Line: 41
            -- upvalues: Ability (copy), u5 (copy), u13 (copy)
            return {
                Ability = Ability,
                Kit = u5.CustomKit,
                RefreshFunction = u13
            };
        end;

        local function v26(u14, p15) -- Line: 49
            -- upvalues: Ability (copy), u9 (copy), u3 (ref), Empty (ref), SliderComponent (ref), u10 (copy), u8 (copy), u5 (copy), ColorUtil (ref)
            local v16;

            if u14 == "r" then
                v16 = Ability.color.r;
            elseif u14 == "g" then
                v16 = Ability.color.g;
            else
                v16 = Ability.color.b;
            end;

            local v17;

            if u14 == "r" then
                v17 = Color3.fromRGB(255, 70, 70);
            elseif u14 == "g" then
                v17 = Color3.fromRGB(70, 255, 70);
            else
                v17 = Color3.fromRGB(70, 70, 255);
            end;

            local v18;

            if u14 == "r" then
                v18 = u9.R;
            elseif u14 == "g" then
                v18 = u9.G;
            else
                v18 = u9.B;
            end;

            local createElement = u3.createElement;
            local v19 = {
                LayoutOrder = p15,
                Size = UDim2.new(1, 0, 0, 30)
            };
            local v20 = {};
            local v21 = u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            local v23 = u3.createElement(Empty, {
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.8, 1)
            }, { u3.createElement(SliderComponent, {
                    Min = 0,
                    Max = 255,
                    StepSize = 1,
                    Size = UDim2.fromScale(0.85, 0.5),
                    Position = UDim2.fromScale(0.97, 0.5),
                    AnchorPoint = Vector2.new(1, 0.5),
                    InitialValue = v16,
                    ThemeColor = v17,
                    BarColor = Color3.fromRGB(125, 125, 125),

                    OnChange = function(p22) -- Line: 77, Name: OnChange
                        -- upvalues: u14 (copy), Ability (ref), u10 (ref), u8 (ref), u5 (ref)
                        if u14 == "r" then
                            Ability.color.r = p22;
                        elseif u14 == "g" then
                            Ability.color.g = p22;
                        elseif u14 == "b" then
                            Ability.color.b = p22;
                        end;

                        u10(u8(Ability.color));
                        u5.OnChangesMade();
                    end
                }) });
            local createElement2 = u3.createElement;
            local v24 = {
                TextSize = 24,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.2, 1),
                TextColor3 = ColorUtil.WHITE,
                TextYAlignment = Enum.TextYAlignment.Center,
                Font = Enum.Font.Roboto
            };
            local v25 = math.floor(255 * v18);
            v24.Text = tostring(v25);
            v20[1], v20[2], v20[3] = v21, v23, createElement2("TextLabel", v24);

            return createElement(Empty, v19, v20);
        end;

        local v27 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v28 = {};
        local v29 = {
            WaitForAbsoluteSize = true,
            AdditionalSpace = 150,
            ScrollingFrameProps = {
                Size = UDim2.fromScale(1, 1),
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        };
        local v34 = {
            u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 0),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            u3.createElement(CustomKitCreation_PropertyLabel, {
                Text = "NAME",
                LayoutOrder = 10
            }),
            u3.createElement(Empty, {
                LayoutOrder = 11,
                Size = UDim2.new(1, 0, 0, 50)
            }, {
                CustomKitCreation_AbilityCustomization_NameInput = u3.createElement(TextInputComponent, {
                    MaxCharacters = 20,
                    TextBox = {
                        PlaceholderText = "Ability Name",
                        ClearTextOnFocus = false,
                        Size = UDim2.new(1, 0, 0, 50),
                        Text = u5.Ability.name,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextSize = DeviceUtil.isSmallScreen() and 24 or 28
                    },

                    OnFocusLost = function(p30) -- Line: 145, Name: OnFocusLost
                        -- upvalues: u5 (copy)
                        u5.Ability.name = p30;
                        u5.OnPointsChanged(u5.CustomKit);
                        u5.OnChangesMade();
                    end
                }, { u3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.02, 0),
                        PaddingBottom = UDim.new(0.02, 0),
                        PaddingLeft = UDim.new(0.02, 0),
                        PaddingRight = UDim.new(0.02, 0)
                    }) })
            }),
            u3.createElement(CustomKitCreation_AbilityPropertyDropdownGUI, {
                Label = "Ability Type",
                LayoutOrder = 21,
                CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.TARGET_TYPE,
                CommonProps = {
                    Ability = Ability,
                    Kit = u5.CustomKit,
                    RefreshFunction = u13
                },
                DefaultValue = Ability.targetType,

                OnItemChanged = function(p31) -- Line: 166, Name: OnItemChanged
                    -- upvalues: u2 (ref), Ability (copy), CustomKitUtil (ref), u5 (copy), CustomKitConstants (ref), Flamework (ref), CustomKitTypes (ref)
                    local v32 = u2.deepCopy(Ability);
                    v32.targetType = p31;
                    local v33 = CustomKitUtil.getTotalAbilityCost(v32);

                    if CustomKitUtil.getTotalKitStatCost(u5.CustomKit) + v33 > CustomKitConstants.MaxKitPoints then
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                            message = "You don\'t have enough points to change this ability type."
                        });
                        u5.UpdateCurrentAbility(u5.Ability);
                        u5.OnPointsChanged(u5.CustomKit);
                        u5.OnChangesMade();

                        return nil;
                    end;

                    if p31 == CustomKitTypes.TargetType.SELF then
                        Ability.targetTeam = CustomKitTypes.TargetTeam.ALLY;
                    end;

                    Ability.targetType = p31;
                    u5.UpdateCurrentAbility(u5.Ability);
                    u5.OnPointsChanged(u5.CustomKit);
                    u5.OnChangesMade();
                end
            })
        };
        local v35 = #v34;
        local v36;

        if Ability.targetType == CustomKitTypes.TargetType.SELF then
            v36 = false;
        else
            v36 = u3.createElement(CustomKitCreation_AbilityPropertyDropdownGUI, {
                Label = "Target Team",
                LayoutOrder = 31,
                CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.TARGET_TEAM,
                CommonProps = {
                    Ability = Ability,
                    Kit = u5.CustomKit,
                    RefreshFunction = u13
                },
                DefaultValue = Ability.targetTeam,

                OnItemChanged = function(p37) -- Line: 195, Name: OnItemChanged
                    -- upvalues: Ability (copy), u5 (copy)
                    if Ability.targetTeam ~= p37 then
                        Ability.statusEffect = nil;
                    end;

                    Ability.targetTeam = p37;
                    u5.UpdateCurrentAbility(u5.Ability);
                    u5.OnPointsChanged(u5.CustomKit);
                    u5.OnChangesMade();
                end
            });
        end;

        if v36 then
            v34[v35 + 1] = v36;
        end;

        local v38 = #v34;
        v34[v38 + 1] = u3.createElement(CustomKitCreation_AbilityPropertyDropdownGUI, {
            Label = "Status Effect",
            LayoutOrder = 41,
            CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.STATUS_EFFECT,
            CommonProps = {
                Ability = Ability,
                Kit = u5.CustomKit,
                RefreshFunction = u13
            },
            DefaultValue = Ability.statusEffect,

            OnItemChanged = function(p39) -- Line: 214, Name: OnItemChanged
                -- upvalues: Ability (copy), CustomKitTypes (ref), CustomKitUtil (ref), u5 (copy), CustomKitConstants (ref)
                if Ability.statusEffect == CustomKitTypes.StatusEffectType.NONE and p39 ~= CustomKitTypes.StatusEffectType.NONE then
                    local v40 = CustomKitUtil.getRemainingKitPoints(u5.CustomKit);

                    if v40 <= 0 then
                        u5.UpdateCurrentAbility(u5.Ability);
                        u5.OnPointsChanged(u5.CustomKit);
                        u5.OnChangesMade();

                        return nil;
                    end;

                    if v40 < CustomKitConstants.StatusEffectCost then
                        u5.UpdateCurrentAbility(u5.Ability);
                        u5.OnPointsChanged(u5.CustomKit);
                        u5.OnChangesMade();

                        return nil;
                    end;

                    CustomKitUtil.setAbilityPropertyLevel(Ability, CustomKitTypes.AbilityPropertyKey.STATUS_EFFECT_DURATION, 1);
                end;

                Ability.statusEffect = p39;
                u5.UpdateCurrentAbility(u5.Ability);
                u5.OnPointsChanged(u5.CustomKit);
                u5.OnChangesMade();
            end
        });
        local v41;

        if Ability.statusEffect == nil or Ability.statusEffect == CustomKitTypes.StatusEffectType.NONE then
            v41 = false;
        else
            v41 = u3.createElement(CustomKitCreation_AbilityPropertyLevelGUI, {
                LayoutOrder = 42,
                CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.STATUS_EFFECT_DURATION,
                CommonProps = {
                    Ability = Ability,
                    Kit = u5.CustomKit,
                    RefreshFunction = u13
                }
            });
        end;

        if v41 then
            v34[v38 + 2] = v41;
        end;

        local v42 = #v34;
        local v43;

        if Ability.targetType == CustomKitTypes.TargetType.PROJECTILE then
            v43 = u3.createElement(CustomKitCreation_PropertyLabel, {
                Text = "PROJECTILE",
                LayoutOrder = 50
            });
        else
            v43 = false;
        end;

        if v43 then
            v34[v42 + 1] = v43;
        end;

        local v44 = #v34;
        local v45;

        if Ability.targetType == CustomKitTypes.TargetType.PROJECTILE then
            v45 = u3.createElement(CustomKitCreation_AbilityPropertyLevelGUI, {
                LayoutOrder = 51,
                CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.PROJECTILE_SPEED,
                CommonProps = {
                    Ability = Ability,
                    Kit = u5.CustomKit,
                    RefreshFunction = u13
                }
            });
        else
            v45 = false;
        end;

        if v45 then
            v34[v44 + 1] = v45;
        end;

        local v46 = #v34;
        local v47;

        if v12 then
            v47 = u3.createElement(CustomKitCreation_AbilityPropertyLevelGUI, {
                LayoutOrder = 52,
                CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.PROJECTILE_EXPLOSION_RADIUS,
                CommonProps = {
                    Ability = Ability,
                    Kit = u5.CustomKit,
                    RefreshFunction = u13
                }
            });
        else
            v47 = v12;
        end;

        if v47 then
            v34[v46 + 1] = v47;
        end;

        local v48 = #v34;

        if v12 then
            v12 = u3.createFragment({
                ["Projectile Button"] = u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    LayoutOrder = 53,
                    Size = UDim2.new(1, 0, 0, 50),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5)
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    ProjectileModel = u3.createElement(Button, {
                        Text = "<b>Projectile Model</b>",
                        LayoutOrder = 0,
                        Size = UDim2.fromScale(0.5, 1),
                        BackgroundColor3 = Theme.backgroundPrimary,
                        OnClick = RuntimeLib.async(function() -- Line: 289
                            -- upvalues: KnitClient (ref), CustomKitUtil (ref), getItemMeta (ref), Ability (copy), u5 (copy)
                            KnitClient.Controllers.AutoCompleteDropdownController:openAutoCompleteDropdownMenu(CustomKitUtil.SUPPORTED_PROJECTILE_MODEL, function(p49) -- Line: 290
                                -- upvalues: getItemMeta (ref)
                                local v50 = getItemMeta(p49);

                                return {
                                    actionDescription = "select",
                                    displayName = v50.displayName,
                                    aliases = { v50.displayName },
                                    image = v50.image
                                };
                            end, function(p51) -- Line: 298
                                -- upvalues: Ability (ref), u5 (ref)
                                if p51 == "" or not p51 then
                                    return nil;
                                end;

                                Ability.projectileModel = p51;
                                u5.UpdateCurrentAbility(u5.Ability);
                                u5.OnPointsChanged(u5.CustomKit);
                                u5.OnChangesMade();
                            end);
                        end)
                    }),
                    u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        TextSize = 16,
                        Text = " " .. (u5.Ability.projectileModel or "Arrow"),
                        Size = UDim2.fromScale(0.5, 1),
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    })
                })
            });
        end;

        if v12 then
            v34[v48 + 1] = v12;
        end;

        local v52 = #v34;
        local v53;

        if Ability.targetType == CustomKitTypes.TargetType.AOE then
            v53 = u3.createElement(CustomKitCreation_PropertyLabel, {
                Text = "AOE",
                LayoutOrder = 60
            });
        else
            v53 = false;
        end;

        if v53 then
            v34[v52 + 1] = v53;
        end;

        local v54 = #v34;
        local v55;

        if Ability.targetType == CustomKitTypes.TargetType.AOE then
            v55 = u3.createElement(CustomKitCreation_AbilityPropertyLevelGUI, {
                LayoutOrder = 61,
                CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.AOE_RADIUS,
                CommonProps = {
                    Ability = Ability,
                    Kit = u5.CustomKit,
                    RefreshFunction = u13
                }
            });
        else
            v55 = false;
        end;

        if v55 then
            v34[v54 + 1] = v55;
        end;

        local v56 = #v34;
        local v57;

        if Ability.targetType == CustomKitTypes.TargetType.AURA then
            v57 = u3.createElement(CustomKitCreation_PropertyLabel, {
                Text = "AURA",
                LayoutOrder = 70
            });
        else
            v57 = false;
        end;

        if v57 then
            v34[v56 + 1] = v57;
        end;

        local v58 = #v34;
        local v59;

        if Ability.targetType == CustomKitTypes.TargetType.AURA then
            v59 = u3.createElement(CustomKitCreation_AbilityPropertyLevelGUI, {
                LayoutOrder = 71,
                CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.AURA_RADIUS,
                CommonProps = {
                    Ability = Ability,
                    Kit = u5.CustomKit,
                    RefreshFunction = u13
                }
            });
        else
            v59 = false;
        end;

        if v59 then
            v34[v58 + 1] = v59;
        end;

        local v60 = #v34;
        local v61;

        if Ability.targetType == CustomKitTypes.TargetType.AURA then
            v61 = u3.createElement(CustomKitCreation_AbilityPropertyLevelGUI, {
                LayoutOrder = 72,
                CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.AURA_DURATION,
                CommonProps = {
                    Ability = Ability,
                    Kit = u5.CustomKit,
                    RefreshFunction = u13
                }
            });
        else
            v61 = false;
        end;

        if v61 then
            v34[v60 + 1] = v61;
        end;

        local v62 = #v34;
        v34[v62 + 1] = u3.createElement(CustomKitCreation_PropertyLabel, {
            Text = "COMMON PROPERTIES",
            LayoutOrder = 80
        });
        v34[v62 + 2] = u3.createElement(CustomKitCreation_AbilityPropertyLevelGUI, {
            LayoutOrder = 81,
            CustomAbilityProperty = CustomKitTypes.AbilityPropertyKey.COOLDOWN,
            CommonProps = {
                Ability = Ability,
                Kit = u5.CustomKit,
                RefreshFunction = u13
            }
        });
        local createElement = u3.createElement;
        local v63 = {
            LayoutOrder = 82
        };
        local v64;

        if Ability.targetTeam == CustomKitTypes.TargetTeam.ALLY then
            v64 = CustomKitTypes.AbilityPropertyKey.HEAL_POTENCY;
        else
            v64 = CustomKitTypes.AbilityPropertyKey.DAMAGE_POTENCY;
        end;

        v63.CustomAbilityProperty = v64;
        v63.CommonProps = {
            Ability = Ability,
            Kit = u5.CustomKit,
            RefreshFunction = u13
        };
        v34[v62 + 3] = createElement(CustomKitCreation_AbilityPropertyLevelGUI, v63);
        local v65;

        if v11 then
            v65 = u3.createElement(CustomKitCreation_PropertyLabel, {
                Text = "EFFECTS COLOR",
                LayoutOrder = 100
            });
        else
            v65 = v11;
        end;

        if v65 then
            v34[v62 + 4] = v65;
        end;

        local v66 = #v34;

        if v11 then
            v11 = u3.createElement(Empty, {
                LayoutOrder = 101,
                Size = UDim2.new(1, 0, 0, 120)
            }, {
                CustomKitCreation_AbilityCustomization_ColorFrame = u3.createElement("Frame", {
                    BorderSizePixel = 0,
                    Size = UDim2.new(0.2, 0, 1, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromScale(0, 0.5),
                    BackgroundColor3 = u9
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }),
                SlidersWrapper = u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.8, 1),
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0)
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    v26("r", 0),
                    v26("g", 1),
                    v26("b", 2)
                })
            });
        end;

        if v11 then
            v34[v66 + 1] = v11;
        end;

        v28[#v28 + 1] = u3.createElement(AutoCanvasScrollingFrame, v29, v34);

        return u3.createFragment({
            CustomKitCreation_AbilityCustomization = u3.createElement(Empty, v27, v28)
        });
    end)
};