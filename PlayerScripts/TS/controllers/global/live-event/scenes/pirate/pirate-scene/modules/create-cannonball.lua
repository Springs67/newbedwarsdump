-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;

return {
    createCannonball = function(u3) -- Line: 15, Name: createCannonball
        -- upvalues: ReplicatedStorage (copy), EffectUtil (copy), Workspace (copy), ScreenShakeUtil (copy), default (copy), InQuad (copy), SoundManager (copy), GameSound (copy), RandomUtil (copy), Players (copy)
        local size = u3.size;
        local v4 = size == nil and 4 or size;
        local u5 = ReplicatedStorage.Assets.Misc.CannonBall:Clone();
        EffectUtil:scaleEffect({ u5 }, v4 / u5.Size.X);
        u5.Size = Vector3.new(v4, v4, v4);
        u5.Trail1.Position = Vector3.new(0, v4 / 2, 0);
        u5.Trail2.Position = Vector3.new(0, -v4 / 2, 0);
        u5.Parent = Workspace;
        task.spawn(function() -- Line: 28
            -- upvalues: Workspace (ref), u3 (copy), ScreenShakeUtil (ref), default (ref), InQuad (ref), u5 (copy), ReplicatedStorage (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), RandomUtil (ref), Players (ref)
            local Position = Workspace.CurrentCamera.CFrame.Position;
            local u6 = {
                magnitude = 0
            };
            local duration = u3.duration;
            u6.duration = duration == nil and 2 or duration;
            local duration2 = u3.duration;
            u6.cycles = 5 * ((duration2 == nil and 2 or duration2) / 0.25);

            if u3.shakeInTravel then
                ScreenShakeUtil.shake(u3.origin:Lerp(Position, 0.6), (u3.origin - Position).Unit, u6);
            end;

            local duration3 = u3.duration;
            default(duration3 == nil and 2 or duration3, InQuad, function(p7) -- Line: 53
                -- upvalues: u3 (ref), u5 (ref), u6 (copy)
                local v8 = u3.origin:Lerp(u3.goal, p7);

                if u3.bezierControlPoint then
                    v8 = u3.origin:Lerp(u3.bezierControlPoint, p7):Lerp(u3.bezierControlPoint:Lerp(u3.goal, p7), p7);
                end;

                u5.Position = v8;
                local shakeMagnitude = u3.shakeMagnitude;
                u6.magnitude = (shakeMagnitude == nil and 1.2 or shakeMagnitude) * 0.2 * p7;
            end, 0, 1):Wait();
            u5.Transparency = 1;

            local function _(p9) -- Line: 69
                if p9:IsA("ParticleEmitter") then
                    p9.Enabled = false;
                end;
            end;

            for i, descendant in u5:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = false;
                end;
            end;

            if u3.playHitEffect == nil or u3.playHitEffect == true then
                if u3.hitPirateShip then
                    local v10 = ReplicatedStorage.Assets.Effects.PirateShipHit:Clone();
                    v10.Position = u3.goal;
                    v10.Parent = Workspace;
                    EffectUtil:playEffects({ v10 }, nil, {
                        destroyAfterSec = 3
                    });
                    SoundManager:playSound(GameSound.PIRATE_SHIP_HIT, {
                        rollOffMaxDistance = 500,
                        position = u3.goal
                    });
                else
                    local u11 = ReplicatedStorage.Assets.Effects.CannonballLand:Clone();
                    u11.Position = u3.goal;
                    u11.Parent = Workspace;
                    EffectUtil:playEffects(u11:GetDescendants(), nil, {
                        destroyAfterSec = 3
                    });
                    task.delay(3, function() -- Line: 97
                        -- upvalues: u11 (ref)
                        local v12 = u11;

                        if v12 ~= nil then
                            v12 = v12:Destroy();
                        end;

                        return v12;
                    end);
                    SoundManager:playSound(RandomUtil.fromList(GameSound.PIRATE_CANNON_EXPLODE_1, GameSound.PIRATE_CANNON_EXPLODE_2, GameSound.PIRATE_CANNON_EXPLODE_3), {
                        rollOffMinDistance = 50,
                        rollOffMaxDistance = 500,
                        position = u3.goal
                    });
                end;
            end;

            local LocalPlayer = Players.LocalPlayer;

            if LocalPlayer ~= nil then
                LocalPlayer = LocalPlayer.Character;

                if LocalPlayer ~= nil then
                    LocalPlayer = LocalPlayer:GetPrimaryPartCFrame();
                end;
            end;

            if LocalPlayer == nil then
                LocalPlayer = Workspace.CurrentCamera.CFrame;
            end;

            local goal = u3.goal;
            local Unit = (u3.goal - LocalPlayer.Position).Unit;
            local v13 = {};
            local shakeMagnitude = u3.shakeMagnitude;
            v13.magnitude = (shakeMagnitude == nil and 1.2 or shakeMagnitude) / ((u3.goal - LocalPlayer.Position).Magnitude * 0.1);
            local shakeDuration = u3.shakeDuration;
            v13.cycles = 5 * ((shakeDuration == nil and 0.25 or shakeDuration) / 0.25);
            local shakeDuration2 = u3.shakeDuration;
            v13.duration = shakeDuration2 == nil and 0.25 or shakeDuration2;
            ScreenShakeUtil.shake(goal, Unit, v13);
            task.wait(3);
            u5:Destroy();
        end);

        return u5;
    end
};