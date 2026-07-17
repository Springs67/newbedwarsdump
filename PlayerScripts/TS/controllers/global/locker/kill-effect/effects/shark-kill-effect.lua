-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SharkKillEffect";
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

function u4.onKill(p8, p9, p10, p11) -- Line: 34
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), TweenService (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local u12 = u2.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.HumanoidRootPart.Anchored = true;
    u13.Parent = Workspace;
    KillEffect.hideCharacter(p8, p10);
    u12:GiveTask(u13);
    local u14 = ReplicatedStorage.Assets.Effects.SharkKillEffect:Clone();
    u14:PivotTo(u13:GetPivot() - Vector3.new(0, u13.Humanoid.HipHeight, 0));

    local function u20(u15, u16) -- Line: 47
        -- upvalues: u14 (copy), TweenService (ref)
        local v17 = u14:GetDescendants();

        local function v19(p18) -- Line: 49
            -- upvalues: u16 (copy), TweenService (ref), u15 (copy)
            if p18:IsA("BasePart") and p18.Name ~= "RootPart" then
                if u16 ~= 0 and (u16 == u16 and u16) then
                    TweenService:Create(p18, TweenInfo.new(u16), {
                        Transparency = u15
                    }):Play();

                    return;
                end;

                p18.Transparency = u15;
            end;
        end;

        for i, v in v17 do
            v19(v, i - 1, v17);
        end;
    end;

    u20(1);
    u14.Parent = Workspace;
    u12:GiveTask(u14);
    local v21 = ReplicatedStorage.Assets.Effects.WaterPortalParticles:Clone();
    v21:PivotTo(p11 - Vector3.new(0, u13.Humanoid.HipHeight, 0));
    v21.Parent = Workspace;
    u12:GiveTask(v21);
    EffectUtil:playEffects({ v21 }, nil, {
        disableEffectsAfterSec = 1,
        destroyAfterSec = 1.75,
        sizeMultiplier = 2
    });
    u12:GiveTask(SoundManager:playSound(GameSound.SHARK_BITE, {
        volumeMultiplier = 2,
        position = u13:GetPivot().Position
    }));
    AnimationUtil:playAnimation(u14.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.SHARK_BITE), {
        looped = false,
        speed = 0.75
    });
    task.delay(0.25, function() -- Line: 88
        -- upvalues: u20 (copy)
        u20(0, 0.5);
    end);
    task.delay(0.75, function() -- Line: 91
        -- upvalues: u13 (copy)
        u13:Destroy();
    end);
    task.delay(1.25, function() -- Line: 94
        -- upvalues: u20 (copy)
        u20(1, 0.5);
    end);
    task.delay(1.75, function() -- Line: 97
        -- upvalues: u12 (copy)
        u12:DoCleaning();
    end);

    return u12;
end;

return u4;