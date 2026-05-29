local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u10 = { 180, 480, 720 }
local u11 = { 5, 60 }
local u12 = {
    60,
    180,
    360,
    600,
    900
}
local v13 = {
    v8.BEDWARS_TO1,
    v8.BEDWARS_TO2,
    v8.BEDWARS_TO4,
    v8.BEDWARS_VOICE_CHAT,
    v8.BEDWARS_20v20,
    v8.BEDWARS_20v20_LB,
    v8.BEDWARS_16v16,
    v8.BEDWARS_LUCKY_BLOCK,
    v8.BEDWARS_LUCKY_BLOCK_TO2,
    v8.BEDWARS_5v5,
    v8.HYPER_GEN_TO4,
    v8.BEDWARS_NB4,
    v8.BEDWARS_MEGA,
    v9.activeRankMeta.queueType,
    v8.COMBINED_KIT_TO4,
    v8.ALL_RANDOM_KIT_TO4,
    v8.CUSTOM_KIT,
    v8.OVERPOWERED
}
local v14 = 5 * v6
local v15 = 3 * v6
local v16 = {}
local v17 = setmetatable({}, {
    ["__index"] = v16
})
v17.SPAWNING = 0
v16[0] = "SPAWNING"
v17.IDLE = 1
v16[1] = "IDLE"
v17.WANDER = 2
v16[2] = "WANDER"
v17.AGGRO = 3
v16[3] = "AGGRO"
local v18 = {}
local v19 = setmetatable({}, {
    ["__index"] = v18
})
v19.MOVE = "move"
v18.move = "MOVE"
v19.FOLLOW_ATTACK = "follow_attack"
v18.follow_attack = "FOLLOW_ATTACK"
v19.ATTACK = "attack"
v18.attack = "ATTACK"
v19.REMOVE_TARGET = "remove_target"
v18.remove_target = "REMOVE_TARGET"
return {
    ["GUARDIAN_HITPOINTS"] = 450,
    ["GUARDIAN_MOVE_SPEED"] = 9,
    ["GUARDIAN_ATTACK_MOVE_SPEED"] = 12,
    ["DIAMONDS_PER_KILL"] = 3,
    ["GUARDIAN_WANDER_RADIUS"] = 14,
    ["GUARDIAN_ATTACK_COOLDOWN"] = 2,
    ["GUARDIAN_TURN_RATE"] = 0.15,
    ["GUARDIAN_ATTACK_DAMAGE"] = 8,
    ["GUARDIAN_DAMAGE_DELAY"] = 0.5,
    ["GUARDIAN_LATENCY_COMPENSATION"] = 0.001,
    ["GUARDIAN_TURN_DURATION"] = 0.25,
    ["VALID_MOB_QUEUE_TYPES"] = v13,
    ["GUARDIAN_IDLE_TIME_RANGE"] = { 1, 3 },
    ["GUARDIAN_AGGRO_RADIUS"] = v14,
    ["GUARDIAN_ATTACK_RANGE"] = v15,
    ["DiamondGuardianState"] = v17,
    ["DiamondGuardianAction"] = v19,
    ["getDiamondGuardianSpawnTimes"] = function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u4
            [4] = u7
            [5] = u12
            [6] = u11
            [7] = u10
        --]]
        local v20 = nil
        if u5:IsClient() then
            local v21 = u3.Controllers.MatchController
            if v21 then
                v20 = v21:getQueueType()
            end
        elseif u5:IsServer() then
            local v22 = u4.Services.MatchService
            if v22 then
                v20 = v22:getMatchConfig()
                if v20 ~= nil then
                    v20 = v20.queueType
                end
            end
        end
        if v20 and u7(v20).hyperGenGamemode then
            return u12
        else
            local v23
            if v20 then
                local v24 = u7(v20).eventTimeOverrides
                if v24 ~= nil then
                    v24 = v24.diamondGuardians
                end
                v23 = v24 ~= nil
            else
                v23 = v20
            end
            if v23 then
                return u7(v20).eventTimeOverrides.diamondGuardians
            elseif u5:IsStudio() then
                return u11
            else
                return u10
            end
        end
    end
}