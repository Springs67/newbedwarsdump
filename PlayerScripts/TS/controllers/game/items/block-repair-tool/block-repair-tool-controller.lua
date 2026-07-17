-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local BlockRepair = RuntimeLib.import(script, script.Parent, "block-repair").BlockRepair;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "BlockRepairToolController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: HandKnitController (copy), u1 (copy), BlockRepair (copy)
    HandKnitController.constructor(p4);
    p4.Name = "BlockRepairToolController";
    p4.maid = u1.new();
    p4.blockRepair = BlockRepair.new();
    p4.highlightMaid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p5);
end;

function u2.isRelevantItem(p6, p7) -- Line: 32
    -- upvalues: ItemType (copy)
    return p7.itemType == ItemType.BLOCK_REPAIR_TOOL;
end;

function u2.onEnable(p8, p9, p10) -- Line: 35
    p8.blockRepair:enable();
end;

function u2.onDisable(p11) -- Line: 38
    p11.blockRepair:disable();
end;

KnitClient.CreateController(u2.new());

return nil;