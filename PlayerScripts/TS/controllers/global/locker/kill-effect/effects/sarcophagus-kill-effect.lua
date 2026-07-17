-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local OutExpo = v2.OutExpo;
local SoftSpring = v2.SoftSpring;
local Spring = v2.Spring;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "SarcophagusKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 33
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(u9, p10, p11, p12) -- Line: 37
    -- upvalues: u3 (copy), Workspace (copy), SoundManager (copy), GameSound (copy), KillEffect (copy), ReplicatedStorage (copy), GameQueryUtil (copy), BLOCK_SIZE (copy), EffectUtil (copy), RuntimeLib (copy), Spring (copy), SoftSpring (copy)
    local u13 = u3.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    local v15 = u14:GetPrimaryPartCFrame();
    u13:GiveTask(SoundManager:playSound(GameSound.SARCOPHAGUS_KILL_EFFECT, {
        rollOffMaxDistance = 80,
        position = p12.Position
    }));
    KillEffect.hideCharacter(u9, p11);
    local u16 = ReplicatedStorage.Assets.Misc.sarcophagus:Clone();

    local function _(p17) -- Line: 53
        -- upvalues: GameQueryUtil (ref)
        if p17:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(p17, true);
            p17.CanCollide = false;
        end;
    end;

    for i, descendant in u16:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, true);
            descendant.CanCollide = false;
        end;
    end;

    local Position = v15.Position;
    local v18 = -(select(2, u16:GetBoundingBox()).Y / 2.6);
    local v19 = Vector3.new(0, v18, BLOCK_SIZE * 1.8);
    local u20 = CFrame.new(Position - v19) * CFrame.Angles(0, 3.141592653589793, 0);
    u16:PivotTo(u20 - Vector3.new(0, BLOCK_SIZE * 4, 0));
    u16:ScaleTo(1.25);
    u16.Parent = Workspace;
    u13:GiveTask(u16);
    task.delay(0.18, function() -- Line: 76
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u16 (copy), u20 (copy), EffectUtil (ref), u13 (copy)
        local v21 = ReplicatedStorage.Assets.Effects.DustLandEffect:Clone();
        v21.Parent = Workspace;
        local v22 = select(2, u16:GetBoundingBox()).Y / 2;
        v21.CFrame = u20 - Vector3.new(0, v22, 0);
        EffectUtil:playEffects({ v21 }, nil, {
            destroyAfterSec = 3
        });
        u13:GiveTask(v21);
    end);
    local u28 = RuntimeLib.Promise.new(function() -- Line: 86
        -- upvalues: u9 (copy), u16 (copy), u20 (copy), Spring (ref), SoftSpring (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u13 (copy), u14 (copy), BLOCK_SIZE (ref)
        u9:tweenCFrame(u16, u20, 0.3, Spring):Wait();
        local v23 = u16.front:GetPivot();
        local front = u16.front;
        local v24 = u16.front:GetPivot();
        local v25 = CFrame.new(-3, 0, 0);
        local v26 = CFrame.Angles(0, -0.3490658503988659, 0);
        u9:tweenCFrame(front, v24 * v25 * v26, 0.4, SoftSpring):Wait();
        local v27 = ReplicatedStorage.Assets.Effects.DustLandEffect:Clone();
        v27.Parent = Workspace;
        v27.CFrame = u20 * CFrame.Angles(1.5707963267948966, 0, 0);
        EffectUtil:playEffects({ v27 }, nil, {
            destroyAfterSec = 3
        });
        u13:GiveTask(v27);
        u9:tweenCFrame(u14, v23 - Vector3.new(0, -0.5, 0.8), 0.4, SoftSpring):Wait();
        u9:tweenCFrame(u16.front, v23, 0.4, SoftSpring):Wait();
        u14:Destroy();
        u9:tweenCFrame(u16, u20 - Vector3.new(0, BLOCK_SIZE * 5, 0), 0.65):Wait();
        u13:DoCleaning();
    end);
    u13:GiveTask(function() -- Line: 117
        -- upvalues: u28 (copy)
        return u28:cancel();
    end);

    return u13;
end;

function u5.tweenCFrame(p29, u30, p31, p32, p33) -- Line: 122
    -- upvalues: default (copy), OutExpo (copy)
    return default(p32 == nil and 0.3 or p32, p33 or OutExpo, function(p34) -- Line: 127
        -- upvalues: u30 (copy)
        return u30:PivotTo(p34);
    end, u30:GetPivot(), p31);
end;

return u5;