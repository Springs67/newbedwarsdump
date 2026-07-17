-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "StatefulEntityDispatcherController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "StatefulEntityDispatcherController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), default (copy), SharedSyncEvents (copy)
    KnitController.KnitStart(p4);
    default.Client:WaitFor("StatefulEntityDamage"):expect():Connect(function(p5, p6, p7) -- Line: 28
        -- upvalues: SharedSyncEvents (ref)
        SharedSyncEvents.SharedStatefulEntityDamage:fire(p5, p6, p7);
    end);
    default.Client:WaitFor("StatefulEntityDeath"):expect():Connect(function(p8, p9, p10) -- Line: 32
        -- upvalues: SharedSyncEvents (ref)
        SharedSyncEvents.SharedStatefulEntityDeath:fire(p8, p9, p10);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;