local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u3 = v1.import(script, script.Parent, "modules", "create-cannonball").createCannonball
local u4 = Random.new()
return {
    ["ShipsShootAtIsland"] = {
        ["name"] = "Ships shoot at island",
        ["event"] = "Heartbeat",
        ["func"] = function(p5, p6, _) --[[ Name: func, Line 9 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u4
                [3] = u3
            --]]
            if p5.elapsedEventTime < u2.PreparationEnds or p5.elapsedEventTime > u2.ShipGetShotDown then
                return nil
            end
            local v7 = p6:get("ships")
            if v7 ~= nil then
                v7 = v7.ship1
            end
            if v7 == nil then
                return nil
            end
            if p6:get("nextFireShot") == nil then
                p6:set("nextFireShot", os.clock() + 5)
                return nil
            end
            if p6:get("nextFireShot") > os.clock() then
                return nil
            end
            p6:set("nextFireShot", os.clock() + u4:NextNumber(0, 3))
            local v8 = u4:NextNumber(-200, 200)
            local v9 = u4
            local v10 = Vector3.new(38, 293.05, 302) + Vector3.new(v8, 0, v9:NextNumber(-200, 200))
            u3({
                ["origin"] = v7.cframe.Position,
                ["goal"] = v10
            })
        end
    }
}