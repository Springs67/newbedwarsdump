local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u7 = {
    ["initialSpawnTime"] = 330,
    ["timeBetweenSpawns"] = 360,
    ["numberOfSpawns"] = 2
}
local u8 = {
    ["initialSpawnTime"] = 10,
    ["timeBetweenSpawns"] = 15,
    ["numberOfSpawns"] = 2
}
local v9 = {}
local v10 = setmetatable({}, {
    ["__index"] = v9
})
v10.FLIP_GROUND = "flip_ground"
v9.flip_ground = "FLIP_GROUND"
v10.MISSILE_BARRAGE = "missile_barrage"
v9.missile_barrage = "MISSILE_BARRAGE"
v10.PATROL_TURN = "patrol_turn"
v9.patrol_turn = "PATROL_TURN"
v10.UNBURROW = "unburrow"
v9.unburrow = "UNBURROW"
v10.BASIC_ATTACK = "basic_attack"
v9.basic_attack = "BASIC_ATTACK"
local v11 = {}
local v12 = setmetatable({}, {
    ["__index"] = v11
})
v12.PATROL = 0
v11[0] = "PATROL"
v12.SPAWNING = 1
v11[1] = "SPAWNING"
v12.IDLE = 2
v11[2] = "IDLE"
v12.ROTATING = 3
v11[3] = "ROTATING"
v12.UNDERGROUND = 4
v11[4] = "UNDERGROUND"
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 55 ]]
        return "GoldenGooseConstants"
    end
})
u13.__index = u13
function u13.new(...) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(_) --[[ Line: 64 ]] end
function u13.getBossSpawnConfig(_) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u7
    --]]
    if u5:IsStudio() then
        return u8
    else
        return u7
    end
end
function u13.getBossHealth(p16) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v17 = p16:getQueueType()
    local v18 = not v17 and 4 or u6[v17].teams[1].maxPlayers
    return v18 <= 1 and 1250 or (v18 <= 2 and 1850 or (v18 >= 10 and 5000 or 2500))
end
function u13.getQueueType(_) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u4
    --]]
    local v19 = nil
    if u5:IsClient() then
        local v20 = u3.Controllers.MatchController
        if v20 then
            return v20:getQueueType()
        end
    elseif u5:IsServer() then
        local v21 = u4.Services.MatchService
        if v21 then
            v19 = v21:getMatchConfig()
            if v19 ~= nil then
                v19 = v19.queueType
            end
        end
    end
    return v19
end
u13.GOLDEN_GOOSE_LIFETIME_SEC = 180
u13.SECONDS_PER_BUFF_STACK = 30
u13.GOOSE_STEAL_BUFF_DURATION_SEC = 3
u13.ACTION_DIG_WEIGHT = 20
u13.ACTION_DIG_COOLDOWN_SEC = 8
u13.ACTION_BARRAGE_WEIGHT = 20
u13.ACTION_BARRAGE_COOLDOWN_SEC = 5
u13.ACTION_BARRAGE_LAUNCH_TIMES = {
    1.0833333333333333,
    1.3166666666666667,
    1.6,
    1.95,
    2.216666666666667
}
u13.BURROW_DURATION_MULTI_TEAM = 30
u13.BURROW_DURATION_SINGLE_TEAM = 5
u13.BURROW_HEALTH_THRESHOLD = 0.35
u13.UNBURROW_DURATION_SEC = 2
u13.MISSILE_FLIGHT_TIME_SEC = 1
u13.ACTION_BASIC_ATTACK_WEIGHT = 60
u13.INITIAL_IDLE_TIME = 1
u13.IDLE_TIME_RANGE = { 1, 1.5 }
u13.FLIP_GROUND_DURATION_SEC = 1.6333333333333333
return {
    ["GooseBossAction"] = v10,
    ["GooseBossState"] = v12,
    ["GoldenGooseConstants"] = u13
}