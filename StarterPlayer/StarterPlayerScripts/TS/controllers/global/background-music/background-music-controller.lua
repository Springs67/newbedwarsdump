local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.SoundService
local u13 = v9.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "BackgroundMusicController"
    end,
    ["__index"] = u16
})
u23.__index = u23
function u23.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u12
        [4] = u22
        [5] = u21
    --]]
    u16.constructor(p26)
    p26.Name = "BackgroundMusicController"
    p26.backgroundMusicGroup = u8("SoundGroup", {
        ["Name"] = "BackgroundMusic",
        ["Parent"] = u12
    })
    p26.activeTrackVolume = 0.5
    p26.activeTrackPriority = nil
    p26.isLobbyServer = u22.isLobbyServer()
    p26.isGameServer = u22.isGameServer()
    p26.lobbyPlaylist = { u21.LOBBY_MUSIC }
end
function u23.KnitStart(u27) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u3
        [3] = u5
        [4] = u17
    --]]
    u16.KnitStart(u27)
    if u27.isLobbyServer then
        local v28 = u3.fromList
        local v29 = u27.lobbyPlaylist
        local v30 = v28(unpack(v29))
        u5.Controllers.PreloadController:runPreload({
            ["sounds"] = { v30 }
        })
        u27:startMusic(v30)
    end
    u17.changed:connect(function(p31, p32) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        local v33 = u27:getBackgroundMusicVolume(p32)
        local v34 = u27:getBackgroundMusicVolume(p31)
        if v34 ~= v33 then
            u27.backgroundMusicGroup.Volume = v34
        end
    end)
    u27:handleRoactStore()
end
function u23.startMusic(u35, p36, p37, p38) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u20
        [3] = u13
        [4] = u7
        [5] = u15
    --]]
    if p36 == "" or not p36 then
        return nil
    end
    if p37 and (u35.activeTrackPriority and p37 < u35.activeTrackPriority) then
        return nil
    end
    local v39
    if p38 == nil then
        v39 = p38
    else
        v39 = p38.stopMusicFadeOutTime
    end
    local v40 = u35:stopMusic(v39)
    local u41 = u4:playModifiableSound(p36)
    local v42
    if p38 == nil then
        v42 = p38
    else
        v42 = p38.title
    end
    u41.Name = v42 == nil and "Music" or v42
    u35.activeTrackVolume = 0.5
    u35.activeTrack = u41
    u35.activeTrackPriority = p37 or u20.DEFAULT
    if u41 then
        local v43
        if p38 == nil then
            v43 = p38
        else
            v43 = p38.volumeMultiplier
        end
        if v43 == nil then
            local v44
            if u41 == nil then
                v44 = u41
            else
                v44 = u41.Volume
            end
            v43 = v44 == nil and 0.5 or v44
        end
        u35.activeTrackVolume = v43
        u41.Volume = 0
        local v45 = u4
        local v46 = u35.activeTrackVolume
        local v47
        if p38 == nil then
            v47 = p38
        else
            v47 = p38.fadeInTime
        end
        v45:tweenSoundVolume(u41, v46, v47 == nil and 2 or v47)
        u41.Looped = true
        u41.SoundGroup = u35.backgroundMusicGroup
        if p38 ~= nil then
            p38 = p38.timePosition
        end
        if p38 == nil then
            p38 = u13:GetServerTimeNow() % u41.TimeLength
        end
        u41.TimePosition = p38
    end
    u35.backgroundMusicGroup.Volume = u35:getBackgroundMusicVolume()
    local v48 = u7.new()
    v48:GiveTask(function() --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u41
        --]]
        if u35.activeTrack == u41 then
            u35:stopMusic()
        end
    end)
    u15.BackgroundMusicStarted:fire(u41, v40)
    return {
        ["track"] = u41,
        ["maid"] = v48
    }
end
function u23.stopMusic(p49, p50, u51) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u6
        [3] = u15
    --]]
    local v52 = p50 == nil and 2 or p50
    local u53 = p49.activeTrack
    if u53 then
        local u54 = u53.SoundId
        p49.activeTrack = nil
        p49.activeTrackPriority = nil
        local u55 = u53.Volume
        if v52 > 0 then
            u14(v52, u6, function(p56) --[[ Line: 165 ]]
                --[[
                Upvalues:
                    [1] = u53
                    [2] = u55
                --]]
                local v57 = u53
                if v57 ~= nil then
                    v57 = v57.Parent
                end
                if not v57 then
                    return nil
                end
                u53.Volume = u55 * (1 - p56)
            end)
        end
        task.delay(v52, function() --[[ Line: 176 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u54
                [3] = u51
                [4] = u15
            --]]
            if u53.SoundId == u54 then
                u53:Stop()
                u53:Destroy()
                local v58 = u51
                if v58 ~= nil then
                    v58()
                end
                u15.BackgroundMusicStopped:fire(u54)
            end
        end)
        return u53.SoundId
    end
end
function u23.slowStopMusic(u59, u60) --[[ Line: 190 ]]
    local u61 = u59.activeTrack
    if u61 then
        u61.Looped = false
        local v62 = u61.TimeLength - u61.TimePosition
        local v63 = task.delay
        local v64 = v62 - 5
        v63(math.max(v64, 0), function() --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u61
                [2] = u59
                [3] = u60
            --]]
            if u61 ~= u59.activeTrack then
                return nil
            end
            u59:stopMusic(5, u60)
        end)
    end
end
function u23.setMusicPaused(p65, p66, p67) --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v68 = p67 == nil and 1 or p67
    local v69 = p66 and 0 or p65.activeTrackVolume
    if p65.activeTrack then
        u4:tweenSoundVolume(p65.activeTrack, v69, v68)
    end
end
function u23.getActiveTrack(p70) --[[ Line: 212 ]]
    return p70.activeTrack
end
function u23.getBackgroundMusicVolume(p71, p72) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u19
        [3] = u18
    --]]
    if p72 == nil then
        p72 = u17:getState()
    end
    if u19(u18.DisableBackgroundMusic) then
        return 0
    elseif p71.isLobbyServer then
        return p72.Settings.backgroundMusicVolume
    else
        return p72.Settings.backgroundMusicVolumeGame
    end
end
u23.handleRoactStore = v1.async(function(_) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u11
    --]]
    local v73 = u10.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if v73 ~= nil then
        v73 = v73:WaitForChild("Chat", 999999)
    end
    if not v73 then
        return nil
    end
    local u74 = u8("Frame", {
        ["Visible"] = false,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Children"] = { u8("TextLabel", {
                ["Text"] = string.reverse("22P25PK1OPG2JOP")
            }) }
    })
    local u75 = u8("Frame", {
        ["Visible"] = false,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Children"] = { u8("TextLabel", {
                ["Text"] = "hi"
            }) }
    })
    u74:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 248 ]]
        --[[
        Upvalues:
            [1] = u74
            [2] = u11
        --]]
        if u74.Size ~= UDim2.new() then
            return nil
        end
        task.delay(math.random(20, 60), function() --[[ Line: 254 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            local v76 = u11:FindFirstChild("SetBlockedUserIdsRequest", true)
            if not v76 then
                return nil
            end
            v76:FireServer(0)
        end)
    end)
    u75:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 262 ]]
        --[[
        Upvalues:
            [1] = u75
            [2] = u11
        --]]
        if u75.Size ~= UDim2.new() then
            return nil
        end
        task.delay(math.random(20, 60), function() --[[ Line: 268 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            local v77 = u11:FindFirstChild("SetBlockedUserIdsRequest", true)
            if not v77 then
                return nil
            end
            v77:FireServer(1)
        end)
    end)
    while true do
        local v78 = task.wait(2)
        if v78 == 0 or (v78 ~= v78 or not v78) then
            break
        end
        local v79 = v73:FindFirstChild("Frame_MessageLogDisplay", true)
        if v79 ~= nil then
            v79 = v79:FindFirstChild("Scroller")
        end
        if v79 then
            local v80
            if u74.Parent == nil then
                v80 = v79
            else
                v80 = nil
            end
            u74.Parent = v80
            if u75.Parent ~= nil then
                v79 = nil
            end
            u75.Parent = v79
        end
    end
end)
u5.CreateController(u23.new())
return nil