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
    __tostring = function() -- Line: 20, Name: __tostring
        return "FrozenBreakEffectController";
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
    BreakBedEffectController.constructor(p4, BedBreakEffectType.FROZEN);
    p4.Name = "FrozenBreakEffectController";
end;

function u2.KnitStart(p5) -- Line: 34
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p5);
end;

function u2.onBedBreak(p6, p7, p8, p9, p10) -- Line: 37
    p6:createEffect(p8, p10, p9);
end;

function u2.createEffect(u11, u12, p13, u14) -- Line: 40
    -- upvalues: KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), default (copy), Linear (copy)
    u11.maid:GiveTask(task.spawn(function() -- Line: 41
        -- upvalues: KnitClient (ref), u14 (copy), u11 (copy), u12 (copy), Workspace (ref)
        local u15 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(u14);
        u11.maid:GiveTask(u15);

        if u15 then
            u15.Name = "BedBreakEffectBedClone";
            u15:PivotTo(u12);
            u15.Parent = Workspace;

            local function _(p16) -- Line: 49
                if p16:IsA("MeshPart") then
                    p16.LocalTransparencyModifier = 0.5;
                end;
            end;

            for i, descendant in u15:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("MeshPart") then
                    descendant.LocalTransparencyModifier = 0.5;
                end;
            end;

            u11.maid:GiveTask(task.delay(3, function() -- Line: 57
                -- upvalues: u15 (copy)
                u15:Destroy();
            end));
        end;
    end));
    local u17 = ReplicatedStorage.Assets.Effects.FrostBedEffect:Clone();
    local Root = u17:FindFirstChild("Root");

    if not Root then
        return nil;
    end;

    local u18 = Root:FindFirstChild("ice shards");

    if u18 ~= nil then
        local function _(p19) -- Line: 71
            -- upvalues: u11 (copy)
            if p19:IsA("Model") then
                u11:fade(p19:GetChildren(), "out");
            end;
        end;

        for i, child in u18:GetChildren() do
            local _ = i - 1;

            if child:IsA("Model") then
                u11:fade(child:GetChildren(), "out");
            end;
        end;
    end;

    u17:PivotTo(u12);
    u17.Parent = Workspace;
    u11.maid:GiveTask(u17);
    u11.maid:GiveTask(SoundManager:playSound(GameSound.SEAHORSE_FREEZE, {
        position = u12.Position
    }));
    local u20 = 0;

    if u18 ~= nil then
        local function _(u21) -- Line: 90
            -- upvalues: u20 (ref), u11 (copy)
            if u21:IsA("Model") then
                task.delay(u20 * 0.5, function() -- Line: 92
                    -- upvalues: u11 (ref), u21 (copy)
                    u11:fade(u21:GetChildren(), "in", 1.5);
                end);
                u20 = u20 + 1;
            end;
        end;

        for i, child in u18:GetChildren() do
            local _ = i - 1;

            if child:IsA("Model") then
                task.delay(u20 * 0.5, function() -- Line: 92
                    -- upvalues: u11 (copy), child (copy)
                    u11:fade(child:GetChildren(), "in", 1.5);
                end);
                u20 = u20 + 1;
            end;
        end;
    end;

    local u22 = 0;
    u11.maid:GiveTask(task.delay(3, function() -- Line: 103
        -- upvalues: u18 (copy), u11 (copy), u22 (ref), SoundManager (ref), GameSound (ref), u12 (copy)
        local v23 = u18;

        if v23 ~= nil then
            local v24 = v23:GetChildren();

            local function v31(p25) -- Line: 107
                -- upvalues: u11 (ref), u22 (ref), SoundManager (ref), GameSound (ref), u12 (ref)
                if p25:IsA("Model") then
                    local v26 = p25:GetChildren();

                    local function v30(u27) -- Line: 110
                        -- upvalues: u11 (ref), u22 (ref), SoundManager (ref), GameSound (ref), u12 (ref)
                        if u27:IsA("MeshPart") then
                            u11.maid:GiveTask(task.delay(u22 * 0.15, function() -- Line: 112
                                -- upvalues: u27 (copy), u11 (ref), SoundManager (ref), GameSound (ref), u12 (ref)
                                u27.Anchored = false;
                                local v28 = math.random(-50, 50);
                                local v29 = math.random(10, 50);
                                u27:ApplyImpulse((Vector3.new(v28, v29, math.random(-50, 50))));
                                u11.maid:GiveTask(SoundManager:playSound(GameSound.BREAK_FROZEN_BLOCK, {
                                    position = u12.Position
                                }));
                            end));
                            u22 = u22 + 1;
                        end;
                    end;

                    for i, v in v26 do
                        v30(v, i - 1, v26);
                    end;

                    u22 = u22 + 1;
                end;
            end;

            for i, v in v24 do
                v31(v, i - 1, v24);
            end;
        end;
    end));
    u11.maid:GiveTask(task.delay(3, function() -- Line: 133
        -- upvalues: default (ref), Linear (ref), u17 (copy)
        default(1, Linear, function(p32) -- Line: 134
            -- upvalues: u17 (ref)
            local BedCover = u17:FindFirstChild("BedCover", true);

            if BedCover then
                BedCover.LocalTransparencyModifier = p32;
            end;
        end, 0, 1):Play();
    end));
    u11.maid:GiveTask(task.delay(6, function() -- Line: 142
        -- upvalues: u17 (copy)
        u17:Destroy();
        u17.Parent = nil;
    end));
end;

function u2.fade(p33, p34, u35, u36) -- Line: 147
    -- upvalues: default (copy), Linear (copy)
    local function v39(u37) -- Line: 149
        -- upvalues: u36 (copy), default (ref), Linear (ref), u35 (copy)
        if u37:IsA("MeshPart") then
            if u36 ~= 0 and (u36 == u36 and u36) then
                default(u36, Linear, function(p38) -- Line: 152
                    -- upvalues: u37 (copy)
                    u37.LocalTransparencyModifier = p38;
                end, u35 == "in" and 1 or 0, u35 == "in" and 0 or 1):Play();

                return;
            end;

            u37.LocalTransparencyModifier = u35 == "in" and 0 or 1;
        end;
    end;

    for i, v in p34 do
        v39(v, i - 1, p34);
    end;
end;

KnitClient.CreateController(u2.new());

return nil;