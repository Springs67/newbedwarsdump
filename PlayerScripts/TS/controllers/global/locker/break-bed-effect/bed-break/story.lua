-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return function(p4) -- Line: 15
    -- upvalues: u1 (copy), ReplicatedStorage (copy), ColorUtil (copy), TeamColorHex (copy), Workspace (copy), u2 (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), Linear (copy)
    local u5 = u1.new();
    local v6 = CFrame.new(30.913, 303.437, 469.703);
    local u7 = ReplicatedStorage.Assets.Blocks.bed:Clone();
    local v8 = ColorUtil.hexColor(TeamColorHex.lightBlue);
    u7.Root.Bed.Color = v8;
    u7.Root.Blanket.Color = ColorUtil.brighten(v8, 0.2);
    u7:PivotTo(v6);
    u7.Parent = Workspace;
    u5:GiveTask(u7);

    if not u7 then
        return nil;
    end;

    u7.Name = "BedBreakEffectBedClone";
    u7:PivotTo(v6);
    local Root = u7:FindFirstChild("Root");

    if not Root then
        return nil;
    end;

    local function _(p9) -- Line: 40
        if p9:IsA("BasePart") and p9.CanCollide then
            p9.CanCollide = false;
        end;
    end;

    for i, descendant in u7:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") and descendant.CanCollide then
            descendant.CanCollide = false;
        end;
    end;

    u7.Parent = Workspace;
    u5:GiveTask(u7);
    local u10 = ReplicatedStorage.Assets.Effects.CentipedeBedRig:Clone();
    u10:PivotTo(v6);
    u2("WeldConstraint", {
        Enabled = true,
        Parent = u10.RootPart,
        Part0 = u10.RootPart,
        Part1 = Root
    });
    u10.Parent = u7;
    u5:GiveTask(u10);
    local u11 = u2("Sound", {
        Looped = false,
        Parent = Root,
        SoundId = GameSound.CENTIPEDE_LEG_POP_OUT
    });
    u5:GiveTask(u11);
    local u12 = u2("PitchShiftSoundEffect", {
        Octave = 1,
        Parent = u11
    });
    u5:GiveTask(u12);
    local u13 = 0;
    local v14 = false;

    while true do
        if v14 then
            u13 = u13 + 1;
        else
            v14 = true;
        end;

        if u13 >= 8 then
            break;
        end;

        task.delay(u13 * 0.1, function() -- Line: 86
            -- upvalues: u12 (copy), u13 (ref), u11 (copy)
            u12.Octave = u13 * 0.1 + 1;
            u11:Play();
        end);
        u13 = u13;
    end;

    GameAnimationUtil:playAnimation(u10.AnimationController.Animator, AnimationType.CENTIPEDE_BED_BREAK);
    local v15 = u2("Sound", {
        Looped = false,
        Parent = Root,
        SoundId = GameSound.CENTIPEDE_STEP
    });
    u5:GiveTask(v15);
    u5:GiveTask((u2("PitchShiftSoundEffect", {
        Octave = 1,
        Parent = v15
    })));
    local v16 = false;
    local v17 = 0;

    while true do
        if v16 then
            v17 = v17 + 1;
        else
            v16 = true;
        end;

        if v17 >= 30 then
            local u18 = u7:GetPivot();
            default(3, Linear, function(p19) -- Line: 124
                -- upvalues: u7 (copy), u18 (copy)
                local v20 = u18 + u18.RightVector * math.sin(p19 * 2 * 3.141592653589793 * 3);
                local Angles = CFrame.Angles;
                local v21 = math.sin(p19 * 2 * 3.141592653589793 * 3) * 5;
                local v22 = Angles(0, math.rad(v21), 0);
                local LookVector = u18.LookVector;
                local v23 = math.lerp(0, 20, p19);
                u7:PivotTo(v20 * v22 + LookVector * v23);
            end);
            task.delay(2, function() -- Line: 134
                -- upvalues: u7 (copy), Root (copy), u10 (copy), default (ref), Linear (ref)
                local function _(u24) -- Line: 136
                    -- upvalues: Root (ref), u10 (ref), default (ref), Linear (ref)
                    if u24:IsA("BasePart") and (u24 ~= Root and u24 ~= u10.RootPart) then
                        default(1, Linear, function(p25) -- Line: 138
                            -- upvalues: u24 (copy)
                            u24.Transparency = p25;
                        end);
                    end;
                end;

                for i, descendant in u7:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") and (descendant ~= Root and descendant ~= u10.RootPart) then
                        default(1, Linear, function(p26) -- Line: 138
                            -- upvalues: descendant (copy)
                            descendant.Transparency = p26;
                        end);
                    end;
                end;
            end);
            task.delay(3, function() -- Line: 147
                -- upvalues: u5 (copy)
                return u5:Destroy();
            end);

            return;
        end;

        task.delay(v17 * math.random() * 0.1, function() -- Line: 117
            -- upvalues: u12 (copy), u11 (copy)
            u12.Octave = 1 + math.random() * 0.5;
            u11:Play();
        end);
    end;
end;