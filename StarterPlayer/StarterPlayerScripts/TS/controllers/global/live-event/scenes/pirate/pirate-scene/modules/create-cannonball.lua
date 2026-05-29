local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
return {
    ["createCannonball"] = function(u14) --[[ Name: createCannonball, Line 15 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
            [3] = u9
            [4] = u11
            [5] = u10
            [6] = u5
            [7] = u4
            [8] = u12
            [9] = u3
            [10] = u7
        --]]
        local v15 = u14.size
        local v16 = v15 == nil and 4 or v15
        local u17 = u8.Assets.Misc.CannonBall:Clone()
        u13:scaleEffect({ u17 }, v16 / u17.Size.X)
        u17.Size = Vector3.new(v16, v16, v16)
        local v18 = u17.Trail1
        local v19 = v16 / 2
        v18.Position = Vector3.new(0, v19, 0)
        local v20 = u17.Trail2
        local v21 = -v16 / 2
        v20.Position = Vector3.new(0, v21, 0)
        u17.Parent = u9
        task.spawn(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u14
                [3] = u11
                [4] = u10
                [5] = u5
                [6] = u17
                [7] = u8
                [8] = u13
                [9] = u4
                [10] = u12
                [11] = u3
                [12] = u7
            --]]
            local v22 = u9.CurrentCamera.CFrame.Position
            local u23 = {
                ["magnitude"] = 0
            }
            local v24 = u14.duration
            u23.duration = v24 == nil and 2 or v24
            local v25 = u14.duration
            u23.cycles = 5 * ((v25 == nil and 2 or v25) / 0.25)
            if u14.shakeInTravel then
                u11.shake(u14.origin:Lerp(v22, 0.6), (u14.origin - v22).Unit, u23)
            end
            local v26 = u14.duration
            u10(v26 == nil and 2 or v26, u5, function(p27) --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u17
                    [3] = u23
                --]]
                local v28 = u14.origin:Lerp(u14.goal, p27)
                if u14.bezierControlPoint then
                    v28 = u14.origin:Lerp(u14.bezierControlPoint, p27):Lerp(u14.bezierControlPoint:Lerp(u14.goal, p27), p27)
                end
                u17.Position = v28
                local v29 = u14.shakeMagnitude
                u23.magnitude = (v29 == nil and 1.2 or v29) * 0.2 * p27
            end, 0, 1):Wait()
            u17.Transparency = 1
            for v30, v31 in u17:GetDescendants() do
                local _ = v30 - 1
                if v31:IsA("ParticleEmitter") then
                    v31.Enabled = false
                end
            end
            if u14.playHitEffect == nil or u14.playHitEffect == true then
                if u14.hitPirateShip then
                    local v32 = u8.Assets.Effects.PirateShipHit:Clone()
                    v32.Position = u14.goal
                    v32.Parent = u9
                    u13:playEffects({ v32 }, nil, {
                        ["destroyAfterSec"] = 3
                    })
                    u4:playSound(u12.PIRATE_SHIP_HIT, {
                        ["rollOffMaxDistance"] = 500,
                        ["position"] = u14.goal
                    })
                else
                    local u33 = u8.Assets.Effects.CannonballLand:Clone()
                    u33.Position = u14.goal
                    u33.Parent = u9
                    u13:playEffects(u33:GetDescendants(), nil, {
                        ["destroyAfterSec"] = 3
                    })
                    task.delay(3, function() --[[ Line: 97 ]]
                        --[[
                        Upvalues:
                            [1] = u33
                        --]]
                        local v34 = u33
                        if v34 ~= nil then
                            v34 = v34:Destroy()
                        end
                        return v34
                    end)
                    u4:playSound(u3.fromList(u12.PIRATE_CANNON_EXPLODE_1, u12.PIRATE_CANNON_EXPLODE_2, u12.PIRATE_CANNON_EXPLODE_3), {
                        ["rollOffMinDistance"] = 50,
                        ["rollOffMaxDistance"] = 500,
                        ["position"] = u14.goal
                    })
                end
            end
            local v35 = u7.LocalPlayer
            if v35 ~= nil then
                v35 = v35.Character
                if v35 ~= nil then
                    v35 = v35:GetPrimaryPartCFrame()
                end
            end
            if v35 == nil then
                v35 = u9.CurrentCamera.CFrame
            end
            local v36 = u11
            local v37 = u14.goal
            local v38 = (u14.goal - v35.Position).Unit
            local v39 = {}
            local v40 = u14.shakeMagnitude
            v39.magnitude = (v40 == nil and 1.2 or v40) / ((u14.goal - v35.Position).Magnitude * 0.1)
            local v41 = u14.shakeDuration
            v39.cycles = 5 * ((v41 == nil and 0.25 or v41) / 0.25)
            local v42 = u14.shakeDuration
            v39.duration = v42 == nil and 0.25 or v42
            v36.shake(v37, v38, v39)
            task.wait(3)
            u17:Destroy()
        end)
        return u17
    end
}