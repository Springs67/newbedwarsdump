-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v2.InQuad;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local Tween = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "VoidCreatureBedBreakEffect";
    end,

    __index = BreakBedEffectController
});
u6.__index = u6;

function u6.new(...) -- Line: 31
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 35
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p8, BedBreakEffectType.VOID_CREATURES);
    p8.Name = "VoidCreatureBedBreakEffect";
end;

function u6.KnitStart(p9) -- Line: 39
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p9);
end;

function u6.onBedBreak(u10, p11, p12, p13, p14) -- Line: 42
    -- upvalues: u3 (copy), KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Tween (copy), InQuad (copy), SoundManager (copy), GameSound (copy), u4 (copy), Linear (copy)
    local u15 = u3.new();
    u10.maid:GiveTask(u15);
    local u16 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p13);
    u16:PivotTo(p12);
    u16.Parent = Workspace;
    local u17;

    if u16 == nil then
        u17 = u16;
    else
        u17 = u16:WaitForChild("Root", 1);
    end;

    local v18 = math.random(15, 20);
    local v19 = p14 + Vector3.new(v18, 2, math.random(15, 20));
    local v20 = math.random(0, 100);
    local Unit = (p14 - v19).Unit;

    if v20 < 70 then
        local v21 = ReplicatedStorage.Assets.Effects.VoidPortal:Clone();
        v21:PivotTo(CFrame.new(v19));
        v21.Parent = Workspace;
        task.wait(0.5);
        local u22 = ReplicatedStorage.Assets.Misc.VoidCrab:Clone();
        u22:PivotTo(CFrame.new(v19, p14));
        u22.Parent = Workspace;
        local v23 = AnimationUtil:playAnimation(u22, GameAnimationUtil:getAssetId(AnimationType.VOID_CRAB_WALKING));
        Tween(1, InQuad, function(p24) -- Line: 68
            -- upvalues: u22 (copy)
            u22:PivotTo(p24);
        end, u22.PrimaryPart.CFrame, CFrame.new(p14 - Unit * 10, p14));
        task.wait(1);
        v21:Destroy();

        if v23 ~= nil then
            v23:Stop();
        end;

        local TargetBeam = u22:WaitForChild("TargetBeam");
        local BlastBeam = u22:WaitForChild("BlastBeam");

        if TargetBeam and BlastBeam then
            local v25 = AnimationUtil:playAnimation(u22, GameAnimationUtil:getAssetId(AnimationType.VOID_CRAB_BEAM_ATTACK));
            SoundManager:playSound(GameSound.VOID_CRAB_BEAM_ATTACK, {
                rollOffMaxDistance = 100,
                position = p14
            });
            local v26 = u4("Attachment", {
                Parent = u17
            });
            TargetBeam.Attachment1 = v26;
            BlastBeam.Attachment1 = v26;
            TargetBeam.Enabled = true;

            if v25 then
                u15:GiveTask(v25:GetMarkerReachedSignal("blast"):Connect(function() -- Line: 96
                    -- upvalues: TargetBeam (copy), BlastBeam (copy), Tween (ref), Linear (ref), u15 (copy), u10 (copy), u17 (copy), u16 (copy), u22 (copy)
                    TargetBeam.Enabled = false;
                    BlastBeam.Enabled = true;
                    local u28 = Tween(0.1, Linear, function(p27) -- Line: 99
                        -- upvalues: BlastBeam (ref)
                        BlastBeam.Width0 = 0.1 + p27 * 0.4;
                        BlastBeam.Width1 = 0.2 + p27 * 0.6;
                    end);
                    u15:GiveTask(function() -- Line: 103
                        -- upvalues: u28 (copy)
                        return u28:Cancel();
                    end);
                    task.delay(0.3, function() -- Line: 106
                        -- upvalues: BlastBeam (ref), u10 (ref), u17 (ref), u16 (ref), Tween (ref), Linear (ref), u15 (ref), u22 (ref)
                        if not BlastBeam.Parent then
                            return nil;
                        end;

                        u10:createBedDebris(u17, true, { Color3.fromRGB(255, 0, 0), Color3.fromRGB(204, 0, 255) });
                        u16:Destroy();
                        local u30 = Tween(0.05, Linear, function(p29) -- Line: 112
                            -- upvalues: BlastBeam (ref)
                            BlastBeam.Width0 = 0.5 * (1 - p29);
                            BlastBeam.Width1 = 0.8 * (1 - p29);
                        end);
                        u15:GiveTask(function() -- Line: 116
                            -- upvalues: u30 (copy)
                            return u30:Cancel();
                        end);
                        task.delay(1, function() -- Line: 119
                            -- upvalues: u22 (ref), u15 (ref)
                            u22:Destroy();
                            u15:DoCleaning();
                        end);
                    end);
                end));
            end;
        end;
    else
        local v31 = ReplicatedStorage.Assets.Effects.VoidPortal:Clone();
        v31:PivotTo(CFrame.new(v19));
        v31.Parent = Workspace;
        task.wait(0.5);
        local u32 = ReplicatedStorage.Assets.Misc.VoidHound:Clone();
        u32:PivotTo(CFrame.new(v19, p14));
        u32.Parent = Workspace;
        local v33 = AnimationUtil:playAnimation(u32, GameAnimationUtil:getAssetId(AnimationType.VOID_HOUND_WALK));
        Tween(1, InQuad, function(p34) -- Line: 136
            -- upvalues: u32 (copy)
            u32:PivotTo(p34);
        end, u32.PrimaryPart.CFrame, CFrame.new(p14 - Unit * 7, p14));
        task.wait(1);
        v31:Destroy();

        if v33 ~= nil then
            v33:Stop();
        end;

        AnimationUtil:playAnimation(u32, GameAnimationUtil:getAssetId(AnimationType.VOID_HOUND_ATTACK_4));
        SoundManager:playSound(GameSound.VOID_HOUND_TAIL_ATTACK, {
            rollOffMaxDistance = 100,
            position = p14
        });
        task.delay(2, function() -- Line: 154
            -- upvalues: u10 (copy), u17 (copy), u16 (copy)
            u10:createBedDebris(u17);
            u16:Destroy();
        end);
    end;
end;

KnitClient.CreateController(u6.new());

return nil;