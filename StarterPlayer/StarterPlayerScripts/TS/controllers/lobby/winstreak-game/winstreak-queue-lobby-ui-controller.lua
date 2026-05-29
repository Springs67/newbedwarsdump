local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u5 = v1.import(script, script.Parent, "ui", "winstreak-board").WinstreakBoard
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "WinstreakQueueLobbyUiController"
    end,
    ["__index"] = u3
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p9)
    p9.Name = "WinstreakQueueLobbyUiController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u4
        [4] = u5
    --]]
    u3.KnitStart(p10)
    u2.Controllers.QueueUiBoardController:mountUI(u4.WINSTREAK_1v1, u5, function(p11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        local v12 = {}
        local v13 = p11.Leaderboard.queues[u4.WINSTREAK_1v1]
        if v13 ~= nil then
            v13 = v13.currentWinStreak
        end
        v12.streak = v13 == nil and 0 or v13
        return v12
    end)
end
u2.CreateController(u6.new())
return nil