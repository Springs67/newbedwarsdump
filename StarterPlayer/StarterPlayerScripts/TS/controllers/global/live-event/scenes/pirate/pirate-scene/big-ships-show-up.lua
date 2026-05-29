local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, script.Parent, "modules", "setup-ship-anim").setupShipAnim
local u10 = { "bigShip1", "bigShip2", "bigShip3" }
return {
    ["BigShipsShowUp"] = {
        ["name"] = "Big ships show up",
        ["event"] = "Heartbeat",
        ["priority"] = -20,
        ["func"] = function(p11, p12, _) --[[ Name: func, Line 16 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u10
                [3] = u5
                [4] = u6
                [5] = u9
                [6] = u3
                [7] = u2
                [8] = u8
            --]]
            local v13 = p12:get("ships")
            if v13 == nil then
                return nil
            end
            if p11.elapsedEventTime > u7.CelebrationEnds then
                local v14 = false
                for v15, v16 in pairs(u10) do
                    local v17 = v13[v16]
                    if v17 then
                        local v18 = u3(p11.elapsedEventTime - u7.CelebrationEnds, 0, 1, u7.BigShipsArrive - u7.CelebrationEnds)
                        local v19 = u3(math.clamp(v18, 0, 1), -1200, 400, 1)
                        local v20 = CFrame.new
                        local v21 = -600 + 300 * v15
                        v17.cframe = v20((Vector3.new(v21, 500, v19))) * CFrame.Angles(0, 3.141592653589793, 0)
                    else
                        v14 = true
                        local v22
                        if v15 == 2 then
                            v22 = u5.Assets.Misc.RoyalPirateShip:Clone()
                        else
                            v22 = u5.Assets.Misc.PirateShip:Clone()
                        end
                        v22.Parent = u6
                        v13[v16] = {
                            ["timeOffset"] = 980,
                            ["seed"] = 948074,
                            ["heightOffset"] = 0,
                            ["radiusX"] = 900,
                            ["radiusY"] = 900,
                            ["instance"] = v22,
                            ["cframe"] = CFrame.new()
                        }
                        u9(v22)
                    end
                end
                if v14 then
                    u2:playSound(u8.PIRATE_EVENT_MOTHERSHIP, {
                        ["volumeMultiplier"] = 3,
                        ["position"] = Vector3.new(17, 700, -1200),
                        ["rollOffMaxDistance"] = 1000000,
                        ["rollOffMinDistance"] = 1000
                    })
                end
            else
                for _, v23 in u10 do
                    v13[v23] = nil
                end
            end
            p12:set("ships", v13)
        end
    }
}