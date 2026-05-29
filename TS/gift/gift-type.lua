local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.BattlePass = "BattlePass"
v5.BattlePass = "BattlePass"
v6.VIP_RANK = "vip_rank"
v5.vip_rank = "VIP_RANK"
v6.BED_COIN_1000 = "bed_coin_1000"
v5.bed_coin_1000 = "BED_COIN_1000"
v6.BED_COIN_4500 = "bed_coin_4500"
v5.bed_coin_4500 = "BED_COIN_4500"
v6.BED_COIN_12000 = "bed_coin_12000"
v5.bed_coin_12000 = "BED_COIN_12000"
v6.BED_COIN_26000 = "bed_coin_26000"
v5.bed_coin_26000 = "BED_COIN_26000"
local v7 = {}
for v8, v9 in v6 do
    v7[v8] = v9
end
for v10, v11 in v4 do
    v7[v10] = v11
end
for v12, v13 in v3 do
    v7[v12] = v13
end
for v14, v15 in v2 do
    v7[v14] = v15
end
return {
    ["GiftT"] = v6,
    ["GiftType"] = v7
}