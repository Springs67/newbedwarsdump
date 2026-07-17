-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneDeathScreen = RuntimeLib.import(script, script.Parent, "ui", "scene-death-screen").SceneDeathScreen;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "SceneDeathScreenController";
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
    p4.Name = "SceneDeathScreenController";
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), u1 (copy), SceneDeathScreen (copy), Players (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("DisplayDeathScreen"):Connect(function(p6) -- Line: 29
        -- upvalues: u1 (ref), SceneDeathScreen (ref), Players (ref), u5 (copy)
        local v7 = {};
        local v8 = {};

        for i, v in p6.deathScreen do
            v7[i] = v;
        end;

        v8.tree = u1.mount(u1.createElement(SceneDeathScreen, v7), Players.LocalPlayer:WaitForChild("PlayerGui"));
        v8.props = p6.deathScreen;
        v8.time = os.time();
        u5.activeDeathScreen = v8;
    end);
end;

function u2.unmountActiveDeathScreen(p9) -- Line: 43
    -- upvalues: u1 (copy)
    local activeDeathScreen = p9.activeDeathScreen;

    if activeDeathScreen ~= nil then
        activeDeathScreen = activeDeathScreen.tree;
    end;

    if activeDeathScreen then
        u1.unmount(activeDeathScreen);
    end;
end;

KnitClient.CreateController(u2.new());

return nil;