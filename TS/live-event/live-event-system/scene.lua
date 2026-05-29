local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").MinPriorityQueue
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out")
local u4 = v3.default
local u5 = v3.Logger
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "variant", "out").match
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system", "scene-state")
local u8 = v7.SceneState
local u9 = v7.WriteableSceneState
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "Scene"
    end
})
u10.__index = u10
function u10.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13, p14) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u2
        [3] = u5
        [4] = u4
        [5] = u6
    --]]
    p13.preloadRan = false
    p13.state = u9.new()
    p13.recentErrors = {}
    p13.heartbeatBehaviors = u2.new()
    p13.steppedBehaviors = u2.new()
    p13.rendersteppedBehaviors = u2.new()
    p13.behaviorStateHistory = {}
    p13.logger = u5:configure():WriteTo(u4.RobloxOutput({
        ["Prefix"] = p14.sceneName
    })):Create()
    p13.timeConfig = p14.timeConfig
    p13.preloadDefinition = p14.preload or {}
    p13.length = u6(p14.timeConfig, {
        ["betweenDates"] = function(p15) --[[ Name: betweenDates, Line 37 ]]
            return p15.endDate.UnixTimestamp - p15.startDate.UnixTimestamp
        end,
        ["startDateAndLength"] = function(p16) --[[ Name: startDateAndLength, Line 40 ]]
            return p16.length
        end
    })
end
function u10.registerBehavior(p17, p18, p19) --[[ Line: 45 ]]
    if p18.event == "RenderStepped" then
        local v20 = p17.rendersteppedBehaviors
        local v21 = {
            ["name"] = p18.name,
            ["func"] = p19,
            ["init"] = p18.init
        }
        local v22 = p18.priority
        v20:InsertWithPriority(v21, v22 == nil and 0 or v22)
        return
    elseif p18.event == "Heartbeat" then
        local v23 = p17.heartbeatBehaviors
        local v24 = {
            ["name"] = p18.name,
            ["func"] = p19,
            ["init"] = p18.init
        }
        local v25 = p18.priority
        v23:InsertWithPriority(v24, v25 == nil and 0 or v25)
    elseif p18.event == "Stepped" then
        local v26 = p17.steppedBehaviors
        local v27 = {
            ["name"] = p18.name,
            ["func"] = p19,
            ["init"] = p18.init
        }
        local v28 = p18.priority
        v26:InsertWithPriority(v27, v28 == nil and 0 or v28)
    end
end
function u10.registerBehaviorTable(p29, p30) --[[ Line: 84 ]]
    p29:registerBehavior({
        ["name"] = p30.name,
        ["event"] = p30.event,
        ["priority"] = p30.priority,
        ["init"] = p30.init
    }, p30.func)
end
function u10.isActive(p31, p32) --[[ Line: 92 ]]
    return p31:isNearlyActive(p32, 0)
end
function u10.isNearlyActive(p33, u34, u35) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6(p33.timeConfig, {
        ["betweenDates"] = function(p36) --[[ Name: betweenDates, Line 97 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u35
            --]]
            return u34 > p36.startDate.UnixTimestampMillis - u35 * 1000 and u34 < p36.endDate.UnixTimestampMillis
        end,
        ["startDateAndLength"] = function(p37) --[[ Name: startDateAndLength, Line 104 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u35
            --]]
            return u34 > p37.startDate.UnixTimestampMillis - u35 * 1000 and u34 < p37.startDate.UnixTimestampMillis + p37.length * 1000
        end
    })
end
function u10.getStartDate(p38) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6(p38.timeConfig, {
        ["betweenDates"] = function(p39) --[[ Name: betweenDates, Line 115 ]]
            return p39.startDate.UnixTimestamp
        end,
        ["startDateAndLength"] = function(p40) --[[ Name: startDateAndLength, Line 118 ]]
            return p40.startDate.UnixTimestamp
        end
    })
end
function u10.getEndDate(p41) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6(p41.timeConfig, {
        ["betweenDates"] = function(p42) --[[ Name: betweenDates, Line 125 ]]
            return p42.endDate.UnixTimestamp
        end,
        ["startDateAndLength"] = function(p43) --[[ Name: startDateAndLength, Line 128 ]]
            return p43.startDate.UnixTimestamp + p43.length
        end
    })
end
function u10.getLength(p44) --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6(p44.timeConfig, {
        ["betweenDates"] = function(p45) --[[ Name: betweenDates, Line 135 ]]
            return p45.endDate.UnixTimestamp - p45.startDate.UnixTimestamp
        end,
        ["startDateAndLength"] = function(p46) --[[ Name: startDateAndLength, Line 138 ]]
            return p46.length
        end
    })
end
function u10.overrideState(p47, p48) --[[ Line: 143 ]]
    p47.state = p48
end
function u10.overrideTimeConfig(p49, p50) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    p49.timeConfig = p50
    p49.length = u6(p50, {
        ["betweenDates"] = function(p51) --[[ Name: betweenDates, Line 149 ]]
            return p51.endDate.UnixTimestamp - p51.startDate.UnixTimestamp
        end,
        ["startDateAndLength"] = function(p52) --[[ Name: startDateAndLength, Line 152 ]]
            return p52.length
        end
    })
end
function u10.setChainInfo(p53, p54, p55, p56) --[[ Line: 157 ]]
    p53.chainInfo = {
        ["stageInChain"] = p54,
        ["length1"] = p55,
        ["length2"] = p56
    }
end
function u10.initBehaviors(u57) --[[ Line: 164 ]]
    for _, u58 in u57.heartbeatBehaviors:Iterate() do
        if u58.Value.init ~= nil then
            task.spawn(function() --[[ Line: 167 ]]
                --[[
                Upvalues:
                    [1] = u58
                    [2] = u57
                --]]
                return u58.Value.init(u57.state)
            end)
        end
    end
    for _, u59 in u57.rendersteppedBehaviors:Iterate() do
        if u59.Value.init ~= nil then
            task.spawn(function() --[[ Line: 174 ]]
                --[[
                Upvalues:
                    [1] = u59
                    [2] = u57
                --]]
                return u59.Value.init(u57.state)
            end)
        end
    end
    for _, u60 in u57.steppedBehaviors:Iterate() do
        if u60.Value.init ~= nil then
            task.spawn(function() --[[ Line: 181 ]]
                --[[
                Upvalues:
                    [1] = u60
                    [2] = u57
                --]]
                return u60.Value.init(u57.state)
            end)
        end
    end
end
function u10.step(u61, p62, p63, p64) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v65
    if p64 == "Heartbeat" then
        v65 = u61.heartbeatBehaviors
    elseif p64 == "Stepped" then
        v65 = u61.steppedBehaviors
    else
        if p64 ~= "RenderStepped" then
            u61.logger:Error("{eventName} is not a valid event name", p64)
            return nil
        end
        v65 = u61.rendersteppedBehaviors
    end
    debug.profilebegin("Clean recent errors")
    for v66, v67 in u61.recentErrors do
        if os.clock() - v67.timestamp > 10 then
            u61.recentErrors[v66] = nil
        end
    end
    debug.profileend()
    for _, v68 in v65:Iterate() do
        local u69 = v68.Value
        debug.profilebegin(u69.name)
        local v70 = coroutine.create(u69.func)
        local v71 = coroutine
        local v72 = {
            ["elapsedEventTime"] = p63,
            ["frameDeltaTime"] = p62,
            ["totalLength"] = u61:getLength(),
            ["chainInfo"] = u61.chainInfo
        }
        local v73 = u61.state
        local v74 = u61.behaviorStateHistory[u69.name]
        if v74 ~= nil then
            v74 = v74.oldState
        end
        local v75, v76 = v71.resume(v70, v72, v73, v74)
        if coroutine.status(v70) ~= "dead" then
            coroutine.close(v70)
            task.spawn(function() --[[ Line: 228 ]]
                --[[
                Upvalues:
                    [1] = u61
                    [2] = u69
                --]]
                u61.logger:Error("Live event behavior " .. u69.name .. " yielded. Yielding in live event behaviors is forbidden")
            end)
        end
        if not v75 and (type(v76) == "string" and u61.recentErrors[v76] == nil) then
            u61.recentErrors[v76] = {
                ["timestamp"] = os.clock()
            }
            task.spawn(error, v76)
            u61.logger:Warn("The above error will be suppressed for 10 seconds")
        end
        debug.profilebegin("cloning state")
        local v77 = u61.state:getRaw()
        u61.behaviorStateHistory[u69.name] = {
            ["oldState"] = u8.new(v77)
        }
        debug.profileend()
        debug.profileend()
    end
end
return {
    ["Scene"] = u10
}