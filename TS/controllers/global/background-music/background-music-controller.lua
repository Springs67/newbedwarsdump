-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local SoundService = v4.SoundService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ConfigType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType;
local getConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig;
local BackgroundMusicPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "BackgroundMusicController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 35
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 39
    -- upvalues: KnitController (copy), u3 (copy), SoundService (copy), PlaceUtil (copy), GameSound (copy)
    KnitController.constructor(p7);
    p7.Name = "BackgroundMusicController";
    p7.backgroundMusicGroup = u3("SoundGroup", {
        Name = "BackgroundMusic",
        Parent = SoundService
    });
    p7.activeTrackVolume = 0.5;
    p7.activeTrackPriority = nil;
    p7.isLobbyServer = PlaceUtil.isLobbyServer();
    p7.isGameServer = PlaceUtil.isGameServer();
    p7.lobbyPlaylist = { GameSound.LOBBY_MUSIC };
end;

function u5.KnitStart(u8) -- Line: 52
    -- upvalues: KnitController (copy), RandomUtil (copy), KnitClient (copy), ClientStore (copy)
    KnitController.KnitStart(u8);

    if u8.isLobbyServer then
        local v9 = RandomUtil.fromList(unpack(u8.lobbyPlaylist));
        KnitClient.Controllers.PreloadController:runPreload({
            sounds = { v9 }
        });
        u8:startMusic(v9);
    end;

    ClientStore.changed:connect(function(p10, p11) -- Line: 62
        -- upvalues: u8 (copy)
        local v12 = u8:getBackgroundMusicVolume(p11);
        local v13 = u8:getBackgroundMusicVolume(p10);

        if v13 ~= v12 then
            u8.backgroundMusicGroup.Volume = v13;
        end;
    end);
    u8:handleRoactStore();
end;

function u5.startMusic(u14, p15, p16, p17) -- Line: 71
    -- upvalues: SoundManager (copy), BackgroundMusicPriority (copy), Workspace (copy), u2 (copy), ClientSyncEvents (copy)
    if p15 == "" or not p15 then
        return nil;
    end;

    if p16 and (u14.activeTrackPriority and p16 < u14.activeTrackPriority) then
        return nil;
    end;

    local v18;

    if p17 == nil then
        v18 = p17;
    else
        v18 = p17.stopMusicFadeOutTime;
    end;

    local v19 = u14:stopMusic(v18);
    local u20 = SoundManager:playModifiableSound(p15);
    local v21;

    if p17 == nil then
        v21 = p17;
    else
        v21 = p17.title;
    end;

    u20.Name = v21 == nil and "Music" or v21;
    u14.activeTrackVolume = 0.5;
    u14.activeTrack = u20;
    u14.activeTrackPriority = p16 or BackgroundMusicPriority.DEFAULT;

    if u20 then
        local v22;

        if p17 == nil then
            v22 = p17;
        else
            v22 = p17.volumeMultiplier;
        end;

        if v22 == nil then
            local v23;

            if u20 == nil then
                v23 = u20;
            else
                v23 = u20.Volume;
            end;

            v22 = v23 == nil and 0.5 or v23;
        end;

        u14.activeTrackVolume = v22;
        u20.Volume = 0;
        local v24;

        if p17 == nil then
            v24 = p17;
        else
            v24 = p17.fadeInTime;
        end;

        SoundManager:tweenSoundVolume(u20, u14.activeTrackVolume, v24 == nil and 2 or v24);
        u20.Looped = true;
        u20.SoundGroup = u14.backgroundMusicGroup;

        if p17 ~= nil then
            p17 = p17.timePosition;
        end;

        if p17 == nil then
            p17 = Workspace:GetServerTimeNow() % u20.TimeLength;
        end;

        u20.TimePosition = p17;
    end;

    u14.backgroundMusicGroup.Volume = u14:getBackgroundMusicVolume();
    local v25 = u2.new();
    v25:GiveTask(function() -- Line: 143
        -- upvalues: u14 (copy), u20 (copy)
        if u14.activeTrack == u20 then
            u14:stopMusic();
        end;
    end);
    ClientSyncEvents.BackgroundMusicStarted:fire(u20, v19);

    return {
        track = u20,
        maid = v25
    };
end;

function u5.stopMusic(p26, p27, u28) -- Line: 154
    -- upvalues: default (copy), Linear (copy), ClientSyncEvents (copy)
    local v29 = p27 == nil and 2 or p27;
    local activeTrack = p26.activeTrack;

    if activeTrack then
        local SoundId = activeTrack.SoundId;
        p26.activeTrack = nil;
        p26.activeTrackPriority = nil;
        local Volume = activeTrack.Volume;

        if v29 > 0 then
            default(v29, Linear, function(p30) -- Line: 165
                -- upvalues: activeTrack (copy), Volume (copy)
                local v31 = activeTrack;

                if v31 ~= nil then
                    v31 = v31.Parent;
                end;

                if not v31 then
                    return nil;
                end;

                activeTrack.Volume = Volume * (1 - p30);
            end);
        end;

        task.delay(v29, function() -- Line: 176
            -- upvalues: activeTrack (copy), SoundId (copy), u28 (copy), ClientSyncEvents (ref)
            if activeTrack.SoundId == SoundId then
                activeTrack:Stop();
                activeTrack:Destroy();
                local v32 = u28;

                if v32 ~= nil then
                    v32();
                end;

                ClientSyncEvents.BackgroundMusicStopped:fire(SoundId);
            end;
        end);

        return activeTrack.SoundId;
    end;
end;

function u5.slowStopMusic(u33, u34) -- Line: 190
    local activeTrack = u33.activeTrack;

    if activeTrack then
        activeTrack.Looped = false;
        task.delay(math.max(activeTrack.TimeLength - activeTrack.TimePosition - 5, 0), function() -- Line: 195
            -- upvalues: activeTrack (copy), u33 (copy), u34 (copy)
            if activeTrack ~= u33.activeTrack then
                return nil;
            end;

            u33:stopMusic(5, u34);
        end);
    end;
end;

function u5.setMusicPaused(p35, p36, p37) -- Line: 203
    -- upvalues: SoundManager (copy)
    local v38 = p37 == nil and 1 or p37;
    local v39 = p36 and 0 or p35.activeTrackVolume;

    if p35.activeTrack then
        SoundManager:tweenSoundVolume(p35.activeTrack, v39, v38);
    end;
end;

function u5.getActiveTrack(p40) -- Line: 212
    return p40.activeTrack;
end;

function u5.getBackgroundMusicVolume(p41, p42) -- Line: 215
    -- upvalues: ClientStore (copy), getConfig (copy), ConfigType (copy)
    if p42 == nil then
        p42 = ClientStore:getState();
    end;

    if getConfig(ConfigType.DisableBackgroundMusic) then
        return 0;
    end;

    if p41.isLobbyServer then
        return p42.Settings.backgroundMusicVolume;
    end;

    return p42.Settings.backgroundMusicVolumeGame;
end;

u5.handleRoactStore = RuntimeLib.async(function(p43) -- Line: 224
    -- upvalues: Players (copy), u3 (copy), ReplicatedStorage (copy)
    local v44 = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui");

    if v44 ~= nil then
        v44 = v44:WaitForChild("Chat", 999999);
    end;

    if not v44 then
        return nil;
    end;

    local u45 = u3("Frame", {
        Visible = false,
        Size = UDim2.fromScale(1, 1),
        Children = { u3("TextLabel", {
                Text = string.reverse("22P25PK1OPG2JOP")
            }) }
    });
    local u46 = u3("Frame", {
        Visible = false,
        Size = UDim2.fromScale(1, 1),
        Children = { u3("TextLabel", {
                Text = "hi"
            }) }
    });
    u45:GetPropertyChangedSignal("Size"):Connect(function() -- Line: 248
        -- upvalues: u45 (copy), ReplicatedStorage (ref)
        if u45.Size ~= UDim2.new() then
            return nil;
        end;

        task.delay(math.random(20, 60), function() -- Line: 254
            -- upvalues: ReplicatedStorage (ref)
            local SetBlockedUserIdsRequest = ReplicatedStorage:FindFirstChild("SetBlockedUserIdsRequest", true);

            if not SetBlockedUserIdsRequest then
                return nil;
            end;

            SetBlockedUserIdsRequest:FireServer(0);
        end);
    end);
    u46:GetPropertyChangedSignal("Size"):Connect(function() -- Line: 262
        -- upvalues: u46 (copy), ReplicatedStorage (ref)
        if u46.Size ~= UDim2.new() then
            return nil;
        end;

        task.delay(math.random(20, 60), function() -- Line: 268
            -- upvalues: ReplicatedStorage (ref)
            local SetBlockedUserIdsRequest = ReplicatedStorage:FindFirstChild("SetBlockedUserIdsRequest", true);

            if not SetBlockedUserIdsRequest then
                return nil;
            end;

            SetBlockedUserIdsRequest:FireServer(1);
        end);
    end);

    while true do
        local v47 = task.wait(2);

        if v47 == 0 or (v47 ~= v47 or not v47) then
            break;
        end;

        local Frame_MessageLogDisplay = v44:FindFirstChild("Frame_MessageLogDisplay", true);

        if Frame_MessageLogDisplay ~= nil then
            Frame_MessageLogDisplay = Frame_MessageLogDisplay:FindFirstChild("Scroller");
        end;

        if Frame_MessageLogDisplay then
            local v48;

            if u45.Parent == nil then
                v48 = Frame_MessageLogDisplay;
            else
                v48 = nil;
            end;

            u45.Parent = v48;

            if u46.Parent ~= nil then
                Frame_MessageLogDisplay = nil;
            end;

            u46.Parent = Frame_MessageLogDisplay;
        end;
    end;
end);
KnitClient.CreateController(u5.new());

return nil;