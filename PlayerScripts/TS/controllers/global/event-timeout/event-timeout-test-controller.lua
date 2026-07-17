-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "EventTimeoutTestController";
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
    -- upvalues: KnitController (copy), LoggerProvider (copy)
    KnitController.constructor(p4);
    p4.Name = "EventTimeoutTestController";
    p4.logger = LoggerProvider.getLogger("EventTimeoutTest");
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), u1 (copy)
    KnitController.KnitStart(u5);
    default.Client:OnEvent("EntityDeathEvent", function(p6) -- Line: 29
    end):timeout(10):catch(function(p7) -- Line: 29
        -- upvalues: u5 (copy), u1 (ref)
        u5.logger:Error("Promise rejection {reason}", u1(p7));
    end);
end;

KnitClient.CreateController(u2.new());

return nil;