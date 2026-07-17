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
    __tostring = function() -- Line: 18, Name: __tostring
        return "ElectrocutedBedBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p4, BedBreakEffectType.ELECTROCUTED);
    p4.Name = "ElectrocutedBedBreakEffectController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p5);
end;

function u2.onBedBreak(u6, p7, u8, u9, u10) -- Line: 35
    task.spawn(function() -- Line: 36
        -- upvalues: u6 (copy), u8 (copy), u10 (copy), u9 (copy)
        u6:createEffect(u8, u10, u9);
    end);
end;

function u2.createEffect(u11, p12, p13, p14) -- Line: 40
    -- upvalues: KnitClient (copy), Workspace (copy), default (copy), Linear (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local v15 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p14);

    if not v15 then
        return nil;
    end;

    u11.maid:GiveTask(v15);
    v15.Name = "BedBreakEffectBedClone";
    v15:PivotTo(p12);
    local Root = v15:FindFirstChild("Root");

    if Root ~= nil then
        local function _(p16) -- Line: 52
            if p16:IsA("BasePart") then
                p16.Transparency = 0.55;
            end;
        end;

        for i, descendant in Root:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Transparency = 0.55;
            end;
        end;
    end;

    v15.Parent = Workspace;

    if Root ~= nil then
        local function _(u17) -- Line: 65
            -- upvalues: default (ref), Linear (ref)
            if u17:IsA("BasePart") then
                default(0.5, Linear, function(p18) -- Line: 67
                    -- upvalues: u17 (copy)
                    u17.Transparency = p18;
                end, 0, 1);
            end;
        end;

        for i, descendant in Root:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                default(0.5, Linear, function(p19) -- Line: 67
                    -- upvalues: descendant (copy)
                    descendant.Transparency = p19;
                end, 0, 1);
            end;
        end;
    end;

    u11.maid:GiveTask(v15);
    local u20 = ReplicatedStorage.Assets.Effects.ElektraBedEffect:Clone();
    u20:PivotTo(p12);
    u20.Parent = Workspace;
    u11.maid:GiveTask(u20);
    EffectUtil:playInstanceEffects({ u20 }, {
        destroyAfterSec = 5
    });
    u11.maid:GiveTask(SoundManager:playSound(GameSound.WIZARD_LIGHTNING_STRIKE, {
        position = p12.Position
    }));
    u11.maid:GiveTask(task.delay(2, function() -- Line: 87
        -- upvalues: u20 (copy), default (ref), Linear (ref)
        local Root2 = u20:FindFirstChild("Root");

        if Root2 ~= nil then
            local function _(u21) -- Line: 91
                -- upvalues: default (ref), Linear (ref)
                if u21:IsA("BasePart") and u21.Name ~= "bedbreakElektra" then
                    default(0.5, Linear, function(p22) -- Line: 93
                        -- upvalues: u21 (copy)
                        u21.Transparency = p22;
                    end, 0, 1);
                end;
            end;

            for i, descendant in Root2:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") and descendant.Name ~= "bedbreakElektra" then
                    default(0.5, Linear, function(p23) -- Line: 93
                        -- upvalues: descendant (copy)
                        descendant.Transparency = p23;
                    end, 0, 1);
                end;
            end;
        end;
    end));
    u11.maid:GiveTask(task.delay(5, function() -- Line: 103
        -- upvalues: u11 (copy)
        u11.maid:DoCleaning();
    end));
end;

KnitClient.CreateController(u2.new());

return nil;