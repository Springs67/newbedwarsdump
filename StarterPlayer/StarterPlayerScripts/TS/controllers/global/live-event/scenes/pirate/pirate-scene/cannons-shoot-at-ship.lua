local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.ReplicatedStorage
local u9 = v6.TweenService
local u10 = v6.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = v1.import(script, script.Parent, "modules", "create-cannonball").createCannonball
local u16 = v1.import(script, script.Parent, "modules", "target-health").getPirateShipTargetHealth
return {
    ["CannonsShootAtShip"] = {
        ["name"] = "cannons shoot at ship",
        ["event"] = "Heartbeat",
        ["func"] = function(u17, u18, _) --[[ Name: func, Line 21 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u7
                [3] = u9
                [4] = u8
                [5] = u10
                [6] = u14
                [7] = u11
                [8] = u4
                [9] = u3
                [10] = u13
                [11] = u15
                [12] = u16
                [13] = u5
            --]]
            if u17.elapsedEventTime < u12.PreparationEnds then
                return nil
            end
            if u17.elapsedEventTime > u12.ShipGetShotDown then
                return nil
            end
            local v19 = u18:get("ships")
            if v19 ~= nil then
                v19 = v19.ship1
            end
            if v19 == nil then
                return nil
            end
            local v20 = u18:get("nextCannonFire")
            if v20 == nil then
                v20 = {}
                u18:set("nextCannonFire", v20)
            end
            for _, v21 in u7:GetTagged("LobbyCannon") do
                if v21:IsA("Model") and v21.PrimaryPart then
                    local v22 = v20[v21]
                    if v22 == nil then
                        v22 = os.clock() + math.random(1, 3)
                        v20[v21] = v22
                    end
                    if v22 < os.clock() then
                        local v23 = v21.PrimaryPart.CFrame
                        local v24 = u9
                        local v25 = v21.PrimaryPart
                        local v26 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                        local v27 = {}
                        local v28 = v23.Position
                        local v29 = v19.cframe.Position
                        local v30 = v23.Position.Y
                        local v31 = Vector3.new(0, v30, 0)
                        v27.CFrame = CFrame.new(v28, v29 * Vector3.new(1, 0, 1) + v31) * CFrame.Angles(0, -1.5707963267948966, 0)
                        v24:Create(v25, v26, v27):Play()
                        v20[v21] = os.clock() + math.random(1, 3)
                        local v32 = (v21:GetPrimaryPartCFrame() * CFrame.new(-4, 3.5, 0)).Position
                        local u33 = u8.Assets.Effects.CannonShoot.Attachment:Clone()
                        u33.WorldPosition = v32
                        u33.Parent = u10.Terrain
                        u14:playEffects(u33:GetDescendants(), nil, {
                            ["destroyAfterSec"] = 3
                        })
                        task.delay(1, function() --[[ Line: 78 ]]
                            --[[
                            Upvalues:
                                [1] = u33
                            --]]
                            return u33:Destroy()
                        end)
                        if (u10.CurrentCamera.CFrame.Position - v32).Magnitude < 20 then
                            local v34 = u11
                            local v35 = v19.instance:GetPrimaryPartCFrame().Position
                            v34.shake(v32, (v32 - v35).Unit, {
                                ["magnitude"] = 1.2,
                                ["cycles"] = 5,
                                ["duration"] = 0.2
                            })
                        end
                        u4:playSound(u3.fromList(u13.PIRATE_CANNON_1, u13.PIRATE_CANNON_2, u13.PIRATE_CANNON_3), {
                            ["rollOffMaxDistance"] = 150,
                            ["position"] = u33.Position,
                            ["parent"] = u33
                        })
                        local v36 = select(2, v19.instance:GetBoundingBox())
                        local v37 = math.random() - 0.5
                        local v38 = math.random() - 0.5
                        local v39 = math.random() - 0.5
                        local v40 = v36 * (Vector3.new(v37, v38, v39) * 0.5)
                        local v41 = RaycastParams.new()
                        v41.FilterDescendantsInstances = { v19.instance }
                        v41.FilterType = Enum.RaycastFilterType.Whitelist
                        local v42 = u10:Raycast(v32, (v19.cframe.Position + v40 - v32) * 1.5, v41)
                        local v43 = u15
                        local v44 = {
                            ["duration"] = 1,
                            ["origin"] = v32
                        }
                        local v45
                        if v42 then
                            v45 = v42.Position
                        else
                            v45 = v19.cframe.Position + v40
                        end
                        v44.goal = v45
                        v43(v44)
                        task.delay(1, function() --[[ Line: 109 ]]
                            --[[
                            Upvalues:
                                [1] = u18
                                [2] = u16
                                [3] = u17
                                [4] = u5
                            --]]
                            local v46 = u18:get("shipHealth")
                            local v47 = v46 == nil and 1000 or v46
                            local v48 = u16(u17.elapsedEventTime)
                            if v47 < v48 then
                                return nil
                            end
                            local v49 = v47 - (v47 - v48) / 3
                            u18:set("shipHealth", v49)
                            u5.Controllers.BossBarController:updateHealth(v49)
                        end)
                    end
                end
            end
            u18:set("nextCannonFire", v20)
        end
    }
}