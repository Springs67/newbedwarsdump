local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.NORMALS = "NORMALS"
v2.NORMALS = "NORMALS"
v3.LUCKY_BLOCK = "LUCKY_BLOCK"
v2.LUCKY_BLOCK = "LUCKY_BLOCK"
v3.SKYWARS = "SKYWARS"
v2.SKYWARS = "SKYWARS"
v3.DUELS = "DUELS"
v2.DUELS = "DUELS"
v3.BETA_5v5 = "BETA_5v5"
v2.BETA_5v5 = "BETA_5v5"
v3.BRIDGE_DUELS = "BRIDGE_DUELS"
v2.BRIDGE_DUELS = "BRIDGE_DUELS"
v3.CLAN = "CLAN"
v2.CLAN = "CLAN"
v3.PVP_ARENA = "PVP_ARENA"
v2.PVP_ARENA = "PVP_ARENA"
local v4 = {}
for v5, v6 in v3 do
    v4[v5] = v6
end
for v7, v8 in v1 do
    v4[v7] = v8
end
return {
    ["GlickoCategoryType"] = v3,
    ["GlickoCategory"] = v4
}