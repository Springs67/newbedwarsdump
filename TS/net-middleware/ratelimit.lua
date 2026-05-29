local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
return function(p4) --[[ Name: HandleRatelimitFail, Line 5 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v5 = u2:GetPlayerByUserId(p4.UserId)
    local v6 = u3.getLogger("NetRateLimiter")
    if v5 ~= nil then
        v5 = v5.UserId
    end
    v6:Error("Player {userId} hit rate limit on remote {remoteId}", v5 == nil and 0 or v5, p4.RemoteId)
end