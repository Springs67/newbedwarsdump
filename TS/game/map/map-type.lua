local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.BEDWARS_SQUADS = "to4"
v2.to4 = "BEDWARS_SQUADS"
v3.BEDWARS_DOUBLES = "to2"
v2.to2 = "BEDWARS_DOUBLES"
v3.BEDWARS_DUELS = "duels"
v2.duels = "BEDWARS_DUELS"
v3.BEDWARS_THIRTY_VS_THIRTY = "to30"
v2.to30 = "BEDWARS_THIRTY_VS_THIRTY"
v3.BEDWARS_FIVE_VS_FIVE = "to5"
v2.to5 = "BEDWARS_FIVE_VS_FIVE"
v3.OG_BEDWARS = "to4OG"
v2.to4OG = "OG_BEDWARS"
v3.BEDWARS_NO_BUILD_4 = "nb4"
v2.nb4 = "BEDWARS_NO_BUILD_4"
v3.BEDWARS_RANKED_S16 = "to4_ranked_s16"
v2.to4_ranked_s16 = "BEDWARS_RANKED_S16"
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.SKYWARS = "sw"
v4.sw = "SKYWARS"
v5.SKYWARS_SQUADS = "sw4"
v4.sw4 = "SKYWARS_SQUADS"
v5.SKYWARS_ROYALE = "swroyale"
v4.swroyale = "SKYWARS_ROYALE"
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.FLAG_CAPTURE_MAP_TYPE = "ctf_to12"
v6.ctf_to12 = "FLAG_CAPTURE_MAP_TYPE"
local v8 = {}
local v9 = setmetatable({}, {
    ["__index"] = v8
})
v9.DOMINATION_MAP_TYPE = "domination"
v8.domination = "DOMINATION_MAP_TYPE"
local v10 = {}
local v11 = setmetatable({}, {
    ["__index"] = v10
})
v11.JUGGERNAUT_TDM = "jugg_tdm"
v10.jugg_tdm = "JUGGERNAUT_TDM"
v11.JUGGERNAUT_FFA = "jugg_ffa"
v10.jugg_ffa = "JUGGERNAUT_FFA"
local v12 = {}
local v13 = setmetatable({}, {
    ["__index"] = v12
})
v13.ROYALE = "royale"
v12.royale = "ROYALE"
v13.INFECTED = "infected"
v12.infected = "INFECTED"
v13.PVE = "pve"
v12.pve = "PVE"
v13.GUN_GAME = "gg"
v12.gg = "GUN_GAME"
v13.TNT_WARS = "tnt"
v12.tnt = "TNT_WARS"
v13.BLOCK_HUNT = "bh"
v12.bh = "BLOCK_HUNT"
v13.MURDER_GAME = "nm"
v12.nm = "MURDER_GAME"
v13.BRIDGE_DUEL = "bridgeDuel"
v12.bridgeDuel = "BRIDGE_DUEL"
v13.EGG_HUNT = "egg"
v12.egg = "EGG_HUNT"
v13.LASSO_WARS = "LassoWars"
v12.LassoWars = "LASSO_WARS"
v13.PVP_ARENA = "pvpArena"
v12.pvpArena = "PVP_ARENA"
v13.BED_ROYALE = "bedRoyale"
v12.bedRoyale = "BED_ROYALE"
v13.MINE_WARS = "mw"
v12.mw = "MINE_WARS"
local u14 = {}
for v15, v16 in v3 do
    u14[v15] = v16
end
for v17, v18 in v5 do
    u14[v17] = v18
end
for v19, v20 in v13 do
    u14[v19] = v20
end
for v21, v22 in v7 do
    u14[v21] = v22
end
for v23, v24 in v11 do
    u14[v23] = v24
end
for v25, v26 in v9 do
    u14[v25] = v26
end
return {
    ["BedwarsMapType"] = v3,
    ["SkywarsMapType"] = v5,
    ["FlagCaptureMapType"] = v7,
    ["DominationMapType"] = v9,
    ["JuggernautMapType"] = v11,
    ["MiscMapType"] = v13,
    ["MapType"] = u14,
    ["getMapTypeFromPrefix"] = function(p27) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u14
        --]]
        local v28 = nil
        for v29, v30 in u1.entries(u14) do
            local _ = v29 - 1
            local _ = v30[1]
            if p27 == v30[2] == true then
                v28 = v30
                break
            end
        end
        if v28 ~= nil then
            v28 = v28[2]
        end
        return v28
    end
}