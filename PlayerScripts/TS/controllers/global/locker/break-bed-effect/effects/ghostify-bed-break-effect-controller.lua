-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "GhostifyBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u2.__index = u2;

function u2.new(...) -- Line: 26
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 30
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p4, BedBreakEffectType.GHOSTIFY);
    p4.Name = "GhostifyBreakEffectController";
end;

function u2.KnitStart(p5) -- Line: 34
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p5);
end;

function u2.onBedBreak(p6, p7, p8, p9, p10) -- Line: 37
    p6:createEffect(p8, p10, p9);
end;

function u2.createEffect(u11, u12, u13, p14) -- Line: 40
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), default (copy), Linear (copy)
    u11.maid:GiveTask(task.spawn(function() -- Line: 41
        -- upvalues: ReplicatedStorage (ref), u12 (copy), Workspace (ref), u11 (copy), SoundManager (ref), GameSound (ref), u13 (copy), EffectUtil (ref), default (ref), Linear (ref)
        local u15 = ReplicatedStorage.Assets.Misc.BedBreakEffects.ghostify_bed:Clone();

        if u15 then
            u15.Name = "BedBreakEffectBedClone";
            u15:PivotTo(u12);

            local function _(p16) -- Line: 47
                if p16:IsA("BasePart") then
                    p16.Anchored = true;
                end;
            end;

            for i, descendant in u15:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Anchored = true;
                end;
            end;

            u15.Parent = Workspace;
            u11.maid:GiveTask(u15);
            u11.maid:GiveTask(SoundManager:playSound(GameSound.GHOST_PILLAR_ERUPT, {
                rollOffMinDistance = 10,
                rollOffMaxDistance = 40,
                volumeMultiplier = 1.5,
                playbackSpeedMultiplier = 1.75,
                looped = false,
                position = u13
            }));
            EffectUtil:enableInstanceEffect(u15);
            EffectUtil:playInstanceEffects({ u15 });
            local u17 = SoundManager:playSound(GameSound.GHOST_PILLAR_LOOP, {
                rollOffMinDistance = 10,
                rollOffMaxDistance = 40,
                volumeMultiplier = 2,
                looped = true,
                position = u13
            });
            u11.maid:GiveTask(u17);
            u11.maid:GiveTask(task.delay(3, function() -- Line: 75
                -- upvalues: u15 (copy), default (ref), Linear (ref), u11 (ref), SoundManager (ref), u17 (copy)
                local function _(u18) -- Line: 79
                    -- upvalues: default (ref), Linear (ref)
                    if u18:IsA("BasePart") then
                        default(1, Linear, function(p19) -- Line: 82
                            -- upvalues: u18 (copy)
                            if u18 then
                                u18.Transparency = p19;
                            end;
                        end, u18.Transparency, 1);
                    end;
                end;

                for i, descendant in u15:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") then
                        default(1, Linear, function(p20) -- Line: 82
                            -- upvalues: descendant (copy)
                            if descendant then
                                descendant.Transparency = p20;
                            end;
                        end, descendant.Transparency, 1);
                    end;
                end;

                u11.maid:GiveTask(SoundManager:tweenSoundVolume(u17, 0, 1));
                u11.maid:GiveTask(task.delay(1.2, function() -- Line: 93
                    -- upvalues: u15 (ref), u17 (ref)
                    u15:Destroy();
                    u17:Stop();
                    u17:Destroy();
                end));
            end));
        end;
    end));
end;

KnitClient.CreateController(u2.new());

return nil;