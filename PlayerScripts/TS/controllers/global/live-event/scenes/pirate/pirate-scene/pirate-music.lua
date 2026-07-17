-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    PirateMusic = {
        name = "music",
        event = "Heartbeat",

        func = function(p1, p2, p3) -- Line: 9, Name: func
            -- upvalues: PirateSceneTimestamps (copy), SoundManager (copy), GameSound (copy)
            if p1.elapsedEventTime < PirateSceneTimestamps.ShipReappears then
                return nil;
            end;

            if not p2:get("musicTrack") then
                p2:set("musicTrack", SoundManager:playModifiableSound(GameSound.PIRATE_EVENT_MUSIC));
            end;

            local v4 = p2:get("musicTrack");

            if v4 then
                local v5 = p1.elapsedEventTime - PirateSceneTimestamps.ShipReappears;

                if math.abs(v4.TimePosition - v5) > 0.25 then
                    v4.TimePosition = v5;
                end;
            end;
        end
    }
};