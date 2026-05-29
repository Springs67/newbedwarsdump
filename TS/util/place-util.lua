local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "place-id")
local u6 = v5.GameId
local u7 = v5.PlaceId
local v8 = {}
local u9 = nil
local u10 = nil
function v8.isGameServer() --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
    --]]
    local v11 = not u9()
    if v11 then
        v11 = not u10()
    end
    return v11
end
u9 = function() --[[ Name: isLobbyServer, Line 17 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u7
    --]]
    if u4(u3.ForceLobbyServer) then
        return true
    elseif u4(u3.ForceGameServer) then
        return false
    else
        return game.PlaceId == u7.LOBBY
    end
end
v8.isLobbyServer = u9
u10 = function() --[[ Name: isAfkServer, Line 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u7
    --]]
    return u4(u3.ForceAfkServer) and true or game.PlaceId == u7.AFK
end
v8.isAfkServer = u10
function v8.isProduction() --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return game.GameId == u6.PRODUCTION
end
local u12 = nil
function v8.isStaging(p13) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
        [3] = u2
    --]]
    if p13 == nil then
        p13 = false
    end
    if p13 then
        return game.GameId == u6.STAGING and true or (u12() or u2:IsStudio())
    else
        return game.GameId == u6.STAGING and true or u12()
    end
end
u12 = function() --[[ Name: isDevTesting, Line 50 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return (game.GameId == u6.DEV_TESTING_1 or game.GameId == u6.DEV_TESTING_2) and true or game.GameId == u6.DEV_TESTING_3
end
v8.isDevTesting = u12
return {
    ["PlaceUtil"] = v8
}