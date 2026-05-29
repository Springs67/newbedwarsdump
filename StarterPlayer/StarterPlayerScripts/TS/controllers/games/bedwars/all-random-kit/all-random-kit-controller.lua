local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "AllRandomKitController"
    end,
    ["__index"] = u9
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
    --]]
    u9.constructor(p20)
    p20.Name = "AllRandomKitController"
    p20.draftMaid = u7.new()
    p20.draftInitialized = false
end
function u17.KnitStart(u21) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u12
        [4] = u14
    --]]
    u9.KnitStart(u21)
    local v22, v23 = u6.Controllers.MatchController:getQueueTypeAsync():await()
    if not v22 or v23 ~= u12.ALL_RANDOM_KIT_TO4 then
        return nil
    end
    local v24, v25 = u6.Controllers.MatchController:getCustomMatchConfigAsync():await()
    if not v24 or v25 ~= nil then
        u14.Client:Get("CustomMatchStarted"):Connect(function(p26) --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u21
            --]]
            local v27 = p26.customMatchConfig
            if v27 ~= nil then
                v27 = v27.queueType
            end
            if v27 ~= u12.ALL_RANDOM_KIT_TO4 then
                return nil
            end
            u21:setupConnections()
        end)
        return nil
    end
    u21:setupConnections()
end
function u17.setupConnections(u28) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u14
        [4] = u10
    --]]
    if u6.Controllers.MatchController:getMatchState() ~= u13.PRE then
        return nil
    end
    u14.Client:Get("ArkDraftDataUpdate"):Connect(function(p29) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u28
        --]]
        u10:dispatch({
            ["type"] = "SetARKDraft",
            ["data"] = p29
        })
        u28:initDraft()
    end)
    u14.Client:Get("GetARKDraftData"):CallServerAsync():andThen(function(p30) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u10
        --]]
        u28:initDraft()
        if not p30.data then
            return nil
        end
        u10:dispatch({
            ["type"] = "SetARKDraft",
            ["data"] = p30.data
        })
    end)
end
function u17.initDraft(u31) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u10
        [4] = u8
    --]]
    if u6.Controllers.MatchController:getMatchState() ~= u13.PRE then
        return nil
    end
    if u31.draftInitialized then
        return nil
    end
    u31.draftInitialized = true
    u31.draftMaid:GiveTask(function() --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31.draftInitialized = false
    end)
    local u34 = u10.changed:connect(function(p32, p33) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u31
        --]]
        if p32.Game ~= p33.Game and p32.Game.matchState ~= u13.PRE then
            u31:unmountUI()
        end
    end)
    u31.draftMaid:GiveTask(function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:disconnect()
    end)
    u31.draftMaid:GiveTask(u8.MatchStateChange:connect(function(p35) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u31
        --]]
        if p35.customMatch then
            return nil
        elseif p35.matchState == u13.PRE then
            u31:mountUI()
        else
            u31:unmountUI()
        end
    end))
    u31:mountUI()
end
function u17.mountUI(p36) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u6
        [3] = u4
        [4] = u15
        [5] = u2
        [6] = u11
    --]]
    p36:unmountUI()
    local v37 = { u16.MATCH_MUSIC_FORGE }
    u6.Controllers.BackgroundMusicController:startMusic(u4.randomArraySelectN(v37, 1)[1], u15.MENU)
    p36.draftMaid:GiveTask(function() --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6.Controllers.BackgroundMusicController:stopMusic(2)
    end)
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.ALL_RANDOM_KIT_DRAFT_APP, {})
end
function u17.unmountUI(p38) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u5
        [4] = u16
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u11.ALL_RANDOM_KIT_DRAFT_APP) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u11.ALL_RANDOM_KIT_DRAFT_APP)
        u5:playSound(u16.PVP_ARENA_ROUND_END)
        p38.draftMaid:DoCleaning()
    end
end
u6.CreateController(u17.new())
return nil