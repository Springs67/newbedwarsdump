-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local BackgroundMusicPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-music");
local GameMusicAction = v1.GameMusicAction;
local GameMusicConfig = v1.GameMusicConfig;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "GameMusicController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy), GameMusicConfig (copy)
    KnitController.constructor(p4);
    p4.Name = "GameMusicController";
    p4.isPlaying = false;
    p4.musicPlaylist = GameMusicConfig.EARLY_GAME_PLAYLIST;
    p4.autoPlayer = true;
    p4.pendingAction = nil;
end;

function u2.KnitStart(u5) -- Line: 34
    -- upvalues: KnitController (copy), default (copy), KnitClient (copy), GameMusicConfig (copy), BackgroundMusicPriority (copy), ClientSyncEvents (copy), GameMusicAction (copy)
    KnitController.KnitStart(u5);
    u5:startMusic();
    default.Client:OnEvent("BedwarsSuddenDeath", function(p6) -- Line: 37
        -- upvalues: KnitClient (ref), GameMusicConfig (ref), BackgroundMusicPriority (ref), u5 (copy)
        KnitClient.Controllers.BackgroundMusicController:startMusic(GameMusicConfig.LATE_GAME_PLAYLIST[1].soundId, BackgroundMusicPriority.CUSTOM);
        u5:setPlaylist(GameMusicConfig.LATE_GAME_PLAYLIST);
    end);
    default.Client:OnEvent("PlayGameMusic", function(u7) -- Line: 43
        -- upvalues: KnitClient (ref), BackgroundMusicPriority (ref)
        if u7.waitForActiveTrackToEnd then
            KnitClient.Controllers.BackgroundMusicController:slowStopMusic(function() -- Line: 45
                -- upvalues: KnitClient (ref), u7 (copy), BackgroundMusicPriority (ref)
                KnitClient.Controllers.BackgroundMusicController:startMusic(u7.soundId, u7.priority or BackgroundMusicPriority.CUSTOM);
            end);

            return;
        end;

        KnitClient.Controllers.BackgroundMusicController:startMusic(u7.soundId, u7.priority or BackgroundMusicPriority.CUSTOM);
    end);
    ClientSyncEvents.BackgroundMusicStopped:connect(function(p8) -- Line: 52
        -- upvalues: u5 (copy), KnitClient (ref), GameMusicAction (ref)
        local oldSoundId = p8.oldSoundId;
        local v9;

        if oldSoundId == "" or not oldSoundId then
            v9 = oldSoundId;
        else
            v9 = u5:isPlaylistMusic(oldSoundId);
        end;

        if v9 ~= "" and v9 then
            local v10 = KnitClient.Controllers.BackgroundMusicController:getActiveTrack();
            local v11;

            if v10 then
                if v10 ~= nil then
                    v10 = v10.SoundId;
                end;

                v11 = u5:isPlaylistMusic(v10);
            else
                v11 = false;
            end;

            if not v11 then
                u5.isPlaying = false;
            end;

            if u5.pendingAction == GameMusicAction.SWITCHING_TRACKS then
                u5:startMusic(oldSoundId ~= "" and oldSoundId and { oldSoundId } or nil);
            end;

            if u5.pendingAction then
                u5.pendingAction = nil;
            end;

            return nil;
        end;

        task.delay(2, function() -- Line: 84
            -- upvalues: KnitClient (ref), u5 (ref)
            if not KnitClient.Controllers.BackgroundMusicController:getActiveTrack() then
                u5:startMusic(nil, {
                    fadeInTime = 5
                });
            end;
        end);
    end);
    local u12 = 0;
    task.spawn(function() -- Line: 103
        -- upvalues: u5 (copy), KnitClient (ref), u12 (ref), GameMusicAction (ref)
        while true do
            local v13 = u5.autoPlayer and task.wait(50 + math.random() * 10);

            if v13 == 0 or (v13 ~= v13 or not v13) then
                return;
            end;

            if not u5.pendingAction then
                local v14 = KnitClient.Controllers.BackgroundMusicController:getActiveTrack();

                if v14 then
                    if v14 ~= nil then
                        v14 = v14.SoundId;
                    end;

                    v14 = not u5:isPlaylistMusic(v14);
                end;

                if not v14 then
                    local v15 = math.random();
                    local v16 = u12 * 0.1 + 0.35;

                    if v15 < 0.2 then
                        if u5.isPlaying then
                            u5:setAction(GameMusicAction.GOING_TO_SILENCE);
                            KnitClient.Controllers.BackgroundMusicController:slowStopMusic();
                        end;

                        u12 = 3;
                    elseif v15 < v16 + 0.2 then
                        if u5.isPlaying and #u5.musicPlaylist > 1 then
                            u5:setAction(GameMusicAction.SWITCHING_TRACKS);
                            KnitClient.Controllers.BackgroundMusicController:slowStopMusic();
                        elseif not u5.isPlaying then
                            u5:setAction(GameMusicAction.SWITCHING_TRACKS);
                            u5:startMusic();
                        end;

                        u12 = 0;
                    else
                        u12 = u12 + 1;
                    end;
                end;
            end;
        end;
    end);
end;

function u2.startMusic(p17, u18, p19) -- Line: 154
    -- upvalues: RandomUtil (copy), KnitClient (copy), BackgroundMusicPriority (copy)
    local function _(p20) -- Line: 156
        -- upvalues: u18 (copy)
        local v21 = u18;

        if v21 ~= nil then
            v21 = table.find(v21, p20.soundId) ~= nil;
        end;

        return not v21;
    end;

    local v22 = 0;
    local v23 = {};

    for i, v in p17.musicPlaylist do
        local _ = i - 1;
        local v24;

        if u18 == nil then
            v24 = u18;
        else
            v24 = table.find(u18, v.soundId) ~= nil;
        end;

        if not v24 == true then
            v22 = v22 + 1;
            v23[v22] = v;
        end;
    end;

    local v25 = RandomUtil.fromList(unpack(RandomUtil.shuffleArray(v23)));
    local BackgroundMusicController = KnitClient.Controllers.BackgroundMusicController;
    local soundId = v25.soundId;
    local DEFAULT = BackgroundMusicPriority.DEFAULT;
    local v26 = {
        stopMusicFadeOutTime = 0,
        volumeMultiplier = v25.volumeMultiplier
    };

    if p19 ~= nil then
        p19 = p19.fadeInTime;
    end;

    v26.fadeInTime = p19;
    local v27 = BackgroundMusicController:startMusic(soundId, DEFAULT, v26);
    p17.isPlaying = true;
    p17.pendingAction = nil;

    return v27;
end;

function u2.stopMusic(p28) -- Line: 194
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.BackgroundMusicController:stopMusic();
end;

function u2.setPlaylist(p29, p30) -- Line: 197
    p29.musicPlaylist = p30;
end;

function u2.addToPlaylist(p31, p32) -- Line: 200
    local v33 = {};
    local v34 = #v33;
    local musicPlaylist = p31.musicPlaylist;
    local v35 = #musicPlaylist;
    table.move(musicPlaylist, 1, v35, v34 + 1, v33);
    table.move(p32, 1, #p32, v34 + v35 + 1, v33);
    p31.musicPlaylist = v33;
end;

function u2.enableAutoplayer(p36) -- Line: 210
    p36.autoPlayer = true;
end;

function u2.disableAutoplayer(p37) -- Line: 213
    p37.autoPlayer = false;
end;

function u2.setAction(p38, p39) -- Line: 216
    p38.pendingAction = p39;
end;

function u2.isPlaylistMusic(p40, u41) -- Line: 219
    local function _(p42) -- Line: 221
        -- upvalues: u41 (copy)
        return p42.soundId == u41;
    end;

    local v43 = nil;

    for i, v in p40.musicPlaylist do
        local _ = i - 1;

        if v.soundId == u41 == true then
            v43 = v;
            break;
        end;
    end;

    return v43 ~= nil;
end;

KnitClient.CreateController(u2.new());

return nil;