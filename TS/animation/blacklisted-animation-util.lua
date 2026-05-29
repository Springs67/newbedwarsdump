local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v4 = {
    v2.HALLOWEEN_ALTAR_JUMP,
    v2.HANNAH_JUMP_DOWN,
    v2.DAVEY_JUMP_DOWN,
    v2.SMOKE_JUMP_DOWN,
    v2.LARGE_FALL_1,
    v2.LARGE_FALL_2,
    v2.LARGE_FALL_3,
    v2.STATUE,
    v2.ASCEND,
    v2.TRIUMPH_STATUE_1,
    v2.TRIUMPH_STATUE_2,
    v2.TRIUMPH_STATUE_3,
    v2.TRIUMPH_STATUE_4,
    v2.TRIUMPH_STATUE_1_FRAME,
    v2.TRIUMPH_STATUE_2_FRAME,
    v2.TRIUMPH_STATUE_3_FRAME,
    v2.TRIUMPH_STATUE_4_FRAME,
    v2.BLASTING_OFF_AGAIN_0,
    v2.BLASTING_OFF_AGAIN_1,
    v2.BLASTING_OFF_AGAIN_2,
    v2.BLASTING_OFF_AGAIN_3,
    v2.BLASTING_OFF_AGAIN_4,
    v2.HEAVEN_ASCEND,
    v2.SPIRIT_ASSASSIN_KILL_EFFECT_PLAYER,
    v2.FLOAT_AWAY_HIT,
    v2.FLOAT_AWAY_LOOP,
    v2.HALLOWEEN_BOSS_SPAWN,
    v2.HALLOWEEN_BOSS_SUMMON
}
local v5 = table.create(#v4)
local v6 = {}
for v7, v8 in v4 do
    local _ = v7 - 1
    v5[v7] = v3:getAssetId(v8)
end
for _, v9 in v5 do
    v6[v9] = true
end
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "BlacklistedAnimationUtil"
    end
})
u10.__index = u10
function u10.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(_) --[[ Line: 35 ]] end
u10.ANIMATION_ID_BLACKLIST = v6
return {
    ["BlacklistedAnimationUtil"] = u10
}