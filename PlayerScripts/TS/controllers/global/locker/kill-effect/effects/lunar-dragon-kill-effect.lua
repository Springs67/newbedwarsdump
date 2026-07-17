-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "LunarDragonKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 26
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(p7, p8, p9, p10) -- Line: 30
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    local u11 = u1.new();
    p9.Archivable = true;
    local u12 = p9:Clone();
    u12.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u12.HumanoidRootPart.Anchored = true;
    u12:PivotTo(p10);
    u12.Parent = Workspace;
    KillEffect.hideCharacter(p7, p9);
    u11:GiveTask(u12);
    local u13 = ReplicatedStorage.Assets.Effects.GiantSmoke:Clone();
    u13.ParticleEmitter.Orientation = Enum.ParticleOrientation.FacingCamera;
    u13.Position = u12:GetPivot().Position;
    u13.Parent = Workspace;
    u13.Anchored = true;
    u11:GiveTask(u13);
    task.delay(1.5, function() -- Line: 47
        -- upvalues: u13 (copy), u12 (copy)
        u13.ParticleEmitter.Enabled = false;
        u12:Destroy();
    end);
    local v14 = ReplicatedStorage.Assets.Misc.LunarDragon:Clone();
    v14:ScaleTo(2);
    v14:PivotTo(p10 - Vector3.new(0, 2, 3));

    if not v14.PrimaryPart then
        return u11;
    end;

    v14.Parent = Workspace;
    u11:GiveTask(v14);
    local v15 = v14.AnimationController.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DRAGON_KILL_EFFECT));
    v15:Play();
    v15:AdjustSpeed(0.6);
    u11:GiveTask(SoundManager:playSound(GameSound.DRAGON_ROAR, {
        rollOffMaxDistance = 100,
        volumeMultiplier = 0.8,
        playbackSpeedMultiplier = 0.8,
        parent = v14.PrimaryPart
    }));
    v15.Stopped:Connect(function() -- Line: 73
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

return u3;