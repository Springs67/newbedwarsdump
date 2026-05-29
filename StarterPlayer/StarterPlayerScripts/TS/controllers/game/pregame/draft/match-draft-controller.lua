local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "MatchDraftController"
    end,
    ["__index"] = u11
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
    --]]
    u11.constructor(p22)
    p22.Name = "MatchDraftController"
    p22.draftMaid = u9.new()
    p22.draftInitialized = false
end
function u19.KnitStart(u23) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
        [3] = u14
        [4] = u16
        [5] = u12
    --]]
    u11.KnitStart(u23)
    u7.Controllers.MatchController:getQueueTypeAsync():andThen(function(p24) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u14
            [3] = u16
            [4] = u12
            [5] = u23
        --]]
        local _, v25 = u7.Controllers.MatchController:getCustomMatchConfigAsync():await()
        local v26 = u14[p24].drafting
        if v26 ~= nil then
            v26 = v26.enabled
        end
        if v26 then
            v26 = v25 == nil
        end
        if v26 then
            u16.Client:Get("MatchDraftDataUpdate"):Connect(function(p27) --[[ Line: 54 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u23
                --]]
                u12:dispatch({
                    ["type"] = "SetDraft",
                    ["data"] = p27
                })
                if not u23.draftInitialized then
                    u23:initDraft()
                end
            end)
            u23:requestDraftData()
        end
    end)
end
function u19.requestDraftData(u28, p29) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
        [3] = u8
        [4] = u15
        [5] = u12
    --]]
    local u30 = p29 == nil and 0 or p29
    u16.Client:Get("GetMatchDraftData"):CallServerAsync():andThen(function(p31) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u30
            [3] = u19
            [4] = u8
            [5] = u15
            [6] = u12
        --]]
        if not u28.draftInitialized then
            u28:initDraft()
        end
        if not p31.data then
            if u30 < u19.DRAFT_DATA_MAX_ATTEMPTS - 1 and u8.Controllers.MatchController:getMatchState() == u15.PRE then
                task.delay(u19.DRAFT_DATA_RETRY_SECONDS, function() --[[ Line: 79 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u30
                    --]]
                    u28:requestDraftData(u30 + 1)
                end)
            end
            return nil
        end
        u12:dispatch({
            ["type"] = "SetDraft",
            ["data"] = p31.data
        })
    end)
end
function u19.initDraft(u32) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u15
        [3] = u12
        [4] = u10
    --]]
    if u32.draftInitialized then
        return nil
    end
    u32.draftInitialized = true
    u32.draftMaid:GiveTask(function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32.draftInitialized = false
    end)
    if u8.Controllers.MatchController:getMatchState() == u15.PRE then
        u32:mountUI(u8.Controllers.MapController:getMapName())
    end
    local u35 = u12.changed:connect(function(p33, p34) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u32
        --]]
        if p33.Game ~= p34.Game and p33.Game.matchState ~= u15.PRE then
            u32:unmountUI()
        end
    end)
    u32.draftMaid:GiveTask(function() --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35:disconnect()
    end)
    u32.draftMaid:GiveTask(u10.MatchStateChange:connect(function(p36) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u32
            [3] = u8
        --]]
        if p36.customMatch then
            return nil
        elseif p36.matchState == u15.PRE then
            u32:mountUI(u8.Controllers.MapController:getMapName())
        else
            u32:unmountUI()
        end
    end))
end
function u19.mountUI(p37, p38) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u7
        [3] = u4
        [4] = u17
        [5] = u2
        [6] = u13
    --]]
    p37:unmountUI()
    local v39 = { u18.MATCH_MUSIC_FORGE }
    u7.Controllers.BackgroundMusicController:startMusic(u4.randomArraySelectN(v39, 1)[1], u17.MENU)
    p37.draftMaid:GiveTask(function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        u7.Controllers.BackgroundMusicController:stopMusic(2)
    end)
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u13.MATCH_DRAFT_APP, {
        ["MapId"] = p38
    })
end
function u19.unmountUI(p40) --[[ Line: 135 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u13
        [3] = u5
        [4] = u18
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u13.MATCH_DRAFT_APP) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u13.MATCH_DRAFT_APP)
        u5:playSound(u18.PVP_ARENA_ROUND_END)
        p40.draftMaid:DoCleaning()
    end
end
u19.DRAFT_DATA_MAX_ATTEMPTS = 5
u19.DRAFT_DATA_RETRY_SECONDS = 1
u7.CreateController(u19.new())
return nil