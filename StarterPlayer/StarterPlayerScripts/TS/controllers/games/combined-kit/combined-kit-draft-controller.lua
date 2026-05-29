local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = u1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = u1.import(script, script.Parent, "ui", "combined-kit-draft-app").KIT_SELECTION_LENGTH
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "CombinedKitDraftController"
    end,
    ["__index"] = u11
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u9
    --]]
    u11.constructor(p24, { u14.COMBINED_KIT })
    p24.Name = "CombinedKitDraftController"
    p24.draftMaid = u9.new()
    p24.draftInitialized = false
end
function u21.KnitStart(p25) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p25)
end
function u21.onGameInit(p26) --[[ Line: 45 ]]
    p26:initDraft()
end
u21.onKitSelect = u1.async(function(p27, p28, p29) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u15
        [3] = u1
        [4] = u17
    --]]
    if not p27.draftKit then
        p27.draftKit = table.create(u20, u15.RANDOM)
    end
    p27.draftKit[p29 + 1] = p28
    local v30 = u1.await(u17.Client:Get("CombinedKitDraftSelectKit"):CallServerAsync({
        ["kit"] = p28,
        ["index"] = p29
    }))
    if v30 then
        p27.draftKit = v30
    end
    return p27.draftKit
end)
function u21.initDraft(u31) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u16
        [3] = u12
        [4] = u10
    --]]
    if u31.draftInitialized then
        return nil
    end
    u31.draftInitialized = true
    u31.draftMaid:GiveTask(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31.draftInitialized = false
    end)
    if u8.Controllers.MatchController:getMatchState() == u16.PRE then
        u31:mountUI()
    end
    local u34 = u12.changed:connect(function(p32, p33) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u31
        --]]
        if p32.Game ~= p33.Game and p32.Game.matchState ~= u16.PRE then
            u31:unmountUI(true)
        end
    end)
    u31.draftMaid:GiveTask(function() --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:disconnect()
    end)
    u31.draftMaid:GiveTask(u10.MatchStateChange:connect(function(p35) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u31
        --]]
        if p35.customMatch then
            return nil
        elseif p35.matchState == u16.PRE then
            u31:mountUI()
        else
            u31:unmountUI(true)
        end
    end))
end
function u21.mountUI(p36) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u7
        [3] = u4
        [4] = u18
        [5] = u2
        [6] = u13
    --]]
    p36:unmountUI()
    local v37 = { u19.MATCH_MUSIC_FORGE }
    u7.Controllers.BackgroundMusicController:startMusic(u4.randomArraySelectN(v37, 1)[1], u18.MENU)
    p36.draftMaid:GiveTask(function() --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        u7.Controllers.BackgroundMusicController:stopMusic(2)
    end)
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u13.COMBINED_KIT_DRAFT_APP, {
        ["SelectedKits"] = p36.draftKit
    })
end
function u21.unmountUI(p38, p39) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u13
        [3] = u5
        [4] = u19
    --]]
    if p39 == nil then
        p39 = false
    end
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u13.COMBINED_KIT_DRAFT_APP) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u13.COMBINED_KIT_DRAFT_APP)
        if p39 then
            u5:playSound(u19.PVP_ARENA_ROUND_END)
        end
        p38.draftMaid:DoCleaning()
    end
end
u7.CreateController(u21.new())
return nil