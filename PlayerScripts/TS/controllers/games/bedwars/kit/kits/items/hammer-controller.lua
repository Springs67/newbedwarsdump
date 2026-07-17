-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local BlockFortifier = RuntimeLib.import(script, script.Parent, "block-fortifier").BlockFortifier;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "HammerController";
    end,

    __index = HandKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 22
    -- upvalues: HandKnitController (copy), BlockFortifier (copy)
    HandKnitController.constructor(p3, ...);
    p3.Name = "HammerController";
    p3.blockFortifier = BlockFortifier.new();
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p4);
end;

function u1.isRelevantItem(p5, p6) -- Line: 30
    -- upvalues: getItemMeta (copy)
    return getItemMeta(p6.itemType).fortifiesBlock ~= nil;
end;

function u1.onEnable(p7, p8) -- Line: 33
    p7.blockFortifier:disable();
    p7.blockFortifier:enable();
end;

function u1.onDisable(p9) -- Line: 37
    p9.blockFortifier:disable();
end;

return {
    HammerController = KnitClient.CreateController(u1.new())
};