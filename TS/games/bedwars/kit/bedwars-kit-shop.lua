local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsBPKits
local v4 = {}
local v5 = {}
local v6 = { 20 }
v5.FreeKitLevelReq = v6
local u7 = {
    {
        ["playerLevelRequirement"] = 0,
        ["kitType"] = v2.DRILL
    },
    {
        ["playerLevelRequirement"] = 0,
        ["kitType"] = v2.CAT
    },
    {
        ["playerLevelRequirement"] = 0,
        ["kitType"] = v2.STAR_COLLECTOR
    },
    {
        ["playerLevelRequirement"] = v6[1],
        ["kitType"] = v2.BLOOD_ASSASSIN
    }
}
v5.FreeKits = u7
function v5.kitAvailableThisWeek(p8, p9) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v10 = nil
    for v11, v12 in u7 do
        local _ = v11 - 1
        local v13
        if v12.kitType == p8 then
            v13 = v12.playerLevelRequirement <= p9
        else
            v13 = false
        end
        if v13 == true then
            v10 = v12
            break
        end
    end
    return v10 ~= nil
end
function v5.getFreeKitLevelReq(p14) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v15 = nil
    for v16, v17 in u7 do
        local _ = v16 - 1
        if v17.kitType == p14 == true then
            v15 = v17
            break
        end
    end
    if v15 ~= nil then
        v15 = v15.playerLevelRequirement
    end
    return v15
end
function v5.getFreeKitSlotsUnlocked(p18) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v19 = 0
    local v20 = {}
    for v21, v22 in u7 do
        local _ = v21 - 1
        if v22.playerLevelRequirement <= p18 == true then
            v19 = v19 + 1
            v20[v19] = v22
        end
    end
    return #v20
end
function v5.getTotalFreeKitSlots() --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return #u7
end
v4.FreeKitRotation = v5
local v23 = { v2.REGENT }
local v24 = #v23
local v25 = v3.season8
local v26 = #v25
table.move(v25, 1, v26, v24 + 1, v23)
local v27 = v24 + v26
local v28 = v3.season7
local v29 = #v28
table.move(v28, 1, v29, v27 + 1, v23)
local v30 = v27 + v29
local v31 = v3.season6
local v32 = #v31
table.move(v31, 1, v32, v30 + 1, v23)
local v33 = v30 + v32
local v34 = v3.season5
local v35 = #v34
table.move(v34, 1, v35, v33 + 1, v23)
local v36 = v33 + v35
local v37 = v3.season4
local v38 = #v37
table.move(v37, 1, v38, v36 + 1, v23)
local v39 = v36 + v38
local v40 = v3.season3
local v41 = #v40
table.move(v40, 1, v41, v39 + 1, v23)
local v42 = v39 + v41
local v43 = v3.season2
local v44 = #v43
table.move(v43, 1, v44, v42 + 1, v23)
local v45 = v42 + v44
local v46 = v3.season1
local v47 = #v46
table.move(v46, 1, v47, v45 + 1, v23)
local v48 = v45 + v47
v23[v48 + 1] = v2.EMBER
v23[v48 + 2] = v2.LUMEN
v23[v48 + 3] = v2.CYBER
v23[v48 + 4] = v2.MINER
v23[v48 + 5] = v2.DASHER
v23[v48 + 6] = v2.ICE_QUEEN
v23[v48 + 7] = v2.TRIPLE_SHOT
v23[v48 + 8] = v2.AXOLOTL
v23[v48 + 9] = v2.BARBARIAN
v23[v48 + 10] = v2.ANGEL
v23[v48 + 11] = v2.VULCAN
v23[v48 + 12] = v2.WIZARD
v23[v48 + 13] = v2.GRIM_REAPER
v23[v48 + 14] = v2.COWGIRL
v23[v48 + 15] = v2.BIGMAN
v23[v48 + 16] = v2.DAVEY
v23[v48 + 17] = v2.FARMER_CLETUS
v23[v48 + 18] = v2.MELODY
v23[v48 + 19] = v2.ARCHER
v23[v48 + 20] = v2.SHIELDER
v23[v48 + 21] = v2.BAKER
v23[v48 + 22] = v2.BUILDER
v23[v48 + 23] = v2.SPIRIT_ASSASSIN
v23[v48 + 24] = v2.NECROMANCER
v23[v48 + 25] = v2.HANNAH
v23[v48 + 26] = v2.DISRUPTOR
v23[v48 + 27] = v2.FROSTY_HAMMER
v23[v48 + 28] = v2.SEAHORSE
v23[v48 + 29] = v2.OWL
v23[v48 + 30] = v2.LYLA
v23[v48 + 31] = v2.TALIYAH
v23[v48 + 32] = v2.MIMIC
v23[v48 + 33] = v2.WARLOCK
v23[v48 + 34] = v2.STEAM_ENGINEER
v23[v48 + 35] = v2.SLIME_TAMER
v23[v48 + 36] = v2.BLOCK_KICKER
v23[v48 + 37] = v2.NINJA
v23[v48 + 38] = v2.ELK_MASTER
v23[v48 + 39] = v2.DRAGON_SWORD
v23[v48 + 40] = v2.FALCONER
v23[v48 + 41] = v2.NYOKA
v23[v48 + 42] = v2.STYX
v23[v48 + 43] = v2.TINKER
v23[v48 + 44] = v2.AGNI
v23[v48 + 45] = v2.HARPOON
v23[v48 + 46] = v2.JELLYFISH
v23[v48 + 47] = v2.OASIS
v23[v48 + 48] = v2.SUMMONER
v23[v48 + 49] = v2.BLACK_MARKET_TRADER
v23[v48 + 50] = v2.NAZAR
v23[v48 + 51] = v2.REBELLION_LEADER
v23[v48 + 52] = v2.SORCERER
v23[v48 + 53] = v2.SPIDER_QUEEN
v23[v48 + 54] = v2.CAT
v23[v48 + 55] = v2.VOID_HUNTER
v23[v48 + 56] = v2.SPIRIT_SUMMONER
v23[v48 + 57] = v2.VOID_KNIGHT
v23[v48 + 58] = v2.SPIRIT_GARDENER
v23[v48 + 59] = v2.GLACIAL_SKATER
v23[v48 + 60] = v2.VOID_WALKER
v23[v48 + 61] = v2.SWORD_SHIELD
v23[v48 + 62] = v2.AIRBENDER
v23[v48 + 63] = v2.CACTUS
v23[v48 + 64] = v2.BERSERKER
v23[v48 + 65] = v2.SCARAB
v23[v48 + 66] = v2.DEFENDER
v23[v48 + 67] = v2.GUN_BLADE
v23[v48 + 68] = v2.SKELETON
v23[v48 + 69] = v2.ICE_MAGE
v23[v48 + 70] = v2.SOUL_BROKER
v4.ShopKits = v23
v4.FeaturedKits = {
    v2.CYBER,
    v2.COWGIRL,
    v2.DASHER,
    v2.AXOLOTL
}
v4.BattlePassPodiumKits = {
    v2.MAGE,
    v2.VOID_DRAGON,
    v2.DRAGON_SLAYER,
    v2.JAILOR,
    v2.PALADIN
}
return {
    ["BedwarsKitShop"] = v4
}