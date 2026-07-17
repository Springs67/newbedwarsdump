-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "SandboxController";
    end,

    __index = GameKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p3, { GameType.SANDBOX });
    p3.Name = "SandboxController";
end;

function u1.KnitStart(p4) -- Line: 24
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p4);
end;

function u1.onGameInit(p5) -- Line: 27
end;

KnitClient.CreateController(u1.new());

return nil;