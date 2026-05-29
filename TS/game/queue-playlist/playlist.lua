local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.PVP = "pvp"
v5.pvp = "PVP"
v6.ARCADE = "arcade"
v5.arcade = "ARCADE"
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "QueuePlaylistHandler"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, p11, p12, p13) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p10.id = p11
    p10.queues = p12
    p10.config = p13
    if p13 ~= nil then
        p13 = p13.resetTime
    end
    local v14 = p13 == nil and 1683324000 or p13
    p10.resetTime = u2.new(v14)
end
function u7.getCurrQueue(p15) --[[ Line: 49 ]]
    local v16 = p15.resetTime
    local v17 = p15.config
    if v17 ~= nil then
        v17 = v17.rotateInterval
    end
    local v18 = v17 == nil and 7200 or v17
    local v19 = tonumber(v16:getResetId(v18))
    return p15.queues[v19 % #p15.queues + 1]
end
function u7.getNextQueue(p20) --[[ Line: 62 ]]
    local v21 = p20.resetTime
    local v22 = p20.config
    if v22 ~= nil then
        v22 = v22.rotateInterval
    end
    local v23 = v22 == nil and 7200 or v22
    local v24 = tonumber(v21:getResetId(v23)) + 1
    return p20.queues[v24 % #p20.queues + 1]
end
function u7.getNextRotationTime(p25) --[[ Line: 75 ]]
    local v26 = p25.resetTime
    local v27 = p25.config
    if v27 ~= nil then
        v27 = v27.rotateInterval
    end
    return v26:getNextResetTime(v27 == nil and 7200 or v27)
end
function u7.getQueues(p28) --[[ Line: 87 ]]
    return p28.queues
end
function u7.getResetData(p29) --[[ Line: 90 ]]
    return p29.resetTime
end
function u7.getId(p30) --[[ Line: 93 ]]
    return p30.id
end
function u7.getConfig(p31) --[[ Line: 96 ]]
    return p31.config
end
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 103 ]]
        return "QueuePlaylistHandlerManager"
    end
})
u32.__index = u32
function u32.new(...) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35, p36) --[[ Line: 112 ]]
    p35.playlists = {}
    for v37, v38 in p36 do
        local _ = v37 - 1
        p35.playlists[v38:getId()] = v38
    end
end
function u32.getPlaylist(p39, p40) --[[ Line: 125 ]]
    return p39.playlists[p40]
end
function u32.getPlaylists(p41) --[[ Line: 130 ]]
    return p41.playlists
end
function u32.registerHandler(p42, p43) --[[ Line: 133 ]]
    p42.playlists[p43:getId()] = p43
end
function u32.getPlaylistFromQueue(p44, p45) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v46 = nil
    for v47, v48 in u3.values(p44.playlists) do
        local _ = v47 - 1
        local v49 = v48:getQueues()
        if table.find(v49, p45) ~= nil == true then
            return v48
        end
    end
    return v46
end
local v50 = { u7.new(v6.PVP, { v4.PVP_ARENA, v4.BRIDGE_DUEL, v4.GUN_GAME }, {
        ["name"] = "PVP"
    }), (u7.new(v6.ARCADE, { v4.INFECTED, v4.HYPER_GEN_TO4, v4.MINE_WARS }, {
        ["name"] = "ARCADE"
    })) }
return {
    ["PLAYLIST_QUEUES_ENABLED"] = true,
    ["QueuePlaylistId"] = v6,
    ["queuePlaylistManager"] = u32.new(v50)
}