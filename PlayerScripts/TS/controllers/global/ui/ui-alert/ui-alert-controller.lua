-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "UiAlertController";
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
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "UiAlertController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy), u1 (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(p5);
    default.Client:Get("SendPlayerUIAlerts"):Connect(function(p6) -- Line: 29
        -- upvalues: ClientStore (ref), u1 (ref), ClientSyncEvents (ref)
        ClientStore:dispatch({
            type = "AddUIAlerts",
            uiAlerts = p6
        });

        local function _(p7) -- Line: 35
            -- upvalues: ClientSyncEvents (ref)
            ClientSyncEvents.NewUIAlert:fire(p7[1], p7[2]);
        end;

        for i, v in u1.entries(p6) do
            local _ = i - 1;
            ClientSyncEvents.NewUIAlert:fire(v[1], v[2]);
        end;
    end);
end;

function u2.confirmUIAlert(p8, p9, p10) -- Line: 45
    -- upvalues: ClientStore (copy), default (copy)
    ClientStore:dispatch({
        type = "ConfirmUIAlert",
        uiAlert = p9,
        amount = p10
    });
    default.Client:Get("ConfirmUIAlert"):SendToServer(p9, p10);
end;

KnitClient.CreateController(u2.new());

return nil;