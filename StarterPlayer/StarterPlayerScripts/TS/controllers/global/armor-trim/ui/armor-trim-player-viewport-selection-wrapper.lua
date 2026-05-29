local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.DropdownComponent
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "bedcoin-purchase-button").BedcoinPurchaseButton
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta")
local u15 = v14.ArmorTrimMeta
local u16 = v14.ArmorTrimPackTypeMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimPackType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "progress", "armor-trim-progress-util").ArmorTrimProgressUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-product-list").BedCoinProductList
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v23 = v1.import(script, script.Parent, "armor-trim-player-viewport")
local u24 = v23.ArmorTrimPlayerViewport
local u25 = v23.DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION
return {
    ["ArmorTrimViewportSelectionWrapper"] = v11.new(u10)(function(u26, p27) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u13
            [3] = u9
            [4] = u17
            [5] = u16
            [6] = u18
            [7] = u22
            [8] = u4
            [9] = u8
            [10] = u20
            [11] = u15
            [12] = u10
            [13] = u24
            [14] = u3
            [15] = u7
            [16] = u21
            [17] = u19
            [18] = u6
            [19] = u5
            [20] = u12
        --]]
        local v28 = p27.useState
        local _ = p27.useEffect
        local v29 = {}
        local v30 = u26.StartingSelection
        if v30 ~= nil then
            v30 = v30.armorSet
        end
        if v30 == nil then
            v30 = u25.armorSet
        end
        v29.armorSet = v30
        local v31 = u26.StartingSelection
        if v31 ~= nil then
            v31 = v31.armorTrimColor
        end
        if v31 == nil then
            v31 = u25.armorTrimColor
        end
        v29.armorTrimColor = v31
        local v32 = u26.StartingSelection
        if v32 ~= nil then
            v32 = v32.displayMode
        end
        if v32 == nil then
            v32 = u25.displayMode
        end
        v29.displayMode = v32
        local u33, u34 = v28(v29)
        local v35, u36 = v28(false)
        local u37 = u13:getState().ArmorTrim.allKitProgress[u26.SelectedKit]
        local v38 = 0
        local v39 = {}
        for v40, v41 in u9.values(u17) do
            local _ = v40 - 1
            local v42
            if u37 == nil then
                v42 = u37
            else
                v42 = #u37 == 0
            end
            if (v42 == false or v41 ~= u17.ALL_RANDOM) == true then
                v38 = v38 + 1
                v39[v38] = v41
            end
        end
        table.sort(v39)
        local function v44(p43) --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u18
                [3] = u37
            --]]
            return {
                ["text"] = u16[p43].displayName,
                ["value"] = tostring(p43),
                ["locked"] = #u18.getUnlockableArmorTrims(u37 or {}, p43) == 0
            }
        end
        local v45 = table.create(#v39)
        for v46, v47 in v39 do
            v45[v46] = v44(v47, v46 - 1, v39)
        end
        local u48, u49 = v28(v39[1])
        local u50 = {
            ["OWNED"] = {
                ["Text"] = "Equip",
                ["BackgroundColor3"] = u22.backgroundSuccess,
                ["OnSelected"] = function() --[[ Name: OnSelected, Line 108 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u8
                        [3] = u26
                        [4] = u33
                    --]]
                    if u4.isHoarceKat() then
                        return nil
                    end
                    u8.Controllers.ArmorTrimController:equipArmorTrimConfig(u26.SelectedKit, u26.ArmorTrimType, u33.armorTrimColor)
                end
            },
            ["EQUIPPED"] = {
                ["Text"] = "Equipped",
                ["BackgroundColor3"] = u22.backgroundSuccess,
                ["OnSelected"] = function() --[[ Name: OnSelected, Line 118 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u8
                        [3] = u26
                    --]]
                    if u4.isHoarceKat() then
                        return nil
                    end
                    u8.Controllers.ArmorTrimController:equipArmorTrimConfig(u26.SelectedKit, nil, nil)
                end
            },
            ["LOCKED"] = {
                ["Text"] = "Locked",
                ["BackgroundColor3"] = u22.Gray
            }
        }
        local v51 = {}
        local v52 = u20.getProductInfo(38).cost
        v51.Text = tostring(v52)
        v51.BackgroundColor3 = u22.mcGold
        function v51.OnSelected() --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u16
                [3] = u48
                [4] = u26
            --]]
            u8.Controllers.BedCoinProductPurchaseController:purchase({
                ["productId"] = u16[u48].productId,
                ["selectedKit"] = u26.SelectedKit
            })
        end
        u50.PURCHASE = v51
        local v53 = not u26.ArmorTrimType and "" or u15[u26.ArmorTrimType].name
        local v54 = {}
        for v55, v56 in u26 do
            v54[v55] = v56
        end
        v54.SelectedKit = nil
        v54.ArmorTrimType = nil
        v54.ArmorTrimEffectRank = nil
        v54.ButtonMode = nil
        v54.StartingSelection = nil
        v54.SelectionState = nil
        v54.xp = nil
        v54.ColorSignal = nil
        v54.ViewportProps = nil
        if u26.SelectionState == nil then
            u26.SelectionState = "LOCKED"
        end
        local v57
        if u26.SelectionState == "LOCKED" or u26.ArmorTrimType == nil then
            local v58 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            for v59, v60 in v54 do
                v58[v59] = v60
            end
            local v61 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["Padding"] = UDim.new(0, 5),
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }) }
            local v62 = #v61
            local v63 = {}
            local v64 = u26.ViewportProps
            if v64 ~= nil then
                v64 = v64.Size
            end
            if v64 == nil then
                v64 = u26.SelectionState == "PURCHASE"
            end
            local v65
            if v64 then
                v65 = UDim2.fromScale(0.75, 0.65)
            else
                v65 = UDim2.fromScale(0.75, 0.75)
            end
            v63.Size = v65
            local v66 = u26.ViewportProps
            if v66 ~= nil then
                v66 = v66.Position
            end
            if v66 == nil then
                v66 = u26.SelectionState == "PURCHASE"
            end
            local v67
            if v66 then
                v67 = UDim2.fromScale(0.5, 0.4)
            else
                v67 = UDim2.fromScale(0.5, 0.5)
            end
            v63.Position = v67
            local v68 = u26.ViewportProps
            if v68 ~= nil then
                v68 = v68.AnchorPoint
            end
            if v68 == nil then
                v68 = Vector2.new(0.5, 0.5)
            end
            v63.AnchorPoint = v68
            v63.BackgroundColor3 = u3.darken(u22.backgroundTertiaryCard, 0.5)
            local v69 = u26.ViewportProps
            if v69 ~= nil then
                v69 = v69.BorderSizePixel
            end
            v63.BorderSizePixel = v69 == nil and 0 or v69
            local v70 = u26.ViewportProps
            if v70 ~= nil then
                v70 = v70.BorderMode
            end
            v63.BorderMode = v70
            local v71 = u26.ViewportProps
            if v71 ~= nil then
                v71 = v71.BorderColor3
            end
            v63.BorderColor3 = v71
            local v72 = u26.ViewportProps
            if v72 ~= nil then
                v72 = v72.ZIndex
            end
            v63.ZIndex = v72
            local v73 = u26.ViewportProps
            if v73 ~= nil then
                v73 = v73.ClipsDescendants
            end
            v63.ClipsDescendants = v73
            local v74 = u26.ViewportProps
            if v74 ~= nil then
                v74 = v74.Visible
            end
            v63.Visible = v74
            local v75 = u26.ViewportProps
            if v75 ~= nil then
                v75 = v75.LayoutOrder
            end
            v63.LayoutOrder = v75 == nil and 1 or v75
            local v76 = u26.ViewportProps
            if v76 ~= nil then
                v76 = v76.BackgroundTransparency
            end
            v63.BackgroundTransparency = v76
            local v77 = u26.ViewportProps
            if v77 ~= nil then
                v77 = v77.Selectable
            end
            v63.Selectable = v77
            local v78 = v62 + 1
            local v79 = u10.createElement
            local v80 = "Frame"
            local v81 = {}
            local v82 = u10.createElement(u7, {
                ["Padding"] = UDim.new(0, 5)
            })
            local v83 = u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            })
            local v84 = u10.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = u21.QUESTION_MARK_SOLID,
                ["ImageColor3"] = u22.backgroundPrimary,
                ["ScaleType"] = Enum.ScaleType.Fit
            })
            local v85 = u10.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.2, 0.2),
                ["Position"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Image"] = u21.LOCK_SOLID,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u10.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
            local v86 = u10.createElement
            local v87 = "TextLabel"
            local v88 = {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.95, 0.2),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 1)
            }
            local v89
            if u26.SelectionState == "PURCHASE" then
                v89 = ""
            else
                local v90 = u19.NEXT_ARMOR_TRIM_TIER_UNLOCK + 1
                v89 = "Requires T" .. tostring(v90) .. " of previous Armor Trim"
            end
            v88.Text = v89
            v88.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            v88.TextColor3 = u3.WHITE
            __set_list(v81, 1, {v82, v83, v84, v85, v86(v87, v88)})
            v61[v78] = v79(v80, v63, v81)
            local v91
            if u26.SelectionState == "PURCHASE" then
                v91 = u10.createFragment({
                    ["ArmorTrimPackSelectionDropdown"] = u10.createElement(u6, {
                        ["LayoutOrder"] = 0,
                        ["Size"] = UDim2.fromScale(0.75, 0.1),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 1)
                    }, { u10.createElement(u5, {
                            ["DisallowLockedSelection"] = true,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["Position"] = UDim2.fromOffset(0, 0),
                            ["DefaultItem"] = v45[1],
                            ["BackgroundColor3"] = Color3.fromRGB(21, 21, 38),
                            ["Items"] = v45,
                            ["OnItemSelected"] = function(p92) --[[ Name: OnItemSelected, Line 332 ]]
                                --[[
                                Upvalues:
                                    [1] = u18
                                    [2] = u37
                                    [3] = u49
                                --]]
                                local v93 = tonumber(p92)
                                if #u18.getUnlockableArmorTrims(u37 or {}, v93) ~= 0 then
                                    u49(v93)
                                end
                            end
                        }) })
                })
            else
                v91 = false
            end
            if v91 then
                v61[v62 + 2] = v91
            end
            v57 = u10.createElement("Frame", v58, v61)
        else
            local v94 = {}
            for v95, v96 in v54 do
                v94[v95] = v96
            end
            v94.ColorSignal = u26.ColorSignal
            v94.SelectedKit = u26.SelectedKit
            v94.ArmorTrimType = u26.ArmorTrimType
            v94.ArmorTrimEffectRank = u26.ArmorTrimEffectRank
            v94.ButtonMode = u26.ButtonMode
            v94.StartingSelection = u26.StartingSelection
            function v94.OnSelectionChanged(p97) --[[ Line: 173 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u8
                    [3] = u34
                --]]
                if u26.SelectionState == "EQUIPPED" then
                    u8.Controllers.ArmorTrimController:equipArmorTrimConfig(u26.SelectedKit, u26.ArmorTrimType, p97.armorTrimColor)
                end
                u34(p97)
            end
            v94.ViewportProps = u26.ViewportProps
            v57 = u10.createElement(u24, v94)
        end
        local v98 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v99 = {
            u10.createElement(u7, {
                ["Padding"] = {
                    ["Bottom"] = 5
                }
            }),
            u10.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["TextWrapped"] = true,
                ["Position"] = UDim2.fromScale(0.5, 0.125),
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Text"] = v53,
                ["TextColor3"] = u3.WHITE,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Bottom
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 32,
                    ["MinTextSize"] = 16
                }) }),
            [#v99 + 1] = v57
        }
        local v100 = #v99
        local v101 = u26.xp ~= nil
        if v101 then
            local v102 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v103 = {}
            local v104 = #v103
            local v105 = {}
            local v106 = u26.ViewportProps
            if v106 ~= nil then
                v106 = v106.Size
            end
            if v106 == nil then
                v106 = UDim2.fromScale(0.75, 0.75)
            end
            v105.Size = v106
            local v107 = u26.ViewportProps
            if v107 ~= nil then
                v107 = v107.Position
            end
            if v107 == nil then
                v107 = UDim2.fromScale(0.5, 0.5)
            end
            v105.Position = v107
            local v108 = u26.ViewportProps
            if v108 ~= nil then
                v108 = v108.AnchorPoint
            end
            if v108 == nil then
                v108 = Vector2.new(0.5, 0.5)
            end
            v105.AnchorPoint = v108
            v105.ClipsDescendants = true
            v105.BackgroundTransparency = 1
            local v109 = v104 + 1
            local v110 = u10.createElement
            local v111 = u6
            local v112 = {}
            local v113 = u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            })
            local v114 = u10.createElement
            local v115 = u6
            local v116 = {
                ["Size"] = UDim2.fromScale(1, 0.03),
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1)
            }
            local v117 = {}
            local v118 = u10.createElement
            local v119 = {
                ["BorderSizePixel"] = 0
            }
            local v120 = UDim2.fromScale
            local v121 = u26.xp / u19.getXpAtTier(u19.getMaxTier())
            v119.Size = v120(math.min(v121, 1), 1)
            v119.BackgroundColor3 = u22.mcGreen
            __set_list(v117, 1, {v118("Frame", v119)})
            __set_list(v112, 1, {v113, v114(v115, v116, v117)})
            v103[v109] = v110(v111, v105, v112)
            v101 = u10.createElement(u6, v102, v103)
        end
        if v101 then
            v99[v100 + 1] = v101
        end
        local v122 = #v99
        local v123
        if u26.SelectionState == "PURCHASE" and u48 ~= nil then
            v123 = u10.createElement(u12, {
                ["BedcoinProductId"] = u16[u48].productId,
                ["PurchaseButtonProps"] = {
                    ["OnClick"] = function() --[[ Name: OnClick, Line 442 ]]
                        --[[
                        Upvalues:
                            [1] = u50
                        --]]
                        u50.PURCHASE.OnSelected()
                    end,
                    ["Position"] = UDim2.fromScale(0.5, 1),
                    ["AnchorPoint"] = Vector2.new(0.5, 1),
                    ["Size"] = UDim2.fromScale(0.5, 0.1)
                }
            })
        else
            local v124 = {
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Size"] = UDim2.fromScale(0.5, 0.1),
                ["BorderSizePixel"] = 0
            }
            local v125
            if v35 then
                v125 = u3.brighten(u50[u26.SelectionState].BackgroundColor3, 0.25)
            else
                v125 = u50[u26.SelectionState].BackgroundColor3
            end
            v124.BackgroundColor3 = v125
            v124[u10.Event.MouseEnter] = function() --[[ Line: 457 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36(true)
            end
            v124[u10.Event.MouseLeave] = function() --[[ Line: 460 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36(false)
            end
            v124[u10.Event.MouseButton1Click] = function() --[[ Line: 463 ]]
                --[[
                Upvalues:
                    [1] = u50
                    [2] = u26
                --]]
                local v126 = u50[u26.SelectionState or "LOCKED"].OnSelected
                if v126 ~= nil then
                    v126()
                end
            end
            local v127 = { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }), u10.createElement(u7, {
                    ["Padding"] = UDim.new(0, 5)
                }), u10.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Text"] = u50[u26.SelectionState or "LOCKED"].Text,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                }) }
            local v128 = #v127
            if u26.SelectionState == "EQUIPPED" or v35 then
                local v129 = u10.createElement
                local v130 = "UIStroke"
                local v131 = {
                    ["Thickness"] = 1
                }
                local v132
                if u26.SelectionState == "EQUIPPED" then
                    v132 = Color3.fromRGB(255, 209, 97)
                else
                    v132 = u3.WHITE
                end
                v131.Color = v132
                v35 = v129(v130, v131, { u10.createElement("UIGradient", {
                        ["Rotation"] = -90,
                        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                    }) })
            end
            if v35 then
                v127[v128 + 1] = v35
            end
            v123 = u10.createElement("ImageButton", v124, v127)
        end
        v99[v122 + 1] = v123
        return u10.createElement(u6, v98, v99)
    end)
}