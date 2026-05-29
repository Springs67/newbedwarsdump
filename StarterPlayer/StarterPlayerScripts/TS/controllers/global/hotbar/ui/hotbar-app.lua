local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v3.GamepadAbilityUIContainer
local u7 = v3.RandomUtil
local u8 = v3.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.Players
local u17 = v15.UserInputService
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u30 = v1.import(script, script.Parent.Parent.Parent, "creative", "custom-match", "hotbar-custom-match-section").HotbarCustomMatchSection
local u31 = v1.import(script, script.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport
local u32 = v1.import(script, script.Parent, "healthbar", "hotbar-healthbar").HotbarHealthbar
local u33 = v1.import(script, script.Parent, "hotbar-item-name-display").HotbarItemNameDisplay
local u34 = v1.import(script, script.Parent, "hotbar-open-inventory").HotbarOpenInventory
local u35 = v1.import(script, script.Parent, "hotbar-resource-display").HotbarResourceDisplay
local u36 = v1.import(script, script.Parent, "hotbar-team-event-collectable-display").HotbarTeamEventCollectableDisplay
local u37 = v1.import(script, script.Parent, "hotbar-tile").HotbarTile
local u38 = v1.import(script, script.Parent, "pregame", "hotbar-pregame").HotbarPregame
local u39 = v1.import(script, script.Parent, "spectate", "hotbar-spectator-section").HotbarSpectatorSection
local u40 = {
    Enum.KeyCode.One,
    Enum.KeyCode.Two,
    Enum.KeyCode.Three,
    Enum.KeyCode.Four,
    Enum.KeyCode.Five,
    Enum.KeyCode.Six,
    Enum.KeyCode.Seven,
    Enum.KeyCode.Eight,
    Enum.KeyCode.Nine,
    Enum.KeyCode.Zero
}
local v41 = {}
local u42 = setmetatable({}, {
    ["__index"] = v41
})
u42.PARTY = 0
v41[0] = "PARTY"
u42.SPECTATOR = 1
v41[1] = "SPECTATOR"
u42.HEALTHBAR = 2
v41[2] = "HEALTHBAR"
u42.CUSTOM_MATCH_PREGAME = 3
v41[3] = "CUSTOM_MATCH_PREGAME"
u42.POST_GAME = 4
v41[4] = "POST_GAME"
u42.PRE_GAME = 5
v41[5] = "PRE_GAME"
local function v134(u43, p44) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u27
        [3] = u11
        [4] = u4
        [5] = u16
        [6] = u21
        [7] = u42
        [8] = u25
        [9] = u29
        [10] = u9
        [11] = u24
        [12] = u20
        [13] = u12
        [14] = u39
        [15] = u32
        [16] = u30
        [17] = u38
        [18] = u10
        [19] = u22
        [20] = u31
        [21] = u5
        [22] = u40
        [23] = u37
        [24] = u2
        [25] = u19
        [26] = u26
        [27] = u23
        [28] = u8
        [29] = u7
        [30] = u28
        [31] = u34
        [32] = u33
        [33] = u35
        [34] = u36
        [35] = u17
        [36] = u6
    --]]
    local v45 = p44.useState
    local v46 = p44.useEffect
    local v47, u48 = v45(u18:getState().Settings[u27.SHOW_RESOURCES_IN_HUD])
    local u49, u50 = v45(nil)
    v46(function() --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u16
            [4] = u50
            [5] = u18
            [6] = u27
            [7] = u48
        --]]
        local u51 = u11.new()
        if u4.isHoarceKat() then
            return nil
        end
        u50((u16.LocalPlayer:GetAttribute("TutorialHighlightedSlot")))
        u51:GiveTask(u16.LocalPlayer:GetAttributeChangedSignal("TutorialHighlightedSlot"):Connect(function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u50
            --]]
            local v52 = u16.LocalPlayer:GetAttribute("TutorialHighlightedSlot")
            u50(v52 == nil and -1 or v52)
        end))
        local u55 = u18.changed:connect(function(p53, p54) --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u48
            --]]
            if p53.Settings[u27.SHOW_RESOURCES_IN_HUD] ~= p54.Settings[u27.SHOW_RESOURCES_IN_HUD] then
                u48(p53.Settings[u27.SHOW_RESOURCES_IN_HUD])
            end
        end)
        u51:GiveTask(function() --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u55
            --]]
            return u55:disconnect()
        end)
        return function() --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u51
            --]]
            u51:DoCleaning()
        end
    end, { u49 })
    local v56
    if u43.QueueType then
        v56 = u21[u43.QueueType]
    else
        v56 = nil
    end
    local v57 = u42.HEALTHBAR
    if u43.store.App.showHotbarPartyControls then
        v57 = u42.PARTY
    elseif u43.store.Game.customMatch and (u43.store.Game.matchState == u25.PRE and not u43.store.Game.pregameVotingEnabled) then
        v57 = u42.CUSTOM_MATCH_PREGAME
    elseif u43.store.Game.spectating then
        v57 = u42.SPECTATOR
    elseif u43.store.Game.matchState == u25.PRE and (u29.isGameServer() and (v56 and not v56.noKits)) then
        v57 = u42.PRE_GAME
    end
    if u43.store.Game.matchState == u25.POST then
        v57 = u42.POST_GAME
    end
    local v58 = u43.store.Inventory.observedInventory.inventory.armor
    local u59
    if u4.isHoarceKat() then
        u59 = nil
    else
        u59 = u9.Controllers.InventoryController:getEquippedArmor(v58)
    end
    local v60
    if u4.isHoarceKat() then
        v60 = nil
    else
        v60 = u9.Controllers.KeybindLoadController:getKeybinds()
    end
    local v61
    if v60 == nil then
        v61 = v60
    else
        v61 = v60.keyboard
        if v61 ~= nil then
            v61 = v61.controlActions.HotbarSlot1
        end
    end
    if v61 == nil then
        v61 = u24.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1
    end
    local v62
    if v60 == nil then
        v62 = v60
    else
        v62 = v60.keyboard
        if v62 ~= nil then
            v62 = v62.controlActions.HotbarSlot2
        end
    end
    if v62 == nil then
        v62 = u24.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1
    end
    local v63
    if v60 == nil then
        v63 = v60
    else
        v63 = v60.keyboard
        if v63 ~= nil then
            v63 = v63.controlActions.HotbarSlot3
        end
    end
    if v63 == nil then
        v63 = u24.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1
    end
    local v64
    if v60 == nil then
        v64 = v60
    else
        v64 = v60.keyboard
        if v64 ~= nil then
            v64 = v64.controlActions.HotbarSlot4
        end
    end
    if v64 == nil then
        v64 = u24.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1
    end
    local v65
    if v60 == nil then
        v65 = v60
    else
        v65 = v60.keyboard
        if v65 ~= nil then
            v65 = v65.controlActions.HotbarSlot5
        end
    end
    if v65 == nil then
        v65 = u24.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1
    end
    local v66
    if v60 == nil then
        v66 = v60
    else
        v66 = v60.keyboard
        if v66 ~= nil then
            v66 = v66.controlActions.HotbarSlot6
        end
    end
    if v66 == nil then
        v66 = u24.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1
    end
    local v67
    if v60 == nil then
        v67 = v60
    else
        v67 = v60.keyboard
        if v67 ~= nil then
            v67 = v67.controlActions.HotbarSlot7
        end
    end
    if v67 == nil then
        v67 = u24.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1
    end
    local v68
    if v60 == nil then
        v68 = v60
    else
        v68 = v60.keyboard
        if v68 ~= nil then
            v68 = v68.controlActions.HotbarSlot8
        end
    end
    if v68 == nil then
        v68 = u24.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1
    end
    if v60 ~= nil then
        v60 = v60.keyboard
        if v60 ~= nil then
            v60 = v60.controlActions.HotbarSlot9
        end
    end
    if v60 == nil then
        v60 = u24.KEYBOARD_KEYBINDS.controlActions.HotbarSlot1
    end
    local u69 = {
        v61,
        v62,
        v63,
        v64,
        v65,
        v66,
        v67,
        v68,
        v60
    }
    local v70 = #u20.getActiveTeamEvents() > 0 and (not u43.store.Game.customMatch and u29.isGameServer())
    if v70 then
        v70 = u20.isEventRunning(u20.getActiveTeamEvents()[1])
    end
    local v71 = {
        ["DisplayOrder"] = 10
    }
    local v72 = {}
    local v73 = #v72
    local v74 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.6, u4.isSmallScreen() and 0.13 or 0.08),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, u4.isSmallScreen() and 0.95 or 0.99)
    }
    local v75 = { u12.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 9
        }) }
    local v76 = #v75
    local v77
    if v57 == u42.SPECTATOR then
        v77 = u12.createElement(u39)
    else
        v77 = false
    end
    if v77 then
        v75[v76 + 1] = v77
    end
    local v78 = #v75
    local v79
    if v57 == u42.HEALTHBAR then
        v79 = u12.createElement(u32)
    else
        v79 = false
    end
    if v79 then
        v75[v78 + 1] = v79
    end
    local v80 = #v75
    local v81
    if v57 == u42.CUSTOM_MATCH_PREGAME then
        v81 = u12.createElement(u30, {
            ["AppId"] = "HotbarCustomMatchSection"
        })
    else
        v81 = false
    end
    if v81 then
        v75[v80 + 1] = v81
    end
    local v82 = #v75
    local v83
    if v57 == u42.POST_GAME then
        v83 = u12.createElement(u39, {
            ["HideSpectating"] = true
        })
    else
        v83 = false
    end
    if v83 then
        v75[v82 + 1] = v83
    end
    local v84 = #v75
    local v85
    if v57 == u42.PRE_GAME then
        v85 = u12.createElement(u38)
    else
        v85 = false
    end
    if v85 then
        v75[v84 + 1] = v85
    end
    local v86 = #v75
    if u59 then
        local v87 = u10.entries(u22)
        local function v91(p88) --[[ Line: 264 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u12
                [3] = u31
                [4] = u10
                [5] = u22
                [6] = u5
            --]]
            local _ = p88[1]
            local v89 = p88[2]
            local v90 = u59[v89]
            if v90 then
                return u12.createElement(u31, {
                    ["SizeConstraint"] = "RelativeXY",
                    ["ItemType"] = v90,
                    ["Size"] = UDim2.fromScale(1, 1 / #u10.keys(u22)),
                    ["LayoutOrder"] = v89
                }, { u12.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            else
                return u12.createElement(u5, {
                    ["SizeConstraint"] = "RelativeXY",
                    ["Size"] = UDim2.fromScale(1, 1 / #u10.keys(u22)),
                    ["LayoutOrder"] = v89
                })
            end
        end
        u59 = table.create(#v87)
        for v92, v93 in v87 do
            u59[v92] = v91(v93, v92 - 1, v87)
        end
    end
    local v94 = {
        ["Size"] = UDim2.fromScale(0.07, 1.5),
        ["Position"] = UDim2.fromScale(-0.08, 1),
        ["AnchorPoint"] = Vector2.new(1, 1)
    }
    local v95 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center"
        }) }
    local v96 = #v95
    if u59 then
        for v97, v98 in u59 do
            v95[v96 + v97] = v98
        end
    end
    v75[v86 + 1] = u12.createElement(u5, v94, v95)
    local v99 = u43.store.Inventory.observedInventory.hotbar
    local function v119(u100, u101) --[[ Line: 312 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u40
            [3] = u4
            [4] = u12
            [5] = u37
            [6] = u43
            [7] = u49
            [8] = u2
            [9] = u19
            [10] = u16
            [11] = u26
            [12] = u18
            [13] = u23
            [14] = u8
            [15] = u7
            [16] = u28
        --]]
        local v102 = u69[u101 + 1]
        local v103 = false
        local v104 = nil
        for v105, v106 in u40 do
            local _ = v105 - 1
            if v106 == v102 == true then
                v104 = v106
                break
            end
        end
        local v107 = v104 and true or v103
        local v108 = u101 + 1
        local v109 = tostring(v108)
        if not u4.isHoarceKat() then
            if v107 then
                local v110 = u69[u101 + 1].Value - 48
                v109 = tostring(v110)
            else
                v109 = u69[u101 + 1].Name
            end
        end
        local v111 = u12.createElement
        local v112 = u37
        local v113 = {
            ["HotbarSlot"] = u100,
            ["SlotNumber"] = u101,
            ["Keybind"] = v109,
            ["LayoutOrder"] = u101,
            ["Selected"] = u101 == u43.store.Inventory.observedInventory.hotbarSlot
        }
        local v114
        if u49 == nil then
            v114 = false
        else
            v114 = u101 == u49
        end
        v113.HighlightedSlot = v114
        v113.store = u43.store
        function v113.OnClick() --[[ Line: 343 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u19
                [3] = u100
                [4] = u16
                [5] = u26
                [6] = u18
                [7] = u101
                [8] = u23
                [9] = u8
                [10] = u7
                [11] = u28
            --]]
            local v115 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            if v115:isAppOpen(u19.CHEST_INVENTORY) then
                if u100.item and u100.item.tool then
                    local v116 = u16.LocalPlayer.Character
                    if v116 ~= nil then
                        v116 = v116:FindFirstChild("ObservedChestFolder")
                    end
                    local v117
                    if v116 == nil then
                        v117 = v116
                    else
                        v117 = v116.Value
                    end
                    if v117 then
                        u26.Client:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(v116.Value, u100.item.tool)
                        u18:dispatch({
                            ["type"] = "InventoryRemoveFromHotbar",
                            ["slot"] = u101
                        })
                        return
                    end
                end
            else
                if v115:isAppOpen(u19.INVENTORY) then
                    if u100.item then
                        local v118 = u23(u100.item.itemType)
                        if v118.armor and u18:getState().Inventory.observedInventory.inventory.armor[v118.armor.slot + 1] == "empty" then
                            u18:dispatch({
                                ["type"] = "InventorySetArmorItem",
                                ["item"] = u100.item,
                                ["armorSlot"] = v118.armor.slot
                            })
                            u8:playSound(u7.fromList(u28.ARMOR_EQUIP))
                            return nil
                        end
                        if v118.backpack and u18:getState().Inventory.observedInventory.inventory.backpack == nil then
                            u18:dispatch({
                                ["type"] = "InventorySetBackpack",
                                ["item"] = u100.item
                            })
                            u8:playSound(u7.fromList(u28.ARMOR_EQUIP))
                            return nil
                        end
                    end
                    u18:dispatch({
                        ["type"] = "InventoryRemoveFromHotbar",
                        ["slot"] = u101
                    })
                    return
                end
                u18:dispatch({
                    ["type"] = "InventorySelectHotbarSlot",
                    ["slot"] = u101
                })
            end
        end
        return v111(v112, v113)
    end
    local v120 = table.create(#v99)
    for v121, v122 in v99 do
        v120[v121] = v119(v122, v121 - 1, v99)
    end
    local v123 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 1)
    }
    local v124
    if v57 == u42.SPECTATOR then
        v124 = false
    else
        v124 = v57 ~= u42.POST_GAME
    end
    v123.Visible = v124
    local v125 = {
        ["ItemsHotbarListLayout"] = u12.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center"
        })
    }
    local v126 = #v125
    for v127, v128 in v120 do
        v125[v126 + v127] = v128
    end
    local v129 = #v125
    local v130 = not u4.isHoarceKat()
    if v130 then
        v130 = u12.createElement(u34, {
            ["LayoutOrder"] = 20,
            ["store"] = u43.store
        })
    end
    if v130 then
        v125[v129 + 1] = v130
    end
    v75.ItemsHotbar = u12.createElement("Frame", v123, v125)
    v75[v86 + 2] = u12.createElement(u33, {
        ["store"] = u43.store
    })
    if v47 then
        if v57 == u42.SPECTATOR or v57 == u42.POST_GAME then
            v47 = false
        else
            v47 = u12.createElement(u35, {
                ["ObservedInventory"] = u43.store.Inventory.observedInventory
            })
        end
    end
    if v47 then
        v75[v86 + 3] = v47
    end
    local v131 = #v75
    if v70 then
        v70 = u12.createElement(u36, {
            ["EventType"] = u20.getActiveTeamEvents()[1]
        })
    end
    if v70 then
        v75[v131 + 1] = v70
    end
    local v132 = #v75
    local v133 = #u17:GetConnectedGamepads() ~= 0
    if v133 then
        v133 = u12.createElement(u5, {
            ["Size"] = UDim2.fromScale(1, 1)
        }, { u12.createElement(u6, {
                ["AbilitySectionType"] = "Secondary",
                ["Position"] = UDim2.new(-0.4, 0, -1, 0)
            }), u12.createElement(u6, {
                ["AbilitySectionType"] = "Primary",
                ["Position"] = UDim2.new(1.2, 0, -1, 0)
            }) })
    end
    if v133 then
        v75[v132 + 1] = v133
    end
    v72[v73 + 1] = u12.createElement("Frame", v74, v75)
    return u12.createElement("ScreenGui", v71, v72)
end
local v135 = v13.new(u12)(v134)
return {
    ["HotbarApp"] = v14.connect(function(p136, p137) --[[ Line: 475 ]]
        local v138 = {}
        for v139, v140 in p137 do
            v138[v139] = v140
        end
        v138.store = p136
        v138.QueueType = p136.Game.queueType
        return v138
    end)(v135)
}