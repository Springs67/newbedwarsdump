local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.TooltipContainer
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank")
local u17 = v16.ArmorTrimEffectRank
local u18 = v16.ArmorTrimEffectRankMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u23 = v1.import(script, script.Parent.Parent.Parent, "kit-shop", "ui", "misc", "player-viewport").PlayerViewport
local u24 = v1.import(script, script.Parent, "armor-trim-switch-armor-type-button").ArmorTrimSwitchArmorTypeButton
local u25 = {
    ["armorSet"] = "LEATHER",
    ["displayMode"] = "KIT",
    ["armorTrimColor"] = u4.WHITE
}
return {
    ["DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION"] = u25,
    ["ArmorTrimPlayerViewportBase"] = v11.new(u10)(function(u26, p27) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u18
            [3] = u17
            [4] = u5
            [5] = u9
            [6] = u20
            [7] = u12
            [8] = u19
            [9] = u10
            [10] = u22
            [11] = u14
            [12] = u13
            [13] = u23
            [14] = u7
            [15] = u15
            [16] = u6
            [17] = u21
            [18] = u8
            [19] = u3
            [20] = u4
            [21] = u24
        --]]
        local v28 = p27.useState
        local v29 = p27.useEffect
        local v30 = u26.StartingSelection
        if v30 ~= nil then
            v30 = v30.displayMode
        end
        if v30 == nil then
            v30 = u25.displayMode
        end
        local u31, _ = v28(v30)
        local u32, u33 = v28(false)
        local v34 = u26.StartingSelection
        if v34 ~= nil then
            v34 = v34.armorSet
        end
        local u35, u36 = v28(v34 == nil and "LEATHER" or v34)
        local v37 = u26.StartingSelection
        if v37 ~= nil then
            v37 = v37.armorTrimColor
        end
        if v37 == nil then
            v37 = u25.armorTrimColor
        end
        local u38, u39 = v28(v37)
        local v40, u41 = v28({})
        local v42 = u18
        local v43 = u26.ArmorTrimEffectRank
        if v43 == nil then
            v43 = u17.T1
        end
        local v44 = v42[v43]
        local u45 = u5.isMobileControls()
        v29(function() --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u9
                [3] = u39
            --]]
            if not u26.ColorSignal then
                return nil
            end
            local u46 = u9.new()
            u46:GiveTask(u26.ColorSignal:Connect(function(p47) --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u39
                --]]
                return u39(p47)
            end))
            return function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u46
                --]]
                return u46:Destroy()
            end
        end, { u26.ColorSignal })
        v29(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u35
                [3] = u12
                [4] = u9
                [5] = u26
                [6] = u19
                [7] = u17
                [8] = u38
                [9] = u41
            --]]
            local v48 = 0
            local v49 = {}
            local u50 = {}
            for v51, v52 in u20[u35] do
                local _ = v51 - 1
                local v53 = u12.Assets.Armor:WaitForChild(v52)
                if v53 ~= nil then
                    v48 = v48 + 1
                    v49[v48] = v53
                end
            end
            local function v62(p54) --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                local v55 = 0
                local v56 = {}
                for v57, v58 in p54:GetChildren() do
                    local _ = v57 - 1
                    if v58:IsA("Accessory") == true then
                        v55 = v55 + 1
                        v56[v55] = v58
                    end
                end
                for v59, v60 in v56 do
                    local _ = v59 - 1
                    local v61 = u50
                    table.insert(v61, v60)
                end
            end
            for v63, v64 in v49 do
                v62(v64, v63 - 1, v49)
            end
            local u65 = u9.new()
            if u26.ArmorTrimType then
                local v66 = u19
                local v67 = u26.ArmorTrimType
                local v68 = u26.ArmorTrimEffectRank
                if v68 == nil then
                    v68 = u17.T1
                end
                for v69, v70 in v66.createArmorTrims(v67, u38, v68) do
                    local _ = v69 - 1
                    v70:SetAttribute("ArmorTrimTintableAccessory", true)
                    table.insert(u50, v70)
                    u65:GiveTask(v70)
                end
            end
            u41(u50)
            return function() --[[ Line: 147 ]]
                --[[
                Upvalues:
                    [1] = u65
                --]]
                u65:Destroy()
            end
        end, { u35, u26.ArmorTrimType, u26.ArmorTrimEffectRank })
        local v71 = {}
        for v72, v73 in u26 do
            v71[v72] = v73
        end
        v71.SelectedKit = nil
        v71.ArmorTrimType = nil
        v71.ArmorTrimEffectRank = nil
        v71.ButtonMode = nil
        v71.StartingSelection = nil
        v71.OnSelectionChanged = nil
        v71.ViewportProps = nil
        v71.Rotate = nil
        v71.ColorSignal = nil
        v71.renderArmorTrimColorControl = nil
        v71[u10.Children] = nil
        local v74 = {
            ["Size"] = v71.Size or UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = v71.BackgroundColor3 or u22.backgroundPrimary
        }
        local v75 = v71.BorderSizePixel
        v74.BorderSizePixel = v75 == nil and 0 or v75
        for v76, v77 in v71 do
            v74[v76] = v77
        end
        local v78 = {}
        local v79 = #v78
        local v80 = u26[u10.Children]
        if v80 then
            for v81, v82 in v80 do
                if type(v81) == "number" then
                    v78[v79 + v81] = v82
                else
                    v78[v81] = v82
                end
            end
        end
        local v83 = #v78
        local v84 = {
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.fromScale(0.75, 0.75),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v85 = u26.ViewportProps
        if v85 then
            for v86, v87 in v85 do
                v84[v86] = v87
            end
        end
        v84.PreviewAccessories = v40
        v84.PreviewAccessoryTint = u38
        local v88 = u26.Rotate
        v84.Rotate = v88 == nil and true or v88
        v84.Mode = u31
        v84.Kit = u26.SelectedKit
        v84.Animation = u14:getAssetId(u13.ROBLOX_DEFAULT_IDLE)
        v84.AnimationSpeed = 1
        v78[v83 + 1] = u10.createElement(u23, v84, { u10.createElement(u7, {
                ["Padding"] = UDim.new(0, 5)
            }), u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            }) })
        local v89 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(0.75, 0.75),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v90 = { u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            }) }
        local v91 = #v90
        local v92 = (u26.ButtonMode == "ALWAYS_VISIBLE" or u26.ButtonMode == nil) and true or u32
        if v92 then
            v92 = u26.ButtonMode ~= "NONE"
        end
        if v92 then
            local v93 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v94 = {}
            local v95 = #v94
            local v96 = {
                ["Position"] = UDim2.new(0, 6, 0, 6),
                ["Size"] = UDim2.fromScale(0.23, 0.23)
            }
            local v97 = { u10.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }
            local v98 = #v97
            local v99
            if u26.ArmorTrimType == nil then
                v99 = false
            else
                v99 = u26.ArmorTrimEffectRank ~= nil
            end
            if v99 then
                local v100 = u15[u26.ArmorTrimType].effects
                if v100 ~= nil then
                    v100 = v100.tierOverrides
                end
                local v101 = v100 == nil and { -1 } or v100
                local v102 = u26.ArmorTrimEffectRank
                v99 = table.find(v101, v102) ~= nil
                if v99 then
                    v99 = u10.createElement(u6, {
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                    }, { u10.createElement("ImageLabel", {
                            ["ZIndex"] = 2,
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(0.28, 0.28),
                            ["Position"] = UDim2.fromScale(0.96, 0.88),
                            ["AnchorPoint"] = Vector2.new(1, 1),
                            ["Image"] = u21.STAR_SOLID
                        }), u10.createElement(u8, {}, { u10.createElement(u3, {
                                ["Text"] = "Special Effect",
                                ["TextSize"] = 26,
                                ["Font"] = Enum.Font.SourceSansBold,
                                ["Limits"] = Vector2.new(300, 60)
                            }) }) })
                end
            end
            local v103 = {
                ["BackgroundTransparency"] = 0.75,
                ["TextScaled"] = true,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Text"] = v44.text,
                ["BackgroundColor3"] = u4.darken(v44.color, 0.65),
                ["TextColor3"] = u4.brighten(v44.color, 0.65),
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Bottom
            }
            local v104 = { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.22, 0)
                }) }
            local v105 = #v104
            if v99 then
                v104[v105 + 1] = v99
            end
            v97[v98 + 1] = u10.createElement("TextLabel", v103, v104)
            v94[v95 + 1] = u10.createElement(u6, v96, v97)
            v94.SwitchArmorSetButton = u10.createElement(u24, {
                ["BackgroundTransparency"] = 1,
                ["Selectable"] = true,
                ["Position"] = UDim2.new(0, 6, 1, -16),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Size"] = UDim2.fromScale(0.23, 0.23),
                ["CurrentArmorSet"] = u35,
                ["OnSwitchArmorSet"] = function(p106) --[[ Name: OnSwitchArmorSet, Line 323 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                        [2] = u26
                        [3] = u38
                        [4] = u31
                    --]]
                    u36(p106)
                    if u26.OnSelectionChanged then
                        local v107 = {
                            ["armorSet"] = p106,
                            ["armorTrimColor"] = u38,
                            ["displayMode"] = u31
                        }
                        u26.OnSelectionChanged(v107)
                    end
                end
            })
            local v108
            if u26.ArmorTrimType == nil or u26.ArmorTrimEffectRank == nil then
                v108 = false
            else
                v108 = u26.renderArmorTrimColorControl ~= nil
            end
            if v108 then
                local v109 = {}
                local v110 = #v109
                for v113, v114 in u26.renderArmorTrimColorControl({
                    ["selectedKit"] = u26.SelectedKit,
                    ["armorTrimType"] = u26.ArmorTrimType,
                    ["armorTrimEffectRank"] = u26.ArmorTrimEffectRank,
                    ["armorTrimColor"] = u38,
                    ["onColorSelected"] = function(p111) --[[ Name: onColorSelected, Line 343 ]]
                        --[[
                        Upvalues:
                            [1] = u5
                            [2] = u39
                            [3] = u26
                            [4] = u35
                            [5] = u31
                        --]]
                        if u5.isHoarceKat() then
                            return nil
                        end
                        u39(p111)
                        if u26.OnSelectionChanged then
                            local v112 = {
                                ["armorSet"] = u35,
                                ["armorTrimColor"] = p111,
                                ["displayMode"] = u31
                            }
                            u26.OnSelectionChanged(v112)
                        end
                    end
                }) do
                    v109[v110 + v113] = v114
                end
                v108 = u10.createFragment(v109)
            end
            if v108 then
                v94[v95 + 2] = v108
            end
            v92 = u10.createElement(u6, v93, v94)
        end
        local v115 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 1,
            [u10.Event.MouseEnter] = function() --[[ Line: 371 ]]
                --[[
                Upvalues:
                    [1] = u45
                    [2] = u33
                --]]
                if u45 then
                    return nil
                end
                u33(true)
            end,
            [u10.Event.MouseLeave] = function() --[[ Line: 377 ]]
                --[[
                Upvalues:
                    [1] = u45
                    [2] = u33
                --]]
                if u45 then
                    return nil
                end
                u33(false)
            end,
            [u10.Event.MouseButton1Click] = function() --[[ Line: 383 ]]
                --[[
                Upvalues:
                    [1] = u45
                    [2] = u33
                    [3] = u32
                --]]
                if not u45 then
                    return nil
                end
                u33(not u32)
            end
        }
        local v116 = {}
        local v117 = #v116
        if v92 then
            v116[v117 + 1] = v92
        end
        v90[v91 + 1] = u10.createElement("ImageButton", v115, v116)
        v78.ArmorTrimViewportOverlay = u10.createElement("Frame", v89, v90)
        return u10.createFragment({
            ["ArmorTrimPlayerViewport"] = u10.createElement("Frame", v74, v78)
        })
    end)
}