local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-system-meta").getCheckInSystemMeta
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "EventAutoCheckinController"
    end,
    ["__index"] = u4
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p12)
    p12.Name = "EventAutoCheckinController"
end
function u9.KnitStart(u13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u8
        [4] = u3
    --]]
    u4.KnitStart(u13)
    if u2.Controllers.MatchController:getMatchState() == u8.RUNNING then
        u13:logAutoCheckIn()
    else
        u3.MatchStateChange:connect(function(p14) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u13
            --]]
            if p14.matchState ~= u8.RUNNING then
                return nil
            end
            u13:logAutoCheckIn()
        end)
    end
end
function u9.logAutoCheckIn(_) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u5
        [4] = u2
    --]]
    for v15, v16 in u7.getActiveEvents() do
        local _ = v15 - 1
        local v17 = u6[v16].checkInSystem
        if v17 then
            local v18 = u5(v17)
            if v18 ~= nil then
                v18 = v18.autoCheckinOnMatchStart
            end
            if v18 then
                u2.Controllers.CheckinController:recordCheckIn(v17)
            end
        end
    end
end
u2.CreateController(u9.new())
return nil