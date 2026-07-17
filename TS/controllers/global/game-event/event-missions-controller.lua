-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Signal = v1.Signal;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "EventMissionsController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy), default (copy), Signal (copy)
    KnitController.constructor(p4);
    p4.Name = "EventMissionsController";
    p4.eventRemotes = default.Client:GetNamespace("Event");
    p4.missionsUpdate = p4.eventRemotes:Get("ActiveEventMissionsUpdate");
    p4.activeMissions = {};
    p4.missionDataReceivedSignal = Signal.new();
end;

function u2.KnitStart(u5) -- Line: 31
    -- upvalues: KnitController (copy), ClientStore (copy)
    KnitController.KnitStart(u5);
    u5.missionsUpdate:Connect(function(p6) -- Line: 33
        -- upvalues: ClientStore (ref), u5 (copy)
        ClientStore:dispatch({
            type = "SetEventPartial",
            data = {
                activeMissions = p6
            }
        });
        u5.activeMissions = p6;
        u5.missionDataReceivedSignal:Fire(p6);
    end);
end;

function u2.waitForMissionData(p7) -- Line: 44
    if next(p7.activeMissions) == nil then
        return p7.missionDataReceivedSignal:Wait();
    end;

    return p7.activeMissions;
end;

function u2.getEventActiveMissions(p8, p9) -- Line: 51
    return p8.activeMissions[p9];
end;

function u2.claimMission(p10, p11, p12) -- Line: 56
    return p10.eventRemotes:Get("ClaimMission"):CallServer(p11, p12);
end;

KnitClient.CreateController(u2.new());

return nil;