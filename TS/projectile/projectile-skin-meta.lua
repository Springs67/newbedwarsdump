local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-skin-type").ProjectileSkin
local u2 = {
    [v1.MUMMY_LASSO] = {
        ["projectileType"] = "lasso",
        ["modelName"] = "lasso_mummy"
    },
    [v1.WRANGLER_REINDEER_LASSO] = {
        ["projectileType"] = "lasso",
        ["modelName"] = "lasso_wrangler_reindeer_lassy"
    },
    [v1.GOLD_VICTORIOUS_TRITON] = {
        ["projectileType"] = "harpoon_projectile",
        ["modelName"] = "victorious_gold_triton"
    },
    [v1.PLATINUM_VICTORIOUS_TRITON] = {
        ["projectileType"] = "harpoon_projectile",
        ["modelName"] = "victorious_platinum_triton"
    },
    [v1.DIAMOND_VICTORIOUS_TRITON] = {
        ["projectileType"] = "harpoon_projectile",
        ["modelName"] = "victorious_diamond_triton"
    },
    [v1.EMERALD_VICTORIOUS_TRITON] = {
        ["projectileType"] = "harpoon_projectile",
        ["modelName"] = "victorious_emerald_triton"
    },
    [v1.NIGHTMARE_VICTORIOUS_TRITON] = {
        ["projectileType"] = "harpoon_projectile",
        ["modelName"] = "victorious_nightmare_triton"
    },
    [v1.DEMON_TRITON] = {
        ["projectileType"] = "harpoon_projectile",
        ["modelName"] = "demon_triton"
    },
    [v1.UMA_EASTER_ATTACK_SPIRIT] = {
        ["projectileType"] = "attack_spirit",
        ["modelName"] = "attack_spirit_easter"
    },
    [v1.UMA_EASTER_HEAL_SPIRIT] = {
        ["projectileType"] = "heal_spirit",
        ["modelName"] = "heal_spirit_easter"
    },
    [v1.LIFEGUARD_LASSO] = {
        ["projectileType"] = "lasso",
        ["modelName"] = "lasso_lifeguard"
    },
    [v1.SPIRIT_AGNI_CLUSTER_BOMB] = {
        ["projectileType"] = "cluster_bomb",
        ["modelName"] = "spirit_grenade"
    }
}
return {
    ["getProjectileSkinMeta"] = function(p3) --[[ Name: getProjectileSkinMeta, Line 54 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2[p3]
    end,
    ["ProjectileSkinMeta"] = u2
}