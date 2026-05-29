local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u9 = {
    ["BED_INVULNERABILITY_DURATION"] = 0,
    ["BED_PLATING_DURATION"] = 300,
    ["BED_PLATING_AMOUNT"] = 20,
    ["PLATING_STAGES"] = 4,
    ["HEALTH_PER_PLATE_STAGE"] = 5,
    ["DIAMOND_REWARD"] = 3
}
local u10 = nil
function u9.setupBedPlating() --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u6
        [4] = u10
        [5] = u8
    --]]
    u2:getBlockDamageHook():setPriority(u3.MONITOR + 100):connect(function(p11) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u10
            [4] = u8
        --]]
        local v12 = p11.blockRef
        local v13 = u2:getStore():getBlockAt(v12.blockPosition)
        local v14 = u2:getStore():getBlockData(v12.blockPosition)
        if not (v13 and v14) then
            return nil
        end
        if v13.Name ~= u6.BED then
            return nil
        end
        if not u10(v13) then
            return nil
        end
        local v15 = v13:GetAttribute("BedPlatingTotal")
        if v15 == 0 or (v15 ~= v15 or not v15) then
            return nil
        end
        local v16 = v13:GetAttribute("BedPlatingAmount")
        if v16 ~= nil then
            v15 = v16
        end
        local v17 = v15 - p11.damage
        local v18 = v17 <= 0
        v13:SetAttribute("BedPlatingAmount", (math.max(0, v17)))
        if v18 then
            u8.BedPlatingDestroyed:fire(p11.player, v13, v14, 3)
        end
        p11.damage = 0
    end)
end
function u9.getBedInvulnDuration(p19) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
    --]]
    local v20 = u4(p19).bedInvulnerabilityDuration
    if v20 == nil then
        v20 = u9.BED_INVULNERABILITY_DURATION
    end
    return v20
end
function u9.getBedPlatingDuration(p21) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u5
    --]]
    local v22 = u9.BED_PLATING_DURATION
    local v23 = p21 == u7.activeRankMeta.queueType
    local v24 = (v23 or p21 == u5.BEDWARS_5v5) and true or v23
    local v25 = (v24 or p21 == u5.BEDWARS_20v20_LB) and true or v24
    local v26 = (v25 or p21 == u5.BEDWARS_20v20) and true or v25
    if v26 or p21 == u5.BEDWARS_16v16 then
        return 360
    end
    local v27 = p21 == u5.BEDWARS_TO1 and true or v26
    if v27 or p21 == u5.BEDWARS_TO2 then
        return 120
    end
    local v28 = p21 == u5.BEDWARS_DISASTERS_TO4 and true or v27
    local v29 = (v28 or p21 == u5.BEDWARS_VOICE_CHAT) and true or v28
    local v30 = (v29 or p21 == u5.BEDWARS_LUCKY_BLOCK_TO2) and true or v29
    return ((v30 or p21 == u5.BEDWARS_LUCKY_BLOCK) and true or v30 or p21 == u5.BEDWARS_TO4) and 240 or (p21 == u5.ROYALE and 120 or (p21 == u5.LB_ONEBLOCK and 120 or v22))
end
u10 = function(p31) --[[ Name: hasBedPlating, Line 130 ]]
    local v32 = p31:GetAttribute("BedPlating")
    if v32 == nil then
        v32 = false
    end
    return v32
end
u9.hasBedPlating = u10
local v33 = {}
local v34 = setmetatable({}, {
    ["__index"] = v33
})
v34.BED_PLATING_ACTIVE = "bed_plating_active"
v33.bed_plating_active = "BED_PLATING_ACTIVE"
v34.BED_ALIVE = "bed_alive"
v33.bed_alive = "BED_ALIVE"
v34.BED_BROKEN = "bed_broken"
v33.bed_broken = "BED_BROKEN"
u9.BedStatus = v34
return {
    ["BedPlatingUtil"] = u9
}