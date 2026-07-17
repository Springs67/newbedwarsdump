-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v1.InExpo;
local OutExpo = v1.OutExpo;
local OutQuart = v1.OutQuart;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "VoidPortalBedBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p5, BedBreakEffectType.VOID_PORTAL);
    p5.Name = "VoidPortalBedBreakEffectController";
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p6);
end;

function u3.onBedBreak(p7, p8, p9, p10, p11) -- Line: 37
    p7:createEffect(p9, p10);
end;

function u3.createEffect(u12, u13, u14) -- Line: 40
    -- upvalues: KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), default (copy), OutQuart (copy), InExpo (copy), OutExpo (copy), SoundManager (copy), GameSound (copy)
    u12.maid:GiveTask(task.spawn(function() -- Line: 41
        -- upvalues: KnitClient (ref), u14 (copy), u12 (copy), u13 (copy), Workspace (ref), ReplicatedStorage (ref), default (ref), OutQuart (ref), InExpo (ref), OutExpo (ref)
        local u15 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(u14);
        u12.maid:GiveTask(u15);

        if u15 then
            u15.Name = "BedBreakEffectBedClone";
            u15:PivotTo(u13);
            u15.Parent = Workspace;
            local u16 = ReplicatedStorage.Assets.Effects.VoidBedParticles:Clone();

            local function _(p17) -- Line: 50
                -- upvalues: u15 (copy)
                p17.Parent = u15:WaitForChild("Bed", 1);
            end;

            for i, descendant in u16:GetDescendants() do
                local _ = i - 1;
                descendant.Parent = u15:WaitForChild("Bed", 1);
            end;

            u12.maid:GiveTask(task.delay(5, function() -- Line: 56
                -- upvalues: u16 (copy), u15 (copy)
                u16:Destroy();
                u15:Destroy();
            end));
            u12.maid:GiveTask(task.spawn(function() -- Line: 60
                -- upvalues: default (ref), OutQuart (ref), u15 (copy), InExpo (ref)
                default(2, OutQuart, function(p18) -- Line: 61
                    -- upvalues: u15 (ref)
                    u15:ScaleTo(p18);
                end, 1, 1.5):Wait();
                default(1.5, InExpo, function(p19) -- Line: 65
                    -- upvalues: u15 (ref)
                    u15:ScaleTo(p19);
                end, 1.5, 0.01):Play();
            end));
            u12.maid:GiveTask(task.spawn(function() -- Line: 71
                -- upvalues: u15 (copy), default (ref), OutExpo (ref)
                local function v21(p20) -- Line: 72
                    -- upvalues: u15 (ref)
                    u15:PivotTo(p20);
                end;

                local v22 = u15:GetPivot();
                local v23 = u15:GetPivot();
                local v24 = CFrame.Angles(5.235987755982989, 1.7453292519943295, 5.235987755982989);
                default(2.25, OutExpo, v21, v22, (v23 + Vector3.new(0, 4, 0)) * v24):Wait();

                local function v26(p25) -- Line: 81
                    -- upvalues: u15 (ref)
                    u15:PivotTo(p25);
                end;

                local v27 = u15:GetPivot();
                local v28 = u15:GetPivot();
                local v29 = CFrame.Angles(-1.7453292519943295, -0.8726646259971648, -5.235987755982989);
                default(0.75, OutExpo, v26, v27, (v28 - Vector3.new(0, 7, 0)) * v29):Play();
            end));
            u12.maid:GiveTask(task.delay(2.5, function() -- Line: 92
                -- upvalues: default (ref), OutExpo (ref), u15 (copy)
                default(1, OutExpo, function(u30) -- Line: 93
                    -- upvalues: u15 (ref)
                    local function _(p31) -- Line: 95
                        -- upvalues: u30 (copy)
                        if p31:IsA("MeshPart") then
                            p31.LocalTransparencyModifier = u30;
                        end;
                    end;

                    for i, descendant in u15:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("MeshPart") then
                            descendant.LocalTransparencyModifier = u30;
                        end;
                    end;
                end, 0, 1):Play();
            end));
        end;
    end));
    local u32 = ReplicatedStorage.Assets.Effects.BedVoidPortal:Clone();
    u32:PivotTo(u13 - Vector3.new(0, 0.5, 0));
    u12.maid:GiveTask(u32);
    local v33 = u32:GetDescendants();

    local function v36(u34) -- Line: 115
        -- upvalues: default (ref), OutQuart (ref)
        if u34:IsA("BasePart") then
            local Size = u34.Size;
            u34.Size = Size * 0.01;
            default(0.3, OutQuart, function(p35) -- Line: 120
                -- upvalues: u34 (copy)
                u34.Size = p35;
            end, Size * 0.01, Size):Play();
        end;
    end;

    for i, v in v33 do
        v36(v, i - 1, v33);
    end;

    u32.Parent = Workspace;
    u12.maid:GiveTask(task.delay(0.2, function() -- Line: 129
        -- upvalues: u12 (copy), SoundManager (ref), GameSound (ref), u13 (copy)
        u12.maid:GiveTask(SoundManager:playSound(GameSound.VOID_PORTAL_ENTER, {
            position = u13.Position
        }));
    end));
    u12.maid:GiveTask(task.delay(2.5, function() -- Line: 134
        -- upvalues: u12 (copy), SoundManager (ref), GameSound (ref), u13 (copy)
        u12.maid:GiveTask(SoundManager:playSound(GameSound.VOID_PORTAL_TELEPORT, {
            position = u13.Position
        }));
    end));
    u12.maid:GiveTask(task.delay(5, function() -- Line: 139
        -- upvalues: u32 (copy)
        u32:Destroy();
        u32.Parent = nil;
    end));
end;

KnitClient.CreateController(u3.new());

return nil;