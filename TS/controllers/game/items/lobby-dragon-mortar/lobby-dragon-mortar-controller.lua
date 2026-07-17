-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "LobbyDragonMortarController";
    end,

    __index = HandKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p3);
    p3.Name = "LobbyDragonMortarController";
end;

function u1.KnitStart(p4) -- Line: 24
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p4);
end;

function u1.isRelevantItem(p5, p6) -- Line: 27
    -- upvalues: ItemType (copy)
    return p6.itemType == ItemType.LOBBY_DRAGON_MORTAR;
end;

function u1.onEnable(p7, p8) -- Line: 30
end;

function u1.onDisable(p9) -- Line: 32
end;

KnitClient.CreateController(u1.new());

return nil;