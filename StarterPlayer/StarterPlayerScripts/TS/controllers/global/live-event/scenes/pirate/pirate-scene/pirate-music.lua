local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["PirateMusic"] = {
        ["name"] = "music",
        ["event"] = "Heartbeat",
        ["func"] = function(p5, p6, _) --[[ Name: func, Line 9 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u2
                [3] = u4
            --]]
            if p5.elapsedEventTime < u3.ShipReappears then
                return nil
            end
            if not p6:get("musicTrack") then
                p6:set("musicTrack", u2:playModifiableSound(u4.PIRATE_EVENT_MUSIC))
            end
            local v7 = p6:get("musicTrack")
            if v7 then
                local v8 = p5.elapsedEventTime - u3.ShipReappears
                local v9 = v7.TimePosition - v8
                if math.abs(v9) > 0.25 then
                    v7.TimePosition = v8
                end
            end
        end
    }
}