local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.HttpService
local u7 = v5.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").CpsConstants
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "BlockCpsController"
    end,
    ["__index"] = u8
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p13)
    p13.Name = "BlockCpsController"
    p13.lastPlaceTimestamp = 0
end
function u10.KnitStart(u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u4
        [4] = u9
        [5] = u7
        [6] = u6
    --]]
    u8.KnitStart(u14)
    u2.PlaceBlock:setPriority(u4.HIGHEST):connect(function(p15) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u14
            [4] = u6
        --]]
        if p15:isCancelled() then
            return nil
        end
        local v16 = 1 / u9.BLOCK_PLACE_CPS
        local v17 = v16 - (u7:GetServerTimeNow() - u14.lastPlaceTimestamp)
        local v18 = v17 < v16 * 0.5
        if v17 <= 0 then
            return nil
        end
        if not v18 then
            return p15:setCancelled(true)
        end
        p15.id = u6:GenerateGUID()
        u14.pendingPlacement = p15.id
        task.wait(v17)
    end)
    u2.PlaceBlock:setPriority(u4.LOWEST):connect(function(p19) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u7
        --]]
        if p19:isCancelled() then
            return nil
        end
        local v20 = p19.id
        if v20 ~= "" and v20 then
            v20 = u14.pendingPlacement ~= p19.id
        end
        if v20 ~= "" and v20 then
            return p19:setCancelled(true)
        end
        u14.lastPlaceTimestamp = u7:GetServerTimeNow()
        u14.pendingPlacement = nil
    end)
end
v3.CreateController(u10.new())
return nil