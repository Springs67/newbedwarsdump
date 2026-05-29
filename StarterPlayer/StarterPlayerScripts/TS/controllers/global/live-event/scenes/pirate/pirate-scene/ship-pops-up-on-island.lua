local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
return {
    ["ShipPopsUpOnIsland"] = {
        ["name"] = "Ship pops up on island",
        ["event"] = "Heartbeat",
        ["priority"] = -30,
        ["func"] = function(p2, p3, _) --[[ Name: func, Line 8 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            if p2.elapsedEventTime > u1.BigExplosionHit + 3 then
                local v4 = p3:get("ships")
                if v4 == nil then
                    return nil
                end
                local v5 = v4.bigShip1
                local v6 = v4.bigShip2
                local v7 = v4.bigShip3
                if v5 then
                    v5.cframe = CFrame.new(58.445, 395.882, 456.943) * CFrame.Angles(0, -1.3089969389957472, 0)
                end
                if v6 then
                    v6.cframe = CFrame.new(97.652, 388.882, 206.858) * CFrame.Angles(0, 0.7853981633974483, 0)
                end
                if v7 then
                    v7.cframe = CFrame.new(-141.835, 430.882, 293.584) * CFrame.Angles(0, -2.6179938779914944, 0)
                end
                p3:set("ships", v4)
            end
        end
    }
}