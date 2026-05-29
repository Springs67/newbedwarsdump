local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CustomKitCreation_StatSlot"] = v8.new(u7)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u6
            [4] = u4
            [5] = u10
            [6] = u5
            [7] = u2
        --]]
        local _ = p12.useState
        local _ = p12.useEffect
        local function v16() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u11
            --]]
            if u9.isMaxStatLevel(u11.StatType, u11.StatLevel) then
                return "MAX"
            end
            local v13 = u9.getStatCost(u11.StatType, u11.StatLevel + 1)
            if v13 == nil then
                return ""
            end
            local v14 = u9.getStatCost(u11.StatType, u11.StatLevel)
            local v15 = v13 - (v14 == nil and 0 or v14)
            return "+" .. tostring(v15)
        end
        local v17 = u7.createFragment
        local v18 = {}
        local v19 = u7.createElement
        local v20 = "Frame"
        local v21 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 50),
            ["LayoutOrder"] = u11.LayoutOrder
        }
        local v22 = {}
        local v23 = u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.01, 0)
        })
        local v24 = u7.createElement
        local v25 = u6
        local v26 = {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.64, 1)
        }
        local v27 = { (u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })) }
        local v28 = u7.createElement
        local v29 = "TextLabel"
        local v30 = {
            ["LayoutOrder"] = 0,
            ["TextTransparency"] = 0,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v31 = u9.getStatName(u11.StatType)
        local v32 = " ("
        local v33
        if u9.isMaxStatLevel(u11.StatType, u11.StatLevel) then
            v33 = "MAX"
        else
            local v34 = u11.StatLevel
            v33 = "Lv. " .. tostring(v34)
        end
        v30.Text = v31 .. v32 .. v33 .. ")"
        v30.TextColor3 = u4.WHITE
        v30.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v30.TextXAlignment = Enum.TextXAlignment.Left
        v27.StatName = v28(v29, v30, { u7.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 20
            }) })
        v27.StatDescription = u7.createElement("TextLabel", {
            ["LayoutOrder"] = 1,
            ["TextTransparency"] = 0,
            ["TextSize"] = 18,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Text"] = u9.getStatEffectDescription(u11.StatType, u11.StatLevel),
            ["TextColor3"] = u4.WHITE,
            ["Font"] = Enum.Font.Roboto,
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        })
        local v35 = v24(v25, v26, v27)
        local v36 = u7.createElement
        local v37 = u6
        local v38 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.35, 1)
        }
        local v39 = { (u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })) }
        local v40 = u7.createElement
        local v41 = u6
        local v42 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.35, 1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5)
        }
        local v43 = { (u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })) }
        local v44 = u7.createElement
        local v45 = "ImageButton"
        local v46 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u10.backgroundPrimary,
            [u7.Event.Activated] = function() --[[ Line: 120 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u11
                --]]
                if u9.canDecreaseStat(u11.CustomKit, u11.StatType, u11.StatLevel) then
                    u11.OnDecreaseStatLevelClick(u11.StatType)
                end
            end,
            ["BackgroundTransparency"] = u9.canDecreaseStat(u11.CustomKit, u11.StatType, u11.StatLevel) and 0 or 0.5,
            ["Interactable"] = u9.canDecreaseStat(u11.CustomKit, u11.StatType, u11.StatLevel),
            ["Visible"] = not u9.isMinStatLevel(u11.StatType, u11.StatLevel)
        }
        local v47 = { (u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })) }
        local v48 = u7.createElement
        local v49 = "TextLabel"
        local v50 = {
            ["LayoutOrder"] = 50,
            ["AutomaticSize"] = "X",
            ["TextTransparency"] = 0,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v51 = u9.getStatCost(u11.StatType, u11.StatLevel - 1)
        local v52
        if v51 == nil then
            v52 = ""
        else
            local v53 = u9.getStatCost(u11.StatType, u11.StatLevel)
            local v54 = (v53 == nil and 0 or v53) - v51
            v52 = "-" .. tostring(v54)
        end
        v50.Text = v52
        v50.TextColor3 = u4.WHITE
        v50.Font = Enum.Font.RobotoMono
        local v55
        if u5.isSmallScreen() then
            v55 = Enum.FontSize.Size18
        else
            v55 = Enum.FontSize.Size24
        end
        v50.FontSize = v55
        v47.CustomKit_StatLeftButtonText = v48(v49, v50)
        v43.CustomKit_StatLeftButton = v44(v45, v46, v47)
        v39.CustomKit_StatLeftButtonWrapper = v40(v41, v42, v43)
        local v56 = u7.createElement
        local v57 = {
            ["LayoutOrder"] = 2,
            ["TextTransparency"] = 0,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.3, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v58 = u9.getStatCost(u11.StatType, u11.StatLevel)
        v57.Text = tostring(v58)
        v57.TextColor3 = u4.WHITE
        v57.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v57.TextXAlignment = Enum.TextXAlignment.Center
        v39.CustomKit_StatPointsAllocated = v56("TextLabel", v57, { u7.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u5.isSmallScreen() and 18 or 24
            }) })
        local v59 = u7.createElement
        local v60 = u6
        local v61 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.35, 1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5)
        }
        local v62 = { (u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })) }
        local v63 = u7.createElement
        local v64 = "ImageButton"
        local v65 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v66
        if u9.isMaxStatLevel(u11.StatType, u11.StatLevel) or u9.canIncreaseStat(u11.CustomKit, u11.StatType, u11.StatLevel) then
            if u9.isMaxStatLevel(u11.StatType, u11.StatLevel) then
                v66 = Color3.fromRGB(79, 79, 79)
            else
                v66 = u10.backgroundSuccess
            end
        else
            v66 = u10.backgroundError
        end
        v65.BackgroundColor3 = v66
        v65[u7.Event.Activated] = function() --[[ Line: 178 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u11
                [3] = u2
            --]]
            if u9.canIncreaseStat(u11.CustomKit, u11.StatType, u11.StatLevel) then
                u11.OnIncreaseStatLevelClick(u11.StatType)
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "You don\'t have enough points to increase this stat."
                })
            end
        end
        v65.Interactable = u9.canIncreaseStat(u11.CustomKit, u11.StatType, u11.StatLevel)
        v65.Visible = not u9.isMaxStatLevel(u11.StatType, u11.StatLevel)
        local v67 = { (u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })) }
        local v68 = u7.createElement
        local v69 = "TextLabel"
        local v70 = {
            ["LayoutOrder"] = 50,
            ["AutomaticSize"] = "X",
            ["TextTransparency"] = 0,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Text"] = v16(),
            ["TextColor3"] = u4.WHITE,
            ["Font"] = Enum.Font.RobotoMono
        }
        local v71
        if u5.isSmallScreen() then
            v71 = Enum.FontSize.Size18
        else
            v71 = Enum.FontSize.Size24
        end
        v70.FontSize = v71
        v67.CustomKit_StatRightButtonText = v68(v69, v70)
        v62.CustomKit_StatRightButton = v63(v64, v65, v67)
        v39.CustomKit_StatRightButtonWrapper = v59(v60, v61, v62)
        __set_list(v22, 1, {v23, v35, v36(v37, v38, v39)})
        v18.CustomKitCreation_StatSlot = v19(v20, v21, v22)
        return v17(v18)
    end)
}