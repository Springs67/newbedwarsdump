local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CustomKitCreation_AbilityPropertyLevelGUI"] = v9.new(u8)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u2
            [4] = u8
            [5] = u6
            [6] = u4
            [7] = u11
            [8] = u5
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local u16, u17 = v14(u12.CommonProps.Ability)
        local _, u18 = v14(u12.CommonProps.Kit)
        local v19 = u10.getAbilityPropertyLevel(u16, u12.CustomAbilityProperty)
        local u20, u21 = v14(v19 == nil and 1 or v19)
        local _, u22 = v14(u10.getNameForAbilityProperty(u12.CustomAbilityProperty))
        local u23 = u7.new()
        v15(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            return function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:DoCleaning()
            end
        end, {})
        local u24 = nil
        local function u25() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u12
                [3] = u16
                [4] = u2
                [5] = u20
                [6] = u24
            --]]
            if not u10.canIncreaseAbilityProperty(u12.CommonProps.Kit, u16, u12.CustomAbilityProperty) then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "You don\'t have enough points to increase this ability property."
                })
                return nil
            end
            u10.setAbilityPropertyLevel(u16, u12.CustomAbilityProperty, u20 + 1)
            u24()
        end
        u24 = function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u12
                [3] = u18
                [4] = u10
                [5] = u16
                [6] = u21
                [7] = u22
            --]]
            u17(u12.CommonProps.Ability)
            u18(u12.CommonProps.Kit)
            local v26 = u10.getAbilityPropertyLevel(u16, u12.CustomAbilityProperty)
            u21(v26 == nil and 1 or v26)
            u22(u10.getNameForAbilityProperty(u12.CustomAbilityProperty))
            u12.CommonProps.RefreshFunction()
        end
        local v27 = u8.createFragment
        local v28 = {}
        local v29 = u8.createElement
        local v30 = "Frame"
        local v31 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 50),
            ["LayoutOrder"] = u12.LayoutOrder
        }
        local v32 = {}
        local v33 = u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.01, 0)
        })
        local v34 = u8.createElement(u6, {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.64, 1)
        }, {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["StatName"] = u8.createElement("TextLabel", {
                ["LayoutOrder"] = 0,
                ["TextTransparency"] = 0,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Text"] = u10.getNameForAbilityProperty(u12.CustomAbilityProperty) .. " (" .. (u10.isMaxAbilityPropertyLevel(u12.CommonProps.Ability, u12.CustomAbilityProperty) and "MAX" or "Lv. " .. tostring(u20)) .. ")",
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) }),
            ["StatDescription"] = u8.createElement("TextLabel", {
                ["LayoutOrder"] = 1,
                ["TextTransparency"] = 0,
                ["TextSize"] = 18,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Text"] = u10.getAbilityPropertyEffectDescription(u12.CommonProps.Ability, u12.CustomAbilityProperty),
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.Roboto,
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            })
        })
        local v35 = u8.createElement
        local v36 = u6
        local v37 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.35, 1)
        }
        local v38 = { (u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })) }
        local v39 = u8.createElement
        local v40 = u6
        local v41 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.35, 1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5)
        }
        local v42 = { (u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })) }
        local v43 = u8.createElement
        local v44 = "ImageButton"
        local v45 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u11.backgroundPrimary,
            [u8.Event.Activated] = function() --[[ Line: 172 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u12
                    [3] = u20
                    [4] = u16
                    [5] = u24
                --]]
                if u10.canDecreaseAbilityProperty(u12.CommonProps.Kit, u12.CommonProps.Ability, u12.CustomAbilityProperty) then
                    if u20 <= 1 then
                        return
                    end
                    u10.setAbilityPropertyLevel(u16, u12.CustomAbilityProperty, u20 - 1)
                    u24()
                end
            end,
            ["BackgroundTransparency"] = u10.canDecreaseAbilityProperty(u12.CommonProps.Kit, u12.CommonProps.Ability, u12.CustomAbilityProperty) and 0 or 0.5,
            ["Interactable"] = u10.canDecreaseAbilityProperty(u12.CommonProps.Kit, u12.CommonProps.Ability, u12.CustomAbilityProperty),
            ["Visible"] = not u10.isMinAbilityPropertyLevel(u12.CommonProps.Ability, u12.CustomAbilityProperty)
        }
        local v46 = { (u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })) }
        local v47 = u8.createElement
        local v48 = "TextLabel"
        local v49 = {
            ["LayoutOrder"] = 50,
            ["AutomaticSize"] = "X",
            ["TextTransparency"] = 0,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v50 = u10.getAbilityPropertyCost(u16, u12.CustomAbilityProperty, u20 - 1)
        local v51
        if v50 == nil then
            v51 = ""
        else
            local v52 = u10.getAbilityPropertyCost(u16, u12.CustomAbilityProperty, u20)
            if v52 == nil then
                v51 = ""
            else
                local v53 = v52 - v50
                v51 = "-" .. tostring(v53)
            end
        end
        v49.Text = v51
        v49.TextColor3 = u4.WHITE
        v49.Font = Enum.Font.RobotoMono
        local v54
        if u5.isSmallScreen() then
            v54 = Enum.FontSize.Size18
        else
            v54 = Enum.FontSize.Size24
        end
        v49.FontSize = v54
        v46.CustomKit_AbilityPropertyLeftButtonText = v47(v48, v49)
        v42.CustomKit_AbilityPropertyLeftButton = v43(v44, v45, v46)
        v38.CustomKit_AbilityPropertyLeftButtonWrapper = v39(v40, v41, v42)
        local v55 = u8.createElement
        local v56 = {
            ["LayoutOrder"] = 2,
            ["TextTransparency"] = 0,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.3, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v57 = u10.getAbilityPropertyCost(u16, u12.CustomAbilityProperty, u20)
        v56.Text = tostring(v57)
        v56.TextColor3 = u4.WHITE
        v56.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v56.TextXAlignment = Enum.TextXAlignment.Center
        v38.CustomKit_StatPointsAllocated = v55("TextLabel", v56, { u8.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u5.isSmallScreen() and 18 or 24
            }) })
        local v58 = u8.createElement
        local v59 = u6
        local v60 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.35, 1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5)
        }
        local v61 = { (u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })) }
        local v62 = u8.createElement
        local v63 = "ImageButton"
        local v64 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v65
        if u10.isMaxAbilityPropertyLevel(u12.CommonProps.Ability, u12.CustomAbilityProperty) or u10.canIncreaseAbilityProperty(u12.CommonProps.Kit, u12.CommonProps.Ability, u12.CustomAbilityProperty) then
            if u10.isMaxAbilityPropertyLevel(u12.CommonProps.Ability, u12.CustomAbilityProperty) then
                v65 = Color3.fromRGB(79, 79, 79)
            else
                v65 = u11.backgroundSuccess
            end
        else
            v65 = u11.backgroundError
        end
        v64.BackgroundColor3 = v65
        v64[u8.Event.Activated] = function() --[[ Line: 230 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u12
                [3] = u25
                [4] = u2
            --]]
            if u10.canIncreaseAbilityProperty(u12.CommonProps.Kit, u12.CommonProps.Ability, u12.CustomAbilityProperty) then
                u25()
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "You don\'t have enough points to increase this ability property."
                })
            end
        end
        v64.Interactable = u10.canIncreaseAbilityProperty(u12.CommonProps.Kit, u12.CommonProps.Ability, u12.CustomAbilityProperty)
        v64.Visible = not u10.isMaxAbilityPropertyLevel(u12.CommonProps.Ability, u12.CustomAbilityProperty)
        local v66 = { (u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })) }
        local v67 = u8.createElement
        local v68 = "TextLabel"
        local v69 = {
            ["LayoutOrder"] = 50,
            ["AutomaticSize"] = "X",
            ["TextTransparency"] = 0,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v70 = u10.getAbilityPropertyCost(u16, u12.CustomAbilityProperty, u20 + 1)
        local v71
        if v70 == nil then
            v71 = "MAX"
        else
            local v72 = u10.getAbilityPropertyCost(u16, u12.CustomAbilityProperty, u20)
            local v73 = v70 - (v72 == nil and 0 or v72)
            v71 = "+" .. tostring(v73)
        end
        v69.Text = v71
        v69.TextColor3 = u4.WHITE
        v69.Font = Enum.Font.RobotoMono
        local v74
        if u5.isSmallScreen() then
            v74 = Enum.FontSize.Size18
        else
            v74 = Enum.FontSize.Size24
        end
        v69.FontSize = v74
        v66.CustomKit_AbilityPropertyRightButtonText = v67(v68, v69)
        v61.CustomKit_AbilityPropertyRightButton = v62(v63, v64, v66)
        v38.CustomKit_AbilityPropertyRightButtonWrapper = v58(v59, v60, v61)
        __set_list(v32, 1, {v33, v34, v35(v36, v37, v38)})
        v28.CustomKitCreation_StatSlot = v29(v30, v31, v32)
        return v27(v28)
    end)
}