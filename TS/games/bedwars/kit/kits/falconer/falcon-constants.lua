local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SPAWNING = 0
v1[0] = "SPAWNING"
v2.RECALLED = 1
v1[1] = "RECALLED"
v2.SCOUTING = 2
v1[2] = "SCOUTING"
v2.AGGRO = 3
v1[3] = "AGGRO"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.T1 = 0
v3[0] = "T1"
v4.T2 = 1
v3[1] = "T2"
v4.T3 = 2
v3[2] = "T3"
v4.T4 = 3
v3[3] = "T4"
return {
    ["BIRD_HITPOINTS"] = 100,
    ["STRIKE_ZONE_RADIUS"] = 60,
    ["RECALL_SPEED"] = 80,
    ["SCOUTING_SPEED"] = 45,
    ["AGGRO_SPEED"] = 60,
    ["ATTACK_INTERVAL"] = 3,
    ["ATTACK_RANGE"] = 8,
    ["ATTACK_DAMAGE"] = 14,
    ["SCOUTING_HEIGHT"] = 60,
    ["SCOUTING_RADIUS"] = 60,
    ["MIN_DISTANCE_TO_TELEPORT"] = 50,
    ["MIN_MOVE_DISTANCE_TO_TARGET"] = 3,
    ["MIN_Y"] = -100,
    ["SEND_BIRD_COOLDOWN"] = 5,
    ["SEND_BIRD_RANGE"] = 300,
    ["SEND_BIRD_MIN_HEALTH"] = 100,
    ["FORCE_RECALL_DISTANCE"] = 250,
    ["BIRD_POSITION_SYNC_INTERVAL"] = 3,
    ["FalconState"] = v2,
    ["FalconTier"] = v4,
    ["FalconMeta"] = {
        [v4.T1] = {
            ["hitPoints"] = 100,
            ["attackDamage"] = 14
        },
        [v4.T2] = {
            ["hitPoints"] = 140,
            ["attackDamage"] = 16
        },
        [v4.T3] = {
            ["hitPoints"] = 180,
            ["attackDamage"] = 18
        },
        [v4.T4] = {
            ["hitPoints"] = 220,
            ["attackDamage"] = 20
        }
    },
    ["FalconAction"] = setmetatable({}, {
        ["__index"] = {}
    })
}