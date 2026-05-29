local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "overpowered", "overpowered-game-balance").OverpoweredGameBalance
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants")
local u6 = v5.GOLEM_BUFF_TYPES
local v7 = v5.TITAN_BLESSING_RECALL_REDUCTION
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-util").getCurrentQueueType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local v12 = {
    ["WORMHOLE_CHANNEL_TIME"] = 6,
    ["WORMHOLE_STUDS_FROM_CAST"] = 2,
    ["WORMHOLE_COOLDOWN"] = 2
}
local u13 = 6 * (v7 / 100)
function v12.getWormholeChannelTime(p14) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
        [3] = u8
        [4] = u3
        [5] = u13
        [6] = u4
    --]]
    if p14 and u11:hasAnyActive(p14, u6) then
        if u8() == u3.OVERPOWERED then
            return u13 * u4.RecallTimeMultiplier
        else
            return u13
        end
    else
        return u8() ~= u3.OVERPOWERED and 6 or 6 * u4.RecallTimeMultiplier
    end
end
function v12.getWormholeRecallEffect(p15) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u2
    --]]
    if u11:isActive(p15, u10.TITANS_BLESSING) then
        return u2.Assets.Effects.RecallTitan
    elseif u11:isActive(p15, u10.SPIRIT_TITANS_BLESSING) then
        return u2.Assets.Effects.RecallTitanSpirit
    elseif u11:isActive(p15, u10.VOID_TITANS_BLESSING) then
        return u2.Assets.Effects.RecallTitanVoid
    else
        return u2.Assets.Effects.Recall
    end
end
function v12.getWormholeSound(p16) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u9
    --]]
    if u11:isActive(p16, u10.SPIRIT_TITANS_BLESSING) then
        return u9.SPIRIT_TITAN_RECALL
    elseif u11:isActive(p16, u10.VOID_TITANS_BLESSING) then
        return u9.VOID_TITAN_RECALL
    else
        return u9.WORMHOLE_TELEPORT
    end
end
function v12.getWormholeLoopSound(p17) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u9
    --]]
    if u11:isActive(p17, u10.SPIRIT_TITANS_BLESSING) then
        return u9.SPIRIT_TITAN_RECALL_LOOP
    elseif u11:isActive(p17, u10.VOID_TITANS_BLESSING) then
        return u9.VOID_TITAN_RECALL_LOOP
    else
        return u9.WORMHOLE_USE
    end
end
return {
    ["WormholeUtil"] = v12
}