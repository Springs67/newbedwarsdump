-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "LightningStrikeBedBreakController";
    end,

    __index = BreakBedEffectController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p4, BedBreakEffectType.LIGHTNING_STRIKE);
    p4.Name = "LightningStrikeBedBreakController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p5);
end;

function u2.onBedBreak(u6, p7, u8, p9) -- Line: 30
    -- upvalues: KnitClient (copy), Workspace (copy), ReplicatedStorage (copy)
    local u10 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p9);
    u10:PivotTo(u8);
    u10.Parent = Workspace;
    u6.maid:GiveTask(u10);
    local u11 = ReplicatedStorage.Assets.Effects.LightningCloud:Clone();
    u6.maid:GiveTask(u11);
    u11:PivotTo(u8 + Vector3.new(0, 23.5, 0));
    u11.Parent = Workspace;
    u6.maid:GiveTask(task.delay(1.5, function() -- Line: 42
        -- upvalues: u11 (copy)
        local function _(p12) -- Line: 44
            if p12:IsA("ParticleEmitter") then
                p12.Enabled = false;
            end;
        end;

        for i, descendant in u11:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = false;
            end;
        end;
    end));
    u6.maid:GiveTask(task.delay(2.5, function() -- Line: 53
        -- upvalues: u11 (copy)
        u11:Destroy();
        u11.Parent = nil;
    end));
    u6.maid:GiveTask(task.delay(0.8, function() -- Line: 57
        -- upvalues: u6 (copy), KnitClient (ref), u8 (copy), u10 (copy)
        local v13 = false;
        local v14 = 0;

        while true do
            if v13 then
                v14 = v14 + 1;
            else
                v13 = true;
            end;

            if v14 >= 3 then
                u10:Destroy();

                return;
            end;

            local maid = u6.maid;
            local WizardLightningStrikeController = KnitClient.Controllers.WizardLightningStrikeController;
            local Position = u8.Position;
            local v15 = math.random(-3, 3);
            maid:GiveTask(WizardLightningStrikeController:playLightningEffects(Position + Vector3.new(v15, -1.5, math.random(-3, 3)), true));
        end;
    end));
end;

KnitClient.CreateController(u2.new());

return nil;