-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
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
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "SarcophagusBreakBedEffect";
    end,

    __index = BreakBedEffectController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p7, BedBreakEffectType.SARCOPHAGUS);
    p7.Name = "SarcophagusBreakBedEffect";
end;

function u5.KnitStart(p8) -- Line: 39
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p8);
end;

function u5.onBedBreak(u9, p10, p11, p12) -- Line: 42
    -- upvalues: u3 (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), GameQueryUtil (copy), BLOCK_SIZE (copy), EffectUtil (copy), Spring (copy), SoftSpring (copy)
    local u13 = u3.new();
    u9.maid:GiveTask(u13);
    u9.maid:GiveTask(SoundManager:playSound(GameSound.SARCOPHAGUS_KILL_EFFECT, {
        rollOffMaxDistance = 80,
        position = p11.Position
    }));
    local u14 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p12);
    u14:PivotTo(p11);
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    local u15 = ReplicatedStorage.Assets.Misc.sarcophagus:Clone();

    local function _(p16) -- Line: 57
        -- upvalues: GameQueryUtil (ref)
        if p16:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(p16, true);
            p16.CanCollide = false;
        end;
    end;

    for i, descendant in u15:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, true);
            descendant.CanCollide = false;
        end;
    end;

    local Position = u14:GetPivot().Position;
    local v17 = -(select(2, u15:GetBoundingBox()).Y / 2.6);
    local v18 = Vector3.new(0, v17, BLOCK_SIZE * 1.8);
    local u19 = CFrame.new(Position - v18) * CFrame.Angles(0, 3.141592653589793, 0);
    u15:PivotTo(u19 - Vector3.new(0, BLOCK_SIZE * 4, 0));
    u15:ScaleTo(1.25);
    u15.Parent = Workspace;
    u13:GiveTask(u15);
    u9.maid:GiveTask(task.delay(0.18, function() -- Line: 80
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u15 (copy), u19 (copy), EffectUtil (ref), u13 (copy)
        local v20 = ReplicatedStorage.Assets.Effects.DustLandEffect:Clone();
        v20.Parent = Workspace;
        local v21 = select(2, u15:GetBoundingBox()).Y / 2;
        v20.CFrame = u19 - Vector3.new(0, v21, 0);
        EffectUtil:playEffects({ v20 }, nil, {
            destroyAfterSec = 3
        });
        u13:GiveTask(v20);
    end));
    u9.maid:GiveTask(task.spawn(function() -- Line: 90
        -- upvalues: u9 (copy), u15 (copy), u19 (copy), Spring (ref), SoftSpring (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u13 (copy), u14 (copy), BLOCK_SIZE (ref)
        u9:tweenCFrame(u15, u19, 0.3, Spring):Wait();
        local v22 = u15.front:GetPivot();
        local front = u15.front;
        local v23 = u15.front:GetPivot();
        local v24 = CFrame.new(-3, 0, 0);
        local v25 = CFrame.Angles(0, -0.3490658503988659, 0);
        u9:tweenCFrame(front, v23 * v24 * v25, 0.4, SoftSpring):Wait();
        local v26 = ReplicatedStorage.Assets.Effects.DustLandEffect:Clone();
        v26.Parent = Workspace;
        v26.CFrame = u19 * CFrame.Angles(1.5707963267948966, 0, 0);
        EffectUtil:playEffects({ v26 }, nil, {
            destroyAfterSec = 3
        });
        u13:GiveTask(v26);
        u9:tweenCFrame(u14, (v22 - Vector3.new(0, -1.05, 0.8)) * CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0), 0.4, SoftSpring):Wait();
        u9:tweenCFrame(u15.front, v22, 0.4, SoftSpring):Wait();
        u14:Destroy();
        u9:tweenCFrame(u15, u19 - Vector3.new(0, BLOCK_SIZE * 5, 0), 0.65):Wait();
        u13:DoCleaning();
    end));
end;

function u5.tweenCFrame(p27, u28, p29, p30, p31) -- Line: 124
    -- upvalues: default (copy), OutExpo (copy)
    return default(p30 == nil and 0.3 or p30, p31 or OutExpo, function(p32) -- Line: 129
        -- upvalues: u28 (copy)
        return u28:PivotTo(p32);
    end, u28:GetPivot(), p29);
end;

KnitClient.CreateController(u5.new());

return nil;