local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u4 = v3.InQuad
local u5 = v3.OutQuart
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src", "Runtime").useEffect
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Lighting
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u16 = v1.import(script, script.Parent, "modules", "create-cannonball").createCannonball
return {
    ["BigExplosion"] = {
        ["name"] = "Big explosion",
        ["event"] = "Heartbeat",
        ["func"] = function(p17, _, _) --[[ Name: func, Line 21 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u8
                [3] = u16
                [4] = u2
                [5] = u14
                [6] = u11
                [7] = u12
                [8] = u15
                [9] = u5
                [10] = u4
                [11] = u7
                [12] = u10
                [13] = u6
            --]]
            if p17.elapsedEventTime > u13.BigExplosionShoot then
                u8(function() --[[ Line: 23 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u16
                        [3] = u2
                        [4] = u14
                        [5] = u11
                        [6] = u12
                        [7] = u15
                    --]]
                    local v18 = u13.BigExplosionHit - u13.BigExplosionShoot
                    local v19 = {
                        ["position"] = Vector3.new(17, 700, -1200),
                        ["rollOffMaxDistance"] = 1000000,
                        ["rollOffMinDistance"] = 1000,
                        ["volumeMultiplier"] = 2,
                        ["parent"] = u16({
                            ["origin"] = Vector3.new(17, 700, -1200),
                            ["goal"] = Vector3.new(38, 293.05, 302),
                            ["bezierControlPoint"] = (Vector3.new(17, 700, -1200)):Lerp(Vector3.new(38, 293.05, 302), 0.5) + Vector3.new(0, 600, 0),
                            ["duration"] = u13.BigExplosionHit - u13.BigExplosionShoot,
                            ["size"] = 30,
                            ["shakeMagnitude"] = 8,
                            ["shakeDuration"] = 0.6,
                            ["shakeInTravel"] = true,
                            ["playHitEffect"] = false
                        })
                    }
                    u2:playSound(u14.PIRATE_EVENT_MOTHERSHIP_FIRE, v19)
                    task.delay(v18, function() --[[ Line: 49 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u12
                            [3] = u15
                            [4] = u2
                            [5] = u14
                        --]]
                        local u20 = u11.Assets.Effects.BigCannonballLand:Clone()
                        u20.Anchored = true
                        u20.Position = Vector3.new(38, 293.05, 302)
                        u20.Parent = u12
                        u15:playEffects(u20:GetDescendants(), nil)
                        u2:playSound(u14.PIRATE_EVENT_MOTHERSHIP_IMPACT, {
                            ["position"] = Vector3.new(38, 293.05, 302),
                            ["rollOffMaxDistance"] = 600,
                            ["volumeMultiplier"] = 2
                        })
                        task.delay(3, function() --[[ Line: 60 ]]
                            --[[
                            Upvalues:
                                [1] = u20
                            --]]
                            u20:Destroy()
                        end)
                    end)
                end)
                if p17.elapsedEventTime > u13.BigExplosionHit then
                    local u21
                    if p17.elapsedEventTime < u13.BigExplosionHit + 1 then
                        local v22 = u5
                        local v23 = p17.elapsedEventTime - u13.BigExplosionHit
                        u21 = v22(math.min(v23, 1), 0, 1, 1)
                    elseif p17.elapsedEventTime > u13.BigExplosionHit + 3 then
                        local v24 = u4
                        local v25 = p17.elapsedEventTime - (u13.BigExplosionHit + 3)
                        u21 = v24(math.min(v25, 1), 1, -1, 1)
                    else
                        u21 = 1
                    end
                    u7.portal(u10, function() --[[ Line: 75 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                            [2] = u6
                            [3] = u21
                        --]]
                        u7.useInstance(function(p26) --[[ Line: 76 ]]
                            --[[
                            Upvalues:
                                [1] = u6
                            --]]
                            local v27 = u6("ColorCorrectionEffect", {
                                ["TintColor"] = Color3.fromRGB()
                            })
                            p26.colorCorrectionEffect = v27
                            return v27
                        end).colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(0, 0, 0), u21)
                    end)
                    u7.portal(u10, function() --[[ Line: 85 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                            [2] = u6
                            [3] = u21
                        --]]
                        u7.useInstance(function(p28) --[[ Line: 86 ]]
                            --[[
                            Upvalues:
                                [1] = u6
                            --]]
                            local v29 = u6("BlurEffect", {})
                            p28.blurEffect = v29
                            return v29
                        end).blurEffect.Size = u21 * 24
                    end)
                end
            end
        end
    }
}