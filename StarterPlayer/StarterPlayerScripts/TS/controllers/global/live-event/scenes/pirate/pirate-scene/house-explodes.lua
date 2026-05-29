local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Players
local u7 = v4.ReplicatedStorage
local u8 = v4.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u13 = Random.new()
return {
    ["HouseExplodes"] = {
        ["name"] = "house explodes",
        ["event"] = "Heartbeat",
        ["func"] = function(p14, p15, _) --[[ Name: func, Line 18 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u5
                [3] = u8
                [4] = u3
                [5] = u7
                [6] = u2
                [7] = u10
                [8] = u6
                [9] = u11
                [10] = u9
                [11] = u13
            --]]
            local u16 = p15:get("ships")
            if u16 == nil then
                return nil
            end
            if p14.elapsedEventTime < u12.HouseExplodes then
                return nil
            end
            local v17 = u16.ship1
            local v18
            if v17 then
                v18 = v17.animationTrack
                if v18 ~= nil then
                    v18 = v18.IsPlaying
                end
            else
                v18 = v17
            end
            if v18 then
                local v19 = v17.animationTrack
                if v19 ~= nil then
                    v19:Stop()
                end
            end
            for _, v20 in u5:GetTagged("delete-upon-ship-impact") do
                if v20:IsDescendantOf(u8) then
                    v20:Destroy()
                end
            end
            u3.portal(u8, function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u7
                    [3] = u16
                    [4] = u2
                    [5] = u10
                    [6] = u6
                    [7] = u8
                    [8] = u11
                    [9] = u9
                    [10] = u13
                --]]
                local u23 = u3.useInstance(function(p21) --[[ Line: 47 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                    --]]
                    local v22 = u7.Assets.Effects.FracturedHouse:Clone()
                    v22:PivotTo(CFrame.new(183.959, 345.427, 323.018) * CFrame.Angles(0, 3.141592653589793, 0))
                    p21.model = v22
                    return v22
                end)
                u3.useEffect(function() --[[ Line: 56 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u2
                        [3] = u10
                        [4] = u6
                        [5] = u8
                        [6] = u7
                        [7] = u11
                        [8] = u9
                        [9] = u23
                        [10] = u13
                    --]]
                    local v24 = u16.ship1
                    if v24 ~= nil then
                        v24 = v24.cframe
                    end
                    local v25 = u2
                    local v26 = u10.PIRATE_EVENT_SHIP_CRASH
                    local v27 = {}
                    local v28
                    if v24 == nil then
                        v28 = v24
                    else
                        v28 = v24.Position
                    end
                    v27.position = v28
                    v27.rollOffMaxDistance = 500
                    v27.rollOffMinDistance = 300
                    v25:playSound(v26, v27)
                    local v29 = u6.LocalPlayer
                    if v29 ~= nil then
                        v29 = v29.Character
                        if v29 ~= nil then
                            v29 = v29:GetPrimaryPartCFrame()
                        end
                    end
                    if v29 == nil then
                        v29 = u8.CurrentCamera.CFrame
                    end
                    local v30 = u7.Assets.Effects.PirateShipCrash:Clone()
                    local v31
                    if v24 == nil then
                        v31 = v24
                    else
                        v31 = v24.Position
                    end
                    if v31 == nil then
                        v31 = Vector3.new()
                    end
                    v30.Position = v31
                    v30.Parent = u8
                    u11:playEffects({ v30 }, nil, {
                        ["destroyAfterSec"] = 5
                    })
                    local v32 = u9
                    local v33 = u23.model:GetPrimaryPartCFrame().Position
                    local v34 = u23.model:GetPrimaryPartCFrame().Position
                    local v35 = v29.Position
                    v32.shake(v33, (v34 - v35).Unit, {
                        ["magnitude"] = 3,
                        ["duration"] = 0.46
                    })
                    for _, v36 in u23.model:GetChildren() do
                        if v36:IsA("BasePart") then
                            v36.Anchored = false
                            if v24 then
                                local v37 = v36.Position
                                local v38 = v24.Position
                                local v39 = u13:NextNumber(-1, 1)
                                local v40 = u13:NextNumber(-1, 1)
                                local v41 = u13
                                local v42 = Vector3.new(v39, v40, v41:NextNumber(-1, 1)) * 20
                                v36:ApplyImpulse((v37 - (v38 - Vector3.new(0, 10, 0)) + v42).Unit * (v36.AssemblyMass * 150))
                                local v43 = u13:NextNumber(-1, 1)
                                local v44 = u13:NextNumber(-1, 1)
                                local v45 = u13
                                v36:ApplyAngularImpulse(Vector3.new(v43, v44, v45:NextNumber(-1, 1)) * (v36.AssemblyMass * 300))
                            end
                        end
                    end
                end)
            end)
        end
    }
}