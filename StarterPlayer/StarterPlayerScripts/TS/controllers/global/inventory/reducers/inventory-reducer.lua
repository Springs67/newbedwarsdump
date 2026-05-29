local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local v6 = v5.Players
local u7 = v5.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedWarsArmor
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-bows").BedwarsBows
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").BedwarsMelees
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-pickaxes").BedwarsPickaxes
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v18
if v6.LocalPlayer then
    v18 = v14.getInventory(v6.LocalPlayer)
else
    v18 = {
        ["hand"] = nil,
        ["backpack"] = nil,
        ["items"] = {},
        ["armor"] = { "empty", "empty", "empty" }
    }
end
local u19 = {
    ["taxState"] = 0,
    ["observedPlayer"] = v6.LocalPlayer
}
local v20 = {
    ["hotbarSlot"] = 0,
    ["hotbar"] = {
        {
            ["item"] = nil
        },
        {
            ["item"] = nil
        },
        {
            ["item"] = nil
        },
        {
            ["item"] = nil
        },
        {
            ["item"] = nil
        },
        {
            ["item"] = nil
        },
        {
            ["item"] = nil
        },
        {
            ["item"] = nil
        },
        {
            ["item"] = nil
        }
    },
    ["inventory"] = v18,
    ["observedChest"] = {
        ["items"] = {}
    }
}
u19.observedInventory = v20
local function u24() --[[ Line: 54 ]]
    local v21 = false
    local v22 = 0
    local v23 = {}
    while true do
        if v21 then
            v22 = v22 + 1
        else
            v21 = true
        end
        if v22 >= 20 then
            return v23
        end
        table.insert(v23, "empty")
    end
end
local u25 = u7:GetServerTimeNow()
return {
    ["InventoryReducer"] = function(p26, u27) --[[ Name: InventoryReducer, Line 81 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u15
            [3] = u7
            [4] = u25
            [5] = u4
            [6] = u3
            [7] = u17
            [8] = u9
            [9] = u11
            [10] = u10
            [11] = u12
            [12] = u8
            [13] = u24
            [14] = u16
            [15] = u13
        --]]
        if p26 == nil then
            p26 = u19
        end
        if u27.type == "InventoryFullUpdate" then
            local v28 = {}
            for v29, v30 in p26 do
                v28[v29] = v30
            end
            local v31 = {}
            for v32, v33 in p26.observedInventory do
                v31[v32] = v33
            end
            v31.inventory = u27.inventory
            v28.observedInventory = v31
            return v28
        end
        if u27.type == "InventorySetItemAmount" then
            local v34 = nil
            local v35 = p26.observedInventory.inventory.items
            local v36 = table.create(#v35)
            local v37 = v34
            for v38, v43 in v35 do
                local _ = v38 - 1
                if v43.itemType == u27.tool.Name then
                    local v40 = {}
                    for v41, v42 in v43 do
                        v40[v41] = v42
                    end
                    v40.amount = u27.amount
                    v34 = v40
                    local v43 = v34
                    v37 = v34
                end
                v36[v38] = v43
            end
            local v44 = {}
            for v45, v46 in p26 do
                v44[v45] = v46
            end
            local v47 = {}
            for v48, v49 in p26.observedInventory do
                v47[v48] = v49
            end
            local v50 = {}
            for v51, v52 in p26.observedInventory.inventory do
                v50[v51] = v52
            end
            v50.items = v36
            v47.inventory = v50
            local v53 = p26.observedInventory.hotbar
            local v54 = table.create(#v53)
            for v55, v59 in v53 do
                local _ = v55 - 1
                local v57 = v59.item
                if v57 ~= nil then
                    v57 = v57.tool
                end
                local v58 = v57 == u27.tool
                if v58 then
                    v58 = v37
                end
                if v58 then
                    local v59 = {}
                    for v60, v61 in v59 do
                        v59[v60] = v61
                    end
                    v59.item = v37
                end
                v54[v55] = v59
            end
            v47.hotbar = v54
            v44.observedInventory = v47
            return v44
        end
        if u27.type == "InventoryAddItem" then
            local v62 = u15(u27.tool.Name)
            local v63 = nil
            for v64, v65 in p26.observedInventory.inventory.items do
                local _ = v64 - 1
                if v65.tool == u27.tool == true then
                    v63 = v65
                    break
                end
            end
            if v63 then
                return p26
            end
            local v66 = {
                ["tool"] = u27.tool,
                ["itemType"] = u27.tool.Name,
                ["itemSkin"] = u27.tool:GetAttribute("ItemSkin"),
                ["amount"] = u27.tool:GetAttribute("Amount"),
                ["addedToBackpackTime"] = u7:GetServerTimeNow()
            }
            local v67 = p26.observedInventory.inventory.items
            local v68 = false
            local v69 = false
            local v70 = p26.observedInventory.inventory.armor
            local v71 = p26.observedInventory.inventory.backpack
            if v62.armor then
                local v72 = p26.observedInventory.inventory.armor[v62.armor.slot + 1]
                if v72 == "empty" then
                    local v73 = {}
                    local v74 = #v73
                    table.move(v70, 1, #v70, v74 + 1, v73)
                    v73[v62.armor.slot + 1] = v66
                    v69 = true
                    if u7:GetServerTimeNow() - u25 > 0.3 then
                        task.spawn(function() --[[ Line: 76 ]]
                            --[[
                            Upvalues:
                                [1] = u4
                                [2] = u3
                                [3] = u17
                            --]]
                            u4:playSound(u3.fromList(u17.ARMOR_EQUIP))
                        end)
                        v70 = v73
                    else
                        v70 = v73
                    end
                else
                    local v75 = -1
                    for v76, v77 in u9 do
                        local _ = v76 - 1
                        local v78 = v72.itemType
                        if table.find(v77, v78) ~= nil == true then
                            v75 = v76 - 1
                            break
                        end
                    end
                    local v79 = -1
                    for v80, v81 in u9 do
                        local _ = v80 - 1
                        local v82 = u27.tool.Name
                        if table.find(v81, v82) ~= nil == true then
                            v79 = v80 - 1
                            break
                        end
                    end
                    if v75 < v79 then
                        local v83 = {}
                        local v84 = #v83
                        table.move(v70, 1, #v70, v84 + 1, v83)
                        v70 = v83
                        v70[v62.armor.slot + 1] = v66
                        v69 = true
                        v67 = {}
                        local v85 = #v67
                        local v86 = p26.observedInventory.inventory.items
                        local v87 = #v86
                        table.move(v86, 1, v87, v85 + 1, v67)
                        v67[v85 + v87 + 1] = v72
                        if u7:GetServerTimeNow() - u25 > 0.3 then
                            task.spawn(function() --[[ Line: 76 ]]
                                --[[
                                Upvalues:
                                    [1] = u4
                                    [2] = u3
                                    [3] = u17
                                --]]
                                u4:playSound(u3.fromList(u17.ARMOR_EQUIP))
                            end)
                        end
                    else
                        v68 = true
                    end
                end
            end
            if v62.backpack then
                local v88 = p26.observedInventory.inventory.backpack
                v69 = true
                if v88 then
                    v67 = {}
                    local v89 = #v67
                    local v90 = p26.observedInventory.inventory.items
                    local v91 = #v90
                    table.move(v90, 1, v91, v89 + 1, v67)
                    v67[v89 + v91 + 1] = v88
                end
                if u7:GetServerTimeNow() - u25 > 0.3 then
                    task.spawn(function() --[[ Line: 76 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u3
                            [3] = u17
                        --]]
                        u4:playSound(u3.fromList(u17.ARMOR_EQUIP))
                    end)
                end
            end
            local v92 = p26.observedInventory.hotbar
            local v93 = p26.observedInventory.inventory.hand
            local v94
            if v69 then
                v94 = v92
            else
                v67 = {}
                local v95 = #v67
                local v96 = p26.observedInventory.inventory.items
                local v97 = #v96
                table.move(v96, 1, v97, v95 + 1, v67)
                v67[v95 + v97 + 1] = v66
                local v98 = -1
                local v99
                if v62.hotbarFillRight then
                    v99 = #v92 - 1
                    local v100 = false
                    while true do
                        if v100 then
                            v99 = v99 - 1
                        else
                            v100 = true
                        end
                        if v99 < 0 then
                            v99 = v98
                            break
                        end
                        if v92[v99 + 1].item == nil then
                            break
                        end
                    end
                else
                    v99 = -1
                    for v101, v102 in p26.observedInventory.hotbar do
                        local _ = v101 - 1
                        if v102.item == nil == true then
                            v99 = v101 - 1
                            break
                        end
                    end
                end
                local v103 = false
                local v104
                if v62.sword then
                    local v105 = -1
                    for v106, v107 in v92 do
                        local _ = v106 - 1
                        local v108
                        if v107.item then
                            v108 = u15(v107.item.itemType).sword ~= nil
                        else
                            v108 = false
                        end
                        if v108 == true then
                            v105 = v106 - 1
                            break
                        end
                    end
                    local v109 = v92[v105 + 1]
                    if v109 ~= nil then
                        v109 = v109.item
                        if v109 ~= nil then
                            v109 = v109.itemType
                        end
                    end
                    if v109 then
                        local v110 = (table.find(u11, v109) or 0) - 1
                        local v111 = u27.tool.Name
                        local v112 = (table.find(u11, v111) or 0) - 1
                        if v110 < v112 then
                            v104 = v105
                            v92 = table.create(#v92)
                            for v113, v114 in v92 do
                                v92[v113] = v113 - 1 == v104 and {
                                    ["item"] = v66
                                } or v114
                            end
                            v103 = true
                        elseif v112 >= 0 and v110 >= 0 then
                            v68 = true
                        end
                    end
                else
                    local v115 = u27.tool.Name
                    if table.find(u10, v115) == nil then
                        local v116 = u27.tool.Name
                        if table.find(u12, v116) == nil then
                            if v62.replaces then
                                local v117 = -1
                                for v118, v119 in v92 do
                                    local _ = v118 - 1
                                    local v120 = v119.item
                                    if v120 then
                                        v120 = v62.replaces
                                        if v120 ~= nil then
                                            local v121 = v119.item.itemType
                                            v120 = table.find(v120, v121) ~= nil
                                        end
                                    end
                                    if v120 == true then
                                        v117 = v118 - 1
                                        break
                                    end
                                end
                                local v122 = v92[v117 + 1]
                                if v122 ~= nil then
                                    v122 = v122.item
                                    if v122 ~= nil then
                                        v122 = v122.itemType
                                    end
                                end
                                if v122 then
                                    local v123 = v117
                                    local v124 = table.create(#v92)
                                    v104 = v123
                                    v92 = v124
                                    for v125, v126 in v92 do
                                        v92[v125] = v125 - 1 == v104 and {
                                            ["item"] = v66
                                        } or v126
                                        v124 = v92
                                        v92 = v124
                                    end
                                    v103 = true
                                end
                            end
                        else
                            local v127 = -1
                            for v128, v129 in v92 do
                                local _ = v128 - 1
                                local v130 = v129.item
                                if v130 then
                                    local v131 = v129.item.itemType
                                    v130 = table.find(u12, v131) ~= nil
                                end
                                if v130 == true then
                                    v127 = v128 - 1
                                    break
                                end
                            end
                            local v132 = v92[v127 + 1]
                            if v132 ~= nil then
                                v132 = v132.item
                                if v132 ~= nil then
                                    v132 = v132.itemType
                                end
                            end
                            if v132 then
                                local v133 = (table.find(u12, v132) or 0) - 1
                                local v134 = u27.tool.Name
                                if v133 < (table.find(u12, v134) or 0) - 1 then
                                    local v135 = v127
                                    local v136 = table.create(#v92)
                                    v104 = v135
                                    v92 = v136
                                    for v137, v138 in v92 do
                                        v92[v137] = v137 - 1 == v104 and {
                                            ["item"] = v66
                                        } or v138
                                        v136 = v92
                                        v92 = v136
                                    end
                                    v103 = true
                                end
                            end
                        end
                    else
                        local v139 = -1
                        for v140, v141 in v92 do
                            local _ = v140 - 1
                            local v142 = v141.item
                            if v142 then
                                local v143 = v141.item.itemType
                                v142 = table.find(u10, v143) ~= nil
                            end
                            if v142 == true then
                                v139 = v140 - 1
                                break
                            end
                        end
                        local v144 = v92[v139 + 1]
                        if v144 ~= nil then
                            v144 = v144.item
                            if v144 ~= nil then
                                v144 = v144.itemType
                            end
                        end
                        if v144 then
                            local v145 = (table.find(u10, v144) or 0) - 1
                            local v146 = u27.tool.Name
                            if v145 < (table.find(u10, v146) or 0) - 1 then
                                local v147 = v139
                                local v148 = table.create(#v92)
                                v104 = v147
                                v92 = v148
                                for v149, v150 in v92 do
                                    v92[v149] = v149 - 1 == v104 and {
                                        ["item"] = v66
                                    } or v150
                                    v148 = v92
                                    v92 = v148
                                end
                                v103 = true
                            else
                                v68 = true
                            end
                        end
                    end
                end
                if v99 > -1 and not (v103 or v68) then
                    v94 = table.create(#v92)
                    for v151, v152 in v92 do
                        v94[v151] = v151 - 1 == v99 and {
                            ["item"] = v66
                        } or v152
                    end
                else
                    v94 = v92
                end
                if v104 == p26.observedInventory.hotbarSlot then
                    v93 = v94[v104 + 1].item
                end
            end
            if u8.NewHandItem:fire():isCancelled() then
                v93 = nil
            end
            u8.ItemAdded:fire(v66.tool)
            local v153 = {}
            for v154, v155 in p26 do
                v153[v154] = v155
            end
            local v156 = {}
            for v157, v158 in p26.observedInventory do
                v156[v157] = v158
            end
            local v159 = {}
            for v160, v161 in p26.observedInventory.inventory do
                v159[v160] = v161
            end
            v159.items = v67
            v159.hand = v93
            v159.armor = v70
            v159.backpack = v71
            v156.inventory = v159
            v156.hotbar = v94
            v153.observedInventory = v156
            return v153
        end
        if u27.type == "RestoreHotBar" then
            local u162 = u27.savedHotbar
            local u163 = {
                {
                    ["item"] = nil
                },
                {
                    ["item"] = nil
                },
                {
                    ["item"] = nil
                },
                {
                    ["item"] = nil
                },
                {
                    ["item"] = nil
                },
                {
                    ["item"] = nil
                },
                {
                    ["item"] = nil
                },
                {
                    ["item"] = nil
                },
                {
                    ["item"] = nil
                }
            }
            local function v178(p164) --[[ Line: 608 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                local u165 = 0
                local u166 = nil
                local function v173(p167, p168) --[[ Line: 612 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u166
                        [3] = u165
                    --]]
                    if not p167.item then
                        return nil
                    end
                    local v169 = p167.item.itemType
                    if table.find(u11, v169) == nil then
                        return nil
                    end
                    if not u166 then
                        u166 = p167.item
                        u165 = p168
                        return nil
                    end
                    local v170 = u166.itemType
                    local v171 = (table.find(u11, v170) or 0) - 1
                    local v172 = p167.item.itemType
                    if v171 < (table.find(u11, v172) or 0) - 1 then
                        u166 = p167.item
                        u165 = p168
                    end
                end
                local v174 = u166
                local v175 = u165
                for v176, v177 in p164 do
                    v173(v177, v176 - 1, p164)
                end
                if v175 ~= nil and v174 then
                    return {
                        ["slotIndex"] = v175,
                        ["inventoryItem"] = v174
                    }
                end
            end
            local v179 = v178(u162)
            local v180 = v178(p26.observedInventory.hotbar)
            if v179 and v180 then
                u162[v179.slotIndex + 1] = {
                    ["item"] = v180.inventoryItem
                }
            end
            local v181 = p26.observedInventory.hotbar
            local function v193(p182, p183) --[[ Line: 658 ]]
                --[[
                Upvalues:
                    [1] = u162
                --]]
                if not p183.item then
                    return p182
                end
                local v184 = -1
                for v185, v186 in u162 do
                    local _ = v185 - 1
                    local v187 = v186.item
                    if v187 ~= nil then
                        v187 = v187.itemType
                    end
                    local v188 = p183.item
                    if v188 ~= nil then
                        v188 = v188.itemType
                    end
                    if v187 == v188 == true then
                        v184 = v185 - 1
                        break
                    end
                end
                if v184 >= 0 then
                    local v189 = p182.savedItems
                    local v190 = {
                        ["index"] = v184,
                        ["item"] = p183.item
                    }
                    table.insert(v189, v190)
                    return p182
                else
                    local v191 = p182.extraItems
                    local v192 = p183.item
                    table.insert(v191, v192)
                    return p182
                end
            end
            local v194 = {
                ["savedItems"] = {},
                ["extraItems"] = {}
            }
            for v195 = 1, #v181 do
                v194 = v193(v194, v181[v195], v195 - 1, v181)
            end
            for v196, v197 in v194.savedItems do
                local _ = v196 - 1
                u163[v197.index + 1] = {
                    ["item"] = v197.item
                }
            end
            local v198 = v194.extraItems
            local function v203(p199) --[[ Line: 722 ]]
                --[[
                Upvalues:
                    [1] = u163
                --]]
                local v200 = -1
                for v201, v202 in u163 do
                    local _ = v201 - 1
                    if v202.item == nil == true then
                        v200 = v201 - 1
                        break
                    end
                end
                u163[v200 + 1] = {
                    ["item"] = p199
                }
            end
            for v204, v205 in v198 do
                v203(v205, v204 - 1, v198)
            end
            local v206 = {}
            for v207, v208 in p26 do
                v206[v207] = v208
            end
            local v209 = {}
            for v210, v211 in p26.observedInventory do
                v209[v210] = v211
            end
            local v212 = {}
            for v213, v214 in p26.observedInventory.inventory do
                v212[v213] = v214
            end
            v209.inventory = v212
            v209.hotbar = u163
            v206.observedInventory = v209
            return v206
        end
        if u27.type == "InventoryRemoveItem" then
            local v215 = p26.observedInventory.hotbar
            local v216 = nil
            for v217, v218 in v215 do
                local _ = v217 - 1
                local v219 = v218.item
                if v219 ~= nil then
                    v219 = v219.tool
                end
                if v219 == u27.tool == true then
                    v216 = v218
                    break
                end
            end
            local v220
            if v216 then
                v220 = table.create(#v215)
                for v221, v222 in v215 do
                    local _ = v221 - 1
                    v220[v221] = v222 == v216 and {
                        ["item"] = nil
                    } or v222
                end
            else
                v220 = v215
            end
            local v223 = 0
            local v224 = {}
            for v225, v226 in p26.observedInventory.inventory.items do
                local _ = v225 - 1
                if v226.tool ~= u27.tool == true then
                    v223 = v223 + 1
                    v224[v223] = v226
                end
            end
            local v227 = p26.observedInventory.inventory.armor
            local v228 = -1
            for v229, v230 in v227 do
                local _ = v229 - 1
                local v231
                if v230 == "empty" then
                    v231 = false
                else
                    v231 = v230.tool == u27.tool
                end
                if v231 == true then
                    v228 = v229 - 1
                    break
                end
            end
            local v232
            if v228 > -1 then
                v232 = table.create(#v227)
                for v233, v234 in v227 do
                    v232[v233] = v233 - 1 == v228 and "empty" or v234
                end
            else
                v232 = v227
            end
            local v235 = p26.observedInventory.inventory.backpack
            local v236
            if v235 == nil then
                v236 = v235
            else
                v236 = v235.tool
            end
            if v236 == u27.tool then
                v235 = nil
            end
            local v237 = p26.observedInventory.inventory.hand
            v237 = v237
            if v237 ~= nil then
                local v238 = v237.tool
            end
            if v238 == u27.tool then
                v237 = nil
            end
            if u8.NewHandItem:fire():isCancelled() then
                v237 = nil
            end
            local v239 = {}
            for v240, v241 in p26 do
                v239[v240] = v241
            end
            local v242 = {}
            for v243, v244 in p26.observedInventory do
                v242[v243] = v244
            end
            v242.hotbar = v220
            local v245 = {}
            for v246, v247 in p26.observedInventory.inventory do
                v245[v246] = v247
            end
            v245.items = v224
            v245.hand = v237
            v245.armor = v232
            v245.backpack = v235
            v242.inventory = v245
            v239.observedInventory = v242
            return v239
        end
        if u27.type == "InventoryAddToHotbar" then
            local v248 = p26.observedInventory.hotbar[u27.slot + 1]
            local v249 = p26.observedInventory.hotbar
            local v250 = p26.observedInventory.inventory.hand
            local u251 = p26.observedInventory.inventory.items
            local v252 = v248.item
            local u253 = u7:GetServerTimeNow()
            if v252 then
                local v254 = v249
                v249 = table.create(#v254)
                local function v266(p255, p256) --[[ Line: 900 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u253
                        [3] = u251
                    --]]
                    if p256 ~= u27.slot then
                        return p255
                    end
                    u253 = u27.item.addedToBackpackTime
                    local v257 = u251
                    local v258 = table.create(#v257)
                    for v259, v263 in v257 do
                        local _ = v259 - 1
                        local v261 = v263.tool
                        local v262 = p255.item
                        if v262 ~= nil then
                            v262 = v262.tool
                        end
                        if v261 == v262 then
                            local v263 = {}
                            for v264, v265 in v263 do
                                v263[v264] = v265
                            end
                            v263.addedToBackpackTime = u27.item.addedToBackpackTime
                        end
                        v258[v259] = v263
                    end
                    u251 = v258
                    return {
                        ["item"] = nil
                    }
                end
                for v267, v268 in v254 do
                    v249[v267] = v266(v268, v267 - 1, v254)
                end
                if u27.slot == p26.observedInventory.hotbarSlot then
                    v250 = nil
                end
            end
            local v269 = table.create(#v249)
            for v270, v271 in v249 do
                v269[v270] = v270 - 1 == u27.slot and {
                    ["item"] = u27.item
                } or v271
            end
            if u27.slot == p26.observedInventory.hotbarSlot then
                v250 = v269[u27.slot + 1].item
            end
            if u8.NewHandItem:fire():isCancelled() then
                v250 = nil
            end
            local v272 = {}
            for v273, v274 in p26 do
                v272[v273] = v274
            end
            local v275 = {}
            for v276, v277 in p26.observedInventory do
                v275[v276] = v277
            end
            v275.hotbar = v269
            local v278 = {}
            for v279, v280 in p26.observedInventory.inventory do
                v278[v279] = v280
            end
            v278.items = u251
            v278.hand = v250
            v275.inventory = v278
            v272.observedInventory = v275
            return v272
        end
        if u27.type == "InventorySwapHotbarSlots" then
            local v281 = p26.observedInventory.hotbar
            local u282 = v281[u27.slotIndex1 + 1]
            local u283 = v281[u27.slotIndex2 + 1]
            local v284 = v281
            local v285 = table.create(#v284)
            local function v288(p286, p287) --[[ Line: 993 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u283
                    [3] = u282
                --]]
                return p287 == u27.slotIndex1 and {
                    ["item"] = u283.item
                } or (p287 == u27.slotIndex2 and {
                    ["item"] = u282.item
                } or p286)
            end
            for v289, v290 in v284 do
                v285[v289] = v288(v290, v289 - 1, v284)
            end
            local v291 = p26.observedInventory.inventory.hand
            if u27.slotIndex1 == p26.observedInventory.hotbarSlot then
                v291 = u283.item
            elseif u27.slotIndex2 == p26.observedInventory.hotbarSlot then
                v291 = u282.item
            end
            if u8.NewHandItem:fire():isCancelled() then
                v291 = nil
            end
            local v292 = {}
            for v293, v294 in p26 do
                v292[v293] = v294
            end
            local v295 = {}
            for v296, v297 in p26.observedInventory do
                v295[v296] = v297
            end
            v295.hotbar = v285
            local v298 = {}
            for v299, v300 in p26.observedInventory.inventory do
                v298[v299] = v300
            end
            v298.hand = v291
            v295.inventory = v298
            v292.observedInventory = v295
            return v292
        end
        if u27.type == "InventoryRemoveFromHotbar" then
            local v301 = p26.observedInventory.hotbar[u27.slot + 1].item
            local v302 = p26.observedInventory.hotbar
            local v303 = table.create(#v302)
            for v304, v305 in v302 do
                v303[v304] = v304 - 1 == u27.slot and {
                    ["item"] = nil
                } or v305
            end
            local v306 = p26.observedInventory.inventory.hand
            if u27.slot == p26.observedInventory.hotbarSlot then
                v306 = nil
            end
            local v307 = {}
            local v308 = #v307
            local v309 = p26.observedInventory.inventory.items
            table.move(v309, 1, #v309, v308 + 1, v307)
            local v310 = table.create(#v307)
            for v311, v315 in v307 do
                local _ = v311 - 1
                local v313 = v315.itemType
                if v301 ~= nil then
                    local v314 = v301.itemType
                end
                if v313 == v314 then
                    local v315 = {}
                    for v316, v317 in v315 do
                        v315[v316] = v317
                    end
                    v315.addedToBackpackTime = u7:GetServerTimeNow()
                end
                v310[v311] = v315
            end
            if u8.NewHandItem:fire():isCancelled() then
                v306 = nil
            end
            local v318 = {}
            for v319, v320 in p26 do
                v318[v319] = v320
            end
            local v321 = {}
            for v322, v323 in p26.observedInventory do
                v321[v322] = v323
            end
            v321.hotbar = v303
            local v324 = {}
            for v325, v326 in p26.observedInventory.inventory do
                v324[v325] = v326
            end
            v324.items = v310
            v324.hand = v306
            v321.inventory = v324
            v318.observedInventory = v321
            return v318
        end
        if u27.type == "UnequipItemInHand" then
            local _ = p26.observedInventory.inventory.items
            if u27.equip then
                local v327 = {}
                for v328, v329 in p26 do
                    v327[v328] = v329
                end
                local v330 = {}
                for v331, v332 in p26.observedInventory do
                    v330[v331] = v332
                end
                local v333 = {}
                for v334, v335 in p26.observedInventory.inventory do
                    v333[v334] = v335
                end
                v333.hand = p26.observedInventory.hotbar[p26.observedInventory.hotbarSlot + 1].item
                v330.inventory = v333
                v327.observedInventory = v330
                return v327
            else
                local v336 = {}
                for v337, v338 in p26 do
                    v336[v337] = v338
                end
                local v339 = {}
                for v340, v341 in p26.observedInventory do
                    v339[v340] = v341
                end
                local v342 = {}
                for v343, v344 in p26.observedInventory.inventory do
                    v342[v343] = v344
                end
                v342.hand = nil
                v339.inventory = v342
                v336.observedInventory = v339
                return v336
            end
        end
        if u27.type == "InventorySetArmorItem" then
            local v345 = p26.observedInventory.inventory.items
            local v346 = p26.observedInventory.inventory.armor[u27.armorSlot + 1]
            local v347
            if v346 == "empty" then
                v347 = v345
            else
                v347 = {}
                local v348 = #v347
                local v349 = #v345
                table.move(v345, 1, v349, v348 + 1, v347)
                local v350 = v348 + v349
                local v351 = {}
                for v352, v353 in v346 do
                    v351[v352] = v353
                end
                v351.addedToBackpackTime = u7:GetServerTimeNow()
                v347[v350 + 1] = v351
            end
            local v354 = p26.observedInventory.hotbar
            local v355 = p26.observedInventory.inventory.hand
            local v356
            if u27.item == nil then
                v356 = v354
            else
                local v357 = 0
                v347 = {}
                for v358, v359 in v347 do
                    local _ = v358 - 1
                    if v359 ~= u27.item == true then
                        v357 = v357 + 1
                        v347[v357] = v359
                    end
                end
                v356 = table.create(#v354)
                for v360, v361 in v354 do
                    local _ = v360 - 1
                    v356[v360] = v361.item == u27.item and {
                        ["item"] = nil
                    } or v361
                end
                local v362 = p26.observedInventory.inventory.hand
                if v362 ~= nil then
                    v362 = v362.tool
                end
                if v362 == u27.item.tool then
                    v355 = nil
                end
            end
            local v363 = {}
            local v364 = #v363
            local v365 = p26.observedInventory.inventory.armor
            table.move(v365, 1, #v365, v364 + 1, v363)
            v363[u27.armorSlot + 1] = u27.item or "empty"
            local v366 = {}
            for v367, v368 in p26 do
                v366[v367] = v368
            end
            local v369 = {}
            for v370, v371 in p26.observedInventory do
                v369[v370] = v371
            end
            v369.hotbar = v356
            local v372 = {}
            for v373, v374 in p26.observedInventory.inventory do
                v372[v373] = v374
            end
            v372.items = v347
            v372.armor = v363
            v372.hand = v355
            v369.inventory = v372
            v366.observedInventory = v369
            return v366
        end
        if u27.type == "InventorySetBackpack" then
            local v375 = p26.observedInventory.inventory.items
            local v376 = p26.observedInventory.inventory.backpack
            local v377
            if v376 then
                v377 = {}
                local v378 = #v377
                local v379 = #v375
                table.move(v375, 1, v379, v378 + 1, v377)
                local v380 = v378 + v379
                local v381 = {}
                for v382, v383 in v376 do
                    v381[v382] = v383
                end
                v381.addedToBackpackTime = u7:GetServerTimeNow()
                v377[v380 + 1] = v381
            else
                v377 = v375
            end
            local v384 = p26.observedInventory.hotbar
            local v385 = p26.observedInventory.inventory.hand
            local v386
            if u27.item == nil then
                v386 = v384
            else
                local v387 = 0
                v377 = {}
                for v388, v389 in v377 do
                    local _ = v388 - 1
                    if v389 ~= u27.item == true then
                        v387 = v387 + 1
                        v377[v387] = v389
                    end
                end
                v386 = table.create(#v384)
                for v390, v391 in v384 do
                    local _ = v390 - 1
                    v386[v390] = v391.item == u27.item and {
                        ["item"] = nil
                    } or v391
                end
                local v392 = p26.observedInventory.inventory.hand
                if v392 ~= nil then
                    v392 = v392.tool
                end
                if v392 == u27.item.tool then
                    v385 = nil
                end
            end
            local v393 = u27.item
            local v394 = {}
            for v395, v396 in p26 do
                v394[v395] = v396
            end
            local v397 = {}
            for v398, v399 in p26.observedInventory do
                v397[v398] = v399
            end
            v397.hotbar = v386
            local v400 = {}
            for v401, v402 in p26.observedInventory.inventory do
                v400[v401] = v402
            end
            v400.items = v377
            v400.backpack = v393
            v400.hand = v385
            v397.inventory = v400
            v394.observedInventory = v397
            return v394
        end
        if u27.type == "ChestAddItem" then
            local v403 = p26.observedInventory.observedChest or {
                ["items"] = {}
            }
            local v404 = u27.itemInstance == "empty" and "empty" or {
                ["tool"] = u27.itemInstance,
                ["itemType"] = u27.itemInstance.Name,
                ["amount"] = u27.itemInstance:GetAttribute("Amount"),
                ["addedToBackpackTime"] = u7:GetServerTimeNow(),
                ["itemSkin"] = u27.itemInstance:GetAttribute("ItemSkin")
            }
            local v405 = {}
            local v406 = #v405
            local v407 = v403.items
            table.move(v407, 1, #v407, v406 + 1, v405)
            local v408 = v405
            local v409 = false
            if u27.itemInstance ~= "empty" then
                local v410 = u27.itemInstance:GetAttribute("ChestSlot")
                if v410 ~= nil and v408[v410 + 1] == "empty" then
                    v408[v410 + 1] = v404
                    v409 = true
                end
            end
            if not v409 then
                local v411 = false
                local v412 = v408
                v408 = table.create(#v412)
                local v413 = v411
                for v414, v416 in v412 do
                    local _ = v414 - 1
                    if not v413 and v416 == "empty" then
                        v411 = true
                        v413 = v411
                        local v416 = v404
                    end
                    v408[v414] = v416
                end
                if not v413 then
                    table.insert(v408, v404)
                end
            end
            local v417 = {}
            for v418, v419 in p26 do
                v417[v418] = v419
            end
            local v420 = {}
            for v421, v422 in p26.observedInventory do
                v420[v421] = v422
            end
            local v423 = {}
            for v424, v425 in p26.observedInventory.observedChest do
                v423[v424] = v425
            end
            v423.items = v408
            v420.observedChest = v423
            v417.observedInventory = v420
            return v417
        end
        if u27.type == "ChestRemoveItem" then
            local v426 = p26.observedInventory.observedChest or {
                ["items"] = {}
            }
            local v427 = {}
            for v428, v429 in p26 do
                v427[v428] = v429
            end
            local v430 = {}
            for v431, v432 in p26.observedInventory do
                v430[v431] = v432
            end
            local v433 = {}
            for v434, v435 in p26.observedInventory.observedChest do
                v433[v434] = v435
            end
            local v436 = {}
            local v437 = #v436
            local v438 = v426.items
            local v439 = table.create(#v438)
            for v440, v441 in v438 do
                local _ = v440 - 1
                v439[v440] = v441 ~= "empty" and v441.tool == u27.itemInstance and "empty" or v441
            end
            table.move(v439, 1, #v439, v437 + 1, v436)
            v433.items = v436
            v430.observedChest = v433
            v427.observedInventory = v430
            return v427
        end
        if u27.type == "ChestItemSetAmount" then
            local v442 = p26.observedInventory.observedChest or {
                ["items"] = {}
            }
            local v443 = {}
            for v444, v445 in p26 do
                v443[v444] = v445
            end
            local v446 = {}
            for v447, v448 in p26.observedInventory do
                v446[v447] = v448
            end
            local v449 = {}
            for v450, v451 in p26.observedInventory.observedChest do
                v449[v450] = v451
            end
            local v452 = v442.items
            local v453 = table.create(#v452)
            for v454, v456 in v452 do
                local _ = v454 - 1
                if v456 ~= "empty" and v456.tool == u27.itemInstance then
                    local v456 = {}
                    for v457, v458 in v456 do
                        v456[v457] = v458
                    end
                    v456.amount = u27.amount
                end
                v453[v454] = v456
            end
            v449.items = v453
            v446.observedChest = v449
            v443.observedInventory = v446
            return v443
        end
        if u27.type == "ChestClear" then
            local v459 = {}
            for v460, v461 in p26 do
                v459[v460] = v461
            end
            local v462 = {}
            for v463, v464 in p26.observedInventory do
                v462[v463] = v464
            end
            local v465 = {}
            for v466, v467 in p26.observedInventory.observedChest do
                v465[v466] = v467
            end
            v465.items = u24()
            v462.observedChest = v465
            v459.observedInventory = v462
            return v459
        end
        if u27.type ~= "InventorySelectHotbarItemGroup" then
            local v468 = u27.type
            if v468 == "SetObservedPlayer" then
                local v469 = {}
                for v470, v471 in p26 do
                    v469[v470] = v471
                end
                v469.observedPlayer = u27.observedPlayer
                return v469
            end
            if v468 ~= "InventorySelectHotbarSlot" then
                if v468 ~= "IncrementTaxState" then
                    return p26
                end
                local v472 = {}
                for v473, v474 in p26 do
                    v472[v473] = v474
                end
                v472.taxState = p26.taxState + 1
                return v472
            end
            local v475 = p26.observedInventory.hotbar[u27.slot + 1].item
            if u8.NewHandItem:fire():isCancelled() then
                v475 = nil
            end
            local v476 = {}
            for v477, v478 in p26 do
                v476[v477] = v478
            end
            local v479 = {}
            for v480, v481 in p26.observedInventory do
                v479[v480] = v481
            end
            v479.hotbarSlot = u27.slot
            local v482 = {}
            for v483, v484 in p26.observedInventory.inventory do
                v482[v483] = v484
            end
            v482.hand = v475
            v479.inventory = v482
            v476.observedInventory = v479
            return v476
        end
        local v485 = false
        local v486 = 0
        local v487 = -1
        local v488 = (1 / 0)
        while true do
            if true then
                if v485 then
                    v486 = v486 + 1
                else
                    v485 = true
                end
            end
            if v486 >= #p26.observedInventory.hotbar then
                v486 = v487
                break
            end
            local v489 = p26.observedInventory.hotbar[v486 + 1]
            local v490
            if v489.item then
                local v491 = u15(v489.item.itemType)
                if u27.itemGroup == "sword" and (v491.sword or v491.actsAsSwordGroup) then
                    break
                end
                if u27.itemGroup == "block" and (v491.block and v491.block.greedyMesh) then
                    local v492
                    if v491.block.wool then
                        v492 = u16.WOOL_WHITE
                    else
                        v492 = v489.item.itemType
                    end
                    local v493 = u13.getShopItem(v492, nil)
                    v493 = v493
                    local v494
                    if v493 == nil then
                        v494 = v493
                    else
                        v494 = v493.currency
                    end
                    if v494 == u16.IRON then
                        v490 = v493.price / v493.amount
                        if v488 < v490 then
                            v490 = v488
                        else
                            v487 = v486
                        end
                    else
                        v490 = v488
                    end
                else
                    v490 = v488
                end
            else
                v490 = v488
            end
            v488 = v490
        end
        local v495 = p26.observedInventory.hotbar[v486 + 1].item
        if u8.NewHandItem:fire():isCancelled() then
            v495 = nil
        end
        if v486 == -1 then
            return p26
        end
        local v496 = {}
        for v497, v498 in p26 do
            v496[v497] = v498
        end
        local v499 = {}
        for v500, v501 in p26.observedInventory do
            v499[v500] = v501
        end
        v499.hotbarSlot = v486
        local v502 = {}
        for v503, v504 in p26.observedInventory.inventory do
            v502[v503] = v504
        end
        v502.hand = v495
        v499.inventory = v502
        v496.observedInventory = v499
        return v496
    end,
    ["InitialInventoryState"] = u19
}