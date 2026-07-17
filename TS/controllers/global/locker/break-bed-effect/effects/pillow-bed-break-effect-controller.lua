-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "PillowBedBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p6, BedBreakEffectType.PILLOW);
    p6.Name = "PillowBedBreakEffectController";
end;

function u4.KnitStart(p7) -- Line: 34
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p7);
end;

function u4.onBedBreak(u8, p9, u10, p11, p12) -- Line: 37
    -- upvalues: u2 (copy), KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    local u13 = u2.new();
    u8.maid:GiveTask(u13);
    local u14 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p11);
    u14:PivotTo(u10);
    u14.Parent = Workspace;
    local u15;

    if u14 == nil then
        u15 = u14;
    else
        u15 = u14:WaitForChild("Root", 1);
    end;

    local v16 = ReplicatedStorage.Assets.Effects.PillowBedBreak:Clone();
    v16.Parent = Workspace;
    v16:PivotTo(CFrame.new(u10.Position + Vector3.new(2, 0, 0), u10.Position));
    u13:GiveTask(u14);
    u13:GiveTask(v16);
    AnimationUtil:playAnimation(v16, GameAnimationUtil:getAssetId(AnimationType.PILLOW_FIGHT));

    if u14 and u15 then
        local u17 = ReplicatedStorage.Assets.Effects.WhiteFeatherEffect:Clone();
        u17.Parent = Workspace;
        u17:PivotTo(u10);
        u8.maid:GiveTask(u17);
        u8.maid:GiveTask(task.delay(0.7, function() -- Line: 63
            -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref), u10 (copy), u17 (copy)
            u8.maid:GiveTask(SoundManager:playSound(GameSound.PILLOW_HIT_2, {
                rollOffMaxDistance = 300,
                volumeMultiplier = 1.8,
                position = u10.Position
            }));

            local function _(p18) -- Line: 70
                if p18:IsA("ParticleEmitter") then
                    p18:Emit(30);
                end;
            end;

            for i, descendant in u17:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(30);
                end;
            end;
        end));
        u8.maid:GiveTask(task.delay(0.8, function() -- Line: 79
            -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref), u10 (copy), u15 (copy)
            u8.maid:GiveTask(SoundManager:playSound(GameSound.WOOD_BLOCK_BREAK, {
                rollOffMaxDistance = 300,
                position = u10.Position
            }));
            u8:createBedDebris(u15);
        end));
    end;

    u8.maid:GiveTask(task.delay(0.8, function() -- Line: 87
        -- upvalues: u14 (copy)
        u14:Destroy();
        u14.Parent = nil;
    end));
    u8.maid:GiveTask(task.delay(1.5, function() -- Line: 91
        -- upvalues: u13 (copy)
        u13:DoCleaning();
    end));
end;

KnitClient.CreateController(u4.new());

return nil;