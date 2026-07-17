-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;

return {
    PiratesPopDown = {
        name = "pirates pop down",
        event = "Heartbeat",

        func = function(p1, u2, p3) -- Line: 9, Name: func
            -- upvalues: PirateSceneTimestamps (copy), GameAnimationUtil (copy), AnimationType (copy)
            if p1.elapsedEventTime < PirateSceneTimestamps.BigExplosionHit + 3 then
                return nil;
            end;

            local function v15(p4, p5, p6, p7) -- Line: 13
                -- upvalues: u2 (copy), GameAnimationUtil (ref)
                local v8 = u2:get(p4);

                if v8 then
                    if v8.TimePosition > v8.Length * 0.95 then
                        v8.TimePosition = v8.Length * 0.95;
                        v8:AdjustSpeed(0);
                    end;
                else
                    local v9 = u2:get(p5);

                    if v9 == nil then
                        return nil;
                    end;

                    local v10 = v9:FindFirstChildOfClass("AnimationController");

                    if v10 == nil then
                        return nil;
                    end;

                    local v11 = v10:FindFirstChildOfClass("Animator");

                    if v11 == nil then
                        return nil;
                    end;

                    local v12 = CFrame.new(Vector3.new(63.645, 294.231, 239.281));
                    local v13 = CFrame.Angles(0, -0.5235987755982988, 0);
                    local v14 = CFrame.new(-6 + 6 * p7, 0, 0);
                    v9:PivotTo((CFrame.new((v12 * v13 * v14).Position)));
                    u2:set(p4, GameAnimationUtil:playAnimation(v11, p6));
                end;
            end;

            v15("smokeTrack", "smokeModel", AnimationType.SMOKE_JUMP_DOWN, 3);
            v15("hannahTrack", "hannahModel", AnimationType.HANNAH_JUMP_DOWN, 2);
            v15("daveyTrack", "daveyModel", AnimationType.DAVEY_JUMP_DOWN, 1);
        end
    }
};