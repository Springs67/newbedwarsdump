local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MathExtras
local u6 = {
    ["MAX_SCALE"] = 7.5,
    ["BLOCKS_TO_REACH_MAX_SCALE"] = 10000,
    ["SPEED"] = 34,
    ["MIN_DESTROY_RADIUS"] = 12,
    ["MAX_DESTROY_RADIUS"] = 30,
    ["BLOCK_COUNT_ATTRIBUTE"] = "SnowballRiderWinEffect_BlockCount",
    ["ABILITY_PROJECTILE_TYPE"] = "mega_frozen_snowball",
    ["getScale"] = function(p2, p3) --[[ Name: getScale, Line 22 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u1
        --]]
        local v4 = p3 / u6.BLOCKS_TO_REACH_MAX_SCALE
        local v5 = math.clamp(v4, 0, 1)
        return u1:lerp(p2, u6.MAX_SCALE, v5)
    end
}
return {
    ["SnowballWinEffectUtil"] = u6
}