local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.Signal
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = u1.import(script, script.Parent.Parent.Parent, "lobby", "game-event", "event-app").EventApp
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "EventController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u11
    --]]
    u8.constructor(p17)
    p17.Name = "EventController"
    p17.eventRemotes = u12.Client:GetNamespace("Event")
    p17.eventProfileCreatedRemote = u12.Client:Get("EventProfileCreated")
    p17.logger = u11.getLogger("EventController")
end
function u14.KnitStart(u18) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u5
        [4] = u7
        [5] = u3
        [6] = u13
    --]]
    u8.KnitStart(u18)
    u18.eventRemotes:Get("SendAllEventData"):Connect(function(p19) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u9
        --]]
        u18.logger:Debug("[EventController] SendAllEventData", p19)
        u9:dispatch({
            ["type"] = "SetEventDataAll",
            ["eventData"] = p19
        })
    end)
    u18.eventRemotes:Get("SendEventDataUpdate"):Connect(function(p20, p21) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u5
            [3] = u9
        --]]
        u18.logger:Debug("[EventController] Received event data: " .. u5(p21), p20)
        u9:dispatch({
            ["type"] = "SetSpecificEventData",
            ["eventType"] = p20,
            ["data"] = p21
        })
    end)
    u18.eventRemotes:Get("SendEventCurrencyUpdate"):Connect(function(p22, p23) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9:dispatch({
            ["type"] = "SetSpecificEventCurrency",
            ["currencyType"] = p22,
            ["data"] = p23
        })
    end)
    u18.eventProfileCreatedRemote:Connect(function(p24) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u7
            [3] = u3
            [4] = u13
        --]]
        if not u18:isEventActive(p24.event) then
            return nil
        end
        if u7.LocalPlayer:GetAttribute("FirstTimePlayer") == nil then
            u7.LocalPlayer:GetAttributeChangedSignal("FirstTimePlayer"):Wait()
        end
        if u7.LocalPlayer:GetAttribute("HideOtherPopupsForRental") == nil then
            u7.LocalPlayer:GetAttributeChangedSignal("HideOtherPopupsForRental"):Wait()
        end
        if u7.LocalPlayer:GetAttribute("FirstTimePlayer") ~= true and u7.LocalPlayer:GetAttribute("HideOtherPopupsForRental") ~= true then
            local v25 = u3.Controllers.UiQueueManagerController
            local v26 = {
                ["priority"] = 2,
                ["app"] = {
                    ["appId"] = "EventApp",
                    ["app"] = u13
                },
                ["props"] = {
                    ["event"] = p24.event
                }
            }
            v25:queueApp(v26)
        end
    end)
end
function u14.waitForEventData(_, u27) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u9
    --]]
    local v28 = u6.new()
    local u29 = u4.new()
    local u32 = u9.changed:connect(function(p30, _) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u29
        --]]
        local v31 = p30.Event.profileData.events[u27]
        if v31 then
            u29:Fire(v31)
        end
    end)
    v28:GiveTask(function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:DisconnectAll()
    end)
    v28:GiveTask(u29)
    v28:GiveTask(function() --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:disconnect()
    end)
    local v33 = u9:getState().Event.profileData.events[u27]
    if v33 then
        v28:DoCleaning()
        return v33
    end
    local v34 = u29:Wait()
    v28:DoCleaning()
    return v34
end
function u14.waitForEventDataAsync(_, u35) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u9
        [4] = u1
    --]]
    local u36 = u6.new()
    local u37 = u4.new()
    local u40 = u9.changed:connect(function(p38, _) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u37
        --]]
        local v39 = p38.Event.profileData.events[u35]
        if v39 then
            u37:Fire(v39)
        end
    end)
    u36:GiveTask(function() --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37:DisconnectAll()
    end)
    u36:GiveTask(u37)
    u36:GiveTask(function() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        u40:disconnect()
    end)
    local u41 = u9:getState().Event.profileData.events[u35]
    if u41 then
        u36:DoCleaning()
        return u1.Promise.new(function(p42) --[[ Line: 129 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            return p42(u41)
        end)
    end
    local v43 = u37:WaitPromise()
    v43:andThen(function() --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:DoCleaning()
    end)
    return v43
end
function u14.getAllEventData(_) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return u9:getState().Event.profileData
end
function u14.getEventData(_, p44) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return u9:getState().Event.profileData.events[p44]
end
function u14.isEventActive(_, p45) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v46 = u10[p45]
    local v47 = u10[p45].active
    if v47 then
        if os.time() >= v46.startDate then
            v47 = os.time() <= v46.endDate
        else
            v47 = false
        end
    end
    return v47
end
u3.CreateController(u14.new())
return nil