-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutExpo = v2.InOutExpo;
local InOutSine = v2.InOutSine;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "AuroraBlastKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 37
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, p12) -- Line: 41
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), default (copy), InOutExpo (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), InOutSine (copy), TweenService (copy)
    local u13 = u3.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14:PivotTo(p12);
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    KillEffect.hideCharacter(p9, p11);
    local Humanoid = u14:FindFirstChild("Humanoid");

    if Humanoid ~= nil then
        Humanoid = Humanoid:FindFirstChild("Animator");
    end;

    local u15 = AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(AnimationType.RAVEN_ATTACK_KILL_EFFECT), {
        looped = false
    });
    u13:GiveTask(function() -- Line: 58
        -- upvalues: u15 (copy)
        local v16 = u15;

        if v16 ~= nil then
            v16 = v16:Destroy();
        end;

        return v16;
    end);
    local v17 = ReplicatedStorage.Assets.Effects.AuroraBlast:Clone();
    v17:PivotTo(p12);
    v17.Parent = Workspace;
    u13:GiveTask(v17);
    local aurora = v17.aurora;
    local blast = v17.blast;
    local start = aurora.start;
    local u18 = aurora["end"];
    local starthead = aurora.starthead;
    local endhead = aurora.endhead;
    local blast2 = blast.blast;
    local Position = p12.Position;
    local u19 = Position + Vector3.new(-6, 0, 6);
    local u20 = Position + Vector3.new(6, 0, -6);
    local u21 = Position + Vector3.new(6, 0, 6);
    local u22 = Position + Vector3.new(-6, 0, -6);
    start.WorldPosition = Position;
    u18.WorldPosition = Position;
    starthead.WorldPosition = Position;
    endhead.WorldPosition = Position;
    blast2.WorldPosition = Position;
    local u24 = default(2.5, InOutExpo, function(p23) -- Line: 91
        -- upvalues: start (copy), Position (copy), u19 (copy), u18 (copy), u20 (copy), starthead (copy), u21 (copy), endhead (copy), u22 (copy)
        start.WorldPosition = Position:Lerp(u19, p23);
        u18.WorldPosition = Position:Lerp(u20, p23);
        starthead.WorldPosition = Position:Lerp(u21, p23);
        endhead.WorldPosition = Position:Lerp(u22, p23);
    end, 0, 1);
    u24:Play();
    u13:GiveTask(function() -- Line: 99
        -- upvalues: u24 (copy)
        if u24.Running then
            u24:Cancel();
        end;
    end);
    local u25 = SoundManager:playSound(GameSound.WIND_TUNNEL_FLYING, {
        volumeMultiplier = 0.5,
        looped = true,
        position = u14:GetPivot().Position
    });
    SoundManager:tweenSoundVolume(u25, 0.5, 0.5);
    u13:GiveTask(function() -- Line: 110
        -- upvalues: SoundManager (ref), u25 (copy)
        SoundManager:tweenSoundVolume(u25, 0, 0.5);
        task.delay(0.5, function() -- Line: 112
            -- upvalues: u25 (ref)
            u25:Destroy();
        end);
    end);
    u13:GiveTask(task.delay(2.6, function() -- Line: 116
        -- upvalues: SoundManager (ref), GameSound (ref), u14 (copy), EffectUtil (ref), blast (copy), u19 (copy), u20 (copy), u21 (copy), u22 (copy), default (ref), InOutSine (ref), start (copy), u18 (copy), starthead (copy), endhead (copy), u13 (copy), aurora (copy), TweenService (ref)
        SoundManager:playSound(GameSound.COMET_VOLLEY_HERO_ORE, {
            position = u14:GetPivot().Position
        });
        EffectUtil:playInstanceEffects({ blast }, {
            particleMultiplier = 3
        });
        local u26 = u19 + Vector3.new(-2, 0, 2);
        local u27 = u20 + Vector3.new(2, 0, -2);
        local u28 = u21 + Vector3.new(2, 0, 2);
        local u29 = u22 + Vector3.new(-2, 0, -2);
        local u31 = default(0.5, InOutSine, function(p30) -- Line: 132
            -- upvalues: start (ref), u19 (ref), u26 (copy), u18 (ref), u20 (ref), u27 (copy), starthead (ref), u21 (ref), u28 (copy), endhead (ref), u22 (ref), u29 (copy)
            start.WorldPosition = u19:Lerp(u26, p30);
            u18.WorldPosition = u20:Lerp(u27, p30);
            starthead.WorldPosition = u21:Lerp(u28, p30);
            endhead.WorldPosition = u22:Lerp(u29, p30);
        end, 0, 1);
        u31:Play();
        u13:GiveTask(function() -- Line: 139
            -- upvalues: u31 (copy)
            if u31.Running then
                u31:Cancel();
            end;
        end);
        EffectUtil:tweenEffectTransparency({ aurora }, 1, 0.5);
        u14:BreakJoints();
        local v32 = u14:GetDescendants();

        local function v38(p33) -- Line: 147
            if p33:IsA("BasePart") then
                p33.CanCollide = false;
                local v34 = math.random();
                local v35 = 0.5 + math.random() * 0.1;
                local Unit = Vector3.new(v34, v35, math.random()).Unit;
                local v36 = math.random(50, 100);
                local v37 = math.random(100, 200);
                p33.AssemblyLinearVelocity = Unit * Vector3.new(v36, v37, math.random(50, 100));
            end;
        end;

        for i, v in v32 do
            v38(v, i - 1, v32);
        end;

        u13:GiveTask(task.delay(0.5, function() -- Line: 158
            -- upvalues: u14 (ref), TweenService (ref)
            for _, descendant in u14:GetDescendants() do
                if descendant:IsA("BasePart") then
                    descendant.Material = Enum.Material.Neon;
                    TweenService:Create(descendant, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                        Transparency = 1
                    }):Play();
                elseif descendant:IsA("Decal") then
                    TweenService:Create(descendant, TweenInfo.new(0.5), {
                        Transparency = 1
                    }):Play();
                end;
            end;
        end));
    end));
    u13:GiveTask(task.delay(5.1, function() -- Line: 173
        -- upvalues: u13 (copy)
        u13:DoCleaning();
    end));

    return u13;
end;

return u5;