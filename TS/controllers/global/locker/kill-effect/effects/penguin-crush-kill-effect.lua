-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "PenguinCrushKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 34
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(u9, p10, p11, u12) -- Line: 38
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), GameQueryUtil (copy), u3 (copy), GameAnimationUtil (copy), AnimationType (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), default (copy), Linear (copy), RandomUtil (copy)
    local u13 = u2.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u14.HumanoidRootPart.Anchored = true;
    u14:PivotTo(u12);
    u14.Parent = Workspace;
    KillEffect.hideCharacter(u9, p11);
    u13:GiveTask(u14);
    local u15 = ReplicatedStorage.Assets.Misc.Penguins.BigPenguin:Clone();
    u15:PivotTo(u12 + Vector3.new(0, 0, 3.5));

    local function _(p16) -- Line: 56
        -- upvalues: GameQueryUtil (ref)
        if p16:IsA("BasePart") then
            p16.CanCollide = false;
            GameQueryUtil:setQueryIgnored(p16, true);
        end;
    end;

    for i, descendant in u15:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end;

    local PrimaryPart = u15.PrimaryPart;

    if not PrimaryPart then
        return u13;
    end;

    PrimaryPart.Anchored = true;
    u9:hideCharacter(u15);
    u15.Parent = Workspace;
    u13:GiveTask(u15);
    local v17 = u15:FindFirstChildWhichIsA("Humanoid");

    if v17 ~= nil then
        v17 = v17:FindFirstChildWhichIsA("Animator");
    end;

    local u18 = v17 or u3("Animator", {
        Parent = u15:FindFirstChildWhichIsA("Humanoid")
    });

    if u18 ~= nil then
        u18 = u18:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.PENGUIN_KILL_EFFECT_2));
    end;

    if not u18 then
        return u13;
    end;

    u18.Looped = false;
    u18:Play();
    u18:AdjustSpeed(0.9);
    u18:GetMarkerReachedSignal("Top"):Connect(function() -- Line: 96
        -- upvalues: ReplicatedStorage (ref), u15 (copy), Workspace (ref), u13 (copy), EffectUtil (ref), SoundManager (ref), GameSound (ref), u14 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), default (ref), Linear (ref), RandomUtil (ref)
        local v19 = ReplicatedStorage.Assets.Effects.PoofParticles:Clone();
        v19:PivotTo(u15:GetPivot() + Vector3.new(0, 5, 0));
        v19.Parent = Workspace;
        u13:GiveTask(v19);
        EffectUtil:playInstanceEffects({ v19 }, {
            destroyAfterSec = 0.6
        });
        SoundManager:playSound(GameSound.NINJA_SMOKE_2, {
            rollOffMaxDistance = 40,
            volumeMultiplier = 0.8,
            parent = u15.PrimaryPart
        });
        local u20 = AnimationUtil:playAnimation(u14.Humanoid:WaitForChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.TURN_AROUND));

        if u20 then
            local v21;

            if u20 == nil then
                v21 = u20;
            else
                v21 = u20.Length;
            end;

            task.delay(v21 - 0.01, function() -- Line: 122
                -- upvalues: u20 (copy)
                u20:AdjustSpeed(0);
            end);
        end;

        default(0.3, Linear, function(u22) -- Line: 127
            -- upvalues: u15 (ref)
            local function _(p23) -- Line: 129
                -- upvalues: u22 (copy)
                if p23:IsA("BasePart") then
                    if p23.Name == "HumanoidRootPart" or (p23.Name == "Head" or p23.Name == "Part") then
                        return nil;
                    end;

                    p23.Transparency = 1 - u22;
                end;
            end;

            for i, descendant in u15:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") and (descendant.Name ~= "HumanoidRootPart" and descendant.Name ~= "Head") then
                    if descendant.Name ~= "Part" then
                        descendant.Transparency = 1 - u22;
                    end;
                end;
            end;
        end);
        local v24 = {
            GameSound.PENGUIN_ATTACK_1,
            GameSound.PENGUIN_ATTACK_2,
            GameSound.PENGUIN_ATTACK_3,
            GameSound.PENGUIN_SQUAWK_1
        };
        RandomUtil.shuffleArray(v24);
        SoundManager:playSound(RandomUtil.randomArraySelectN(v24, 1)[1], {
            rollOffMaxDistance = 40,
            volumeMultiplier = 0.8,
            parent = u15.PrimaryPart
        });
    end);
    u18:GetMarkerReachedSignal("Stomp"):Connect(function() -- Line: 150
        -- upvalues: ReplicatedStorage (ref), u14 (copy), Workspace (ref), u13 (copy), EffectUtil (ref), u9 (copy), SoundManager (ref), GameSound (ref), u15 (copy)
        local v25 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
        v25.Pulse.Rate = 0;
        local v26 = ReplicatedStorage.Assets.Effects.SmokePuff:Clone();
        v26:SetAttribute("EmitCount", 10);
        v26.Speed = NumberRange.new(25);
        v26.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1.25, 0.75), NumberSequenceKeypoint.new(1, 0) });
        v26.SpreadAngle = Vector2.new(-180, 180);
        v26.Parent = v25;
        v25:PivotTo(u14:GetPivot() - Vector3.new(0, 2, 0));
        v25.Parent = Workspace;
        u13:GiveTask(v25);
        EffectUtil:playInstanceEffects({ v25 }, {
            destroyAfterSec = 0.6
        });
        u9:hideCharacter(u14);
        SoundManager:playSound(GameSound.STOMPER_HIT, {
            rollOffMaxDistance = 40,
            volumeMultiplier = 0.8,
            parent = u15.PrimaryPart
        });
    end);
    u18:GetMarkerReachedSignal("End"):Connect(function() -- Line: 175
        -- upvalues: u18 (copy), u15 (copy), u12 (copy), GameAnimationUtil (ref), AnimationType (ref), default (ref), Linear (ref), u13 (copy)
        u18:AdjustSpeed(0);
        u15:PivotTo(u12 + Vector3.new(0, 0, 1.5));
        u18:Stop();
        local v27 = u15:FindFirstChildWhichIsA("Humanoid");

        if v27 ~= nil then
            v27 = v27:FindFirstChildWhichIsA("Animator");

            if v27 ~= nil then
                v27 = v27:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.PENGUIN_IDLE_2));
            end;
        end;

        if v27 ~= nil then
            v27:Play();
        end;

        default(0.45, Linear, function(u28) -- Line: 195
            -- upvalues: u15 (ref)
            local function _(p29) -- Line: 197
                -- upvalues: u28 (copy)
                if p29:IsA("BasePart") then
                    if p29.Name == "HumanoidRootPart" or (p29.Name == "Head" or p29.Name == "Part") then
                        return nil;
                    end;

                    p29.Transparency = u28;
                end;
            end;

            for i, descendant in u15:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") and (descendant.Name ~= "HumanoidRootPart" and descendant.Name ~= "Head") then
                    if descendant.Name ~= "Part" then
                        descendant.Transparency = u28;
                    end;
                end;
            end;
        end);
        task.delay(0.45, function() -- Line: 209
            -- upvalues: u13 (ref)
            u13:DoCleaning();
        end);
    end);

    return u13;
end;

return u5;