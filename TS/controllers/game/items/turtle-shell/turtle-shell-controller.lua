-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "TurtleShellController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 19
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 23
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p5);
    p5.Name = "TurtleShellController";
    p5.maid = u2.new();
end;

function u3.KnitStart(p6) -- Line: 28
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p6);
end;

function u3.adjustStats(p7, p8, p9) -- Line: 31
    -- upvalues: KnitClient2 (copy)
    local v10 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = p8
    });
    local v11 = KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
        jumpHeightMultiplier = p9
    });
    p7.maid:GiveTask(v10);
    p7.maid:GiveTask(v11);
end;

function u3.isRelevantItem(p12, p13) -- Line: 41
    -- upvalues: ItemType (copy)
    return p13.itemType == ItemType.TURTLE_SHELL;
end;

function u3.onEnable(p14) -- Line: 44
    p14:adjustStats(0.8, 0.8);
end;

function u3.onDisable(p15) -- Line: 47
    p15.maid:DoCleaning();
end;

KnitClient.CreateController(u3.new());

return nil;