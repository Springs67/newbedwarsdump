local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
return {
    ["SpiderQueenBalance"] = {
        ["MAX_SPIDERLINGS"] = 4,
        ["WEB_BLOCK_LIFETIME"] = 35,
        ["WEB_BLOCK_FADE_DURATION"] = 5,
        ["WEB_BRIDGE_MAX_RANGE"] = v1 * 17,
        ["SPIDERLING_MAX_SPAWN_RANGE"] = v1 * 17,
        ["SPIDER_WEB_SLOW_DURATION"] = 5,
        ["SPIDER_WEB_SLOW_PER_STACK"] = 0.15,
        ["SPIDER_WEB_SLOW_MAX_STACKS"] = 3,
        ["SPIDERLING_LIFETIME"] = 8,
        ["SPIDERLING_BASE_HEALTH"] = 30,
        ["SPIDERLING_BASE_DAMAGE"] = 4,
        ["SPIDERLING_MAX_HEALTH"] = 80,
        ["SPIDERLING_MAX_DAMAGE"] = 15,
        ["SPIDERLING_ATTACK_RANGE"] = v1 * 3,
        ["SPIDERLING_ATTACK_ARMOR_MULTIPLIER"] = 0.6,
        ["scaleSpiderlingHealth"] = function(p2) --[[ Line: 37 ]]
            local v3 = 30 + p2 * 2
            return math.min(80, v3)
        end,
        ["scaleSpiderlingDamage"] = function(p4) --[[ Line: 41 ]]
            local v5 = 4 + p4 * 0.5
            return math.min(15, v5)
        end
    }
}