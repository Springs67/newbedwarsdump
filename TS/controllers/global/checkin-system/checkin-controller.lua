-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "CheckinController";
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
    p3.Name = "CheckinController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy)
    KnitController.KnitStart(p4);
    default.Client:Get("SendCheckInData"):Connect(function(p5) -- Line: 27
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "LobbySetCheckInData",
            system = p5.system,
            data = p5.profileData
        });
    end);
end;

function u1.recordCheckIn(p6, u7) -- Line: 35
    -- upvalues: default (copy), ClientStore (copy)
    print("[CheckinController] Recording check-in for system:");
    local v8 = default.Client:Get("RecordCheckIn"):CallServerAsync(u7);
    v8:andThen(function(p9) -- Line: 39
        -- upvalues: ClientStore (ref), u7 (copy)
        if not p9 then
            return nil;
        end;

        ClientStore:dispatch({
            type = "LobbyRecordCheckIn",
            system = u7
        });
    end);

    return v8;
end;

function u1.requestCheckInData(p10, u11) -- Line: 51
    -- upvalues: default (copy), ClientStore (copy)
    local v12 = default.Client:Get("RequestCheckInData"):CallServerAsync(u11);
    v12:andThen(function(p13) -- Line: 54
        -- upvalues: ClientStore (ref), u11 (copy)
        if not p13 then
            return nil;
        end;

        ClientStore:dispatch({
            type = "LobbySetCheckInData",
            system = u11,
            data = p13
        });
    end);

    return v12;
end;

KnitClient.CreateController(u1.new());

return nil;