local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.RunService
local u11 = v8.StarterGui
local u12 = v8.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "variant", "out").match
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system", "scene-state").WriteableSceneState
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "SceneManager"
    end
})
u16.__index = u16
function u16.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u2
        [4] = u11
        [5] = u9
        [6] = u7
        [7] = u12
    --]]
    p19.timeOffset = 0
    p19.scenes = {}
    if u10:IsClient() then
        local v20 = u6
        local v21 = "ScreenGui"
        local v22 = {}
        local v23
        if u2.isHoarceKat() then
            v23 = u11
        else
            v23 = u9.LocalPlayer:FindFirstChildOfClass("PlayerGui")
        end
        v22.Parent = v23
        p19.screenGui = v20(v21, v22)
        p19.root = u7.new(p19.screenGui)
    else
        p19.root = u7.new(u12)
    end
end
function u16.loadScene(p24, p25) --[[ Line: 42 ]]
    local v26 = p24.scenes
    table.insert(v26, p25)
end
function u16.loadChainedScenes(p27, p28, p29) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    if p28:getEndDate() ~= p29:getStartDate() then
        error("The end date of scene A and start date of scene B must be the same for them to chain")
    end
    local v30 = u15.new()
    p28:overrideState(v30)
    p29:overrideState(v30)
    p28:setChainInfo(0, p28:getLength(), p29:getLength())
    p29:setChainInfo(1, p28:getLength(), p29:getLength())
    p27:loadScene(p28)
    p27:loadScene(p29)
end
function u16.getTimeMillis(p31) --[[ Line: 59 ]]
    return (p31.recordedServerTime == nil or p31.elaspedTimeSinceServerTimestamp == nil) and -1 or (p31.recordedServerTime + p31.elaspedTimeSinceServerTimestamp) * 1000
end
function u16.getElapsedTimeForScene(p32, p33) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local u34 = p32:getTimeMillis()
    if u34 < 0 then
        return 0
    end
    local function v36(p35) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        return (u34 - p35.startDate.UnixTimestampMillis) / 1000
    end
    return u13(p33.timeConfig, {
        ["betweenDates"] = v36,
        ["startDateAndLength"] = v36
    })
end
function u16.cleanAllState(u37) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u7
    --]]
    for _, v38 in u37.scenes do
        v38:overrideState(u15.new({}))
    end
    u7.start(u37.root, function() --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        for _, v39 in u37.scenes do
            v39:step(0, u37:getElapsedTimeForScene(v39), "Heartbeat")
        end
    end)
    u7.start(u37.root, function() --[[ Line: 98 ]] end)
    local v40 = u37.screenGui
    if v40 ~= nil then
        v40:Destroy()
    end
end
function u16.begin(u41) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
        [3] = u12
        [4] = u4
        [5] = u5
        [6] = u7
        [7] = u3
    --]]
    if u10:IsClient() then
        task.spawn(function() --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u41
                [3] = u12
                [4] = u4
            --]]
            local v42 = false
            local v43 = 0
            while true do
                if v42 then
                    v43 = v43 + 1
                else
                    v42 = true
                end
                if v43 >= 3 then
                    return
                end
                local v44 = u14.Client:Get("GetServerUnixTime"):CallServer()
                u41.recordedServerTime = v44.unixTimeMillis / 1000 + (u12:GetServerTimeNow() - v44.serverTimeTaken)
                u41.elaspedTimeSinceServerTimestamp = 0
                u4.Debug("Time taken to receive: ${time}ms", (u12:GetServerTimeNow() - v44.serverTimeTaken) * 1000)
                u4.Debug("DateTime.now() offset: {time}ms", (v44.unixTimeMillis / 1000 - (u12:GetServerTimeNow() - v44.serverTimeTaken) - DateTime.now().UnixTimestampMillis / 1000) * 1000)
                task.wait(3)
            end
        end)
    else
        u41.recordedServerTime = DateTime.now().UnixTimestampMillis / 1000
        u41.elaspedTimeSinceServerTimestamp = 0
    end
    local v45 = u5.new()
    for _, v46 in u41.scenes do
        v46:initBehaviors()
    end
    local u47 = os.clock()
    v45:GiveTask(u10.Heartbeat:Connect(function(u48) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u47
            [3] = u7
            [4] = u10
            [5] = u3
        --]]
        debug.profilebegin("scene-manager heartbeat")
        if u41.elaspedTimeSinceServerTimestamp ~= nil then
            local v49 = os.clock()
            local v50 = u41
            v50.elaspedTimeSinceServerTimestamp = v50.elaspedTimeSinceServerTimestamp + (v49 - u47)
            u47 = v49
        end
        u7.start(u41.root, function() --[[ Line: 145 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u10
                [3] = u3
                [4] = u7
                [5] = u48
            --]]
            for u51, u52 in pairs(u41.scenes) do
                if u10:IsClient() and (not u52.preloadRan and u52:isNearlyActive(u41:getTimeMillis(), 120)) then
                    u52.preloadRan = true
                    u3.Controllers.PreloadController:runPreload(u52.preloadDefinition)
                    u52.logger:Info("Running scene preload.")
                end
                if u52:isActive(u41:getTimeMillis()) then
                    local v53 = u41:getElapsedTimeForScene(u52)
                    if u10:IsStudio() and u10:IsClient() then
                        u7.scope(function() --[[ Line: 157 ]]
                            --[[
                            Upvalues:
                                [1] = u7
                                [2] = u51
                                [3] = u52
                                [4] = u41
                            --]]
                            u7.useKey(u51)
                            local v54, u55 = u7.useState(0)
                            local v56 = u7.window
                            local v57 = math.floor(v54)
                            v56(tostring(v57), function() --[[ Line: 160 ]]
                                --[[
                                Upvalues:
                                    [1] = u7
                                    [2] = u52
                                    [3] = u55
                                --]]
                                u55((u7.slider(u52:getLength())))
                            end)
                            u41.timeOffset = v54
                        end)
                    end
                    u52:step(u48, v53 + u41.timeOffset, "Heartbeat")
                end
            end
        end)
        debug.profileend()
    end))
    v45:GiveTask(u10.Stepped:Connect(function(_, p58) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        for _, v59 in u41.scenes do
            if v59:isActive(u41:getTimeMillis()) then
                v59:step(p58, u41:getElapsedTimeForScene(v59) + u41.timeOffset, "Stepped")
            end
        end
    end))
    if u10:IsClient() then
        v45:GiveTask(u10.Heartbeat:Connect(function(p60) --[[ Line: 182 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            for _, v61 in u41.scenes do
                if v61:isActive(u41:getTimeMillis()) then
                    v61:step(p60, u41:getElapsedTimeForScene(v61) + u41.timeOffset, "Heartbeat")
                end
            end
        end))
    end
    return v45
end
return {
    ["SceneManager"] = u16
}