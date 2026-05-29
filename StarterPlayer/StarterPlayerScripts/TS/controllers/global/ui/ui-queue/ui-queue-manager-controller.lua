local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").MaxPriorityQueue
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "UiQueueManagerController"
    end,
    ["__index"] = u7
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    u7.constructor(p11)
    p11.Name = "UiQueueManagerController"
    p11.queueDelayTime = 1
    p11.initFinished = false
    p11.uiQueue = u4.new()
end
function u8.KnitStart(u12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    u7.KnitStart(u12)
    u6.AppClose:connect(function(p13) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        if p13.appId ~= u12.activeAppId then
            return nil
        end
        u12.activeAppId = nil
        u12:mountNextUI()
    end)
    task.delay(u12.queueDelayTime, function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v14 = u12.uiQueue:PopElement()
        if v14 then
            u12:mountApp(v14.Value)
        end
        u12.initFinished = true
    end)
end
function u8.getActiveAppId(p15) --[[ Line: 49 ]]
    return p15.activeAppId
end
function u8.queueApp(p16, p17) --[[ Line: 52 ]]
    if p16.initFinished and p16.activeAppId == nil then
        p16:mountApp(p17)
        return nil
    end
    local v18 = p16.uiQueue
    local v19 = {
        ["app"] = p17.app,
        ["props"] = p17.props
    }
    local v20 = p17.priority
    v18:InsertWithPriority(v19, v20 == nil and 0 or v20)
end
function u8.mountNextUI(p21) --[[ Line: 70 ]]
    local v22 = p21.uiQueue:PopElement()
    if v22 ~= nil then
        v22 = v22.Value
    end
    if v22 then
        p21:mountApp(v22)
    end
end
function u8.mountApp(p23, p24) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    local v25 = p24.shouldDisplay
    if v25 then
        local v26 = p24.shouldDisplay
        if v26 ~= nil then
            v26 = v26()
        end
        v25 = not v26
    end
    if v25 then
        return nil
    else
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(p24.app, p24.props, nil, u5.LocalPlayer:WaitForChild("PlayerGui"))
        local v27 = p24.app
        if type(v27) == "string" then
            p23.activeAppId = p24.app
        else
            p23.activeAppId = p24.app.appId
        end
    end
end
v3.CreateController(u8.new())
return nil