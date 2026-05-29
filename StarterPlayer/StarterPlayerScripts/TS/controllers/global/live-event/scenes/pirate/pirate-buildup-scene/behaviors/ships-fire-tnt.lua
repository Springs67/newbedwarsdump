local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = Random.new()
return {
    ["ShipsFireTntBehavior"] = {
        ["name"] = "Ships fire tnt",
        ["event"] = "Heartbeat",
        ["func"] = function(p14, p15, _) --[[ Name: func, Line 18 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u8
                [3] = u13
                [4] = u6
                [5] = u10
                [6] = u11
                [7] = u5
                [8] = u9
                [9] = u4
                [10] = u12
            --]]
            local u16 = p15:get("ships")
            if u16 ~= nil then
                u16 = u16.ship1
            end
            if u16 == nil then
                return nil
            end
            local v17 = p14.elapsedEventTime / 3600 * 1000
            local v18 = math.floor(v17) / 1000
            if v18 > 0 and (v18 % 12 == 0 and (not u3.isHoarceKat() and p15:get("tntFiredThisServer") ~= true)) then
                p15:set("tntFiredThisServer", true)
                task.spawn(function() --[[ Line: 30 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u13
                        [3] = u6
                        [4] = u16
                        [5] = u10
                        [6] = u11
                        [7] = u5
                        [8] = u9
                        [9] = u4
                        [10] = u12
                    --]]
                    local v19 = u8.LocalPlayer.Character
                    if v19 == nil or v19.PrimaryPart == nil then
                        return nil
                    end
                    local v20 = v19:GetPrimaryPartCFrame().Position
                    local v21 = false
                    local v22 = 0
                    while true do
                        if v21 then
                            v22 = v22 + 1
                        else
                            v21 = true
                        end
                        if v22 >= 3 then
                            return
                        end
                        local v23 = u13:NextNumber(-10, 10)
                        local v24 = u13
                        local v25 = v20 + Vector3.new(v23, 0, v24:NextNumber(-10, 10))
                        local u26 = u6("Part", {
                            ["Size"] = Vector3.new(1, 1, 1),
                            ["Transparency"] = 1,
                            ["Anchored"] = true,
                            ["CanCollide"] = false,
                            ["Position"] = u16.cframe.Position,
                            ["Parent"] = u10
                        })
                        u6("Trail", {
                            ["Attachment0"] = u6("Attachment", {
                                ["Position"] = Vector3.new(0, -1, 0),
                                ["Parent"] = u26
                            }),
                            ["Attachment1"] = u6("Attachment", {
                                ["Position"] = Vector3.new(0, 1, 0),
                                ["Parent"] = u26
                            }),
                            ["Parent"] = u26
                        })
                        u11(3, u5, function(p27) --[[ Line: 71 ]]
                            --[[
                            Upvalues:
                                [1] = u26
                            --]]
                            u26.Position = p27
                        end, u16.cframe.Position, v25):Wait()
                        u26.Transparency = 1
                        local u28 = u9.Assets.Effects.GuidedMissileExplosion:Clone()
                        u28.Position = v25
                        u28.Parent = u10
                        u28.Debris1:Emit(5)
                        u28.Debris2:Emit(5)
                        u28.ExplosionFlames:Emit(50)
                        u4:playSound(u12.MINICOPTER_EXPLODE, {
                            ["rollOffMaxDistance"] = 160,
                            ["position"] = v25
                        })
                        task.delay(5, function() --[[ Line: 85 ]]
                            --[[
                            Upvalues:
                                [1] = u26
                                [2] = u28
                            --]]
                            u26:Destroy()
                            u28:Destroy()
                        end)
                    end
                end)
            end
        end
    }
}