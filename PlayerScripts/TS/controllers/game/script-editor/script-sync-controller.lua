-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Signal = v1.Signal;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "ScriptSyncController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy), Signal (copy)
    KnitController.constructor(p4);
    p4.Name = "ScriptSyncController";
    p4.tokenRequested = false;
    p4.syncTokenGenerated = Signal.new();
end;

function u2.KnitStart(u5) -- Line: 28
    -- upvalues: default (copy), KnitController (copy)
    default.Client:OnEvent("ScriptSyncEnabled", function(p6) -- Line: 30
        -- upvalues: u5 (copy)
        u5.syncToken = p6.syncToken;
        u5.syncTokenGenerated:Fire(p6.syncToken);
    end);
    KnitController.KnitStart(u5);
end;

function u2.sendSyncEnableRequest(p7) -- Line: 36
    -- upvalues: default (copy)
    if not p7.tokenRequested then
        p7.tokenRequested = true;
        default.Client:Get("ScriptSyncEnableRequest"):SendToServer();
    end;
end;

KnitClient.CreateController(u2.new());

return nil;