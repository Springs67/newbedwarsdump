-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CharacterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "BroomKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 30
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.makeCloneSweepable(p8, p9) -- Line: 34
    for _, descendant in p9:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Anchored = false;
            descendant.CanCollide = descendant ~= p9.HumanoidRootPart;
            descendant.CollisionGroup = "ItemDrops";
        end;
    end;

    p9.HumanoidRootPart.Anchored = true;
    p9.HumanoidRootPart.CanCollide = false;
end;

function u4.onKill(p10, p11, p12, p13) -- Line: 46
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), CharacterUtil (copy), GameAnimationUtil (copy), AnimationType (copy), t (copy), RandomUtil (copy), GameSound (copy), SoundManager (copy)
    local u14 = u2.new();
    p12.Archivable = true;
    local u15 = p12:Clone();
    u15.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u15.HumanoidRootPart.Anchored = true;
    u15:PivotTo(p13);
    u15.Parent = Workspace;
    KillEffect.hideCharacter(p10, p12);
    u14:GiveTask(u15);
    local u16 = ReplicatedStorage.Assets.Misc.BroomSweep:Clone();
    u16:PivotTo(p13 - Vector3.new(0, 1, 1));

    if not u16.PrimaryPart then
        return u14;
    end;

    u16.Parent = Workspace;
    u14:GiveTask(u16);
    CharacterUtil.breakJoints(u15);
    p10:makeCloneSweepable(u15);
    local v17 = u16.AnimationController.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.BROOM_SWEEP));
    v17:Play();
    v17.Looped = true;
    local u18 = true;
    u16.Brush.CanCollide = true;
    local PrimaryPart = u16.PrimaryPart;
    v17:GetMarkerReachedSignal("impact"):Connect(function() -- Line: 79
        -- upvalues: u18 (ref), u15 (copy), t (ref), PrimaryPart (copy), Workspace (ref), ReplicatedStorage (ref), RandomUtil (ref), GameSound (ref), SoundManager (ref), u16 (copy)
        u18 = not u18;
        local v19;

        if u18 == false then
            v19 = Enum.NormalId.Front;
        else
            v19 = Enum.NormalId.Back;
        end;

        local v20 = u18 == false and -15 or 15;

        for _, child in u15:GetChildren() do
            if child:IsA("Accessory") then
                local child = child:FindFirstChild("Handle");

                if t.instanceIsA("BasePart")(child) then
                    if PrimaryPart then
                        for _, v in Workspace:GetPartsInPart(PrimaryPart) do
                            if v == child then
                                v:ApplyImpulse((Vector3.new(0, 0, v20)));
                            end;
                        end;
                    end;
                end;
            elseif child:IsA("BasePart") and child ~= u15.PrimaryPart then
                if PrimaryPart then
                    for _, v in Workspace:GetPartsInPart(PrimaryPart) do
                        if v == child then
                            v:ApplyImpulse((Vector3.new(0, 0, v20)));
                        end;
                    end;
                end;
            end;
        end;

        local u21 = ReplicatedStorage.Assets.Effects.SweepDustEffect:Clone();
        u21.Position = u15:GetPivot().Position - Vector3.new(0, 1, 0);
        u21.Parent = Workspace;
        u21.Anchored = true;
        u21.DustParticle.EmissionDirection = v19;
        u21.DustParticle.Transparency = NumberSequence.new(0.5, 0.75);
        u21.DustParticle:Emit(10);
        task.delay(1, function() -- Line: 116
            -- upvalues: u21 (copy)
            u21:Destroy();
        end);
        SoundManager:playSound(RandomUtil.fromList(GameSound.BROOM_SWEEP_EFFECT_1, GameSound.BROOM_SWEEP_EFFECT_2, GameSound.BROOM_SWEEP_EFFECT_3, GameSound.BROOM_SWEEP_EFFECT_4), {
            rollOffMaxDistance = 40,
            volumeMultiplier = 0.8,
            parent = u16.PrimaryPart
        });
    end);
    task.delay(4, function() -- Line: 126
        -- upvalues: u14 (copy)
        u14:DoCleaning();
    end);

    return u14;
end;

return u4;