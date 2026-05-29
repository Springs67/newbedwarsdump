local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "MatchController"
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
function u11.constructor(u14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u9
        [4] = u10
        [5] = u7
        [6] = u5
    --]]
    u6.constructor(u14)
    u14.Name = "MatchController"
    u14.customMatchSignal = u4.new()
    u14.queueTypeSignal = u4.new()
    u14.parties = {}
    u9.Client:WaitFor("MatchStateEvent"):expect():Connect(function(u15, u16, u17) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u14
            [4] = u5
        --]]
        if u10.isGameServer() then
            u7:dispatch({
                ["type"] = "GameSetMatchState",
                ["matchState"] = u15
            })
            if u17 ~= nil then
                u7:dispatch({
                    ["type"] = "GameSetStartTime",
                    ["startTime"] = u17
                })
            end
            if u16 ~= nil then
                u7:dispatch({
                    ["type"] = "SetCustomMatchData",
                    ["customMatch"] = u16
                })
            end
        end
        task.spawn(function() --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u15
                [3] = u16
                [4] = u5
                [5] = u17
            --]]
            u14.matchState = u15
            u14.customMatch = u16
            u5.MatchStateChange:fire(u15, u17, u16)
            u14.customMatchSignal:Fire()
        end)
    end)
    u9.Client:WaitFor("QueueTypeEvent"):expect():Connect(function(p18) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u7
        --]]
        u14.queueType = p18
        u7:dispatch({
            ["type"] = "GameSetQueueType",
            ["queueType"] = p18
        })
        u14.queueTypeSignal:Fire()
    end)
end
function u11.KnitStart(u19) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
    --]]
    u6.KnitStart(u19)
    u9.Client:WaitFor("MatchPartiesUpdate"):expect():Connect(function(p20) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        if p20 then
            u19.parties = p20
        end
    end)
end
u11.getQueueTypeAsync = v1.async(function(p21) --[[ Line: 75 ]]
    if p21.queueType then
        return p21.queueType
    end
    p21.queueTypeSignal:Wait()
    return p21.queueType
end)
function u11.getQueueType(p22) --[[ Line: 82 ]]
    return p22.queueType
end
function u11.getMatchState(p23) --[[ Line: 85 ]]
    return p23.matchState
end
u11.getCustomMatchConfigAsync = v1.async(function(p24) --[[ Line: 88 ]]
    if p24.customMatch then
        return p24.customMatch
    end
    p24.customMatchSignal:Wait()
    return p24.customMatch
end)
function u11.getCustomMatchConfig(p25) --[[ Line: 95 ]]
    return p25.customMatch
end
function u11.getParties(p26) --[[ Line: 98 ]]
    return p26.parties
end
function u11.getPlayerParty(p27, u28) --[[ Line: 101 ]]
    local v29 = p27.parties
    local function v34(p30) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        local v31 = nil
        for v32, v33 in p30.members do
            local _ = v32 - 1
            if v33 == u28.UserId == true then
                v31 = v33
                break
            end
        end
        return v31 ~= nil
    end
    local v35 = nil
    for v36, v37 in v29 do
        if v34(v37, v36 - 1, v29) == true then
            return v37
        end
    end
    return v35
end
function u11.getQueueMeta(p38) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p38.queueType then
        return u8(p38.queueType)
    else
        return nil
    end
end
function u11.getGameType(_) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3:GetAttribute("GameType")
end
v2.CreateController(u11.new())
return nil