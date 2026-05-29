local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.ALIVE_PLAYERS = "players_alive"
v1.players_alive = "ALIVE_PLAYERS"
v2.BEDS = "beds"
v1.beds = "BEDS"
v2.SCORE = "score"
v1.score = "SCORE"
v2.BRIDGE_DUEL_SCORE = "bridge_duel_score"
v1.bridge_duel_score = "BRIDGE_DUEL_SCORE"
v2.LASSO_WARS_SCORE = "lasso_wars_score"
v1.lasso_wars_score = "LASSO_WARS_SCORE"
v2.PVP_ARENA = "pvp_arena"
v1.pvp_arena = "PVP_ARENA"
return {
    ["GameHudWidget"] = v2
}