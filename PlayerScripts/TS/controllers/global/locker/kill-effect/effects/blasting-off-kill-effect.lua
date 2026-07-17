-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "BlastingOffKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 33
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(u8, p9, p10, p11) -- Line: 37
    -- upvalues: u2 (copy), EntityUtil (copy), Workspace (copy), KillEffect (copy), RandomUtil (copy), GameAnimationUtil (copy), AnimationType (copy), AnimationUtil (copy), SoundManager (copy), GameSound (copy)
    local u12 = u2.new();
    local PrimaryPart = p10.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    if PrimaryPart == nil then
        return u12;
    end;

    p10.Archivable = true;
    local v13 = EntityUtil:getEntity(p9);

    if v13 ~= nil then
        v13:hideNametag();
    end;

    p10.Archivable = true;
    local u14 = p10:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14.Parent = Workspace;
    local Animator = u14.Humanoid.Animator;
    KillEffect.hideCharacter(u8, p10);
    u12:GiveTask(u14);
    local PrimaryPart2 = u14.PrimaryPart;

    if PrimaryPart2 == nil then
        return u12;
    end;

    local u15 = AnimationUtil:playAnimation(Animator, (RandomUtil.fromList(GameAnimationUtil:getAssetId(AnimationType.BLASTING_OFF_AGAIN_0), GameAnimationUtil:getAssetId(AnimationType.BLASTING_OFF_AGAIN_1), GameAnimationUtil:getAssetId(AnimationType.BLASTING_OFF_AGAIN_2), GameAnimationUtil:getAssetId(AnimationType.BLASTING_OFF_AGAIN_3), GameAnimationUtil:getAssetId(AnimationType.BLASTING_OFF_AGAIN_4))));

    if u15 ~= nil then
        u15:AdjustSpeed(0.7);
    end;

    if u15 ~= nil then
        u15:GetMarkerReachedSignal("BlastingOffEnd"):Connect(function() -- Line: 73
            -- upvalues: u15 (copy), u8 (copy), u12 (copy), PrimaryPart (copy), PrimaryPart2 (copy), u14 (copy), SoundManager (ref), GameSound (ref)
            local v16 = u15;

            if v16 ~= nil then
                v16:AdjustSpeed(0);
            end;

            u8:tweenDeadPlayer(u12, PrimaryPart.Position, PrimaryPart2, u14);
            local BLASTING_OFF_YELL = GameSound.BLASTING_OFF_YELL;
            local v17 = {};
            local v18 = PrimaryPart2;

            if v18 ~= nil then
                v18 = v18.Position;
            end;

            v17.position = v18;
            v17.parent = PrimaryPart2;
            v17.volumeMultiplier = 1.4;
            v17.rollOffMaxDistance = 280;
            u12:GiveTask(SoundManager:playSound(BLASTING_OFF_YELL, v17));
            task.delay(4.6000000000000005, function() -- Line: 93
                -- upvalues: u14 (ref)
                local v19 = u14;

                if v19 ~= nil then
                    v19:Destroy();
                end;
            end);
            task.delay(5.7, function() -- Line: 99
                -- upvalues: u12 (ref), SoundManager (ref), GameSound (ref), u14 (ref)
                u12:GiveTask(SoundManager:playSound(GameSound.BLASTING_OFF_SPARKLE, {
                    looped = false,
                    volumeMultiplier = 0.85
                }));
                local v20 = u12;

                if v20 ~= nil then
                    v20:DoCleaning();
                end;

                local v21 = u14;

                if v21 ~= nil then
                    v21:Destroy();
                end;
            end);
        end);
    end;

    u12:GiveTask(SoundManager:playSound(GameSound.BLASTING_OFF_JINGLE, {
        rollOffMaxDistance = 160,
        looped = false,
        volumeMultiplier = 0.6,
        position = PrimaryPart.Position
    }));

    return u12;
end;

function u4.tweenDeadPlayer(p22, u23, p24, u25, u26) -- Line: 123
    -- upvalues: TweenService (copy), ReplicatedStorage (copy), Workspace (copy)
    local v27 = p24 + Vector3.new(0, 170, 0);
    local v28 = p22:getRandomDirectionVector(110);
    local v29 = CFrame.new(v27 + v28);
    local v30 = TweenService:Create(u25, TweenInfo.new(4.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
        CFrame = CFrame.new(v27 + v28)
    });
    local u31 = nil;
    local u32 = ReplicatedStorage.Assets.Effects.Sparkle:Clone();
    u32.Parent = Workspace;
    u32:PivotTo(v29);
    u32.Anchored = true;

    local function _(p33) -- Line: 137
        -- upvalues: u31 (ref)
        if p33:IsA("ParticleEmitter") then
            u31 = p33;
            u31.Enabled = false;

            return nil;
        end;
    end;

    for i, descendant in u32:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            u31 = descendant;
            u31.Enabled = false;
        end;
    end;

    v30:Play();
    v30.Completed:Connect(function() -- Line: 148
        -- upvalues: u25 (copy), u31 (ref), u26 (copy), u23 (copy), u32 (copy)
        local v34 = u25;

        if v34 ~= nil then
            v34:Destroy();
        end;

        if u31 ~= nil then
            u31.Enabled = true;
            u31:Emit(1);
        end;

        local v35 = u26;

        if v35 ~= nil then
            v35:Destroy();
        end;

        u23:GiveTask(function() -- Line: 161
            -- upvalues: u31 (ref), u32 (ref)
            local v36 = u31;

            if v36 ~= nil then
                v36:Destroy();
            end;

            local v37 = u32;

            if v37 ~= nil then
                v37:Destroy();
            end;
        end);
    end);
end;

function u4.getRandomDirectionVector(p38, p39) -- Line: 173
    local v40 = math.random(-1, 1);
    local v41 = math.random(-1, 1);

    return Vector3.new(v40, v41, math.random(-1, 1)).Unit * p39;
end;

return u4;