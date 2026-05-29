local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEvent
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u9 = v1.import(script, script.Parent.Parent.Parent, "global", "training-room", "ui", "training-room-entity-dps-billboard").TrainingRoomEntityDpsBillboard
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "PlayerDpsUpdatedEvent"
    end
})
u13.__index = u13
function u13.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, p17, p18, p19) --[[ Line: 26 ]]
    p16.player = p17
    p16.dpsData = p18
    p16.clear = p19
end
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "TrainingRoomDpsCounterController"
    end,
    ["__index"] = u8
})
u20.__index = u20
function u20.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u5
        [4] = u13
    --]]
    u8.constructor(p23, { u12.TRAINING_ROOM })
    p23.Name = "TrainingRoomDpsCounterController"
    p23.syncEvents = {
        ["PlayerDpsUpdatedEvent"] = u5.new(u13)
    }
    p23.playerDpsMap = {}
    p23.dpsTrackingEnabled = true
end
function u20.onGameInit(u24) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u11
    --]]
    u10.On(function(p25, p26, _, _, p27, _, _, _, _, _, _, _, _, _) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u7
            [3] = u11
        --]]
        if not u24.dpsTrackingEnabled then
            return nil
        end
        if p27 ~= u7.LocalPlayer.Character then
            return nil
        end
        local v28 = u24:getDpsData(u7.LocalPlayer)
        if not v28.isRecording then
            u24:startRecordingDps(u7.LocalPlayer)
        end
        v28.totalDamage = v28.totalDamage + p26
        local v29 = u11:getEntity(p25)
        if v29 ~= nil then
            v29 = v29:getInstance()
        end
        if v29 then
            local v30 = u24:getTargetDpsData(u7.LocalPlayer, v29)
            if not v30.isRecording then
                v30.isRecording = true
                v30.damageRecordingStartTime = tick()
                v30.totalDamage = 0
            end
            v30.totalDamage = v30.totalDamage + p26
        end
        u24:fireUpdateDpsDataEvent(u7.LocalPlayer)
    end)
    u24:getDpsData(u7.LocalPlayer)
    u24:fireUpdateDpsDataEvent(u7.LocalPlayer)
end
function u20.getDpsData(p31, p32) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2.getOrCreate(p31.playerDpsMap, p32, {
        ["totalDamage"] = 0,
        ["isRecording"] = false,
        ["damageRecordingStartTime"] = tick(),
        ["targetDamageDataMap"] = {}
    })
end
function u20.getTargetDpsData(p33, p34, p35) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v36 = p33:getDpsData(p34)
    local v37 = u2.getOrCreate(v36.targetDamageDataMap, p35, {
        ["isRecording"] = false,
        ["totalDamage"] = 0,
        ["billboardUI"] = nil,
        ["damageRecordingStartTime"] = tick(),
        ["entityInstance"] = p35
    })
    if not v37.billboardUI then
        p33:setupBillboardDpsGuiForEntity(p34, v36, v37)
    end
    return v37
end
function u20.resetTotalDps(p38, p39, p40) --[[ Line: 119 ]]
    local v41 = p40 == nil and true or p40
    local v42 = p38:getDpsData(p39)
    v42.damageRecordingStartTime = tick()
    v42.totalDamage = 0
    v42.isRecording = false
    if v41 then
        p38:fireUpdateDpsDataEvent(p39)
    end
end
function u20.resetAllTargetDps(p43, p44, p45) --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    local v46 = p45 == nil and true or p45
    local v47 = p43:getDpsData(p44)
    for v48, v49 in u4.values(v47.targetDamageDataMap) do
        local _ = v48 - 1
        v49.damageRecordingStartTime = tick()
        v49.totalDamage = 0
        if v49.billboardUI then
            u6.unmount(v49.billboardUI)
            v49.billboardUI = nil
        end
    end
    table.clear(v47.targetDamageDataMap)
    if v46 then
        p43:fireUpdateDpsDataEvent(p44)
    end
end
function u20.resetAll(p50, p51) --[[ Line: 153 ]]
    p50:resetTotalDps(p51, false)
    p50:resetAllTargetDps(p51, false)
    p50:fireUpdateDpsDataEvent(p51, true)
end
function u20.getDamagePerSecond(p52, p53, _) --[[ Line: 158 ]]
    local v54 = p52:getDpsData(p53)
    local v55 = tick() - v54.damageRecordingStartTime
    local v56 = v54.totalDamage
    return v55 == 0 and 0 or v56 / v55
end
function u20.fireUpdateDpsDataEvent(p57, p58, p59) --[[ Line: 168 ]]
    if p59 == nil then
        p59 = false
    end
    local v60 = p57:getDpsData(p58)
    p57.syncEvents.PlayerDpsUpdatedEvent:fire(p58, v60, p59)
end
function u20.startRecordingDps(p61, p62) --[[ Line: 175 ]]
    p61:resetAll(p62)
    p61:getDpsData(p62).isRecording = true
    p61:fireUpdateDpsDataEvent(p62)
end
function u20.stopRecordingDps(p63, p64) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v65 = p63:getDpsData(p64)
    v65.isRecording = false
    for v66, v67 in u4.values(v65.targetDamageDataMap) do
        local _ = v66 - 1
        v67.isRecording = false
    end
    p63:fireUpdateDpsDataEvent(p64)
end
function u20.setupBillboardDpsGuiForEntity(_, p68, p69, p70) --[[ Line: 194 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
    --]]
    if p70.billboardUI then
        return nil
    end
    p70.billboardUI = u6.mount(u6.createElement(u9, {
        ["player"] = p68,
        ["entityInstance"] = p70.entityInstance,
        ["initialPlayerDpsData"] = p69,
        ["initialTargetDpsData"] = p70
    }), p70.entityInstance, "TrainingRoomEntityDpsBillboard_" .. p70.entityInstance.Name)
end
function u20.setDpsTrackingEnabled(p71, p72) --[[ Line: 206 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    p71.dpsTrackingEnabled = p72
    if not p72 then
        local v73 = p71:getDpsData(u7.LocalPlayer)
        v73.isRecording = false
        for v74, v75 in u4.values(v73.targetDamageDataMap) do
            local _ = v74 - 1
            v75.isRecording = false
        end
    end
    if p72 then
        p71:resetAll(u7.LocalPlayer)
    end
    p71:fireUpdateDpsDataEvent(u7.LocalPlayer)
end
v3.CreateController(u20.new())
return {
    ["PlayerDpsUpdatedEvent"] = u13
}