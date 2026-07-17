-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameReset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "DailyWeeklyController";
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
    p3.Name = "DailyWeeklyController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), GameReset (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(p4);
    local u5 = GameReset.getResetTimeManager():getDailyResetId();
    GameReset.getResetTimeManager():poll(86400, 86400, function(p6) -- Line: 28
        -- upvalues: ClientSyncEvents (ref), u5 (copy)
        ClientSyncEvents.DailyReset:fire(u5, p6);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;