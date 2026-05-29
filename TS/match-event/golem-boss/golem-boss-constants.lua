local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u12 = {
    ["initialSpawnTime"] = 780,
    ["timeBetweenSpawns"] = 300
}
local u13 = {
    ["initialSpawnTime"] = 20,
    ["timeBetweenSpawns"] = 500
}
local u14 = {
    ["initialSpawnTime"] = 300,
    ["timeBetweenSpawns"] = 120
}
local u15 = {
    ["initialSpawnTime"] = 360,
    ["timeBetweenSpawns"] = 180
}
local u16 = {
    u8.BEDWARS_TO1,
    u8.BEDWARS_TO2,
    u8.BEDWARS_TO4,
    u8.BEDWARS_VOICE_CHAT,
    u8.BEDWARS_20v20,
    u8.BEDWARS_16v16,
    u8.BEDWARS_20v20_LB,
    u8.BEDWARS_LUCKY_BLOCK,
    u8.BEDWARS_LUCKY_BLOCK_TO2,
    u8.BEDWARS_5v5,
    u8.HYPER_GEN_TO4,
    u8.BEDWARS_NB4,
    u8.BEDWARS_MEGA,
    v9.activeRankMeta.queueType,
    u8.COMBINED_KIT_TO4,
    u8.ALL_RANDOM_KIT_TO4,
    u8.CUSTOM_KIT,
    u8.MINE_WARS,
    u8.OVERPOWERED
}
local v17 = -3 * v6
local v18 = Vector3.new(0, v17, 0)
local v19 = 3 * v6
local v20 = Vector3.new(v6, v6, v6)
local v21 = v6 * 2
local v22 = 6 * v6
local v23 = 6 * v6
local v24 = {
    v10.TITAN_FOOTSTEP_1,
    v10.TITAN_FOOTSTEP_2,
    v10.TITAN_FOOTSTEP_3,
    v10.TITAN_FOOTSTEP_4
}
local v25 = {
    v10.TITAN_BLOCK_DISLODGE_1,
    v10.TITAN_BLOCK_DISLODGE_2,
    v10.TITAN_BLOCK_DISLODGE_3,
    v10.TITAN_BLOCK_DISLODGE_4
}
local v26 = {
    v10.TITAN_IDLE_1,
    v10.TITAN_IDLE_2,
    v10.TITAN_IDLE_3,
    v10.TITAN_IDLE_4
}
local v27 = { v11.TITANS_BLESSING, v11.SPIRIT_TITANS_BLESSING, v11.VOID_TITANS_BLESSING }
local v28 = 10 * v6
local v29 = {}
local v30 = setmetatable({}, {
    ["__index"] = v29
})
v30.PATROL = 0
v29[0] = "PATROL"
v30.SPAWNING = 1
v29[1] = "SPAWNING"
v30.IDLE = 2
v29[2] = "IDLE"
v30.ROTATING = 3
v29[3] = "ROTATING"
local v31 = {}
local v32 = setmetatable({}, {
    ["__index"] = v31
})
v32.PATROL_TURN = "patrol_turn"
v31.patrol_turn = "PATROL_TURN"
v32.FIST_SLAM = "fist_slam"
v31.fist_slam = "FIST_SLAM"
v32.HAMMER_SLAM = "hammer_slam"
v31.hammer_slam = "HAMMER_SLAM"
v32.PILLAR_SUMMON = "pillar_summon"
v31.pillar_summon = "PILLAR_SUMMON"
v32.VOID_PORTAL_ATTACK = "void_portal_attack"
v31.void_portal_attack = "VOID_PORTAL_ATTACK"
v32.SKORP_SUMMON = "skorp_summon"
v31.skorp_summon = "SKORP_SUMMON"
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 233 ]]
        return "GolemBossConstants"
    end
})
u33.__index = u33
function u33.new(...) --[[ Line: 238 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(_) --[[ Line: 242 ]] end
function u33.getBossSpawnConfig(_) --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u4
        [4] = u7
        [5] = u14
        [6] = u8
        [7] = u15
        [8] = u13
        [9] = u12
    --]]
    local v36 = nil
    if u5:IsClient() then
        local v37 = u3.Controllers.MatchController
        if v37 then
            v36 = v37:getQueueType()
        end
    elseif u5:IsServer() then
        local v38 = u4.Services.MatchService
        if v38 then
            v36 = v38:getMatchConfig()
            if v36 ~= nil then
                v36 = v36.queueType
            end
        end
    end
    if v36 and u7(v36).hyperGenGamemode then
        return u14
    elseif v36 == u8.MINE_WARS then
        return u15
    else
        local v39
        if v36 then
            local v40 = u7(v36).eventTimeOverrides
            if v40 ~= nil then
                v40 = v40.titan
            end
            v39 = v40 ~= nil
        else
            v39 = v36
        end
        if v39 then
            return u7(v36).eventTimeOverrides.titan
        elseif u5:IsStudio() then
            return u13
        else
            return u12
        end
    end
end
return {
    ["VALID_BOSS_QUEUE_TYPES"] = u16,
    ["GOLEM_PLATFORM_SIZE_BLOCKS"] = 7,
    ["GROUND_Y_OFFSET"] = v18,
    ["GOLEM_HITPOINTS"] = 4300,
    ["GOLEM_INITIAL_IDLE_TIME"] = 1,
    ["GOLEM_IDLE_TIME_RANGE"] = { 2, 3 },
    ["GOLEM_TURN_DURATION"] = 2,
    ["SHOCKWAVE_INTERVAL"] = 0.14,
    ["GOLEM_SLAM_WEIGHT"] = 55,
    ["GOLEM_SLAM_RADIUS"] = v19,
    ["GOLEM_BOSS_SLAM_RANGE"] = 4,
    ["GOLEM_SLAM_DURATION"] = 1.5,
    ["GOLEM_SLAM_HITBOX_SIZE"] = Vector3.new(11, 9, 11),
    ["GOLEM_SLAM_DAMAGE"] = 20,
    ["GOLEM_SLAM_KNOCKBACK"] = Vector3.new(100, 25, 100),
    ["GOLEM_SHOCKWAVE_HITBOX_SIZE"] = v20,
    ["GOLEM_SHOCKWAVE_DAMAGE"] = 15,
    ["GOLEM_SHOCKWAVE_KNOCKBACK"] = Vector3.new(25, 300, 25),
    ["GOLEM_HAMMER_WEIGHT"] = 35,
    ["GOLEM_HAMMER_DURATION"] = 1.25,
    ["GOLEM_BLOCK_BREAK_INTERVAL"] = 1,
    ["GOLEM_REPULSION_INTERVAL"] = 0.22,
    ["GOLEM_REPULSION_RANGE"] = v21,
    ["GOLEM_REPULSION_DAMAGE"] = 3,
    ["GOLEM_REPULSION_KNOCKBACK"] = Vector3.new(25, 25, 25),
    ["GOLEM_PILLAR_SUMMON_WEIGHT"] = 20,
    ["GOLEM_HAMMER_RAISE_DURATION"] = 2,
    ["GOLEM_PILLAR_DEPTH"] = 1,
    ["GOLEM_PILLAR_HEIGHT"] = 2,
    ["GOLEM_PILLAR_SCHEMATICS"] = {
        {
            0,
            45,
            -45,
            90,
            -90,
            -135.1
        }
    },
    ["GOLEM_PILLAR_OFFSET_FROM_CENTER"] = v22,
    ["GOLEM_PILLAR_LAYER_SPAWN_DELAY"] = 0.075,
    ["GOLEM_PILLAR_DAMAGE"] = 12,
    ["GOLEM_PILLAR_KNOCKBACK"] = Vector3.new(25, 50, 25),
    ["GOLEM_PILLAR_HITBOX_SIZE"] = Vector3.new(12, 12, 12),
    ["GOLEM_PILLAR_BLOCK_TAG"] = "GolemPillarBlock",
    ["GOLEM_HEAL_TOTEM_SCHEMATICS"] = {
        {
            67.55,
            -67.55,
            0,
            -135.1
        }
    },
    ["GOLEM_HEAL_TOTEM_OFFSET_FROM_CENTER"] = v23,
    ["GOLEM_HEAL_TOTEM_SUMMON_DURATION"] = 2.25,
    ["GOLEM_HEAL_TOTEM_HEALTH"] = 500,
    ["GOLEM_HEAL_TOTEM_HEAL_PER_TICK"] = 50,
    ["GOLEM_HEAL_TOTEM_SPAWN_DELAY"] = 2,
    ["GOLEM_HEAL_TOTEM_SPAWN_HP_TRIGGER"] = 0.6,
    ["GOLEM_CLIENT_SOUND_DELAY"] = 0.4,
    ["BHAA_SUMMON"] = 20,
    ["GOLEM_FOOTSTEP_SOUNDS"] = v24,
    ["GOLEM_DISLODGE_SOUNDS"] = v25,
    ["GOLEM_IDLE_SOUNDS"] = v26,
    ["GOLEM_BUFF_TYPES"] = v27,
    ["TITAN_BLESSING_RECALL_REDUCTION"] = 50,
    ["SPIRIT_GOLEM_BLESSING_MAX_HEAL_PERCENT"] = 5,
    ["SPIRIT_GOLEM_BLESSING_TICK_RATE"] = 5,
    ["VOID_GOLEM_TRUE_DAMAGE_PERCENT"] = 5,
    ["TITAN_BLESSING_DAMAGE_PERCENT_INCREASE"] = 17.5,
    ["GOLEM_VARIANT_BLESSING_DAMAGE_PERCENT_INCREASE"] = 15,
    ["VOID_GOLEM_PORTALS_PER_ATTACK"] = 9,
    ["VOID_GOLEM_LASER_DELAY"] = 1,
    ["VOID_GOLEM_LASER_DURATION"] = 5,
    ["VOID_GOLEM_LASER_TICK_RATE"] = 0.25,
    ["VOID_GOLEM_LASER_DAMAGE"] = 6,
    ["GOLEM_DISLODGE_SOUND_CHANCE"] = 20,
    ["GOLEM_IDLE_SOUND_CHANCE"] = 25,
    ["GOLEM_SCREEN_SHAKE_THRESHOLD"] = v28,
    ["GOLEM_PROJECTILE_PENALTY"] = 0.25,
    ["GolemBossState"] = v30,
    ["GolemBossAction"] = v32,
    ["getBossHitpoints"] = function(p41) --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u8
        --]]
        if table.find(u16, p41) == nil then
            return 4300
        end
        local v42 = p41 == u8.BEDWARS_TO1 and 2150 or 4300
        local v43 = p41 == u8.BEDWARS_TO2 and 3225 or v42
        local v44 = p41 == u8.BEDWARS_TO4 and 4300 or v43
        local v45 = p41 == u8.BEDWARS_20v20 and 12900 or v44
        local v46 = p41 == u8.BEDWARS_20v20_LB and 12900 or v45
        local v47 = p41 == u8.BEDWARS_LUCKY_BLOCK and 4300 or v46
        local v48 = p41 == u8.BEDWARS_LUCKY_BLOCK_TO2 and 3225 or v47
        return math.round(v48)
    end,
    ["GolemBossConstants"] = u33,
    ["VoidGolemBossConstants"] = {
        ["VOID_GOLEM_FOOTSTEP_SOUNDS"] = {
            v10.VOID_TITAN_FOOTSTEP_1,
            v10.VOID_TITAN_FOOTSTEP_2,
            v10.VOID_TITAN_FOOTSTEP_3,
            v10.VOID_TITAN_FOOTSTEP_4
        },
        ["VOID_GOLEM_DISLODGE_SOUNDS"] = {
            v10.VOID_TITAN_BLOCK_DISLODGE_1,
            v10.VOID_TITAN_BLOCK_DISLODGE_2,
            v10.VOID_TITAN_BLOCK_DISLODGE_3,
            v10.VOID_TITAN_BLOCK_DISLODGE_4
        },
        ["VOID_GOLEM_IDLE_SOUNDS"] = {
            v10.VOID_TITAN_IDLE_1,
            v10.VOID_TITAN_IDLE_2,
            v10.VOID_TITAN_IDLE_3,
            v10.VOID_TITAN_IDLE_4
        },
        ["VOID_GOLEM_PORTAL_OPEN_SOUNDS"] = {
            v10.VOID_TITAN_PORTAL_OPEN_1,
            v10.VOID_TITAN_PORTAL_OPEN_2,
            v10.VOID_TITAN_PORTAL_OPEN_3,
            v10.VOID_TITAN_PORTAL_OPEN_4
        },
        ["VOID_GOLEM_PORTAL_ANIMATION_DELAY"] = 2,
        ["VOID_GOLEM_TIME_BETWEEN_PORTALS"] = 0.2
    },
    ["SpiritGolemBossConstants"] = {
        ["SPIRIT_GOLEM_FOOTSTEP_SOUNDS"] = {
            v10.SPIRIT_TITAN_FOOTSTEP_1,
            v10.SPIRIT_TITAN_FOOTSTEP_2,
            v10.SPIRIT_TITAN_FOOTSTEP_3,
            v10.SPIRIT_TITAN_FOOTSTEP_4
        },
        ["SPIRIT_GOLEM_DISLODGE_SOUNDS"] = {
            v10.SPIRIT_TITAN_BLOCK_DISLODGE_1,
            v10.SPIRIT_TITAN_BLOCK_DISLODGE_2,
            v10.SPIRIT_TITAN_BLOCK_DISLODGE_3,
            v10.SPIRIT_TITAN_BLOCK_DISLODGE_4
        },
        ["SPIRIT_GOLEM_IDLE_SOUNDS"] = {
            v10.SPIRIT_TITAN_IDLE_1,
            v10.SPIRIT_TITAN_IDLE_2,
            v10.SPIRIT_TITAN_IDLE_3,
            v10.SPIRIT_TITAN_IDLE_4
        }
    }
}