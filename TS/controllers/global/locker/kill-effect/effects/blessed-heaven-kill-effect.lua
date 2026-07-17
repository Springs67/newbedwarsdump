-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "BlessedHeavenKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 29
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(p7, p8, p9, u10) -- Line: 33
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), WeldUtil (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), Linear (copy), SoundManager (copy), GameSound (copy)
    local u11 = u1.new();
    p9.Archivable = true;
    local u12 = p9:Clone();
    u12.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u12.HumanoidRootPart.Anchored = true;
    u12:PivotTo(u10);
    u12.Parent = Workspace;
    KillEffect.hideCharacter(p7, p9);
    u11:GiveTask(u12);
    local v13 = ReplicatedStorage.Assets.Effects.BlessedWings:Clone();
    v13.Parent = u12;
    WeldUtil:weldCharacterAccessories(u12);
    u11:GiveTask(v13);
    local u14 = GameAnimationUtil:playAnimation(u12:FindFirstChildWhichIsA("Humanoid"):FindFirstChild("Animator"), AnimationType.HEAVEN_ASCEND);
    u14.Looped = true;
    u11:GiveTask(function() -- Line: 53
        -- upvalues: u14 (copy)
        u14:Stop();
    end);
    local v15 = ReplicatedStorage.Assets.Effects.HeavenBlessed:Clone();
    v15:PivotTo(u12.PrimaryPart.CFrame);
    v15.Parent = Workspace;
    u11:GiveTask(v15);
    local v16 = ReplicatedStorage.Assets.Misc.HeavenlyHarp:Clone();
    v16:PivotTo(u12.PrimaryPart.CFrame + Vector3.new(7, 0, 7));
    v16.Parent = Workspace;
    v16.RootPart.Anchored = true;
    u11:GiveTask(v16);
    local u17 = u10 + Vector3.new(0, 30, 0);
    default(7, Linear, function(p18) -- Line: 72
        -- upvalues: u12 (copy), u10 (copy), u17 (copy)
        if not u12.PrimaryPart then
            return nil;
        end;

        u12:PivotTo(u10:Lerp(u17, p18));
    end);
    SoundManager:playSound(GameSound.HEAVEN_ASCEND, {
        rollOffMaxDistance = 50,
        volumeMultiplier = 0.5,
        parent = v16.PrimaryPart
    });
    task.delay(5, function() -- Line: 83
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

return u3;