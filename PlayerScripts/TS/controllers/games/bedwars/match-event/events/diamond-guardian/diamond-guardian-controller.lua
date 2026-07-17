-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local DiamondGuardianClient = RuntimeLib.import(script, script.Parent, "diamond-guardian-client").DiamondGuardianClient;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "DiamondGuardianController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "DiamondGuardianController";
end;

function u1.KnitStart(u4) -- Line: 28
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), StatefulEntityTag (copy)
    KnitController.KnitStart(u4);
    WatchCollectionTag(StatefulEntityTag.DIAMOND_GUARDIAN, function(p5) -- Line: 31
        -- upvalues: u4 (copy)
        u4:spawnGuardian(p5);
    end);
end;

function u1.spawnGuardian(p6, p7) -- Line: 35
    -- upvalues: StatefulEntityUtil (copy), DiamondGuardianClient (copy)
    local v8 = StatefulEntityUtil:getGameEntityCFrame(p7);
    local v9 = p7:GetAttribute("EntityUUID");
    DiamondGuardianClient.new(v8, v9, p7);
end;

KnitClient.CreateController(u1.new());

return nil;