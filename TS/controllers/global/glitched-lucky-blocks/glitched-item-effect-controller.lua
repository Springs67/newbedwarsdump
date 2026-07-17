-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "GlitchedItemEffectController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "GlitchedItemEffectController";
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), getItemMeta (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.EntityChangeHeldItem:connect(function(p6) -- Line: 31
        -- upvalues: getItemMeta (ref), u5 (copy)
        if not p6.entity then
            return nil;
        end;

        local item = p6.item;

        if item ~= nil then
            item = item.Name;
        end;

        if not item then
            return nil;
        end;

        if getItemMeta(item).glitched then
            u5:playGlitchParticlesOnHand(p6.entity:getInstance());
        end;
    end);
end;

function u2.playGlitchParticlesOnHand(p7, u8, p9, p10) -- Line: 49
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    task.spawn(function() -- Line: 50
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u8 (copy), EffectUtil (ref)
        local v11 = ReplicatedStorage.Assets.Effects.GlitchedItemEffect:Clone();
        v11.Name = "GlitchEffectHand";
        v11.Parent = Workspace;
        v11.Transparency = 1;
        task.wait(0.3);
        v11.CFrame = CFrame.new(u8.RightHand.Position);
        EffectUtil:playEffects({ v11 }, nil, {
            destroyAfterSec = 1.5
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;