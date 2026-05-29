local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.RunService
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "world-util").WorldUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "WorldController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p15)
    p15.Name = "WorldController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u8
        [4] = u9
        [5] = u4
        [6] = u5
        [7] = u10
        [8] = u6
    --]]
    u7.KnitStart(p16)
    if not u11.isGameServer() then
        return nil
    end
    u8.changed:connect(function(p17, p18) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u5
            [4] = u10
            [5] = u6
        --]]
        local v19 = p17.Game.queueType
        if v19 and (v19 ~= p18.Game.queueType and u9(v19).scene == nil) then
            local u20 = nil
            u4.Heartbeat:Connect(function() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u10
                    [3] = u20
                    [4] = u6
                --]]
                local v21 = u5.CurrentCamera
                if v21 ~= nil then
                    v21 = v21.CFrame.Position
                end
                if not v21 then
                    return nil
                end
                local v22 = u10:getWorldFromPosition(v21)
                if v22 ~= nil then
                    v22 = v22.Name
                end
                if v22 ~= u20 then
                    u6.ChangeWorld:fire(v22, u20)
                    u20 = v22
                end
            end)
        end
    end)
end
function u12.watchLocalWorld(_, u23) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u6
    --]]
    local v24 = u5.CurrentCamera
    if v24 ~= nil then
        v24 = v24.CFrame.Position
    end
    local u25
    if v24 then
        u25 = u10:getWorldFromPosition(v24)
    else
        u25 = nil
    end
    task.spawn(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u25
        --]]
        u23(u25)
    end)
    return u6.ChangeWorld:connect(function(p26) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u23
        --]]
        local v27 = p26.toWorldId
        local u28
        if v27 == "" or not v27 then
            u28 = nil
        else
            u28 = u5:WaitForChild("Map"):WaitForChild("Worlds"):FindFirstChild(p26.toWorldId)
        end
        task.spawn(function() --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u28
            --]]
            u23(u28)
        end)
    end)
end
v2.CreateController(u12.new())
return nil