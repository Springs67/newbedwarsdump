-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MomentumBarUi = RuntimeLib.import(script, script.Parent, "momentum-bar-ui").MomentumBarUi;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "MomentumBarUiController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 19
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 23
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5);
    p5.Name = "MomentumBarUiController";
    p5.momentumBarUiKey = "MomentumBarUi";
    p5.barMaid = u1.new();
    p5.barMaid = u1.new();
end;

function u3.KnitStart(p6) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p6);
end;

function u3.mountMomentumBarUi(p7) -- Line: 33
    -- upvalues: Flamework (copy), u2 (copy), MomentumBarUi (copy)
    p7.barMaid:DoCleaning();
    p7.barMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u2.createFragment({
        [p7.momentumBarUiKey] = u2.createElement(MomentumBarUi)
    })));
end;

function u3.unmountMomentumBarUi(p8) -- Line: 39
    p8.barMaid:DoCleaning();
end;

KnitClient.CreateController(u3.new());

return nil;