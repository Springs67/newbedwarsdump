-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "QueuePlaylistController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "QueuePlaylistController";
end;

function u1.KnitStart(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p4);
end;

function u1.queueForPlaylist(p5, p6) -- Line: 27
    -- upvalues: default (copy)
    return default.Client:Get("QueueForPlaylist"):CallServerAsync(p6);
end;

KnitClient.CreateController(u1.new());

return nil;