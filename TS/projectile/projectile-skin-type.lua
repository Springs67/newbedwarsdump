local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.MUMMY_LASSO = "lasso_mummy"
v1.lasso_mummy = "MUMMY_LASSO"
v2.WRANGLER_REINDEER_LASSO = "lasso_wrangler_reindeer_lassy"
v1.lasso_wrangler_reindeer_lassy = "WRANGLER_REINDEER_LASSO"
v2.GOLD_VICTORIOUS_TRITON = "gold_victorious_triton"
v1.gold_victorious_triton = "GOLD_VICTORIOUS_TRITON"
v2.PLATINUM_VICTORIOUS_TRITON = "platinum_victorious_triton"
v1.platinum_victorious_triton = "PLATINUM_VICTORIOUS_TRITON"
v2.DIAMOND_VICTORIOUS_TRITON = "diamond_victorious_triton"
v1.diamond_victorious_triton = "DIAMOND_VICTORIOUS_TRITON"
v2.EMERALD_VICTORIOUS_TRITON = "emerald_victorious_triton"
v1.emerald_victorious_triton = "EMERALD_VICTORIOUS_TRITON"
v2.NIGHTMARE_VICTORIOUS_TRITON = "nightmare_victorious_triton"
v1.nightmare_victorious_triton = "NIGHTMARE_VICTORIOUS_TRITON"
v2.UMA_EASTER_ATTACK_SPIRIT = "uma_easter_attack_spirit"
v1.uma_easter_attack_spirit = "UMA_EASTER_ATTACK_SPIRIT"
v2.UMA_EASTER_HEAL_SPIRIT = "uma_easter_heal_spirit"
v1.uma_easter_heal_spirit = "UMA_EASTER_HEAL_SPIRIT"
v2.LIFEGUARD_LASSO = "lasso_lifeguard"
v1.lasso_lifeguard = "LIFEGUARD_LASSO"
v2.DEMON_TRITON = "demon_triton"
v1.demon_triton = "DEMON_TRITON"
v2.SPIRIT_AGNI_CLUSTER_BOMB = "spirit_agni_cluster_bomb"
v1.spirit_agni_cluster_bomb = "SPIRIT_AGNI_CLUSTER_BOMB"
return {
    ["ProjectileSkin"] = v2
}