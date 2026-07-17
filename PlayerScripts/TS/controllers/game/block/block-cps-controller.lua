-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngineClientEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local HttpService = v1.HttpService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CpsConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").CpsConstants;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "BlockCpsController";
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
    p4.Name = "BlockCpsController";
    p4.lastPlaceTimestamp = 0;
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), BlockEngineClientEvents (copy), SyncEventPriority (copy), CpsConstants (copy), Workspace (copy), HttpService (copy)
    KnitController.KnitStart(u5);
    BlockEngineClientEvents.PlaceBlock:setPriority(SyncEventPriority.HIGHEST):connect(function(p6) -- Line: 34
        -- upvalues: CpsConstants (ref), Workspace (ref), u5 (copy), HttpService (ref)
        if p6:isCancelled() then
            return nil;
        end;

        local v7 = 1 / CpsConstants.BLOCK_PLACE_CPS;
        local v8 = v7 - (Workspace:GetServerTimeNow() - u5.lastPlaceTimestamp);

        if v8 <= 0 then
            return nil;
        end;

        if not (v8 < v7 * 0.5) then
            return p6:setCancelled(true);
        end;

        p6.id = HttpService:GenerateGUID();
        u5.pendingPlacement = p6.id;
        task.wait(v8);
    end);
    BlockEngineClientEvents.PlaceBlock:setPriority(SyncEventPriority.LOWEST):connect(function(p9) -- Line: 60
        -- upvalues: u5 (copy), Workspace (ref)
        if p9:isCancelled() then
            return nil;
        end;

        local id = p9.id;

        if id ~= "" and id then
            id = u5.pendingPlacement ~= p9.id;
        end;

        if id ~= "" and id then
            return p9:setCancelled(true);
        end;

        u5.lastPlaceTimestamp = Workspace:GetServerTimeNow();
        u5.pendingPlacement = nil;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;