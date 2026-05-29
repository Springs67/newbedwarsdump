local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.StringUtil
local u6 = v2.TabsComponent
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").Consumable
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-utils").getLobbyGadgetImage
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab")
local u29 = v28.LockerTab
local u30 = v28.LockerTabMeta
local u31 = v28.LockerTabOrder
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-meta").WinEffectMeta
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u37 = v1.import(script, script.Parent.Parent.Parent, "collection", "collection-core").CollectionCore
local u38 = v1.import(script, script.Parent.Parent, "locker-constants").LockerConstants
local u39 = v1.import(script, script.Parent, "emote", "locker-emote-items-grid").LockerEmoteItemsGrid
local u40 = v1.import(script, script.Parent, "emote", "locker-emote-radial-wheel").LockerEmoteRadialWheel
local u41 = v1.import(script, script.Parent, "locker-items-grid").LockerItemsGrid
local u42 = v1.import(script, script.Parent, "locker-util").LockerUtil
local u43 = v1.import(script, script.Parent, "showcase", "locker-showcase").LockerShowcase
return {
    ["LockerCore"] = v10.new(u9)(function(u44, p45) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u42
            [3] = u4
            [4] = u38
            [5] = u21
            [6] = u20
            [7] = u22
            [8] = u23
            [9] = u34
            [10] = u35
            [11] = u32
            [12] = u33
            [13] = u24
            [14] = u26
            [15] = u25
            [16] = u8
            [17] = u14
            [18] = u13
            [19] = u18
            [20] = u19
            [21] = u17
            [22] = u12
            [23] = u15
            [24] = u16
            [25] = u5
            [26] = u7
            [27] = u27
            [28] = u9
            [29] = u37
            [30] = u30
            [31] = u31
            [32] = u36
            [33] = u6
            [34] = u3
            [35] = u40
            [36] = u39
            [37] = u11
            [38] = u43
            [39] = u41
        --]]
        local v46 = p45.useState
        local v47 = p45.useEffect
        local _ = p45.useValue
        local u48, u49 = v46(u44.InitialTab or u29.COLLECTION)
        local u50, u51 = v46(1)
        local v52, u53 = v46(nil)
        local u54, u55 = v46(nil)
        local v56 = u42.isPreviewTab(u48) and 0.45 or 0.25
        local v57
        if u4.isSmallScreen() then
            v57 = u38.TAB_WIDTH_SMALL
        else
            v57 = u38.TAB_WIDTH
        end
        local function u96() --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u29
                [3] = u44
                [4] = u50
                [5] = u21
                [6] = u20
                [7] = u22
                [8] = u23
                [9] = u34
                [10] = u35
                [11] = u32
                [12] = u33
                [13] = u24
                [14] = u26
                [15] = u25
                [16] = u8
                [17] = u14
                [18] = u54
                [19] = u13
                [20] = u18
                [21] = u19
                [22] = u17
                [23] = u12
                [24] = u15
                [25] = u16
                [26] = u5
            --]]
            if u48 == u29.COLLECTION then
                return nil
            end
            if u48 == u29.EMOTES then
                local v58 = u44.LockerDto.selectedEmotes[u50] or u21.NONE
                local v59 = u20[v58]
                local v60 = {
                    ["name"] = v59.name
                }
                local v61 = v59.image
                v60.imageId = v61 == nil and "" or v61
                v60.itemEnum = v58
                v60.lockerTab = u48
                v60.none = v58 == u21.NONE
                return v60
            end
            if u48 == u29.KILL_EFFECTS then
                local v62 = u22[u44.LockerDto.selectedKillEffect]
                local v63 = {
                    ["name"] = v62.name
                }
                local v64 = v62.image
                v63.imageId = v64 == nil and "" or v64
                v63.itemEnum = u44.LockerDto.selectedKillEffect
                v63.lockerTab = u48
                v63.none = u44.LockerDto.selectedKillEffect == u23.NONE
                return v63
            end
            if u48 == u29.WIN_EFFECTS then
                local v65 = u34[u44.LockerDto.selectedWinEffect]
                local v66 = {
                    ["name"] = v65.name
                }
                local v67 = v65.image
                v66.imageId = v67 == nil and "" or v67
                v66.itemEnum = u44.LockerDto.selectedWinEffect
                v66.lockerTab = u48
                v66.none = u44.LockerDto.selectedWinEffect == u35.NONE
                return v66
            end
            if u48 == u29.TITLES then
                local v68 = u32[u44.LockerDto.selectedTitle]
                local v69 = {}
                local v70 = v68.name
                if v70 == nil then
                    v70 = v68.text
                end
                v69.name = v70
                v69.imageId = ""
                v69.itemEnum = u44.LockerDto.selectedTitle
                v69.lockerTab = u48
                v69.none = u44.LockerDto.selectedTitle == u33.NONE
                return v69
            end
            if u48 == u29.LOBBY_GADGETS then
                local v71 = {
                    ["name"] = u24[u44.LockerDto.selectedLobbyGadget].name
                }
                local v72 = u26(u44.LockerDto.selectedLobbyGadget)
                v71.imageId = v72 == nil and "" or v72
                v71.itemEnum = u44.LockerDto.selectedLobbyGadget
                v71.lockerTab = u48
                v71.none = u44.LockerDto.selectedLobbyGadget == u25.NONE
                return v71
            end
            if u48 == u29.CONSUMABLES then
                local v73 = u8.values(u14)
                local v74 = u54
                if v74 ~= nil then
                    v74 = v74.itemEnum
                end
                if v74 == nil then
                    return nil
                end
                if (table.find(v73, v74) or 0) - 1 == -1 then
                    return nil
                end
                local v75 = u13(v74)
                local v76 = {
                    ["name"] = v75.displayName,
                    ["imageId"] = v75.image,
                    ["itemEnum"] = v74
                }
                local v77 = u54
                if v77 ~= nil then
                    v77 = v77.consumableId
                end
                v76.consumableId = v77
                v76.lockerTab = u48
                return v76
            end
            if u48 == u29.BREAK_BED_EFFECTS then
                local v78 = u18[u44.LockerDto.selectedBreakBedEffect]
                local v79 = {}
                local v80
                if v78 == nil then
                    v80 = v78
                else
                    v80 = v78.name
                end
                v79.name = v80
                if v78 ~= nil then
                    v78 = v78.image
                end
                v79.imageId = v78 == nil and "" or v78
                v79.itemEnum = u44.LockerDto.selectedBreakBedEffect
                v79.lockerTab = u48
                v79.none = u44.LockerDto.selectedBreakBedEffect == u19.NONE
                return v79
            end
            if u48 == u29.BADGES then
                local v81 = u44.LockerDto.featuredBadges[1]
                if v81 == u17.NONE then
                    return {
                        ["name"] = "None",
                        ["imageId"] = "",
                        ["none"] = true,
                        ["itemEnum"] = u17.NONE,
                        ["lockerTab"] = u48
                    }
                end
                local v82 = u12.getMeta(v81)
                local v83 = {}
                local v84
                if v82 == nil then
                    v84 = v82
                else
                    v84 = v82.title
                end
                v83.name = v84 == nil and "" or v84
                local v85 = v82.goal
                if v85 ~= nil then
                    v85 = v85.value
                end
                v83.description = v82.description(v85)
                v83.imageId = ""
                v83.itemEnum = u44.LockerDto.featuredBadges[1]
                v83.lockerTab = u48
                return v83
            end
            if u48 == u29.BED_SKIN then
                if not u44.LockerDto.bedSkin then
                    return {
                        ["name"] = "None",
                        ["imageId"] = "",
                        ["itemEnum"] = "none",
                        ["none"] = true,
                        ["lockerTab"] = u48
                    }
                end
                local v86 = u15(u44.LockerDto.bedSkin)
                local v87 = u16(v86.itemType)
                local v88 = string.split(v86.skinTag, "_")
                local v89 = table.create(#v88)
                for v90, v91 in v88 do
                    local _ = v90 - 1
                    v89[v90] = u5.capitalizeFirstLetter(v91)
                end
                local v92 = table.concat(v89, "")
                local v93 = {}
                local v94 = v86.name
                if v94 == nil then
                    v94 = v92 .. " " .. v87.displayName
                end
                v93.name = v94
                local v95 = v86.renderImage
                v93.imageId = v95 == nil and "" or v95
                v93.itemEnum = u44.LockerDto.bedSkin
                v93.lockerTab = u48
                return v93
            end
        end
        v47(function() --[[ Line: 264 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u29
                [3] = u53
                [4] = u42
                [5] = u44
                [6] = u55
                [7] = u96
            --]]
            if u48 == u29.COLLECTION then
                u53(nil)
            else
                u53(u42.buildElementGrid(u48, u44.LockerDto, u44.ConsumableInventory))
            end
            u55(u96())
        end, { u48, u44.LockerDto, u44.ConsumableInventory })
        v47(function() --[[ Line: 272 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u48
                [3] = u29
                [4] = u7
                [5] = u27
            --]]
            if not u4.isHoarceKat() then
                if u48 == u29.BREAK_BED_EFFECTS then
                    u7.Controllers.LockerController:getLockerCategoryItems(u27.BED_BREAK_EFFECT)
                    u7.Controllers.LockerController:getEquippedLockerItem(u27.BED_BREAK_EFFECT)
                    return
                end
                if u48 == u29.EMOTES then
                    u7.Controllers.LockerController:getLockerCategoryItems(u27.EMOTE)
                    u7.Controllers.LockerController:getEquippedLockerItem(u27.EMOTE)
                    return
                end
                if u48 == u29.KILL_EFFECTS then
                    u7.Controllers.LockerController:getLockerCategoryItems(u27.KILL_EFFECT)
                    u7.Controllers.LockerController:getEquippedLockerItem(u27.KILL_EFFECT)
                    return
                end
                if u48 == u29.LOBBY_GADGETS then
                    u7.Controllers.LockerController:getLockerCategoryItems(u27.LOBBY_GADGET)
                    u7.Controllers.LockerController:getEquippedLockerItem(u27.LOBBY_GADGET)
                    return
                end
                if u48 == u29.TITLES then
                    u7.Controllers.LockerController:getLockerCategoryItems(u27.TITLE)
                    u7.Controllers.LockerController:getEquippedLockerItem(u27.TITLE)
                    return
                end
                if u48 == u29.WIN_EFFECTS then
                    u7.Controllers.LockerController:getLockerCategoryItems(u27.WIN_EFFECT)
                    u7.Controllers.LockerController:getEquippedLockerItem(u27.WIN_EFFECT)
                    return
                end
                if u48 == u29.BADGES then
                    u7.Controllers.LockerController:getLockerCategoryItems(u27.BADGE)
                    u7.Controllers.LockerController:getEquippedLockerItem(u27.BADGE)
                    return
                end
                if u48 == u29.BED_SKIN then
                    u7.Controllers.LockerController:getLockerCategoryItems(u27.BED_SKIN)
                    u7.Controllers.LockerController:getEquippedLockerItem(u27.BED_SKIN)
                    return
                end
                if u48 == u29.COLLECTION then
                    u7.Controllers.LockerController:getLockerCategoryItems(u27.ITEM_SKIN)
                    for v97, v98 in {
                        u27.TITLE,
                        u27.EMOTE,
                        u27.KILL_EFFECT,
                        u27.WIN_EFFECT,
                        u27.BED_BREAK_EFFECT,
                        u27.LOBBY_GADGET,
                        u27.BED_SKIN,
                        u27.BADGE,
                        u27.ITEM_SKIN
                    } do
                        local _ = v97 - 1
                        u7.Controllers.LockerController:getEquippedLockerItem(v98)
                    end
                    return
                end
            end
        end, { u48 })
        v47(function() --[[ Line: 331 ]]
            --[[
            Upvalues:
                [1] = u55
                [2] = u96
            --]]
            u55(u96())
        end, { u50 })
        v47(function() --[[ Line: 334 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u42
                [3] = u54
                [4] = u48
            --]]
            if u4.isHoarceKat() then
                return nil
            end
            u42.previewElement(u54, u48)
        end, { u54 })
        v47(function() --[[ Line: 342 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u48
                [3] = u29
                [4] = u49
            --]]
            if u44.FullScreenData.BackButton.ShouldShowBackButton and u48 ~= u29.COLLECTION then
                u49(u29.COLLECTION)
            end
        end, { u44.FullScreenData.BackButton.BackButtonClickCount })
        local v99 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0)
        }
        local v100 = {}
        local v101 = #v100
        local v102
        if u48 == u29.COLLECTION then
            v102 = u9.createElement(u37, {
                ["SetShouldShowBackButton"] = u44.FullScreenData.BackButton.SetShouldShowBackButton,
                ["BackButtonClickCount"] = u44.FullScreenData.BackButton.BackButtonClickCount,
                ["SelectedEmotes"] = u44.LockerDto.selectedEmotes,
                ["OnLockerItemClick"] = function(_, p103) --[[ Name: OnLockerItemClick, Line 359 ]]
                    --[[
                    Upvalues:
                        [1] = u44
                        [2] = u49
                    --]]
                    if p103 then
                        u44.FullScreenData.BackButton.SetShouldShowBackButton(true)
                        u49(p103)
                    end
                end
            })
        else
            v102 = false
        end
        if v102 then
            v100[v101 + 1] = v102
        end
        local v104 = #v100
        if v52 then
            local v105 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }
            local v106 = { u9.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0, u4.isSmallScreen() and 20 or 40),
                    ["PaddingRight"] = UDim.new(0, u4.isSmallScreen() and 20 or 40),
                    ["PaddingTop"] = UDim.new(0, 60),
                    ["PaddingBottom"] = UDim.new(0, u4.isSmallScreen() and 30 or 60)
                }), u9.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0.01, 0)
                }) }
            local v107 = #v106
            local v108 = {
                ["ScrollingFrameProps"] = {
                    ["Size"] = UDim2.new(0, v57, 1, 0),
                    ["CanvasSize"] = UDim2.new(0, v57, 0, (u4.isSmallScreen() and 30 or 60) * 8 + 80),
                    ["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Left
                }
            }
            local v109 = {}
            local v110 = #v109
            local v111 = u8.values(u29)
            local v112 = table.create(#v111)
            local v113 = {
                ["Value"] = u48
            }
            for v114, v115 in v111 do
                local _ = v114 - 1
                local v116 = {
                    ["value"] = v115
                }
                local v117 = u30[v115]
                if v117 ~= nil then
                    v117 = v117.title
                end
                if v117 == nil then
                    v117 = v115
                end
                v116.text = v117
                v116.layoutOrder = u31[v115]
                v112[v114] = v116
            end
            v113.Tabs = v112
            function v113.OnChange(p118) --[[ Line: 431 ]]
                --[[
                Upvalues:
                    [1] = u48
                    [2] = u53
                    [3] = u49
                --]]
                if p118.value ~= u48 then
                    u53({})
                    u49(p118.value)
                end
            end
            v113.ButtonUIConfig = {
                ["InactiveBGTransparency"] = 0.5,
                ["Padding"] = {
                    ["PaddingTop"] = UDim.new(0, 4),
                    ["PaddingBottom"] = UDim.new(0, 4),
                    ["PaddingLeft"] = UDim.new(0, 10),
                    ["PaddingRight"] = UDim.new(0, 10)
                },
                ["MaxTextSize"] = u4.isSmallScreen() and 11 or 18
            }
            v113.ButtonProps = {
                ["TextWrapped"] = true,
                ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 30 or 60),
                ["AutomaticSize"] = Enum.AutomaticSize.None
            }
            v113.UIListLayout = {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalFlex"] = Enum.UIFlexAlignment.Fill,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center
            }
            v113.ScrollingFrame = {
                ["Active"] = true,
                ["ScrollingFrameProps"] = {
                    ["BackgroundTransparency"] = 0,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(0, v57, 1, 0),
                    ["CanvasSize"] = UDim2.new(0.98, 0, 1, 0),
                    ["BackgroundColor3"] = u36.backgroundTertiary
                }
            }
            v109[v110 + 1] = u9.createElement(u6, v113)
            v106[v107 + 1] = u9.createElement(u3, v108, v109)
            local v119
            if u48 == u29.EMOTES then
                v119 = u9.createElement(u40, {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.new(0.45, -(v57 / 2), 1, 0),
                    ["SelectedEmotes"] = u44.LockerDto.selectedEmotes,
                    ["SetSelectedSlot"] = function(p120) --[[ Name: SetSelectedSlot, Line 474 ]]
                        --[[
                        Upvalues:
                            [1] = u51
                        --]]
                        u51(p120)
                    end,
                    ["Element"] = u54
                })
            else
                v119 = false
            end
            if v119 then
                v106[v107 + 2] = v119
            end
            local v121 = #v106
            local v122
            if u48 == u29.EMOTES then
                v122 = u9.createElement(u39, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(0.54, -(v57 / 2), 1, 0),
                    ["Tab"] = u48,
                    ["MinSize"] = Vector2.new(0, 400),
                    ["MaxSize"] = Vector2.new((1 / 0), (1 / 0)),
                    ["Elements"] = v52,
                    ["EquippedElement"] = u54,
                    ["SelectedSlot"] = u50,
                    ["OnSelectionChange"] = function(p123, p124) --[[ Name: OnSelectionChange, Line 492 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u11
                            [3] = u42
                            [4] = u7
                            [5] = u55
                        --]]
                        if u4.isHoarceKat() then
                            u11:dispatch({
                                ["type"] = "LockerSetEmote",
                                ["emote"] = p123,
                                ["slot"] = p124
                            })
                        else
                            local v125 = u42.createLockerItemDisplay({
                                ["emote"] = p123
                            })
                            u7.Controllers.LockerController:setEmote(p123, p124)
                            u55(v125)
                        end
                    end
                })
            else
                v122 = false
            end
            if v122 then
                v106[v121 + 1] = v122
            end
            local v126 = #v106
            local v127
            if u48 == u29.EMOTES then
                v127 = false
            else
                v127 = u9.createElement(u43, {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.new(v56, -(v57 / 2), 1, 0),
                    ["Element"] = u54,
                    ["Tab"] = u48,
                    ["RebuildElements"] = function() --[[ Name: RebuildElements, Line 516 ]]
                        --[[
                        Upvalues:
                            [1] = u53
                            [2] = u42
                            [3] = u48
                            [4] = u44
                        --]]
                        u53(u42.buildElementGrid(u48, u44.LockerDto, u44.ConsumableInventory))
                    end
                })
            end
            if v127 then
                v106[v126 + 1] = v127
            end
            local v128 = #v106
            local v129
            if u48 == u29.EMOTES then
                v129 = false
            else
                v129 = u9.createElement(u41, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(1 - v56 - 0.01, -(v57 / 2), 1, 0),
                    ["Tab"] = u48,
                    ["ConsumableInventory"] = u44.ConsumableInventory,
                    ["MinSize"] = Vector2.new(0, 400),
                    ["MaxSize"] = Vector2.new((1 / 0), (1 / 0)),
                    ["Elements"] = v52,
                    ["EquippedElement"] = u54,
                    ["SetElement"] = u55
                })
            end
            if v129 then
                v106[v128 + 1] = v129
            end
            v52 = u9.createElement("Frame", v105, v106)
        end
        if v52 then
            v100[v104 + 1] = v52
        end
        return u9.createElement("Frame", v99, v100)
    end)
}