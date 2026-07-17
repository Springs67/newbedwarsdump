-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ScriptLeaderboardContainer = RuntimeLib.import(script, script.Parent, "ui", "script-leaderboard-container").ScriptLeaderboardContainer;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "ScriptLeaderboardController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 24
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "ScriptLeaderboardController";
    p5.leaderboard = {};
    p5.leaderboardGUIMaid = u1.new();
end;

function u3.KnitStart(u6) -- Line: 30
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u6);
    default.Client:OnEvent("CreateScriptLeaderboard", function() -- Line: 32
        -- upvalues: u6 (copy)
        u6:mountLeaderboardGUI();
    end);
    default.Client:OnEvent("UpdateScriptLeaderboard", function(p7) -- Line: 35
        -- upvalues: u6 (copy)
        u6.leaderboard = p7.leaderboard;
        u6:mountLeaderboardGUI();
    end);
end;

function u3.mountLeaderboardGUI(p8) -- Line: 40
    -- upvalues: u2 (copy), ScriptLeaderboardContainer (copy), Players (copy)
    p8.leaderboardGUIMaid:DoCleaning();
    local u9 = u2.mount(u2.createElement(ScriptLeaderboardContainer, {
        leaderboard = p8.leaderboard
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    p8.leaderboardGUIMaid:GiveTask(function() -- Line: 46
        -- upvalues: u2 (ref), u9 (copy)
        u2.unmount(u9);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;