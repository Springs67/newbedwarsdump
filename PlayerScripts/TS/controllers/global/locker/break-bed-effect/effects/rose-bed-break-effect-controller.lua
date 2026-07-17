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
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "RoseBedBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p4, BedBreakEffectType.ROSE);
    p4.Name = "RoseBedBreakEffectController";
end;

function u2.KnitStart(p5) -- Line: 31
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p5);
end;

function u2.onBedBreak(u6, p7, u8, u9, p10) -- Line: 34
    -- upvalues: KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), default (copy), Linear (copy)
    u6.maid:GiveTask(task.spawn(function() -- Line: 35
        -- upvalues: KnitClient (ref), u9 (copy), u6 (copy), u8 (copy), Workspace (ref), ReplicatedStorage (ref), SoundManager (ref), GameSound (ref), default (ref), Linear (ref)
        local u11 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(u9);
        u6.maid:GiveTask(u11);

        if u11 then
            u11.Name = "BedBreakEffectBedClone";
            u11:PivotTo(u8);
            u11.Parent = Workspace;

            local function _(p12) -- Line: 43
                if p12:IsA("MeshPart") then
                    p12.LocalTransparencyModifier = 0.5;
                end;
            end;

            for i, descendant in u11:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("MeshPart") then
                    descendant.LocalTransparencyModifier = 0.5;
                end;
            end;

            task.delay(5, function() -- Line: 51
                -- upvalues: u11 (copy)
                u11:Destroy();
            end);
        end;

        local u13 = ReplicatedStorage.Assets.Effects.RoseBedBreakEffect:Clone();
        u13:PivotTo(u8);
        u13.Parent = Workspace;
        local PrimaryPart = u13.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart:WaitForChild("Model", 1);

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart:GetChildren();
            end;
        end;

        if not PrimaryPart then
            return nil;
        end;

        SoundManager:playSound(GameSound.FLOWER_BLOOM, {
            position = u8.Position
        });

        local function v17(u14) -- Line: 72
            -- upvalues: default (ref), Linear (ref)
            local Size = u14.Size;
            local v15 = u14.Size * math.random(1.5, 3);
            default(math.random(1, 2), Linear, function(p16) -- Line: 77
                -- upvalues: u14 (copy)
                u14.Size = p16;
            end, Size, v15);
        end;

        for i, v in PrimaryPart do
            v17(v, i - 1, PrimaryPart);
        end;

        task.delay(2.5, function() -- Line: 84
            -- upvalues: default (ref), Linear (ref), PrimaryPart (copy), u13 (copy), u11 (copy)
            local function v21(u18) -- Line: 91
                -- upvalues: default (ref), Linear (ref)
                local v19 = u18:FindFirstChildOfClass("ParticleEmitter");

                if v19 then
                    v19:Emit(5);
                end;

                default(0.5, Linear, function(p20) -- Line: 96
                    -- upvalues: u18 (copy)
                    u18.Transparency = p20;
                end, 0, 1);
            end;

            for i, v in PrimaryPart do
                v21(v, i - 1, PrimaryPart);
            end;

            local PrimaryPart2 = u13.PrimaryPart;

            if PrimaryPart2 ~= nil then
                PrimaryPart2 = PrimaryPart2:FindFirstChild("Flower_Bouquet");
            end;

            if PrimaryPart2 then
                default(0.5, Linear, function(p22) -- Line: 109
                    -- upvalues: PrimaryPart2 (copy)
                    PrimaryPart2.Transparency = p22;
                end, 0, 1);
            end;

            u11:Destroy();
        end);
        task.delay(5, function() -- Line: 115
            -- upvalues: u13 (copy)
            u13:Destroy();
        end);
    end));
end;

KnitClient.CreateController(u2.new());

return nil;