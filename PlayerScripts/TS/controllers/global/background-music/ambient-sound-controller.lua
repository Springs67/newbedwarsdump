-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContentProvider = v3.ContentProvider;
local SoundService = v3.SoundService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "AmbientSoundController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: KnitController (copy), u2 (copy), SoundService (copy)
    KnitController.constructor(p6);
    p6.Name = "AmbientSoundController";
    p6.ambienceGroup = u2("SoundGroup", {
        Name = "Ambience",
        Parent = SoundService
    });
    p6.activeTracks = {};
end;

function u4.KnitStart(u7) -- Line: 36
    -- upvalues: KnitController (copy), GameSound (copy), PlaceUtil (copy)
    KnitController.KnitStart(u7);
    local WIND_AMBIENCE = GameSound.WIND_AMBIENCE;

    if PlaceUtil.isLobbyServer() then
        WIND_AMBIENCE = GameSound.FOREST_AMBIENCE;
    end;

    if PlaceUtil.isAfkServer() then
        WIND_AMBIENCE = nil;
    end;

    task.spawn(function() -- Line: 45
        -- upvalues: WIND_AMBIENCE (ref), u7 (copy)
        if WIND_AMBIENCE ~= "" and WIND_AMBIENCE then
            u7:startAmbience(WIND_AMBIENCE);
        end;
    end);
end;

function u4.startAmbience(u8, u9) -- Line: 62
    -- upvalues: ContentProvider (copy), u2 (copy), SoundManager (copy), u1 (copy)
    u8:stopAmbience(u9);
    ContentProvider:PreloadAsync({ u2("Sound", {
            SoundId = u9
        }) });
    local u10 = SoundManager:playSound(u9, {
        fadeInTime = 2,
        looped = true
    });
    u8.activeTracks[u9] = u10;
    local v11 = u10:getInstance();

    if v11 then
        v11.Name = "AmbientSoundController";
    end;

    local v12 = u1.new();
    v12:GiveTask(function() -- Line: 80
        -- upvalues: u8 (copy), u9 (copy), u10 (copy)
        if u8.activeTracks[u9] == u10 then
            u8:stopAmbience(u9);
        end;
    end);

    return v12;
end;

function u4.stopAmbience(p13, p14, p15) -- Line: 89
    -- upvalues: SoundManager (copy)
    local v16 = p15 == nil and 2 or p15;

    if p14 == nil then
        for i, v in p13.activeTracks do
            p13.activeTracks[i] = nil;

            if v16 > 0 then
                SoundManager:tweenSoundVolume(v, 0, v16);
            end;

            task.delay(v16, function() -- Line: 117
                -- upvalues: v (copy)
                v:Stop();
                v:Destroy();
            end);
        end;
    else
        local u17 = p13.activeTracks[p14];

        if u17 then
            p13.activeTracks[p14] = nil;

            if v16 > 0 then
                SoundManager:tweenSoundVolume(u17, 0, v16);
            end;

            task.delay(v16, function() -- Line: 105
                -- upvalues: u17 (copy)
                u17:Stop();
                u17:Destroy();
            end);
        end;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;