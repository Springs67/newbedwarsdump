local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.UILayers
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, script.Parent, "ui", "murderer-credit-app").MurdererCreditApp
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "MurdererCreditController"
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
        [2] = u8
    --]]
    u7.constructor(p15, { u8.MURDERER_GAME })
    p15.Name = "MurdererCreditController"
    p15.teleportStarted = false
end
function u12.KnitStart(p16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p16)
end
function u12.onGameInit(_) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u2
        [4] = u11
        [5] = u5
    --]]
    u9.Client:Get("MatchEndEvent"):Connect(function() --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u11
            [4] = u5
        --]]
        u6.Controllers.MatchEndController:waitUntilDisplay(2)
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            ["appId"] = "MurdererCredit",
            ["app"] = u11,
            ["layer"] = u5.OVERLAY
        }, {
            ["AppId"] = "MurdererCredit"
        })
    end)
end
function u12.teleportToMurderMystery2(p17) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u9
    --]]
    if p17.teleportStarted then
        return nil
    end
    p17.teleportStarted = true
    u4:playSound(u10.QUEUE_MATCH_FOUND)
    u9.Client:Get("RequestTeleportToPlace"):SendToServer({
        ["placeId"] = 142823291
    })
end
u6.CreateController(u12.new())
return nil