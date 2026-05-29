local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent, "ui", "match-history-moderation-app").MatchHistoryModerationApp
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "MatchHistoryController"
    end,
    ["__index"] = u5
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
        [1] = u5
    --]]
    u5.constructor(p11)
    p11.Name = "MatchHistoryController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u3
        [4] = u2
        [5] = u7
    --]]
    u5.KnitStart(p12)
    u6.Client:Get("SendMatchHistoryToPlayer"):Connect(function(p13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u7
        --]]
        local v14 = p13.matchHistoryOwner
        local u15 = p13.matchHistory
        u3.getOfflinePlayersByUserIds({ v14 }):andThen(function(p16) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u7
                [3] = u15
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                ["appId"] = "MatchHistoryApp",
                ["app"] = u7
            }, {
                ["player"] = p16[1],
                ["matchHistory"] = u15
            })
        end)
    end)
end
function u8.requestMatchHistory(_, p17) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6.Client:Get("RequestMatchHistory"):CallServerAsync(p17)
end
v4.CreateController(u8.new())
return nil