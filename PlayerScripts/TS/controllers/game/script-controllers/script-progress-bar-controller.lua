-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ScriptProgressContainer = RuntimeLib.import(script, script.Parent, "ui", "script-progress-container").ScriptProgressContainer;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "ScriptProgressBarController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 21
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 25
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p6);
    p6.Name = "ScriptProgressBarController";
    p6.progressBars = {};
    p6.progressGUIMaid = u2.new();
end;

function u4.KnitStart(u7) -- Line: 31
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u7);
    default.Client:OnEvent("UpdateScriptProgressBar", function(p8) -- Line: 33
        -- upvalues: u7 (copy)
        u7.progressBars[p8.id] = p8.progressBar;
        u7:mountProgressGUI();
    end);
    default.Client:OnEvent("RemoveScriptProgressBar", function(p9) -- Line: 40
        -- upvalues: u7 (copy)
        u7.progressBars[p9.id] = nil;
        u7:mountProgressGUI();
    end);
end;

function u4.mountProgressGUI(p10) -- Line: 47
    -- upvalues: u1 (copy), u3 (copy), ScriptProgressContainer (copy), Players (copy)
    p10.progressGUIMaid:DoCleaning();
    local v11 = u1.values(p10.progressBars);
    local u12 = u3.mount(u3.createElement(ScriptProgressContainer, {
        progressBars = v11
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    p10.progressGUIMaid:GiveTask(function() -- Line: 53
        -- upvalues: u3 (ref), u12 (copy)
        u3.unmount(u12);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;