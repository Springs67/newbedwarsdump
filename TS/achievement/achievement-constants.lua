local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop")
local v4 = v3.customArmorKits
local v5 = v3.customMeleeKits
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId
local v7 = {
    ["BEDWARS_NO_DEATH_ACHIEVEMENTS"] = {
        v6.BEDWARS_TO4_NO_DEATHS,
        v6.BEDWARS_TO2_NO_DEATHS,
        v6.BEDWARS_TO1_NO_DEATHS,
        v6.BEDWARS_5V5_NO_DEATHS,
        v6.BEDWARS_DUELS_NO_DEATHS,
        v6.BEDWARS_LB_NO_DEATHS
    },
    ["BEDWARS_NO_DAMAGE_ACHIEVEMENTS"] = {
        v6.BEDWARS_TO4_NO_DAMAGE,
        v6.BEDWARS_TO2_NO_DAMAGE,
        v6.BEDWARS_TO1_NO_DAMAGE,
        v6.BEDWARS_5V5_NO_DAMAGE,
        v6.BEDWARS_DUELS_NO_DAMAGE,
        v6.BEDWARS_LB_NO_DAMAGE
    },
    ["BEDWARS_NO_ARMOR_ACHIEVEMENTS"] = {
        v6.BEDWARS_TO4_NO_ARMOR,
        v6.BEDWARS_TO2_NO_ARMOR,
        v6.BEDWARS_TO1_NO_ARMOR,
        v6.BEDWARS_5V5_NO_ARMOR,
        v6.BEDWARS_DUELS_NO_ARMOR,
        v6.BEDWARS_LB_NO_ARMOR
    },
    ["BEDWARS_NO_SWORD_ACHIEVEMENTS"] = {
        v6.BEDWARS_TO4_NO_SWORD,
        v6.BEDWARS_TO2_NO_SWORD,
        v6.BEDWARS_TO1_NO_SWORD,
        v6.BEDWARS_5V5_NO_SWORD,
        v6.BEDWARS_DUELS_NO_SWORD,
        v6.BEDWARS_LB_NO_SWORD
    }
}
local v8 = table.create(#v5)
for v9, v10 in v5 do
    local _ = v9 - 1
    v8[v9] = v2(v10).name
end
v7.CUSTOM_MELEE_KITS_INVALID = "The following kits are not elligible for this achievement: <b>" .. table.concat(v8, ", ") .. "</b>."
local v11 = table.create(#v4)
for v12, v13 in v4 do
    local _ = v12 - 1
    v11[v12] = v2(v13).name
end
v7.CUSTOM_ARMOR_KITS_INVALID = "The following kits are not elligible for this achievement: <b>" .. table.concat(v11, ", ") .. "</b>."
local v14 = {}
local v15 = setmetatable({}, {
    ["__index"] = v14
})
v15.DAMAGE_LEGEND = "rbxassetid://96877715708041"
v14["rbxassetid://96877715708041"] = "DAMAGE_LEGEND"
v15.MULTIKILLER = "rbxassetid://126803719716547"
v14["rbxassetid://126803719716547"] = "MULTIKILLER"
v15.WELL_ROUNDED = "rbxassetid://118441476441317"
v14["rbxassetid://118441476441317"] = "WELL_ROUNDED"
v15.WRATH = "rbxassetid://89948600152493"
v14["rbxassetid://89948600152493"] = "WRATH"
v15.RANGED_LEGEND = "rbxassetid://104062687410308"
v14["rbxassetid://104062687410308"] = "RANGED_LEGEND"
v15.IRON_SPENDER = "rbxassetid://97718781947276"
v14["rbxassetid://97718781947276"] = "IRON_SPENDER"
v15.EXECUTIONER = "rbxassetid://100644099029837"
v14["rbxassetid://100644099029837"] = "EXECUTIONER"
v15.EMERALD_SPENDER = "rbxassetid://129222203323904"
v14["rbxassetid://129222203323904"] = "EMERALD_SPENDER"
return {
    ["AchievementConstants"] = v7,
    ["AchievementImageId"] = v15
}