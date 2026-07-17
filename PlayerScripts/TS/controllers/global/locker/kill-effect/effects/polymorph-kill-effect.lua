-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v4.Debris;
local PhysicsService = v4.PhysicsService;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "PolymoprhKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, ...) -- Line: 31
    -- upvalues: KillEffect (copy), ReplicatedStorage (copy)
    KillEffect.constructor(p7, ...);
    p7.mice = { ReplicatedStorage.Assets.Misc.mouseBrown, ReplicatedStorage.Assets.Misc.mouseGray, ReplicatedStorage.Assets.Misc.mouseWhite };
end;

function u5.onKill(p8, p9, p10, p11) -- Line: 35
    -- upvalues: u2 (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), RandomUtil (copy), Workspace (copy), PhysicsService (copy), u3 (copy), ModelUtil (copy)
    local u12 = u2.new();
    p8:hideCharacter(p10);
    local v13 = ReplicatedStorage.Assets.Effects.PoofParticles:Clone();
    v13.Parent = p10;
    v13.Position = p10:GetPivot().Position;
    u12:GiveTask(v13);
    EffectUtil:playEffects({ v13 });
    u12:GiveTask(SoundManager:playSound(GameSound.NINJA_SMOKE_3, {
        playbackSpeedMultiplier = 1.2,
        position = p11.Position
    }));
    local u14 = RandomUtil.randomArraySelectN(RandomUtil.shuffleArray(p8.mice), 1)[1]:Clone();
    u12:GiveTask(u14);
    u14:PivotTo(p11 + Vector3.new(0, 1, 0));
    u14.Parent = Workspace;
    local Humanoid = u14:FindFirstChild("Humanoid");

    for _, descendant in u14:GetDescendants() do
        if descendant:IsA("BasePart") then
            PhysicsService:SetPartCollisionGroup(descendant, "Players");
        end;
    end;

    p8:createEmitter(u14.PrimaryPart, true);
    u12:GiveTask(SoundManager:playSound(GameSound.GRIMOIRE_CAST_COMPLETE, {
        position = p11.Position
    }));
    local v15 = Humanoid:FindFirstChildOfClass("Animator");

    if not v15 then
        return u12;
    end;

    local v16 = v15:LoadAnimation((u3("Animation", {
        AnimationId = "rbxassetid://5823056331"
    })));
    v16:Play();
    u12:GiveTask(v16.DidLoop:Once(function() -- Line: 79
        -- upvalues: ModelUtil (ref), u14 (copy)
        ModelUtil.tweenModelTransparency(u14, 1, 0.5);
        task.delay(1, function() -- Line: 82
            -- upvalues: u14 (ref)
            u14:Destroy();
        end);
    end));
    task.delay(5, function() -- Line: 86
        -- upvalues: u12 (copy)
        u12:DoCleaning();
        u12:Destroy();
    end);

    return u12;
end;

function u5.createEmitter(p17, p18, p19) -- Line: 92
    -- upvalues: u3 (copy), Debris (copy)
    local v20 = u3("ParticleEmitter", {});
    v20.Rate = 0;
    v20.SpreadAngle = Vector2.new(120, 120);
    v20.Speed = NumberRange.new(4, 5);
    v20.Acceleration = Vector3.new(0, -5, 0);
    v20.Texture = "rbxassetid://5607858133";
    v20.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.8, 0.2), NumberSequenceKeypoint.new(1, 0) });
    v20.Color = ColorSequence.new(Color3.fromRGB(207, 23, 177));
    v20.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.8, 0), NumberSequenceKeypoint.new(1, 1) });
    v20.Parent = p18;
    v20:Emit(20);
    Debris:AddItem(v20, 5);
end;

return u5;