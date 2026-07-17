-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local MathUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "FireCrackersKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 28
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(p8, p9, p10, p11) -- Line: 32
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), MathUtil (copy), u4 (copy)
    local u12 = u2.new();
    p10.Archivable = true;
    local v13 = p10:Clone();
    v13.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v13.HumanoidRootPart.Anchored = false;
    v13:PivotTo(p11);
    v13.Parent = Workspace;
    u12:GiveTask(v13);
    KillEffect.hideCharacter(p8, p10);

    local function _(p14) -- Line: 44
        return p14:IsA("BasePart");
    end;

    local v15 = 0;
    local v16 = {};
    local u17 = 0;

    for i, descendant in v13:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") == true then
            v15 = v15 + 1;
            v16[v15] = descendant;
        end;
    end;

    table.sort(v16, function(p18, p19) -- Line: 57
        return p18.Position.Y > p19.Position.Y;
    end);

    local function v30(u20) -- Line: 62
        -- upvalues: u17 (ref), MathUtil (ref), u4 (ref), u12 (copy)
        local u21 = u17 * MathUtil.randomFloatMaxInclusive(u4.DELAY_RANGE.Min, u4.DELAY_RANGE.Max);
        u20.CollisionGroup = "Players";
        u20.Anchored = false;
        u20.CanCollide = true;

        local function _(u22) -- Line: 68
            -- upvalues: u12 (ref), u21 (copy)
            u12:GiveTask(task.delay(u21, function() -- Line: 69
                -- upvalues: u22 (copy)
                u22:Destroy();
            end));
        end;

        for i, v in u20:GetJoints() do
            local _ = i - 1;
            u12:GiveTask(task.delay(u21, function() -- Line: 69
                -- upvalues: v (copy)
                v:Destroy();
            end));
        end;

        u12:GiveTask(task.delay(u21, function() -- Line: 76
            -- upvalues: u20 (copy), u4 (ref), u12 (ref), MathUtil (ref)
            local v23 = math.random(-15, 15);
            local v24 = math.random(10, 20);
            u20:ApplyImpulse((Vector3.new(v23, v24, math.random(-15, 15))));
            u4:playExplosionAtPart(u20, math.random(0.1, 0.25), u12);
            local u25 = math.random(1, 5);
            u12:GiveTask(task.spawn(function() -- Line: 80
                -- upvalues: u25 (copy), MathUtil (ref), u4 (ref), u20 (ref), u12 (ref)
                local v26 = false;
                local v27 = 0;

                while true do
                    if v26 then
                        v27 = v27 + 1;
                    else
                        v26 = true;
                    end;

                    if v27 >= u25 then
                        return;
                    end;

                    task.wait(MathUtil.randomFloatMaxInclusive(0.5, 1));
                    u4:playExplosionAtPart(u20, MathUtil.randomFloatMaxInclusive(0.25, 0.35), u12);

                    if v27 == u25 - 1 then
                        u20:Destroy();
                    else
                        local v28 = math.random(-15, 15);
                        local v29 = math.random(10, 20);
                        u20:ApplyImpulse((Vector3.new(v28, v29, math.random(-15, 15))));
                    end;
                end;
            end));
        end));
        u17 = u17 + 1;
    end;

    for i, v in v16 do
        v30(v, i - 1, v16);
    end;

    task.delay(#v16 * u4.DELAY_RANGE.Max + 5, function() -- Line: 109
        -- upvalues: u12 (copy)
        u12:DoCleaning();
    end);

    return u12;
end;

function u4.playExplosionAtPart(p31, p32, p33, p34) -- Line: 114
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), RandomUtil (copy), u4 (copy), SoundManager (copy)
    local v35 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
    v35.Position = p32.Position;
    v35.Parent = Workspace;
    p34:GiveTask(v35);
    EffectUtil:playEffects({ v35 }, nil, {
        destroyAfterSec = 1,
        sizeMultiplier = p33 == nil and 0.5 or p33
    });
    SoundManager:playSound(RandomUtil.fromList(unpack(u4.sounds)), {
        position = p32.Position
    });
end;

u4.sounds = {
    GameSound.FIRECRACKER_BANG_SHORT_1,
    GameSound.FIRECRACKER_BANG_SHORT_2,
    GameSound.FIRECRACKER_BANG_SHORT_3,
    GameSound.FIRECRACKER_BANG_SHORT_4,
    GameSound.FIRECRACKER_BANG_SHORT_5,
    GameSound.FIRECRACKER_BANG_SHORT_6,
    GameSound.FIRECRACKER_BANG_SHORT_7,
    GameSound.FIRECRACKER_BANG_SHORT_8,
    GameSound.FIRECRACKER_BANG_SHORT_9,
    GameSound.FIRECRACKER_BANG_SHORT_10
};
u4.DELAY_RANGE = NumberRange.new(0.25, 0.4);

return u4;