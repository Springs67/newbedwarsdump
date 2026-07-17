-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local OutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scalePart = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart;
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
    __tostring = function() -- Line: 20, Name: __tostring
        return "BoxingGloveKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 30
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(p7, p8, p9, u10) -- Line: 34
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), scalePart (copy), GameAnimationUtil (copy), AnimationType (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), default (copy), OutExpo (copy)
    local u11 = u1.new();
    p9.Archivable = true;
    local u12 = p9:Clone();
    u12.HumanoidRootPart.Anchored = true;
    u12.Parent = Workspace;
    KillEffect.hideCharacter(p7, p9);
    u11:GiveTask(u12);
    local u13 = ReplicatedStorage.Assets.Misc.BoxingGlove:Clone();
    u13:PivotTo(u10 - Vector3.new(0, 0, 2));
    local PrimaryPart = u13.PrimaryPart;

    if not PrimaryPart then
        return u11;
    end;

    scalePart(PrimaryPart, 0.6);
    u13.Parent = Workspace;
    u11:GiveTask(u13);
    local v14 = u13.AnimationController.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.BOXING_GLOVE_UPPER_CUT));
    v14:Play();
    v14:GetMarkerReachedSignal("hit"):Connect(function() -- Line: 59
        -- upvalues: u12 (copy), GameAnimationUtil (ref), AnimationType (ref), u11 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u13 (copy), SoundManager (ref), GameSound (ref), u10 (copy), default (ref), OutExpo (ref)
        local v15 = u12:FindFirstChildWhichIsA("Humanoid");

        if v15 ~= nil then
            v15 = v15:FindFirstChild("Animator");
        end;

        if v15 then
            local u16 = GameAnimationUtil:playAnimation(v15, AnimationType.DRAGON_SLAYER_LAUNCH_LOOP);
            u11:GiveTask(function() -- Line: 68
                -- upvalues: u16 (copy)
                local v17 = u16;

                if v17 ~= nil then
                    v17:Stop();
                end;
            end);
        end;

        local v18 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
        v18.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera;
        v18.Position = u12:GetPivot().Position;
        v18.Parent = Workspace;
        v18.Anchored = true;
        EffectUtil:playEffects({ v18 }, nil, {
            destroyAfterSec = 1
        });

        local function _(p19) -- Line: 85
            if p19:IsA("ParticleEmitter") then
                p19:Emit(15);
            end;
        end;

        for i, child in u13.boxing_glove.ParticleAttachment:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child:Emit(15);
            end;
        end;

        SoundManager:playSound(GameSound.BOXING_GLOVE_KILL_EFFECT, {
            rollOffMaxDistance = 40,
            volumeMultiplier = 0.8,
            parent = u13.PrimaryPart
        });
        SoundManager:playSound(GameSound.PENGUIN_SQUAWK_1, {
            rollOffMaxDistance = 40,
            volumeMultiplier = 0.1,
            parent = u13.PrimaryPart
        });
        local u20 = u10 + Vector3.new(0, 100, 0) + u10.LookVector * -16;
        default(2.5, OutExpo, function(p21) -- Line: 107
            -- upvalues: u12 (ref), u10 (ref), u20 (copy)
            if not u12.PrimaryPart then
                return nil;
            end;

            u12:PivotTo(u10:Lerp(u20, p21));
        end);
    end);
    task.delay(3, function() -- Line: 114
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

return u3;