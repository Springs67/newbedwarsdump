-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "CentipedeBedBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p5, BedBreakEffectType.CENTIPEDE);
    p5.Name = "CentipedeBedBreakEffectController";
end;

function u3.KnitStart(p6) -- Line: 33
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p6);
end;

function u3.onBedBreak(u7, p8, u9, u10, u11) -- Line: 36
    task.spawn(function() -- Line: 37
        -- upvalues: u7 (copy), u9 (copy), u11 (copy), u10 (copy)
        u7:createEffect(u9, u11, u10);
    end);
end;

function u3.createEffect(u12, p13, p14, p15) -- Line: 41
    -- upvalues: KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), u1 (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), Linear (copy)
    local u16 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p15);

    if not u16 then
        return nil;
    end;

    u16.Name = "BedBreakEffectBedClone";
    u16:PivotTo(p13);
    local Root = u16:FindFirstChild("Root");

    if not Root then
        return nil;
    end;

    local function _(p17) -- Line: 53
        if p17:IsA("BasePart") and p17.CanCollide then
            p17.CanCollide = false;
        end;
    end;

    for i, descendant in u16:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") and descendant.CanCollide then
            descendant.CanCollide = false;
        end;
    end;

    u16.Parent = Workspace;
    u12.maid:GiveTask(u16);
    local u18 = ReplicatedStorage.Assets.Effects.CentipedeBedRig:Clone();
    u18:PivotTo(p13);
    u1("WeldConstraint", {
        Enabled = true,
        Parent = u18.RootPart,
        Part0 = u18.RootPart,
        Part1 = Root
    });
    u18.Parent = u16;
    u12.maid:GiveTask(u18);
    local u19 = u1("Sound", {
        Looped = false,
        Parent = Root,
        SoundId = GameSound.CENTIPEDE_LEG_POP_OUT
    });
    u12.maid:GiveTask(u19);
    local u20 = u1("PitchShiftSoundEffect", {
        Octave = 1,
        Parent = u19
    });
    u12.maid:GiveTask(u20);
    local u21 = 0;
    local v22 = false;

    while true do
        if v22 then
            u21 = u21 + 1;
        else
            v22 = true;
        end;

        if u21 >= 8 then
            local v23 = GameAnimationUtil:playAnimation(u18.AnimationController.Animator, AnimationType.CENTIPEDE_BED_BREAK);
            local u24 = u1("Sound", {
                Looped = false,
                Volume = 0.7,
                Parent = Root,
                SoundId = GameSound.CENTIPEDE_STEP
            });
            u12.maid:GiveTask(u19);
            local u25 = u1("PitchShiftSoundEffect", {
                Octave = 1,
                Parent = u24
            });
            u12.maid:GiveTask(u25);

            if v23 then
                local u26 = true;
                u12.maid:GiveTask(function() -- Line: 121
                    -- upvalues: u26 (ref)
                    u26 = false;
                end);
                u12.maid:GiveTask(task.spawn(function() -- Line: 124
                    -- upvalues: u26 (ref), u25 (copy), u24 (copy)
                    while u26 do
                        u25.Octave = 1 + math.random() * 0.5;
                        u24:Play();
                        task.wait(math.random() * 0.1);
                    end;
                end));
            end;

            local u27 = u16:GetPivot();
            default(3, Linear, function(p28) -- Line: 133
                -- upvalues: u16 (copy), u27 (copy)
                local v29 = u27 + u27.RightVector * math.sin(p28 * 2 * 3.141592653589793 * 3);
                local Angles = CFrame.Angles;
                local v30 = math.sin(p28 * 2 * 3.141592653589793 * 3) * 5;
                local v31 = Angles(0, math.rad(v30), 0);
                local LookVector = u27.LookVector;
                local v32 = math.lerp(0, 20, p28);
                u16:PivotTo(v29 * v31 + LookVector * v32);
            end);
            u12.maid:GiveTask(task.delay(2, function() -- Line: 143
                -- upvalues: u16 (copy), Root (copy), u18 (copy), default (ref), Linear (ref)
                local function _(u33) -- Line: 145
                    -- upvalues: Root (ref), u18 (ref), default (ref), Linear (ref)
                    if u33:IsA("BasePart") and (u33 ~= Root and u33 ~= u18.RootPart) then
                        default(1, Linear, function(p34) -- Line: 147
                            -- upvalues: u33 (copy)
                            u33.Transparency = p34;
                        end);
                    end;
                end;

                for i, descendant in u16:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") and (descendant ~= Root and descendant ~= u18.RootPart) then
                        default(1, Linear, function(p35) -- Line: 147
                            -- upvalues: descendant (copy)
                            descendant.Transparency = p35;
                        end);
                    end;
                end;
            end));
            u12.maid:GiveTask(task.delay(3, function() -- Line: 156
                -- upvalues: u12 (copy)
                return u12.maid:Destroy();
            end));

            return;
        end;

        u12.maid:GiveTask(task.delay(u21 * 0.1, function() -- Line: 99
            -- upvalues: u20 (copy), u21 (ref), u19 (copy)
            u20.Octave = u21 * 0.1 + 1;
            u19:Play();
        end));
        u21 = u21;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;