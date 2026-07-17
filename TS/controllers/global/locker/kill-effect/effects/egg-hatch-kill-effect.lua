-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local InCubic = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InCubic;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "EggHatchKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 31
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(u8, p9, p10, u11) -- Line: 35
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), GameQueryUtil (copy), ModelUtil (copy), InCubic (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy)
    local u12 = u2.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13:PivotTo(u11);
    u13.Parent = Workspace;
    u13.HumanoidRootPart.Anchored = false;
    KillEffect.hideCharacter(u8, p10);
    u12:GiveTask(u13);

    for _, descendant in u13:GetDescendants() do
        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, false);
        end;
    end;

    ModelUtil.tweenModelTransparency(u13, 1, 0.55);
    ModelUtil.tweenModelSizeScaleTo(u13, 0.55, InCubic, 0);
    local u14 = ReplicatedStorage.Assets.Effects.GoldenEgg:Clone();
    u12:GiveTask(u14);
    task.delay(0.3, function() -- Line: 57
        -- upvalues: ModelUtil (ref), u14 (copy), u11 (copy), Workspace (ref), ReplicatedStorage (ref), GameQueryUtil (ref), u12 (copy), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        ModelUtil.tweenModelTransparency(u14, 1, 0);
        ModelUtil.scaleModel(u14, 3);
        u14:PivotTo(u11);
        u14.Parent = Workspace;
        ModelUtil.tweenModelTransparency(u14, 0, 0.3);
        local v15 = ReplicatedStorage.Assets.Effects.StarParticle:Clone();

        local function _(p16) -- Line: 68
            if p16:IsA("ParticleEmitter") then
                p16.Enabled = false;
            end;
        end;

        for i, descendant in v15:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = false;
            end;
        end;

        GameQueryUtil:setQueryIgnored(v15, true);
        v15.Transparency = 1;
        v15.CFrame = u11;
        v15.Parent = Workspace;
        u12:GiveTask(v15);
        EffectUtil:playEffects({ v15 }, nil, {
            destroyAfterSec = 1
        });
        SoundManager:playSound(GameSound.EGG_LAUNCH, {
            position = u11.Position
        });
    end);
    task.delay(0.8, function() -- Line: 90
        -- upvalues: ReplicatedStorage (ref), u13 (copy), Workspace (ref), EffectUtil (ref), u8 (copy), u14 (copy), u12 (copy), SoundManager (ref), GameSound (ref), u11 (copy)
        local v17 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
        v17.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera;
        v17.Position = u13:GetPivot().Position;
        v17.Anchored = true;
        v17.Parent = Workspace;
        EffectUtil:playEffects({ v17 }, nil, {
            destroyAfterSec = 1
        });
        local u18 = u8:shakeEgg(u14);
        u12:GiveTask(u18);
        u12:GiveTask(u14.Destroying:Once(function() -- Line: 103
            -- upvalues: u18 (copy)
            return u18:Disconnect();
        end));
        SoundManager:playSound(GameSound.EGG_HUNT_EGG_DEPOSIT, {
            position = u11.Position
        });
    end);
    task.delay(1.5, function() -- Line: 112
        -- upvalues: ReplicatedStorage (ref), u13 (copy), Workspace (ref), EffectUtil (ref), u14 (copy), u11 (copy), u12 (copy), u8 (copy), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), ModelUtil (ref)
        local v19 = ReplicatedStorage.Assets.Effects.EggExplosion:Clone();
        v19.Attachment:Destroy();
        v19.Position = u13:GetPivot().Position;
        v19.Anchored = true;
        v19.Parent = Workspace;
        EffectUtil:playEffects({ v19 }, nil, {
            destroyAfterSec = 1
        });
        task.delay(0.1, function() -- Line: 123
            -- upvalues: u14 (ref)
            u14:Destroy();
        end);
        local u20 = ReplicatedStorage.Assets.Misc.BunnyChicken:Clone();
        u20:PivotTo(u11);

        local function _(p21) -- Line: 130
            if p21:IsA("BasePart") then
                p21.CollisionGroup = "DisablePlayerCollisions";
            end;
        end;

        for i, descendant in u20:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CollisionGroup = "DisablePlayerCollisions";
            end;
        end;

        u20.Parent = Workspace;
        u12:GiveTask(u20);
        local u22 = u20.Humanoid:FindFirstChildWhichIsA("Animator");

        if u22 then
            u8.chickenAnim = u8.chickenAnim or GameAnimationUtil:getAnimation(AnimationType.CHICKEN_FLAP);
            local v23 = u22:LoadAnimation(u8.chickenAnim);
            v23:Play();
            u12:GiveTask(v23.Stopped:Once(function() -- Line: 146
                -- upvalues: u22 (copy), GameAnimationUtil (ref), AnimationType (ref)
                u22:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.CHICKEN_IDLE)):Play();
            end));
        end;

        SoundManager:playSound(GameSound.CHICKEN_DEPLOY, {
            position = u11.Position
        });
        task.delay(2, function() -- Line: 154
            -- upvalues: ModelUtil (ref), u20 (copy), u12 (ref)
            ModelUtil.tweenModelTransparency(u20, 1, 0.5);
            task.delay(1, function() -- Line: 156
                -- upvalues: u12 (ref)
                u12:DoCleaning();
            end);
        end);
    end);

    return u12;
end;

function u4.shakeEgg(p24, p25) -- Line: 163
    local PrimaryPart = p25.PrimaryPart;

    if not PrimaryPart then
        error("Egg Kill Effect Model has no PrimaryPart");
    end;

    local TweenService = game:GetService("TweenService");
    local CFrame2 = PrimaryPart.CFrame;
    local u26 = TweenInfo.new(0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true, 0);
    local u27 = {
        CFrame.Angles(0, 0, 0.3141592653589793),
        CFrame.Angles(0, 0, -0.3141592653589793),
        CFrame.Angles(0.20943951023931956, 0, 0.17453292519943295),
        CFrame.Angles(-0.20943951023931956, 0, -0.17453292519943295),
        CFrame.Angles(0, 0.2617993877991494, 0.20943951023931956),
        CFrame.Angles(0, -0.2617993877991494, -0.20943951023931956)
    };
    local u28 = 0;
    local u29 = nil;

    return game:GetService("RunService").Heartbeat:Connect(function() -- Line: 175
        -- upvalues: u29 (ref), u27 (copy), u28 (ref), CFrame2 (copy), TweenService (copy), PrimaryPart (copy), u26 (copy)
        if u29 and u29.PlaybackState == Enum.PlaybackState.Playing then
            return nil;
        end;

        local v30 = u27[u28 % #u27 + 1];
        u28 = u28 + 1;
        u29 = TweenService:Create(PrimaryPart, u26, {
            CFrame = CFrame2 * v30
        });
        u29:Play();
    end);
end;

return u4;