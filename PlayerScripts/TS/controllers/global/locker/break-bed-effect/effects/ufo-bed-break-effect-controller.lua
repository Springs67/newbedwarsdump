-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InCirc = v2.InCirc;
local InExpo = v2.InExpo;
local Linear = v2.Linear;
local OutExpo = v2.OutExpo;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "UFOBreakBedEffect";
    end,

    __index = BreakBedEffectController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p6, BedBreakEffectType.UFO);
    p6.Name = "UFOBreakBedEffect";
end;

function u4.KnitStart(p7) -- Line: 39
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p7);
end;

function u4.onBedBreak(u8, p9, u10, p11) -- Line: 42
    -- upvalues: SoundManager (copy), GameSound (copy), KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), BLOCK_SIZE (copy), GameQueryUtil (copy), RunService (copy), default (copy), Linear (copy), InCirc (copy)
    u8.maid:GiveTask(SoundManager:playSound(GameSound.UFO_KILL_EFFECT, {
        rollOffMaxDistance = 80,
        position = u10.Position
    }));
    local u12 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p11);
    u12:PivotTo(u10);
    u12.Parent = Workspace;
    u8.maid:GiveTask(u12);
    local u13 = ReplicatedStorage.Assets.Misc.UFO_Silver:Clone();
    local u14 = u10.Position + Vector3.new(0, BLOCK_SIZE * 10, 0);

    local function _(p15) -- Line: 58
        -- upvalues: GameQueryUtil (ref)
        if p15:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(p15, true);
            p15.CanCollide = false;
        end;
    end;

    for i, descendant in u13:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, true);
            descendant.CanCollide = false;
        end;
    end;

    u13:PivotTo(CFrame.new(u14));
    u13.Parent = Workspace;
    u8.maid:GiveTask(u13);
    local u19 = RunService.Heartbeat:Connect(function(p16) -- Line: 71
        -- upvalues: u13 (copy)
        local v17 = u13.Body:GetPivot();
        local v18 = v17 - v17.Position;
        u13.Body:PivotTo(CFrame.new(u13.Body:GetPivot().Position) * v18 * CFrame.Angles(0, 0.020943951023931952, 0));
    end);
    u8.maid:GiveTask(u19);
    u8.maid:GiveTask(task.spawn(function() -- Line: 83
        -- upvalues: u8 (copy), u10 (copy), BLOCK_SIZE (ref), u13 (copy), u12 (copy), default (ref), Linear (ref), u14 (copy), InCirc (ref), u19 (copy)
        u8:tweenUFOPosition(u13, u10 + Vector3.new(0, BLOCK_SIZE * 4.4, 0), 0.3);
        u8:activateBeam(u13);
        default(1.4, Linear, function(p20) -- Line: 91
            -- upvalues: u12 (ref)
            u12:PivotTo(p20);
        end, u12:GetPivot(), u13:GetPivot() * CFrame.Angles(1.2217304763960306, 10.471975511965978, -1.0471975511965976));
        default(1.4, Linear, function(p21) -- Line: 98
            -- upvalues: u12 (ref)
            u12:ScaleTo(p21);
        end, 1, 0.5);
        u8.maid:GiveTask(task.delay(1.4, function() -- Line: 101
            -- upvalues: u12 (ref)
            u12:Destroy();
        end));
        u8.maid:GiveTask(task.delay(1.5, function() -- Line: 105
            -- upvalues: u8 (ref), u13 (ref), u14 (ref), InCirc (ref)
            u8:deactivateBeam(u13);
            u8:tweenUFOPosition(u13, CFrame.new(u14), 1, InCirc);
        end));
        u8.maid:GiveTask(task.delay(3, function() -- Line: 110
            -- upvalues: u12 (ref), u13 (ref), u19 (ref)
            u12:Destroy();
            u13:Destroy();
            u19:Disconnect();
        end));
    end));
end;

function u4.tweenUFOPosition(p22, u23, p24, p25, p26) -- Line: 117
    -- upvalues: default (copy), OutExpo (copy)
    default(p25 == nil and 0.3 or p25, p26 or OutExpo, function(p27) -- Line: 123
        -- upvalues: u23 (copy)
        return u23:PivotTo(p27);
    end, u23:GetPivot(), p24):Wait();
end;

function u4.activateBeam(p28, u29) -- Line: 127
    -- upvalues: default (copy), InExpo (copy), Linear (copy)
    default(0.5, InExpo, function(p30) -- Line: 129
        -- upvalues: u29 (copy), Linear (ref)
        local Beam = u29:FindFirstChild("Beam");

        if Beam then
            Beam.Transparency = Linear(p30, 1, -0.4, 1);
        end;
    end, 0, 1):Wait();
end;

function u4.deactivateBeam(p31, u32) -- Line: 136
    -- upvalues: default (copy), InExpo (copy)
    default(0.5, InExpo, function(p33) -- Line: 138
        -- upvalues: u32 (copy)
        local Beam = u32:FindFirstChild("Beam");

        if Beam then
            Beam.Transparency = p33;
        end;
    end, u32.Beam.Transparency, 1):Wait();
end;

KnitClient.CreateController(u4.new());

return nil;