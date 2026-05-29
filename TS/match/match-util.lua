local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitServer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
return {
    ["getCurrentQueueMeta"] = function() --[[ Name: getCurrentQueueMeta, Line 10 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u7
            [4] = u6
            [5] = u5
            [6] = u4
        --]]
        if u2.isHoarceKat() then
            return u8(u7)
        elseif u6:IsServer() then
            return u5.Services.MatchService:getQueueMeta()
        else
            return u4.Controllers.MatchController:getQueueMeta()
        end
    end,
    ["getCurrentQueueType"] = function() --[[ Name: getCurrentQueueType, Line 20 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u4
        --]]
        if u6:IsServer() then
            return u5.Services.MatchService:getQueueType()
        else
            return u4.Controllers.MatchController:getQueueType()
        end
    end
}