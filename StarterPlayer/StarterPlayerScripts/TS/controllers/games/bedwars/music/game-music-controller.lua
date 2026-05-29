local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-music")
local u9 = v8.GameMusicAction
local u10 = v8.GameMusicConfig
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "GameMusicController"
    end,
    ["__index"] = u5
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
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
    --]]
    u5.constructor(p14)
    p14.Name = "GameMusicController"
    p14.isPlaying = false
    p14.musicPlaylist = u10.EARLY_GAME_PLAYLIST
    p14.autoPlayer = true
    p14.pendingAction = nil
end
function u11.KnitStart(u15) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u3
        [4] = u10
        [5] = u7
        [6] = u4
        [7] = u9
    --]]
    u5.KnitStart(u15)
    u15:startMusic()
    u6.Client:OnEvent("BedwarsSuddenDeath", function(_) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u10
            [3] = u7
            [4] = u15
        --]]
        u3.Controllers.BackgroundMusicController:startMusic(u10.LATE_GAME_PLAYLIST[1].soundId, u7.CUSTOM)
        u15:setPlaylist(u10.LATE_GAME_PLAYLIST)
    end)
    u6.Client:OnEvent("PlayGameMusic", function(u16) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
        --]]
        if u16.waitForActiveTrackToEnd then
            u3.Controllers.BackgroundMusicController:slowStopMusic(function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u16
                    [3] = u7
                --]]
                u3.Controllers.BackgroundMusicController:startMusic(u16.soundId, u16.priority or u7.CUSTOM)
            end)
        else
            u3.Controllers.BackgroundMusicController:startMusic(u16.soundId, u16.priority or u7.CUSTOM)
        end
    end)
    u4.BackgroundMusicStopped:connect(function(p17) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u3
            [3] = u9
        --]]
        local v18 = p17.oldSoundId
        local v19
        if v18 == "" or not v18 then
            v19 = v18
        else
            v19 = u15:isPlaylistMusic(v18)
        end
        if v19 ~= "" and v19 then
            local v20 = u3.Controllers.BackgroundMusicController:getActiveTrack()
            local v21
            if v20 then
                local v22 = u15
                if v20 ~= nil then
                    v20 = v20.SoundId
                end
                v21 = v22:isPlaylistMusic(v20)
            else
                v21 = false
            end
            if not v21 then
                u15.isPlaying = false
            end
            if u15.pendingAction == u9.SWITCHING_TRACKS then
                u15:startMusic(v18 ~= "" and v18 and { v18 } or nil)
            end
            if u15.pendingAction then
                u15.pendingAction = nil
            end
            return nil
        end
        task.delay(2, function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u15
            --]]
            if not u3.Controllers.BackgroundMusicController:getActiveTrack() then
                u15:startMusic(nil, {
                    ["fadeInTime"] = 5
                })
            end
        end)
    end)
    local u23 = 0
    task.spawn(function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u3
            [3] = u23
            [4] = u9
        --]]
        while true do
            local v24 = u15.autoPlayer
            if v24 then
                v24 = task.wait(50 + math.random() * 10)
            end
            if v24 == 0 or (v24 ~= v24 or not v24) then
                return
            end
            if not u15.pendingAction then
                local v25 = u3.Controllers.BackgroundMusicController:getActiveTrack()
                if v25 then
                    local v26 = u15
                    if v25 ~= nil then
                        v25 = v25.SoundId
                    end
                    v25 = not v26:isPlaylistMusic(v25)
                end
                if not v25 then
                    local v27 = math.random()
                    local v28 = u23 * 0.1 + 0.35
                    if v27 < 0.2 then
                        if u15.isPlaying then
                            u15:setAction(u9.GOING_TO_SILENCE)
                            u3.Controllers.BackgroundMusicController:slowStopMusic()
                        end
                        u23 = 3
                    elseif v27 < v28 + 0.2 then
                        if u15.isPlaying and #u15.musicPlaylist > 1 then
                            u15:setAction(u9.SWITCHING_TRACKS)
                            u3.Controllers.BackgroundMusicController:slowStopMusic()
                        elseif not u15.isPlaying then
                            u15:setAction(u9.SWITCHING_TRACKS)
                            u15:startMusic()
                        end
                        u23 = 0
                    else
                        u23 = u23 + 1
                    end
                end
            end
        end
    end)
end
function u11.startMusic(p29, p30, p31) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u7
    --]]
    local v32 = 0
    local v33 = {}
    for v34, v35 in p29.musicPlaylist do
        local _ = v34 - 1
        local v36
        if p30 == nil then
            v36 = p30
        else
            local v37 = v35.soundId
            v36 = table.find(p30, v37) ~= nil
        end
        if not v36 == true then
            v32 = v32 + 1
            v33[v32] = v35
        end
    end
    local v38 = u2.fromList
    local v39 = u2.shuffleArray
    local v40 = v38(unpack(v39(v33)))
    local v41 = u3.Controllers.BackgroundMusicController
    local v42 = v40.soundId
    local v43 = u7.DEFAULT
    local v44 = {
        ["stopMusicFadeOutTime"] = 0,
        ["volumeMultiplier"] = v40.volumeMultiplier
    }
    if p31 ~= nil then
        p31 = p31.fadeInTime
    end
    v44.fadeInTime = p31
    local v45 = v41:startMusic(v42, v43, v44)
    p29.isPlaying = true
    p29.pendingAction = nil
    return v45
end
function u11.stopMusic(_) --[[ Line: 194 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.Controllers.BackgroundMusicController:stopMusic()
end
function u11.setPlaylist(p46, p47) --[[ Line: 197 ]]
    p46.musicPlaylist = p47
end
function u11.addToPlaylist(p48, p49) --[[ Line: 200 ]]
    local v50 = {}
    local v51 = #v50
    local v52 = p48.musicPlaylist
    local v53 = #v52
    table.move(v52, 1, v53, v51 + 1, v50)
    local v54 = v51 + v53
    table.move(p49, 1, #p49, v54 + 1, v50)
    p48.musicPlaylist = v50
end
function u11.enableAutoplayer(p55) --[[ Line: 210 ]]
    p55.autoPlayer = true
end
function u11.disableAutoplayer(p56) --[[ Line: 213 ]]
    p56.autoPlayer = false
end
function u11.setAction(p57, p58) --[[ Line: 216 ]]
    p57.pendingAction = p58
end
function u11.isPlaylistMusic(p59, p60) --[[ Line: 219 ]]
    local v61 = nil
    for v62, v63 in p59.musicPlaylist do
        local _ = v62 - 1
        if v63.soundId == p60 == true then
            v61 = v63
            break
        end
    end
    return v61 ~= nil
end
u3.CreateController(u11.new())
return nil