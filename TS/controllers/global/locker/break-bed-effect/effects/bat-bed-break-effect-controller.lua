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
        return "BatBedBreakEffectController";
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
    BreakBedEffectController.constructor(p4, BedBreakEffectType.BAT);
    p4.Name = "BatBedBreakEffectController";
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

function u2.createEffect(p11, p12, p13, p14) -- Line: 40
    -- upvalues: KnitClient (copy), Workspace (copy), default (copy), Linear (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local v15 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p14);

    if not v15 then
        return nil;
    end;

    v15.Name = "BedBreakEffectBedClone";
    v15:PivotTo(p12);
    v15.Parent = Workspace;
    local Root = v15:FindFirstChild("Root");

    if Root ~= nil then
        local function _(u16) -- Line: 52
            -- upvalues: default (ref), Linear (ref)
            if u16:IsA("BasePart") then
                default(1, Linear, function(p17) -- Line: 54
                    -- upvalues: u16 (copy)
                    u16.Transparency = p17;
                end, 0, 1);
            end;
        end;

        for i, descendant in Root:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                default(1, Linear, function(p18) -- Line: 54
                    -- upvalues: descendant (copy)
                    descendant.Transparency = p18;
                end, 0, 1);
            end;
        end;
    end;

    local v19 = ReplicatedStorage.Assets.Effects.BatExplosion:Clone();
    v19.Parent = v15;
    v19.Position = v15:GetPivot().Position;
    EffectUtil:playEffects({ v19 });
    p11.maid:GiveTask(SoundManager:playSound(GameSound.BAT_EXPLOSION, {
        position = p12.Position
    }));
    p11.maid:GiveTask(v15);
end;

KnitClient.CreateController(u2.new());

return nil;