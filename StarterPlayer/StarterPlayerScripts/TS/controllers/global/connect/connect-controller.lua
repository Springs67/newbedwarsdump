local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.Signal
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.HttpService
local u7 = v5.Players
local u8 = v5.RunService
local u9 = v5.TeleportService
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "ConnectController"
    end,
    ["__index"] = u10
})
u17.__index = u17
function u17.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
    --]]
    u10.constructor(p20)
    p20.Name = "ConnectController"
    p20.myConnectedParty = nil
    p20.connected = false
    p20.connectSignal = u4.new()
end
function u17.KnitStart(u21) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u15
        [3] = u9
        [4] = u8
        [5] = u12
        [6] = u11
        [7] = u16
        [8] = u13
        [9] = u14
        [10] = u7
        [11] = u6
    --]]
    u1.Promise.retry(u1.async(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u15
        --]]
        return u1.await(u15.Client:WaitFor("PlayerConnect"))
    end), 50):andThen(function(p22) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u9
            [3] = u8
            [4] = u12
            [5] = u11
            [6] = u16
            [7] = u13
            [8] = u14
            [9] = u7
            [10] = u6
        --]]
        u21.connected = true
        u21.connectSignal:Fire()
        local v23 = u9:GetLocalPlayerTeleportData()
        if v23 then
            p22:SendToServer(v23)
            u21.myConnectedParty = v23.party
        elseif (u8:IsStudio() or u12(u11.ForceGameServer)) and u16.isGameServer() then
            if u12(u11.ForceCustomMatch) then
                local v24 = u13 or u14.BEDWARS_TO2
                local v25 = u12(u11.LoadMap)
                p22:SendToServer({
                    ["customMatchHash"] = "a",
                    ["customMatch"] = {
                        ["joinCode"] = "ABCD",
                        ["accessCode"] = "",
                        ["selectedMap"] = v25 == nil and "to4_Aztec" or v25,
                        ["queueType"] = v24,
                        ["hostUserId"] = u7.LocalPlayer.UserId
                    }
                })
                return
            end
            if u12(u11.SimulateLateJoin) and u7.LocalPlayer.Name == "Player2" then
                task.wait(5)
            end
            p22:SendToServer({
                ["match"] = {
                    ["accessCodeHash"] = "",
                    ["matchId"] = u6:GenerateGUID(false),
                    ["queueType"] = u13,
                    ["teamLeaderUserId"] = u7.LocalPlayer.UserId
                }
            })
        end
    end)
    u1.Promise.retry(u1.async(function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u15
        --]]
        return u1.await(u15.Client:WaitFor("PlayerReady"))
    end), 50):andThen(function(p26) --[[ Line: 91 ]]
        p26:SendToServer()
    end)
end
function u17.waitForConnected(p27) --[[ Line: 96 ]]
    if p27.connected then
        return nil
    end
    p27.connectSignal:Wait()
end
function u17.getMyConnectedParty(p28) --[[ Line: 102 ]]
    return p28.myConnectedParty
end
return {
    ["ConnectController"] = v3.CreateController(u17.new())
}