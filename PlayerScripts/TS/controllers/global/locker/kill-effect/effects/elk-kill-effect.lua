-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scalePart = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;

local function _(p4) -- Line: 19
    -- upvalues: Linear (copy)
    local v5 = Linear(p4, -100, 200, 4.8);

    return Vector3.new(v5, 0, 0);
end;

local function _(p6) -- Line: 24
    -- upvalues: Linear (copy)
    if p6 <= 1 then
        return Linear(p6, 1, -1, 1);
    end;

    return p6 <= 3.8 and 0 or Linear(p6 - 3.8, 0, 1, 1);
end;

local u7 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "ElkKillEffect";
    end,

    __index = KillEffect
});
u7.__index = u7;

function u7.new(...) -- Line: 45
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, p10) -- Line: 49
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p9, p10);
    KillEffect.setPlayDefaultKillEffect(p9, false);
end;

function u7.onKill(p11, p12, p13, u14) -- Line: 53
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy), Linear (copy), scalePart (copy)
    local u15 = u2.new();
    p13.Archivable = true;
    local u16 = p13:Clone();
    u16.HumanoidRootPart.Anchored = true;
    u16.Parent = Workspace;
    KillEffect.hideCharacter(p11, p13);
    u15:GiveTask(u16);
    local u17 = ReplicatedStorage.Assets.Effects.ElkKillEffect:Clone();
    u17.PrimaryPart.Anchored = true;
    u17:PivotTo(u14);
    u17.Parent = Workspace;
    EffectUtil:playEffects({ u17.body_mesh.Particle }, nil, {
        destroyAfterSec = 4.8
    });
    u15:GiveTask(u17);
    u15:GiveTask(SoundManager:playSound(GameSound.ELK_SUMMON, {
        rollOffMaxDistance = 100,
        position = u16:GetPrimaryPartCFrame().Position,
        parent = u16.PrimaryPart
    }));
    u15:GiveTask(SoundManager:playSound(GameSound.ELK_CHARGING_LOOP, {
        volumeMultiplier = 2,
        rollOffMaxDistance = 150,
        position = u17:GetPrimaryPartCFrame().Position,
        parent = u17.PrimaryPart
    }));
    local v18 = AnimationUtil:playAnimation(u17.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.ELK_CHARGING), {
        looped = true
    });

    if v18 then
        u15:GiveTask(v18);
    end;

    local u19 = false;
    local u20 = 0;
    u15:GiveTask(RunService.Heartbeat:Connect(function(p21) -- Line: 90
        -- upvalues: u20 (ref), u17 (copy), Linear (ref), u14 (copy), u14 (copy), u19 (ref), SoundManager (ref), GameSound (ref), u16 (copy), ReplicatedStorage (ref), scalePart (ref), Workspace (ref), EffectUtil (ref)
        u20 = u20 + p21;
        local body_mesh = u17.body_mesh;
        local v22 = u20;
        local v23;

        if v22 <= 1 then
            v23 = Linear(v22, 1, -1, 1);
        else
            v23 = v22 <= 3.8 and 0 or Linear(v22 - 3.8, 0, 1, 1);
        end;

        body_mesh.Transparency = v23;
        local v24 = Linear(u20, -100, 200, 4.8);
        local v25 = Vector3.new(v24, 0, 0);
        local v26 = Linear(u20 + 0.05, -100, 200, 4.8);
        local v27 = v25 - Vector3.new(v26, 0, 0);
        local u28 = v27.Magnitude <= 0 and Vector3.new(1, 0, 0) or CFrame.Angles(0, -3.141592653589793, 0):VectorToWorldSpace(v27.Unit);
        local v29 = u14.Position + v25;
        local v30 = math.sin(u20 * 3);
        local v31 = v29 + Vector3.new(0, v30, 0);
        u17:PivotTo(CFrame.lookAt(v31, v31 + u28));

        if u14.Position.X + v25.X > u14.Position.X then
            if not u19 then
                SoundManager:playSound(GameSound.ELK_UPPERCUT, {
                    rollOffMaxDistance = 100,
                    position = u17:GetPrimaryPartCFrame().Position,
                    parent = u17.PrimaryPart
                });
                u16:BreakJoints();
                local v32 = u16:GetDescendants();

                local function v36(p33) -- Line: 110
                    -- upvalues: u28 (copy)
                    if p33:IsA("BasePart") then
                        p33.CanCollide = false;
                        local Unit = (u28 + Vector3.new(0, 1, 0)).Unit;
                        local v34 = math.random(50, 100);
                        local v35 = math.random(100, 200);
                        p33.AssemblyLinearVelocity = Unit * Vector3.new(v34, v35, math.random(50, 100));
                    end;
                end;

                for i, v in v32 do
                    v36(v, i - 1, v32);
                end;

                local u37 = ReplicatedStorage.Assets.Effects.SnowBlast:Clone();
                scalePart(u37, 5);
                u37.Parent = Workspace;
                EffectUtil:playEffects({ u37 }, nil);
                u37.CFrame = CFrame.new(u16.PrimaryPart.Position);
                task.delay(2, function() -- Line: 127
                    -- upvalues: u37 (copy)
                    u37:Destroy();
                end);
            end;

            u19 = true;
        end;
    end));
    task.delay(4.8, function() -- Line: 134
        -- upvalues: u15 (copy)
        u15:DoCleaning();
    end);

    return u15;
end;

return u7;