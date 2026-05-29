local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "one-for-all", "one-for-all-util").OneForAllUtil
local u10 = v1.import(script, script.Parent, "ui", "one-for-all-board").OneForAllBoard
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "OneForAllController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "OneForAllController"
    p14.board = nil
    p14.activeKit = nil
    p14.nextEndTime = 0
end
function u11.KnitStart(u15) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u7
        [4] = u5
        [5] = u2
        [6] = u9
    --]]
    u6.KnitStart(u15)
    local v16 = true
    for v17, v18 in u11.QueueTypes do
        local _ = v17 - 1
        if u7(v18).disabled then
            v16 = false
            break
        end
    end
    if not v16 then
        return nil
    end
    task.spawn(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
            [3] = u2
            [4] = u9
            [5] = u15
        --]]
        local v19 = u5:WaitForChild("Lobby")
        if v19 ~= nil then
            v19 = v19:WaitForChild("Queues", 5)
        end
        if v19 ~= nil then
            local v20 = v19:GetChildren()
            local function v24(u21) --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u2
                    [3] = u9
                    [4] = u15
                --]]
                local v22 = u21.Name
                if table.find(u11.QueueTypes, v22) == nil then
                    return nil
                end
                if u21:IsA("BasePart") then
                    local v23 = u2.new(u9.getCurrTimestamp() - u9.pickInterval)
                    u15.activeKit = u9.pickRandomKit()
                    u15.nextEndTime = v23:getNextResetTime(u9.pickInterval)
                    u15:mountBoard(u21, u15.activeKit, u15.nextEndTime)
                    v23:poll(u9.pickInterval, u9.pickInterval, function() --[[ Line: 74 ]]
                        --[[
                        Upvalues:
                            [1] = u15
                            [2] = u9
                            [3] = u21
                        --]]
                        u15.activeKit = u9.pickRandomKit()
                        u15.nextEndTime = os.time() - os.time() % u9.pickInterval + u9.pickInterval
                        u15:mountBoard(u21, u15.activeKit, u15.nextEndTime)
                    end)
                end
            end
            for v25, v26 in v20 do
                v24(v26, v25 - 1, v20)
            end
        end
    end)
end
function u11.mountBoard(p27, p28, p29, p30) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
    --]]
    if p27.board then
        u4.update(p27.board, u4.createElement(u10, {
            ["Adornee"] = p28,
            ["BedwarsKit"] = p29,
            ["EndTime"] = p30
        }))
    else
        p27.board = u4.mount(u4.createElement(u10, {
            ["Adornee"] = p28,
            ["BedwarsKit"] = p29,
            ["EndTime"] = p30
        }), p28)
    end
end
function u11.getActiveKit(p31) --[[ Line: 102 ]]
    return p31.activeKit
end
function u11.getNextEndTime(p32) --[[ Line: 105 ]]
    return p32.nextEndTime
end
u11.QueueTypes = { v8.ALL_SAME_KIT_TO4 }
v3.CreateController(u11.new())
return nil