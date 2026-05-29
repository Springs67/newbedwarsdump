local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.WEB_PULL = 0
v1[0] = "WEB_PULL"
v2.WEB_RELEASE = 1
v1[1] = "WEB_RELEASE"
v2.WEB_DEPLOY = 2
v1[2] = "WEB_DEPLOY"
v2.WEB_SHOOT = 3
v1[3] = "WEB_SHOOT"
v2.SLASH = 4
v1[4] = "SLASH"
v2.LEG_SPIKE = 5
v1[5] = "LEG_SPIKE"
v2.RELOCATE = 6
v1[6] = "RELOCATE"
v2.SLICE = 7
v1[7] = "SLICE"
v2.VOID_GAME = 8
v1[8] = "VOID_GAME"
return {
    ["Halloween2024BossAction"] = v2,
    ["Halloween2024BossConfigs"] = {
        ["getRandomNumberOfSegments"] = function() --[[ Name: getRandomNumberOfSegments, Line 40 ]]
            return math.random(3, 5)
        end,
        ["getWebPullDistance"] = function() --[[ Name: getWebPullDistance, Line 45 ]]
            return math.random(135, 240)
        end,
        ["WEB_PULL_DELAY"] = 3,
        ["WEB_PULL_DURATION"] = 5,
        ["WEB_PULL_TICK_DAMAGE_INTERVAL"] = 1,
        ["WEB_PULL_TICK_DAMAGE"] = 10,
        ["WEB_PULL_PLAYER_HITBOX_SIZE_MULTIPLIER"] = 1.25,
        ["BASE_LEG_SPIKE_DELAY"] = 1.25,
        ["COBWEB_TAG"] = "spider-queen-web-block",
        ["COBWEB_MAX_SPIDERS"] = 8,
        ["COBWEB_LIFETIME"] = 15,
        ["BOSS_SPAWN_DELAY"] = 1.6,
        ["RELOCATE_ASCEND_DURATION"] = 1,
        ["RELOCATE_Y_HEIGHT_OFFSET"] = 100,
        ["RELOCATE_STOMP_DELAY"] = 2.5,
        ["RELOCATE_DESCEND_DURATION"] = 1,
        ["RELOCATE_STOMP_DAMAGE_RADIUS"] = 50,
        ["RELOCATE_STOMP_DAMAGE"] = 30,
        ["RELOCATE_STOMP_KNOCKBACK"] = 4,
        ["SLICE_DAMAGE"] = 35,
        ["SLICE_RANGE_INITIATE"] = 28,
        ["FOG_RAISE_DURATION"] = 7.5,
        ["FOG_RAISED_HOLD_DURATION"] = 1.35,
        ["FOG_LOWER_DURATION"] = 2.5,
        ["FOG_PLATFORM_START_HEIGHT"] = 175
    }
}