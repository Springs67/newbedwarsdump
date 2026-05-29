local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = {
    v3.WIZARD_STICK,
    v3.WOOD_SWORD,
    v3.WOOD_DAO,
    v3.WOOD_GUN_BLADE,
    v3.WOOD_SCYTHE,
    v3.WOOD_GREAT_HAMMER,
    v3.STONE_SWORD,
    v3.STONE_DAO,
    v3.STONE_GUN_BLADE,
    v3.STONE_SCYTHE,
    v3.STONE_GREAT_HAMMER,
    v3.IRON_SWORD,
    v3.IRON_DAO,
    v3.IRON_GUN_BLADE,
    v3.IRON_SCYTHE,
    v3.IRON_GREAT_HAMMER,
    v3.DIAMOND_SWORD,
    v3.DIAMOND_DAO,
    v3.DIAMOND_GUN_BLADE,
    v3.DIAMOND_SCYTHE,
    v3.DIAMOND_GREAT_HAMMER,
    v3.HEAVENLY_SWORD,
    v3.INFERNAL_SABER,
    v3.ICE_SWORD,
    v3.VOID_SWORD,
    v3.GLITCH_WOOD_SWORD,
    v3.LASER_SWORD,
    v3.EMERALD_SWORD,
    v3.EMERALD_DAO,
    v3.EMERALD_GUN_BLADE,
    v3.MYTHIC_SCYTHE,
    v3.MYTHIC_GREAT_HAMMER,
    v3.RAGEBLADE
}
local u5 = {
    v3.WOOD_GREAT_HAMMER,
    v3.STONE_GREAT_HAMMER,
    v3.IRON_GREAT_HAMMER,
    v3.DIAMOND_GREAT_HAMMER,
    v3.MYTHIC_GREAT_HAMMER
}
local u6 = {
    v3.WOOD_DAGGER,
    v3.STONE_DAGGER,
    v3.IRON_DAGGER,
    v3.DIAMOND_DAGGER,
    v3.MYTHIC_DAGGER
}
local u7 = {
    v3.WOOD_SWORD,
    v3.STONE_SWORD,
    v3.IRON_SWORD,
    v3.DIAMOND_SWORD,
    v3.EMERALD_SWORD
}
local u8 = {
    v3.WOOD_GAUNTLETS,
    v3.STONE_GAUNTLETS,
    v3.IRON_GAUNTLETS,
    v3.DIAMOND_GAUNTLETS,
    v3.MYTHIC_GAUNTLETS_PLAIN,
    v3.MYTHIC_GAUNTLETS
}
local u9 = {
    v3.WOOD_SCYTHE,
    v3.STONE_SCYTHE,
    v3.IRON_SCYTHE,
    v3.DIAMOND_SCYTHE,
    v3.MYTHIC_SCYTHE
}
local v10 = {
    v3.WOOD_SWORD,
    v3.WOOD_DAGGER,
    v3.WOOD_SCYTHE,
    v3.WOOD_GREAT_HAMMER,
    v3.WOOD_GAUNTLETS,
    v3.WOOD_DAO,
    v3.WOOD_GUN_BLADE
}
local u11 = {
    v3.WOOD_DAO,
    v3.STONE_DAO,
    v3.IRON_DAO,
    v3.DIAMOND_DAO,
    v3.EMERALD_DAO
}
local u12 = {
    v3.WOOD_GUN_BLADE,
    v3.STONE_GUN_BLADE,
    v3.IRON_GUN_BLADE,
    v3.DIAMOND_GUN_BLADE,
    v3.EMERALD_GUN_BLADE
}
return {
    ["BedwarsMelees"] = v4,
    ["BedWarsGreatHammers"] = u5,
    ["BedWarsDaggers"] = u6,
    ["BedWarsSwords"] = u7,
    ["BedWarsGauntlets"] = u8,
    ["BedWarsScythes"] = u9,
    ["BaseMelee"] = v10,
    ["Daos"] = u11,
    ["GunBlade"] = u12,
    ["IceQueenCustomUpgradePath"] = {
        v3.WOOD_SWORD,
        v3.STONE_SWORD,
        v3.IRON_SWORD,
        v3.ICE_SWORD
    },
    ["LumenCustomUpgradePath"] = {
        v3.WOOD_SWORD,
        v3.STONE_SWORD,
        v3.IRON_SWORD,
        v3.HEAVENLY_SWORD
    },
    ["EmberCustomUpgradePath"] = {
        v3.WOOD_SWORD,
        v3.STONE_SWORD,
        v3.IRON_SWORD,
        v3.INFERNAL_SABER
    },
    ["getUpgradePathFromMelee"] = function(p13) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
            [3] = u12
            [4] = u9
            [5] = u5
            [6] = u6
            [7] = u8
        --]]
        for _, v14 in {
            u7,
            u11,
            u12,
            u9,
            u5,
            u6,
            u8
        } do
            if table.find(v14, p13) ~= nil then
                return v14
            end
        end
        return {}
    end,
    ["getPlayerBestBaseSword"] = function(p15) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
        --]]
        local v16 = 0
        local v17 = {}
        for v18, v19 in u2.getInventory(p15).items do
            local _ = v18 - 1
            local v20 = v19.itemType
            if table.find(u7, v20) ~= nil == true then
                v16 = v16 + 1
                v17[v16] = v19
            end
        end
        local function v26(p21, p22) --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            local v23 = p21.itemType
            local v24 = (table.find(u7, v23) or 0) - 1
            local v25 = p22.itemType
            return (table.find(u7, v25) or 0) - 1 < v24
        end
        table.sort(v17, v26)
        if #v17 == 0 then
            return nil
        end
        local v27 = v17[1]
        if v27 ~= nil then
            v27 = v27.itemType
        end
        return v27
    end
}