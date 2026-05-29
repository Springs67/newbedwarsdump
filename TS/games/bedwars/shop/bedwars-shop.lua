local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ComponentUtil
local u4 = v2.DeviceUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitServer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.RunService
local u11 = v9.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component").default
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "summer-2025", "summer-2025-constants").Summer2025Constants
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta")
local u15 = v14.getQueueMeta
local u16 = v14.QueueMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util").WeaponType
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-constants").SpiritSummonerBalance
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-filter").applyBedwarsShopFilters
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-override").getBedwarsShopOverrides
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local v28 = {
    v23.BARBARIAN,
    v23.DASHER,
    v23.FROSTY_HAMMER,
    v23.TINKER,
    v23.SUMMONER,
    v23.VOID_KNIGHT,
    v23.GUN_BLADE
}
local v29 = {}
local v30 = #v29
local v31 = #v28
table.move(v28, 1, v31, v30 + 1, v29)
local v32 = v30 + v31
v29[v32 + 1] = v23.ICE_QUEEN
v29[v32 + 2] = v23.EMBER
v29[v32 + 3] = v23.LUMEN
local v33 = { v23.BIGMAN, v23.TINKER, v23.VOID_KNIGHT }
local v34 = { v23.WIZARD }
local v35 = #v34
table.move(v29, 1, #v29, v35 + 1, v34)
local v36 = {}
local u37 = nil
local function u57(p38, p39, p40) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u12
        [3] = u37
        [4] = u8
        [5] = u26
    --]]
    local v41 = nil
    for v42, v43 in u3:getAllComponents(u12) do
        local _ = v42 - 1
        local v44 = v43.attributes.Id
        local v45
        if p40 == nil then
            v45 = p40
        else
            v45 = p40.shopId
        end
        if v44 == v45 == true then
            v41 = v43
            break
        end
    end
    local v46 = {}
    local v47
    if v41 == nil then
        v47 = v41
    else
        v47 = v41:getShopItems()
    end
    if v47 == nil then
        v47 = u37
    end
    for v48, v49 in v47 do
        local _ = v48 - 1
        v46[v49.itemType] = v49
    end
    local v50 = v46[p38]
    if v50 then
        v50 = u8.deepCopy(v50)
    end
    local v51
    if p39 then
        if v41 ~= nil then
            v41 = v41.attributes.DisableShopOverrides
        end
        v51 = not v41
    else
        v51 = p39
    end
    if v51 then
        for _, v52 in u26() do
            if v52:shouldApply(p39) then
                local v53 = nil
                for v54, v55 in v52:getOverride(p39, v46) do
                    local _ = v54 - 1
                    if v55.itemType == p38 == true then
                        v53 = v55
                        break
                    end
                end
                if v53 then
                    if v50 and not v53.fullObjectOverride then
                        for _, v56 in u8.keys(v53) do
                            if v56 ~= "fullObjectOverride" then
                                v50[v56] = v53[v56]
                            end
                        end
                    else
                        v50 = u8.deepCopy(v53)
                    end
                end
            end
        end
    end
    return v50
end
v36.getShopItemBase = u57
local u58 = nil
local function u65(p59, p60, p61) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u57
        [2] = u58
        [3] = u8
    --]]
    local v62 = {}
    if p61 ~= nil then
        p61 = p61.shopId
    end
    v62.shopId = p61
    local v63 = u57(p59, p60, v62)
    if v63 and p60 then
        local v64 = u58(v63, p60)
        if v64 ~= v63.price then
            v63 = u8.deepCopy(v63)
            v63.price = v64
        end
    end
    return v63
end
v36.getShopItem = u65
function v36.getShop(u66, u67, p68, p69) --[[ Line: 165 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u12
        [3] = u8
        [4] = u37
        [5] = u26
        [6] = u25
        [7] = u58
        [8] = u11
        [9] = u16
        [10] = u4
        [11] = u10
        [12] = u7
        [13] = u6
        [14] = u65
    --]]
    local v70 = nil
    for v71, v72 in u3:getAllComponents(u12) do
        local _ = v71 - 1
        if v72.attributes.Id == u67 == true then
            v70 = v72
            break
        end
    end
    if p69 == nil then
        if v70 == nil then
            p69 = v70
        else
            p69 = v70:getShopItems()
        end
    end
    local v73
    if p69 then
        v73 = u8.deepCopy(p69)
    else
        v73 = u8.deepCopy(u37)
    end
    local v74
    if u66 then
        if v70 ~= nil then
            v70 = v70.attributes.DisableShopOverrides
        end
        v74 = not v70
    else
        v74 = u66
    end
    if v74 then
        local v75 = {}
        for _, v76 in v73 do
            v75[v76.itemType] = v76
        end
        for _, v77 in u26() do
            if v77:shouldApply(u66) then
                for _, v78 in v77:getOverride(u66, v75) do
                    local v79 = nil
                    for v80, v81 in v73 do
                        local _ = v80 - 1
                        if v81.itemType == v78.itemType == true then
                            v79 = v81
                            break
                        end
                    end
                    if v79 and not v78.fullObjectOverride then
                        for _, v82 in u8.keys(v78) do
                            if v82 ~= "fullObjectOverride" then
                                v79[v82] = v78[v82]
                            end
                        end
                    else
                        local v83 = -1
                        for v84, v85 in v73 do
                            local _ = v84 - 1
                            if v85.itemType == v78.itemType == true then
                                v83 = v84 - 1
                                break
                            end
                        end
                        if v83 == -1 then
                            local v86 = u8.deepCopy(v78)
                            table.insert(v73, v86)
                        else
                            v73[v83 + 1] = u8.deepCopy(v78)
                        end
                    end
                    if v78.replaceItem then
                        local v87 = nil
                        for v88, v89 in v73 do
                            local _ = v88 - 1
                            if v89.itemType == v78.replaceItem == true then
                                v87 = v89
                                break
                            end
                        end
                        if v87 then
                            local v90 = (table.find(v73, v87) or 0) - 1
                            table.remove(v73, v90 + 1)
                        end
                    end
                end
            end
        end
    end
    if v73 ~= nil then
        local v91 = 0
        v73 = {}
        for v92, v93 in v73 do
            local _ = v92 - 1
            if (v93 ~= nil and v93.price ~= nil) == true then
                v91 = v91 + 1
                v73[v91] = v93
            end
        end
    end
    if p68 and (u66 and v73) then
        v73 = u25(u66, v73)
    end
    local v94 = 0
    local v95 = {}
    for v96, v97 in v73 do
        local _ = v96 - 1
        if (v97 ~= nil and v97.price ~= nil) == true then
            v94 = v94 + 1
            v95[v94] = v97
        end
    end
    if u66 then
        for _, v98 in v95 do
            v98.price = u58(v98, u66)
        end
    end
    local u99 = u11:GetAttribute("QueueType")
    local u100
    if u99 then
        local function v103(p101) --[[ Line: 351 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u99
            --]]
            if p101.limitedTimeItem and (u16[u99].rankCategory or u16[u99].disableLimitedTimeItems) then
                return false
            elseif p101.disabled then
                return false
            else
                local v102 = p101.disabledInQueue
                if v102 ~= nil then
                    v102 = table.find(v102, u99) ~= nil
                end
                if v102 then
                    return false
                else
                    return (not p101.enabledOnlyInQueue or table.find(p101.enabledOnlyInQueue, u99) ~= nil) and true or false
                end
            end
        end
        local v104 = 0
        u100 = {}
        for v105, v106 in v95 do
            if v103(v106, v105 - 1, v95) == true then
                v104 = v104 + 1
                u100[v104] = v106
            end
        end
    else
        u100 = v95
    end
    local v107
    if u4.isHoarceKat() then
        v107 = {}
    elseif u10:IsServer() then
        v107 = u7.Services.BedwarsShopService:getRandomlySelectedItems()
    else
        v107 = u6.Controllers.BedwarsShopController:getRandomlySelectedItems()
    end
    local function v114(p108) --[[ Line: 396 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u66
            [3] = u67
            [4] = u100
        --]]
        local v109 = u65(p108, u66, {
            ["shopId"] = u67
        })
        if v109 == nil then
            return nil
        end
        local v110 = nil
        for v111, v112 in u100 do
            local _ = v111 - 1
            if v112.itemType == p108 == true then
                v110 = v112
                break
            end
        end
        if v110 then
            return nil
        end
        local v113 = u100
        table.insert(v113, v109)
    end
    for v115, v116 in v107 do
        v114(v116, v115 - 1, v107)
    end
    return u100
end
function v36.getTeamWoolById(p117) --[[ Line: 427 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    if p117 == "1" then
        return u19.WOOL_BLUE
    elseif p117 == "2" then
        return u19.WOOL_ORANGE
    elseif p117 == "3" then
        return u19.WOOL_PINK
    elseif p117 == "4" then
        return u19.WOOL_YELLOW
    elseif p117 == "5" then
        return u19.WOOL_BROWN
    elseif p117 == "6" then
        return u19.WOOL_WHITE
    elseif p117 == "7" then
        return u19.WOOL_CYAN
    elseif p117 == "8" then
        return u19.WOOL_PURPLE
    else
        return u19.WOOL_WHITE
    end
end
function v36.getTeamWoolByColorHex(p118) --[[ Line: 457 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u19
    --]]
    if p118 == u18.lightBlue then
        return u19.WOOL_BLUE
    elseif p118 == u18.orange then
        return u19.WOOL_ORANGE
    elseif p118 == u18.pink then
        return u19.WOOL_PINK
    elseif p118 == u18.yellow then
        return u19.WOOL_YELLOW
    elseif p118 == u18.brown then
        return u19.WOOL_BROWN
    elseif p118 == u18.white then
        return u19.WOOL_WHITE
    elseif p118 == u18.cyan then
        return u19.WOOL_CYAN
    elseif p118 == u18.purple then
        return u19.WOOL_PURPLE
    elseif p118 == u18.red then
        return u19.WOOL_RED
    elseif p118 == u18.green then
        return u19.WOOL_GREEN
    else
        return u19.WOOL_WHITE
    end
end
v36.Pickaxes = {
    u19.WOOD_PICKAXE,
    u19.STONE_PICKAXE,
    u19.IRON_PICKAXE,
    u19.DIAMOND_PICKAXE
}
v36.Axes = {
    u19.WOOD_AXE,
    u19.STONE_AXE,
    u19.IRON_AXE,
    u19.DIAMOND_AXE
}
u37 = {
    {
        ["amount"] = 16,
        ["price"] = 8,
        ["itemType"] = u19.WOOL_WHITE,
        ["currency"] = u19.IRON,
        ["category"] = v27.Blocks,
        ["disabledInQueue"] = { u17.MINE_WARS }
    },
    {
        ["amount"] = 16,
        ["price"] = 40,
        ["itemType"] = u19.STONE_BRICK,
        ["currency"] = u19.IRON,
        ["category"] = v27.Blocks,
        ["disabledInQueue"] = { u17.MINE_WARS }
    },
    {
        ["amount"] = 8,
        ["price"] = 14,
        ["itemType"] = u19.WOOD_PLANK_OAK,
        ["currency"] = u19.IRON,
        ["category"] = v27.Blocks,
        ["disabledInQueue"] = { u17.MINE_WARS }
    },
    {
        ["amount"] = 4,
        ["price"] = 16,
        ["itemType"] = u19.BLASTPROOF_CERAMIC,
        ["currency"] = u19.IRON,
        ["category"] = v27.Blocks,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.MINE_WARS }
    },
    {
        ["amount"] = 4,
        ["price"] = 1,
        ["itemType"] = u19.OBSIDIAN,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Blocks,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.MINE_WARS }
    },
    {
        ["amount"] = 4,
        ["price"] = 16,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.MAGIC_GLASS,
        ["currency"] = u19.IRON,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS }
    },
    {
        ["amount"] = 1,
        ["price"] = 0,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["ignoreAttribute"] = "DisableSword",
        ["itemType"] = u19.WOOD_SWORD,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v34,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["spawnWithItems"] = { u19.WOOD_SWORD },
        ["superiorItems"] = { u19.STONE_SWORD }
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["ignoreAttribute"] = "DisableSword",
        ["itemType"] = u19.STONE_SWORD,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["nextTier"] = u19.IRON_SWORD,
        ["superiorItems"] = { u19.IRON_SWORD },
        ["spawnWithItems"] = { u19.STONE_SWORD }
    },
    {
        ["amount"] = 1,
        ["price"] = 70,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["ignoreAttribute"] = "DisableSword",
        ["itemType"] = u19.IRON_SWORD,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["superiorItems"] = {
            u19.DIAMOND_SWORD,
            u19.HEAVENLY_SWORD,
            u19.INFERNAL_SABER,
            u19.ICE_SWORD
        },
        ["nextTier"] = u19.DIAMOND_SWORD,
        ["spawnWithItems"] = { u19.IRON_SWORD }
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["ignoreAttribute"] = "DisableSword",
        ["itemType"] = u19.DIAMOND_SWORD,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["superiorItems"] = { u19.EMERALD_SWORD },
        ["nextTier"] = u19.EMERALD_SWORD,
        ["spawnWithItems"] = { u19.IRON_SWORD }
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["ignoreAttribute"] = "DisableSword",
        ["itemType"] = u19.EMERALD_SWORD,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["spawnWithItems"] = { u19.DIAMOND_SWORD }
    },
    {
        ["amount"] = 1,
        ["price"] = 10,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.VOID_SWORD,
        ["currency"] = u19.VOID_CRYSTAL,
        ["ignoredByKit"] = { v23.BARBARIAN, v23.DASHER, v23.GUN_BLADE },
        ["category"] = v27.Void
    },
    {
        ["amount"] = 0,
        ["price"] = 0,
        ["lockAfterPurchase"] = true,
        ["disabled"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.WOOD_GUN_BLADE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.GUN_BLADE },
        ["category"] = v27.Combat,
        ["superiorItems"] = { u19.STONE_GUN_BLADE }
    },
    {
        ["amount"] = 1,
        ["price"] = 28,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.STONE_GUN_BLADE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.GUN_BLADE },
        ["category"] = v27.Combat,
        ["superiorItems"] = { u19.IRON_GUN_BLADE },
        ["nextTier"] = u19.IRON_GUN_BLADE,
        ["spawnWithItems"] = { u19.STONE_GUN_BLADE }
    },
    {
        ["amount"] = 1,
        ["price"] = 85,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.IRON_GUN_BLADE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.GUN_BLADE },
        ["category"] = v27.Combat,
        ["superiorItems"] = { u19.DIAMOND_GUN_BLADE },
        ["nextTier"] = u19.DIAMOND_GUN_BLADE,
        ["spawnWithItems"] = { u19.IRON_GUN_BLADE }
    },
    {
        ["amount"] = 1,
        ["price"] = 5,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.DIAMOND_GUN_BLADE,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.GUN_BLADE },
        ["category"] = v27.Combat,
        ["superiorItems"] = { u19.EMERALD_GUN_BLADE },
        ["nextTier"] = u19.EMERALD_GUN_BLADE,
        ["spawnWithItems"] = { u19.IRON_GUN_BLADE }
    },
    {
        ["amount"] = 1,
        ["price"] = 22,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.EMERALD_GUN_BLADE,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.GUN_BLADE },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.DIAMOND_GUN_BLADE }
    },
    {
        ["amount"] = 1,
        ["price"] = 0,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.WOOD_SCYTHE,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v34,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["spawnWithItems"] = { u19.WOOD_SCYTHE },
        ["superiorItems"] = { u19.STONE_SCYTHE },
        ["requireAttribute"] = v21.SCYTHE
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.STONE_SCYTHE,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["nextTier"] = u19.IRON_SCYTHE,
        ["superiorItems"] = { u19.IRON_SCYTHE },
        ["spawnWithItems"] = { u19.STONE_SCYTHE },
        ["requireAttribute"] = v21.SCYTHE
    },
    {
        ["amount"] = 1,
        ["price"] = 70,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.IRON_SCYTHE,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["superiorItems"] = { u19.DIAMOND_SCYTHE },
        ["nextTier"] = u19.DIAMOND_SCYTHE,
        ["spawnWithItems"] = { u19.IRON_SCYTHE },
        ["requireAttribute"] = v21.SCYTHE
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.DIAMOND_SCYTHE,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["superiorItems"] = { u19.MYTHIC_SCYTHE },
        ["nextTier"] = u19.MYTHIC_SCYTHE,
        ["spawnWithItems"] = { u19.IRON_SCYTHE },
        ["requireAttribute"] = v21.SCYTHE
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.MYTHIC_SCYTHE,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["spawnWithItems"] = { u19.DIAMOND_SWORD },
        ["requireAttribute"] = v21.SCYTHE
    },
    {
        ["amount"] = 1,
        ["price"] = 0,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.WOOD_GREAT_HAMMER,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v34,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["spawnWithItems"] = { u19.WOOD_GREAT_HAMMER },
        ["superiorItems"] = { u19.STONE_GREAT_HAMMER },
        ["requireAttribute"] = v21.GREAT_HAMMER
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.STONE_GREAT_HAMMER,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["nextTier"] = u19.IRON_GREAT_HAMMER,
        ["superiorItems"] = { u19.IRON_GREAT_HAMMER },
        ["spawnWithItems"] = { u19.STONE_GREAT_HAMMER },
        ["requireAttribute"] = v21.GREAT_HAMMER
    },
    {
        ["amount"] = 1,
        ["price"] = 70,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.IRON_GREAT_HAMMER,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["superiorItems"] = { u19.DIAMOND_GREAT_HAMMER },
        ["nextTier"] = u19.DIAMOND_GREAT_HAMMER,
        ["spawnWithItems"] = { u19.IRON_GREAT_HAMMER },
        ["requireAttribute"] = v21.GREAT_HAMMER
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.DIAMOND_GREAT_HAMMER,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["superiorItems"] = { u19.MYTHIC_GREAT_HAMMER },
        ["nextTier"] = u19.MYTHIC_GREAT_HAMMER,
        ["spawnWithItems"] = { u19.IRON_GREAT_HAMMER },
        ["requireAttribute"] = v21.GREAT_HAMMER
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.MYTHIC_GREAT_HAMMER,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["spawnWithItems"] = { u19.DIAMOND_GREAT_HAMMER },
        ["requireAttribute"] = v21.GREAT_HAMMER
    },
    {
        ["amount"] = 1,
        ["price"] = 0,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.WOOD_DAGGER,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v34,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["spawnWithItems"] = { u19.WOOD_DAGGER },
        ["superiorItems"] = { u19.STONE_DAGGER },
        ["requireAttribute"] = v21.DAGGER
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.STONE_DAGGER,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["nextTier"] = u19.IRON_DAGGER,
        ["superiorItems"] = { u19.IRON_DAGGER },
        ["spawnWithItems"] = { u19.STONE_DAGGER },
        ["requireAttribute"] = v21.DAGGER
    },
    {
        ["amount"] = 1,
        ["price"] = 70,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.IRON_DAGGER,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["superiorItems"] = { u19.DIAMOND_DAGGER },
        ["nextTier"] = u19.DIAMOND_DAGGER,
        ["spawnWithItems"] = { u19.IRON_DAGGER },
        ["requireAttribute"] = v21.DAGGER
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.DIAMOND_DAGGER,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["superiorItems"] = { u19.MYTHIC_DAGGER },
        ["nextTier"] = u19.MYTHIC_DAGGER,
        ["spawnWithItems"] = { u19.IRON_DAGGER },
        ["requireAttribute"] = v21.DAGGER
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.MYTHIC_DAGGER,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["spawnWithItems"] = { u19.DIAMOND_DAGGER },
        ["requireAttribute"] = v21.DAGGER
    },
    {
        ["amount"] = 1,
        ["price"] = 0,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.WOOD_GAUNTLETS,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v34,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["spawnWithItems"] = { u19.WOOD_GAUNTLETS },
        ["superiorItems"] = { u19.STONE_GAUNTLETS },
        ["requireAttribute"] = v21.GAUNTLETS
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.STONE_GAUNTLETS,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["nextTier"] = u19.IRON_GAUNTLETS,
        ["superiorItems"] = { u19.IRON_GAUNTLETS },
        ["spawnWithItems"] = { u19.STONE_GAUNTLETS },
        ["requireAttribute"] = v21.GAUNTLETS
    },
    {
        ["amount"] = 1,
        ["price"] = 70,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.IRON_GAUNTLETS,
        ["currency"] = u19.IRON,
        ["ignoredByKit"] = v28,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["superiorItems"] = { u19.DIAMOND_GAUNTLETS },
        ["nextTier"] = u19.DIAMOND_GAUNTLETS,
        ["spawnWithItems"] = { u19.IRON_GAUNTLETS },
        ["requireAttribute"] = v21.GAUNTLETS
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.DIAMOND_GAUNTLETS,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["superiorItems"] = { u19.MYTHIC_GAUNTLETS_PLAIN },
        ["nextTier"] = u19.MYTHIC_GAUNTLETS_PLAIN,
        ["spawnWithItems"] = { u19.IRON_GAUNTLETS },
        ["requireAttribute"] = v21.GAUNTLETS
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.MYTHIC_GAUNTLETS_PLAIN,
        ["currency"] = u19.EMERALD,
        ["ignoredByKit"] = v29,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["spawnWithItems"] = { u19.DIAMOND_GAUNTLETS },
        ["requireAttribute"] = v21.GAUNTLETS
    },
    {
        ["customDisplayName"] = "Leather Armor",
        ["amount"] = 1,
        ["price"] = 50,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.LEATHER_CHESTPLATE,
        ["currency"] = u19.IRON,
        ["spawnWithItems"] = v22.LEATHER,
        ["nextTier"] = u19.IRON_CHESTPLATE,
        ["ignoredByKit"] = v33,
        ["category"] = v27.Combat,
        ["superiorItems"] = { u19.IRON_CHESTPLATE }
    },
    {
        ["customDisplayName"] = "Iron Armor",
        ["amount"] = 1,
        ["price"] = 120,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.IRON_CHESTPLATE,
        ["currency"] = u19.IRON,
        ["spawnWithItems"] = v22.IRON,
        ["category"] = v27.Combat,
        ["prevTier"] = u19.LEATHER_CHESTPLATE,
        ["nextTier"] = u19.DIAMOND_CHESTPLATE,
        ["ignoredByKit"] = v33
    },
    {
        ["customDisplayName"] = "Diamond Armor",
        ["amount"] = 1,
        ["price"] = 8,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.DIAMOND_CHESTPLATE,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = v22.DIAMOND,
        ["category"] = v27.Combat,
        ["prevTier"] = u19.IRON_CHESTPLATE,
        ["nextTier"] = u19.EMERALD_CHESTPLATE,
        ["ignoredByKit"] = v33
    },
    {
        ["customDisplayName"] = "Emerald Armor",
        ["amount"] = 1,
        ["price"] = 40,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.EMERALD_CHESTPLATE,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = v22.EMERALD,
        ["prevTier"] = u19.DIAMOND_CHESTPLATE,
        ["ignoredByKit"] = v33,
        ["category"] = v27.Combat
    },
    {
        ["customDisplayName"] = "Void Armor",
        ["amount"] = 1,
        ["price"] = 18,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.VOID_CHESTPLATE,
        ["currency"] = u19.VOID_CRYSTAL,
        ["spawnWithItems"] = v22.VOID,
        ["category"] = v27.Void,
        ["nextTier"] = u19.EMERALD_CHESTPLATE,
        ["ignoredByKit"] = v33
    },
    {
        ["customDisplayName"] = "Void Turret",
        ["amount"] = 1,
        ["price"] = 3,
        ["itemType"] = u19.VOID_TURRET,
        ["currency"] = u19.VOID_CRYSTAL,
        ["category"] = v27.Void,
        ["spawnWithItems"] = { u19.VOID_TURRET_TABLET }
    },
    {
        ["amount"] = 1,
        ["price"] = 24,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.WOOD_BOW,
        ["currency"] = u19.IRON,
        ["spawnWithItems"] = { u19.WOOD_BOW },
        ["category"] = v27.Combat,
        ["superiorItems"] = { u19.WOOD_CROSSBOW, u19.TACTICAL_CROSSBOW },
        ["ignoredByKit"] = { v23.LYLA, v23.FALCONER, v23.NAZAR }
    },
    {
        ["amount"] = 1,
        ["price"] = 7,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.WOOD_CROSSBOW,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.WOOD_CROSSBOW },
        ["category"] = v27.Combat,
        ["ignoredByKit"] = {
            v23.ARCHER,
            v23.LYLA,
            v23.FALCONER,
            v23.NAZAR
        },
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["superiorItems"] = { u19.HEADHUNTER }
    },
    {
        ["amount"] = 1,
        ["price"] = 24,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.HEADHUNTER,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.HEADHUNTER },
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 },
        ["ignoredByKit"] = {
            v23.ARCHER,
            v23.LYLA,
            v23.FALCONER,
            v23.NAZAR
        }
    },
    {
        ["amount"] = 8,
        ["price"] = 16,
        ["itemType"] = u19.ARROW,
        ["currency"] = u19.IRON,
        ["category"] = v27.Combat,
        ["ignoredByKit"] = { v23.NAZAR }
    },
    {
        ["amount"] = 1,
        ["price"] = 75,
        ["itemType"] = u19.FIREBALL,
        ["currency"] = u19.IRON,
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["itemType"] = u19.TELEPEARL,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED, u17.MINE_WARS }
    },
    {
        ["amount"] = 1,
        ["price"] = 35,
        ["itemType"] = u19.GLUE_PROJECTILE,
        ["currency"] = u19.IRON,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.BEDWARS_OG_TO4 }
    },
    {
        ["amount"] = 1,
        ["price"] = 1,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.UNSTABLE_PORTAL,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 1,
        ["price"] = 1,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.INVISIBLE_CLOAK,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 1,
        ["price"] = 55,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.GUARDS_SPEAR,
        ["currency"] = u19.IRON,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 4,
        ["price"] = 50,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.WATERMELON,
        ["currency"] = u19.IRON,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["limitedTimeItem"] = true,
        ["lockAfterPurchase"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.WATER_GUN,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED },
        ["spawnWithItems"] = { u19.WATER_GUN }
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.STONE_PICKAXE,
        ["currency"] = u19.IRON,
        ["prevTier"] = u19.WOOD_PICKAXE,
        ["nextTier"] = u19.IRON_PICKAXE,
        ["spawnWithItems"] = { u19.STONE_PICKAXE },
        ["category"] = v27.Tools,
        ["disabledInQueue"] = { u17.MINE_WARS, u17.FAST_CASUAL, u17.OVERPOWERED }
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.IRON_PICKAXE,
        ["currency"] = u19.IRON,
        ["prevTier"] = u19.STONE_PICKAXE,
        ["nextTier"] = u19.DIAMOND_PICKAXE,
        ["spawnWithItems"] = { u19.IRON_PICKAXE },
        ["category"] = v27.Tools,
        ["disabledInQueue"] = { u17.FAST_CASUAL, u17.OVERPOWERED }
    },
    {
        ["amount"] = 1,
        ["price"] = 60,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.DIAMOND_PICKAXE,
        ["currency"] = u19.IRON,
        ["prevTier"] = u19.IRON_PICKAXE,
        ["spawnWithItems"] = { u19.DIAMOND_PICKAXE },
        ["category"] = v27.Tools,
        ["disabledInQueue"] = { u17.FAST_CASUAL, u17.OVERPOWERED }
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.WOOD_AXE,
        ["currency"] = u19.IRON,
        ["nextTier"] = u19.STONE_AXE,
        ["spawnWithItems"] = { u19.WOOD_AXE },
        ["category"] = v27.Tools,
        ["ignoredByKit"] = { v23.MINER },
        ["disabledInQueue"] = {
            u17.TNT_WARS,
            u17.FAST_CASUAL,
            u17.MINE_WARS,
            u17.OVERPOWERED
        }
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.STONE_AXE,
        ["currency"] = u19.IRON,
        ["prevTier"] = u19.WOOD_AXE,
        ["nextTier"] = u19.IRON_AXE,
        ["spawnWithItems"] = { u19.STONE_AXE },
        ["category"] = v27.Tools,
        ["ignoredByKit"] = { v23.MINER },
        ["disabledInQueue"] = {
            u17.TNT_WARS,
            u17.FAST_CASUAL,
            u17.MINE_WARS,
            u17.OVERPOWERED
        }
    },
    {
        ["amount"] = 1,
        ["price"] = 30,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.IRON_AXE,
        ["currency"] = u19.IRON,
        ["prevTier"] = u19.STONE_AXE,
        ["nextTier"] = u19.DIAMOND_AXE,
        ["spawnWithItems"] = { u19.IRON_AXE },
        ["category"] = v27.Tools,
        ["ignoredByKit"] = { v23.MINER },
        ["disabledInQueue"] = {
            u17.TNT_WARS,
            u17.FAST_CASUAL,
            u17.MINE_WARS,
            u17.OVERPOWERED
        }
    },
    {
        ["amount"] = 1,
        ["price"] = 60,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.DIAMOND_AXE,
        ["currency"] = u19.IRON,
        ["prevTier"] = u19.IRON_AXE,
        ["spawnWithItems"] = { u19.DIAMOND_AXE },
        ["category"] = v27.Tools,
        ["ignoredByKit"] = { v23.MINER },
        ["disabledInQueue"] = {
            u17.TNT_WARS,
            u17.FAST_CASUAL,
            u17.MINE_WARS,
            u17.OVERPOWERED
        }
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.SHEARS,
        ["currency"] = u19.IRON,
        ["spawnWithItems"] = { u19.SHEARS },
        ["category"] = v27.Tools,
        ["disabledInQueue"] = {
            u17.TNT_WARS,
            u17.FAST_CASUAL,
            u17.MINE_WARS,
            u17.OVERPOWERED
        }
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.BLOCK_REPAIR_TOOL,
        ["currency"] = u19.IRON,
        ["spawnWithItems"] = { u19.BLOCK_REPAIR_TOOL },
        ["category"] = v27.Tools,
        ["disabledInQueue"] = { u17.TNT_WARS }
    },
    {
        ["amount"] = 1,
        ["price"] = 35,
        ["itemType"] = u19.TNT,
        ["currency"] = u19.IRON,
        ["category"] = v27.Blocks
    },
    {
        ["amount"] = 1,
        ["price"] = 350,
        ["itemType"] = u19.SIEGE_TNT,
        ["currency"] = u19.IRON,
        ["category"] = v27.Blocks,
        ["disabledInQueue"] = { u17.BEDWARS_OG_TO4 }
    },
    {
        ["amount"] = 16,
        ["price"] = 1,
        ["itemType"] = u19.VOID_BLOCK,
        ["currency"] = u19.VOID_CRYSTAL,
        ["category"] = v27.Void
    },
    {
        ["amount"] = 1,
        ["price"] = 65,
        ["itemType"] = u19.TESLA_TRAP,
        ["currency"] = u19.IRON,
        ["category"] = v27.Blocks,
        ["disabledInQueue"] = { u17.SURVIVAL, u17.TNT_WARS, u17.BEDWARS_OG_TO4 }
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.MENDING_CANOPY_STAFF_TIER_2,
        ["currency"] = u19.EMERALD,
        ["nextTier"] = u19.MENDING_CANOPY_STAFF_TIER_3,
        ["requiresKit"] = { v23.NYOKA },
        ["spawnWithItems"] = { u19.MENDING_CANOPY_STAFF_TIER_2 },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 8,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.MENDING_CANOPY_STAFF_TIER_3,
        ["currency"] = u19.EMERALD,
        ["prevTier"] = u19.MENDING_CANOPY_STAFF_TIER_2,
        ["requiresKit"] = { v23.NYOKA },
        ["spawnWithItems"] = { u19.MENDING_CANOPY_STAFF_TIER_3 },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 10,
        ["itemType"] = u19.ALCHEMIST_FLASK,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.ALCHEMIST },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 6,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.TACTICAL_CROSSBOW,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.TACTICAL_CROSSBOW },
        ["requiresKit"] = { v23.ARCHER },
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["superiorItems"] = { u19.TACTICAL_HEADHUNTER }
    },
    {
        ["amount"] = 1,
        ["price"] = 21,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.TACTICAL_HEADHUNTER,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.TACTICAL_HEADHUNTER },
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["requiresKit"] = { v23.ARCHER }
    },
    {
        ["amount"] = 1,
        ["price"] = 35,
        ["itemType"] = u19.SPEAR,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.SPEARMAN },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.SHIELD_AXOLOTL,
        ["currency"] = u19.IRON,
        ["nextTier"] = u19.DAMAGE_AXOLOTL,
        ["requiresKit"] = { v23.AXOLOTL },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 90,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.DAMAGE_AXOLOTL,
        ["currency"] = u19.IRON,
        ["prevTier"] = u19.SHIELD_AXOLOTL,
        ["nextTier"] = u19.BREAK_SPEED_AXOLOTL,
        ["requiresKit"] = { v23.AXOLOTL },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 1,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.BREAK_SPEED_AXOLOTL,
        ["currency"] = u19.EMERALD,
        ["prevTier"] = u19.DAMAGE_AXOLOTL,
        ["nextTier"] = u19.HEALTH_REGEN_AXOLOTL,
        ["requiresKit"] = { v23.AXOLOTL },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 5,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.HEALTH_REGEN_AXOLOTL,
        ["currency"] = u19.EMERALD,
        ["prevTier"] = u19.BREAK_SPEED_AXOLOTL,
        ["requiresKit"] = { v23.AXOLOTL },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["itemType"] = u19.APPLE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.BAKER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 3,
        ["itemType"] = u19.GOLDEN_APPLE,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.BAKER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["itemType"] = u19.PIE,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.BAKER },
        ["disabledInQueue"] = { u17.SURVIVAL },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 60,
        ["itemType"] = u19.BEEHIVE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.BEEKEEPER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.OASIS_VESSEL_2,
        ["currency"] = u19.EMERALD,
        ["nextTier"] = u19.OASIS_VESSEL_3,
        ["requiresKit"] = { v23.OASIS },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 8,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.OASIS_VESSEL_3,
        ["currency"] = u19.EMERALD,
        ["prevTier"] = u19.OASIS_VESSEL_2,
        ["requiresKit"] = { v23.OASIS },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["itemType"] = u19.DRAWBRIDGE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.BUILDER },
        ["category"] = v27.Blocks
    },
    {
        ["amount"] = 1,
        ["price"] = 60,
        ["itemType"] = u19.DAMAGE_BANNER,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.CONQUEROR },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 60,
        ["itemType"] = u19.DEFENSE_BANNER,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.CONQUEROR },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 60,
        ["itemType"] = u19.HEAL_BANNER,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.CONQUEROR },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 30,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.LASSO,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.COWGIRL },
        ["spawnWithItems"] = { u19.LASSO },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["itemType"] = u19.DRONE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.CYBER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 35,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.TELEPORT_HAT,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.HATTER },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.TELEPORT_HAT }
    },
    {
        ["amount"] = 0,
        ["price"] = 0,
        ["lockAfterPurchase"] = true,
        ["disabled"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.SUMMONER_CLAW_1,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.SUMMONER },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.SUMMONER_CLAW_1 },
        ["superiorItems"] = { u19.SUMMONER_CLAW_2 }
    },
    {
        ["amount"] = 0,
        ["price"] = 0,
        ["lockAfterPurchase"] = true,
        ["disabled"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.WOOD_DAO,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.DASHER },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.WOOD_DAO },
        ["superiorItems"] = { u19.STONE_DAO }
    },
    {
        ["amount"] = 1,
        ["price"] = 28,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.STONE_DAO,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.DASHER },
        ["category"] = v27.Combat,
        ["superiorItems"] = { u19.IRON_DAO },
        ["nextTier"] = u19.IRON_DAO,
        ["spawnWithItems"] = { u19.STONE_DAO }
    },
    {
        ["amount"] = 1,
        ["price"] = 85,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.IRON_DAO,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.DASHER },
        ["category"] = v27.Combat,
        ["superiorItems"] = { u19.DIAMOND_DAO },
        ["nextTier"] = u19.DIAMOND_DAO,
        ["spawnWithItems"] = { u19.IRON_DAO }
    },
    {
        ["amount"] = 1,
        ["price"] = 6,
        ["lockAfterPurchase"] = true,
        ["requireInInventoryToTierUp"] = true,
        ["itemType"] = u19.DIAMOND_DAO,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.DASHER },
        ["category"] = v27.Combat,
        ["superiorItems"] = { u19.EMERALD_DAO },
        ["nextTier"] = u19.EMERALD_DAO,
        ["spawnWithItems"] = { u19.IRON_DAO }
    },
    {
        ["amount"] = 1,
        ["price"] = 24,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.EMERALD_DAO,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.DASHER },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.DIAMOND_DAO }
    },
    {
        ["amount"] = 1,
        ["price"] = 60,
        ["itemType"] = u19.DINO_DEPLOY,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.DINO_TAMER },
        ["disabledInQueue"] = { u17.SURVIVAL },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["lockIfAttribute"] = "SatelliteDishPurchased",
        ["itemType"] = u19.SATELLITE_DISH,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.DISRUPTOR },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.ZENITH_SATELLITE_UPGRADE_2,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.DISRUPTOR },
        ["category"] = v27.Combat,
        ["nextTier"] = u19.ZENITH_SATELLITE_UPGRADE_3
    },
    {
        ["amount"] = 1,
        ["price"] = 8,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.ZENITH_SATELLITE_UPGRADE_3,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.DISRUPTOR },
        ["category"] = v27.Combat,
        ["prevTier"] = u19.ZENITH_SATELLITE_UPGRADE_2
    },
    {
        ["amount"] = 1,
        ["price"] = 3,
        ["itemType"] = u19.DRILL,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.DRILL },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 3,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.INFERNAL_SABER,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.EMBER },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.IRON_SWORD }
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.FISHING_ROD,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.FISHERMAN },
        ["spawnWithItems"] = { u19.FISHING_ROD },
        ["category"] = v27.Tools
    },
    {
        ["amount"] = 1,
        ["price"] = 5,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.ICE_SWORD,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.ICE_QUEEN },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.IRON_SWORD }
    },
    {
        ["amount"] = 1,
        ["price"] = 50,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.VACUUM,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.GHOST_CATCHER },
        ["spawnWithItems"] = { u19.VACUUM },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["itemType"] = u19.GUMDROP_BOUNCE_PAD,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.GINGERBREAD_MAN },
        ["category"] = v27.Blocks
    },
    {
        ["amount"] = 1,
        ["price"] = 35,
        ["itemType"] = u19.SPIRIT_BRIDGE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.IGNIS },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.JADE_HAMMER,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.JADE },
        ["spawnWithItems"] = { u19.JADE_HAMMER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.HEAVENLY_SWORD,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.LUMEN },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.IRON_SWORD }
    },
    {
        ["amount"] = 1,
        ["price"] = 24,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.FLOWER_BOW,
        ["currency"] = u19.IRON,
        ["spawnWithItems"] = { u19.FLOWER_BOW },
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.LYLA },
        ["superiorItems"] = { u19.FLOWER_CROSSBOW }
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.HARPOON,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.HARPOON },
        ["spawnWithItems"] = { u19.HARPOON },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 7,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.FLOWER_CROSSBOW,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.FLOWER_CROSSBOW },
        ["requiresKit"] = { v23.LYLA },
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["superiorItems"] = { u19.FLOWER_HEADHUNTER }
    },
    {
        ["amount"] = 1,
        ["price"] = 24,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.FLOWER_HEADHUNTER,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.FLOWER_HEADHUNTER },
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["requiresKit"] = { v23.LYLA }
    },
    {
        ["amount"] = 1,
        ["price"] = 16,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.GUITAR,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.MELODY },
        ["spawnWithItems"] = { u19.GUITAR },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.NINJA_CHAKRAM_1,
        ["currency"] = u19.IRON,
        ["spawnWithItems"] = { u19.NINJA_CHAKRAM_1 },
        ["requiresKit"] = { v23.NINJA },
        ["category"] = v27.Combat,
        ["nextTier"] = u19.NINJA_CHAKRAM_2,
        ["superiorItems"] = { u19.NINJA_CHAKRAM_2, u19.NINJA_CHAKRAM_3, u19.NINJA_CHAKRAM_4 }
    },
    {
        ["amount"] = 1,
        ["price"] = 70,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.NINJA_CHAKRAM_2,
        ["currency"] = u19.IRON,
        ["spawnWithItems"] = { u19.NINJA_CHAKRAM_2 },
        ["requiresKit"] = { v23.NINJA },
        ["category"] = v27.Combat,
        ["prevTier"] = u19.NINJA_CHAKRAM_1,
        ["nextTier"] = u19.NINJA_CHAKRAM_3,
        ["superiorItems"] = { u19.NINJA_CHAKRAM_3, u19.NINJA_CHAKRAM_4 }
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.NINJA_CHAKRAM_3,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.NINJA_CHAKRAM_3 },
        ["requiresKit"] = { v23.NINJA },
        ["category"] = v27.Combat,
        ["prevTier"] = u19.NINJA_CHAKRAM_2,
        ["nextTier"] = u19.NINJA_CHAKRAM_4,
        ["superiorItems"] = { u19.NINJA_CHAKRAM_4 }
    },
    {
        ["amount"] = 1,
        ["price"] = 20,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.NINJA_CHAKRAM_4,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.NINJA_CHAKRAM_4 },
        ["requiresKit"] = { v23.NINJA },
        ["category"] = v27.Combat,
        ["prevTier"] = u19.NINJA_CHAKRAM_3
    },
    {
        ["amount"] = 1,
        ["price"] = 1,
        ["itemType"] = u19.OIL_CONSUMABLE,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.OIL_MAN },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 55,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.SCEPTER,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.PALADIN },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 35,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.PINATA,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.PINATA },
        ["category"] = v27.Blocks
    },
    {
        ["amount"] = 1,
        ["price"] = 3,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.FLAMETHROWER,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.PYRO },
        ["spawnWithItems"] = { u19.FLAMETHROWER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["itemType"] = u19.BEEHIVE_GRENADE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.QUEEN_BEE },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 65,
        ["itemType"] = u19.RAVEN,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.RAVEN },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 70,
        ["itemType"] = u19.SANTA_BOMB,
        ["currency"] = u19.IRON,
        ["disabledInQueue"] = { u17.SURVIVAL },
        ["requiresKit"] = { v23.SANTA },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 225,
        ["itemType"] = u19.SANTA_BOMB_SIEGE,
        ["currency"] = u19.IRON,
        ["disabledInQueue"] = { u17.SURVIVAL },
        ["requiresKit"] = { v23.SANTA },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 3,
        ["lockIfAttribute"] = "purchased_healing_slime",
        ["dontGiveItem"] = true,
        ["itemType"] = u19.HEALING_SLIME,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.SLIME_TAMER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 3,
        ["lockIfAttribute"] = "purchased_void_slime",
        ["dontGiveItem"] = true,
        ["itemType"] = u19.VOID_SLIME,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.SLIME_TAMER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["lockIfAttribute"] = "purchased_sticky_slime",
        ["dontGiveItem"] = true,
        ["itemType"] = u19.STICKY_SLIME,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.SLIME_TAMER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["lockIfAttribute"] = "purchased_frosty_slime",
        ["dontGiveItem"] = true,
        ["itemType"] = u19.FROSTY_SLIME,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.SLIME_TAMER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 25,
        ["itemType"] = u19.SMOKE_BOMB,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.SMOKE },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 8,
        ["price"] = 15,
        ["itemType"] = u19.SMOKE_BLOCK,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.SMOKE },
        ["category"] = v27.Blocks
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["itemType"] = u19.SPIRIT,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.SPIRIT_CATCHER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 50,
        ["itemType"] = u19.GATHER_BOT_BASIC,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.STEAM_ENGINEER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 1,
        ["itemType"] = u19.GATHER_BOT_PRO,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.STEAM_ENGINEER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.SCARAB_UPGRADE_1,
        ["currency"] = u19.IRON,
        ["nextTier"] = u19.SCARAB_UPGRADE_2,
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.SCARAB }
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.SCARAB_UPGRADE_2,
        ["currency"] = u19.EMERALD,
        ["prevTier"] = u19.SCARAB_UPGRADE_1,
        ["nextTier"] = u19.SCARAB_UPGRADE_3,
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.SCARAB }
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.SCARAB_UPGRADE_3,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Combat,
        ["prevTier"] = u19.SCARAB_UPGRADE_2,
        ["requiresKit"] = { v23.SCARAB }
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.HIVE_UPGRADE_1,
        ["currency"] = u19.IRON,
        ["nextTier"] = u19.HIVE_UPGRADE_2,
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.SCARAB }
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.HIVE_UPGRADE_2,
        ["currency"] = u19.EMERALD,
        ["prevTier"] = u19.HIVE_UPGRADE_1,
        ["nextTier"] = u19.HIVE_UPGRADE_3,
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.SCARAB }
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.HIVE_UPGRADE_3,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Combat,
        ["prevTier"] = u19.HIVE_UPGRADE_2,
        ["requiresKit"] = { v23.SCARAB }
    },
    {
        ["amount"] = 1,
        ["price"] = 120,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.TINKER_IRON_MECH_UPGRADE,
        ["currency"] = u19.IRON,
        ["nextTier"] = u19.TINKER_DIAMOND_MECH_UPGRADE,
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.TINKER }
    },
    {
        ["amount"] = 1,
        ["price"] = 7,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.TINKER_DIAMOND_MECH_UPGRADE,
        ["currency"] = u19.EMERALD,
        ["prevTier"] = u19.TINKER_IRON_MECH_UPGRADE,
        ["nextTier"] = u19.TINKER_EMERALD_MECH_UPGRADE,
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.TINKER }
    },
    {
        ["amount"] = 1,
        ["price"] = 18,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.TINKER_EMERALD_MECH_UPGRADE,
        ["currency"] = u19.EMERALD,
        ["prevTier"] = u19.TINKER_DIAMOND_MECH_UPGRADE,
        ["nextTier"] = u19.TINKER_VOID_MECH_UPGRADE,
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.TINKER }
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.TINKER_VOID_MECH_UPGRADE,
        ["currency"] = u19.EMERALD,
        ["prevTier"] = u19.TINKER_EMERALD_MECH_UPGRADE,
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.TINKER }
    },
    {
        ["amount"] = 1,
        ["price"] = 24,
        ["itemType"] = u19.SNAP_TRAP,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.TRAPPER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 40,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.VOID_AXE,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.REGENT },
        ["spawnWithItems"] = { u19.VOID_AXE },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 1,
        ["itemType"] = u19.CAMERA_TURRET,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.VULCAN },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 45,
        ["itemType"] = u19.CLUSTER_BOMB,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.AGNI },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.WIZARD_STAFF_2,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.WIZARD },
        ["spawnWithItems"] = { u19.WIZARD_STAFF_2 },
        ["category"] = v27.Combat,
        ["nextTier"] = u19.WIZARD_STAFF_3
    },
    {
        ["amount"] = 1,
        ["price"] = 6,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.WIZARD_STAFF_3,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.WIZARD },
        ["spawnWithItems"] = { u19.WIZARD_STAFF_3 },
        ["category"] = v27.Combat,
        ["prevTier"] = u19.WIZARD_STAFF_2
    },
    {
        ["amount"] = 1,
        ["price"] = 4,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.FROST_STAFF_2,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.ICE_MAGE },
        ["spawnWithItems"] = { u19.FROST_STAFF_2 },
        ["category"] = v27.Combat,
        ["nextTier"] = u19.FROST_STAFF_3,
        ["prevTier"] = u19.FROST_STAFF_1
    },
    {
        ["amount"] = 1,
        ["price"] = 6,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["itemType"] = u19.FROST_STAFF_3,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.ICE_MAGE },
        ["spawnWithItems"] = { u19.FROST_STAFF_3 },
        ["category"] = v27.Combat,
        ["prevTier"] = u19.FROST_STAFF_2
    },
    {
        ["amount"] = 1,
        ["price"] = 32,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.FALCONER_BOW,
        ["currency"] = u19.IRON,
        ["spawnWithItems"] = { u19.FALCONER_BOW },
        ["category"] = v27.Combat,
        ["requiresKit"] = { v23.FALCONER },
        ["superiorItems"] = { u19.FALCONER_CROSSBOW }
    },
    {
        ["amount"] = 1,
        ["price"] = 8,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.FALCONER_CROSSBOW,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.FALCONER_CROSSBOW },
        ["requiresKit"] = { v23.FALCONER },
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["superiorItems"] = { u19.FALCONER_HEADHUNTER }
    },
    {
        ["amount"] = 1,
        ["price"] = 25,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.FALCONER_HEADHUNTER,
        ["currency"] = u19.EMERALD,
        ["spawnWithItems"] = { u19.FALCONER_HEADHUNTER },
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS },
        ["requiresKit"] = { v23.FALCONER }
    },
    {
        ["amount"] = 1,
        ["lockAfterPurchase"] = true,
        ["price"] = 24,
        ["itemType"] = u19.LIFE_BOW,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.NAZAR },
        ["superiorItems"] = { u19.LIFE_CROSSBOW },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.LIFE_BOW }
    },
    {
        ["amount"] = 1,
        ["lockAfterPurchase"] = true,
        ["price"] = 7,
        ["itemType"] = u19.LIFE_CROSSBOW,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.NAZAR },
        ["superiorItems"] = { u19.LIFE_HEADHUNTER },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.LIFE_CROSSBOW }
    },
    {
        ["amount"] = 1,
        ["lockAfterPurchase"] = true,
        ["price"] = 24,
        ["itemType"] = u19.LIFE_HEADHUNTER,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.NAZAR },
        ["category"] = v27.Combat,
        ["spawnWithItems"] = { u19.LIFE_HEADHUNTER }
    },
    {
        ["amount"] = 1,
        ["price"] = 70,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.KNIGHT_SHIELD,
        ["currency"] = u19.IRON,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 3,
        ["price"] = 2,
        ["limitedTimeItem"] = true,
        ["itemType"] = u19.ANNIVERSARY_BALLOON,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 2,
        ["price"] = 16,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.SLIME_BLOCK,
        ["currency"] = u19.IRON,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 8,
        ["price"] = 8,
        ["limitedTimeItem"] = true,
        ["itemType"] = u19.SNOWBALL,
        ["currency"] = u19.IRON,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.DUCK_SPAWN_EGG,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 1,
        ["price"] = 60,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.SUMMER_2025_TREASURE_MAP,
        ["currency"] = u19.IRON,
        ["category"] = v27.Tools,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED },
        ["lockIfAttribute"] = v13.disableBuyingTreasureMapAttribute
    },
    {
        ["amount"] = 1,
        ["price"] = 2,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.FIREWORK_BACKPACK,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Random,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 1,
        ["price"] = 35,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.EXPLODING_TANK_BLOCK,
        ["currency"] = u19.IRON,
        ["category"] = v27.Random
    },
    {
        ["amount"] = 1,
        ["price"] = 1,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.STOPWATCH,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 1,
        ["price"] = 7,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.GRAPPLING_HOOK,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Combat,
        ["disabledInQueue"] = { u17.TNT_WARS, u17.INFECTED }
    },
    {
        ["amount"] = 1,
        ["lockIfAttribute"] = "DisableSummonStonePurchase",
        ["itemType"] = u19.SUMMON_STONE,
        ["price"] = v24.SUMMON_STONE_COST,
        ["currency"] = v24.SUMMON_STONE_CURRENCY,
        ["requiresKit"] = { v23.SPIRIT_SUMMONER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["lockAfterPurchase"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.SPIRIT_TIER_2,
        ["price"] = v24.SUMMON_TIER_2_COST,
        ["currency"] = v24.SUMMON_TIER_CURRENCY,
        ["nextTier"] = u19.SPIRIT_TIER_3,
        ["requiresKit"] = { v23.SPIRIT_SUMMONER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["lockAfterPurchase"] = true,
        ["tiered"] = true,
        ["dontGiveItem"] = true,
        ["itemType"] = u19.SPIRIT_TIER_3,
        ["price"] = v24.SUMMON_TIER_3_COST,
        ["currency"] = v24.SUMMON_TIER_CURRENCY,
        ["prevTier"] = u19.SPIRIT_TIER_2,
        ["requiresKit"] = { v23.SPIRIT_SUMMONER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 1,
        ["itemType"] = u19.CRYSTALHEART_SEED,
        ["currency"] = u19.EMERALD,
        ["requiresKit"] = { v23.SPIRIT_GARDENER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 50,
        ["itemType"] = u19.SOULVINE_SEED,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.SPIRIT_GARDENER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 50,
        ["itemType"] = u19.TEARBLOOM_SEED,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.SPIRIT_GARDENER },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 30,
        ["lockAfterPurchase"] = true,
        ["itemType"] = u19.STYX_ENTRANCE_PORTAL,
        ["currency"] = u19.IRON,
        ["requiresKit"] = { v23.STYX },
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 75,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.DRAGON_MORTAR,
        ["currency"] = u19.IRON,
        ["category"] = v27.Combat
    },
    {
        ["amount"] = 1,
        ["price"] = 1,
        ["limitedTimeItem"] = true,
        ["disabled"] = true,
        ["itemType"] = u19.FIRECRACKERS,
        ["currency"] = u19.EMERALD,
        ["category"] = v27.Combat
    }
}
v36.ShopItems = u37
u58 = function(p119, p120) --[[ Name: getAdjustedShopPrice, Line 2260 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u17
        [3] = u19
        [4] = u20
        [5] = u10
        [6] = u7
        [7] = u6
        [8] = u15
    --]]
    if p119.disabled then
        return p119.price
    end
    local v121 = p119.price
    if p119.priceMultiplier ~= nil then
        local v122 = p119.price * p119.priceMultiplier
        local v123 = math.round(v122)
        local v124 = p119.price
        v121 = math.clamp(v123, 1, v124)
    end
    local v125 = math
    local v126 = p119.price
    local v127 = p120:GetAttribute("DisruptionPriceIncrease")
    local v128 = v126 * (v127 == nil and 0 or v127)
    local v129 = v125.ceil(v128)
    local v130 = u11:GetAttribute("QueueType")
    local v131 = (v130 == u17.BEDWARS_20v20_LB or (v130 == u17.BEDWARS_16v16 or v130 == u17.BEDWARS_20v20)) and 0 or v129
    local v132 = 0
    if p119.currency == u19.IRON and u20.isGameServer() then
        if u10:IsServer() then
            v132 = u7.Services.ShopTaxService:getAddedTax(p120, p119.itemType)
        elseif u10:IsClient() then
            v132 = u6.Controllers.ShopTaxController:getAddedTax(p119.itemType)
        end
    end
    local v133 = v121 + v131 + v132
    if v130 ~= nil then
        local v134 = u15(v130)
        if v134 ~= nil then
            v134 = v134.shopPriceModifiers
        end
        if v134 ~= nil then
            local v135 = p119.currency
            if v135 == u19.IRON then
                if v134.ironMultiplier ~= nil then
                    v133 = v133 * v134.ironMultiplier
                end
            elseif v135 == u19.DIAMOND then
                if v134.diamondMultiplier ~= nil then
                    v133 = v133 * v134.diamondMultiplier
                end
            elseif v135 == u19.EMERALD and v134.emeraldMultiplier ~= nil then
                v133 = v133 * v134.emeraldMultiplier
            end
            local v136 = v134.roundingMethod
            local v137
            if v136 == "up" then
                v137 = math.ceil(v133)
            elseif v136 == "down" then
                v137 = math.floor(v133)
            elseif v136 == "nearest" then
                v137 = math.round(v133)
            else
                v137 = math.round(v133)
            end
            if v134.canGoToZero then
                return math.max(v137, 0)
            end
            v133 = v137 < 1 and 1 or v137
        end
    end
    return v133
end
v36.getAdjustedShopPrice = u58
function v36.doesItemRequireKit(p138, p139) --[[ Line: 2357 ]]
    --[[
    Upvalues:
        [1] = u57
    --]]
    local v140 = u57(p138, nil)
    if v140 == nil then
        return false
    end
    if v140.requiresKit == nil then
        return false
    end
    local v141 = v140.requiresKit
    return table.find(v141, p139) ~= nil
end
return {
    ["customMeleeKits"] = v28,
    ["customDiamondEmeraldMelee"] = v29,
    ["customArmorKits"] = v33,
    ["woodWeaponDisabled"] = v34,
    ["BedwarsShop"] = v36
}