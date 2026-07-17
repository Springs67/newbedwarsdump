-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local WorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "world-util").WorldUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "WorldController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "WorldController";
end;

function u2.KnitStart(p5) -- Line: 31
    -- upvalues: KnitController (copy), PlaceUtil (copy), ClientStore (copy), getQueueMeta (copy), RunService (copy), Workspace (copy), WorldUtil (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(p5);

    if not PlaceUtil.isGameServer() then
        return nil;
    end;

    ClientStore.changed:connect(function(p6, p7) -- Line: 36
        -- upvalues: getQueueMeta (ref), RunService (ref), Workspace (ref), WorldUtil (ref), ClientSyncEvents (ref)
        local queueType = p6.Game.queueType;

        if queueType and (queueType ~= p7.Game.queueType and getQueueMeta(queueType).scene == nil) then
            local u8 = nil;
            RunService.Heartbeat:Connect(function() -- Line: 42
                -- upvalues: Workspace (ref), WorldUtil (ref), u8 (ref), ClientSyncEvents (ref)
                local CurrentCamera = Workspace.CurrentCamera;

                if CurrentCamera ~= nil then
                    CurrentCamera = CurrentCamera.CFrame.Position;
                end;

                if not CurrentCamera then
                    return nil;
                end;

                local v9 = WorldUtil:getWorldFromPosition(CurrentCamera);

                if v9 ~= nil then
                    v9 = v9.Name;
                end;

                if v9 ~= u8 then
                    ClientSyncEvents.ChangeWorld:fire(v9, u8);
                    u8 = v9;
                end;
            end);
        end;
    end);
end;

function u2.watchLocalWorld(p10, u11) -- Line: 65
    -- upvalues: Workspace (copy), WorldUtil (copy), ClientSyncEvents (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.CFrame.Position;
    end;

    local u12;

    if CurrentCamera then
        u12 = WorldUtil:getWorldFromPosition(CurrentCamera);
    else
        u12 = nil;
    end;

    task.spawn(function() -- Line: 72
        -- upvalues: u11 (copy), u12 (copy)
        u11(u12);
    end);

    return ClientSyncEvents.ChangeWorld:connect(function(p13) -- Line: 75
        -- upvalues: Workspace (ref), u11 (copy)
        local toWorldId = p13.toWorldId;
        local u14;

        if toWorldId == "" or not toWorldId then
            u14 = nil;
        else
            u14 = Workspace:WaitForChild("Map"):WaitForChild("Worlds"):FindFirstChild(p13.toWorldId);
        end;

        task.spawn(function() -- Line: 78
            -- upvalues: u11 (ref), u14 (copy)
            u11(u14);
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;