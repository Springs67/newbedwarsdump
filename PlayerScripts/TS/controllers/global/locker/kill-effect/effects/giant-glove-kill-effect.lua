-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local OutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "GiantGloveKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 29
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(p7, p8, p9, u10) -- Line: 33
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), GameAnimationUtil (copy), AnimationType (copy), EffectUtil (copy), default (copy), OutExpo (copy), SoundManager (copy), GameSound (copy)
    local u11 = u1.new();
    p9.Archivable = true;
    local u12 = p9:Clone();
    u12.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u12.HumanoidRootPart.Anchored = true;
    u12:PivotTo(u10);
    u12.Parent = Workspace;
    KillEffect.hideCharacter(p7, p9);
    u11:GiveTask(u12);
    local v13 = ReplicatedStorage.Assets.Misc.GiantGlove:Clone();
    v13:PivotTo(u10 - Vector3.new(0, -2.5, 3));

    if not v13.PrimaryPart then
        return u11;
    end;

    v13.Parent = Workspace;
    u11:GiveTask(v13);
    local v14 = u12:FindFirstChildWhichIsA("Humanoid");

    if v14 ~= nil then
        v14 = v14:FindFirstChild("Animator");
    end;

    if v14 then
        local u15 = GameAnimationUtil:playAnimation(v14, AnimationType.DISCO_DANCE);
        u11:GiveTask(function() -- Line: 63
            -- upvalues: u15 (copy)
            local v16 = u15;

            if v16 ~= nil then
                v16:Stop();
            end;
        end);
    end;

    local u17 = v13.AnimationController.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GIANT_GLOVE_FLICK));
    u17:Play();
    u17:AdjustSpeed(0.5);
    u17:GetMarkerReachedSignal("impact"):Connect(function() -- Line: 73
        -- upvalues: u12 (copy), GameAnimationUtil (ref), AnimationType (ref), u11 (copy), u17 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u10 (copy), default (ref), OutExpo (ref)
        local v18 = u12:FindFirstChildWhichIsA("Humanoid");

        if v18 ~= nil then
            v18 = v18:FindFirstChild("Animator");
        end;

        if v18 then
            local u19 = GameAnimationUtil:playAnimation(v18, AnimationType.DRAGON_SLAYER_LAUNCH_LOOP);
            u11:GiveTask(function() -- Line: 81
                -- upvalues: u19 (copy)
                local v20 = u19;

                if v20 ~= nil then
                    v20:Stop();
                end;
            end);
        end;

        u17:AdjustSpeed(0.8);
        local v21 = ReplicatedStorage.Assets.Effects.CartoonImpactEffect:Clone();
        v21.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera;
        v21.Position = u12:GetPivot().Position - Vector3.new(0, -7, 0);
        v21.Parent = Workspace;
        v21.Anchored = true;
        EffectUtil:playEffects({ v21 }, nil, {
            destroyAfterSec = 1
        });
        local u22 = u10 + Vector3.new(0, 0, 300) + u10.LookVector * -16;
        default(2.5, OutExpo, function(p23) -- Line: 104
            -- upvalues: u12 (ref), u10 (ref), u22 (copy)
            if not u12.PrimaryPart then
                return nil;
            end;

            u12:PivotTo(u10:Lerp(u22, p23));
        end);
    end);
    SoundManager:playSound(GameSound.GLOVE_FLICK, {
        rollOffMaxDistance = 40,
        volumeMultiplier = 0.8,
        parent = v13.PrimaryPart
    });
    task.delay(3, function() -- Line: 116
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

return u3;