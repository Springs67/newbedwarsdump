local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
return {
    ["PiratesPopDown"] = {
        ["name"] = "pirates pop down",
        ["event"] = "Heartbeat",
        ["func"] = function(p5, u6, _) --[[ Name: func, Line 9 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u3
                [3] = u2
            --]]
            if p5.elapsedEventTime < u4.BigExplosionHit + 3 then
                return nil
            end
            local function v18(p7, p8, p9, p10) --[[ Line: 13 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u3
                --]]
                local v11 = u6:get(p7)
                if v11 then
                    if v11.TimePosition > v11.Length * 0.95 then
                        v11.TimePosition = v11.Length * 0.95
                        v11:AdjustSpeed(0)
                        return
                    end
                else
                    local v12 = u6:get(p8)
                    if v12 == nil then
                        return nil
                    end
                    local v13 = v12:FindFirstChildOfClass("AnimationController")
                    if v13 == nil then
                        return nil
                    end
                    local v14 = v13:FindFirstChildOfClass("Animator")
                    if v14 == nil then
                        return nil
                    end
                    local v15 = CFrame.new(Vector3.new(63.645, 294.231, 239.281))
                    local v16 = CFrame.Angles(0, -0.5235987755982988, 0)
                    local v17 = CFrame.new(-6 + 6 * p10, 0, 0)
                    v12:PivotTo((CFrame.new((v15 * v16 * v17).Position)))
                    u6:set(p7, u3:playAnimation(v14, p9))
                end
            end
            v18("smokeTrack", "smokeModel", u2.SMOKE_JUMP_DOWN, 3)
            v18("hannahTrack", "hannahModel", u2.HANNAH_JUMP_DOWN, 2)
            v18("daveyTrack", "daveyModel", u2.DAVEY_JUMP_DOWN, 1)
        end
    }
}