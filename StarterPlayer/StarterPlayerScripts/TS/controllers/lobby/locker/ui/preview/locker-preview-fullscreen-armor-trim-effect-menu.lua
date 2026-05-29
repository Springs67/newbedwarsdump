local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.SoundManager
local u7 = v2.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "armor-trim", "ui", "armor-trim-switch-armor-type-button").ArmorTrimSwitchArmorTypeButton
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-meta").ArmorTrimEffectMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRankMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["LockerPreviewFullscreenArmorTrimEffectMenu"] = v9.new(u8)(function(u17) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u12
            [3] = u16
            [4] = u8
            [5] = u4
            [6] = u11
            [7] = u6
            [8] = u15
            [9] = u14
            [10] = u5
            [11] = u7
            [12] = u3
            [13] = u10
        --]]
        local v18 = u13[u17.previewEffectRank]
        local v19 = u12[u17.armorTrimType].effects
        if v19 ~= nil then
            v19 = v19.tierOverrides
        end
        local v20 = v19 ~= nil
        if v20 then
            local v21 = u17.previewEffectRank
            v20 = table.find(v19, v21) ~= nil
        end
        local v22 = {}
        local _ = #v22
        local v23 = {
            ["BackgroundTransparency"] = 0.45,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 5,
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.new(1, -14, 0.5, 0),
            ["Size"] = UDim2.new(0, 236, 0.42, 0),
            ["BackgroundColor3"] = u16.backgroundSecondary
        }
        local v24 = { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            }) }
        local _ = #v24
        local v25 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v26 = {
            u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 12),
                ["PaddingBottom"] = UDim.new(0, 12),
                ["PaddingLeft"] = UDim.new(0, 12),
                ["PaddingRight"] = UDim.new(0, 10)
            }),
            u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0, 10),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["ArmorTrimEffectMenuTitle"] = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Text"] = "Armor Trim Effect",
                ["TextSize"] = 17,
                ["LayoutOrder"] = 0,
                ["ZIndex"] = 6,
                ["Size"] = UDim2.new(1, 0, 0, 22),
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.GothamBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        }
        local _ = #v26
        local v27 = u17.selectableTypes
        local function v40(u28, p29) --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u4
                [3] = u11
                [4] = u8
                [5] = u6
                [6] = u15
                [7] = u14
            --]]
            local v30 = u28 == u17.selectedEffectType
            local v31 = u17.isLockedEffectType
            if v31 ~= nil then
                v31 = v31(u28)
            end
            if v31 == nil then
                v31 = false
            end
            local v32 = u28 == u17.equippedEffectType
            local v33 = {
                ["Size"] = UDim2.new(1, -2, 0, 42),
                ["AutoButtonColor"] = false,
                ["Active"] = true
            }
            local v34
            if v30 then
                v34 = Color3.fromRGB(45, 61, 85)
            else
                v34 = Color3.fromRGB(20, 20, 20)
            end
            v33.BackgroundColor3 = v34
            v33.BackgroundTransparency = v30 and 0.25 or 0.4
            v33.BorderSizePixel = 1
            local v35
            if v31 then
                v35 = Color3.fromRGB(145, 145, 145)
            else
                v35 = u4.WHITE
            end
            v33.BorderColor3 = v35
            v33.Text = u11[u28].name
            local v36
            if v31 then
                v36 = Color3.fromRGB(194, 194, 194)
            else
                v36 = u4.WHITE
            end
            v33.TextColor3 = v36
            v33.TextXAlignment = Enum.TextXAlignment.Left
            v33.Font = Enum.Font.GothamMedium
            v33.TextSize = 15
            v33.LayoutOrder = p29
            v33[u8.Event.MouseButton1Click] = function() --[[ Line: 108 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u15
                    [3] = u17
                    [4] = u28
                --]]
                u6:playSound(u15.UI_CLICK)
                u17.onSelectEffectType(u28)
            end
            v33.ZIndex = 6
            local v37 = { u8.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0, 10),
                    ["PaddingRight"] = UDim.new(0, 10)
                }), u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) }
            local v38 = #v37
            if v32 then
                v32 = u8.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Color"] = Color3.fromRGB(125, 255, 178),
                    ["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
                })
            end
            if v32 then
                v37[v38 + 1] = v32
            end
            local v39 = #v37
            if v31 then
                v31 = u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 7,
                    ["Size"] = UDim2.fromOffset(18, 18),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["Image"] = u14.LOCK_SOLID,
                    ["ImageColor3"] = Color3.fromRGB(255, 214, 124)
                })
            end
            if v31 then
                v37[v39 + 1] = v31
            end
            return u8.createFragment({
                ["ArmorTrimEffectRow_" .. u28] = u8.createElement("TextButton", v33, v37)
            })
        end
        local v41 = table.create(#v27)
        for v42, v43 in v27 do
            v41[v42] = v40(v43, v42 - 1, v27)
        end
        local v44 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ScrollBarThickness"] = 5,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 6,
            ["Size"] = UDim2.new(1, 0, 1, -82),
            ["ScrollBarImageColor3"] = u4.WHITE,
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y,
            ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
            ["CanvasSize"] = UDim2.new(0, 0, 0, 0)
        }
        local v45 = { u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 2),
                ["PaddingLeft"] = UDim.new(0, 1),
                ["PaddingRight"] = UDim.new(0, 3)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0, 6),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v46 = #v45
        for v47, v48 in v41 do
            v45[v46 + v47] = v48
        end
        v26.ArmorTrimEffectMenuScroll = u8.createElement("ScrollingFrame", v44, v45)
        local v49 = u8.createElement
        local v50 = "TextButton"
        local v51 = {
            ["Size"] = UDim2.new(1, 0, 0, 42),
            ["AutoButtonColor"] = false
        }
        local v52
        if u17.isSelectedEffectEquipped then
            v52 = Color3.fromRGB(45, 61, 85)
        elseif u17.canEquipSelectedEffect then
            v52 = Color3.fromRGB(43, 156, 78)
        else
            v52 = Color3.fromRGB(59, 59, 59)
        end
        v51.BackgroundColor3 = v52
        v51.BackgroundTransparency = 0.2
        v51.BorderSizePixel = 1
        v51.BorderColor3 = u4.WHITE
        v51.Text = u17.isSelectedEffectEquipped and "Equipped" or (u17.canEquipSelectedEffect and "Equip" or "Locked")
        v51.TextColor3 = u4.WHITE
        v51.Font = Enum.Font.GothamBold
        v51.TextSize = 16
        v51.LayoutOrder = 2
        v51[u8.Event.MouseButton1Click] = function() --[[ Line: 198 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u6
                [3] = u15
            --]]
            if not u17.canEquipSelectedEffect then
                u6:playSound(u15.UI_ERROR)
                return nil
            end
            if u17.isSelectedEffectEquipped then
                u6:playSound(u15.UI_CLICK)
                return nil
            end
            u6:playSound(u15.UI_CLICK)
            local v53 = u17.onEquipSelectedEffect
            if v53 ~= nil then
                v53()
            end
        end
        v51.ZIndex = 6
        v26.ArmorTrimEffectMenuEquipButton = v49(v50, v51, { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            }) })
        v24.ArmorTrimEffectMenuInner = u8.createElement("Frame", v25, v26)
        v22.ArmorTrimEffectMenu = u8.createFragment({
            ["ArmorTrimEffectMenu"] = u8.createElement("Frame", v23, v24)
        })
        local v54 = {
            ["BackgroundTransparency"] = 0.5,
            ["ZIndex"] = 4,
            ["Position"] = UDim2.new(0.5, 0, 1, -88),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Size"] = UDim2.fromOffset(128, 64),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v55 = { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.22, 0)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 6),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local _ = #v55
        local v57 = {
            ["Size"] = UDim2.fromOffset(52, 52),
            ["BackgroundTransparency"] = 1,
            ["AutoButtonColor"] = false,
            ["Text"] = "",
            ["Selectable"] = true,
            ["Active"] = true,
            [u8.Event.MouseButton1Click] = function() --[[ Line: 251 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u15
                    [3] = u17
                --]]
                u6:playSound(u15.UI_CLICK)
                local v56 = u17.onCyclePreviewEffectRank
                if v56 ~= nil then
                    v56()
                end
            end,
            ["ZIndex"] = 5
        }
        local v58 = { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) }
        local v59 = #v58
        local v60 = {
            ["BackgroundTransparency"] = 0.75,
            ["TextScaled"] = true,
            ["Active"] = false,
            ["Selectable"] = false,
            ["ZIndex"] = 6,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["Text"] = v18.text,
            ["BackgroundColor3"] = u4.darken(v18.color, 0.65),
            ["TextColor3"] = u4.brighten(v18.color, 0.65),
            ["Font"] = Enum.Font.SourceSansBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Bottom
        }
        local v61 = { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.22, 0)
            }) }
        local v62 = #v61
        if v20 then
            v20 = u8.createElement(u5, {
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u8.createElement("ImageLabel", {
                    ["ZIndex"] = 7,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.28, 0.28),
                    ["Position"] = UDim2.fromScale(0.96, 0.88),
                    ["AnchorPoint"] = Vector2.new(1, 1),
                    ["Image"] = u14.STAR_SOLID
                }), u8.createElement(u7, {}, { u8.createElement(u3, {
                        ["Text"] = "Special Effect",
                        ["TextSize"] = 26,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }) })
        end
        if v20 then
            v61[v62 + 1] = v20
        end
        v58[v59 + 1] = u8.createElement("TextLabel", v60, v61)
        v58[v59 + 2] = u8.createElement(u7, {}, { u8.createElement(u3, {
                ["Text"] = "Preview tier",
                ["TextSize"] = 16,
                ["Font"] = Enum.Font.SourceSansBold,
                ["Limits"] = Vector2.new(300, 60)
            }) })
        v55.ArmorTrimPreviewTierCycleButton = u8.createElement("TextButton", v57, v58)
        v55.SwitchArmorSetButton = u8.createElement(u10, {
            ["BackgroundTransparency"] = 1,
            ["Selectable"] = true,
            ["ZIndex"] = 5,
            ["Size"] = UDim2.fromOffset(52, 52),
            ["CurrentArmorSet"] = u17.currentArmorSet,
            ["OnSwitchArmorSet"] = function(p63) --[[ Name: OnSwitchArmorSet, Line 328 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u15
                    [3] = u17
                --]]
                u6:playSound(u15.UI_CLICK)
                local v64 = u17.onSwitchArmorSet
                if v64 ~= nil then
                    v64(p63)
                end
            end
        })
        v22.ArmorTrimPreviewTierCycleButtonContainer = u8.createFragment({
            ["ArmorTrimPreviewTierCycleButtonContainer"] = u8.createElement("Frame", v54, v55)
        })
        return u8.createFragment(v22)
    end)
}