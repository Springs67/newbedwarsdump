local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.Padding
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types")
local u11 = v10.LockerCategoryToTab
local u12 = v10.LockerItemCategory
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab
local u14 = v1.import(script, script.Parent.Parent, "locker", "ui", "emote", "locker-emote-radial-wheel").LockerEmoteRadialWheel
local u15 = v1.import(script, script.Parent, "collection-items-section").CollectionItemsSection
local u16 = v1.import(script, script.Parent, "collection-sections").CollectionSectionMeta
local u17 = v1.import(script, script.Parent, "item-skins", "item-skin-selector").ItemSkinSelector
return {
    ["CollectionCore"] = v9.new(u8)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u17
            [3] = u7
            [4] = u16
            [5] = u15
            [6] = u5
            [7] = u11
            [8] = u14
            [9] = u12
            [10] = u13
            [11] = u3
            [12] = u6
            [13] = u4
        --]]
        local v20 = p19.useState
        local v21 = p19.useEffect
        local v22, u23 = v20(nil)
        v21(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u23
            --]]
            if u18.BackButtonClickCount > 0 then
                u23(nil)
                local v24 = u18.SetShouldShowBackButton
                if v24 ~= nil then
                    v24(false)
                end
            end
        end, { u18.BackButtonClickCount })
        local v25
        if v22 then
            v25 = u8.createElement(u17, {
                ["AppId"] = "ItemSkinSelector",
                ["BaseItemSkinType"] = v22
            })
        else
            local v26 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["SortOrder"] = "LayoutOrder",
                    ["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceAround
                }) }
            local _ = #v26
            local v27 = u7.entries(u16)
            table.sort(v27, function(p28, p29) --[[ Line: 48 ]]
                local v30 = p28[2].layoutOrder
                local v31 = v30 == nil and 100 or v30
                local v32 = p29[2].layoutOrder
                return v31 < (v32 == nil and 100 or v32)
            end)
            local function v38(p33, p34) --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u15
                    [3] = u23
                    [4] = u18
                --]]
                local v35 = p33[1]
                if p33[2].skinBaseItemTypes then
                    return u8.createElement(u15, {
                        ["Section"] = v35,
                        ["Size"] = UDim2.fromScale(1, 0.23),
                        ["SetSelectedBaseItemSkin"] = function(p36) --[[ Name: SetSelectedBaseItemSkin, Line 69 ]]
                            --[[
                            Upvalues:
                                [1] = u23
                                [2] = u18
                            --]]
                            u23(p36)
                            local v37 = u18.SetShouldShowBackButton
                            if v37 ~= nil then
                                v37(true)
                            end
                        end,
                        ["GamepadShouldAutoSelect"] = p34 == 0
                    })
                else
                    return nil
                end
            end
            local v39 = 0
            local v40 = {}
            for v41, v42 in v27 do
                local v43 = v38(v42, v41 - 1, v27)
                if v43 ~= nil then
                    v39 = v39 + 1
                    v40[v39] = v43
                end
            end
            local v44 = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.4, 1)
            }
            local v45 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Top",
                    ["HorizontalAlignment"] = "Left",
                    ["Padding"] = UDim.new(0.0266, 0)
                }) }
            local v46 = #v45
            for v47, v48 in v40 do
                v45[v46 + v47] = v48
            end
            v26.ItemSkins = u8.createFragment({
                ["ItemSkins"] = u8.createElement(u5, v44, v45)
            })
            local v49 = u7.entries(u16)
            table.sort(v49, function(p50, p51) --[[ Line: 110 ]]
                local v52 = p50[2].layoutOrder
                local v53 = v52 == nil and 100 or v52
                local v54 = p51[2].layoutOrder
                return v53 < (v54 == nil and 100 or v54)
            end)
            local function v60(p55) --[[ Line: 122 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u15
                    [3] = u11
                    [4] = u18
                --]]
                local v56 = p55[1]
                local u57 = p55[2]
                if u57.lockerCategory then
                    return u8.createElement(u15, {
                        ["Section"] = v56,
                        ["Size"] = UDim2.fromScale(0.48, 0.23),
                        ["OnLockerClick"] = function() --[[ Name: OnLockerClick, Line 131 ]]
                            --[[
                            Upvalues:
                                [1] = u11
                                [2] = u57
                                [3] = u18
                            --]]
                            local v58 = u11[u57.lockerCategory]
                            local v59 = u18.OnLockerItemClick
                            if v59 ~= nil then
                                v59(u57.lockerCategory, v58)
                            end
                        end
                    })
                else
                    return nil
                end
            end
            local v61 = 0
            local v62 = {}
            for v63, v64 in v49 do
                local v65 = v60(v64, v63 - 1, v49)
                if v65 ~= nil then
                    v61 = v61 + 1
                    v62[v61] = v65
                end
            end
            local v66 = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.32, 1)
            }
            local v67 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Top",
                    ["HorizontalAlignment"] = "Left",
                    ["Wraps"] = true,
                    ["Padding"] = UDim.new(0.0266, 0)
                }) }
            local v68 = #v67
            for v69, v70 in v62 do
                v67[v68 + v69] = v70
            end
            v26.LockerItems = u8.createFragment({
                ["LockerItems"] = u8.createElement(u5, v66, v67)
            })
            local v71 = u8.createFragment
            local v74 = {
                ["Other"] = u8.createElement(u5, {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(0.22, 1)
                }, {
                    u8.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["VerticalAlignment"] = "Top",
                        ["HorizontalAlignment"] = "Left",
                        ["SortOrder"] = "LayoutOrder",
                        ["VerticalFlex"] = Enum.UIFlexAlignment.Fill,
                        ["Padding"] = UDim.new(0.03, 0)
                    }),
                    ["EmotesSection"] = u8.createElement(u5, {
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.7)
                    }, {
                        ["Title"] = u8.createElement("TextLabel", {
                            ["Text"] = "EMOTES",
                            ["TextScaled"] = true,
                            ["TextXAlignment"] = "Left",
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(1, 0.06),
                            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                        }),
                        u8.createElement(u14, {
                            ["LayoutOrder"] = 3,
                            ["Size"] = UDim2.new(1, 0, 0.8, 0),
                            ["AnchorPoint"] = Vector2.new(0, 0),
                            ["Position"] = UDim2.fromScale(0, 0.12),
                            ["SelectedEmotes"] = u18.SelectedEmotes,
                            ["SetSelectedSlot"] = function(_) --[[ Name: SetSelectedSlot, Line 203 ]]
                                --[[
                                Upvalues:
                                    [1] = u18
                                    [2] = u12
                                    [3] = u13
                                --]]
                                local v72 = u18.OnLockerItemClick
                                if v72 ~= nil then
                                    v72(u12.EMOTE, u13.EMOTES)
                                end
                                return nil
                            end
                        })
                    }),
                    ["ConsumablesSection"] = u8.createElement(u5, {
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(1, 0.3)
                    }, {
                        ["Title"] = u8.createElement("TextLabel", {
                            ["Text"] = "CONSUMABLES",
                            ["TextScaled"] = true,
                            ["TextXAlignment"] = "Left",
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(1, 0.15),
                            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                        }),
                        u8.createElement(u3, {
                            ["Text"] = "View Consumables",
                            ["TextScaled"] = true,
                            ["Size"] = UDim2.fromScale(0.8, 0.35),
                            ["Position"] = UDim2.fromScale(0, 0.2),
                            ["OnClick"] = function() --[[ Name: OnClick, Line 229 ]]
                                --[[
                                Upvalues:
                                    [1] = u18
                                    [2] = u13
                                --]]
                                local v73 = u18.OnLockerItemClick
                                if v73 ~= nil then
                                    v73(nil, u13.CONSUMABLES)
                                end
                            end
                        }, { u8.createElement(u6, {
                                ["Padding"] = UDim.new(0.1, 0)
                            }) })
                    })
                })
            }
            v26.Other = v71(v74)
            v25 = u8.createFragment(v26)
        end
        local v75 = {
            ["Position"] = UDim2.fromScale(0.5, 0.535),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.9, u4.isSmallScreen() and 0.75 or 0.78)
        }
        local v76 = {
            [#v76 + 1] = v25
        }
        return u8.createFragment({
            ["Container"] = u8.createElement(u5, v75, v76)
        })
    end)
}