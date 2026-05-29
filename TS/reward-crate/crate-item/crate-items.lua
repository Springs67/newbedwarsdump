local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").Consumable
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v10 = {}
local v11 = setmetatable({}, {
    ["__index"] = v10
})
v11.FLAT_BP_XP_1 = "flat_bp_xp_1"
v10.flat_bp_xp_1 = "FLAT_BP_XP_1"
v11.FLAT_BP_XP_2 = "flat_bp_xp_2"
v10.flat_bp_xp_2 = "FLAT_BP_XP_2"
v11.FLAT_BP_XP_3 = "flat_bp_xp_3"
v10.flat_bp_xp_3 = "FLAT_BP_XP_3"
v11.RANDOM_KIT = "random_kit"
v10.random_kit = "RANDOM_KIT"
v11.BED_COIN_100 = "BED_COIN_100"
v10.BED_COIN_100 = "BED_COIN_100"
v11.BED_COIN_200 = "BED_COIN_200"
v10.BED_COIN_200 = "BED_COIN_200"
v11.BED_COIN_350 = "BED_COIN_350"
v10.BED_COIN_350 = "BED_COIN_350"
v11.BED_COIN_600 = "BED_COIN_600"
v10.BED_COIN_600 = "BED_COIN_600"
local v12 = {}
for v13, v14 in v11 do
    v12[v13] = v14
end
for v15, v16 in v3 do
    v12[v15] = v16
end
for v17, v18 in v5 do
    v12[v17] = v18
end
for v19, v20 in v4 do
    v12[v19] = v20
end
for v21, v22 in v7 do
    v12[v21] = v22
end
for v23, v24 in v9 do
    v12[v23] = v24
end
for v25, v26 in v8 do
    v12[v25] = v26
end
for v27, v28 in v6 do
    v12[v27] = v28
end
for v29, v30 in v2 do
    v12[v29] = v30
end
return {
    ["CrateItem"] = v11,
    ["CrateItemType"] = v12
}